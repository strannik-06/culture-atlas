begin;
alter table public.book_progress add column if not exists read_date date;
alter table public.book_progress add column if not exists reading_source_key text;
-- Reuse the most recent recorded reading; month precision already uses day one.
with latest as (select distinct on(user_id,book_id) user_id,book_id,source_key,read_date from public.book_readings order by user_id,book_id,coalesce(read_year_end,read_year) desc nulls last,read_date desc nulls last,created_at desc,source_key)
update public.book_progress p set read_date=r.read_date,reading_source_key=r.source_key from latest r where p.user_id=r.user_id and p.book_id=r.book_id and p.reading_source_key is null;
create or replace function private.save_book_review(p_metadata jsonb,p_rating numeric,p_format text,p_notes text,p_read_date date)
returns jsonb language plpgsql security definer set search_path='' as $$
declare uid uuid:=auth.uid();result jsonb;bid bigint;p public.book_progress%rowtype;r public.book_readings%rowtype;k text;
begin
 if uid is null or coalesce(auth.jwt()->>'is_anonymous','false')='true' then raise exception 'Sign in to save a review' using errcode='42501';end if;
 if p_metadata is null or jsonb_typeof(p_metadata)<>'object' or octet_length(p_metadata::text)>20000 then raise exception 'Invalid book';end if;
 if p_read_date is not null and extract(year from p_read_date) not between 1 and 3000 then raise exception 'Invalid reading date';end if;
 if p_metadata->>'id' is not null then
 result:=private.update_book_rating((p_metadata->>'id')::bigint,p_rating,p_format,p_notes);
 elsif p_metadata->>'open_library_work_id' is not null then
 result:=private.save_book_rating(p_metadata->>'open_library_work_id',p_metadata->>'title',array(select jsonb_array_elements_text(p_metadata->'authors')),(p_metadata->>'first_publish_year')::integer,(p_metadata->>'cover_id')::bigint,p_rating,p_format,p_notes);
 else result:=private.save_goodreads_book(p_metadata,p_rating,p_format,p_notes);end if;
 bid:=(result->'book'->>'id')::bigint;
 select * into strict p from public.book_progress where user_id=uid and book_id=bid for update;
 k:=p.reading_source_key;
 if k is null then select source_key into k from public.book_readings where user_id=uid and book_id=bid order by coalesce(read_year_end,read_year) desc nulls last,read_date desc nulls last,created_at desc,source_key limit 1;end if;
 if k is null then k:='app:review:'||bid;end if;
 select * into r from public.book_readings where user_id=uid and source_key=k;
 if found then
 update public.book_readings set rating=p_rating,reading_format=p_format,notes=coalesce(p_notes,''),read_date=p_read_date,
 read_date_precision=case when p_read_date is not distinct from r.read_date then r.read_date_precision when p_read_date is null then 'unknown' else 'day' end,
 read_year=case when p_read_date is not distinct from r.read_date then r.read_year else extract(year from p_read_date)::int end,
 read_year_end=case when p_read_date is not distinct from r.read_date then r.read_year_end else null end
 where user_id=uid and source_key=k;
 else
 insert into public.book_readings(user_id,book_id,source_key,rating,reading_format,notes,read_date,read_date_precision,read_year,source_payload)
 values(uid,bid,k,p_rating,p_format,coalesce(p_notes,''),p_read_date,case when p_read_date is null then 'unknown' else 'day' end,extract(year from p_read_date)::int,'{"source":"app-review"}'::jsonb);
 end if;
 update public.book_progress set read_date=p_read_date,reading_source_key=k where user_id=uid and book_id=bid returning * into p;
 return result||jsonb_build_object('progress',to_jsonb(p));
end $$;
revoke all on function private.save_book_review(jsonb,numeric,text,text,date) from public,anon;
grant execute on function private.save_book_review(jsonb,numeric,text,text,date) to authenticated;
create or replace function public.save_book_review(p_metadata jsonb,p_rating numeric,p_format text,p_notes text,p_read_date date)
returns jsonb language sql security invoker set search_path='' as $$select private.save_book_review(p_metadata,p_rating,p_format,p_notes,p_read_date)$$;
revoke all on function public.save_book_review(jsonb,numeric,text,text,date) from public,anon;
grant execute on function public.save_book_review(jsonb,numeric,text,text,date) to authenticated;
notify pgrst,'reload schema';
commit;

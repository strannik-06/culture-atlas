begin;
alter table public.books alter column open_library_work_id drop not null;
alter table public.books add column source_key text unique;
alter table public.books add column work_scope text not null default 'work' check (work_scope in ('work','collection'));
alter table public.books add constraint books_identity check (open_library_work_id is not null or source_key is not null);

create table public.book_readings (
 user_id uuid not null references auth.users(id) on delete cascade,
 source_key text not null check (length(source_key) between 1 and 200),
 book_id bigint not null references public.books(id) on delete cascade,
 rating numeric not null check (rating between .5 and 10 and rating*2=trunc(rating*2)),
 reading_format text not null check (reading_format in ('kindle','audio','unknown')),
 notes text not null default '' check (length(notes)<=10000),
 read_date date,
 read_date_precision text not null check (read_date_precision in ('day','month','year','year_range','unknown')),
 read_year integer check (read_year between 1 and 3000),
 read_year_end integer check (read_year_end between read_year and 3000),
 started_date date,
 source_payload jsonb not null,
 created_at timestamptz not null default now(),
 primary key(user_id,source_key),
 check (case read_date_precision
   when 'day' then read_date is not null and read_year is not null and read_year=extract(year from read_date) and read_year_end is null
   when 'month' then read_date is not null and extract(day from read_date)=1 and read_year is not null and read_year=extract(year from read_date) and read_year_end is null
   when 'year' then read_date is null and read_year is not null and read_year_end is null
   when 'year_range' then read_date is null and read_year is not null and read_year_end is not null
   when 'unknown' then read_date is null and read_year is null and read_year_end is null end),
 check (started_date is null or (read_date is not null and started_date<=read_date))
);
create index book_readings_book on public.book_readings(book_id);
create index book_readings_user_book on public.book_readings(user_id,book_id);
alter table public.book_readings enable row level security;
revoke all on public.book_readings from public,anon,authenticated;
grant select on public.book_readings to authenticated;
grant all on public.book_readings to service_role;
create policy "Users read own book history" on public.book_readings for select to authenticated using ((select auth.uid())=user_id);

create schema if not exists private;
grant usage on schema private to authenticated;

-- Preserve the original search-and-rate API while moving its privileged body out of public.
alter function public.save_book_rating(text,text,text[],integer,bigint,numeric,text,text) set schema private;
revoke all on function private.save_book_rating(text,text,text[],integer,bigint,numeric,text,text) from public,anon;
grant execute on function private.save_book_rating(text,text,text[],integer,bigint,numeric,text,text) to authenticated;
create function public.save_book_rating(p_work_id text,p_title text,p_authors text[],p_year integer,p_cover_id bigint,p_rating numeric,p_format text,p_notes text)
returns jsonb language sql security invoker set search_path='' as $$select private.save_book_rating(p_work_id,p_title,p_authors,p_year,p_cover_id,p_rating,p_format,p_notes)$$;
revoke all on function public.save_book_rating(text,text,text[],integer,bigint,numeric,text,text) from public,anon;
grant execute on function public.save_book_rating(text,text,text[],integer,bigint,numeric,text,text) to authenticated;

-- The public API is an invoker wrapper; privileged writes stay in an unexposed schema.
create function private.import_book_readings(p_payload jsonb,p_apply boolean)
returns jsonb language plpgsql security definer set search_path='' as $$
declare
 uid uuid:=auth.uid(); b jsonb; r jsonb; old_book public.books%rowtype;
 old_reading public.book_readings%rowtype; checked public.book_readings%rowtype;
 ids jsonb:='{}'; bid bigint; latest jsonb; k text; works text[];
 n_books integer:=0; n_readings integer:=0; n_ratings integer:=0; n_preserved integer:=0;
begin
 if uid is null then raise exception 'Sign in to import books.' using errcode='42501'; end if;
 if p_apply is null or p_payload->>'format' is distinct from 'culture-atlas-books-import-prepared-v1'
   or jsonb_typeof(p_payload->'books') is distinct from 'array'
   or jsonb_typeof(p_payload->'readings') is distinct from 'array'
   or octet_length(p_payload::text)>8000000 then raise exception 'Invalid prepared books file.'; end if;
 if jsonb_array_length(p_payload->'books') not between 1 and 1000
   or jsonb_array_length(p_payload->'readings') not between 1 and 3000 then raise exception 'Import is too large or empty.'; end if;
 perform pg_advisory_xact_lock(hashtextextended(uid::text,20261022));
 if exists(select 1 from jsonb_array_elements(p_payload->'books') x group by x->>'work_key' having count(*)>1)
   or exists(select 1 from jsonb_array_elements(p_payload->'readings') x group by x->>'source_key' having count(*)>1)
   or exists(select 1 from jsonb_array_elements(p_payload->'books') x where x->>'open_library_work_id' is not null group by x->>'open_library_work_id' having count(*)>1)
 then raise exception 'Duplicate source or provider identity.'; end if;

 for b in select value from jsonb_array_elements(p_payload->'books') loop
   k:=b->>'work_key';
   works:=array(select jsonb_array_elements_text(b->'authors'));
   if k is null or k !~ '^manual:[a-f0-9]{24}$' or b->>'title' is null
     or length(btrim(b->>'title')) not between 1 and 1000
     or cardinality(works) not between 1 and 20
     or exists(select 1 from unnest(works) a where a is null or length(btrim(a)) not between 1 and 500)
     or b->>'scope' is null or b->>'scope' not in ('work','collection')
     or (b->>'open_library_work_id' is not null and b->>'open_library_work_id' !~ '^/works/OL[0-9]+W$')
     or (b->>'source_publication_year' is not null and (b->>'source_publication_year')::integer not between -5000 and 3000)
     or (b->>'cover_id' is not null and (b->>'cover_id')::bigint<=0)
     or not exists(select 1 from jsonb_array_elements(p_payload->'readings') x where x->>'source_key'=b->>'latest_source_key' and x->>'work_key'=k)
   then raise exception 'Invalid book metadata or latest reading: %',b->>'title'; end if;
   select * into old_book from public.books where source_key=k or open_library_work_id=b->>'open_library_work_id' order by id limit 1;
   if found then
     if exists(select 1 from public.books where (source_key=k or open_library_work_id=b->>'open_library_work_id') and id<>old_book.id)
       or old_book.work_scope is distinct from b->>'scope'
       or (old_book.source_key=k and (old_book.title is distinct from b->>'title' or old_book.authors is distinct from works
          or old_book.work_scope is distinct from b->>'scope' or old_book.open_library_work_id is distinct from b->>'open_library_work_id'))
     then raise exception 'Existing book identity changed: %',b->>'title'; end if;
     bid:=old_book.id;
   else
     n_books:=n_books+1;bid:=null;
     if p_apply then
       insert into public.books(source_key,open_library_work_id,title,authors,first_publish_year,cover_id,work_scope)
       values(k,b->>'open_library_work_id',btrim(b->>'title'),works,(b->>'source_publication_year')::integer,(b->>'cover_id')::bigint,b->>'scope')
       returning id into bid;
     end if;
   end if;
   ids:=ids||jsonb_build_object(k,bid);
 end loop;

 for r in select value from jsonb_array_elements(p_payload->'readings') loop
   if r->>'source_key' is null or length(r->>'source_key') not between 1 and 200
     or r->>'work_key' is null or not (ids ? (r->>'work_key')) then raise exception 'Invalid reading source.'; end if;
   -- Populate a typed row and exercise the actual table constraints even in preview.
   checked:=jsonb_populate_record(null::public.book_readings,r);
   if checked.rating is null or checked.rating not between .5 and 10 or checked.rating*2<>trunc(checked.rating*2)
     or checked.reading_format is null or checked.reading_format not in ('kindle','audio','unknown')
     or checked.notes is null or length(checked.notes)>10000
     or checked.read_date_precision is null or checked.read_date_precision not in ('day','month','year','year_range','unknown')
     or (checked.read_year is not null and checked.read_year not between 1 and 3000)
     or (checked.read_year_end is not null and (checked.read_year is null or checked.read_year_end not between checked.read_year and 3000))
     or not (case checked.read_date_precision
       when 'day' then checked.read_date is not null and checked.read_year is not null and checked.read_year=extract(year from checked.read_date) and checked.read_year_end is null
       when 'month' then checked.read_date is not null and extract(day from checked.read_date)=1 and checked.read_year is not null and checked.read_year=extract(year from checked.read_date) and checked.read_year_end is null
       when 'year' then checked.read_date is null and checked.read_year is not null and checked.read_year_end is null
       when 'year_range' then checked.read_date is null and checked.read_year is not null and checked.read_year_end is not null
       when 'unknown' then checked.read_date is null and checked.read_year is null and checked.read_year_end is null else false end)
     or (checked.started_date is not null and (checked.read_date is null or checked.started_date>checked.read_date))
   then raise exception 'Invalid reading rating, format, notes or date: %',r->>'source_key'; end if;
   bid:=(ids->> (r->>'work_key'))::bigint;
   select * into old_reading from public.book_readings where user_id=uid and source_key=r->>'source_key';
   if found then
     if old_reading.source_payload is distinct from r or old_reading.book_id is distinct from bid then raise exception 'Imported reading changed; resolve conflict: %',r->>'source_key'; end if;
   else
     n_readings:=n_readings+1;
     if p_apply then
       insert into public.book_readings(user_id,source_key,book_id,rating,reading_format,notes,read_date,read_date_precision,read_year,read_year_end,started_date,source_payload)
       values(uid,checked.source_key,bid,checked.rating,checked.reading_format,checked.notes,checked.read_date,checked.read_date_precision,checked.read_year,checked.read_year_end,checked.started_date,r);
     end if;
   end if;
 end loop;
 for b in select value from jsonb_array_elements(p_payload->'books') loop
   bid:=(ids->>(b->>'work_key'))::bigint;
   if exists(select 1 from public.book_progress where user_id=uid and book_id=bid) then n_preserved:=n_preserved+1;
   else
     n_ratings:=n_ratings+1;
     if p_apply then
       select value into strict latest from jsonb_array_elements(p_payload->'readings') where value->>'source_key'=b->>'latest_source_key';
       insert into public.book_progress(user_id,book_id,rating,reading_format,notes)
       values(uid,bid,(latest->>'rating')::numeric,latest->>'reading_format',latest->>'notes') on conflict do nothing;
     end if;
   end if;
 end loop;
 return jsonb_build_object('applied',p_apply,'new_books',n_books,'new_readings',n_readings,'new_ratings',n_ratings,'preserved_ratings',n_preserved);
end $$;
revoke all on function private.import_book_readings(jsonb,boolean) from public,anon;
grant execute on function private.import_book_readings(jsonb,boolean) to authenticated;
create function public.import_book_readings(p_payload jsonb,p_apply boolean default false) returns jsonb
language sql security invoker set search_path='' as $$select private.import_book_readings(p_payload,p_apply)$$;
revoke all on function public.import_book_readings(jsonb,boolean) from public,anon;
grant execute on function public.import_book_readings(jsonb,boolean) to authenticated;

create function private.update_book_rating(p_book_id bigint,p_rating numeric,p_format text,p_notes text)
returns jsonb language plpgsql security definer set search_path='' as $$
declare uid uuid:=auth.uid();b public.books%rowtype;p public.book_progress%rowtype;
begin
 if uid is null then raise exception 'Sign in to save a book.' using errcode='42501';end if;
 if p_rating is null or p_rating not between .5 and 10 or p_rating*2<>trunc(p_rating*2)
   or p_format is null or p_format not in ('kindle','audio','unknown') or length(coalesce(p_notes,''))>10000 then raise exception 'Invalid rating, format or notes.';end if;
 select * into strict b from public.books where id=p_book_id;
 insert into public.book_progress(user_id,book_id,rating,reading_format,notes) values(uid,b.id,p_rating,p_format,coalesce(p_notes,''))
 on conflict(user_id,book_id) do update set rating=excluded.rating,reading_format=excluded.reading_format,notes=excluded.notes,updated_at=now() returning * into p;
 return jsonb_build_object('book',to_jsonb(b),'progress',to_jsonb(p));
end $$;
revoke all on function private.update_book_rating(bigint,numeric,text,text) from public,anon;
grant execute on function private.update_book_rating(bigint,numeric,text,text) to authenticated;
create function public.update_book_rating(p_book_id bigint,p_rating numeric,p_format text,p_notes text) returns jsonb
language sql security invoker set search_path='' as $$select private.update_book_rating(p_book_id,p_rating,p_format,p_notes)$$;
revoke all on function public.update_book_rating(bigint,numeric,text,text) from public,anon;
grant execute on function public.update_book_rating(bigint,numeric,text,text) to authenticated;

create or replace function public.culture_backup_snapshot()
returns jsonb language sql stable security definer set search_path='' as $$
select jsonb_build_object(
 'snapshot_at',statement_timestamp(),
 'film_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.film_progress t),'[]'::jsonb),
 'tv_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.tv_progress t),'[]'::jsonb),
 'book_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.book_progress t),'[]'::jsonb),
 'book_readings',coalesce((select jsonb_agg(to_jsonb(t)) from public.book_readings t),'[]'::jsonb),
 'books',coalesce((select jsonb_agg(to_jsonb(t)) from public.books t),'[]'::jsonb),
 'media_catalogue',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_catalogue t),'[]'::jsonb),
 'media_provider_links',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_provider_links t),'[]'::jsonb));
$$;
revoke all on function public.culture_backup_snapshot() from public,anon,authenticated;
grant execute on function public.culture_backup_snapshot() to service_role;
notify pgrst,'reload schema';
commit;

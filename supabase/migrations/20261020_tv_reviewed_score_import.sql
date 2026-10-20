-- Optional reviewed score changes in the same transaction as an insert-only batch.
-- Installation never changes progress rows. Run after the existing TV migrations.
begin;
create or replace function public.import_tv_ratings_reviewed(p_entries jsonb, p_rating_corrections jsonb)
returns jsonb language plpgsql security invoker set search_path = '' as $$
declare
  v_user uuid := auth.uid();
  item jsonb;
  previous public.tv_progress%rowtype;
  result jsonb;
  corrected jsonb := '[]'::jsonb;
begin
  if v_user is null then raise exception 'Sign in to import TV ratings.' using errcode='42501'; end if;
  if p_rating_corrections is null or jsonb_typeof(p_rating_corrections) <> 'array' then raise exception 'Expected reviewed score corrections.'; end if;
  if jsonb_array_length(p_rating_corrections) > 50 then raise exception 'Too many score corrections.'; end if;
  if (select count(distinct x->>'work_key') from jsonb_array_elements(p_rating_corrections) x) <> jsonb_array_length(p_rating_corrections) then raise exception 'Duplicate correction keys.'; end if;
  -- Lock and validate every reviewed change before inserting anything.
  for item in select x from jsonb_array_elements(p_rating_corrections) x order by x->>'work_key' loop
    if jsonb_typeof(item) <> 'object' or jsonb_typeof(item->'work_key') is distinct from 'string'
      or not public.is_valid_tv_work_key(item->>'work_key')
      or jsonb_typeof(item->'expected_rating') is distinct from 'number'
      or jsonb_typeof(item->'rating') is distinct from 'number'
      or jsonb_typeof(item->'expected_updated_at') is distinct from 'string' then raise exception 'Invalid reviewed score correction.'; end if;
    if (item->>'rating')::numeric not between 0.5 and 10 or (item->>'rating')::numeric*2 <> trunc((item->>'rating')::numeric*2)
      or (item->>'expected_rating')::numeric not between 0.5 and 10 or (item->>'expected_rating')::numeric*2 <> trunc((item->>'expected_rating')::numeric*2)
      or (item->>'expected_rating')::numeric = (item->>'rating')::numeric then raise exception 'Invalid correction score.'; end if;
    select * into previous from public.tv_progress where user_id=v_user and work_key=item->>'work_key' for update;
    if not found or previous.rating <> (item->>'expected_rating')::numeric
      or previous.updated_at <> (item->>'expected_updated_at')::timestamptz then
      raise exception 'A reviewed rating changed. Refresh and review before importing.' using errcode='40001';
    end if;
  end loop;
  result := public.import_tv_ratings(p_entries,false);
  for item in select x from jsonb_array_elements(p_rating_corrections) x loop
    update public.tv_progress set rating=(item->>'rating')::numeric,updated_at=now()
      where user_id=v_user and work_key=item->>'work_key';
    corrected := corrected || jsonb_build_array(item->>'work_key');
  end loop;
  return result || jsonb_build_object('corrected_keys',corrected);
end;
$$;
revoke all on function public.import_tv_ratings_reviewed(jsonb,jsonb) from public,anon;
grant execute on function public.import_tv_ratings_reviewed(jsonb,jsonb) to authenticated;
notify pgrst, 'reload schema';
commit;

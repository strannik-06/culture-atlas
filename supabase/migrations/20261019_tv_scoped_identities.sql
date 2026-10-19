-- Apply after 20261019_tv_ratings.sql. Metadata scope support only; no rating rows are changed.
begin;
create or replace function public.is_valid_tv_work_key(p_key text)
returns boolean language sql immutable security invoker set search_path = '' as $$
  select coalesce(p_key ~ '^tv:([1-9][0-9]*(:season:[1-9][0-9]*)?|movie:[1-9][0-9]*|imdb:tt[0-9]{6,}|local:[a-z0-9]+(-[a-z0-9]+)*)$', false);
$$;
revoke all on function public.is_valid_tv_work_key(text) from public,anon;
grant execute on function public.is_valid_tv_work_key(text) to authenticated;
alter table public.tv_progress drop constraint if exists tv_progress_work_key_check;
alter table public.tv_progress add constraint tv_progress_work_key_check
  check (public.is_valid_tv_work_key(work_key));

create or replace function public.import_tv_ratings(p_entries jsonb, p_replace_dekalog boolean default false)
returns jsonb language plpgsql security invoker set search_path = '' as $$
declare
  v_user uuid := auth.uid();
  v_inserted jsonb;
  v_removed boolean := false;
  item jsonb;
begin
  if v_user is null then raise exception 'Sign in to import TV ratings.' using errcode = '42501'; end if;
  if p_entries is null or jsonb_typeof(p_entries) <> 'array' then raise exception 'Expected a TV rating array.'; end if;
  if jsonb_array_length(p_entries) not between 1 and 500 then raise exception 'Import between 1 and 500 TV ratings at a time.'; end if;
  if (select count(distinct x->>'work_key') from jsonb_array_elements(p_entries) x) <> jsonb_array_length(p_entries) then
    raise exception 'Duplicate or missing TV work keys.';
  end if;
  for item in select * from jsonb_array_elements(p_entries) loop
    if jsonb_typeof(item) <> 'object' or jsonb_typeof(item->'work_key') is distinct from 'string'
       or not public.is_valid_tv_work_key(item->>'work_key')
       or jsonb_typeof(item->'rating') is distinct from 'number'
       or jsonb_typeof(item->'rating_scope') is distinct from 'string'
       or (item->>'rating_scope') not in ('whole_work','unspecified')
       or jsonb_typeof(item->'notes') is distinct from 'string'
       or length(item->>'notes') > 10000 then raise exception 'Invalid TV rating entry.'; end if;
    if (item->>'rating')::numeric not between 0.5 and 10
       or (item->>'rating')::numeric * 2 <> trunc((item->>'rating')::numeric * 2) then
      raise exception 'TV ratings require half-point values from 0.5 to 10.';
    end if;
    if item->>'watched_date' is not null then
      if jsonb_typeof(item->'watched_date') <> 'string'
         or (item->>'watched_date') !~ '^\d{4}-\d{2}-\d{2}$'
         or to_char((item->>'watched_date')::date,'YYYY-MM-DD') <> item->>'watched_date' then
        raise exception 'Invalid watched date.';
      end if;
    end if;
  end loop;
  with inserted as (
    insert into public.tv_progress (user_id,work_key,rating,rating_scope,notes,watched_date)
      select v_user, x.work_key, x.rating, x.rating_scope, x.notes, x.watched_date
      from jsonb_to_recordset(p_entries) as x(work_key text,rating numeric,rating_scope text,notes text,watched_date date)
      on conflict (user_id,work_key) do nothing returning work_key
  ) select coalesce(jsonb_agg(work_key),'[]'::jsonb) into v_inserted from inserted;
  if coalesce(p_replace_dekalog,false) then
    v_removed := public.replace_dekalog_episode_rating();
  end if;
  return jsonb_build_object('inserted_keys',v_inserted,'skipped_existing',jsonb_array_length(p_entries)-jsonb_array_length(v_inserted),
    'dekalog_episode_removed',v_removed);
end;
$$;

revoke all on function public.import_tv_ratings(jsonb,boolean) from public,anon;
grant execute on function public.import_tv_ratings(jsonb,boolean) to authenticated;
notify pgrst, 'reload schema';
commit;

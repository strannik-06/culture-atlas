-- TV ratings v1. Run manually; no existing film data changes during installation.
begin;
create table if not exists public.tv_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  work_key text not null check (work_key ~ '^tv:[1-9][0-9]*$'),
  rating numeric(3,1) not null check (rating between 0.5 and 10 and rating * 2 = trunc(rating * 2)),
  rating_scope text not null default 'unspecified' check (rating_scope in ('whole_work','unspecified')),
  notes text not null default '' check (length(notes) <= 10000),
  watched_date date,
  updated_at timestamptz not null default now(),
  primary key (user_id, work_key),
  -- These four provider TV IDs are aliases of existing canonical films.
  constraint tv_progress_no_film_alias check (work_key not in ('tv:5904','tv:69135','tv:80706','tv:85252'))
);
alter table public.tv_progress enable row level security;
revoke all on public.tv_progress from anon, authenticated;
grant select, insert, update, delete on public.tv_progress to authenticated;
drop policy if exists "Own TV ratings" on public.tv_progress;
create policy "Own TV ratings" on public.tv_progress for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

create or replace function public.save_tv_rating(
  p_work_key text, p_rating numeric, p_scope text, p_notes text,
  p_watched_date date, p_expected_updated_at timestamptz default null
) returns jsonb language plpgsql security invoker set search_path = '' as $$
declare
  v_user uuid := auth.uid();
  v_previous public.tv_progress%rowtype;
  v_saved public.tv_progress%rowtype;
begin
  if v_user is null then raise exception 'Sign in to rate TV.' using errcode = '42501'; end if;
  select * into v_previous from public.tv_progress
    where user_id = v_user and work_key = p_work_key for update;
  if found then
    if p_expected_updated_at is null or v_previous.updated_at <> p_expected_updated_at then
      raise exception 'This rating changed. Reload before saving.' using errcode = '40001';
    end if;
    update public.tv_progress set rating = p_rating, rating_scope = p_scope,
      notes = coalesce(p_notes,''), watched_date = p_watched_date, updated_at = now()
      where user_id = v_user and work_key = p_work_key returning * into v_saved;
  else
    if p_expected_updated_at is not null then
      raise exception 'This rating was removed. Reload before saving.' using errcode = '40001';
    end if;
    insert into public.tv_progress (user_id,work_key,rating,rating_scope,notes,watched_date)
      values (v_user,p_work_key,p_rating,p_scope,coalesce(p_notes,''),p_watched_date)
      returning * into v_saved;
  end if;
  return to_jsonb(v_saved);
end;
$$;

create or replace function public.remove_tv_rating(p_work_key text, p_expected_updated_at timestamptz)
returns boolean language plpgsql security invoker set search_path = '' as $$
declare v_user uuid := auth.uid(); v_previous public.tv_progress%rowtype;
begin
  if v_user is null then raise exception 'Sign in to change TV ratings.' using errcode = '42501'; end if;
  select * into v_previous from public.tv_progress
    where user_id = v_user and work_key = p_work_key for update;
  if not found then return false; end if;
  if p_expected_updated_at is null or v_previous.updated_at <> p_expected_updated_at then
    raise exception 'This rating changed. Reload before removing it.' using errcode = '40001';
  end if;
  delete from public.tv_progress where user_id = v_user and work_key = p_work_key;
  return true;
end;
$$;

-- Explicit owner-approved identity correction only, never a general film migration.
create or replace function public.replace_dekalog_episode_rating()
returns boolean language plpgsql security invoker set search_path = '' as $$
declare v_user uuid := auth.uid(); v_cycle public.tv_progress%rowtype; v_episode public.film_progress%rowtype;
begin
  if v_user is null then raise exception 'Sign in to correct Dekalog.' using errcode = '42501'; end if;
  select * into v_cycle from public.tv_progress
    where user_id = v_user and work_key = 'tv:42699' for update;
  if not found or v_cycle.rating <> 10.0 or v_cycle.rating_scope <> 'whole_work' then
    raise exception 'Verify the whole Dekalog cycle rating of 10.0 before removing the episode assignment.';
  end if;
  select * into v_episode from public.film_progress
    where user_id = v_user and film_id = 1920 for update;
  if not found then return false; end if;
  if v_episode.rating is distinct from 10.0 or v_episode.watched is distinct from true
     or coalesce(v_episode.notes,'') <> '' or v_episode.watched_date is not null then
    raise exception 'The Decalogue V record changed. Review it separately; nothing was imported.';
  end if;
  delete from public.film_progress where user_id = v_user and film_id = 1920;
  return true;
end;
$$;

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
       or (item->>'work_key') !~ '^tv:[1-9][0-9]*$'
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

revoke all on function public.save_tv_rating(text,numeric,text,text,date,timestamptz) from public,anon;
revoke all on function public.remove_tv_rating(text,timestamptz) from public,anon;
revoke all on function public.replace_dekalog_episode_rating() from public,anon;
revoke all on function public.import_tv_ratings(jsonb,boolean) from public,anon;
grant execute on function public.save_tv_rating(text,numeric,text,text,date,timestamptz) to authenticated;
grant execute on function public.remove_tv_rating(text,timestamptz) to authenticated;
grant execute on function public.replace_dekalog_episode_rating() to authenticated;
grant execute on function public.import_tv_ratings(jsonb,boolean) to authenticated;
notify pgrst, 'reload schema';
commit;

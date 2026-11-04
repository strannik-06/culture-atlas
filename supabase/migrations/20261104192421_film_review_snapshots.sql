-- Apply after merge, before deploying film-reviews. Shared public review links only.
begin;
create table if not exists public.film_review_snapshots (
 film_id bigint primary key references public.media_catalogue(film_id),
 items jsonb not null default '[]' check(jsonb_typeof(items)='array'),
 warnings jsonb not null default '[]',
 checked_at timestamptz not null default now()
);
alter table public.film_review_snapshots enable row level security;
revoke all on public.film_review_snapshots from anon,authenticated;
grant select on public.film_review_snapshots to anon,authenticated;
grant all on public.film_review_snapshots to service_role;
drop policy if exists "Public verified film reviews" on public.film_review_snapshots;
create policy "Public verified film reviews" on public.film_review_snapshots for select to anon,authenticated using(true);
create or replace function public.merge_film_reviews(p_film bigint,p_items jsonb,p_warnings jsonb) returns jsonb
language plpgsql security invoker set search_path=public,pg_temp as $$
declare result jsonb;
begin
 if jsonb_typeof(p_items)<>'array' or jsonb_array_length(p_items)>15 then raise exception 'Invalid review items';end if;
 insert into public.film_review_snapshots(film_id,items,warnings) values(p_film,p_items,p_warnings)
 on conflict(film_id) do update set items=(
  select coalesce(jsonb_agg(item),'[]') from (
   select distinct on(item->>'url') item from (
    select coalesce(old.value,'{}'::jsonb)||jsonb_strip_nulls(fresh.value) item,0 priority from jsonb_array_elements(p_items) fresh left join lateral (select value from jsonb_array_elements(film_review_snapshots.items) where value->>'url'=fresh.value->>'url' limit 1) old on true
    union all select value,1 from jsonb_array_elements(film_review_snapshots.items)
   ) combined order by item->>'url',priority
  ) unique_items
 ),warnings=p_warnings,checked_at=now();
 select to_jsonb(s) into result from public.film_review_snapshots s where film_id=p_film;
 return result;
end $$;
revoke all on function public.merge_film_reviews(bigint,jsonb,jsonb) from public,anon,authenticated;
grant execute on function public.merge_film_reviews(bigint,jsonb,jsonb) to service_role;
commit;

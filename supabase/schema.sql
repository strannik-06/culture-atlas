-- Culture Atlas: personal film progress
-- Reference schema for fresh installations. The live database already supports half-point ratings.\n-- Do not infer live schema state from this file; inspect Supabase for migrations.
create table if not exists public.film_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  film_id integer not null check (film_id > 0),
  watched boolean not null default false,
  rating numeric(3,1) constraint film_progress_rating_check\n    check (rating is null or (rating >= 0.5 and rating <= 10 and rating * 2 = trunc(rating * 2))),
  updated_at timestamptz not null default now(),
  primary key (user_id, film_id)
);
alter table public.film_progress enable row level security;
revoke all on public.film_progress from anon;
grant select, insert, update, delete on public.film_progress to authenticated;
drop policy if exists "Users read their own film progress" on public.film_progress;
create policy "Users read their own film progress" on public.film_progress
for select to authenticated using ((select auth.uid()) = user_id);
drop policy if exists "Users insert their own film progress" on public.film_progress;
create policy "Users insert their own film progress" on public.film_progress
for insert to authenticated with check ((select auth.uid()) = user_id);
drop policy if exists "Users update their own film progress" on public.film_progress;
create policy "Users update their own film progress" on public.film_progress
for update to authenticated using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
drop policy if exists "Users delete their own film progress" on public.film_progress;
create policy "Users delete their own film progress" on public.film_progress
for delete to authenticated using ((select auth.uid()) = user_id);

-- Run in Supabase SQL Editor before deploying the frontend.
-- Shared review ratings: readable only by signed-in users, writable only by privileged backend.
create table if not exists public.external_ratings (
  film_id integer not null,
  source text not null check (source in ('tmdb','imdb','letterboxd','ebert','indiewire','lwl','guardian')),
  score_display text not null check (length(score_display) between 1 and 32),
  source_url text not null check (source_url ~ '^https://'),
  verified_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (film_id, source)
);
alter table public.external_ratings enable row level security;
revoke all on table public.external_ratings from anon, authenticated;
grant select on table public.external_ratings to authenticated;
drop policy if exists "Signed-in users can read external ratings" on public.external_ratings;
create policy "Signed-in users can read external ratings"
  on public.external_ratings for select to authenticated using (true);
-- Populate rows through SQL Editor or a trusted server-side ingestion job only.
-- Do not expose a service-role key in client JavaScript or GitHub.

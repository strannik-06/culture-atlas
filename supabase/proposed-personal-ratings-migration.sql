-- PROPOSED migration only. DO NOT execute until account identity and backup are verified.
-- Existing rating smallint cannot represent half-point historical ratings.
begin;
alter table public.film_progress
  alter column rating type numeric(3,1) using rating::numeric(3,1);
alter table public.film_progress
  add column if not exists notes text,
  add column if not exists watched_date date;
-- Keep watched_date NULL for all historical imports.
-- Existing rating CHECK (between 1 and 10) remains; half-points are supported.
commit;

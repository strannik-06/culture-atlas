-- OPTIONAL migration, pending verification of the live database schema.
-- The live rating column already supports fractional values; do NOT alter its type.
-- Execute only after checking whether these columns already exist.
begin;
alter table public.film_progress
  add column if not exists notes text,
  add column if not exists watched_date date;
commit;

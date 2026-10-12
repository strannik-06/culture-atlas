-- Run once in Supabase SQL Editor BEFORE publishing this release.
-- Keep existing rows and change the rating type from integer to numeric.
alter table public.film_progress drop constraint if exists film_progress_rating_check;
alter table public.film_progress alter column rating type numeric(3,1) using rating::numeric(3,1);
alter table public.film_progress add constraint film_progress_rating_check
  check (rating is null or (rating >= 0.5 and rating <= 10 and rating * 2 = trunc(rating * 2)));
-- Existing watched flags are preserved. New rating edits determine watched status.

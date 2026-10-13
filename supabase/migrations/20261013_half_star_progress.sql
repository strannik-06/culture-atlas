-- Preserve half-star personal ratings for curated and awards-only films.
-- Existing film_progress.rating smallint rounds half-star values.
alter table public.film_progress alter column rating type numeric(3,1) using rating::numeric(3,1);
alter table public.film_progress drop constraint if exists film_progress_rating_check;
alter table public.film_progress add constraint film_progress_rating_check check (rating between 0.5 and 10 and rating * 2 = trunc(rating * 2));

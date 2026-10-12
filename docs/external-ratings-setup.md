# External ratings: private database pilot

1. Run `supabase/migrations/20261012_external_ratings.sql` in the Supabase SQL Editor.
2. Insert verified ratings directly in the SQL Editor or via a trusted server-side process. Do **not** put ratings or a service-role key in the public repo.
3. Rows use `film_id` 1–6 for the first six 2025 films, `source` one of `tmdb`, `imdb`, `letterboxd`, `ebert`, `indiewire`, `lwl`, `guardian`, `score_display` in the publisher's native format (TMDB e.g. `76%`, IMDb `7.6/10`, Letterboxd `4.1/5`, Ebert `3.5/4`, IndieWire `B+`, Guardian `4/5`, LWL `4 / 5 / 5`) and the direct `source_url`.
4. Only authenticated clients can read. They cannot write. Signed-out clients receive no critic data.
5. Check the source terms and licensing before importing or displaying publisher ratings.

The frontend intentionally displays only verified database rows, not hard-coded fallback scores. **This migration does not seed any ratings.** The production Supabase project must be configured separately.

Security: RLS prevents anonymous API reads, but this is not DRM or a substitute for content licenses. The previous public pilot file may still exist in git history even after removal.

# Historical ratings: staged import

This is a **read-only** preview, not a live import. Run Actions → **Preview historical ratings import** after merging this PR. It downloads the latest successful v2 matching report and emits `personal-ratings-staging-preview.json` as an Actions artifact.

The preview maps TMDB identities to existing `film-catalog.js` IDs, marks genuinely new catalogue records, quarantines uncertain matches and all duplicate TMDB groups, and preserves exact half-point ratings and notes. All historical watched dates stay null.

## Hard blockers before a real write

1. The live `film_progress.rating` schema is `smallint`; it must be migrated to `numeric(3,1)` first. The draft migration is `supabase/proposed-personal-ratings-migration.sql`, **not automatically executed**.
2. Confirm the Google OAuth login uses the correct existing Supabase user ID. Existing `film_progress` rows are keyed by `user_id` and `film_id`.
3. Export/backup the signed-in user's existing Supabase `film_progress` records. This preview cannot detect database rating conflicts because it deliberately has no database credentials.
4. Review the duplicate TMDB groups: some have **different ratings** and must not be arbitrarily collapsed.
5. Review the current-year and future-release rows separately. Metadata and director agreement do not prove a film was watched.
6. Review catalogue identity differences and assign stable new catalogue IDs before preparing SQL. Do not renumber existing IDs.
7. The website currently reads ratings from Supabase; a future implementation must load the expanded catalogue and display half-point ratings, notes and optional watched dates.

No Supabase service role secret is needed or requested for this stage. Do not grant a public GitHub workflow permission to write personal ratings without an explicit review of its SQL and account target.

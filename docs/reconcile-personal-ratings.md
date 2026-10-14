# Reconcile historical ratings with existing Supabase progress

This step is deliberately **offline and read-only**. It does not require or accept database credentials. The three user-confirmed IMDb identifiers are applied to the three TMDB records with missing IMDb metadata:

| TMDB | Film | IMDb |
| --- | --- | --- |
| 895256 | Cardiogram of Love | tt4516948 |
| 695633 | Infant | tt3065590 |
| 558068 | Two Kilometers from the New Year | tt3449464 |

## Export your existing ratings

In Supabase Dashboard → **Table Editor** → `public.film_progress`, filter `user_id` to the account currently used by Culture Atlas and export the **filtered** rows as CSV. Keep `film_id`, `watched`, `rating`, and (if present) `notes`, `watched_date`. You can omit `user_id` entirely. Ensure the export includes **all** your existing rows; some Table Editor exports only include the current page. Never upload database credentials, JWTs, API keys or service-role keys.

The live `rating` column is already `numeric(3,1)`. No rating-type migration is required. `notes` and `watched_date` are not yet present in the live database.

## Run locally

Download the `canonical-catalogue-import-preview` workflow artifact and unzip it. Run from the repository root:

```bash
node scripts/reconcile-personal-ratings.mjs /path/to/canonical-catalogue-preview.json /path/to/film-progress-export.csv
```

The output `personal-ratings-conflict-report.json` separates existing progress that agrees, insert candidates, and manual conflicts; `reconciled-catalogue-additions.json` contains new catalogue proposals including the three confirmed IMDb identifiers.

The script **does not write to Supabase or modify `film-catalog.js`**. Treat the proposed catalogue IDs as provisional and rerun if new films are added to the main catalogue. The remaining 924 historical entries still require separate identity review.

**Privacy:** do not commit progress exports or conflict reports to the public repository. Share the CSV privately in ChatGPT for an assisted comparison, or run the script locally.

# Canonical catalogue import preview

Run Actions → **Preview canonical film catalogue additions** after merging this PR. The workflow downloads the latest successful staging artifact, fetches each TMDB movie's `en-US` details and director credits, and produces:

- `proposed-film-catalogue-additions.json`: proposed new canonical film records, with stable *provisional* IDs starting above the current maximum ID. Original Russian-language titles are preserved as `original_title` when appropriate; display titles use TMDB's English locale.
- `canonical-catalogue-preview.json`: original source rows and personal ratings/notes, existing-catalogue identity links, rejected identity candidates and summary.

**This workflow is read-only.** It does not modify `film-catalog.js`, Supabase or personal ratings. No real catalogue IDs are reserved until the additions are reviewed and committed. If main gains new catalogue entries, rerun to recalculate provisional IDs.

### Critical remaining work

1. The 78 existing-catalogue candidates quarantined by the earlier matcher still need an independent reconciliation pass; this workflow reports only the high-confidence staged subset.
2. The live Supabase `film_progress` table cannot be inspected by a public GitHub workflow without an authenticated owner export. A real database conflict report needs an export of the owner's rows with `film_id,watched,rating` (no credentials).
3. Reconcile conflicting existing ratings without overwriting them automatically.
4. Confirm all proposed canonical identities and IMDb IDs before committing to `film-catalog.js`. Do not renumber existing IDs.
5. Import only after the owner's approval, with `notes` and `watched_date` schema verified.
6. Source years are not necessarily ground truth. Director agreement is checked again against live TMDB details, but this does not independently prove that the source film and TMDB film are identical.

TMDB's `en-US` movie details response provides translated `title`, `original_title`, credits and external IDs. We use it instead of localized search result titles.

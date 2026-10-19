# Film and television catalogue architecture

## Decisions
- Films, television series, and miniseries share one canonical work identity space and a single person/director index.
- `work_type` is `movie` or `tv` (canonical browsing/storage type); `series_kind` is `series`, `miniseries`, or `unknown` for TV. Miniseries are not movies.
- Films and TV Series are separate top-level browsing sections. Miniseries appear under TV Series, with their own filter.
- Collections (festival lineups, film awards, TV awards, recommendations) reference canonical IDs regardless of type. Festival membership never changes the work type.
- Directors' pages query both types; users can filter film versus TV credits. Multiple directors/creators are supported.
- Keep existing film catalogue IDs and the 2,000 existing progress rows unchanged. Do not repurpose film IDs for TV works.
- Preserve existing `film_progress` until a reviewed migration strategy is approved. Do not run migrations or bulk-import TV ratings in this phase.
- Distinguish TV show-level ratings from episode/season ratings. The final historical extension uses explicit season/installment keys without changing existing show keys.
- TMDB provider media type stays explicit. Reviewed TV installments may link movie-provider records using `tv:movie:<id>` keys; never treat that numeric movie ID as a TMDB TV ID. Manual identities require documented evidence and no fabricated provider ID.

## Incremental implementation
1. Introduce a TV catalogue (`tv-catalog.js`) and cross-media identity helpers without changing existing film pages.
2. Add top-level TV Series browsing, filters, and ratings, using canonical work keys that avoid collisions between TMDB movie and TV IDs.
3. Add unified person/director credits and allow festival/award collections to reference either work type.
4. Implement authenticated TV progress storage and guarded import, after confirming schema and preserving all film progress.
5. Reconcile the existing historical TV/series entries and later import the user's larger TV rating spreadsheet.

## Import invariants
- Never overwrite an existing rating without explicit review.
- Preserve half-points, notes, and unknown viewing dates.
- Every source row gets an audit outcome (linked, excluded, duplicate, or unresolved).
- No Supabase writes from catalogue/metadata PRs.

## Catalogue phase implemented

`tv-catalog.js` introduces reviewed TV identities; `work-identities.js` provides a shared registry with explicit keys. Movie keys use `movie:<existing internal film ID>` while TV keys/IDs use `tv:<TMDB TV ID>`. This separates the namespaces without allocating film integers to TV or changing existing progress IDs. Creators and directors are separate role-bearing arrays using TMDB person IDs.

The registry rejects duplicate work/external identities and cross-media IMDb overlaps. Four reviewed TV external aliases now resolve to existing canonical movie keys without adding another work. TV keys never enter film_progress.

## TV ratings phase

The TV Series section consumes the catalogue and reviewed aliases. A manually installed migration adds private `tv_progress` storage, optimistic interactive edits, and an atomic insert-only import. The whole-cycle Dekalog correction verifies its TV rating before removing the mistaken episode assignment. Catalogue installation does not execute a migration or import. Film progress and Books storage remain separate. See [TV ratings setup and import](tv-ratings.md) for the review boundary, tests and remaining version cases.

See [the TV/version identity audit](tv-version-identity-audit.md) for the batch, decisions and remaining scope questions.

## Final historical scopes

The final batch preserves two Spellbinder seasons and three Sherlock installments as distinct rating targets. A separately verified IMDb-based sequel and an owner-confirmed opening sequence use explicit manual keys. The new migration broadens the TV key validator without changing any existing rows. See [the complete final audit](remaining-version-audit.md).

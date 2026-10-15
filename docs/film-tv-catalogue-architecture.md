# Film and television catalogue architecture

## Decisions
- Films, television series, and miniseries share one canonical work identity space and a single person/director index.
- `work_type` is `movie` or `tv` (TMDB media types); `series_kind` is `series`, `miniseries`, or `unknown` for TV. Miniseries are not movies.
- Films and TV Series are separate top-level browsing sections. Miniseries appear under TV Series, with their own filter.
- Collections (festival lineups, film awards, TV awards, recommendations) reference canonical IDs regardless of type. Festival membership never changes the work type.
- Directors' pages query both types; users can filter film versus TV credits. Multiple directors/creators are supported.
- Keep existing film catalogue IDs and the 2,000 existing progress rows unchanged. Do not repurpose film IDs for TV works.
- Preserve existing `film_progress` until a reviewed migration strategy is approved. Do not run migrations or bulk-import TV ratings in this phase.
- Distinguish TV show-level ratings from episode/season ratings; initial support is show-level only.
- Historical TV and miniseries source entries remain in review until their TMDB TV identities are verified; do not use movie IDs as TV identities.

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

# Catalogue rendering performance

The November 2026 pass optimizes shared list behavior across books, films and TV.

- Book awards use indexes for canonical IDs, Open Library aliases, source keys and Goodreads IDs; recognitions are built once. Tests compare every indexed match and recognition with the former linear matching rules.
- The saved-book and merged public book catalogue indexes rebuild only when the books array changes. Rendering a card no longer scans every saved book.
- Book, film and TV card grids retain their nodes when generated content is unchanged. This preserves bookmark buttons and avoids unnecessary DOM parsing, image reloads and observer work. Content changes still rebuild the affected grid.
- The shared bookmark observer inspects added/changed card subtrees instead of rescanning the document on every mutation. Unchanged bookmark icons retain their SVG nodes.
- List mutations redraw only the matching active watch/read list. Full account resets still clear all private views.
- Hidden film and book award browsers are not rendered on unrelated list updates.

## Measurements

Local Happy DOM simulation with 853 public award books loaded through a paginated fake catalogue client. Identical searches and fixture before/after the lookup and DOM changes:

| Search | Before | After |
| --- | ---: | ---: |
| the | 419 ms | 20 ms |
| franzen | 374 ms | 11 ms |

These are synchronous scripting/DOM timings, not production browser paint or network measurements. They exclude image downloads. No production progress data was used or changed.

## Remaining opportunities

The initial bundle still includes about 929 KB of book award scripts before compression, and the initial book session waits for catalogue, ratings and reading history together. A later pass can split award bundles by section/year and load reading history when details are opened, with account-generation guards and explicit loading/error states. The current pass leaves that data-loading behavior unchanged.

## Deferred reading history

Book catalogue and current ratings now load without requesting reading history. Opening a saved book requests only that book's history, caches the result until session refresh, and updates the history area without replacing an edit draft. Errors offer a retry. Account-generation and selected-detail checks discard late responses. This changes no stored readings or ratings.

The cold-start inventory is approximately 10.31 MB of local JavaScript before compression, or 2.31 MB if gzipped. The two book award datasets account for 120,622 gzipped bytes; film-details.js accounts for 1,666,827. These are local gzip estimates, not measured hosting transfer sizes. All are currently loaded synchronously regardless of section.

The next bundle optimization should prioritize splitting film detail payloads from the lightweight card metadata and loading detail data when opening a film, across all sections. Book award lazy loading also needs a small eagerly loaded identity/recognition index so existing ratings and bookmarked award URLs keep their canonical IDs.

`node scripts/benchmark-book-startup.mjs` compares fresh Chromium contexts against the pre-change books module, with an explicitly simulated 600 ms reading-history delay and isolated fake account. It reports cold readiness and history request counts. It makes no production database requests; timing is diagnostic, not an estimate of a user's real connection.

In the initial CI Chromium run, the simulated baseline became ready at 994 ms versus 371 ms with deferred history. History requests during startup fell from one to zero. This comparison deliberately injects a 600 ms history delay and uses a localhost server with uncompressed scripts; it is not a production speed estimate.

## Deferred film details

`film-details.js` remains the complete, unchanged metadata source for preparation scripts, audits and backups. The website loads generated `film-cards.js` instead: posters and credits, release dates, recognition text, and the first three cast names. Full public metadata is stored losslessly in 53 content-hashed JSON chunks (100 film IDs per group), requested only when opening details. A chunk request is shared/cached, with failure/retry UI. Dynamic database films continue using their existing metadata.

Initial film metadata changes from 5,616,454 raw bytes (1,666,827 local gzip bytes) to 899,130 card bytes plus a small loader (about 294 KB combined gzip). This removes roughly 4.72 MB raw / 1.37 MB gzip from every initial section load. These compression figures are estimates; the Chromium diagnostic reports actual localhost resource sizes and readiness separately.

Late responses update only public metadata and score regions. Rating/note drafts and review controls remain mounted; closing, switching films, or switching accounts prevents stale responses from changing the current view. Full record reconstruction and loading/cache/retry behavior are tested.

After changing `film-details.js`, run `node scripts/build-film-detail-assets.mjs`. Preparation workflows regenerate and commit the assets automatically, and CI uses `--check` to reject stale generated files. Run `node scripts/benchmark-film-startup.mjs` after installing Playwright/Chromium for an isolated before/after startup comparison and cache/deep-link smoke tests. No database migration is involved.

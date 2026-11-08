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

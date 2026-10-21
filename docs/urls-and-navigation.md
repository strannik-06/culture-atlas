# URLs and navigation

Culture Atlas uses one client-side router in `routes.js`. The URL is the source
of truth for the active section, subsection, selected work and public list state.
The existing film, TV, book and discovery modules provide small route adapters;
they retain ownership of rendering, data loading, rating drafts and saving.

## Hosting decision

Use `#/…` routes on the existing GitHub Pages project path. Every shared URL
requests the real `index.html`; fragments are resolved in the browser. Refresh,
bookmarks and opening a link in a new tab therefore work without server rewrites,
a custom 404 redirect or a hosting migration. This does not require a framework.
Hash URLs do not provide individual server-rendered social preview metadata.

## Route vocabulary

| URL fragment | Screen |
| --- | --- |
| `#/films/top100` | Curated film lists |
| `#/films/awards` | Awards and festivals |
| `#/films/ratings` | My film ratings |
| `#/films/catalogue` | Film catalogue |
| `#/films/search?q=Nolan` | Find and rate films |
| `#/films/229` | Film details dialog |
| `#/tv/catalogue` | Series catalogue |
| `#/tv/ratings` | My TV ratings |
| `#/tv/search?q=Severance` | Find and rate series |
| `#/tv/1399` | Series details and rating editor |
| `#/tv/1399/season/2` | Separate season editor |
| `#/tv/movie/126850` | TV installment identified by a TMDB movie ID |
| `#/tv/imdb/tt4324832` | IMDb-backed TV work |
| `#/tv/local/good-night-little-ones-tatarskiy-opening` | Reviewed local TV identity |
| `#/books/ratings` | My book ratings |
| `#/books/catalogue` | Book catalogue |
| `#/books/search?q=John+of+John&author=Douglas+Stuart` | External book search |
| `#/books/OL42W` | Book selection and rating editor |

Film numbers are **Culture Atlas catalogue IDs**, not TMDB IDs. TV routes preserve
our typed work keys, including season zero and historical exceptions. Book URLs
use Open Library work IDs. Titles are presentation text, never identity keys, so
correcting a title cannot break a saved link.

## Public state and history

- `q`, `sort`, `page`, film year/genre/priority/watch-status, TV kind, and awards
  event/year/category/result are allowlisted per screen. Search accepts author
  or director and director-year filters where applicable.
- Defaults are omitted and parameters sorted for consistent URLs. Invalid route
  shapes produce a helpful message; unknown works remain addressable while
  asynchronous catalogue data loads.
- An item's optional `from` parameter records its parent list, with that list's
  filters and page. It is navigation context, not part of work identity.
- Page navigation and opening a work push history entries. Filter edits replace
  the current entry, so Back does not step through every typed character.
- Back/Forward restores screens and dialogs. Closing an item opened from a list
  goes Back; closing a freshly shared deep link replaces it with its parent list,
  without sending the reader off-site. Scroll positions are held in history state.
- Film, TV and book titles are real anchors, supporting copying links and opening
  details in another tab. Existing keyboard card activation remains available.
- Opening a URL never writes catalogue records or ratings. Public metadata can
  load signed out; private progress still comes exclusively from the current
  account. Unsaved books can resolve their public work/author metadata from Open
  Library, without silently adding them to our catalogue.
- Ratings, notes, watched dates, reading format, authentication tokens and unsaved
  editor drafts are **not URL parameters**. Refresh restores navigation, not an
  unsaved draft. Shared links show the recipient's own progress after sign-in.
- Supabase's authentication fragment is left untouched until its SDK consumes it.
  A public return route is stored in session storage before sign-in and restored
  after the callback.

## Verification

`node --test tests/routes.test.mjs` exercises full-page navigation, fresh deep-link
boots, filter/page restoration, history traversal, modal closing, all existing TV
identity shapes, delayed catalogue loading, unsaved book resolution, authentication
callbacks and private-state exclusion. CI runs it with the media validation suite.
These are DOM integration tests; they do not replace a real-browser smoke check.

Manual review: open a film from catalogue page 3, copy the URL into a new tab,
refresh, close it, then try Back and Forward. Repeat for a season, a book, an
awards filter and an authenticated external search. Opening links must not save a
rating. No SQL or Supabase deployment is required for this change.

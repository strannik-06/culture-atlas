# Book awards: 2026

Books now has an Awards tab using the same award navigation, edition URLs, year
links, category layout and aligned cards as Films. The shared navigator accepts
media-specific configuration; film/festival grouping retains its existing data.

## Verified coverage as of 23 October 2026

| Award | Books | Categories / view | Status |
| --- | ---: | --- | --- |
| Booker Prize | 6 | Shortlist | Winner due 9 November |
| International Booker | 6 | Shortlist, winner first | Taiwan Travelogue won 19 May |
| Pulitzer Prize | 19 | Fiction, History, Biography, Memoir or Autobiography, Poetry, General Nonfiction | Winners and all named finalists |
| Nobel Literature | 5 | Anne Carson profile and selected works | Author is the laureate; books are a curated introduction |
| National Book Awards | 25 | All five categories, five finalists each | Winners due 18 November |
| Prix Goncourt | 8 | Current second selection | Final four due 27 October; winner due 3 November |

No winners are invented for pending prizes. Translator credits accompany the
International Booker shortlist and National Book Award for Translated Literature.
Pulitzer Memoir has one winner and three finalists, all included. Drama, music,
journalism and honorary National Book Awards are outside the book catalogue scope.
Only 2026 is loaded; unavailable years show an honest empty state. The year
navigator automatically exposes additional years when data is added.

## Catalogue and ratings

There are 69 reviewed book identities. Nine reuse public catalogue records;
60 are new entries. The audit used public book metadata only, without reading or
changing private ratings or notes. Provider-less books use stable reviewed source
keys; no Open Library IDs are fabricated. Four sets of duplicate Open Library
work records are recorded as aliases for one curated book each.

Cards and detail URLs resolve to the existing book before rendering or saving.
The shared Books rating form, format and notes controls remain the write path;
ratings are attached to the same database book ID across awards, catalogue and
My ratings. Private notes appear in details, never in award cards or URLs.
Changing accounts clears private progress. Older Open Library and local book
links continue to resolve. New award work links are public and refreshable.

All books have reviewed cover sources. Existing catalogue metadata is preserved;
curated covers/recognitions are layered into the UI. Public book detail pages link
to source information when a provider synopsis is unavailable. Long subtitles
remain in details while award cards show the main title.

## Deployment

After merge, apply `imports/book-awards-2026-catalogue-sync.sql`. It registers the
60 missing entries in the existing public `books` catalogue. No schema or auth
changes are required. The batch is insert-only and idempotent; reviewed existing
IDs are checked, metadata is preserved, and multiple provider matches or a changed
identity abort the transaction. It never writes `book_progress`, `book_readings`,
notes, user records or any film/TV data. New entries without a provider ID become
rateable through the existing update API once registered and the page is refreshed.

Regenerate data, audit and SQL with `node scripts/prepare-book-awards.mjs`.
The reviewed source is `imports/book-awards-2026-source.json`; the browser loads
`book-awards-2026.js`. Book awards navigation has its own IDs and routes, sharing
rendering logic and CSS with film awards.

## Sources

- [Booker shortlist and announcement date](https://thebookerprizes.com/the-booker-library/prize-years/2026).
- [International Booker shortlist, winner and translators](https://thebookerprizes.com/the-booker-library/prize-years/international/2026).
- [Pulitzer winners and finalists](https://www.pulitzer.org/prize-winners-by-year/2026).
- [Nobel laureate](https://www.nobelprize.org/prizes/literature/2026/summary/), [biobibliography](https://www.nobelprize.org/prizes/literature/2026/bio-bibliography/) and [reading introduction](https://www.nobelprize.org/what-to-read-anne-carson/).
- [National Book Awards](https://www.nationalbook.org/awards-prizes/national-book-awards-2026/), including each category and linked book profiles.
- [Goncourt official calendar](https://www.academiegoncourt.com/home); current eight-book selection cross-checked in [ActuaLitté](https://actualitte.com/article/134433/prix-litteraires/prix-goncourt-2026-plus-que-huit-romans-en-competition) and [Livres Hebdo](https://www.livreshebdo.fr/article/la-deuxieme-selection-du-prix-goncourt-2026). The official site’s text archive currently lags its 2026 schedule, so the selection report is labelled as such in the UI.

## Validation and previews

Dedicated tests cover complete selected scope, pending results, author-level Nobel
semantics, aliases, rating reuse, note preservation, history/refresh navigation,
SQL idempotency and identity conflict rejection. The existing film, book, TV,
media and route suites remain regression checks. A signed-out Chromium workflow
checks every award, shared details, reload, desktop row/rating alignment, mobile
overflow and image loading without connecting to the production database.

- [Desktop](previews/book-awards-2026-desktop.png)
- [Nobel](previews/book-awards-2026-nobel.png)
- [Mobile](previews/book-awards-2026-mobile.png)

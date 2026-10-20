# Books: search, rate and save

## Enable on the live site

1. In the existing Supabase project's SQL Editor, run
   `supabase/migrations/20261019_books_search_ratings.sql` once. It is transactional
   and can be rerun. It creates only Books objects; film data is untouched.
2. Merge this PR into `main` and allow GitHub Pages to publish.
3. Open Books → Add book, search a title with its author, select the correct
   result, choose a rating and Kindle/Audio (or Not specified), add optional
   notes, and save. Sign in through the existing Account menu first.
   The star picker matches Films: click a star's left/right half for half/whole
   points, or use arrow keys in 0.5 steps and Enter to choose. Clear rating
   clears the draft; Save book & rating still requires a chosen score.
4. The book appears in Catalogue and My ratings. Open Edit rating to change
   the score, format or notes. Refresh or use another signed-in device to verify sync.

This change does not apply the SQL migration automatically. A missing migration
produces a clear setup message; failed saves keep the form and never claim success.

## Design

- Open Library Search API, on explicit submit, with an optional Author field.
  Search `title_suggest` as a quoted phrase first: this avoids the stemming and
  author-name popularity that bury recent novels in general `q` results.
  Request up to 50 candidates and show up to 20 relevant results. Rank literal
  exact titles first, then article-insensitive titles, subtitles, and title/author
  token matches. Repeated words count separately; `Disappearers` does not match
  `Disappearing`. Prefer a cover when equally ranked duplicate work records exist,
  but never automatically merge works or choose a rating target.
- If no relevant candidates remain, retry title variants without an initial
  article/common connecting words, then general title/author search. At most four
  queries, paced to one request per second, with cancellation, timeout and an
  in-memory cache keyed by both query and author. HTTP errors do not trigger
  broader searches. ISBNs use the ISBN filter directly. Author filtering is also
  checked against returned authors. No external API key or new SQL is needed.
- Live API regressions verified: `John of John` by Douglas Stuart
  (`/works/OL45691929W`, cover 15234094); `The Disappearers` by Marlon James
  (`/works/OL45862992W`, cover 15243723); article retry for
  `The nights are quiet in Tehran` (`/works/OL42426263W`).
- Each work has our own `books.id` and a unique Open Library work ID. Exact work
  IDs are reused; duplicate works in Open Library still require later review.
- `book_progress` stores each account's half-point 0.5–10 score, reading format,
  notes and update time. Notes/format/ratings are readable only by their owner.
- `save_book_rating` authenticates the caller and inserts the work and their
  reading record atomically. If any part fails, neither write is committed.
  An existing work's catalogue metadata is preserved when another account rates it.
- Public clients can read catalogue metadata, but cannot write either table
  directly. Authenticated callers can execute only the validated save function.
- No private reading data is written to browser storage. Existing film progress
  behavior is unchanged. A sign-out/account switch clears Books private state.
- Catalogue entries are created only after a confirmed successful save, never
  from searching/selecting alone. Repeated saves update the same personal record.
- First publication year and cover come from the selected API work; they are
  candidates, not guaranteed original-edition metadata. Search supports Cyrillic,
  but some books require transliteration or have no Open Library record.
- This first flow does not import the screenshot, attach awards automatically,
  fetch community scores, or model individual editions/rereads. Those can build
  on these tables later without blocking newly read books now.

## Verification

`npm ci && npm test` checks frontend interactions with a DOM implementation,
and runs the actual migration in PGlite/Postgres to verify atomic saves, work
reuse, validation and account isolation. These tests do not write to production.
`node scripts/validate-catalog.mjs` checks the existing film catalogue.

Visual browser QA and a live authenticated save must be verified after deployment;
the development session has no database-admin credential or installed test browser.

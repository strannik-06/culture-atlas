# Books reading-history import

Apply `supabase/migrations/20261022093314_books_reading_history_import.sql` before deploying this UI. It adds local catalogue identities, collection scope, private reading history and the preview/apply RPC. Optional Goodreads identifiers, cover URLs and dated public-rating snapshots support books absent from Open Library. It also extends the service-only backup snapshot with reading history. Existing Open Library links and `save_book_rating` calls remain supported.

After deployment, sign in, open **Books → Import reading history**, and choose `books-import.json` extracted from the private prepared package. The preview validates the complete file on the server and shows new books, current ratings, readings and existing ratings being preserved. Review it, then choose **Import these books & readings**. The import is one transaction; invalid dates, duplicate identities or changed imported readings abort the entire request.

The prepared data stays outside this public repository. No service key or account ID is needed in the file. The server always uses the signed-in user. Import preview does not write data. Row-level security restricts history and notes to their owner; catalogue titles and covers remain shared.

## Data rules

- `books[].work_key` is the stable source identity (`manual:` followed by 24 lowercase hex characters). An Open Library work ID is optional. Unmatched works and multi-volume collections retain source metadata and get shareable `#/books/local-<id>` links. Matching candidates require independent review before enriching a source-only book.
- `readings[].source_key` is unique per user. Re-uploading an identical reading is a no-op. A changed reading with the same key raises a conflict rather than rewriting history.
- `books[].latest_source_key` selects the initial current rating. Existing app ratings, notes and formats are preserved, even when historical readings are added. Editing a current rating afterward does not rewrite imported history.
- Scores stay on a ten-point scale in half-point increments. Monthly dates use day 1 but are displayed as month/year; year-only and year-range dates remain approximate. Unknown dates remain unknown. Publication years remain separate.
- Provider IDs and source keys must be unique within the upload. Existing provider identities are reused; missing Goodreads metadata may be filled, while existing shared titles, authors and rating snapshots are preserved. Conflicting source/provider bindings or collection scopes are rejected.
- The server accepts at most 1,000 books, 3,000 readings and 8 MB per prepared upload. The public RPC is an invoker wrapper around an authenticated private helper; clients have no direct write grants.

## Backup and recovery

`culture_backup_snapshot()` now includes `book_readings`. Backup manifests count and verify that table when present, and insert-only recovery restores it after books and progress. Older six-table snapshots remain readable. Use the existing backup workflow before the first live import. Live deployment and import are separate steps from opening this PR.

## Verification

Run `npm ci && npm test`, `node --test tests/routes.test.mjs`, and `python -m unittest discover -s tests -p test_backup.py`. Tests cover preview without writes, transaction rollback, rereads, repeat imports, existing-rating preservation, provider reuse, source-only rating editing, history privacy, account changes, local URLs and backup compatibility. The real private prepared dataset is also exercised locally against an isolated Postgres instance; never add it as a public test fixture.

## Goodreads fallback

Every book card links to Goodreads: a saved book ID opens its exact page, while an unlinked book offers **Find on Goodreads**, a title/author search rather than a claimed match. A saved public rating is labelled **Goodreads: x.xx / 5**, with its count, observation date and provenance (including search-index snapshots). Your rating remains separate on the original /10 scale. Missing public ratings stay empty. Snapshot dates record collection, not a promise that the underlying index was current then. The saved `goodreads_source_url` retains the original evidence page.

Goodreads no longer provides new public API keys ([developer notice](https://www.goodreads.com/group/show/8095-goodreads-developers)). There is no live Goodreads scraper, unofficial API or automatic refresh. If Open Library search misses a book, open **Add book → Can't find it? Add a book from Goodreads**, paste its Goodreads link, title and author, optionally add its year and Goodreads cover image URL, then select your personal stars, format and notes and save. This authenticated transaction reuses an existing Goodreads ID and leaves existing shared metadata intact. A missing Goodreads association on an existing Open Library book must be resolved before using the fallback to avoid creating a duplicate.

Prepared imports may include `goodreads_id`, `goodreads_rating`, `goodreads_ratings_count`, `goodreads_observed_on`, `goodreads_rating_source` (`manual` or `search_index`), `goodreads_source_url`, and `cover_url`. Public ratings require an identifier, positive count, date and evidence URL; Goodreads IDs must be numeric. Only HTTPS Goodreads image hosts are allowed for fallback covers. Open Library covers take precedence. Goodreads and Open Library IDs must each be unique within an import; conflicting bindings stop the import. The backup's books rows automatically include these fields.

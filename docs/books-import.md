# Books reading-history import

Apply `supabase/migrations/20261022093314_books_reading_history_import.sql` before deploying this UI. It adds local catalogue identities, collection scope, private reading history and the preview/apply RPC. It also extends the service-only backup snapshot with reading history. Existing Open Library links and `save_book_rating` calls remain supported.

After deployment, sign in, open **Books → Import reading history**, and choose `books-import.json` extracted from the private prepared package. The preview validates the complete file on the server and shows new books, current ratings, readings and existing ratings being preserved. Review it, then choose **Import these books & readings**. The import is one transaction; invalid dates, duplicate identities or changed imported readings abort the entire request.

The prepared data stays outside this public repository. No service key or account ID is needed in the file. The server always uses the signed-in user. Import preview does not write data. Row-level security restricts history and notes to their owner; catalogue titles and covers remain shared.

## Data rules

- `books[].work_key` is the stable source identity (`manual:` followed by 24 lowercase hex characters). An Open Library work ID is optional. Unmatched works and multi-volume collections retain source metadata and get shareable `#/books/local-<id>` links. Matching candidates require independent review before enriching a source-only book.
- `readings[].source_key` is unique per user. Re-uploading an identical reading is a no-op. A changed reading with the same key raises a conflict rather than rewriting history.
- `books[].latest_source_key` selects the initial current rating. Existing app ratings, notes and formats are preserved, even when historical readings are added. Editing a current rating afterward does not rewrite imported history.
- Scores stay on a ten-point scale in half-point increments. Monthly dates use day 1 but are displayed as month/year; year-only and year-range dates remain approximate. Unknown dates remain unknown. Publication years remain separate.
- Provider IDs and source keys must be unique within the upload. Existing provider identities are reused without replacing shared metadata. Conflicting source/provider bindings or collection scopes are rejected.
- The server accepts at most 1,000 books, 3,000 readings and 8 MB per prepared upload. The public RPC is an invoker wrapper around an authenticated private helper; clients have no direct write grants.

## Backup and recovery

`culture_backup_snapshot()` now includes `book_readings`. Backup manifests count and verify that table when present, and insert-only recovery restores it after books and progress. Older six-table snapshots remain readable. Use the existing backup workflow before the first live import. Live deployment and import are separate steps from opening this PR.

## Verification

Run `npm ci && npm test`, `node --test tests/routes.test.mjs`, and `python -m unittest discover -s tests -p test_backup.py`. Tests cover preview without writes, transaction rollback, rereads, repeat imports, existing-rating preservation, provider reuse, source-only rating editing, history privacy, account changes, local URLs and backup compatibility. The real private prepared dataset is also exercised locally against an isolated Postgres instance; never add it as a public test fixture.

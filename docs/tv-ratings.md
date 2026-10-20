# TV ratings and historical import

**Latest extension:** see [the separate series-tab import and general season controls](series-tab-import.md). The original import counts below describe earlier completed batches.

This adds a top-level TV Series section with Catalogue/My ratings tabs, series/miniseries filters, title/creator/director search, sorting, half-point stars, rating scope, private notes and an optional watched date. Films and Books keep their own ratings. The original 43 TV identities and all existing numeric film IDs remain unchanged. The final historical batch adds eight rating targets, bringing TV to 51, including explicit seasons, installments and two manually verified identities.

## Setup and review boundary

1. Review and merge the application PR; let Pages deployment finish.
2. Run the complete [TV setup SQL](../supabase/migrations/20261019_tv_ratings.sql) in the project's Supabase SQL Editor. Installation creates TV storage and functions but does not import ratings, alter film progress or delete Decalogue V.
3. Reload Culture Atlas and open **TV Series → Refresh**. Sign in in your own browser. No account credentials or Google account access are needed by the development assistant.
4. Review the private 43-row TV proposal and use **Import TV ratings** in the TV section. This is a different format from the Films import. The confirmation lists missing, existing and differing records, and explicitly describes the optional Dekalog correction.
5. Verify the TV count, film count and Dekalog after the import. Export TV ratings as a private backup if desired.

No production migration or import is run by this PR. After setup, authenticated users can save deliberate changes through the TV rating editor. A missing migration leaves catalogue browsing available, with saving/import disabled and a setup message.

## Storage and privacy

`public.tv_progress` is keyed by `(user_id, work_key)`. Whole-show keys remain `tv:<TMDB TV ID>`; the additive scoped-identity migration also accepts explicit seasons, reviewed movie-provider TV installments, IMDb-based records and manual local identities. `movie:` keys and bare numbers are rejected. It stores a numeric half-point score, `rating_scope`, notes, optional watched date and an update version. Row-level security restricts all access to the signed-in owner; anonymous users cannot read TV ratings or call the write functions.

Functions use caller privileges (`security invoker`) and an empty search path. The current user comes from `auth.uid()`, never a submitted user ID. Interactive saves/removals compare the last update version: stale editors fail instead of silently overwriting or recreating removed ratings. No TV progress is copied into browser local storage or uploaded during a cloud read. Account switches clear displayed private state; late responses from an old session are ignored.

The migration does not require a service-role key, an authentication change, or an RLS change to existing film/Book tables. The Dekalog correction uses the existing film owner's SELECT/DELETE permissions.

## Import behavior

The format is `culture-atlas-tv-progress-v1`, with a `ratings` array of `work_key`, `rating`, `rating_scope`, `notes` and `watched_date`. The optional `replace_dekalog_episode` flag is accepted only when the client file contains the whole-cycle TV/42699 rating of 10.0.

Client validation rejects unknown catalogue keys, film aliases, duplicate work keys, invalid half-points, oversized notes and invalid dates. It refreshes current progress before confirmation and checks the current account again before sending the write. The database validates the whole batch, inserts missing rows with `ON CONFLICT DO NOTHING`, and reports actual inserted keys. Existing TV ratings, notes, dates and scopes are never updated by an import, including concurrent inserts after the preview. A failing statement or correction rolls the entire batch back.

`rating_scope` is either `whole_work` or `unspecified`. An unspecified scope does not mean all seasons have been watched. The private source proposal contains **6 owner-confirmed whole-work ratings and 37 unspecified scopes**. All historical watched dates remain null. Original notes and exact half-point scores are preserved. The final historical extension supports explicitly reviewed season, installment and opening cards. Their whole-work scope refers to the selected card, not a wider parent.

The proposal is reproducible without network/database access:

```sh
python3 scripts/prepare-reviewed-tv-import.py --output /private/path/tv-review
```

Personal output must be outside the public repository. The generated JSON and CSV must not be committed.

## Dekalog correction

The owner approved 10.0 for the complete ten-part cycle and removal of the mistaken Decalogue V assignment. When explicitly requested during TV import, one database transaction:

1. Inserts missing TV ratings without replacing existing ones.
2. Locks and verifies TV/42699 is rated 10.0 with whole-work scope.
3. Locks the same owner's film 1920 and verifies its old score is 10.0, watched=true, with no notes/date that would be lost.
4. Removes that mistaken film progress row only. If the row is already absent, the correction is a no-op. A changed score/notes/date aborts the complete batch.

The film cache is then refreshed through the read-only cloud loader from PR #93. It cannot restore the removed episode. Neither the episode film nor the cycle is removed from a catalogue.

Starting from the confirmed **2,089 film ratings**, importing all 43 new TV ratings and correcting Dekalog yields **2,088 film ratings + 43 TV ratings = 2,131 distinct rated works**. The two section counts remain separate.

## Four existing-film aliases

These are displayed in TV browsing as linked film ratings. The registry's external TV lookup resolves to the existing canonical film key. No additional work or TV progress row is created; the database also blocks these TV keys in `tv_progress`.

| TV identity | Canonical work | Title |
| --- | --- | --- |
| TV/5904 | `movie:1955` | Guest from the Future |
| TV/69135 | `movie:1967` | Doctor Aybolit |
| TV/80706 | `movie:2016` | Adventures of Captain Vrungel |
| TV/85252 | `movie:2047` | The Long Recess |

Each alias shares the verified IMDb identity of the target. Rating edits use **View film rating**, which opens the existing film editor. Alias records add search/display metadata, not another canonical rating target.

## Remaining source cases

All remaining nine source rows are resolved into eight targets in the [final audit](remaining-version-audit.md). The original 43-row import remains reproducible and excludes these later additions. Apply the new scoped-identity SQL once, then use the single private eight-rating import file. No production writes are performed by development tooling.

## Validation and limits

```sh
npm ci
node --test tests/tv-ratings.test.mjs tests/work-identities.test.mjs tests/film-progress-sync.test.mjs
npm test
python3 -m unittest discover -s tests -p 'test_reviewed_ratings.py'
node scripts/validate-catalog.mjs
node scripts/validate-work-catalog.mjs
git diff --check
```

PGlite tests execute the migration, caller permissions/RLS, cross-account isolation, repeat imports, invalid batches, optimistic edits and atomic Dekalog rollback. Happy DOM tests cover navigation with Books, half-point stars, notes escaping, account state, imports and aliases. The private 43-row proposal is also checked locally against the real migration. A signed-in production save/import remains to be verified by the owner after installing the migration; no production access is claimed.

Implementation references: [Supabase RLS](https://supabase.com/docs/guides/database/postgres/row-level-security), [database functions](https://supabase.com/docs/guides/database/functions), and [PostgreSQL INSERT](https://www.postgresql.org/docs/current/sql-insert.html).

# Film progress sync and deletions

When signed in, a successful complete `film_progress` read is authoritative. Records missing from that response must also disappear from the active browser cache. Loading progress is read-only: it never inserts or upserts a browser-only entry into the signed-in account.

The previous loader automatically uploaded any locally cached rating missing from the database. That could recreate a rating deliberately deleted in Supabase, including the mistaken Michel Franco Dreams assignment. It could also copy another account's cached progress into the account signing in.

Before replacing a nonempty cache, the loader saves one recovery snapshot per account under `culture-atlas:films:v1:before-cloud:<user-id>`. It never automatically imports that snapshot. Explicit rating imports remain available through the existing account menu. Failed or incomplete cloud reads leave the active cache unchanged.

After this fix is deployed, reload the site to load database progress. If an older browser session already recreated a deleted row, the database correction must be applied again; the loader does not guess which existing database records should be removed. This change contains no database writes or deletion rules for particular films.

Regression tests cover deleted ratings, browser-only entries, pagination beyond 500 records, interrupted reads, and recovery-snapshot preservation:

```sh
node --test tests/film-progress-sync.test.mjs
```

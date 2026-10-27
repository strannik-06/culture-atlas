# TV awards 2025 deployment

Completed 27 October 2026 after PR #118 merged as `57cee52221d4558550085467ea6c64ed8ecb9aef`.

Applied `imports/tv-awards-2025-catalogue-sync.sql` (SHA-256 `c8e47c012d6b7b511efbd617a6a1feb2ddbc4e95ba7cedc92f58f1ed75760031`) to project `ufqaidyshfkbymbrzdff`.

- Preflight: 45 programme identities; 18 existing, 27 missing; zero provider/identity conflicts.
- Registered 27 public media records and 27 provider links in one transaction.
- Final totals: 3,295 media catalogue entries and 3,297 provider links.
- Transaction assertions compared every pre-existing media/provider row and row fingerprints for books, book progress, book readings, film progress, TV progress and external ratings. All preservation assertions passed. Private values and fingerprints are not published.
- Independent anonymous-role verification: all 45 award identities and provider links are present, with no conflicts.

Existing catalogue metadata, ratings, notes, watched dates and reading history are unchanged. The registration SQL for PR #118 is deployed, not pending; no additional database action is required for this pilot.

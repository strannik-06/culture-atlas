# Database deployment audit — 27 October 2026

Verified against merged main commit `f677e800f7233b431af4dcddb98687fd212acc03`, Supabase project `ufqaidyshfkbymbrzdff`. Final verification: 2026-10-27 17:21 UTC.

## Outcome

All SQL requirements from the merged work are fulfilled. Seven pending catalogue registration batches were applied together in one transaction. No personal-rating imports were replayed and no schema migration was reinstalled.

| Catalogue | Before | After |
| --- | ---: | ---: |
| Public media records | 2,584 | 3,136 |
| Provider links | 2,586 | 3,138 |
| Public books | 254 | 314 |

The media catalogue now contains all 2,804 canonical films and 330 static TV/season targets, plus the two pre-existing dynamic records. Every expected provider link is present with the correct target. All 69 book-award identities resolve to exactly one book; 9 were reused and 60 inserted. There are no missing catalogue registrations or identity conflicts.

## Applied catalogue scripts

| Merged script | Insertions | SHA-256 |
| --- | --- | --- |
| `imports/awards-2026-catalogue-sync.sql` | 126 films | `e31f3359b98d052541e7b96a9465a6f495f4475c64f6b1edae576e529648d081` |
| `imports/book-awards-2026-catalogue-sync.sql` | 60 books | `f6882d3812ac1302c4b41ba75d3b49fbb1e9c4c91bdc437ba85e6598868fec06` |
| `imports/oscars-2021-2025-catalogue-sync.sql` | 82 films | `e16d8b13059b41dc9b2f74dd1202f76269c232ca7e7944cda33fae9015078c7c` |
| `imports/bafta-2021-2025-catalogue-sync.sql` | 58 films | `2704eed56f70db374db1b65799c8f29a3ad59df04033821472fee9f47c2e0f60` |
| `imports/globes-2021-2025-catalogue-sync.sql` | 25 films | `ac94e7ba38fd13e3721cc595b0c5a9e0083ac398ddfad197cda8aa7087001444` |
| `imports/cannes-2021-2025-catalogue-sync.sql` | 128 films | `f2e3345eaa1e32523481783fe64640ad902d20ebfa0f3261c24e340587eae783` |
| `imports/venice-2021-2025-catalogue-sync.sql` | 133 films | `ce391db73840a262e568332b401273161527f54324ad4717f5ddcf4942a4940e` |

The Venice batch also corrected only Mother’s public director metadata, retaining catalogue ID 262 and its provider identity. The authoritative credit is Teona Strugar Mitevska. All other fields of every existing media record, every existing book record and every existing provider link were compared and preserved.

## Earlier SQL requirements

| Script or feature | Live verification |
| --- | --- |
| `20261012_external_ratings.sql` | Table, constraints and authenticated read policy installed; existing rows preserved. |
| `20261013_half_star_progress.sql` / legacy half-point SQL | Film ratings use `numeric(3,1)` with the half-point constraint. |
| `20261019_books_search_ratings.sql` | Books/progress schema installed; original save body verified in its relocated private function. |
| `20261019_tv_ratings.sql` | TV table, ownership policy and save/remove/import APIs installed. |
| `20261019_tv_scoped_identities.sql` | Scoped identity validation, constraint and import API installed. |
| `20261020_tv_reviewed_score_import.sql` | Reviewed import API installed; no historical import replayed. |
| `20261021_media_catalogue.sql` | Catalogue/provider tables, save API and version trigger installed. |
| `20261021_media_catalogue_seed.sql` | Every current static identity/provider mapping is covered; full seed did not need replaying. |
| `20261021_backup_snapshot.sql` | Snapshot API installed and service-role only. |
| `20261022093314_books_reading_history_import.sql` | Reading history, source identities, Goodreads fields, private/public wrappers and latest backup snapshot installed. |
| `supabase/schema.sql`, `half-point-ratings.sql`, proposed personal notes/date SQL | Reference/alternative requirements already fulfilled, including notes and watched-date columns; not pending deployment commands. |

All 18 checked-in function bodies match the live implementation, including the intentionally relocated original book-save body. Row-level security remains enabled on every public table. Public catalogue reads were verified as the anonymous role; private progress remains inaccessible to that role. Migration history alone was not used to decide whether work was pending: earlier manually installed SQL is not fully represented there.

## Preservation and transaction checks

The committed transaction locked the relevant tables briefly and compared before/after row fingerprints for film progress, TV progress, book progress, reading history and external ratings. Any private-row change or unexpected existing metadata change would have raised an exception and rolled back all batches. Independent post-commit fingerprints also matched the original baseline exactly. No private row values or fingerprints are committed in this report.

An initial attempt was fully rolled back because the additional preservation assertion needed explicit grouping of its SQL set operations. No catalogue rows committed during that attempt. The corrected assertion and all seven reviewed scripts then committed successfully.

## Future catalogue batches

Merging a PR publishes repository/website changes; it does **not** execute Supabase SQL. After each merge, apply and verify its catalogue SQL **before starting the next batch**. Before marking a merged batch complete:

1. Check actual live schema and identity/provider coverage; do not infer deployment from migration history or website appearance.
2. Review the merged registration SQL and preflight identity conflicts.
3. Apply missing public catalogue changes with preservation checks. Do not replay historical personal-rating imports.
4. Verify coverage, public readability and unchanged private progress, then record the applied script checksums/status in a dated audit.

No database setup or SQL action remains for the owner from the merged work covered by this audit.

## Berlinale follow-up — 19:21 CET

After PR #114 merged as `5c1a724530b11f89aa706fd28fb3aa426a12b931`, applied and verified `imports/berlinale-2021-2025-catalogue-sync.sql` (SHA-256 `6ddad312595901acb34b525c94f03d26d88f7435c0eb4f49f2a033cfdc5e39cf`). The merged script matched the reviewed local script exactly.

Added 132 public film entries and 132 provider links. Final live counts: 3,268 media catalogue rows and 3,270 provider links. All 132 new identities were checked under the anonymous public role. Existing catalogue/provider rows, private progress, ratings, notes, book records and reading history were preserved, with transaction assertions and independent post-commit fingerprints. See [Berlinale audit](berlinale-2021-2025-audit.md).

No SQL remains pending from the merged work through PR #114.

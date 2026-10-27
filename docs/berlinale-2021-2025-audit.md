# Berlinale 2021–2025

This batch adds five historical editions using the same festival layout as 2026: a Main Competition section, followed by Encounters in 2021–2024 or Perspectives in 2025. Each selection is complete, with one card per film within its section and all official jury prizes combined on that card.

| Edition | Main Competition | Second section | Films |
|---|---:|---|---:|
| 2021 | 15 | Encounters: 12 | 27 |
| 2022 | 18 | Encounters: 15 | 33 |
| 2023 | 19 | Encounters: 16 | 35 |
| 2024 | 20 | Encounters: 15 | 35 |
| 2025 | 19 | Perspectives: 14 | 33 |
| Total | 91 | 72 | 163 |

All 163 identities are verified: **31 existing catalogue records reused, 132 new records, zero unresolved identities**. No existing film metadata is changed. The read-only Supabase preflight found no provider/work identity conflicts.

## Sources and scope

The official [programme archive](https://www.berlinale.de/en/archive/programme/programme-archive.html) supplies the original/international titles, directors, production years, duration and individual film URLs. The official [awards archive](https://www.berlinale.de/en/archive/awards-juries/awards.html) supplies the prizes. The source JSON records edition-specific URLs, every selected film and each included prize recipient. Archive pagination was followed through the final page; counts were checked against the published programme sections.

Cross-section official jury awards are included when their recipients are in these selections: for example, the documentary prize for *We* (2021), the debut prize for *Sonne* (2022), and the documentary special mention for *Direct Action* (2024). Special mentions identify their awarding jury where needed. Other sections, shorts, honorary awards, audience awards and independent juries are outside this batch.

Both 2025 films called *Dreams* are correctly represented. The Golden Bear belongs to Dag Johan Haugerud’s *Dreams (Sex Love)*, canonical film 31; Michel Franco’s film remains a separate catalogue identity. No personal rating is created or restored for either film.

## Identity verification

The machine-readable audit records every official film URL, canonical ID, TMDB ID, IMDb ID and verified director. Searches require an exact normalized original/international title, matching director identity, a feature-length runtime and a plausible release window. Searches are also narrowed by festival year for crowded titles. Existing provider identities are reused; conflicting or ambiguous identities stop generation.

Reviewed exceptions are limited to individual official film URLs in the overrides JSON:

- Bence/Benedek Fliegauf, Natalia López Gallardo/Natalia López, Victor/Viktor Kossakovsky and Christos/Hristos Passalis are documented name or provider-credit variants.
- *Gloria!* needed a year-filtered title search to avoid unrelated films with that name.
- Wu Lang’s *Absence* is the 2023 feature, not his 15-minute 2021 short. The provider lists a 2025 territorial release. Its record is pinned and independently checked against the feature title, director, runtime and both lead actors using the [sales agent](https://www.rediancefilms.com/film.php-58.html), [MoMA](https://www.moma.org/calendar/events/8589) and provider metadata.

 New records use the official archive’s production year; existing catalogue records and metadata are preserved.

## Deployment

`imports/berlinale-2021-2025-catalogue-sync.sql` registers only the newly verified public catalogue entries and their provider links. It preserves existing rows, can be rerun safely and aborts on identity conflicts. It contains no rating, note or progress writes.

Status: **applied and verified in Supabase on 2026-10-27 at 19:21 CET**, after PR #114 merged as `5c1a724530b11f89aa706fd28fb3aa426a12b931`.

The executed script matched the merged file byte for byte (SHA-256 `6ddad312595901acb34b525c94f03d26d88f7435c0eb4f49f2a033cfdc5e39cf`). It added 132 catalogue entries and 132 provider links: media catalogue rows increased from 3,136 to 3,268; provider links from 3,138 to 3,270. All 132 new identities resolve to their expected provider links and are readable by the anonymous public role.

The transaction locked relevant tables briefly and asserted that every existing media/provider row and the complete fingerprints of film progress, TV progress, book progress, reading history, external ratings and books were unchanged. Independent post-commit fingerprints also matched. No private values or fingerprints are stored in this report. No schema, privilege, rating or note changes were made. No SQL remains pending from this batch.

## Validation

Regression checks cover all five editions and their section sizes, all sourced prizes and canonical references, the five Golden Bears, the Haugerud/Franco distinction, the feature version of *Absence*, and duplicate-free winner-first rendering. The isolated PostgreSQL-compatible test applies the registration SQL twice, verifies existing metadata/ratings/notes survive, and confirms conflicting provider links abort the transaction.

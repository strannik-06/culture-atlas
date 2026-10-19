# Review of the 699 flagged historical film links

> Historical PR #88 snapshot. The subsequent [TV/version audit](tv-version-identity-audit.md) contains the latest coverage and resolves the confirmed whole-cycle TV identities.

After PR #87 merged, 699 source-to-catalogue links still had review flags. This audit examines that entire set and accepts **698 existing film identities**. It rejects the remaining automatic mapping because the owner confirmed that the source rates the whole ten-part Dekalog cycle, while the old target was one episode. The catalogue stays at **2,251 films**; no catalogue objects, IDs, ratings or Supabase data change.

## Review result

| Outcome within the original flagged set | Source entries |
| --- | ---: |
| Existing film identity reviewed and accepted | 698 |
| Owner-confirmed whole cycle awaiting TV identity | 1 |
| Flagged entries not examined by this pass | 0 |
| Total | 699 |

This does not mean that 698 missing films were added, or that 698 ratings need importing. These are links from spreadsheet entries to records already in the catalogue. It also does not certify a new live TMDB/IMDb response for every identity.

The old flags came from 557 rows whose directors the original matcher could not verify, 77 existing-catalogue candidates and 65 unmatched rows subsequently linked by title/year. Review compares source titles and translations, installment numbers, director names, co-director roles and years. Russian surname-first forms and Latin-script forms frequently represent the same person. Matching spelling or a movie ID's presence alone does not approve a link.

The [explicit review decisions](../imports/legacy-699-reviewed-identities.csv) record the source and target metadata, decision, director/credit caveats, year discrepancy and evidence for every one of the 699 rows. The generator applies those decisions; it does not manufacture approvals from fuzzy matching or transliteration scores.

## Evidence and limits

- **618 rows** have saved TMDB details/credit evidence recovered from the owner's `historical-714-catalogue-metadata-preview.zip`. A metadata-only subset with provenance and the original preview hash is [committed here](../imports/legacy-699-tmdb-evidence.json). This is historical evidence, not fresh API data. Its overlap with the imported catalogue is expected; acceptance also requires the source title/director comparison recorded in the review.
- **81 rows outside that saved preview** are corroborated against public festival, studio, distributor, filmmaker or film-institution records. Examples include the official Cannes 2023–2025 selections, Venice 2024–2025 lineups, Berlin's 2025 programme, and studio film pages. The decisions contain the per-row source URLs. Public sources corroborate the source work's title/director identity; inherited catalogue TMDB/IMDb fields have not all been independently refreshed.
- Two rows with saved details also have targeted public checks: Monsters, Inc. for co-director credits and Dekalog for series/episode scope. Evidence categories overlap on those two rows.

Examples of credit differences that do not imply different films: Dorota Kobiela/DK Welchman on Loving Vincent; Lenny/Leonard Abrahamson on Room; source co-directors versus a principal-director-only field on Inside Out, Ratatouille, Finding Nemo and Monsters, Inc.; and collective Coen/Farrelly brother credits versus the credited principal director. The review accepts the work identity without silently editing or declaring the credit lists complete. Missing individual directors in `(multiple)` source entries are not invented.

**54 entries retain a one-year source/catalogue difference.** They are listed separately in [the date discrepancy report](../import-previews/legacy-699-year-discrepancies.csv). Those differences do not establish a different film when the title and director identify the same work. They also do not prove which year is correct. For example, source/canonical years are 1942/1943 for Casablanca, 2020/2021 for Nomadland, and 1962/1963 for Story of One Crime. No date correction is applied here.

**Eight existing records have no IMDb ID:** catalogue IDs 210, 211, 212, 213, 215, 218, 219 and 220. Their source-to-film identities can be established from titles/directors and public evidence, but the missing external-ID fields remain a separate metadata task. This audit does not invent identifiers.

## Owner-confirmed scope: Dekalog

Source row **1532** says **Декалог**, Krzysztof Kieślowski, 1989. Its old movie candidate is **Decalogue V**, catalogue ID **1920**, TMDB **118665**, IMDb **tt0094987**. The owner confirmed on 2026-10-19 that this rating covers the whole ten-part cycle, not episode five.

The [Criterion edition](https://www.criterion.com/films/28661-dekalog) and [Kieślowski archive filmography](https://kieslowski.com.pl/filmografia/) distinguish the ten-part cycle. The current ledger therefore removes the active movie mapping while preserving the old episode candidate in the historical review/evidence. The existing catalogue episode is not deleted or renamed.

**Scope resolved:** the owner explicitly confirmed the whole ten-part Dekalog cycle. Do not ask for this confirmation again. Whole-cycle TV identity verification and catalogue implementation remain pending. Do not transfer this rating to A Short Film About Killing, which also has a separate source entry and theatrical identity.

This audit cannot establish whether the old mapping ever affected a stored rating: it never accesses Supabase or progress exports. That question belongs in a separately authorized, read-only rating reconciliation.

## Current full-source coverage

| Current source entry outcome | Count |
| --- | ---: |
| Present in catalogue | 2,081 |
| Repeated identity in a separate source entry | 10 |
| Consolidated source identity | 2 |
| TV, episode or version review | 56 |
| Unresolved standalone identity | 1 |
| **Total** | **2,150** |

The 20 additions from merged PR #87 now count as present. Dekalog increases TV/version deferrals from 55 to 56. The standalone unresolved entry is still Tatarskiy's 1981 Good Night, Little Ones! opening sequence (source 1699). Confirmed scopes for Mikhalkov's 12, the theatrical Turkish Gambit and the whole Naval Cadets, Charge! miniseries are preserved.

The 56 TV/version entries are not a count of 56 missing series: some overlap with catalogue movies, episodes or compilations. They require the right work/version and rating scope before linking. No TV support changes are included here.

There are now **zero remaining flags on active links from the original 699-row queue**: 698 were accepted and one moved to the TV identity queue with owner-confirmed whole-cycle scope. This is not a claim that every unflagged baseline entry was newly and independently verified. The current ledger's `identity_audit_status` distinguishes reviewed rows from `outside_699_review`; older unflagged entries retain their original evidence level. Duplicate identities still require rating-conflict handling.

## Reproduction and review boundary

Baseline: merged PR #87, commit `a6793872940f48e18bb10aa854f3be5b585697bd`.

- [Current 2,150-entry ledger](../import-previews/current-source-catalogue-ledger.csv)
- [Machine-readable summary and input hashes](../import-previews/legacy-699-identity-summary.json)
- [699 explicit review decisions](../imports/legacy-699-reviewed-identities.csv)
- [Historical PR #87 snapshot](full-source-catalogue-audit.md)

Run in a checkout containing the pinned baseline commit:

```sh
python3 scripts/audit-legacy-film-identities.py --check
python3 scripts/build-source-catalogue-ledger.py --check
node scripts/validate-catalog.mjs
git diff --check
```

The new check reproduces outputs in memory, enforces exact coverage of the original 699 entries, checks all source/candidate metadata against the immutable baseline, rejects unknown or changed targets, validates cached metadata, preserves accepted IDs and removes the ambiguous episode link. It also verifies that film-catalog.js is byte-for-byte unchanged from the merged baseline. Neither script accesses the network, Supabase or progress.

Stop for PR review. No rating import payload, rating overwrite, duplicate-rating selection or database mutation is included. Preparing an import still requires a separate conflict report and explicit approval.

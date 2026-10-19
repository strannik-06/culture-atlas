# Full spreadsheet catalogue coverage audit

> Historical PR #87 snapshot. For the subsequent 699-link review and current coverage, see [the legacy identity audit](legacy-699-identity-audit.md) and [current ledger](../import-previews/current-source-catalogue-ledger.csv).

This proposal adds 20 verified movie identities to the catalogue merged in PR #86. It accounts for every normalized spreadsheet entry, but does not certify every older identity link for a rating import. No Supabase data or ratings were read or modified by this workflow.

## Coverage

Baseline: `ef78222e1e952e33f33d779153db65a4b2a6707e`, 2,231 films. Proposed catalogue: **2,251 films**, new IDs **2233–2252**. Existing catalogue objects and IDs are preserved.

| Source entry outcome | Count |
| --- | ---: |
| Present in catalogue | 2,062 |
| Proposed verified addition | 20 |
| Repeated identity in separate source entries | 10 |
| Consolidated source identity | 2 |
| TV, episode or version review | 55 |
| Unresolved standalone identity | 1 |
| **Total normalized source entries** | **2,150** |

These entries represent 2,153 original spreadsheet row numbers. Coverage is measured in source entries, not unique films. The ledger preserves all source row references.

**699 carried-forward links still require identity review.** These are older audit candidates marked for review or links based only on a unique normalized title and year. They are not 699 missing films, and they have not been independently reverified by this proposal. A catalogue record's existence is not proof that a source row was matched correctly. The ledger exposes `link_basis` and `identity_review_required`; no rating import should treat all linked rows as approved.

## Verified additions

Verification compares source title, director and year with saved evidence and current public title/IMDb/TMDB cross-references. There was no fresh authenticated TMDB API detail request. Full sources and identity rationales are in [the evidence manifest](../imports/full-source-coverage-evidence.json).

| Source row | Catalogue ID | Film | TMDB / IMDb | Source |
| --- | ---: | --- | --- | --- |
| 2 | 2233 | Minotaur (2026) | 848700 / tt37118301 | [Evidence](https://www.festival-cannes.com/en/f/minotaur/) |
| 3 | 2234 | NAZA (2026) | 1755291 / tt44766123 | [Evidence](https://www.theguardian.com/gnm-press-office/2026/aug/24/naza-a-new-film-directed-by-yuval-abraham-and-rachel-szor-produced-by-the-guardian) |
| 4 | 2235 | The Drama (2026) | 1325734 / tt33071426 | [Evidence](https://cinegraph.org/movies/the-drama-2026) |
| 5 | 2236 | 28 Years Later: The Bone Temple (2026) | 1272837 / tt32141377 | [Evidence](https://cinegraph.org/movies/28-years-later-the-bone-temple-2026) |
| 6 | 2237 | The Devil Wears Prada 2 (2026) | 1314481 / tt33612209 | [Evidence](https://cinegraph.org/movies/the-devil-wears-prada-2-2026) |
| 7 | 2238 | Toy Story 5 (2026) | 1084244 / tt29355505 | [Evidence](https://cinegraph.org/movies/toy-story-5-2026) |
| 8 | 2239 | Digger (2026) | 1248832 / tt31450459 | [Evidence](https://cinegraph.org/movies/digger-2026) |
| 9 | 2240 | Project Hail Mary (2026) | 687163 / tt12042730 | [Evidence](https://cinegraph.org/movies/project-hail-mary-2026) |
| 10 | 2241 | Pressure (2026) | 1318413 / tt32547691 | [Evidence](https://www.wikidata.org/wiki/Q127698549) |
| 11 | 2242 | The Odyssey (2026) | 1368337 / tt33764258 | [Evidence](https://cinegraph.org/movies/the-odyssey-2026) |
| 12 | 2243 | Backrooms (2026) | 1083381 / tt26657236 | [Evidence](https://cinegraph.org/movies/backrooms-2026) |
| 13 | 2244 | Disclosure Day (2026) | 1275779 / tt15047880 | [Evidence](https://cinegraph.org/movies/disclosure-day-2026) |
| 14 | 2245 | The Invite (2026) | 950028 / tt14173636 | [Evidence](https://cinegraph.org/movies/the-invite-2026) |
| 554 | 2246 | Moms Are Simply Waiting for Us (2012) | 460313 / tt2601120 | [Evidence](https://letterboxd.com/film/moms-are-simply-waiting-for-us/) |
| 1428 | 2247 | Coffee and Cigarettes III (1993) | 472693 / tt0106584 | [Evidence](https://cinegraph.org/movies/coffee-and-cigarettes-iii-1997) |
| 1541 | 2248 | Coffee and Cigarettes II (1989) | 263912 / tt0090862 | [Evidence](https://cinegraph.org/movies/coffee-and-cigarettes-ii-1989) |
| 1602 | 2249 | Coffee and Cigarettes (1986) | 68540 / tt0090861 | [Evidence](https://cinegraph.org/movies/coffee-and-cigarettes-1986) |
| 1704 | 2250 | Tryam! Hello! (1980) | 383282 / tt5498058 | [Evidence](https://www.wikidata.org/wiki/Q4464680) |
| 1899 | 2251 | The Bremen Town Musicians (1969) | 33108 / tt0211281 | [Evidence](https://www.wikidata.org/wiki/Q4096274) |
| 1922 | 2252 | Junior and Karlson (1968) | 77304 / tt0756316 | [Evidence](https://www.wikidata.org/wiki/Q4279279) |

The three Coffee and Cigarettes shorts have independent release identities. They must not inherit the anthology's rating (catalogue ID 872). For part III, Cannes establishes **1993** despite the spreadsheet's 1995 and a secondary site's 1997 URL slug. “Moms Are Simply Waiting for Us” is a separate four-minute short, not the feature anthology Mommies (ID 1601).

## Corrected links to existing films

These change the source coverage ledger, not existing catalogue objects or stored ratings.

| Source row | Correct catalogue identity | Reason |
| --- | --- | --- |
| 118 | 31 — Dreams (Sex Love) | Dag Johan Haugerud, not the same-title Michel Franco film (229). |
| 203 | 1482 — Being the Ricardos | Russian title alias; director and year agree. |
| 266 | 1501 — Another Day of Life | Russian title alias; both directors and year agree. |
| 620 | 1454 — The Intouchables | “1+1”; reject the old Twilight candidate (561). |
| 1064 | 1762 — Pirates of the Caribbean: The Curse of the Black Pearl | Russian title alias; director and year agree. |
| 1329 | 1849 — More | Mark Osborne's 1998 short. |
| 1924 | 2081 — Dillinger Is Dead | Source production year 1968 versus release year 1969. |
| 1405 | 1872 — How the Cossacks Played Hockey | The owner workbook reused the football short's link (2064); hockey is the 1995 film. |

Previously reviewed corrections, including Zvyagintsev's The Return and Double Tap (1997), remain authoritative. Incorrect historical candidates stay visible only in legacy evidence columns. Future read-only rating reconciliation should check whether any old erroneous links affected progress; this PR makes no such claim or repair.

## Repeated source identities

All source entries remain traceable. No rating has been selected, overwritten or combined here.

| Catalogue ID | Film | Source rows |
| ---: | --- | --- |
| 407 | My Generation | 316, 352 |
| 454 | Fantastic Four | 429, 443 |
| 512 | The Croods | 528, 546 |
| 624 | Mr. Nobody | 718, 761 |
| 703 | The King of Kong | 836, 874 |
| 708 | 12 | 848, 849 |
| 726 | No Reservations | 867, 875 |
| 796 | The Turkish Gambit | 928, 985 |
| 832 | Mindhunters | 1035, 1046 |
| 1063 | Four Rooms | 1419, 1421 |
| 1349 | Shakespeare-Wallah | 1958, 1975 |

The second Four Rooms entry is owner-confirmed as the same film and classified as consolidated. The other ten second entries are classified as duplicate identities. Spirits of the Dead, source rows 1919;1923, is already one consolidated normalized entry mapped to ID 2178; its historical rating remains pending. Identity duplication alone does not settle any rating conflict.

## Scope confirmations, remaining decisions and exclusions

**55 entries need TV, episode or version review.** This is not a count of 55 missing series: some source labels conflict with movie records already in the catalogue. Each is listed in the ledger without an active movie mapping, even where an older candidate exists.

| Source row(s) | Case | Next step |
| --- | --- | --- |
| 1570 | Гардемарины, вперед! / Naval Cadets, Charge! | Owner already confirmed the rating covers the entire four-part miniseries. Verify and implement a series identity in the TV workflow; do not ask for scope confirmation again. |
| 849 | 12 (мини-сериал), 2007, Nikita Mikhalkov | Resolved: owner confirmed the feature at ID 708. Source label was incorrect; linked in the ledger. |
| 928 | Турецкий гамбит (мини-сериал), 2006 | Resolved: owner confirmed the theatrical film at ID 796. Linked in the ledger. |
| 1276, 1359 | Незнайка на Луне, including a “2” entry | Establish whole-series versus part scope before consolidating progress. |

Other series and episode/version entries stay deferred rather than creating movie duplicates or renumbering existing anthology records. This proposal does not change TV support.

**One standalone identity remains unresolved:** row 1699, “Спокойной ночи, малыши (заставка)”, Aleksandr Tatarskiy's 1981 opening animation. The work is identifiable, but a safe standalone TMDB movie/IMDb pair has not been verified. It must not be mapped to the whole programme or Plasticine Crow. A standalone identifier link would resolve the remaining catalogue identity question. See [historical background](https://dates.gnpbu.ru/4-9/Spokojnoj_nochi/spokojnoj_nochi.html).

## Reproduction and review boundary

- [Full ledger](../import-previews/full-source-catalogue-ledger.csv): all 2,150 entries, with source metadata, active mappings, legacy candidates, evidence level and shared identities.
- [Machine summary](../import-previews/full-source-catalogue-summary.json): exact counts and evidence hashes.
- [Legacy evidence](../imports/source-catalogue-legacy-evidence.csv): metadata-only projection of the original full import audit; no personal ratings or film notes.
- [Evidence manifest](../imports/full-source-coverage-evidence.json): original audit hash, owner-reviewed links, explicit corrections and verified additions.

Run from the repository root:

```sh
python3 scripts/build-source-catalogue-ledger.py --check
node --check film-catalog.js
node scripts/validate-catalog.mjs
git diff --check
```

The ledger generator pins the merged baseline, checks every proposed addition against evidence, rejects ID/TMDB/IMDb collisions, and verifies that all baseline film objects are unchanged. Default mode regenerates the ledger and summary; `--check` is read-only. `--apply-additions` accepts only the pinned baseline or this exact proposal. There is no network, progress or Supabase code in the generator.

Validation passed: 2,251 films, 200 Top 100 references, six award events, zero catalogue errors; source coverage snapshot reproduced exactly.

**Stop for catalogue PR review.** Any future rating import requires a separate reviewed plan, conflict checks against existing ratings and explicit authorization. This PR contains no rating import payload or Supabase changes.

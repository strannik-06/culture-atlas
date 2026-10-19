# Final historical version resolution

This completes the remaining historical source identities in the same PR. It supersedes the earlier held-case recommendations. Base: merged PR #94 (`cc2add7e9f3d8004218332ae76903982318be7c0`). The owner reports the earlier TV setup/import worked; no production access is used here.

## All remaining identities resolved

| Source rows | Rating target | Resolution |
| --- | --- | --- |
| 1276, 1359 | `tv:99952` — Dunno on the Moon, complete cycle | Owner allowed a combined fallback if no separate second-part identity was found. Both part scores and notes agree exactly; preserve one score without averaging. |
| 1416 | `tv:1455:season:1` — Spellbinder, season 1 (1995) | Preserve its own rating for the first 26 episodes. |
| 1371 | `tv:1455:season:2` — Land of the Dragon Lord, season 2 (1997) | Preserve its separate rating for the second 26 episodes. Do not use incomplete duplicate TV/313262. |
| 1710 | `tv:movie:126850` — Mortal Fight | Exact named TV installment, IMDb `tt0229922`; retain actual TMDB movie-provider namespace. |
| 1711 | `tv:movie:126846` — King of Blackmailers | Exact named TV installment, IMDb `tt0459944`. |
| 1712 | `tv:movie:126854` — Hunting the Tiger | Exact named TV installment, IMDb `tt0459945`. |
| 1457 | `tv:imdb:tt4324832` — Hearts of Three 2 (1993) | Owner approved a manual IMDb-based record for the distinct sequel; no invented TMDB ID. |
| 1699 | `tv:local:good-night-little-ones-tatarskiy-opening` | Owner confirmed the classic plasticine opening. Standalone opening card, not the whole programme or The Plasticine Crow. |

**Nine source rows become eight rating targets. Zero identities remain deferred.** The four existing movie/TV overlaps remain aliases of their original films and require no new rating. The 699 older reviewed matches remain present works.

No new exact duplicates are added. The Dunno rows are complementary parts with an explicit many-to-one resolution. Spellbinder seasons have separate keys and are not registered as two copies of the parent show. Existing film and TV objects are unchanged. The catalogue now contains **2,252 films + 51 TV rating targets = 2,303 canonical targets**.

## Evidence and owner decisions

The [official TMDB API receipt](../imports/tv-version-56-tmdb-evidence.json), [workflow run 39279871694](https://github.com/strannik-06/culture-atlas/actions/runs/39279871694), verifies Dunno's 12-episode identity, the two 26-episode Spellbinder seasons, and the three individual Sherlock installments. Expanded Russian/English movie and TV searches found no distinct Dunno part-two record; this is a bounded search result, not proof of permanent absence.

The [Australian Children's Television Foundation](https://actf.com.au/shows/id/13) explicitly describes the 1997 production as Series 2 and links the 1995 Series 1. The canonical season keys refer to TV/1455's season paths; a generic provider lookup for TV/1455 does not silently return one season.

The [IMDb sequel record](https://www.imdb.com/title/tt4324832/) and [Russian film catalogue](https://ruskino.ru/mov/2337) distinguish the 1993 Popkov sequel from 1992's IMDb `tt0963997` / TV/65923. The new [read-only lookup](https://github.com/strannik-06/culture-atlas/actions/runs/39306362860) found no TMDB match via IMDb or four title variants, without lookup errors. The owner explicitly chose to retain this sequel using a manual IMDb identity.

The [programme's official history](https://spokoinoinochi.ru/story/1982-pervaya-multiplikaczionnaya-plastilinovaya-zastavka-v-peredache-spokojnoj-nochi-malyshi/) identifies the plasticine opening and Tatarskiy, dating first broadcast to 1982. The [animation database](https://animator.ru/db/?fid=5308&p=show_film) records the 1981 production. Both facts are retained in the scope label; no exact premiere date or external ID is invented. The owner confirmed this is the rated opening.

The [final decisions](../imports/remaining-version-decisions.json) pin source titles/years and all nine source references. The generator rejects source drift, duplicate targets, invalid half-points and conflicting combined-part scores/notes.

## Complete source coverage

The [final coverage summary](../import-previews/final-source-coverage-summary.json) applies these decisions and the four existing-film aliases over the earlier 2,150-row source ledger. It leaves no unresolved or deferred source row. Existing duplicate/consolidated source outcomes remain explicit and are not new missing films.

Reproduce without network or account access:

```sh
python3 scripts/audit-final-source-coverage.py --check
python3 scripts/prepare-final-tv-import.py --output /private/path/final-import
```

Historical ledgers and `build-tv-version-audit.py` reproduce earlier snapshots, not the current catalogue. Do not use that historical builder to overwrite later additions. The original 43-row proposal remains byte-identical after this PR.

## One final setup and import

1. Review and merge this PR, then wait for Pages deployment.
2. Run **only** the new [scoped-identity migration](../supabase/migrations/20261019_tv_scoped_identities.sql), after the already installed TV setup. It broadens accepted TV identity keys and replaces the import validator. It changes no rating rows, policies or film/Books tables, and can be run twice safely.
3. Reload the website, open **TV Series**, choose **Refresh**, then **Import TV ratings** and select `culture-atlas-final-8-ratings.json` from the private package.
4. The preview should show eight missing ratings if none were added manually. Confirm once. Existing rows, including differing scores/notes/dates, are skipped without overwrite. The Dekalog correction is disabled in this final file.
5. Expect **51 TV ratings + 2,088 film ratings = 2,139 distinct ratings**, assuming the previous 2,131 total and no intervening edits. Film and TV counts remain separate. This is a forecast, not an independent production count.

The private package contains the eight-row review, JSON, new SQL and these instructions. No production SQL or import is run by development tooling. Season, installment and opening cards describe exactly what their score covers; `whole_work` means the complete selected card, not its wider parent series.

## Validation

Tests cover existing-row preservation across repeated migration installation; all new key forms; malformed-key rejection and transaction rollback; repeated imports and conflicting existing rows; cross-account RLS; season/provider namespace separation; duplicate prevention; correct reference links; precise scope labels; and exact source scores and notes. The actual private 43-row import followed by this eight-row import is also exercised locally against the migrations, verifying all original 43 rows remain unchanged and a repeated final import inserts zero rows.

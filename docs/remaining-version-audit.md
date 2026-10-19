# Remaining historical version cases

Supplement to the completed 43-TV import, based on merged PR #94 (`cc2add7e9f3d8004218332ae76903982318be7c0`). The owner reports that setup/import worked. No fresh production export has been inspected and no production writes are performed here.

## Catalogue addition for review

Add **Dunno on the Moon / Незнайка на Луне**, TV/99952, IMDb `tt0219207`, as a single 12-episode miniseries. Metadata comes from the existing official TMDB API receipt, workflow run [39279871694](https://github.com/strannik-06/culture-atlas/actions/runs/39279871694). Expanded Russian/English movie and TV queries found the full-cycle identity but no distinct second-part identity. This is a bounded search result, not proof that another record can never exist.

The owner confirmed separate ratings for parts 1 and 2 and allowed considering a combined identity when the second part could not be found. Both source scores are exactly equal. The supplementary proposal preserves that score once for the full cycle, without averaging, summing or choosing between scores. Both source row references remain in the decision ledger. The proposal generator refuses differing part scores or notes and does not infer a viewing date.

This adds one canonical TV work: **2,252 films + 44 TV works = 2,296 catalogue works**. Four existing-film TV aliases still add no works. Existing catalogue entries and rating storage are unchanged.

## Audit of all nine source rows

| Source rows | Identity | Outcome | Remaining work |
| --- | --- | --- | --- |
| 1276, 1359 | Dunno on the Moon, parts 2 and 1 | Two source parts → one verified combined TV identity, using owner-permitted fallback | Review catalogue PR, then import one supplementary rating through the website |
| 1371, 1416 | Spellbinder: Land of the Dragon Lord (1997); Spellbinder (1995) | Season scope required | Preserve two ratings using season targets; do not put the 1995 rating on the two-season parent |
| 1457 | Hearts of Three 2 (1993) | Distinct IMDb identity found; TMDB unresolved | IMDb `tt4324832`; TMDB find and four expanded movie/TV searches returned no candidates |
| 1710 | Sherlock Holmes: Mortal Fight (1980) | Exact installment identity verified; rating target deferred | TMDB movie/126850, IMDb `tt0229922`; needs individual installment support |
| 1711 | Sherlock Holmes: King of Blackmailers (1980) | Exact installment identity verified; rating target deferred | TMDB movie/126846, IMDb `tt0459944`; needs individual installment support |
| 1712 | Sherlock Holmes: Hunting the Tiger (1980) | Exact installment identity verified; rating target deferred | TMDB movie/126854, IMDb `tt0459945`; needs individual installment support |
| 1699 | Good Night, Little Ones! — Tatarskiy opening | Unresolved standalone opening identity | Do not substitute the whole programme or The Plasticine Crow |

There are **no new exact catalogue duplicates** in this batch. The two Dunno rows describe complementary parts, not duplicate source rows; their many-to-one resolution is explicit. The potentially overlapping Spellbinder provider records are held rather than added as competing whole-series rating targets.

After this catalogue addition, **six version rows and one opening remain deferred**. The previous four movie/TV overlaps are already resolved as aliases, and the 699 older reviewed matches are not missing works.

## Why Spellbinder remains held

The [Australian Children's Television Foundation](https://actf.com.au/shows/id/13) explicitly labels the 1997 production **Series 2 — Land of the Dragon Lord** and links the 1995 Series 1. The official TMDB receipt has TV/1455 with both 26-episode seasons. A separate TV/313262 carries the 1997 IMDb identity `tt0118476` but only one episode in that snapshot. Adding both as ordinary whole-series works would create overlapping scopes. Season-specific rating targets are the appropriate next implementation step; this does not require another owner clarification of the already distinct source entries.

## Unresolved sequel evidence

The [IMDb sequel record](https://www.imdb.com/title/tt4324832/) identifies the 1993 title separately from 1992's IMDb `tt0963997` / TV/65923. The new [read-only workflow](https://github.com/strannik-06/culture-atlas/actions/runs/39306362860) searched TMDB by the sequel IMDb ID and four title variants, in both media types, without candidates or lookup errors. The normalized receipt is committed as `imports/remaining-version-tmdb-evidence.json`. Missing TMDB identity is not an owner memory issue: retain the source row until a valid record or an approved alternative identity scheme is available.

## Review and later import

1. Review and merge the catalogue PR; wait for deployment.
2. Generate the separate private proposal:

   ```sh
   python3 scripts/prepare-dunno-tv-import.py --output /private/path/dunno-review
   ```

3. Review its single combined rating and import through **TV Series → Import TV ratings** in the owner's browser. The existing import skips existing ratings; the proposal disables the already completed Dekalog correction. No additional SQL migration is needed.

Starting from the previous expected total of 2,131 distinct ratings, a missing Dunno rating would add **one**, giving **2,132** (2,088 films + 44 TV), assuming no other edits. This is a forecast, not an independent production count.

The initial `prepare-reviewed-tv-import.py` still produces exactly its original 43 identities even as the catalogue grows. Historical `build-tv-version-audit.py` reproduces the earlier 43-work snapshot; it is not a current catalogue rebuild command and must not be used to overwrite later additions.

The remaining engineering work is season/installment rating support with explicit identity scope, without changing the 44 show keys or existing progress. No further viewing-scope decision is needed for this batch. The opening may need a future owner decision if no standalone identity becomes available; no replacement is proposed now.

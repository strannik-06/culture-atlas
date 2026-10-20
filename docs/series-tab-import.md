# Separate series-tab import and season ratings

Source: the latest uploaded workbook, `кино.xls(1).xlsx`, Library identity `libfile_07805bb5711c81918f551f23f9aedd73`, uploaded 15 October 2026. Only the `series` tab is included. The original workbook is unchanged. The current TV export supplied on 20 October has 51 ratings; it is used privately to reconcile this batch. Film export comparison remains a later step.

## Source audit

| Outcome | Rows |
| --- | ---: |
| New ratings | 92 |
| Existing scores preserved | 3 |
| Explicit owner-approved score correction | 1 |
| Unrated titles, catalogue only | 2 |
| Total source rows | 98 |

The tab contains 96 numeric ratings, including 74 explicit season entries, across 62 shows. Black Mirror and Love, Death & Robots have no score in this tab, so no rating is invented. This does not process the workbook's separate `black mirror` tab.

The three preserved ratings are Sherlock, Two and a Half Men, and The Queen's Gambit. The latter's explicit season 1 covers the same completed one-season miniseries already represented; no duplicate target/rating is added. The same one-season/miniseries identity rule applies to Ripley and The Penguin. Other season ratings remain separate even when a show currently has only one season.

The owner explicitly chose:

- Disclaimer: replace 7.0 with the series tab's 7.5. Existing notes, rating scope and viewing date are retained.
- Squid Game: retain its existing series-level 7.5 alongside independent season 1–3 scores. No averaging or replacement of the aggregate score.
- House of Cards, Lie to Me and How I Met Your Mother: the US versions (2013, 2009 and 2005).

Explicit coverage such as Fauda's first four seasons is retained in the imported notes and does not imply the user watched later seasons. The Lord of the Flies partial-viewing note is retained. Unknown viewing dates remain null. The Rick and Morty series-level score and its separate season scores coexist without inferring a wider viewing scope.

There are no unresolved identities or duplicate source rating targets. Public metadata/evidence files contain title identities and source references, not the private rating export or proposal.

## Verified metadata

The [read-only evidence run](https://github.com/strannik-06/culture-atlas/actions/runs/39421497934) resolved all 62 show identities and each requested season, with no lookup errors. The normalized receipt records TMDB show metadata, IMDb identity and individual season metadata. Reviewed IDs are pinned in `imports/series-tab-reviewed-identities.json`; runtime matching never relies on fuzzy search.

The catalogue gains 57 parent show identities and verified season targets. It now has 330 TV rating targets, including 224 season targets, rather than 330 separate shows. Unrated season metadata is not progress. All original 51 TV objects and all film catalogue records are unchanged. Existing multi-season metadata also supplies season choices for older TV works.

Regenerate metadata deterministically:

```sh
python3 scripts/build-series-tab-catalogue.py
node scripts/validate-work-catalog.mjs
```

The earlier final-source coverage summary remains pinned to its historical 51-target batch; later catalogue growth does not invalidate that audit.

## Rating series and seasons

Navigation is now **Films → TV Series → Books**. Series cards retain their series-level score and contain a collapsible season list with each season's independent score. In the editor, **Rate series or season** switches between the parent and verified seasons. Each target has separate stars, notes, viewing date and optimistic update version. A season score never replaces or creates an overall score. No average is calculated.

My ratings includes a parent card when at least one of its seasons is rated, even if the overall series is unrated. The Seasons filter still provides a flat season view. Existing standalone installment/opening cards and film aliases remain usable.

## One reviewed import

1. Merge the PR and wait for deployment.
2. Run the complete new `supabase/migrations/20261020_tv_reviewed_score_import.sql` after the already installed TV migrations. Installation changes no rating rows.
3. Reload Culture Atlas, open TV Series, and choose Refresh.
4. Import the private `culture-atlas-series-ratings.json`. Its preview should show 96 entries, 92 missing and four existing. It explicitly names the approved Disclaimer 7.0 → 7.5 correction. Confirm once.
5. Expect 143 TV ratings (51 + 92), assuming no intervening edits. If the film count remains 2,088, the combined total is 2,231. The four existing rows do not add to the count and the correction changes no count.

The v2 format is backward compatible with existing v1 imports. Ordinary existing rows are still skipped. Corrections use a separate authenticated, caller-privilege function: it locks the owner's rows, verifies the expected score and the exact update version captured at preview, calls the insert-only importer, then changes only approved score fields in the same transaction. A stale/deleted/different record or invalid input aborts everything. Existing notes, dates and scope are never replaced by a score correction. A repeated client import recognizes an already applied score and sends no correction; insert-only duplicates are skipped.

No Supabase write, credential access or account sign-in is performed by development tooling. The owner runs setup and confirms the import in their own browser. The completed Dekalog correction is disabled in this batch.

## Private preparation and validation

```sh
python3 scripts/prepare-series-tab-import.py \
  --source /private/path/series-normalized.json \
  --existing /private/path/culture-atlas-tv-ratings.json \
  --output /private/path/series-import
```

The source normalizer preserves spreadsheet row numbers, raw titles, scope markers, numeric scores and notes. Private output must be outside the repository. The private package contains a 98-row audit CSV, summary, 96-rating JSON, new SQL and concise setup instructions.

Tests cover series/season independence, parent visibility for season-only ratings, exact navigation order, explicit correction previews, stale-score/version rollback, unchanged notes/date/scope, cross-account RLS, v1 compatibility, miniseries deduplication and all historical import protections. The actual private 51-rating export and complete 96-row proposal are also run against the migrations locally to verify 92 inserts, one score correction, exact new scores/notes/scopes, 143 resulting TV ratings, unchanged prior rows otherwise, and no duplicate inserts on repeat.

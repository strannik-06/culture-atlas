# Remaining historical ratings: review boundary

**Current completion:** the final eight-rating batch resolves every remaining source identity. See [final audit and import instructions](remaining-version-audit.md); the counts below describe the earlier readiness snapshot.

Prepared after merged PR #89 (`ceb9024d3a34ebee574176418e6ac4355aa4dfa3`). This is an offline preparation step, with no Supabase access or rating writes.

## Catalogue follow-up

The completed [read-only TMDB lookup](https://github.com/strannik-06/culture-atlas/actions/runs/39279871694) verifies four more source identities:

| Source | Accepted work | Identity | Scope |
| --- | --- | --- | --- |
| 1595 | The Twentieth Century Begins | TV/261326, tt0091942 | Complete two-part miniseries; preserve source production year 1986 separately from first broadcast 1988 |
| 1656 | The Treasures of Agra | TV/261323, tt0086333 | Complete two-part miniseries |
| 1690 | The Hound of the Baskervilles | TV/261313, tt0083100 | Complete two-part miniseries |
| 1824 | Scenes from a Marriage | Film 2253, movie/133919, tt6725014 | 169-minute theatrical edit, 1974; source year 1973 retained |

The existing 2,251 film objects and IDs are preserved, and one film is appended. Total: 2,252 films and 43 TV works. Equivalent movie/TV provider records are not both added. Part-only Sherlock Holmes records are rejected for the three whole-work ratings.

Expanded Russian/English TV and movie searches found only the full twelve-episode Dunno on the Moon, TV/99952, for both source parts. No standalone second-part record was found in this lookup. The owner's conditional combined-identity fallback is recorded, but both part ratings remain separate and held. A combined rating has not been chosen.

Twelve entries remain held in the TV/version audit: four existing-film overlaps, three named Sherlock installments, two Spellbinder parent/season cases, two Dunno parts and Hearts of Three 2. The separate Good Night, Little Ones! opening also remains unresolved. These do not block importing independently verified films.

## Offline film preview

`scripts/prepare-reviewed-ratings.py` joins the complete reviewed ledger to the original cleaned source, groups only accepted movie identities and preserves half-point ratings and notes. It does not re-run title matching or the obsolete current-year quarantine: owner-confirmed 2026 ratings are treated like all other years.

| Outcome before a current progress export | Count |
| --- | ---: |
| Normalized source entries | 2,150 |
| Film identity groups represented by eligible source entries | 2,083 |
| Film groups awaiting current progress comparison | 2,081 |
| Groups with unresolved differing source ratings | 2 |
| TV or unresolved source entries excluded from film import | 56 |

These are source coverage counts, **not missing-rating counts**. The two remaining source conflicts are No Reservations (867 / 875) and Four Rooms (1419 / 1421). Identifying the same film does not settle which historical score to use. They stay excluded. Existing explicit staging decisions for The Croods, Mr. Nobody and The King of Kong are reused only when the exact two-score source set still agrees with the recorded decision. All source scores remain in the private report.

Spirits of the Dead is linked to existing film 2178, with the previously approved 7.5 source score. Its eligibility for insertion still depends on the current progress comparison.

## Required current snapshot

The older `existing-catalog-progress-audit (2).csv` is an 84-row audit subset from October 15, not a complete current progress export. It cannot establish absence for the remaining films. No missing count is inferred from the earlier total of 2,013 saved ratings.

Export the **complete current owner's rows** from `public.film_progress`, filtered to the account used by Culture Atlas. Include `film_id`, `watched`, `rating`, `notes` and `watched_date`; `user_id` may be retained or omitted after filtering. Check that the export includes every page. Keep this personal file private; no credentials or service-role key are required.

```sh
# Catalogue/source-only preview; no database access.
python3 scripts/prepare-reviewed-ratings.py --output /private/path/rating-review

# Offline comparison after supplying the complete current owner export.
python3 scripts/prepare-reviewed-ratings.py \
  --progress /private/path/film-progress.csv \
  --output /private/path/rating-review
```

Reports must be outside the repository. The tool records input hashes and rejects duplicate progress IDs, multiple users, invalid scores and canonical identity drift. It cannot prove export completeness or freshness; those must be confirmed before an import. An empty or partial export must never be used to approve writes.

The comparison separates missing insert candidates, matching existing progress and conflicting existing progress. **Any existing progress row is excluded from insertion**, including watched-only rows with no rating. Existing ratings, notes and dates are never overwritten. Historical watched dates remain null for new rows; no dates are invented.

Review the exact missing-only payload after reconciliation, then obtain explicit approval before an import. The eventual write must enforce insert-only behavior at the database boundary and recheck for new rows immediately before writing; this PR contains neither SQL writes nor an importer. TV rating storage/display remains a separate implementation task.

## Validation

```sh
python3 scripts/build-tv-version-audit.py --check
python3 -m unittest discover -s tests -p 'test_reviewed_ratings.py'
node scripts/validate-catalog.mjs
node scripts/validate-work-catalog.mjs
node --test tests/work-identities.test.mjs
git diff --check
```

# TV and version identity audit

This batch reviews all **56 deferred TV/version source entries** from merged PR #88 and adds **43 verified TV catalogue identities** and the owner-confirmed theatrical Scenes from a Marriage (film 2253). The 2,251 existing film records, numeric IDs and film progress are unchanged. Combined catalogue identities: **2,295 works**. See the [remaining rating preparation](remaining-ratings-readiness.md). No Supabase data or ratings were read or written.

This is the first catalogue/identity phase of the [film/TV architecture](film-tv-catalogue-architecture.md). It adds TV records and pure cross-media identity helpers, plus validation and tests. **TV browsing, account storage and rating imports are not activated.** No changes to index.html or the current film sync path are included.

## Live evidence and decisions

The repository's existing TMDB credentials were used by a read-only GitHub Actions workflow to fetch TV search results, external identifiers, details, creator/director credits and seasons. The [successful final lookup](https://github.com/strannik-06/culture-atlas/actions/runs/39279871694) ran at commit recorded in [the metadata evidence](../imports/tv-version-56-tmdb-evidence.json). The metadata-only results were recovered from the job logs with per-source JSON records; an artifact is also retained by the workflow. No personal rating, notes, watched dates or critic-rating payloads are collected.

The lookup is a candidate collector, not an approval algorithm. [All 56 reviewed decisions](../imports/tv-version-56-reviewed-identities.csv) identify accepted records and explain the held alternatives. The 43 TV catalogue records each have a verified TMDB TV identity and an IMDb ID. These are work identities, not confirmation that every source rating covers all current or future seasons.

One lookup error is retained: a movie ID returned while resolving Guest from the Future, movie/37452, returned HTTP 404. It is never used as a target. The valid TV/5904 and existing film/20894 records share IMDb tt0086723 and are held for cross-media handling instead.

Notable rejected candidates:

- Source 673, Sherlock: old movie/43956 is **Tom and Jerry Meet Sherlock Holmes**. The reviewed TV identity is **TV/19885**, IMDb tt1475582.
- Source 1057, The Idiot: old movie/1536386 is an unrelated theatre recording with different directors. Bortko's series is **TV/68187**, IMDb tt0366028.
- Source 952, The Master and Margarita: **TV/6395** is Bortko's 2005 series. The Yuri Kara work, also represented by existing movie ID 2208, is a separate identity and is not substituted.
- Source 1570, Naval Cadets, Charge!: the API exposes both TV/43090 and movie/63536 with the same IMDb ID. Only the four-part TV identity is added; a second movie target is not created.
- The Squid Game reality competition and an unrelated same-title Disclaimer are excluded by work/creator identity.

The source director can be an episode director rather than the series creator. Creators and directors therefore remain separate arrays with TMDB person IDs. Some API director lists are incomplete; missing credits are not invented. For Well, Just You Wait!, [public series credits](https://www.vokrug.tv/product/show/nu_pogodi/) include source director Yuriy Butyrin even though the API lists only Vyacheslav Kotyonochkin. The explicit source label is the animated series; it is not reinterpreted as a separate pilot.

## Added TV works

Display years follow the first-air-date snapshot. Original production years remain unchanged in the source ledger. `series_kind` uses the provider's Miniseries type, known miniseries classification for Naval Cadets and Berlin Alexanderplatz, or multi-season series evidence. A single-season Scripted type alone does not prove a miniseries; those cases use `unknown`.

| Source row | TV work | Canonical key | Kind |
| --- | --- | --- | --- |
| 108 | Disclaimer (2024) | `tv:147050` | miniseries |
| 209 | Squid Game (2021) | `tv:93405` | series |
| 228 | The Queen's Gambit (2020) | `tv:87739` | miniseries |
| 259 | House Arrest (2018) | `tv:81712` | unknown |
| 275 | Call DiCaprio! (2018) | `tv:83344` | miniseries |
| 306 | Maniac (2018) | `tv:73411` | miniseries |
| 355 | Crisis in Six Scenes (2016) | `tv:67443` | miniseries |
| 372 | The Young Pope (2016) | `tv:62699` | miniseries |
| 390 | Method (2015) | `tv:64446` | series |
| 511 | Sherlock Holmes (2013) | `tv:64368` | unknown |
| 559 | The Kitchen (2012) | `tv:45994` | series |
| 673 | Sherlock (2010) | `tv:19885` | series |
| 687 | Агент особого назначения (2010) | `tv:86869` | series |
| 843 | Californication (2007) | `tv:1215` | series |
| 890 | Our Russia (2006) | `tv:30729` | series |
| 952 | The Master and Margarita (2005) | `tv:6395` | miniseries |
| 1057 | The Idiot (2003) | `tv:68187` | miniseries |
| 1094 | Two and a Half Men (2003) | `tv:2691` | series |
| 1143 | Brigada (2002) | `tv:30877` | unknown |
| 1222 | Banditskiy Peterburg: Advokat (2000) | `tv:334721` | unknown |
| 1235 | Attila (2001) | `tv:16072` | miniseries |
| 1295 | D.D.D. Detective Dubrovsky's Dossier (1999) | `tv:94974` | miniseries |
| 1479 | The Hearts of Three (1992) | `tv:65923` | miniseries |
| 1517 | Twin Peaks (1990) | `tv:1920` | series |
| 1532 | Dekalog (1989) | `tv:42699` | miniseries |
| 1570 | Naval Cadets, Charge! (1988) | `tv:43090` | miniseries |
| 1595 | The Twentieth Century Begins (1988) | `tv:261326` | miniseries |
| 1607 | In Search of Captain Grant (1985) | `tv:65484` | miniseries |
| 1624 | The Return of the Prodigal Parrot (1984) | `tv:99974` | unknown |
| 1625 | The Octopus (1984) | `tv:12822` | series |
| 1656 | The Treasures of Agra (1983) | `tv:261323` | miniseries |
| 1690 | The Hound of the Baskervilles (1981) | `tv:261313` | miniseries |
| 1716 | Berlin Alexanderplatz (1980) | `tv:43189` | miniseries |
| 1722 | The Adventures of the Electronic (1980) | `tv:65518` | miniseries |
| 1724 | The Meeting Place Cannot Be Changed (1979) | `tv:75182` | miniseries |
| 1742 | D'Artagnan and Three Musketeers (1979) | `tv:76829` | miniseries |
| 1771 | The Twelve Chairs (1977) | `tv:44210` | miniseries |
| 1793 | The Adventures of Buratino (1975) | `tv:279648` | miniseries |
| 1796 | Leopold the Cat (1975) | `tv:43624` | unknown |
| 1809 | The Bronze Bird (1975) | `tv:308436` | miniseries |
| 1832 | Kortik (1974) | `tv:308435` | miniseries |
| 1834 | The Adventures of Munchausen (1973) | `tv:72562` | series |
| 1895 | Well, Just You Wait! (1969) | `tv:6138` | unknown |

The owner's confirmations are preserved explicitly:

- **Декалог:** the rating covers the whole ten-part cycle, TV/42699, IMDb tt0092337. It does not map to existing film 1920 (Decalogue V) or A Short Film About Killing.
- **Гардемарины, вперед!:** the rating covers the whole four-part miniseries, TV/43090, IMDb tt0125111. Source production year 1987 and first broadcast 1988 remain distinguishable.

No further scope confirmation is needed for either work. Creating their catalogue identities does not authorize importing their ratings.

## Twelve source entries still held

These are not twelve missing films. Four already overlap with canonical movie records; other cases concern individual episodes, edit versions or provider parent/season inconsistencies. No held row receives an active new TV target.

| Source row | Source entry | Reason / next step |
| --- | --- | --- |
| 1276 | Незнайка на Луне 2 | Owner confirms separate part ratings. Expanded Russian/English movie and TV searches found only the same complete 12-episode TV/99952, IMDb tt0219207, and no standalone part-2 identity. A combined identity is a permitted fallback for review, but neither part rating is promoted to the parent or combined automatically. |
| 1359 | Незнайка на Луне | Owner confirms separate part ratings. Expanded Russian/English movie and TV searches found only the same complete 12-episode TV/99952, IMDb tt0219207, and no standalone part-2 identity. A combined identity is a permitted fallback for review, but neither part rating is promoted to the parent or combined automatically. |
| 1371 | Чародей: Страна Великого Дракона (сериал) | Dragon Lord has a separate IMDb identity, but TV/1455 includes the 1997 story as season 2 while TV/313262 is an incomplete one-episode duplicate. Resolve the parent/season model before creating competing work records. |
| 1416 | Чародей (сериал) | TMDB/1455 currently combines 1995 and 1997 stories into two seasons. Preserve the two source ratings; do not silently map both to one show. |
| 1457 | Сердца трёх 2 | No safe standalone TMDB identity for the source Hearts of Three 2 was found. Do not substitute the five-part 1992 series. |
| 1618 | Гостья из будущего (мини-сериал) | TV/5904 and existing film 1955 share IMDb tt0086723. Same work already represented; preserve the film ID and any progress pending a reviewed cross-media migration or alias strategy. |
| 1639 | Доктор Айболит (мультсериал) | TV/69135 and existing film 1967 share IMDb tt0218940. Do not add a second canonical rating target. |
| 1710 | Шерлок Холмс и доктор Ватсон: Смертельная схватка | Named Mortal Fight installment is identified as movie/126850, but is part of the Soviet Sherlock Holmes TV cycle. Initial TV model is show-level only; no episode rating target is created. |
| 1711 | Шерлок Холмс и доктор Ватсон: Король шантажа | Named King of Blackmailers installment is identified as movie/126846. Preserve the episode scope; do not promote its rating to the whole TV cycle. |
| 1712 | Шерлок Холмс и доктор Ватсон: Охота на тигра | Named Hunting the Tiger installment is identified as movie/126854. Preserve the episode scope; do not promote its rating to the whole TV cycle. |
| 1780 | Приключения капитана Врунгеля (мультсериал) | TV/80706 and existing film 2016 share IMDb tt0219263. The source production year 1976 differs from broadcast 1980; preserve existing progress and identity until cross-media handling is reviewed. |
| 1853 | Большая перемена (мини-сериал) | TV/85252 and existing film 2047 share IMDb tt0068304. Same work, different provider media classification; preserve current progress. |

The decision list preserves source row 1479's five-part Hearts of Three identity, but never assumes that it resolves the separate Hearts of Three 2 entry. Likewise, the two Dunno rows and two Spellbinder rows keep separate source ratings and are not consolidated.

The [owner clarification record](../imports/tv-version-owner-clarifications.json) resolves the scope questions:

| Sources | Owner-confirmed scope | Catalogue action |
| --- | --- | --- |
| 1276 / 1359, Незнайка на Луне 2 / Незнайка на Луне | Part 2 / part 1, rated separately | Lookup found only the whole twelve-part TV parent. A combined identity remains a permitted fallback for review; both ratings stay separate. |
| 1625, Спрут | Wider series | Add `tv:12822`, IMDb tt0086779. |
| 1824, Сцены из супружеской жизни | Theatrical edit | Add theatrical movie/133919 as film 2253; reject the six-part TV candidate. |
| 1595 / 1656 / 1690, named Sherlock Holmes works | Both parts together for each title | Add TV/261326, TV/261323 and TV/261313 respectively; reject single-part targets. |

No further owner scope decision is needed for these entries. The completed lookup verifies the three two-part miniseries and the theatrical Scenes from a Marriage. Dunno has no standalone second-part identity in the expanded search; the conditional combined-identity fallback is recorded without merging ratings.

The remaining Spellbinder provider split, Hearts sequel identity and cross-media migration are research/model tasks, not permission requests to overwrite ratings.

## Identity contract and source coverage

The existing film IDs stay numeric and continue to use the current app's film_progress path. New shared lookups require an explicit work key:

| Identity | Example | Meaning |
| --- | --- | --- |
| Film work key | `movie:1920` | Existing internal film ID 1920, Decalogue V |
| TV work key | `tv:1920` | TMDB TV ID 1920, Twin Peaks |
| External lookup | `(movie, tmdb_id)` or `(tv, tmdb_id)` | Both the media type and external ID are mandatory |

The TV `id` is already namespaced, e.g. `tv:42699`; it is not allocated from the film integer sequence. The helper does not change any stored film ID or convert existing film progress. It rejects duplicate work keys, duplicate external IDs within one media type, and duplicate IMDb identities across movie/TV records. TV keys must never be passed to film_progress. A separately reviewed future storage plan is required before TV progress is implemented.

The TV catalogue is intentionally not loaded into the film-only browser or account sync. Future TV navigation can consume the shared registry after its storage behavior is designed.

| Current source outcome | Entries |
| --- | ---: |
| Present movie links | 2,082 |
| Present TV catalogue links | 43 |
| Repeated movie identity | 10 |
| Consolidated movie identity | 2 |
| Deferred TV/version entries | 12 |
| Unresolved standalone opening | 1 |
| **Total normalized source entries** | **2,150** |

The opening sequence remains Tatarskiy's 1981 Good Night, Little Ones! opening (source 1699). The 699-link review and the source confirmations for Mikhalkov's 12 and the theatrical Turkish Gambit remain preserved.

## Reproduction and review boundary

Baseline: merged PR #88, `e3316643f3aa5200afe5451710b8661a6f1b51bf`.

- [Latest complete source ledger](../import-previews/tv-version-source-catalogue-ledger.csv)
- [Summary, provenance and hashes](../import-previews/tv-version-56-summary.json)
- [Reviewed 56-row decisions](../imports/tv-version-56-reviewed-identities.csv)
- [Live API evidence](../imports/tv-version-56-tmdb-evidence.json)
- [TV catalogue](../tv-catalog.js)

```sh
python3 scripts/build-tv-version-audit.py --check
node scripts/validate-catalog.mjs
node scripts/validate-work-catalog.mjs
node --test tests/work-identities.test.mjs
git diff --check
```

The audit builder requires the pinned baseline commit, preserves all source metadata, verifies the 43 accepted TV IDs and theatrical film against the saved live evidence, checks cross-media IMDb overlaps and requires all 2,251 baseline film objects and IDs to remain unchanged, allowing only the explicitly verified theatrical film addition. `--check` performs no file writes. Historical PR #87/#88 ledgers remain reproducible snapshots; this audit writes a new current ledger.

Stop for PR review. No Supabase migration, database access, rating payload, rating overwrite or TV progress implementation is included. A rating conflict report and explicit import approval remain separate steps.

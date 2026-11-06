# Film awards and festivals 2001–2005

Thirty editions extend the six existing film awards/festivals through 2001. Edition years remain ceremony/festival years; premiere years remain attached to catalogue works. Every nomination/selection, nominated person, winning entry and source URL is retained in the normalized event evidence.

| Event | Historical scope | Records |
| --- | --- | ---: |
| Oscars | Eleven established major feature categories where available | 264 |
| BAFTA | Ten established major feature categories available in these years | 252 |
| Golden Globes | Eleven established major feature categories available in these years | 284 |
| Cannes | Main Competition and feature Un Certain Regard | 212 |
| Venice | Main Competition and historical second feature competition | 197 |
| Berlinale | Main Competition | 113 |

The batch contains 1,322 nomination/selection records. Award-source files are `imports/{event}-2001-2005-source.json`. The combined identity audit and reviewed crosswalks are `imports/film-awards-2001-2005-{audit,overrides}.json`.

## Historical categories and sections

Oscar Animated Feature was introduced in the 2002 ceremony: 2001 has ten included categories, subsequent years eleven. Its nominee counts are 3, 5, 3 and 3 for 2002–2005. Best Picture has five nominees in each year. BAFTA Documentary and Animated Film were not awarded during this batch; neither is substituted with a shorts category. BAFTA 2004 retains six Leading Actor and six non-English-language film nominations, including distinct Sean Penn performances. Golden Globes animation was introduced later, in 2007. Historical six-nominee categories and shared screenplay credits remain intact.

Venice's second feature competition is shown under its contemporary name: Cinema del Presente (2001), Controcorrente (2002–2003), Orizzonti (2004–2005). Main Competition remains first. Special events, out-of-competition screenings, shorts, independent parallel sections and honorary/collateral prizes are excluded. The official ASAC API used by the archive UI supplies selections, directors, runtimes, dates and jury prizes.

Berlinale retains 23, 23, 22, 23 and 22 actual competing features, respectively. The official archive's competition tags exclude separate out-of-competition screenings. Source count checks prevent including those screenings as nominees. The contemporary [2001 official press dossier](https://www.berlinale.de/media/download/presse/dossier/51ifb/pressedossier_2001.pdf) and [2003 final competition release](https://www.berlinale.de/media/download/presse/pressemitteilungen/53_berlinale/37_pressrelease_competition_section_22_01_03.pdf) provide additional scope checks.

Cannes' official retrospective supplies the final actual Main Competition and Un Certain Regard selections. Two UCR shorts, **Just the Two of Us** (2001, 27 minutes) and **Yellow Fella** (2005, 25 minutes), remain documented as excluded short selections. The 2001 short-film jury award for **Daddy's Girl**, incorrectly grouped under feature laureates on the retrospective awards page, is excluded using the official short-film selection as evidence.

## Source repairs and reviewed identities

- Golden Globes 2001 contains an empty Best Actress nomination and a misplaced Tilda Swinton record. The missing record is restored to Björk in **Dancer in the Dark**, supported by the [official Globes retrospective](https://goldenglobes.com/articles/vintage-cannes-2000-year-bjork/). The duplicate Swinton record belongs to **The Deep End** in 2002, confirmed by the [official film record](https://goldenglobes.com/film/deep-end-the/) and the 2002 annual database. Original record IDs and reasons are retained in `source_corrections`.
- Cannes incorrectly credits Bruce Brown as co-director of **The Son**. [Sony Pictures Classics](https://www.sonyclassics.com/theson/) identifies Jean-Pierre and Luc Dardenne. The source archive credit is preserved; matching verifies the reviewed directing pair.
- Cannes credits **Cry Woman** to “Yuanjian Liu”. [KVIFF](https://www.kviff.com/en/programme/film/44/18118-cry-woman) and [IFFR](https://iffr.com/en/iffr/2003/films/cry-woman) identify Liu Bingjian and the same title, synopsis, year and cast. The correction is explicit in the reviewed override.
- **In the Mood for Love** uses the complete feature identity, excluding a separate 51-minute documentary. **Va Savoir** uses the selected feature identity, excluding the separately indexed 223-minute extended version. Duplicate provider records are never treated as separate nominated films.
- Bilingual BAFTA compound titles, international release titles, filmmaker transliterations and performer name variants are recorded explicitly. Examples include Salma Hayek/Salma Hayek Pinault, Ziyi Zhang/Zhang Ziyi and William Macy/William H. Macy. IMDb pins aid discovery and still require full provider title, director/credit, runtime and release-window verification.
- Where provider runtime is zero, a documented official festival runtime supplies the missing value. It does not replace existing curated metadata. **Marock** uses Cannes' 102-minute runtime.

## Dates and preservation

Date metadata is separate from award selection data. Official ceremony/film-archive records supply Oscar, Venice and Berlinale dates. Explicit Wikipedia edition references supply BAFTA, Golden Globes and Cannes date fields where their results archives omit date ranges; these sources are visible in the date component and are not represented as primary nomination evidence.

Baseline fingerprints protect every previously merged catalogue identity, detail record and award edition. Registration SQL is repeatable, insert-only and conflict-guarded. No personal ratings, notes or viewing history are written by preparation or registration.

The prior 2006–2010 batch was registered after PR #128 merged: 638 catalogue rows and 637 provider links, zero identity mismatches. Film, TV and book progress checksums remained unchanged. Live registration for this batch is deferred until this PR is merged.

## Completed identity and metadata audit

Final source-count reconciliation restores the 2004 Orizzonti feature Ambassadors Seek Country (ASAC omits its runtime); the provider verifies its complete feature identity. Final identity totals follow generation. The baseline catalogue contains 4,681 films; award history grows from 126 to 156 editions. Every previously resolved new entry has a production year, synopsis and cover.

Five missing provider covers are supplied from reviewed public film sources: Cannes release artwork for A Dog's Day and September, the cinematographer's official Tirana Year Zero still, Casablanca's Lilly's Story release poster, and the archived Temptations theatrical poster cross-checked against the Berlinale film identity. Source URLs and original image URLs are retained in `imports/film-awards-2001-2005-cover-sources.json`. Covers apply only to this batch's appended verified IDs.

Validation compares all 30 editions with the normalized sources, checks historical category introductions and the shared 2002 Golden Bear, fingerprints all previously merged records, and executes registration twice in an isolated test database. The SQL preserves curated metadata and progress and aborts on provider conflicts. Final CI and Chromium review cover date visibility, winner filters, navigation, refresh and mobile layout.

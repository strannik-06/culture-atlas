# Venice 2016–2020: source audit

The source covers Venezia Competition and the feature-film Orizzonti Competition, following the existing 2021–2025 scope. Jury prizes annotate selected films; shorts, special screenings, other sections, honorary and collateral prizes are excluded.

| Edition | Venezia Competition | Orizzonti Competition | Included prize records | Festival dates |
|---|---:|---:|---:|---|
| 2016 | 20 | 18 | 15 | 31 August–10 September |
| 2017 | 21 | 19 | 15 | 30 August–9 September |
| 2018 | 21 | 19 | 15 | 29 August–8 September |
| 2019 | 21 | 19 | 14 | 28 August–7 September |
| 2020 | 18 | 19 | 15 | 2–12 September |
| Total | 101 | 94 | 74 | |

## Official evidence

For 2017–2020, selections come from La Biennale's final section pages; each film retains its individual official URL, director, title aliases and runtime. Prizes come from the official announcements:

- https://www.labiennale.org/en/news/official-awards-74th-venice-film-festival
- https://www.labiennale.org/en/news/official-awards-75th-venice-film-festival
- https://www.labiennale.org/en/news/official-awards-76th-venice-film-festival
- https://www.labiennale.org/en/news/official-awards-77th-venice-film-festival

The legacy 2016 section URLs are retired. The official ASAC archive supplies the annual section membership, all official prizes and every individual film's title, director and runtime: https://asac.labiennale.org/attivita/cinema/annali?anno=2016 . The annual page loads its records through its own public `/api/ricerca-semplice` endpoint using `callIndex: annali_cinema` and `callBody: {query: {match: {anno: 2016}}}`. Individual film records are publicly rendered at the source URLs stored in the JSON.

Dates are recorded with official festival-page sources in every event. The 2016 dates also appear in La Biennale's [Recent years](https://www.labiennale.org/en/history/recent-years) history. The 2019 prize announcement introduction mistakenly says “Saturday 8th September”; the festival page confirms Saturday **7 September 2019**, which is the date retained in the source.

## Historical scope details

- The 2016 ASAC archive explicitly classifies *Dark Night* as “Orizzonti - Proiezione Speciale”, separate from its 18 competing features. It is excluded. The widely quoted 19 Orizzonti features include this special screening.
- The 2016 Silver Lion for Best Director was shared by Amat Escalante (*La región salvaje*) and Andrey Konchalovskiy (*Ray/Paradise*); both recipients remain represented.
- Lion of the Future is included for *Custody* (2017), *The Day I Lost My Shadow* (2018) and *Listen* (2020). The 2016 and 2019 winners belong to parallel sections and are excluded.
- Official source spelling is preserved. Archive/provider credit variants requiring identity review include Andrey Konchalovskiy/Andrei Konchalovsky, Jessica Hope Woodworth/Jessica Woodworth and Bing (III) Wang/Wang Bing. The 2017 source's Manetti Bros. is an aggregate director credit; provider identities must verify the two brothers rather than accepting title alone.

The JSON stores normalized factual records and a source URL for every film and event. It does not modify private ratings or live database rows.

# Historical 55 identity audit — catalogue proposal after PR #85

## Result and boundary

**54 verified movie additions; zero existing identity duplicates; one TV miniseries held.** The owner confirmed source row 1377 as Double Tap (1997) on October 19. Six earlier deferrals are now verified; the seventh belongs in the TV workflow.

Catalogue: **2,177 → 2,231** records. Append IDs **2179–2232**, above the existing maximum 2178. All baseline catalogue records and the first 47 proposed additions retain their values and IDs. This PR contains no rating-import payload, database operation, migration, workflow change or personal notes. Supabase was neither read nor modified. The owner's reported 2,013 ratings was not independently queried.

Spirits of the Dead is already canonical ID **2178** / TMDB **41225**. Its pending historical rating remains for a separate approved import after catalogue review; existing ratings must not be overwritten.

## Evidence and verification

- Base: `b657cfaf13a110b8508985e7e3b8f69af6ff2446` (merged PR #85).
- The initial 47 additions use the saved October 15 `historical-55-tmdb-candidates.zip` evidence. `imports/historical-48-tmdb-evidence.csv` preserves exactly the 48 originally selected results, **including the rejected Point Blank mapping**, as an immutable historical snapshot.
- Original source CSV SHA-256: `0c867f1eec63eda728d3ddac4e7d1dcd3997c81f0a43fb88338d926517040ba7`.
- [`historical-55-followup-evidence.json`](../imports/historical-55-followup-evidence.json) records the October 19 correction and six resolved deferrals, with per-work evidence URLs and explicit provenance. TMDB detail web/API refresh was unavailable; current cross-references must not be presented as fresh API detail results. `tmdb_release_year` in the audit is therefore left blank for new rows without stored TMDB details; independently verified year is in `catalogue_year`.
- `historical-55-reviewed-matches.csv` is the current decision ledger. Corrected IDs also replace bad or missing `known_tmdb_id` values in the read-only movie-verification input, so a future TMDB rerun uses exact identities. Original source years remain intact.
- Matched source rows, title/original-title translations, transliterated/reversed director names, year exceptions, TMDB and IMDb identities. Compared all accepted identities against the 2,177 baseline records, against one another, and against normalized display/original titles; no identity duplicates.
- Retain TMDB Director-job credits for the initial batch, not source producer labels. Animation credits can omit co-director jobs or include sequence directors. The additional records use the cited work's named director.

## Corrected identity and resolved deferrals

| Source row | Proposed ID | Correct identity | TMDB movie | IMDb | Resolution |
| --- | --- | --- | --- | --- | --- |
| 1377 | 2226 | Double Tap (1997), Greg Yaitanes | 213439 | tt0119012 | Owner confirmed Double Tap (1997) on 2026-10-19. Replaces incorrect Point Blank / Matt Earl Beesley / TMDB 56125; title, director, year and IMDb/TMDB crosswalk agree. |
| 785 | 2227 | Dolls (2002), Takeshi Kitano | 870 | tt0330229 | Correct Kitano film, not Stuart Gordon Dolls (1987). Source year 2008 is not release year; festival and linked identities identify 2002. |
| 809 | 2228 | To the Sea! (2009), Yaroslav Chevazhevsky | 63540 | tt1366920 | Original Russian title and director identify Na more!/To the Sea! (2009), not Alamar. Source 2008 is production-year attribution; January 2009 theatrical release retained. |
| 926 | 2229 | Khottabych (2006), Pyotr Tochilin | 57775 | tt0466043 | Tochilin film of 2006; stylized source title }{отт@бь)ч is an alias. Not Old Khottabych (1956), Hottabych and His Team (2016), or later adaptation. |
| 1096 | 2230 | Private (2003), Tinto Brass | 30287 | tt0372909 | Stored October 15 rank-2 detail result explicitly gives original_title Fallo!, Tinto Brass, 2003 and IMDb tt0372909; current alias listing independently confirms Private/Fallo! is the same work. |
| 1472 | 2231 | Naval Cadets III (1992), Svetlana Druzhinina | 63538 | tt0135427 | Original source is Gardemariny 3 (1992), not Vivat, Midshipmen! (1991). Confirmed feature/movie identity movie/63538; broadcasts may be split into two parts, but this record represents the whole third film. |
| 1502 | 2232 | All Ladies Do It (1992), Tinto Brass | 37265 | tt0104014 | Tinto Brass live-action film, release 1992 versus source 1991. Replaces incorrect Stephen Medcalf opera film TMDB 267111; official TMDB search/watch link and IMDb/Letterboxd identify movie/37265. |

Evidence for these corrections:

- **Double Tap:** owner confirmation plus [Wikidata ID crosswalk](https://www.wikidata.org/wiki/Q1148174) and [Cinegraph title/director/IMDb/TMDB record](https://cinegraph.org/movies/double-tap-1997). Reject Point Blank / Matt Earl Beesley / movie 56125 entirely; it is not added or linked to this source.
- **Dolls:** [Viennale festival programme](https://www.viennale.at/en/films/dolls) identifies Takeshi Kitano and 2002; [Wikidata](https://www.wikidata.org/wiki/Q260208) pairs movie 870 with tt0330229; [Letterboxd](https://letterboxd.com/film/dolls-2002/) agrees. Original source year 2008 does not identify a different Kitano Dolls film.
- **To the Sea!:** [Wikidata](https://www.wikidata.org/wiki/Q4310981) pairs movie 63540 with tt1366920; [Letterboxd](https://letterboxd.com/film/to-the-sea/) gives the original title, director and January 2009 theatrical release; [broadcaster Dom Kino](https://www.domkino.tv/announce/11741) also identifies the 2009 film. Source production year 2008 is preserved in the audit. Not the unrelated Mexican Alamar.
- **Khottabych:** [Wikidata](https://www.wikidata.org/wiki/Q1968484) pairs movie 57775 with tt0466043; [Letterboxd](https://letterboxd.com/film/khottabych/) confirms Tochilin, 2006 and the stylized title alias. The [IMDb record](https://www.imdb.com/title/tt0466043/) distinguishes it from other adaptations.
- **Private/Fallo!:** stored October 15 rank-2 TMDB detail evidence gives original title Fallo!, Brass, 2003, movie 30287 and tt0372909. [Letterboxd alias/crew record](https://letterboxd.com/film/private-2003/) and [Wikidata](https://www.wikidata.org/wiki/Q3738711) corroborate it.
- **Naval Cadets III:** [Wikidata](https://www.wikidata.org/wiki/Q4133646) pairs movie 63538 with tt0135427; [Letterboxd](https://letterboxd.com/film/naval-cadets-iii/) confirms Гардемарины III, 1992 and Druzhinina. This is the whole third film, including its multipart television presentation; it has a movie identity. The original source says Гардемарины 3, so the earlier Vivat query was wrong. Do not confuse it with the first four-part miniseries below.
- **All Ladies Do It:** [TMDB's indexed movie/watch URL](https://www.themoviedb.org/movie/37265-cosi-fan-tutte/watch), [IMDb](https://www.imdb.com/title/tt0104014/) and [Letterboxd](https://letterboxd.com/film/all-ladies-do-it/) identify the 1992 Brass film and Così fan tutte alias. Movie 267111 is a different opera production and must not be used.

## Remaining decision / TV hold

**Source row 1570, Гардемарины, вперед!** is identified as Svetlana Druzhinina's four-part miniseries, [Midshipmen, Onwards! / IMDb tt0125111](https://www.imdb.com/title/tt0125111/), produced in 1987 and broadcast in 1988. Its identity is no longer an unknown movie. It remains held because the repository's [film/TV architecture](film-tv-catalogue-architecture.md) requires miniseries to remain in TV rather than receive movie IDs.

Owner clarification useful before future TV progress import: does the original historical rating cover **the entire four-part miniseries**, rather than one episode or a film-length edit? This does not block the 54 movie additions. No TV ID, canonical movie ID or rating-import mapping is invented for it. TV catalogue implementation remains separate.

## Year and media-type handling

Use the TMDB snapshot release year by default, preserving the source year in the audit. A source year difference alone does not imply a different film when title/original title, director and external identity agree. This batch does not introduce a global production-year policy.

Three explicit, documented catalogue-year overrides use authoritative studio/distributor records: Blood Simple **1984** (snapshot 1985, source 1983), Tears Were Falling **1982** (snapshot 1983), Snow White and the Seven Dwarfs **1937** (snapshot 1938). Evidence:

- [Criterion's director-approved Blood Simple edition](https://www.criterion.com/films/28852-blood-simple) identifies 1984 and credits Joel Coen as director, Ethan as producer/co-writer. [Composer Carter Burwell](https://www.carterburwell.com/projects/Blood_Simple.html) separately identifies the US release as January 1985. This explains the TMDB date without inventing another identity.
- [Mosfilm's Tears Were Falling record](https://www.mosfilm.ru/cinema/films/slezy-kapali/) gives 1982 and Georgiy Daneliya.
- [Walt Disney Animation](https://disneyanimation.com/films/snow-white-and-the-seven-dwarfs/) gives December 21, 1937 for Snow White.
- [Sony Pictures Classics' Before Midnight materials](https://www.sonyclassics.com/beforemidnight/site/) identify the preceding Before Sunset as 2004. The source's 2024 is not used as the film year.
- [Universal/Illumination's Despicable Me 3 announcement](https://www.prnewswire.com/news-releases/illumination-and-universal-pictures-present-the-world-premiere-of-despicable-me-3-300476259.html) credits Coffin and Balda as directors and source-named Eric Guillon as co-director. This resolves the source credit difference.

Other substantial year differences are explicit in the row audit: Interstate 60 (source 2011 → 2002); Troy (2006 → 2004); Kara's The Master and Margarita (production/source 1994 → TMDB release 2011); There Once Was a Singing Blackbird (1972 → 1970); Trial on the Road (production/source 1971 → snapshot release 1986). For Trial on the Road, [Lenfilm](https://www.lenfilm.ru/cinema/filmography/annotation_catalog/239/) actually labels 1985. That release-year discrepancy is retained as a metadata limitation; the director, original title and IMDb identity agree. No global year reconciliation is claimed.

The House That Swift Built is a **standalone television film**, movie ID 27939 / IMDb tt0085452, not an episodic TV identity. It remains in the movie catalogue like the existing Ordinary Miracle. Source production year 1982 differs from TMDB release year 1985; the latter is retained. [Gosteleradiofond's archive](https://t.me/s/gosteleradiofond/14060) identifies the 1982 production and Zakharov. No movie/TV numeric IDs are interchanged. Actual series/miniseries remain outside this batch.

## Accepted additions

Full source metadata, every decision and all proposed IDs are in [`historical-55-identity-audit.csv`](../import-previews/historical-55-identity-audit.csv). No ratings are included.

| Source row | Proposed ID | Film | Catalogue year | Director | TMDB | IMDb |
| --- | --- | --- | --- | --- | --- | --- |
| 123 | 2179 | Before Sunset | 2004 | Richard Linklater | 80 | tt0381681 |
| 237 | 2180 | Marriage Story | 2019 | Noah Baumbach | 492188 | tt7653254 |
| 291 | 2181 | Mamma Mia! Here We Go Again | 2018 | Ol Parker | 458423 | tt6911608 |
| 294 | 2182 | Ocean's Eight | 2018 | Gary Ross | 402900 | tt5164214 |
| 324 | 2183 | Despicable Me 3 | 2017 | Kyle Balda; Pierre Coffin | 324852 | tt3469046 |
| 326 | 2184 | Star Wars: The Last Jedi | 2017 | Rian Johnson | 181808 | tt2527336 |
| 331 | 2185 | The Bookshop | 2017 | Isabel Coixet | 444539 | tt3127022 |
| 382 | 2186 | Star Wars: The Force Awakens | 2015 | J.J. Abrams | 140607 | tt2488496 |
| 405 | 2187 | The Hunger Games: Mockingjay - Part 2 | 2015 | Francis Lawrence | 131634 | tt1951266 |
| 455 | 2188 | Transformers: Age of Extinction | 2014 | Michael Bay | 91314 | tt2109248 |
| 456 | 2189 | Wild | 2014 | Jean-Marc Vallée | 228970 | tt2305051 |
| 474 | 2190 | The Hunger Games: Mockingjay - Part 1 | 2014 | Francis Lawrence | 131631 | tt1951265 |
| 476 | 2191 | The Theory of Everything | 2014 | James Marsh | 266856 | tt2980516 |
| 584 | 2192 | American Reunion | 2012 | Jon Hurwitz; Hayden Schlossberg | 71552 | tt1605630 |
| 603 | 2193 | Interstate 60 | 2002 | Bob Gale | 20312 | tt0165832 |
| 651 | 2194 | The Ages of Love | 2011 | Giovanni Veronesi | 58219 | tt1712187 |
| 708 | 2195 | The Mechanic | 2011 | Simon West | 27582 | tt0472399 |
| 715 | 2196 | Transformers: Revenge of the Fallen | 2009 | Michael Bay | 8373 | tt1055369 |
| 785 | 2227 | Dolls | 2002 | Takeshi Kitano | 870 | tt0330229 |
| 809 | 2228 | To the Sea! | 2009 | Yaroslav Chevazhevsky | 63540 | tt1366920 |
| 926 | 2229 | Khottabych | 2006 | Pyotr Tochilin | 57775 | tt0466043 |
| 940 | 2197 | Troy | 2004 | Wolfgang Petersen | 652 | tt0332452 |
| 944 | 2198 | Hoodwinked! | 2005 | Cory Edwards | 10982 | tt0443536 |
| 990 | 2199 | Monamour | 2005 | Tinto Brass | 27063 | tt0480919 |
| 1034 | 2200 | Gopher Broke | 2004 | Jeff Fowler | 25223 | tt0438064 |
| 1080 | 2201 | Just Married | 2003 | Shawn Levy | 12090 | tt0305711 |
| 1091 | 2202 | Dogville | 2003 | Lars von Trier | 553 | tt0276919 |
| 1096 | 2230 | Private | 2003 | Tinto Brass | 30287 | tt0372909 |
| 1193 | 2203 | Black Hawk Down | 2001 | Ridley Scott | 855 | tt0265086 |
| 1238 | 2204 | Memento | 2000 | Christopher Nolan | 77 | tt0209144 |
| 1325 | 2205 | American History X | 1998 | Tony Kaye | 73 | tt0120586 |
| 1343 | 2206 | Frivolous Lola | 1998 | Tinto Brass | 50124 | tt0174931 |
| 1377 | 2226 | Double Tap | 1997 | Greg Yaitanes | 213439 | tt0119012 |
| 1417 | 2207 | From Dusk Till Dawn | 1996 | Robert Rodriguez | 755 | tt0116367 |
| 1438 | 2208 | The Master and Margarita | 2011 | Yuriy Kara | 63163 | tt0110476 |
| 1464 | 2209 | The Voyeur | 1994 | Tinto Brass | 27066 | tt0111573 |
| 1472 | 2231 | Naval Cadets III | 1992 | Svetlana Druzhinina | 63538 | tt0135427 |
| 1492 | 2210 | Arizona Dream | 1993 | Emir Kusturica | 11044 | tt0106307 |
| 1502 | 2232 | All Ladies Do It | 1992 | Tinto Brass | 37265 | tt0104014 |
| 1526 | 2211 | Paprika | 1991 | Tinto Brass | 50270 | tt0098063 |
| 1629 | 2212 | Maria's Lovers | 1984 | Andrei Konchalovsky | 77985 | tt0087682 |
| 1653 | 2213 | Blood Simple | 1984 | Joel Coen | 11368 | tt0086979 |
| 1667 | 2214 | Tears Were Falling | 1982 | Georgiy Daneliya | 27925 | tt0084696 |
| 1669 | 2215 | The House That Swift Built | 1985 | Mark Zakharov | 27939 | tt0085452 |
| 1850 | 2216 | There Once Was a Singing Blackbird | 1970 | Otar Iosseliani | 83235 | tt0151035 |
| 1864 | 2217 | Trial on the Road | 1986 | Aleksei German | 71762 | tt0067625 |
| 1995 | 2218 | It's a Mad, Mad, Mad, Mad World | 1963 | Stanley Kramer | 11576 | tt0057193 |
| 2021 | 2219 | Through a Glass Darkly | 1961 | Ingmar Bergman | 11602 | tt0055499 |
| 2023 | 2220 | One Hundred and One Dalmatians | 1961 | Wolfgang Reitherman; Clyde Geronimi; Hamilton Luske | 12230 | tt0055254 |
| 2039 | 2221 | Hiroshima Mon Amour | 1959 | Alain Resnais | 5544 | tt0052893 |
| 2083 | 2222 | Peter Pan | 1953 | Clyde Geronimi; Wilfred Jackson; Hamilton Luske | 10693 | tt0046183 |
| 2103 | 2223 | Rope | 1948 | Alfred Hitchcock | 1580 | tt0040746 |
| 2118 | 2224 | Pinocchio | 1940 | Hamilton Luske; Ben Sharpsteen; Jack Kinney; Bill Roberts; T. Hee; Norman Ferguson; Wilfred Jackson | 10895 | tt0032910 |
| 2124 | 2225 | Snow White and the Seven Dwarfs | 1937 | David Hand | 408 | tt0029583 |

## Validation and next boundary

- Catalogue JS syntax and repository catalogue validator pass: **2,231 records**, 200 Top 100 references, 6 award events, zero errors.
- All 2,177 baseline records and the first 47 proposal records are unchanged in value and order; only seven more records appended in this follow-up.
- Checked all 54 accepted records against their two evidence sets and row audit, allowing only the three documented year overrides in the original batch.
- No nonempty TMDB/IMDb/internal-ID collisions or normalized existing-title collisions. All 55 source rows have an audit outcome: 54 accepted, one TV hold.
- The 55-row current decision ledger, verifier input and audit agree; Point Blank 56125 and the Medcalf opera 267111 are absent from all active accepted mappings. Historical raw evidence remains unchanged.
- Patch whitespace check passes. Changes are catalogue and metadata/audit only; no Supabase or rating-import behavior is changed.

Stop for catalogue PR review. No merge or rating import performed. A subsequent rating phase must check current progress conflicts, preserve existing values, include Spirits of the Dead only once, and retain the miniseries row for TV review.

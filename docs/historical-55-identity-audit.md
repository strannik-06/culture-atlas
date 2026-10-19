# Historical 55 identity audit — catalogue proposal after PR #85

## Result and boundary

47 additions from the 48 selected candidates in [PR #85](https://github.com/strannik-06/culture-atlas/pull/85); no existing-catalogue duplicates. One selected candidate is unsafe and excluded. All seven earlier deferrals remain excluded, for eight unresolved source identities in total.

Catalogue: **2,177 → 2,224** records. Append IDs **2179–2225**, above the existing maximum 2178. Existing records and IDs are unchanged, including existing gaps. This PR contains no rating-import payload, database operation, migration, workflow change or personal notes. Supabase was neither read nor modified. The owner's reported 2,013 ratings was not independently queried.

Spirits of the Dead is already canonical ID **2178** / TMDB **41225**. It is not a new addition or part of the 48 candidates. Its pending historical rating remains for a separate, explicitly reviewed import after this catalogue PR; existing ratings must not be overwritten.

## Evidence and verification

- Base: `b657cfaf13a110b8508985e7e3b8f69af6ff2446` (merged PR #85).
- Recovered the saved `historical-55-tmdb-candidates.zip` from October 15, 2026. This is stored evidence, **not a fresh TMDB API lookup**. It contains the movie-detail results produced by `scripts/verify-historical-55-movies.py`, including IMDb IDs and Director-job credits.
- `imports/historical-48-tmdb-evidence.csv` preserves exactly the 48 selected evidence rows, including the rejected Point Blank candidate. No personal ratings or notes are included. Original CSV SHA-256: `0c867f1eec63eda728d3ddac4e7d1dcd3997c81f0a43fb88338d926517040ba7`.
- Joined by both source row and selected TMDB movie ID; checked original historical title, director and year rather than trusting the translated search query or result rank. Manually compared transliterated/reversed director names and original/English title aliases. Preserved PR #85's non-first-result choices except the newly rejected Point Blank.
- Compared every selected TMDB ID and IMDb ID against all 2,177 existing catalogue records and within the batch. Also checked normalized display/original-title overlaps and similar display titles. **No exact identity duplicates**; Despicable Me and Despicable Me 2 are different installments, not duplicates of Despicable Me 3.
- Each accepted row has a nonempty title/director, numeric release year, selected movie ID and IMDb title ID. These checks establish the candidate identity; they do not refresh posters, cast or critic scores.
- Director field follows the TMDB `Director` job, not source producer labels. For animation this can omit co-director jobs or include sequence directors. Disney is not assigned as director solely because the source names him.

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

## Cases needing a decision or further research

**Owner decision: source row 1377.** The original entry is `Контрольный выстрел`, Greg Yaitanes, 1997. PR #85 selected Point Blank, TMDB 56125 / IMDb tt0175047, but its actual director is Matt Earl Beesley and release year 1998. Reject this mapping. [IMDb's Double Tap record](https://www.imdb.com/title/tt0119012/) and [the Russian streaming-title listing](https://www.justwatch.com/ru/фильм/double-tap) support **Double Tap (1997), Greg Yaitanes, tt0119012** as the likely intended film. Confirm that identity before a corrected TMDB lookup and later addition; this PR deliberately supplies no replacement ID or rating mapping.

The seven PR #85 deferrals need corrected lookups, not blanket approval. Most can be researched without an owner decision. Particularly:

- Row 1472 is **Гардемарины 3 (1992)** in the original source, but was searched as **Vivat, Midshipmen!**, a different installment. The original source must control the next search.
- Row 1502's supplied movie ID 267111 resolves to Stephen Medcalf's opera film, not Tinto Brass. Do not reuse it.
- Row 1096's stored rank-2 result **Private (2003), Tinto Brass, TMDB 30287** looks promising for Fallo!, but PR #85 deferred it; it is flagged for a full alias/IMDb review rather than silently promoted.
- Rows 785 (Kitano Dolls), 809 (Na more!), 926 (Tochilin Hottabych), and 1570 (Midshipmen, Forward!) had no safe selected result. Correct query/year/media type first; do not choose unrelated search hits. Kitano's source year 2008 also needs review.

## Accepted additions

Full metadata and reasons, including every deferred identity, are in [`historical-55-identity-audit.csv`](../import-previews/historical-55-identity-audit.csv). No ratings are included.

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
| 940 | 2197 | Troy | 2004 | Wolfgang Petersen | 652 | tt0332452 |
| 944 | 2198 | Hoodwinked! | 2005 | Cory Edwards | 10982 | tt0443536 |
| 990 | 2199 | Monamour | 2005 | Tinto Brass | 27063 | tt0480919 |
| 1034 | 2200 | Gopher Broke | 2004 | Jeff Fowler | 25223 | tt0438064 |
| 1080 | 2201 | Just Married | 2003 | Shawn Levy | 12090 | tt0305711 |
| 1091 | 2202 | Dogville | 2003 | Lars von Trier | 553 | tt0276919 |
| 1193 | 2203 | Black Hawk Down | 2001 | Ridley Scott | 855 | tt0265086 |
| 1238 | 2204 | Memento | 2000 | Christopher Nolan | 77 | tt0209144 |
| 1325 | 2205 | American History X | 1998 | Tony Kaye | 73 | tt0120586 |
| 1343 | 2206 | Frivolous Lola | 1998 | Tinto Brass | 50124 | tt0174931 |
| 1417 | 2207 | From Dusk Till Dawn | 1996 | Robert Rodriguez | 755 | tt0116367 |
| 1438 | 2208 | The Master and Margarita | 2011 | Yuriy Kara | 63163 | tt0110476 |
| 1464 | 2209 | The Voyeur | 1994 | Tinto Brass | 27066 | tt0111573 |
| 1492 | 2210 | Arizona Dream | 1993 | Emir Kusturica | 11044 | tt0106307 |
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

## Unresolved audit

| Source row | Original source | Selected candidate | Reason |
| --- | --- | --- | --- |
| 785 | Куклы | None | Kitano Dolls absent from stored search results; unrelated films rejected. Source year 2008 needs review; no identity selected. |
| 809 | На море! | None | Yaroslav Chevazhevskiy Na more!/On the Sea! absent from stored results; no identity selected. |
| 926 | }{отт@бь)ч | None | Pyotr Tochilin Russian Hottabych absent from stored results; unrelated Hottabych and His Team rejected. |
| 1096 | Fallo! | None | PR #85 deferred this. Stored rank 2 Private (2003), Tinto Brass, TMDB 30287 is a plausible Fallo! alias; keep deferred pending full identity review rather than silently promote. |
| 1377 | Контрольный выстрел | Point Blank | REJECT selected Point Blank (1998), Matt Earl Beesley, tt0175047: source director is Greg Yaitanes. Probable intended film Double Tap (1997), tt0119012. Requires owner identity decision and separate verified TMDB lookup; no automatic substitution. |
| 1472 | Гардемарины 3 | None | Source is Gardemariny 3 (1992); search query Vivat, Midshipmen! refers to a different installment. Needs corrected search and review, not approval of that alias. |
| 1502 | Così fan tutte | None | Known TMDB 267111 is Stephen Medcalf Così fan tutte (1992), not Tinto Brass source film. Reject opera-film identity; corrected lookup required. |
| 1570 | Гардемарины, вперед! | None | Druzhinina Midshipmen, Forward! absent from stored movie results; verify TV/miniseries media type before adding. |

## Validation and next boundary

- `node --check film-catalog.js`: passed.
- `node scripts/validate-catalog.mjs`: 2,224 canonical records, 200 Top 100 references, 6 award events, zero errors.
- Compared all baseline catalogue records against the proposed catalogue: identical values and ordering; only 47 appended records.
- Verified every appended record against its selected evidence row and audit, with only the three documented year overrides; no TMDB/IMDb/internal-ID collisions.
- Checked the full patch and staged file list: catalogue plus metadata-only evidence/audit/documents; no import or Supabase code changes.

Stop for catalogue PR review. No merge or rating import is authorized by this proposal. A subsequent rating phase must check current progress conflicts, preserve existing values, include Spirits of the Dead only once, and retain unresolved source rows for later review.

# Berlinale 2011–2015: official source evidence

`imports/berlinale-2011-2015-source.json` contains the actual Main Competition selections and official International Jury prizes for all five editions. Encounters did not exist in these years. Out-of-competition screenings and other sections are excluded.

| Edition | Main Competition films | Prize records | Festival dates |
| --- | ---: | ---: | --- |
| 2011 | 16 | 9 | 10–20 February 2011 |
| 2012 | 18 | 9 | 9–19 February 2012 |
| 2013 | 19 | 10 | 7–17 February 2013 |
| 2014 | 20 | 8 | 6–16 February 2014 |
| 2015 | 19 | 10 | 5–15 February 2015 |
| Total | 92 | 46 | |

Selection titles, translated aliases, directors, production years, runtimes and individual film URLs come directly from the official programme archive. Pagination was exhausted (three 200-result pages per year, with total-result and expected selection-count assertions). Exact festival dates come from the corresponding official yearbooks and retain their source text in the JSON. The awards archive supplies the jury, official prize label, film URL and recipient text; those original fields are retained alongside normalized display labels.

Official sources follow these patterns, replacing the year for each edition:

- https://www.berlinale.de/en/archive/programme/programme-archive.html/y=2011/o=asc/p=1/rp=200
- https://www.berlinale.de/en/archive/awards-juries/awards.html/y=2011/o=desc/p=1/rp=40
- https://www.berlinale.de/en/archive/yearbooks/2011.html

`scripts/research-berlinale-2011-2015.py` reproduces the source from the structured `initial_result` data embedded in those official pages (Python 3 with lxml; temporary downloaded HTML stays outside the repository).

Historical distinctions are preserved:

- *A Separation* received both ensemble acting awards in 2011. The official source identifies the actor and actress ensembles, rather than a single performer; that wording is retained.
- *The Prize* received two separate artistic-contribution awards in 2011: Wojciech Staron for camera and Barbara Enriquez for production design. Both appear on the same selected film.
- *Sister* received the 2012 Special Award Silver Bear.
- The two 2013 Honourable Mentions belong to *Layla Fourie* and *Promised Land*.
- The 2015 directing award was shared by *Body* and *Aferim!*; artistic-contribution awards went to *Under Electric Clouds* and *Victoria*. Separate official award records are retained.
- Alfred Bauer Prize, actor/actress and other historical award names are not replaced with categories introduced later. Equivalent archive wording such as “Jury Grand Prix – Silver Bear” is mapped to the existing “Silver Bear Grand Jury Prize” display label, while the exact source label is retained.

The official Best First Feature juries were checked, but no winner or special mention belongs to these Main Competition selections. Documentary jury awards began later. Independent jury, audience, honorary and short-film awards remain excluded.

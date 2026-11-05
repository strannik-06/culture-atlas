# Berlinale 2006–2010: official source evidence

`imports/berlinale-2006-2010-source.json` contains the actual competing feature films in the Main Competition and the official International Jury prizes, plus the Best First Feature Award where its recipient belongs to this selection. Encounters did not exist in these years. Other sections, out-of-competition screenings, short films, audience/independent-jury awards and honorary awards are excluded.

| Edition | Competing features | Prize records | Festival dates |
| --- | ---: | ---: | --- |
| 2006 | 19 | 10 | 9–19 February 2006 |
| 2007 | 22 | 8 | 8–18 February 2007 |
| 2008 | 21 | 8 | 7–17 February 2008 |
| 2009 | 18 | 11 | 5–15 February 2009 |
| 2010 | 20 | 9 | 11–21 February 2010 |
| Total | 100 | 46 | |

Selections, original/translated titles, directors, production years, runtimes and individual film URLs come directly from the official programme archive. All three 200-result pages were examined in each year, with total-result and expected-count assertions. Dates come from the corresponding official yearbooks, with exact date wording retained as `date_source_text`. Prize records retain the awarding jury, original label, source URL and recipient text alongside the normalized display label.

Official sources follow these patterns for each year:

- https://www.berlinale.de/en/archive/programme/programme-archive.html/y=2006/o=asc/p=1/rp=200
- https://www.berlinale.de/en/archive/awards-juries/awards.html/y=2006/o=desc/p=1/rp=40
- https://www.berlinale.de/en/archive/yearbooks/2006.html

`scripts/research-berlinale-2006-2010.py` reproduces the source from the structured `initial_result` embedded in the official pages (Python 3 with lxml). Temporary downloaded HTML is cached outside the repository.

## Archive qualifications

The 2006 and 2007 archives label competing shorts simply “Competition”. Runtime is therefore checked to exclude films below 40 minutes, rather than accidentally treating them as competing features.

The archive tags *Letters From Iwo Jima* as “Competition 2007” without its eligibility qualifier. The original official press dossier explicitly lists the film under “Außer Konkurrenz”, together with *300*, *Notes on a Scandal* and *The Walker*. It is excluded from the 22 eligible features and documented in the source's `excluded_out_of_competition` field. This correction uses the contemporaneous official document, rather than treating an archive tag or a later statistical summary as definitive evidence of eligibility:

https://www.berlinale.de/media/download/presse/dossier/57ifb/pressedossier2007.pdf (page 7).

## Historical prize handling

- *A Soap* and *Offside* share the 2006 Grand Jury Prize. *A Soap* also received the inaugural Best First Feature Award.
- The 2006 artistic-contribution award belongs to Jürgen Vogel for his acting, co-writing and co-producing contribution to *The Free Will*. The original full credit is retained as evidence; the person label is his name.
- The 2006 and 2007 Best Music prizes retain their historical category. The 2007 prize was awarded to director David Mackenzie for his use of music in *Hallam Foe*, rather than to an inferred composer. The 2008 music prize appears under the official artistic-contribution category for Jonny Greenwood's *There Will Be Blood* score.
- The 2007 artistic-contribution award belongs to the ensemble cast of *The Good Shepherd*. The source's description of the Alfred Bauer Prize as a work of innovation is not misinterpreted as a person's name.
- In 2009, *Everyone Else* and *Gigante* share the Grand Jury Prize; *Gigante* and *Sweet Rush* share the Alfred Bauer Prize. *Gigante* also received Best First Feature. All three prizes are retained on its selected film.
- In 2010, Grigori Dobrygin and Sergei Puskepalis both received Best Actor for *How I Ended This Summer*. The film's separate cinematography prize for Pavel Kostomarov is also retained.

Source award names are preserved for audit. Equivalent historical wordings such as “Jury Grand Prix – Silver Bear” are mapped to existing display labels, without inventing categories that did not yet exist. Every prize recipient resolves by the official individual film URL to a film in the included selection.

# Berlinale 2016–2020: official source evidence

The normalized source is `imports/berlinale-2016-2020-source.json`. It contains final actual Main Competition competitors for 2016–2020 and the inaugural Encounters competition in 2020. Encounters did not exist in 2016–2019. Official out-of-competition screenings are excluded.

| Edition | Main Competition | Encounters | Included prize records | Festival dates |
| --- | ---: | ---: | ---: | --- |
| 2016 | 18 | — | 9 | 11–21 February |
| 2017 | 18 | — | 8 | 9–19 February |
| 2018 | 19 | — | 9 | 15–25 February |
| 2019 | 16 | — | 8 | 7–17 February |
| 2020 | 18 | 15 | 15 | 20 February–1 March |

There are 104 selected films and 49 prize records. All selection titles, aliases, directors, production years, runtimes and individual film URLs come directly from the official programme archive. Awards retain the official jury, original name and recipient description as evidence, with a normalized display name and person credit. The dates come from the corresponding official yearbooks.

Sources follow these year-specific patterns:

- Programme: `https://www.berlinale.de/en/archive/programme/programme-archive.html/y=2016/o=asc/p=1/rp=200` (all three pages inspected; each year's total is below 600).
- Awards: `https://www.berlinale.de/en/archive/awards-juries/awards.html/y=2016/o=desc/p=1/rp=40` (single page each year).
- Dates: `https://www.berlinale.de/en/archive/yearbooks/2016.html`.

The archive is delivered as structured `initial_result` JSON embedded in the official page; it is not necessary to infer titles from search snippets. `scripts/research-berlinale-2016-2020.py` downloads that evidence and reproduces the source (Python 3 with lxml; temporary HTML cache is kept outside the repository).

The 2019 programme archive still contains *Yi miao zhong* (*One Second*), but the official yearbook explicitly describes its withdrawal before screening, in its “A Missing Competitor” section. This withdrawn film is recorded in `excluded_withdrawn` and is excluded from the final 16 competitors. Its replacement, *Hero*, is marked out of competition and is also outside this scope. Source: https://www.berlinale.de/en/archive/yearbooks/2019.html .

Included cross-section official awards are Best First Feature for *Hedi* (2016) and *Touch Me Not* (2018); Berlinale Documentary Award for *Irradiated* (2020); Best First Feature and its special mention for *Los conductos* and *Naked Animals* (2020). Official cross-section winners in other selections are excluded. No independent jury, audience, honorary or short-film awards are included.

Historical award names are preserved: the Alfred Bauer Prize in 2016–2019, actor/actress awards before the gender-neutral performance awards, and the special “Silver Bear – 70th Berlinale” in 2020. No modern category is retroactively invented.

# Awards navigation and 2026 coverage

The award dropdowns are replaced with six named tabs and original monochrome
award pictograms: palm, lion, bear, statuette, mask and globe. Each tab opens its
latest loaded edition. Previous/next edition links and available-year links use
shareable URLs; refresh, Back, Forward and film-dialog return navigation preserve
the edition. Existing 2025 category/winners URLs remain supported.

Categories render in separate sections using standard film cards. The main
category is first. Winners precede nominees and have a gold border and label.
Films can repeat across categories; individual acting nominations also repeat
when two performers from the same film are nominated. Every copy points to one
canonical film ID, so changing its rating updates every visible copy.

## 2026 scope

| Award | Unique films | Categories | Coverage |
| --- | ---: | ---: | --- |
| Cannes | 22 | 7 | Full Main Competition and jury prizes |
| Venice | 21 | 8 | Full Venezia 83 Competition and jury prizes |
| Berlinale | 22 | 8 | Full Competition and International Jury prizes |
| Oscars | 27 | 11 | Established major feature-film categories |
| BAFTA | 31 | 12 | Established major feature-film categories |
| Golden Globes | 33 | 12 | Established major film categories |

Ceremony year is distinct from film release year. The Oscars, BAFTA and Golden
Globes 2026 editions primarily recognise 2025 releases. Shorts, honorary awards,
television, technical categories and other festival sections are outside this
iteration's scope. Earlier editions retain their existing data.

Festival competition entries are labelled **In competition**, rather than being
invented nominees for every individual jury prize. Secondary festival prize
sections show recipients only. Cannes' shared directing prize and joint acting
awards are explicit; Berlin's joint supporting performance is represented by two
performer entries pointing to one film.

## Identity and metadata audit

`imports/awards-2026-source.json` records the reviewed source titles, nominees,
performers, winners, scope and official URLs. `awards-2026.js` contains canonical
references only. `imports/awards-2026-audit.json` records provider matching and the
74 newly added identities. No identities remain unresolved. The canonical film
catalogue grows from 2,252 to 2,326 records; no existing IDs or ratings are changed.
Every new film has a poster, synopsis, runtime and cast metadata. Existing metadata
is preserved; the current coverage audit retains its original completion history
and records this later catalogue addition separately.

New identities require a unique title/director match against TMDB credits. Known
IMDb identities can resolve transliterated/provider search failures; both IMDb
and director are then checked. Titles are normalised for punctuation and accents,
including Kore-eda/Koreeda; ambiguous results are held for review, never assigned
to the first search hit. Existing Minotaur and NAZA records are reused. The public
catalogue's existing dynamic film was checked read-only and does not overlap.

## Official sources

- [Cannes selection](https://www.festival-cannes.com/en/press/press-releases/the-films-of-the-official-selection-2026/) and [jury prizes](https://www.festival-cannes.com/en/press/press-releases/the-79th-festival-de-cannes-winners-list/).
- [Venice competition](https://www.labiennale.org/en/cinema/2026/venezia-83-competition) and [official prizes](https://www.labiennale.org/en/news/official-awards-83rd-venice-international-film-festival).
- [Berlinale competition](https://www.berlinale.de/en/2026/topics/competition-2026.html), [International Jury prizes](https://www.berlinale.de/en/festival/awards-and-juries/international-jury.html) and the linked 2026 programme records for award recipients.
- [Oscars](https://www.oscars.org/oscars/ceremonies/2026).
- [BAFTA](https://www.bafta.org/awards/film/?award-year=2026).
- [Golden Globes](https://goldenglobes.com/nominations/2026).

## Deployment and verification

Merge the catalogue/UI PR, then apply
`imports/awards-2026-catalogue-sync.sql` to register the 74 new static identities
and provider links used by authenticated search. This small transaction is
insert-only, preserves existing rows, and aborts if a provider already points to
a different work. It does not write ratings, notes, users or permissions. The full
canonical seed is regenerated as well. There is no rating import in this change.

`tests/awards.test.mjs` checks full selected source coverage, winner-first ordering,
shared prizes, repeated performer cards, rating propagation, route restoration,
legacy links and deployment idempotency/conflict protection. The browser preview
workflow additionally exercises all six tabs, year navigation, detail refresh and
mobile overflow in Chromium, and saves signed-out desktop/mobile review images.

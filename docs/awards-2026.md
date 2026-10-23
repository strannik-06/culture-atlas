# Awards navigation and 2026 coverage

The award dropdowns are replaced with six named tabs and original monochrome
award pictograms: palm, lion, bear, statuette, mask and globe. Each tab opens its
latest loaded edition. Previous/next edition links and available-year links use
shareable URLs; refresh, Back, Forward and film-dialog return navigation preserve
the edition. Existing 2025 category/winners URLs remain supported.

Ceremony categories render in separate sections using standard film cards, with
winners first. Ceremony films may repeat across nominations, including different
performers from the same film. Every copy uses one canonical film ID and rating.

Festivals group films by programme section instead: each film appears once per
section, with all its prizes and credited recipients in yellow inside the card.
The main prize appears first, followed by other prize winners and selected films.
Main Competition is never repeated as separate actor/director prize lists. Grid
cards stretch to equal height in each row, aligning the rating controls too.

## 2026 scope

| Award | Unique films | Sections / categories | Coverage |
| --- | ---: | ---: | --- |
| Cannes | 41 | 2 | Main Competition and Un Certain Regard |
| Venice | 40 | 2 | Venezia Competition and Orizzonti feature films |
| Berlinale | 36 | 2 | Main Competition and Perspectives |
| Oscars | 27 | 11 | Established major feature-film categories |
| BAFTA | 31 | 12 | Established major feature-film categories |
| Golden Globes | 33 | 12 | Established major film categories |

Ceremony year is distinct from film release year. The Oscars, BAFTA and Golden
Globes 2026 editions primarily recognise 2025 releases. Shorts, honorary awards,
television, technical categories and other festival sections are outside this
iteration's scope. Earlier editions retain their existing data.

Festival entries use a neutral Selected label unless they received a verified
prize. Shared acting recipients and multiple prizes are combined on one card.
Cannes includes the Caméra d’or for Ben’Imana within Un Certain Regard; Venice
includes House of the Wind’s Lion of the Future within Orizzonti; Berlinale
includes the Perspectives special mention for Forest High. Older editions with
only a main selection use one programme section and preserve their prize labels;
additional older sidebars remain for a later data pass.

## Identity and metadata audit

`imports/awards-2026-source.json` records the reviewed source titles, nominees,
performers, winners, scope and official URLs. `awards-2026.js` contains canonical
references only. `imports/awards-2026-audit.json` records provider matching and the
126 newly added identities across the initial awards PR and this follow-up (74 + 52). No identities remain unresolved. The canonical film
catalogue grows from 2,252 to 2,378 records; no existing IDs or ratings are changed.
All 52 follow-up films have cover images, synopsis, runtime and cast metadata.
La Moula uses an official Venice production still; Ulysse’s missing runtime is
supplemented from Cannes (97 minutes), with provenance in the metadata overrides. Existing metadata
is preserved; the current coverage audit retains its original completion history
and records this later catalogue addition separately.

New identities require a unique title/director match against TMDB credits.
Explicit reviewed director aliases cover Gharaei/Gharaie and the omitted Bernard
in Kouemo Yanghu’s provider credit. Big Little Things has two provider records;
the official original title 謊言生活 selects TMDB 1562901. Its alternate development
title 一日情人 is not used to select a second canonical film. Known
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
- [Un Certain Regard results](https://www.festival-cannes.com/en/press/press-releases/un-certain-regard-winners-list-2026/).
- [Orizzonti selection](https://www.labiennale.org/en/cinema/2026/orizzonti).
- [Perspectives selection](https://www.berlinale.de/en/2026/topics/perspectives-2026.html) and [prizes](https://www.berlinale.de/en/archive/awards-juries/awards.html).
- [Golden Globes](https://goldenglobes.com/nominations/2026).

## Deployment and verification

Merge the catalogue/UI PR, then apply
`imports/awards-2026-catalogue-sync.sql` to register the 126 static identities from both awards updates
and provider links used by authenticated search. This small transaction is
insert-only, preserves existing rows, and aborts if a provider already points to
a different work. It does not write ratings, notes, users or permissions. The full
canonical seed is regenerated as well. There is no rating import in this change.

`tests/awards.test.mjs` checks full selected source coverage, winner-first ordering,
unique films per festival section, aggregated prizes, repeated ceremony performer cards, rating propagation, route restoration,
legacy links and deployment idempotency/conflict protection. The browser preview
workflow additionally exercises all six tabs, year navigation, detail refresh and
row/rating alignment and mobile overflow in Chromium, and saves signed-out desktop/mobile review images.

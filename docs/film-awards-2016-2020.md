# Film awards and festivals 2016–2020

This batch adds all thirty editions for Oscars, BAFTA, Golden Globes, Cannes, Venice and Berlinale. Years consistently refer to the ceremony or festival edition. Every edition has sourced actual dates, or an explicit record that the usual competitions were not held.

| Event | Scope | Nomination/selection records |
| --- | --- | ---: |
| Oscars | Eleven established major film categories | 293 |
| BAFTA | Twelve established film categories | 297 |
| Golden Globes | Twelve established film categories, excluding TV | 300 |
| Cannes | Main Competition and Un Certain Regard, 2016–2019 | 154 |
| Venice | Venezia Competition and feature Orizzonti | 195 |
| Berlinale | Main Competition; inaugural Encounters in 2020 | 104 |

The 1,343 nomination/selection records resolve to 662 distinct films: 111 existing catalogue identities and 551 additions. The identity audit records 930 source identities (a film can occur at more than one event), with zero unresolved matches. Every new film has a poster and synopsis. Source files preserve all credited people, shared prizes, official selection URLs and corrections. Existing catalogue identities and details are verified against the merged baseline; no existing metadata is changed.

## Historical and source exceptions

- Cannes 2020 did not hold its usual feature competitions or award a Palme d’or. Its page explains the separate Cannes 2020 label and October special event. Cancelled May dates are not displayed as actual festival dates.
- Berlinale Encounters first ran in 2020. Earlier editions show only Main Competition. Out-of-competition screenings and the withdrawn 2019 film One Second are excluded; the official yearbook documents the withdrawal.
- The live BAFTA archive incorrectly lists Dick Van Dyke in 2017 Adapted Screenplay and truncates the American Honey British Film credits. BAFTA’s contemporary official nominations announcement supplies Arrival / Eric Heisserer and the full American Honey credits. All sixty categories were checked against contemporary official documents.
- The Golden Globes API incorrectly attaches two 2019 animation nominees to 2018. The contemporary official nomination announcement supplies the correct five 2018 nominees. Four shortened person names are expanded with provenance retained.
- Venice 2016 includes both shared Best Director recipients. Dark Night is an Orizzonti special screening, outside the competition. Eligible Lion of the Future winners receive annotations within their existing section.
- Never Gonna Snow Again retains both Szumowska and co-director Englert in its new catalogue metadata, following the producer and sales agent. Provider identity and its shorter directing credit are independently checked.
- O.J.: Made in America is retained as the Academy’s official 2017 Documentary Feature winner.

Event-specific source notes and the reviewed identity overrides record the primary evidence. Provider matching checks source title or reviewed alias, director identity for festivals or nominated actor/director credits where present, feature runtime, release window and unique TMDB/IMDb identity. Documentary and animation nominees also require the corresponding provider genre. IMDb pins resolve crowded-title searches without weakening identity checks.

## Validation and registration

Regression checks compare every nomination, person, winner, selected film and prize with the normalized sources, check the historical main-prize winners, date coverage, existing page navigation and unchanged catalogue/detail metadata. An isolated Postgres-compatible test applies the registration twice, preserves curated metadata and personal ratings/notes, and rejects conflicting provider mappings. Desktop/mobile Chromium QA visits every edition and checks dates, winner filters, year navigation, refresh and mobile layout without contacting the live database.

After merge, apply `imports/film-awards-2016-2020-catalogue-sync.sql`. It registers only the 551 new public catalogue identities and their provider links, is insert-only and repeatable, and aborts conflicting identities. No live registration is executed by this PR; no schema, rating, note or viewing-history changes are included.

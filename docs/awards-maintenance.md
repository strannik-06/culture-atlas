# Recurring awards maintenance

The ChatGPT task **Culture Atlas awards updates** checks this repository on Monday and Thursday at 08:00 Europe/Amsterdam. The task is hosted outside GitHub; merging this document does not install or change its schedule.

Each run reads current main, discovers every tracked award family across films, TV and books, and checks official sources for pending selections, nominations, winners and calendar corrections. It also looks ahead 120 days for announcements and next editions, including next editions whose dates have not yet been added. Ceremony year remains separate from eligibility/release year. Explicit non-editions and body-of-work prizes must keep their existing semantics.

Confirmed changes go into a reviewable PR with source URLs, verification dates, generated files and relevant tests. Reuse an existing open maintenance PR when appropriate. Never reuse a merged branch. New catalogue registrations must preserve canonical identities and be insert-only. Ambiguous matches are reported for clarification. The task does not merge PRs or apply production database updates. No-change runs stay quiet; blocked or partial runs report what remains.

## Scheduled editions

Add an officially confirmed calendar-only edition to `imports/award-event-dates.json` with `status: "scheduled"`, `verified_on`, a public-facing `note`, and sourced dates marked `scheduled: true`. Run `node scripts/prepare-award-dates.mjs`. The shared award browser exposes these editions in year navigation and shows the pending message without fabricated nominees. Real edition data takes precedence once nominations arrive; update calendar status and dates as announcements happen.

Book results are maintained in `imports/book-awards-2026-source.json` and regenerated with `node scripts/prepare-book-awards.mjs`. Keep the stage of retained lists explicit: Goncourt's second selection must not be relabelled as its final shortlist.

## Initial catch-up: 10 November 2026

- Updated Booker and Goncourt 2026 winners from their official announcements; removed stale pending-result notes and scheduled ceremony labels.
- Added scheduled Oscars, BAFTA, Berlinale and film/TV Golden Globes editions for 2027.
- National Book Awards 2026 remain finalists: winners are due 18 November. Official source: https://www.nationalbook.org/2026-national-book-award-finalists-announced/
- TV coverage currently contains only the 2025 pilot (Emmys, Golden Globes, BAFTA Television). The 2026 editions are a coverage backlog, not pending 2025 results. They still require complete category imports and canonical identity reconciliation; this catch-up PR does not claim to fill that backlog. Official Emmy results are available at https://www.televisionacademy.com/awards/nominees-winners and downloads at https://www.televisionacademy.com/downloads.
- Existing completed film/book editions were inventoried, not exhaustively reverified. Future runs must not equate `winner: false` on losing nominees or Nobel selected works with an unannounced result.

## Catch-up: 12 November 2026

The review started at `main` commit `c63720c` and consulted organizer sources for recent editions, explicitly pending results, and each family's next edition. The 120-day window ends on 12 March 2027. Confirmed later editions are also selectable when the organizer has published their schedule.

### Calendar and results

| Tracked family | Organizer references and findings |
| --- | --- |
| Oscars | [2025 results](https://www.oscars.org/oscars/ceremonies/2025), [2026 results](https://www.oscars.org/oscars/ceremonies/2026), [2027 calendar](https://www.oscars.org/99th-oscars-and-academy-key-dates). Shortlists 15 December, nominations 21 January, ceremony 14 March. |
| Golden Globes (film and TV) | [2025](https://goldenglobes.com/nominations/2025) and [2026 results](https://goldenglobes.com/nominations/2026). The 2026 TV programme results are now included. [2027 calendar](https://goldenglobes.com/media-info/), nominations 7 December and ceremony 10 January. |
| BAFTA Film | [2025 results](https://www.bafta.org/awards/film/?award-year=2025), [2026 results](https://www.bafta.org/awards/film/?award-year=2026), [2027 calendar and rule changes](https://www.bafta.org/media-centre/press-releases/2027-film-awards-opens-for-entries/). Longlists 7 January, nominations 19 January, ceremony 21 February. |
| Cannes | [2025 results](https://www.festival-cannes.com/en/press/press-releases/the-78th-festival-de-cannes-winners-list/), [2026 results](https://www.festival-cannes.com/en/press/press-releases/the-79th-festival-de-cannes-winners-list/), [2027 schedule](https://www.festival-cannes.com/en/accueil-evenement/) for 11–22 May. |
| Venice | [2025 results](https://www.labiennale.org/en/news/official-awards-82nd-venice-international-film-festival), [2026 results](https://www.labiennale.org/en/news/official-awards-83rd-venice-international-film-festival), [2027 festival month](https://static.labiennale.org/files/cinema/2026/Documenti/83miac-brochure-a.pdf). The exact 2027 dates are pending. |
| Berlinale | [2025 results](https://www.berlinale.de/en/archive/awards-juries/awards.html?y=2025), [2026 results](https://www.berlinale.de/en/archive/awards-juries/awards.html?y=2026), [2027 calendar](https://www.berlinale.de/en/dates.html). Added the programme press conference on 20 January. |
| Emmys | [2025 results](https://www.televisionacademy.com/awards/nominees-winners/2025/), [2026 nominees](https://www.televisionacademy.com/78thnoms-list) and [winners](https://www.televisionacademy.com/78th-emmy-winners). Added complete 2026 lists for the three tracked programme categories. [2027 ceremony month](https://www.televisionacademy.com/features/news/awards-news/261006-emmy-prime-video-announcement-release) is confirmed as September. |
| BAFTA Television | [2025 results](https://www.bafta.org/awards/television/?award-year=2025), [2026 results](https://www.bafta.org/awards/television/), [2027 rulebook](https://www.bafta.org/awards/television-rules/). Added the four tracked 2026 programme categories, with 2027 nominations on 22 March and ceremony on 9 May. |
| Booker Prize | [2025](https://thebookerprizes.com/the-booker-library/prize-years/2025) and [2026](https://thebookerprizes.com/the-booker-library/prize-years/2026). Added 2026 selection dates. The [2027 eligibility rules](https://thebookerprizes.com/booker-prize/enter-the-booker-prize) have changed, with the exact public announcement dates pending. |
| International Booker | [2025](https://thebookerprizes.com/the-booker-library/prize-years/international/2025), [2026](https://thebookerprizes.com/the-booker-library/prize-years/international/2026), [2027](https://thebookerprizes.com/the-booker-library/prize-years/international/2027). The 2027 edition is officially named the Bukhman International Booker Prize. Its longlist is scheduled for 16 March, shortlist for 15 April and ceremony for May. The existing event key still identifies the prize. |
| Pulitzer Prize | [2025](https://www.pulitzer.org/prize-winners-by-year/2025) and [2026 results](https://www.pulitzer.org/prize-winners-by-year/2026). The [2027 books cycle](https://www.pulitzer.org/page/books-submission-faq-guidelines-and-requirements) is documented. An exact announcement date was not verified. |
| Nobel Literature | [2025](https://www.nobelprize.org/prizes/literature/2025/summary/) and [2026 laureate](https://www.nobelprize.org/prizes/literature/2026/summary/). The 10 December 2026 ceremony remains scheduled. A 2027 Literature announcement date was not verified. |
| National Book Awards | [2025 results](https://www.nationalbook.org/awards-prizes/national-book-awards-2025/) and [2026 finalists](https://www.nationalbook.org/2026-national-book-award-finalists-announced/). Winners remain pending until the 18 November ceremony. A 2027 awards calendar was not verified. |
| Prix Goncourt | [2025 winner](https://www.academiegoncourt.com/prix-goncourt-2025), [2026 winner](https://www.academiegoncourt.com/prix-goncourt-2026), [2026 selection dates](https://www.academiegoncourt.com/home) and [2027 calendar](https://www.academiegoncourt.com/calendrier-des-reunions). The next winner announcement is 4 November 2027. The 2026 results retain the eight-book second selection. The Academy confirmed the final shortlist announcement date, but its public winner release did not list all four finalists. |

Calendar-only month values store the organizer's confirmed precision (`YYYY-MM`). Their visible dates omit the day and are marked scheduled.

### 2026 TV catalogue registration

The 2026 editions contain all 57 nominee entries and ten winners in the ten programme categories carried forward from 2025. They reference 39 canonical programmes. The TV generator reuses 21 static works and adds 18 reviewed identities to the static catalogue. A read-only public catalogue preflight found two of those 18 already registered under the same keys (`tv:245318` and `tv:250504`), with no conflicts. The 2026 source and audit retain the identity evidence.

After review and merge, apply `imports/tv-awards-2026-catalogue-sync.sql` and verify all 39 public work keys resolve. The insert-only batch is expected to register 16 missing public works. It preserves existing rows and aborts on a conflicting provider link or IMDb identity. The calendar and book date changes require no database registration.

Regenerate with `node scripts/prepare-tv-awards.mjs 2026` and `node scripts/prepare-award-dates.mjs`.

## Verification: 19 November 2026

The review used current main at `41de514`, including merged calendar PR #153, and found no open awards-maintenance PR. The 120-day window ends on 19 March 2027. The 2025 and 2026 organizer result pages were consulted for every tracked family. National Book Awards 2026 was the only explicitly unannounced result in the result imports. Completed editions, losing nominees, Nobel selected works and historical non-editions retain their recorded semantics.

### National Book Awards results

The Foundation's [winner announcement](https://www.nationalbook.org/winners-of-the-2026-national-book-awards-announced/) is dated 18 November 2026. Its accessible announcement text contains only the heading and publication date. Each result below was verified separately through the Foundation's book page on 19 November.

| Category | Confirmed winner and primary source |
| --- | --- |
| Fiction | [Paradiso 17, Hannah Lillith Assadi](https://www.nationalbook.org/books/paradiso-17/) |
| Nonfiction | [Huna: A Memoir of Revolution, Prison, and Becoming, Abdelrahman ElGendy](https://www.nationalbook.org/books/huna-a-memoir-of-revolution-prison-and-becoming/) |
| Poetry | [Still House in the Desert: An eco-contemplation, Brenda Hillman](https://www.nationalbook.org/books/still-house-in-the-desert-an-eco-contemplation/) |
| Translated Literature | [Centroeuropa, Vicente Luis Mora, translated by Rahul Bery](https://www.nationalbook.org/books/centroeuropa/) |
| Young People's Literature | [The Fight of Our Lives: AIDS in America, David Levithan and Gabriel Duckels](https://www.nationalbook.org/books/the-fight-of-our-lives-aids-in-america/) |

The source, generated result asset and generated audit now record the awarded stage. All 25 finalist records and their canonical keys are retained. The ceremony date is confirmed as completed. The existing insert-only book registration SQL regenerates identically because this update adds no catalogue identities.

### Source and edition inventory

The loaded film result assets cover 2001–2026, book results cover 2011–2026, and TV results cover 2025–2026. Scheduled calendar editions extend the available year selectors. The shared browser in `awards.js` combines actual results with calendar-only editions from `award-dates-data.js`; `index.html` loads those assets. `book-awards.js` and `tv-awards.js` adapt the shared browser for their media.

| Data | Imports, generators and outputs |
| --- | --- |
| Recent films | `imports/awards-2026-source.json`, identity overrides, `scripts/prepare-awards-2026.mjs`, `awards-2026.js`, canonical film metadata and `imports/awards-2026-catalogue-sync.sql`. The six family history generators maintain the 2021–2025 sources in `imports/{oscars,globes,bafta,cannes,venice,berlinale}-2021-2025-*` and `awards-2025.js`. Earlier batches use `scripts/prepare-film-awards-history.mjs` and their batch imports. |
| Books | `imports/book-awards-2026-source.json` and `scripts/prepare-book-awards.mjs` generate `book-awards-2026.js`, the audit and insert-only registration SQL. The corresponding historical source and `scripts/prepare-book-awards-history.mjs` maintain 2011–2025. |
| TV | `imports/tv-awards-{2025,2026}-source.json` and `scripts/prepare-tv-awards.mjs YEAR` maintain the result assets, canonical TV catalogue, audits and insert-only registration SQL. |
| Dates and scheduled pages | `imports/award-event-dates.json` and `scripts/prepare-award-dates.mjs` generate `award-dates-data.js`. `award-dates.js` renders sourced dates with their confirmed precision. |

### Next-edition review

The organizer calendars below were checked on 19 November. No new nominee lists or date corrections were verified for these editions.

| Tracked family | Official next-edition status |
| --- | --- |
| Oscars | [2027 calendar](https://www.oscars.org/99th-oscars-and-academy-key-dates), shortlists 15 December 2026, nominations 21 January and ceremony 14 March 2027. |
| Golden Globes, film and TV | [2027 timetable](https://goldenglobes.com/award-rules-and-entry-forms/), nominations 7 December 2026 and ceremony 10 January 2027. |
| BAFTA Film | [2027 rules and calendar](https://www.bafta.org/awards/film-rules/), longlists 7 January, nominations 19 January and ceremony 21 February 2027. |
| Cannes | [2027 festival](https://www.festival-cannes.com/en/accueil-evenement/), 11–22 May. Selections pending. |
| Venice | [84th festival](https://www.labiennale.org/en/cinema/2026/faq-bcc-15) confirmed for September 2027. Exact dates and selections pending. |
| Berlinale | [2027 calendar](https://www.berlinale.de/en/dates.html), programme press conference 20 January, festival 10–21 February. The [awards ceremony](https://www.berlinale.de/en/2027/news-press-releases/278428.html) is on 19 February. |
| Emmys | [2027 ceremony](https://www.televisionacademy.com/features/news/awards-news/261006-emmy-prime-video-announcement-release) confirmed for September. Exact date and nominations pending. |
| BAFTA Television | [2027 calendar](https://www.bafta.org/awards/television-rules/), nominations 22 March and ceremony 9 May. |
| Booker Prize | [2027 eligibility and announcement months](https://thebookerprizes.com/booker-prize/enter-the-booker-prize), July longlist and September shortlist. Exact dates and ceremony pending. The [2026 winner and 9 November date](https://thebookerprizes.com/booker-prize) still match the site. |
| International Booker | [2027 edition](https://thebookerprizes.com/the-booker-library/prize-years/international/2027), longlist 16 March, shortlist 15 April, ceremony in May. Exact ceremony day pending. |
| Pulitzer Prize | [2027 book cycle](https://www.pulitzer.org/page/books-submission-faq-guidelines-and-requirements) confirmed for eligible 2026 publications. Exact winner-announcement and ceremony dates were not verified. |
| Nobel Literature | [Organizer announcement calendar](https://www.nobelprize.org/prizes/about/prize-announcement-dates/) still concerns 2026. A 2027 Literature announcement date was not verified. The Swedish Academy confirms the [2025](https://www.svenskaakademien.se/nobelpriset/2025) and [2026](https://www.svenskaakademien.se/nobelpriset/2026) laureates where NobelPrize.org result pages could not be retrieved. |
| National Book Awards | The [Foundation calendar](https://www.nationalbook.org/national-book-awards/submissions/) still concerns 2026. A 2027 awards calendar was not verified. |
| Prix Goncourt | [2027 calendar](https://www.academiegoncourt.com/calendrier-des-reunions), winner announcement 4 November. The [2026 winner](https://www.academiegoncourt.com/prix-goncourt-2026) still matches the site. The complete four-title final shortlist could not be verified from an accessible primary announcement, so the labeled eight-title second selection is retained. |

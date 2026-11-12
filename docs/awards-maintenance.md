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

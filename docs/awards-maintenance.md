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

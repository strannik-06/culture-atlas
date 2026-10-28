# Award ceremony, announcement and festival dates

All 135 loaded award-edition pages now have shared date metadata: 36 film editions, 96 book editions, and three TV editions. Six film pages already had dates; 127 more held editions and two explicit International Booker non-editions are covered by this change. Dates have a dedicated line above the edition counts, separate from stage/eligibility notes.

`imports/award-event-dates.json` records ISO calendar dates, event labels, scheduled flags and source links. `scripts/prepare-award-dates.mjs` validates and generates `award-dates-data.js`; `award-dates.js` formats the dates consistently for the existing shared award browser. Future additions can still use the existing `dates` field until structured metadata is supplied. Neither the award lists nor the catalogue/registration scripts are changed.

## Historical details

- Berlinale 2021 has its online industry event (1–5 March) and public Summer Special (9–20 June), rather than a misleading continuous date range.
- BAFTA Film 2021 spans both ceremony nights, 10–11 April.
- International Booker 2011 shows the winner announcement (18 May) and awards dinner (28 June) separately. 2012 and 2014 explicitly say “Not held this year.”
- Nobel pages distinguish announcement from ceremony/broadcast. The postponed 2018 prize shows both events in 2019. Ceremonies in 2020/2021 are identified as broadcasts.
- Pulitzer and Goncourt dates are labelled winner announcements rather than invented gala dates. Pandemic postponements use the actual revised dates.
- Upcoming 2026 Booker, National Book Awards, Goncourt and Nobel ceremony dates are marked scheduled. This changes no winner/shortlist status.
- The TV and film Golden Globe editions share the same ceremony date.

## Provenance and checks

Sources are linked beside each date. Organiser archives, press releases, schedules and ceremony videos are preferred; historical coverage also uses contemporary reporting, Bookreporter, and edition-specific reference pages. These are event dates, not book publication dates or film release dates. Date formatting explicitly uses UTC to keep the ISO calendar day unchanged in other timezones.

Coverage tests enumerate every loaded edition, verify all required dates/source links and non-editions, and exercise historical exceptions, range formatting, scheduled events, deep links, refresh and stale-date clearing. Existing award, routing, book and TV tests remain applicable. Chromium previews cover all three media sections and mobile layout.

This change requires no SQL, catalogue registrations or Supabase deployment. Existing ratings and notes are unaffected.

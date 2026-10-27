# Book awards 2011–2025

Prepared on 2026-10-27. **90 historical edition pages, 788 distinct books: 18 existing catalogue records reused and 770 new registrations prepared.** No ratings, notes or reading history are included in this batch.

| Award | Editions | Scope |
|---|---:|---|
| Booker Prize | 15 | Six shortlisted books, including joint winners in 2019. |
| International Booker | 15 | 2011/2013/2015 author shortlists and selected works by the winner; 2012/2014 explicitly not held; six books per year from 2016. |
| Pulitzer Prize | 15 | Fiction, History, Biography/Autobiography, Poetry and General Nonfiction; separate Memoir/Autobiography from 2023. |
| Nobel Literature | 15 | Laureate profile plus three selected works; no book-level Nobel winners. |
| National Book Awards | 15 | Five finalists per category: Fiction, Nonfiction, Poetry, Young People’s Literature; Translated Literature from 2018. |
| Prix Goncourt | 15 | Final four and winner, preserving the credited French titles on award cards. |

## Sources and historical rules

Every edition/category and work carries an official source URL in `imports/book-awards-2011-2025-source.json`. The principal archives are the Booker Foundation’s complete Booker and International Booker lists, Pulitzer’s yearly winners/finalists, National Book Foundation’s category archives, the Académie Goncourt’s selections by year, and the official Nobel Prize API for laureates and award years. Nobel profiles link to the relevant official prize summary; representative books illustrate the writer’s work and are not identified as individually winning the Nobel.

The 2018 Nobel prize remains under 2018, with a note that it was announced/presented in 2019. The International Booker author editions have author cards, no author rating controls, and separately labelled representative books by the winning author. John le Carré’s requested withdrawal in 2011 is identified on his card. The 2020 International Booker’s anonymous translator is credited as Anonymous. The 2012 Pulitzer Fiction finalists appear without an invented winner; 2019 Booker and 2023 Pulitzer Fiction preserve joint winners.

## Identity review

Official title/credited-author pairs establish the award identity. Provider links additionally require matching work or edition titles and author identities; duplicate Open Library work IDs are retained as aliases only for the same reviewed book. Original-language work titles are linked through matching translated editions, rather than fuzzy title similarity. The source records contain the provider work/edition titles and author names used in verification. Existing records are referenced by ID with a title/author snapshot; SQL aborts if that reviewed identity changes.

Reviewed exceptions are in `imports/book-awards-2011-2025-overrides.json`, including the existing Russian editions of *A Horse Walks into a Bar*, *Voices from Chernobyl* and *The Unwomanly Face of War*. These retain their existing catalogue/rating targets. Solvej Balle’s Volume III reuses catalogue 24 and Volume I reuses catalogue 36. Individual Septology volumes remain separate from an omnibus. French/English titles that refer to one work share one rating target, while award cards retain their official credited titles.

One Open Library search result puts an edition of Craig Santos Perez’s `[åmot]` in a work named `[saina]`. These are different volumes, so that provider association is rejected. The correctly identified award book remains available under its stable official-source catalogue key.

## Metadata availability

688 of 788 books have a reviewed cover reference. 24 have no safely verified Open Library work link and use a stable `book-awards:` source key. They are still identified by the official award title and author and can be rated through their award/catalogue cards. Publication years use available catalogue/provider records. Unavailable covers have an explicit fallback; no substitute or guessed image is used. These metadata gaps are enumerated separately from identity conflicts in the machine-readable audit. They are not omitted selections or unverified award results.

## Validation and deployment

Tests check all years/categories, the historical exceptions above, duplicate-free work/provider references, deep links and refresh, author-versus-book ratings, and preservation of current 2026 pages. Isolated PostgreSQL-compatible SQL tests apply the batch twice, preserve existing book metadata/private notes, and reject changed catalogue identities. Read-only live Supabase preflight: 18 existing identities, 770 new identities, zero ambiguous matches. The source snapshots contain only public book metadata; no private values are committed.

**Deployment pending review and merge.** `imports/book-awards-2011-2025-catalogue-sync.sql` only registers public catalogue records and never updates existing book metadata or private progress. After merge, apply it with conflict/preservation checks and verify every registration **before starting another batch**. Merging the PR does not run SQL automatically.

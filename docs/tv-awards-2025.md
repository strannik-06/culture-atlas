# TV awards 2025 pilot

## Coverage

Three award tabs and ten complete programme categories, using the shared award navigator and ceremony year. 57 nomination entries resolve to 45 canonical programmes: 18 reused and 27 additions. Acting, directing, writing and other craft categories are outside this initial pilot.

| Award | Categories | Nominations |
|---|---|---:|
| Emmys | Drama Series; Comedy Series; Limited or Anthology Series | 21 |
| Golden Globes | Drama; Musical or Comedy; Limited/Anthology/TV Movie | 18 |
| BAFTA Television | Drama Series; Limited Drama; Scripted Comedy; International | 18 |

Official category lists and winners are recorded in `imports/tv-awards-2025-source.json`; the Golden Globes records were extracted from its official award-database endpoint. The Television Academy’s category pages and BAFTA’s 2025 archive establish the complete nominee lists. Source titles are retained, while article-inverted Golden Globes titles have friendly display labels.

## Identity and rating scope

Award entries reference the existing namespaced TV work key. Recognition belongs to the eligible programme/run, and does not convert a whole-series rating into a season rating. Named runs such as *Wolf Hall: The Mirror and the Light* and *True Detective: Night Country* retain the official award title while opening the canonical series, with explicit series-rating labels. Existing season ratings remain independent in Details.

The Menendez programme is the separate TMDB miniseries record 225634, verified by its 2024 premiere, Javier Bardem credit and Netflix’s official press entry. Its provider IMDb field is absent; no IMDb ID was guessed. The reviewed record retains a null IMDb value and its official evidence links.

BAFTA’s International category includes the documentary *You Are Not Alone: Fighting the Wolfpack*. Its canonical `tv:movie:1238400` key preserves the movie-provider namespace while displaying it as a documentary programme. No film-catalogue duplicate exists, and details use the correct provider type.

New provider matches require a unique normalized title, original premiere year and credited person. All 27 additions have posters, synopses and cast metadata. Public supplemental details for the 18 existing entries provide signed-out synopsis/cast without rewriting their catalogue records. Every pre-existing static TV record is byte-for-byte equivalent as parsed JSON; no rating data is part of the source or generated files.

## Validation

The dedicated pilot checks cover all 57 nominations and ten winners, canonical references, public navigation, category/result filters, unavailable years, detail refresh/Back, shared series ratings, private-note isolation, and insert-only SQL idempotence/provider conflict rejection. Existing TV, routing, details, film awards and book awards suites also pass. The final-TV and series-import Python suites pass.

Desktop/mobile Chromium checks all three award tabs, poster loading, equal card heights and aligned star controls, detail refresh/return, and mobile overflow. Previews upload as workflow artifacts rather than bot commits.

Read-only Supabase preflight: 45 identities, 18 already registered, 27 missing, zero provider conflicts and zero identity conflicts. No live database changes have been made for this pilot.

## Deployment after merge

Apply `imports/tv-awards-2025-catalogue-sync.sql` with before/after preservation checks. It inserts only the 27 public catalogue rows and their provider links; existing rows are retained, and conflicting identities abort the transaction. Ratings, notes, dates and reading history are not written. Verify complete anonymous-role coverage before starting another batch. Merge does not execute SQL automatically.

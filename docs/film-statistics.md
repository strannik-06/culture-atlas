# Personal film statistics MVP

Open Films → My collection → Statistics, or `#/films/statistics`, while signed in. Guests and anonymous sessions are redirected to the film catalogue. TV and books do not yet have statistics sections.

The dashboard uses the existing account-scoped, paginated `film_progress` read. It adds no database tables, writes, RPCs, or migrations. A failed initial progress read blocks statistics and offers a retry instead of presenting empty or cached data as complete. Logout and account switching clear the rendered statistics, filters, and drill-down state.

| View | Contents |
| --- | --- |
| Overview | Unique watched films, average rating, share rated 8+, country coverage, exact half-point rating distribution, release-year/decade counts, top films/director credits, country and genre counts |
| Rankings | Films, director credits/teams, and available actors; personal average, rated count, or number rated 8+; configurable minimum sample |
| Taste & exposure | Watched count/share beside rated count, average personal rating, and number rated 8+ for each genre or production country |
| Viewing history | Film count and average current rating by watched year/month, including empty periods and watched-date coverage |
| Explore films | Paginated results behind each chart/category/person, with links to the existing film details and a clear-drill-down action |

Filters combine release-year bounds, country, genre, minimum personal rating, director credit, actor, and watched-date bounds. They remain in memory across views and film overlays; private filters and statistics are not serialized into URLs or persisted. Lists show 48 results per page. Long time series use period navigation, with matching periods in both viewing-history charts.

## Counting rules

- A watched film is a unique canonical film with watched status or a valid personal rating. Watched but unrated films contribute to exposure/counts, never to averages or people ranking sample thresholds.
- A rating is a numeric half-point value from 0.5 to 10. Rating averages always show their rated-film sample size in rankings or adjacent context.
- Release years use the existing application release-date rule. Watched dates must be actual valid dates from `watched_date`; import/update dates are never substituted. A film has one stored watched date, so repeated viewings are not separate events.
- History averages group the current personal rating by watched date. They do not reconstruct old versions of ratings.
- Production countries and genres overlap. Each film counts once within a category, even if metadata repeats it; category shares use all filtered watched films and may sum above 100%.
- Missing country/genre data appears as Unknown; missing years/dates are excluded from the corresponding timeline. Coverage reports show the omissions.
- People use the available metadata names. Actor statistics are film ratings, not performance ratings or a complete filmography. Existing cast metadata is incomplete. Joint directing credits remain grouped when individual identities are unavailable.

## Public metadata and regeneration

`scripts/build-film-detail-assets.mjs` builds a content-hashed `assets/film-details/statistics-<hash>.json` containing only genres, country codes and available cast. Its pointer lives in `film-cards.js`; its payload loads only after a signed-in user opens Statistics. Existing metadata preparation workflows already stage this assets directory, including regenerated statistics. New dynamic films can use their live public metadata until the next index build.

Run `node scripts/build-film-detail-assets.mjs` after metadata changes, and `node scripts/build-film-detail-assets.mjs --check` to verify generated assets. Run `node --test tests/film-statistics.test.mjs` for numerical, generated-data, route, filtering, drill-down, account-isolation and retry coverage. This suite also runs in Media search and backup validation.

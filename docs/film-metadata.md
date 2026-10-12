# Culture Atlas: external ratings and reviews

The film grid displays only sources with verified URLs. Each source may have a `score` field. The data lives in `film-details.js` (shared public catalogue); Supabase holds private user progress.

## Refreshing posters and cast
Run **Refresh TMDB film metadata** from GitHub Actions on the feature branch. The importer searches alternate titles and verifies directors, skips uncertain matches, and preserves curated review fields. Check `tmdb-unmatched.json` afterward.

## Verified review fields
For a matched film ID, fields look like:

```json
{
  "imdb": {"url":"https://www.imdb.com/title/tt1234567/","score":"7.8/10"},
  "letterboxd": {"url":"https://letterboxd.com/film/example/","score":"3.9/5"},
  "reviews": {
    "guardian": {"url":"https://www.theguardian.com/film/...","score":"4/5"},
    "indiewire": {"url":"https://www.indiewire.com/...","score":"B+"},
    "ebert": {"url":"https://www.rogerebert.com/reviews/...","score":"3/4"},
    "lwl": {"url":"https://lwlies.com/reviews/...","score":"4/5"}
  },
  "awards":"Cannes 2025 · Palme d’Or"
}
```

Do not add a score unless the source itself publishes one; some reviews have no numerical rating. Verify title, year and director, plus the actual article, before including a URL. Missing entries remain hidden. Award one-liners should distinguish a win from a nomination or festival selection.

IMDb offers a daily-updated noncommercial ratings dataset, but its license places restrictions on republishing data in online databases. Confirm licensing before publishing IMDb scores publicly. TMDB's own `vote_average` is **not** an IMDb rating. Other review websites may not permit bulk automated scraping. Avoid presenting guessed or transformed ratings as native publication ratings.

TMDB attribution is required for public projects. See https://developer.themoviedb.org/docs/faq .

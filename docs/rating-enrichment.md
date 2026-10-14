# Film rating enrichment

## TMDB (automatic, canonical IDs)

When a film is added to `film-catalog.js`, run:

```sh
TMDB_READ_ACCESS_TOKEN=... node scripts/refresh-tmdb.mjs --apply
node scripts/validate-catalog.mjs
```

The existing TMDB script verifies the canonical film identity (title/director/IMDb) and refreshes the metadata snapshot. Never commit tokens. Review its report and the diff before merging.

## Editorial critics (discovery + verified publishing)

```sh
BRAVE_SEARCH_API_KEY=... node scripts/enrich-editorial.mjs --discover
node scripts/enrich-editorial.mjs --report
```

Discovery queries RogerEbert.com, The Guardian, IndieWire, and Little White Lies for **each** canonical film/source pair and writes `editorial-ratings-candidates.json`. The output contains **possible articles, not verified scores**. It resumes previously completed searches; repeat it for newly added films. The Brave Search API key is private, and API usage may cost money.

After checking that each article is a review of the correct film (including release year and director) and reading the score on the publisher's page, add an entry to `editorial-ratings-approved.json`:

```json
[{"film_id":59,"source":"guardian","score_display":"4/5","url":"https://www.theguardian.com/film/verified-review-url","verified":true}]
```

(The URL above is illustrative, **not** a verified link; do not publish it.)

Then run:

```sh
node scripts/enrich-editorial.mjs --publish
```

This validates stable film IDs, source domains, score formats and explicit approval, then regenerates `editorial-ratings.js`. Commit the approved JSON and snapshot. Missing scores remain absent; a publication with no numeric/letter grade is not assigned one. Supabase ratings take precedence over the snapshot where already present.

**Limitations:** editorial reviews cannot be safely assigned scores using search snippets alone. This pipeline automates searching, candidate collection and publication, but deliberately requires confirmation of article identity and score before publication. The user-triggered review discovery feature is a separate planned workflow. Neither script changes the awards data.

Do not commit `editorial-ratings-candidates.json` or any API keys.

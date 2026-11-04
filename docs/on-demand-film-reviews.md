# On-demand film ratings and reviews

Film Details loads a shared Supabase snapshot when available and offers Find ratings and reviews, or Refresh when existing data is present. Opening a film performs no discovery. The action checks IMDb, The Guardian, Little White Lies, Roger Ebert and IndieWire. Selected critic discovery also checks Sight and Sound, Time Out, Los Angeles Times and A.V. Club, following the existing curated-review selection. Publisher review links retain individual critic names when published. Existing curated links stay visible, and refresh merges verified links without deleting earlier reviews or scores that could not be retrieved this time. Private notes and ratings are untouched.

Adding a previously unregistered movie through Add film starts the same lookup after its catalogue/rating save succeeds. Discovery failure is reported separately and never rolls back the film save. Retry using the Details button. Existing movie rating edits do not automatically repeat discovery.

The authenticated film-reviews Edge Function uses BRAVE_SEARCH_API_KEY for bounded publisher-domain discovery, then checks actual publisher JSON-LD Movie/Review metadata. Search snippets are never published as ratings. Movie metadata requires exact film title and year or director evidence. Article metadata can supply a critic link when its headline identifies the film review, its author is named, director evidence appears in publisher metadata, and publication falls within three years of the film. Article-only evidence never supplies an inferred score. Explicit conflicting director credits are rejected. Pages without sufficient machine-readable identity/review evidence are skipped, including blocked/paywalled pages. Thus a lookup can return fewer than five ratings or no verified results. No missing score is invented. Review text is not copied; selected critic names and direct links are stored.

## Activation after merge

1. Apply the CLI-generated `supabase/migrations/20261104192421_film_review_snapshots.sql`.
2. Configure `BRAVE_SEARCH_API_KEY` as a Supabase Edge Function secret. `SUPABASE_URL`, `SUPABASE_ANON_KEY` and `SUPABASE_SERVICE_ROLE_KEY` are supplied by Supabase. Keep the search key server-side; never paste it in chat or commit it.
3. Deploy `supabase/functions/film-reviews/index.ts` as film-reviews. The handler validates the bearer token against Supabase Auth itself, as media-search does; deploy with gateway JWT verification disabled if required for the project's signing-key configuration.
4. Verify a signed-in lookup on a known film, reload to confirm persistence, and test adding a film. No existing catalogue-wide enrichment should run.

Shared snapshots have public read access and privileged backend-only writes; no private data is stored in them. Discovery requests require sign-in, allowed-origin validation and a registered numeric film ID. Source-page redirects are restricted to the exact publisher hosts, with bounded requests/timeouts. Refreshes within one minute reuse the last successful snapshot. Database merging handles concurrent refreshes and preserves earlier ratings during partial responses.

Automated checks use mocked network services and an isolated Postgres engine. Live search-provider availability and credentials require activation verification; neither the database migration nor function is deployed by this PR.

## Discovery reliability update

Discovery first searches the quoted title + review + publisher domain, without forcing the production year or director into the query. If no page verifies, it retries with original title/director evidence. Each query requests five candidates and checks up to three new publisher URLs, prioritizing review paths. A publisher has a shared twenty-second time budget. Parser version changes bypass old successful-cache entries.

Director evidence can come from a review headline, article metadata, structured article text or the actual article body. HTML entities in critic names are decoded. IndieWire grades are accepted only from an explicit Grade heading on an identity-verified article; unrelated letters are never ratings.

Search failures, blocked pages, absent search results and failed identity checks produce different messages. An inaccessible publisher result may be saved as an explicitly labelled “Review link (page unavailable)” only when its publisher URL, review title and director/year search evidence agree. Such discovery-only links have no rating, no inferred critic name and no verified timestamp. Earlier page-verified records are preserved. Search snippets are never copied into stored review text or scores.

Regression case: Sound of Falling (2025) verifies Guardian / Peter Bradshaw (link), RogerEbert.com / Sheila O’Malley (3.5/4), and IndieWire / David Ehrlich (A-), using actual publisher pages. No full review text is stored in the repository.

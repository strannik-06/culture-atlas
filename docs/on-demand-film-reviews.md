# On-demand film ratings and reviews

Film Details loads a shared Supabase snapshot when available and offers Find ratings and reviews, or Refresh when existing data is present. Opening a film performs no discovery. The action checks IMDb, The Guardian, Little White Lies, Roger Ebert and IndieWire. Selected critic discovery also checks Sight and Sound, Time Out, Los Angeles Times and A.V. Club, following the existing curated-review selection. Publisher review links retain individual critic names when published. Existing curated links stay visible, and refresh merges verified links without deleting earlier reviews or scores that could not be retrieved this time. Private notes and ratings are untouched.

Adding a previously unregistered movie through Add film starts the same lookup after its catalogue/rating save succeeds. Discovery failure is reported separately and never rolls back the film save. Retry using the Details button. Existing movie rating edits do not automatically repeat discovery.

The authenticated film-reviews Edge Function uses BRAVE_SEARCH_API_KEY for bounded publisher-domain discovery, then checks actual publisher JSON-LD Movie/Review metadata. Search snippets are never published as ratings. Exact film title and production year or director evidence are required. Pages without sufficient machine-readable identity/review evidence are skipped, including blocked/paywalled pages. Thus a lookup can return fewer than five ratings or no verified results. No missing score is invented. Review text is not copied; selected critic names and direct links are stored.

## Activation after merge

1. Apply the CLI-generated `supabase/migrations/20261104192421_film_review_snapshots.sql`.
2. Configure `BRAVE_SEARCH_API_KEY` as a Supabase Edge Function secret. `SUPABASE_URL`, `SUPABASE_ANON_KEY` and `SUPABASE_SERVICE_ROLE_KEY` are supplied by Supabase. Keep the search key server-side; never paste it in chat or commit it.
3. Deploy `supabase/functions/film-reviews/index.ts` as film-reviews. The handler validates the bearer token against Supabase Auth itself, as media-search does; deploy with gateway JWT verification disabled if required for the project's signing-key configuration.
4. Verify a signed-in lookup on a known film, reload to confirm persistence, and test adding a film. No existing catalogue-wide enrichment should run.

Shared snapshots have public read access and privileged backend-only writes; no private data is stored in them. Discovery requests require sign-in, allowed-origin validation and a registered numeric film ID. Source-page redirects are restricted to the exact publisher hosts, with bounded requests/timeouts. Refreshes within one minute reuse the last successful snapshot. Database merging handles concurrent refreshes and preserves earlier ratings during partial responses.

Automated checks use mocked network services and an isolated Postgres engine. Live search-provider availability and credentials require activation verification; neither the database migration nor function is deployed by this PR.

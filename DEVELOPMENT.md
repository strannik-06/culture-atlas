# Culture Atlas — first prototype

Culture Atlas is intended to become a personal library of films, books and music. The first implementation is a dependency-free film catalogue in `index.html`.

## Current features
- Curated 100-film 2025 viewing selection in three priority tiers (30 / 40 / 30).
- Search films and directors; filter by tier, genre and watched status.
- Watched checkboxes, personal ratings (1–10), completion statistics.
- Browser-local progress persistence and CSV export.
- Responsive layout.

## Run locally
Open `index.html` in a browser. No install or API keys required.

## Publishing
This is a development branch. To publish via GitHub Pages, merge its pull request into `main`, then open repository Settings → Pages → Build and deployment → Deploy from a branch → `main` / `/(root)`. The published URL should be `https://strannik-06.github.io/culture-atlas/` once Pages completes deployment.

## Limitations
- Posters and cast are **not yet integrated**; poster panels are visual placeholders. TMDB integration will follow after metadata matching and API configuration.
- Ratings and watched status live only in localStorage on the current browser/device. Clearing browser data may erase them. Export CSV as backup.
- The curated list is a viewing selection rather than a strict release-year dataset. Some films premiered before 2025.
- Film metadata has not yet been systematically verified against TMDB; this is an editorial prototype, not an authoritative catalogue.
- Books, music, cloud login, import, analytics and cross-device sync are future milestones.

## Suggested next stages
1. Verify catalogue and match stable TMDB identifiers, posters and cast.
2. Add Supabase authentication and per-user records; provide CSV import.
3. Add books and music as independent modules with shared account and dashboard.
4. Add year-specific lists, awards, festivals and statistics.

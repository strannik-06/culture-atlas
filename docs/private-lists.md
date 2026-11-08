# Watch and read lists — 8 November 2026

Films and TV have a Watch list tab beside My ratings; Books has a Read list tab. These are ordinary routed pages (`#/films/watchlist`, `#/tv/watchlist`, `#/books/watchlist`) using the same cards and detail popups as the catalogue. The header list dialog has been removed. Film and TV lists reuse the existing search and sorting controls; the read list supports title/author search and title/year sorting.

Guests can browse the public catalogue and details, but rating and saving a title require sign-in. Lists are private, keyed by account, media kind and canonical work key. Failed requests retain prior state. Account changes clear private data.

After a successful rating save, the matching title is removed from the list. Failed rating saves retain it. Previously rated titles can be added again for rewatching or rereading; opening or refreshing the app never removes them merely because a rating exists. Removal is handled after confirmed rating saves in compact controls, details, and film/TV search. A list-update failure is reported separately from a successfully saved rating.

## Database and catalogue

The original `supabase/changes/personal_lists.sql` has been applied. Saved lists are part of the service-role-only encrypted backup snapshot and offline recovery format.

Additional catalogue entries are verified by title, year and director/creator against TMDB using the existing private Actions credentials. `imports/list-catalogue-resolved.json` records the public metadata and provider identities. `imports/list-catalogue-sync.sql` registers additions without changing existing catalogue identities, progress or notes; provider and IMDb matches are reused. This catalogue SQL and the requested personal list import have been applied. The personal import is deliberately separate from the public repository.

Validation covers native cards and submenu placement, list URLs and detail return navigation, signed-out clearing, failed and successful rating saves, re-adding rated works, ownership RLS, backup compatibility, and desktop/mobile Chromium layout.

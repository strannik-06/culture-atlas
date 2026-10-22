# Cards and details

Films, television and books share compact poster cards and native details dialogs styled by `details.css`. Cards contain title, year, creator/director/author, available lead cast and awards, and a personal star score. Notes, dates, website ratings/source links and reading history belong in details. TV series cards retain a details route to their separate season ratings; no aggregate score is invented from season scores.

Details initially open read-only. **Edit**, beside **Close** at the top right, becomes **Save**. Changes to stars are drafts until Save. Successful saves return the same popup to read mode; failures preserve the draft. Cancel editing restores the saved values. Close discards the draft and preserves the list route and scroll state. Native dialogs handle modal focus; their star pickers are mounted inside the dialog so they remain usable in the top layer. Escape dismisses a star picker before closing its dialog.

Books preserve their immutable imported reading history when the current rating, format or notes change. Open Library descriptions load on demand with a stale-response guard. Goodreads ratings retain their existing dated-snapshot provenance. No book awards or critic scores are fabricated.

Film details load private notes/date/version from the signed-in progress row and save with an owner filter and loaded-version check. Private notes/drafts are excluded from the browser's film progress cache and public routes. Account changes clear private content. TV keeps its existing optimistic-version RPC and account check. No SQL migration or data import is required.

After merging, deploy the updated `media-search` Edge Function using the existing **Deploy media search** workflow. Its details response now includes synopsis, cast, runtime/genres and TMDB rating. Until deployment, TV still opens and edits normally, with unavailable metadata shown honestly. New dynamic-film records also retain the richer metadata.

Validation: `npm test` plus `node --test tests/routes.test.mjs tests/tv-ratings.test.mjs tests/media.test.mjs tests/details.test.mjs`. These cover popup drafts, save errors, privacy, safe rendering, half-point stars, route restoration, series/season identities, import compatibility and trusted metadata responses.

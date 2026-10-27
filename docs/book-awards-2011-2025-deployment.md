# Book awards 2011–2025 deployment

Completed 27 October 2026 after PR #116 merged as `9e33661327bacbb33561f6462b2da7308eab5166`.

Applied `imports/book-awards-2011-2025-catalogue-sync.sql` (SHA-256 `54efd417aa6c99d4e5f7d71d735ae6fa8fa2c1547b73625b05295699829bac85`) to Supabase project `ufqaidyshfkbymbrzdff`.

- Preflight: 788 award books, 18 existing matches, 770 missing, zero multiple matches.
- Committed 770 insertions; public books total increased from 314 to 1,084.
- Transaction locked relevant tables and asserted exact preservation of all existing books and row fingerprints for book_progress, book_readings, film_progress, tv_progress, external_ratings, media_catalogue and media_provider_links. All assertions passed. Fingerprints and private row contents are not published.
- Independent post-commit query under the anonymous role: all 788 award identities resolve exactly once, zero missing and zero conflicts.

No ratings, notes, reading history, existing book metadata or unrelated catalogue data changed. Registration for PR #116 is complete; its SQL must not be treated as pending. No further database action is needed for this batch.

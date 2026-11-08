# Watch and read lists — 8 November 2026

Compact film, TV and book cards have a bookmark button beside the rating. Guests see “Sign in to rate”; both actions open the account panel. Signed-in users can add and remove titles and open Watch / read list in the header, with filters for films, TV and books. Saving a title does not rate or mark it watched/read.

Lists are private rows keyed by account, media kind and canonical work key. They sync through Supabase, clear on account changes, and change the displayed saved state only after the database confirms success. Failed loads block list changes until the header button retries successfully.

## Deployment

After merge, apply `supabase/changes/personal_lists.sql`. This creates the table and ownership policies and adds saved lists to the existing service-role-only backup snapshot. No existing progress or catalogue records are updated. The encrypted backup and offline recovery tools accept saved lists while remaining compatible with older snapshots.

Validation: guest prompts and account changes in DOM tests; owner isolation and backup permissions in PostgreSQL tests; backup/restore roundtrip in Python; guest actions and mobile layout in Chromium.

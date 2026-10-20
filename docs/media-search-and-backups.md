# Film / TV search and weekly encrypted backups

This change extends the existing static site. It requires one-time Supabase and Cloudflare R2 setup; merging alone does **not** enable search or backups. Existing ratings are not migrated, reimported, or changed by installation.

## What changes on the website

- **Films → Add film**, **TV Series → Add series**: search TMDB by title, optionally year. Each result shows a small poster, year and director/creators; your existing rating appears once, in the star control. Credits and private progress load progressively, with editing disabled until the record has loaded. Rate and save directly in each card using the same ten-star, half-point picker as the other sections. Save one card without clearing the list or other drafts. New ratings default to your local current date; existing dates (including unknown dates) are preserved. Notes stay collapsed until clicked. Films never show TV scope/season controls. TV cards use one series/season selector; historical unspecified scope is preserved and labelled in that selector.
- **One search field** accepts titles, director names and an optional trailing year, such as `Black Bag 2025`, `Steven Soderbergh`, or `Black Bag Soderbergh 2025`. Film and person matches share one results list. Select **Show directed films** on a person to browse their directing credits. More results append without clearing drafts. Numeric titles such as `1984`, `2001: A Space Odyssey`, and `Blade Runner 2049` remain titles.
- For TV, choose **Whole series** or a specific numbered season. Their ratings stay independent. A complete, ended one-season miniseries reuses the whole-work identity, matching our earlier import decisions. Specials (season 0) are outside this first version.
- Existing catalogue records and the four historical film/TV aliases are reused. Root IMDb matches also reuse existing records across provider namespaces. Film and TV IDs are never assumed interchangeable.
- Existing scores/notes/dates load before editing. Save requires the version loaded by that editor; another-device edits cause a reload message, never a silent overwrite. A failed save keeps the draft.
- Films now has a searchable, paginated **Catalogue** tab including all historical and newly added films. New entries appear across devices and in My ratings / exports. Static Top 100 and Awards lists retain their curated membership.
- Books keeps its existing workflow. Private discovery drafts are not stored in the browser.

## 1. Supabase SQL (once, in this order)

Run these checked-in files in the SQL Editor of the existing project:

1. [`20261021_media_catalogue.sql`](../supabase/migrations/20261021_media_catalogue.sql)
2. [`20261021_media_catalogue_seed.sql`](../supabase/migrations/20261021_media_catalogue_seed.sql)
3. [`20261021_backup_snapshot.sql`](../supabase/migrations/20261021_backup_snapshot.sql)

These depend on the already installed Books and scoped TV migrations. They are repeatable and do not replace existing metadata/progress. The generated seed records all 2,252 canonical film identities, 330 TV rating targets and four TV aliases. It contains public catalogue metadata only. After future static catalogue additions, run `node scripts/seed-media-catalogue.mjs`, review/commit the generated SQL, and apply it again **before using search for those newly curated identities**.

Shared catalogue reads are public, just like the repository catalogue. Progress remains private. Dynamic film IDs start at 1,000,000,000 and preserve all original IDs. Only the service-role Edge Function may create media records with verified TMDB metadata. Only the service role may call the backup snapshot RPC.

## 2. Deploy authenticated TMDB search

The browser never receives the TMDB server key or Supabase service-role key.

Add these GitHub repository **Actions secrets**:

| Name | Value |
| --- | --- |
| `SUPABASE_ACCESS_TOKEN` | Your Supabase personal access token for deployment |
| `SUPABASE_PROJECT_REF` | `ufqaidyshfkbymbrzdff` (verify this is still the intended project) |
| `TMDB_API_KEY` | Existing TMDB API key; reuse the repository secret if already configured |

After merge, run **Actions → Deploy media search → Run workflow**. The job sets the TMDB secret and deploys only `media-search`; it does not run database migrations. Supabase supplies the function's `SUPABASE_URL`, `SUPABASE_ANON_KEY` and `SUPABASE_SERVICE_ROLE_KEY` automatically.

Alternatively, deploy using the Supabase CLI and set `TMDB_API_KEY` in the function's secrets. The function also supports `TMDB_READ_ACCESS_TOKEN`. Gateway JWT checking is disabled in `supabase/config.toml` for publishable-key compatibility; **every POST explicitly verifies the caller's JWT with Supabase Auth before TMDB access or any progress read/write**. All progress lookups filter the verified user ID.

Default allowed browser origin: `https://strannik-06.github.io`. For a custom domain, set function secret `MEDIA_ALLOWED_ORIGIN` to its exact origin (no trailing slash). Never put service keys into JavaScript, repository files or chat.

Test on the live site after deployment: search an already rated film and confirm its score/notes load; search a new title and save deliberately; reload and check Catalogue/My ratings. For TV, verify a series and one season remain separate. These live writes should be your chosen ratings, not test data.

## 3. Create private Cloudflare R2 storage

In Cloudflare, create an R2 bucket (for example `culture-atlas-backups`). **Keep public access / r2.dev disabled** and do not attach a public domain. Create an R2 S3 API token with object read/write access restricted to this bucket. Copy its account ID, Access Key ID and Secret Access Key. This uses R2's S3-compatible endpoint, not a Cloudflare account-wide API token.

Generate an encryption key **on your own computer**:

```sh
python3 -c 'import base64,secrets; print(base64.b64encode(secrets.token_bytes(32)).decode())'
```

Save the key in your password manager **as well as** GitHub Secrets. Without it, the encrypted backups cannot be recovered. Keep the R2 bucket/account recovery details there too. Do not rotate/delete an old encryption key until all backups using it have expired or been re-encrypted.

Add these repository Actions secrets:

| Name | Value |
| --- | --- |
| `SUPABASE_URL` | `https://ufqaidyshfkbymbrzdff.supabase.co` |
| `SUPABASE_SERVICE_ROLE_KEY` | The project's legacy service-role JWT from Supabase API settings; this is a server secret, not the publishable key |
| `BACKUP_ENCRYPTION_KEY` | The generated base64 32-byte key |
| `R2_ACCOUNT_ID` | Cloudflare account ID |
| `R2_BUCKET` | Private bucket name |
| `R2_ACCESS_KEY_ID` | Bucket-scoped S3 access key |
| `R2_SECRET_ACCESS_KEY` | Bucket-scoped S3 secret |

Run **Actions → Weekly encrypted backup → Run workflow**. Confirm it finishes green and its summary says **Verified encrypted backup**, with expected film/TV/book counts. Check the encrypted `.caenc` object exists in R2. Until this succeeds, cloud backup is **not yet confirmed**. No private backup is uploaded as a public GitHub Actions artifact.

## What is backed up and when

Every **Sunday at 03:17 UTC**, plus manual runs. GitHub schedules can be delayed and may be disabled after prolonged repository inactivity; enable Actions failure notifications, check for a recent successful run periodically, and re-enable the schedule if GitHub disables it. Weekly recovery can lose changes made since the last successful snapshot. Run the manual workflow after a large rating session or import.

A single database statement snapshots **all columns and rows** of `film_progress`, `tv_progress`, `book_progress`, `books`, `media_catalogue` and `media_provider_links`. This includes scores, notes, watch dates, TV scopes, reading formats, user IDs and timestamps. It avoids REST's 1,000-row pagination limit and includes all accounts in this owner-managed project. Auth credentials/emails are excluded; this is a Culture Atlas data backup, not a replacement for Supabase Auth/project backups.

The archive also includes static film/TV catalogue files, film details, identity/alias definitions, schema reference and SQL migrations, with the repository commit. Historic `schema.sql` is a reference file; use the migrations and current project schema when recovering.

JSON is checksummed, gzip-compressed and encrypted locally using AES-256-GCM with a fresh random nonce. A unique timestamp/random object key prevents replacing earlier backups. The job downloads that exact object and verifies encryption authentication, checksums and counts before reporting success. Logs contain counts and object path only. Plaintext ratings and encryption keys are never uploaded to R2 or published as build artifacts.

There is **no automatic deletion** in this first version. Keep the bucket private, monitor usage, and configure a retention/lifecycle policy later if desired. R2 pricing and free allowances are at [Cloudflare's pricing page](https://developers.cloudflare.com/r2/pricing/); cost depends on usage.

## Recovery drill (offline, no database writes)

Download a `.caenc` object from R2. Install the same Python dependencies:

```sh
python3 -m pip install -r scripts/backup-requirements.txt
# Set BACKUP_ENCRYPTION_KEY privately in your environment, using your saved key.
python3 scripts/backup.py inspect /path/to/snapshot.caenc
python3 scripts/backup.py inspect /path/to/snapshot.caenc --extract /path/to/new-recovery-folder
```

`inspect` authenticates/decrypts the file and checks every manifest entry. It prints metadata/counts, not notes or user IDs. `--extract` writes plaintext data into a new private directory and refuses to overwrite an existing directory. Keep these extracted files private. Neither command connects to Supabase.

Generate an **insert-only SQL proposal**, still offline:

```sh
python3 scripts/restore-backup.py /path/to/new-recovery-folder/database.json /path/to/recovery.sql
```

Review this SQL before running it. Recover into a staging project first, using the corresponding schema/migrations and original auth users (or a separately reviewed explicit user-ID mapping). The SQL verifies referenced accounts exist, inserts only missing rows, skips conflicts, and advances catalogue ID sequences. It **does not overwrite newer scores/notes, remove rows, recreate accounts, deploy the site, or reset the database**. Restoring a deleted/recreated account or intentionally replacing a conflicting rating needs a separate explicit recovery decision. Restore static catalogue files from the backed-up repository commit if needed. The encryption/read-back tests use synthetic data; perform one offline recovery drill against your first actual backup to establish end-to-end recovery.

## Validation

`node --test tests/media.test.mjs` covers seeded identities, RLS/grants, service-only snapshots, rollback, root aliases, dynamic season targets, stale edits, verified Edge authentication, server-side TMDB refetch, existing private progress, inline card saves, independent drafts, local date defaults, collapsed notes, TV controls, director filmographies/pagination and UI account changes.

`python3 -m unittest discover -s tests -p test_backup.py` covers encryption/decryption, wrong key/tampering, manifest counts, required storage read-back, offline extraction and insert-only recovery output. Existing Books, TV, film sync and catalogue tests continue to run.

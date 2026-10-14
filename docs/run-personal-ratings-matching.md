# Running the historical ratings matching report in GitHub Actions

The owner has approved keeping the personal ratings source in the public repository. Upload the cleaned CSV export from the conversation to `imports/personal-ratings-cleaned.csv` in a separate commit/PR. The file must retain these columns: `source_rows,directors,source_title,original_title_hint,source_year,rating,notes`. Do not upload the spreadsheet workbook (which may contain unrelated tabs).

After the source file and this workflow are on `main`, open **Actions → Personal ratings TMDB matching (read-only) → Run workflow**. The workflow reuses `TMDB_API_KEY` from the existing TMDB enrichment workflow. It converts the cleaned CSV, performs candidate searches, and uploads `personal-ratings-tmdb-candidates` as a JSON artifact (30-day retention). It **does not** change the film catalogue or Supabase.

Important: The initial matching script intentionally treats TMDB search results as **candidates**, not confirmed identities. Director credits are not verified by the search endpoint; no auto-import should be based on this report. Source years may be inaccurate; no-match entries should be retried with adjacent years or without year restriction in a later matching iteration. Multiple director names and duplicate source row references must be retained.

The CSV includes personal ratings and notes, and the user has explicitly consented to publishing ratings. Review the nine notes before publication if desired. GitHub Actions artifacts can also be accessible to repository collaborators.

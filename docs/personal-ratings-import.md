# Historical personal ratings import — phase 1

The source is a private spreadsheet export and **must not be committed**. Export the Movies tab as CSV with columns: `source_row,director,source_title,original_title_hint,source_year,rating,notes`. The user's source has 2,153 rows; most titles are Russian. Ignore Best 5.

Run:
```sh
node scripts/prepare-ratings-import.mjs /private/path/source.csv
TMDB_READ_ACCESS_TOKEN=... node scripts/prepare-ratings-import.mjs /private/path/source.csv --tmdb
```

The first command produces a report of possible existing catalogue matches. The second searches TMDB in Russian for Cyrillic titles and in English otherwise. It **does not confirm matches**: results need director and year verification, particularly for ambiguous titles, short films, and release-year discrepancies. Output `ratings-import-report.json` is private and gitignored.

Import rules: preserve existing canonical film IDs, deduplicate against existing TMDB IDs, preserve half-point personal scores, ignore Best 5, use TMDB international and original titles, do not persist translated Russian source titles except when actually original, allow uncertain source release years, and leave historical watched dates null. Newly rated films can record watched dates. Do not overwrite existing Supabase progress without reviewing conflicts. No live import occurs in this phase.

**Next steps:** review candidates, verify director and TMDB identity, resolve ambiguous/unmatched rows, and prepare a separate migration with an explicit approval gate.

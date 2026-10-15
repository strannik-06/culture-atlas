#!/usr/bin/env python3
"""Read-only audit of 13 historical movie identities; no API or database writes."""
import csv
import json
import pathlib
import sys

root = pathlib.Path(__file__).resolve().parents[1]
catalogue = json.loads((root / "film-catalog.js").read_text(encoding="utf-8").split("=", 1)[1].strip().rstrip(";"))
by_tmdb = {}
by_id = {}
for film in catalogue:
    if film["id"] in by_id:
        raise SystemExit(f"Duplicate catalogue id: {film['id']}")
    by_id[film["id"]] = film
    if film.get("tmdb_id") is not None:
        if film["tmdb_id"] in by_tmdb:
            raise SystemExit(f"Duplicate TMDB movie id: {film['tmdb_id']}")
        by_tmdb[film["tmdb_id"]] = film

with (root / "imports" / "historical-13-identity-candidates.csv").open(encoding="utf-8", newline="") as f:
    rows = list(csv.DictReader(f))
assert len(rows) == 13, "Unexpected candidate count"
assert len({r["source_row"] for r in rows}) == len(rows)
assert len({r["tmdb_movie_id"] for r in rows}) == len(rows)
writer = csv.writer(sys.stdout)
writer.writerow(["source_row", "source_title", "tmdb_movie_id", "review_status", "catalogue_id", "action"])
for r in rows:
    match = by_tmdb.get(int(r["tmdb_movie_id"]))
    writer.writerow([r["source_row"], r["source_title"], r["tmdb_movie_id"], r["review_status"], match["id"] if match else "", "verify_existing_identity" if match else "verify_tmdb_metadata_before_add"])

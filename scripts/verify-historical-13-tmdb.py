#!/usr/bin/env python3
"""Read-only TMDB verification for recovered historical film IDs.

Set TMDB_API_KEY in the environment. Writes a CSV preview only.
"""
import csv, json, os, pathlib, sys, urllib.parse, urllib.request
root=pathlib.Path(__file__).resolve().parents[1]
key=os.environ.get("TMDB_API_KEY","")
if not key:
    sys.exit("TMDB_API_KEY missing; no requests made")
with (root/"imports/historical-13-identity-candidates.csv").open(encoding="utf-8",newline="") as f:
    candidates=list(csv.DictReader(f))
catalogue=json.loads((root/"film-catalog.js").read_text(encoding="utf-8").split("=",1)[1].strip().rstrip(";"))
known={x.get("tmdb_id"):x for x in catalogue}
out=pathlib.Path(sys.argv[1]) if len(sys.argv)>1 else pathlib.Path("historical-13-tmdb-verification.csv")
with out.open("w",encoding="utf-8",newline="") as f:
    w=csv.DictWriter(f,fieldnames=["source_row","source_title","tmdb_movie_id","review_status","status","tmdb_title","original_title","year","director","imdb_id","existing_catalogue_id","error"])
    w.writeheader()
    for r in candidates:
        item={k:r[k] for k in ["source_row","source_title","tmdb_movie_id","review_status"]}
        item.update(status="review_required",tmdb_title="",original_title="",year="",director="",imdb_id="",existing_catalogue_id="",error="")
        tid=int(r["tmdb_movie_id"])
        if tid in known:
            item["existing_catalogue_id"]=known[tid]["id"]
            item["status"]="already_in_catalogue"
        try:
            url="https://api.themoviedb.org/3/movie/"+str(tid)+"?"+urllib.parse.urlencode({"api_key":key,"append_to_response":"credits"})
            with urllib.request.urlopen(url,timeout=25) as response:
                movie=json.load(response)
            item["tmdb_title"]=movie.get("title","")
            item["original_title"]=movie.get("original_title","")
            item["year"]=(movie.get("release_date") or "")[:4]
            item["imdb_id"]=movie.get("imdb_id") or ""
            item["director"]="; ".join(c.get("name","") for c in movie.get("credits",{}).get("crew",[]) if c.get("job")=="Director")
            if item["status"]!="already_in_catalogue":
                item["status"]="ready_for_manual_comparison" if item["tmdb_title"] and item["year"] and item["director"] and item["imdb_id"] else "metadata_incomplete"
        except Exception as e:
            item["status"]="lookup_failed"
            item["error"]=str(e)[:240]
        w.writerow(item)
print(f"Wrote {len(candidates)} read-only verification rows to {out}")

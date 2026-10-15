#!/usr/bin/env python3
"""Read-only TMDB search for 55 historical film candidates; never changes catalogue."""
import csv,json,os,pathlib,sys,urllib.parse,urllib.request
root=pathlib.Path(__file__).resolve().parents[1]
key=os.environ.get("TMDB_API_KEY")
if not key: sys.exit("TMDB_API_KEY missing")
with (root/"imports/historical-55-movie-candidates.csv").open(encoding="utf-8",newline="") as f: rows=list(csv.DictReader(f))
if len(rows)!=55: sys.exit("Expected 55 candidates")
with open(sys.argv[1] if len(sys.argv)>1 else "historical-55-tmdb-candidates.csv","w",encoding="utf-8",newline="") as out:
    fields=["source_row","search_title","source_year","rank","tmdb_id","tmdb_title","original_title","release_year","director","imdb_id","status"]
    w=csv.DictWriter(out,fieldnames=fields);w.writeheader()
    for r in rows:
        try:
            if r["known_tmdb_id"]:
                candidates=[{"id":int(r["known_tmdb_id"])}]
            else:
                url="https://api.themoviedb.org/3/search/movie?"+urllib.parse.urlencode({"api_key":key,"query":r["search_title"],"include_adult":"true"})
                with urllib.request.urlopen(url,timeout=30) as response: result=json.load(response)
                candidates=(result.get("results") or [])[:5]
            if not candidates:
                w.writerow({**{k:r[k] for k in ["source_row","search_title","source_year"]},"status":"no_results"});continue
            for rank,entry in enumerate(candidates,1):
                tid=entry["id"]
                url="https://api.themoviedb.org/3/movie/"+str(tid)+"?"+urllib.parse.urlencode({"api_key":key,"append_to_response":"credits"})
                with urllib.request.urlopen(url,timeout=30) as response: movie=json.load(response)
                directors="; ".join(c["name"] for c in movie.get("credits",{}).get("crew",[]) if c.get("job")=="Director")
                w.writerow({"source_row":r["source_row"],"search_title":r["search_title"],"source_year":r["source_year"],"rank":rank,"tmdb_id":tid,"tmdb_title":movie.get("title",""),"original_title":movie.get("original_title",""),"release_year":(movie.get("release_date") or "")[:4],"director":directors,"imdb_id":movie.get("imdb_id") or "","status":"candidate_requires_director_year_review"})
        except Exception as e:
            w.writerow({**{k:r[k] for k in ["source_row","search_title","source_year"]},"status":"lookup_error: "+str(e)[:150]})
print("Completed 55-source-row read-only TMDB search")

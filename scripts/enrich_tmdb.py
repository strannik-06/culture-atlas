#!/usr/bin/env python3
"""Enrich Culture Atlas film cards using TMDB. Requires TMDB_API_KEY env var.
Never commits the key. Matches title/year/director conservatively.
"""
import json, os, re, time, urllib.parse, urllib.request, pathlib
root=pathlib.Path(__file__).resolve().parents[1]
html=(root/"index.html").read_text()
films=json.loads(re.search(r"const films=(\[.*?\]);",html,re.S).group(1))
key=os.environ["TMDB_API_KEY"]
def api(path,params=None):
    q=urllib.parse.urlencode({"api_key":key,**(params or {})})
    req=urllib.request.Request("https://api.themoviedb.org/3/"+path+"?"+q,headers={"User-Agent":"CultureAtlas/1.0"})
    with urllib.request.urlopen(req,timeout=20) as response:return json.load(response)
def norm(s):return re.sub(r"[^a-z0-9]","",s.casefold())
details={};ambiguous=[]
for f in films:
    title=f["title"];director=f["director"];year=f["year"]
    results=api("search/movie",{"query":title,"include_adult":"false"}).get("results",[])[:12]
    candidates=[]
    for item in results:
        if norm(item.get("title",""))!=norm(title) and norm(item.get("original_title",""))!=norm(title):continue
        release=item.get("release_date","")[:4]
        if not release or abs(int(release)-year)>2:continue
        candidates.append(item)
    matches=[]
    for item in candidates:
        movie=api("movie/"+str(item["id"]),{"append_to_response":"credits,external_ids"})
        directors=[p["name"] for p in movie.get("credits",{}).get("crew",[]) if p.get("job")=="Director"]
        wanted=[x.strip() for x in director.split("&")]
        if not all(any(norm(w)==norm(d) for d in directors) for w in wanted):continue
        matches.append(movie)
        time.sleep(.15)
    if len(matches)!=1:
        ambiguous.append({"id":f["id"],"title":title,"candidates":len(matches)})
        continue
    m=matches[0];entry={"cast":[p["name"] for p in m.get("credits",{}).get("cast",[])[:3]]}
    if m.get("poster_path"):entry["poster"]="https://image.tmdb.org/t/p/w500"+m["poster_path"]
    imdb=m.get("imdb_id")
    if imdb:entry["imdb"]={"url":"https://www.imdb.com/title/"+imdb+"/"}
    details[f["id"]]=entry
    print(f'{f["id"]:3} {title}: matched TMDB {m["id"]}')
(root/"film-details.js").write_text("// Film data matched against TMDB title, year and director. Reviews and awards require independent verification.\nwindow.CULTURE_FILM_DETAILS = "+json.dumps(details,ensure_ascii=False,indent=2)+";\n")
(root/"tmdb-unmatched.json").write_text(json.dumps(ambiguous,ensure_ascii=False,indent=2)+"\n")
print(f"Matched {len(details)}/{len(films)} films; {len(ambiguous)} need manual review.")

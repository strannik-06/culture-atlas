#!/usr/bin/env python3
"""Enrich Culture Atlas film cards using TMDB. Requires TMDB_API_KEY env var.
Never commits the key. Matches title/year/director conservatively.
"""
import json, os, re, time, unicodedata, urllib.parse, urllib.request, pathlib
root=pathlib.Path(__file__).resolve().parents[1]
html=(root/"index.html").read_text()
films=json.loads(re.search(r"const films=(\[.*?\]);",html,re.S).group(1))
key=os.environ["TMDB_API_KEY"]
def api(path,params=None):
    q=urllib.parse.urlencode({"api_key":key,**(params or {})})
    req=urllib.request.Request("https://api.themoviedb.org/3/"+path+"?"+q,headers={"User-Agent":"CultureAtlas/1.0"})
    with urllib.request.urlopen(req,timeout=20) as response:return json.load(response)
def norm(s):
    s=unicodedata.normalize("NFKD",s.casefold())
    return re.sub(r"[^a-z0-9]","", "".join(c for c in s if not unicodedata.combining(c)))
# Alternative search terms are candidates only; director must still match.
ALIASES={
  7:["Sirat"],22:["My Undesirable Friends"],31:["Dreams","Drømmer"],33:["The Message","El mensaje"],
  39:["Young Mothers","Jeunes mères"],44:["Once Upon a Time in Gaza","Il était une fois à Gaza"],
  47:["Below the Clouds","Sotto le nuvole"],48:["En el camino","On the Road"],
  78:["Left-Handed Girl","Zuo Pie Zi Nu Hai"],86:["Bring Her Back"],
  93:["Endless Cookie"],96:["Elio"],97:["The Bad Guys 2"],98:["In Your Dreams"]
}
def search_terms(f):
    title=f["title"]
    return list(dict.fromkeys([title, re.sub(r"\\s*\\([^)]*\\)","",title).strip(),re.sub(r"\\s*:\\s*Part\\s+[IVX]+$","",title,flags=re.I).strip(),*ALIASES.get(f["id"],[])]))

previous={}
old=root/"film-details.js"
if old.exists():
    match=re.search(r"window\\.CULTURE_FILM_DETAILS\\s*=\\s*(\\{.*\\});",old.read_text(),re.S)
    if match:previous=json.loads(match.group(1))
details={};ambiguous=[]
for f in films:
    title=f["title"];director=f["director"];year=f["year"]
    # TMDB searches alternate-language titles; verify identity by director.
    candidates={}
    for term in search_terms(f):
        if not term:continue
        for item in api("search/movie",{"query":term,"include_adult":"false"}).get("results",[])[:20]:
            release=item.get("release_date","")[:4]
            if not release or not release.isdigit() or abs(int(release)-year)>2:continue
            candidates[item["id"]]=item
        time.sleep(.12)
    # Fallback: identify director by name and inspect their movie directing credits.
    # Useful for translated titles, documentaries, and festival films.
    if not candidates:
        director_names=[x.strip() for x in re.split(r"\\s+&\\s+",director)]
        for director_name in director_names:
            people=api("search/person",{"query":director_name}).get("results",[])[:8]
            for person in people:
                if norm(person.get("name",""))!=norm(director_name):continue
                credits=api("person/"+str(person["id"])+"/movie_credits")
                for movie in credits.get("crew",[]):
                    if movie.get("job")!="Director":continue
                    release=movie.get("release_date","")[:4]
                    if not release or not release.isdigit() or abs(int(release)-year)>2:continue
                    candidates[movie["id"]]=movie
                time.sleep(.12)
            time.sleep(.12)
    matches=[]
    for item in candidates.values():
        movie=api("movie/"+str(item["id"]),{"append_to_response":"credits,external_ids"})
        directors=[p["name"] for p in movie.get("credits",{}).get("crew",[]) if p.get("job")=="Director"]
        wanted=[x.strip() for x in director.split("&")]
        if not all(any(norm(w)==norm(d) for d in directors) for w in wanted):continue
        matches.append(movie)
        time.sleep(.15)
    # Require one unique director-verified match; never pick arbitrarily.
    if len(matches)!=1:
        if str(f["id"]) in previous:details[f["id"]]=previous[str(f["id"])]
        ambiguous.append({"id":f["id"],"title":title,"candidates":len(matches)})
        continue
    m=matches[0];entry={"tmdb_id":m["id"],"cast":[p["name"] for p in m.get("credits",{}).get("cast",[])[:3]]}
    if m.get("poster_path"):entry["poster"]="https://image.tmdb.org/t/p/w500"+m["poster_path"]
    imdb=m.get("imdb_id")
    if imdb:entry["imdb"]={"url":"https://www.imdb.com/title/"+imdb+"/"}
    # Keep manually verified review links and awards on subsequent refreshes.
    existing=previous.get(str(f["id"]),{})
    for field in ("awards","letterboxd","reviews"):
        if field in existing:entry[field]=existing[field]
    if isinstance(existing.get("imdb"),dict) and existing["imdb"].get("score") and entry.get("imdb"):
        entry["imdb"]["score"]=existing["imdb"]["score"]
    details[f["id"]]=entry
    print(f'{f["id"]:3} {title}: matched TMDB {m["id"]}')
(root/"film-details.js").write_text("// Film data matched against TMDB title, year and director. Reviews and awards require independent verification.\nwindow.CULTURE_FILM_DETAILS = "+json.dumps(details,ensure_ascii=False,indent=2)+";\n")
(root/"tmdb-unmatched.json").write_text(json.dumps(ambiguous,ensure_ascii=False,indent=2)+"\n")
print(f"Matched {len(details)}/{len(films)} films; {len(ambiguous)} need manual review.")

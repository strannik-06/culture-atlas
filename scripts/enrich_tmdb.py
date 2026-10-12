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
# Explicit TMDB IDs verified by a human. Prefer IDs over fuzzy title searches.
VERIFIED_TMDB_IDS={}  # Diagnose these films through normal title search, not pinned IDs
DIRECTOR_ALIASES={
    "Hailey Gates":["Hailey Benton Gates"],
}
def name_tokens(name):
    return re.findall(r"[a-z0-9]+", unicodedata.normalize("NFKD",name.casefold()).replace("-", " ").encode("ascii","ignore").decode())
def director_equivalent(expected,actual):
    for variant in [expected,*DIRECTOR_ALIASES.get(expected,[])]:
        a,b=name_tokens(variant),name_tokens(actual)
        if norm(variant)==norm(actual) or (len(a)==1 and a==b):
            return True
        if len(a)<2 or len(b)<2:continue
        # Accommodate reversed Asian name order, middle names/initials, and Alex/Alexander.
        def given_match(x,y):
            return x==y or (len(x)==1 and y.startswith(x)) or (len(y)==1 and x.startswith(y)) or (min(len(x),len(y))>=3 and (x.startswith(y) or y.startswith(x)))
        for i,token in enumerate(a):
            for j,other in enumerate(b):
                if token!=other:continue
                remaining_a=[v for k,v in enumerate(a) if k!=i]
                remaining_b=[v for k,v in enumerate(b) if k!=j]
                if any(given_match(x,y) for x in remaining_a for y in remaining_b):
                    return True
    return False
def director_names(raw):
    parts=[p.strip() for p in re.split(r"\\s+&\\s+|\\s*,\\s*",raw) if p.strip()]
    if len(parts)>1:
        last=parts[-1].split()
        if len(last)>1:
            surname=last[-1]
            parts=[p+" "+surname if len(p.split())==1 else p for p in parts]
    return parts
def director_match_count(expected,actual):
    return sum(any(director_equivalent(w,d) for d in actual) for w in director_names(expected))
def directors_match(expected,actual):
    return director_match_count(expected,actual)>0
def title_score(f,m):
    target=norm(f["title"])
    target_words=re.findall(r"[a-z0-9]+",unicodedata.normalize("NFKD",f["title"].casefold()))
    titles=[m.get("title",""),m.get("original_title","")]
    scores=[]
    for title in titles:
        candidate_words=re.findall(r"[a-z0-9]+",unicodedata.normalize("NFKD",title.casefold()))
        # Compare whole words: "Part I" must NOT match "Part II".
        exact=norm(title)==target
        prefix=(len(target_words)>1 and len(candidate_words)>len(target_words)
                and candidate_words[:len(target_words)]==target_words)
        scores.append(100 if exact else 90 if prefix else 0)
    for alias in ALIASES.get(f["id"],[]):
        scores.extend([80 if norm(t)==norm(alias) else 0 for t in titles])
    return max(scores)
def search_terms(f):
    title=f["title"]
    return list(dict.fromkeys([title, re.sub(r"\s*\([^)]*\)","",title).strip(),re.sub(r"\s*:\s*Part\s+[IVX]+$","",title,flags=re.I).strip(),*ALIASES.get(f["id"],[])]))

previous={}
old=root/"film-details.js"
if old.exists():
    match=re.search(r"window\.CULTURE_FILM_DETAILS\s*=\s*(\{.*\});",old.read_text(),re.S)
    if match:previous=json.loads(match.group(1))
details={};ambiguous=[];diagnostics=[]
for f in films:
    title=f["title"];director=f["director"];year=f["year"]
    trace={"id":f["id"],"title":title,"expected_director":director,"expected_year":year,"searches":[],"candidates":[]}
    # TMDB searches alternate-language titles; verify identity by director.
    if f["id"] in VERIFIED_TMDB_IDS:
        movie=api("movie/"+str(VERIFIED_TMDB_IDS[f["id"]]),{"append_to_response":"credits,external_ids"})
        found=[p["name"] for p in movie.get("credits",{}).get("crew",[]) if p.get("job")=="Director"]
        if not directors_match(director,found):
            raise RuntimeError(f"Manual TMDB ID for {title} has unexpected directors: {found}")
        candidates={movie["id"]:movie}
    else:
        candidates={}

    for term in ([] if f["id"] in VERIFIED_TMDB_IDS else search_terms(f)):
        if not term:continue
        response=api("search/movie",{"query":term,"include_adult":"false"})
        search_trace={"query":term,"total_results":response.get("total_results"),"total_pages":response.get("total_pages"),"results":[]}
        trace["searches"].append(search_trace)
        for item in response.get("results",[])[:20]:
            release=item.get("release_date","")[:4]
            accepted=bool(release and release.isdigit() and abs(int(release)-year)<=2)
            search_trace["results"].append({"id":item["id"],"title":item.get("title"),"original_title":item.get("original_title"),"release_date":item.get("release_date"),"year_filter":"passed" if accepted else "rejected"})
            if not accepted:continue
            candidates[item["id"]]=item
        time.sleep(.12)
    # Fallback: identify director by name and inspect their movie directing credits.
    # Useful for translated titles, documentaries, and festival films.
    if not candidates:
        director_names_list=director_names(director)
        for director_name in director_names_list:
            director_search_names=[director_name,*DIRECTOR_ALIASES.get(director_name,[])]
            people_by_id={}
            for search_name in director_search_names:
                for person in api("search/person",{"query":search_name}).get("results",[])[:8]:
                    people_by_id[person["id"]]=person
            people=list(people_by_id.values())
            # The candidate list is inspected below, with exact/alias director checks.
            for person in people:
                if not director_equivalent(director_name,person.get("name","")):continue
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
        accepted=directors_match(director,directors)
        trace["candidates"].append({"id":movie["id"],"title":movie.get("title"),"release_date":movie.get("release_date"),"directors":directors,"director_filter":"passed" if accepted else "rejected"})
        if not accepted:continue
        matches.append((title_score(f,movie),director_match_count(director,directors),movie))
        time.sleep(.15)
    # Prefer exact title and director overlap; refuse ambiguous ties.
    matches.sort(key=lambda x:(x[0],x[1]),reverse=True)
    best=matches[0] if matches else None
    tied=bool(best and len(matches)>1 and matches[1][:2]==best[:2])
    if not best or best[0]<80 or tied:
        if str(f["id"]) in previous:details[f["id"]]=previous[str(f["id"])]
        ambiguous.append({"id":f["id"],"title":title,"candidates":len(matches)})
        trace["status"]="ambiguous" if tied else "unmatched"
        diagnostics.append(trace)
        continue
    m=best[2];entry={"tmdb_id":m["id"],"cast":[p["name"] for p in m.get("credits",{}).get("cast",[])[:3]]}
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
    if f["id"] in (39,71,78,22,55,63,97,98,99):
        trace["status"]="matched"
        trace["selected_tmdb_id"]=m["id"]
        diagnostics.append(trace)
    print(f'{f["id"]:3} {title}: matched TMDB {m["id"]}')
(root/"film-details.js").write_text("// Film data matched against TMDB title, year and director. Reviews and awards require independent verification.\nwindow.CULTURE_FILM_DETAILS = "+json.dumps(details,ensure_ascii=False,indent=2)+";\n")
(root/"tmdb-diagnostics.json").write_text(json.dumps(diagnostics,ensure_ascii=False,indent=2)+"\n")
(root/"tmdb-unmatched.json").write_text(json.dumps(ambiguous,ensure_ascii=False,indent=2)+"\n")
print(f"Matched {len(details)}/{len(films)} films; {len(ambiguous)} need manual review.")

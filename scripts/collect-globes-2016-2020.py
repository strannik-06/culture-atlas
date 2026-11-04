"""Normalize the Golden Globes' public award database; no provider guesses."""
import concurrent.futures, html, json, re, urllib.request
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
old=json.loads((ROOT/'imports/globes-2021-2025-source.json').read_text())
labels={c['original_category']:c['name'] for c in old['events'][0]['categories']}
order=list(labels)
dates={
2016:('2016-01-10','https://goldenglobes.com/articles/date-set-2016-golden-globes/'),
2017:('2017-01-08','https://goldenglobes.com/articles/presenters-at-the-74th-annual-golden-globe-awards/'),
2018:('2018-01-07','https://goldenglobes.com/articles/logo-unveiled-celebrating-golden-globes-75th-anniversary/'),
2019:('2019-01-06','https://goldenglobes.com/articles/hfpa-announces-timetable-for-the-76th-golden-globe-awards/'),
2020:('2020-01-05','https://goldenglobes.com/articles/timeline-for-77th-golden-globes-announced/')}
def title(s):
 s=html.unescape(s).strip()
 # Source title indexing places articles before any parenthesized year.
 s=re.sub(r'^(.*), (The|A|An)( \(\d{4}\))?$',lambda m:m[2]+' '+m[1]+(m[3] or ''),s)
 return s

def collect(y):
 url=f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={y}'
 raw=json.load(urllib.request.urlopen(url,timeout=45))
 by={c['award']:c for c in raw}
 cats=[]
 for label in order:
  c=by[label];rows=[]
  for n in c['nominations']:
   # Two 2019 animation records are incorrectly assigned to 2018 in today's API.
   # The contemporaneous 75th nominations announcement lists the five actual nominees.
   if y==2018 and n['id'] in (72459,72460): continue
   film=n.get('show') or n['nominees'][0]
   people=n['nominees'] if n.get('show') else []
   assert '/film/' in film['link'],(y,label,n)
   rows.append(dict(title=title(film['title']),person=', '.join(html.unescape(p['title']) for p in people),winner=n['winner'],source_id=n['id'],film_source=film['link']))
  person_aliases={'Mary Blige':('Mary J. Blige','https://goldenglobes.com/person/mary-j-blige/'),'Roman Davis':('Roman Griffin Davis','https://goldenglobes.com/person/roman-griffin-davis/'),'Richard Grant':('Richard E. Grant','https://goldenglobes.com/video/melissa-mccarthy-and-richard-e-grant-on-can-you-ever-forgive-me/'),'Bong Joon Ho, Han Won':('Bong Joon Ho, Han Jin Won','https://goldenglobes.com/person/han-won/')}
  for row in rows:
   if row['person'] in person_aliases:
    original=row['person'];row['person'],row['person_source']=person_aliases[original];row['source_original_person']=original
  assert len(rows)==5,(y,label,len(rows))
  assert sum(r['winner'] for r in rows)==1,(y,label)
  cats.append(dict(name=labels[label],original_category=label,entries=rows))
 date,date_source=dates[y]
 return dict(event='Golden Globes',year=y,section='Major Film Categories',source=f'https://goldenglobes.com/winners-nominees/?year={y}',data_source=url,ceremony_date=date,date_source=date_source,categories=cats)
with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:events=list(pool.map(collect,range(2016,2021)))
out=dict(scope=old['scope'],source_corrections=[dict(year=2018,category='Best Motion Picture - Animated',excluded_source_ids=[72459,72460],excluded_titles=['Ralph Breaks the Internet','Incredibles 2'],reason='These two 2019 nominees are also incorrectly assigned to 2018 in the current database. The contemporaneous official announcement gives exactly The Boss Baby, The Breadwinner, Coco, Ferdinand and Loving Vincent.',source='https://goldenglobes.com/contributors/ana-maria-bahianaana-maria-bahianaana-maria-bahianaana-maria-bahiana/')],events=events)
(ROOT/'imports/globes-2016-2020-source.json').write_text(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
for e in events: print(e['year'],len(e['categories']),sum(len(c['entries']) for c in e['categories']),len({r['title'] for c in e['categories'] for r in c['entries']}))

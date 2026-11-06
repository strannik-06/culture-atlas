"""Normalize downloaded official ceremony archives; preserve historical categories and credits.
Download the linked archives into CACHE first; never infer winners from row order.
"""
import html as htmlmod
import json
import re
from datetime import datetime
from pathlib import Path
from lxml import html
CACHE=Path('/tmp/awards-2001-2005')
ROOT=Path(__file__).resolve().parents[1]
clean=lambda s:' '.join(str(s or '').split())
def text(node,xpath):return clean(' '.join(node.xpath(xpath)))
def save(slug,events,**extra):
 (ROOT/f'imports/{slug}-2001-2005-source.json').write_text(json.dumps(dict(scope='Historically available established major feature-film categories; ceremony year',**extra,events=events),ensure_ascii=False,indent=2)+'\n')
 for e in events:print(slug,e['year'],[(c['name'],len(c['entries'])) for c in e['categories']],flush=True)

# Academy annual pages group each category and label each winner explicitly.
labels=['Best Picture','Directing','Actor in a Leading Role','Actress in a Leading Role','Actor in a Supporting Role','Actress in a Supporting Role','Writing (Original Screenplay)','Writing (Adapted Screenplay)','International Feature Film','Documentary Feature Film','Animated Feature Film']
aliases={'Writing (Screenplay Written Directly for the Screen)':'Writing (Original Screenplay)','Writing (Screenplay Based on Material Previously Produced or Published)':'Writing (Adapted Screenplay)','Writing (Adapted Screenplay)':'Writing (Adapted Screenplay)','Foreign Language Film':'International Feature Film','Documentary (Feature)':'Documentary Feature Film','Animated Feature Film':'Animated Feature Film'}
events=[]
for year in range(2001,2006):
 tree=html.fromstring((CACHE/f'oscars-{year}.html').read_bytes());cats={}
 for node in tree.xpath('//*[contains(@class,"paragraph--type--award-category")]'):
  original=text(node,'.//*[contains(@class,"field--name-field-award-category-oscars")]/text()');name=aliases.get(original,original)
  if name not in labels:continue
  rows=[]
  for row in node.xpath('.//*[contains(@class,"paragraph--type--award-honoree")]'):
   person=text(row,'.//*[contains(@class,"field--name-field-award-entities")]//text()');title=text(row,'.//*[contains(@class,"field--name-field-award-film")]//text()')
   assert title,(year,name,person)
   rows.append(dict(title=title,person=person,winner=bool(row.xpath('.//*[contains(@class,"field--name-field-honoree-type") and contains(@class,"winner")]'))))
  assert sum(r['winner'] for r in rows)==1,(year,name)
  cats[name]=dict(name=name,source_name=original,entries=rows)
 assert len(cats)==(10 if year==2001 else 11),(year,list(cats))
 rawdate=text(tree,'//*[contains(@class,"field--name-field-date-time")]/text()');date=datetime.strptime(rawdate.split(', ',1)[1],'%B %d, %Y').date().isoformat()
 events.append(dict(event='Oscars',year=year,section='Major Film Categories',source=f'https://www.oscars.org/oscars/ceremonies/{year}',ceremony_date=date,date_source=f'https://www.oscars.org/oscars/ceremonies/{year}',categories=[cats[n] for n in labels if n in cats]))
save('oscars',events)

# BAFTA's archive reverses title/person display for performance nominations.
labels={'Film':'Best Film','David Lean Award for Achievement in Direction':'Director','Alexander Korda Award for the outstanding British Film of the Year':'Outstanding British Film','Leading Actor':'Leading Actor','Leading Actress':'Leading Actress','Supporting Actor':'Supporting Actor','Supporting Actress':'Supporting Actress','Original Screenplay':'Original Screenplay','Adapted Screenplay':'Adapted Screenplay','Film Not in the English Language':'Film Not in the English Language'}
events=[]
for year in range(2001,2006):
 tree=html.fromstring((CACHE/f'bafta-{year}.html').read_bytes());cats={}
 for row in tree.xpath('//article[contains(@class,"tile--nomination")]'):
  original=text(row,'.//div[@class="visuallyhidden"]//text()')
  if original not in labels:continue
  name=labels[original];heading=text(row,'.//h3//text()');people=text(row,'.//*[contains(@class,"nomination__nominees")]//text()')
  # Preserve individual people from list markup, separated with commas.
  names=row.xpath('.//*[contains(@class,"nomination__nominees")]//li/text()')
  if names:people=', '.join(map(clean,names))
  title,person=(people,heading) if name in ['Leading Actor','Leading Actress','Supporting Actor','Supporting Actress'] else (heading,people)
  assert title and person,(year,name,title,person)
  cat=cats.setdefault(name,dict(name=name,source_name=original,entries=[]));cat['entries'].append(dict(title=title,person=person,winner='nomination--winner' in row.get('class',''),source_id=row.get('data-nomination-id')))
 assert len(cats)==10,(year,list(cats))
 for c in cats.values():assert sum(r['winner'] for r in c['entries'])==1,(year,c)
 events.append(dict(event='BAFTA',year=year,section='Major Film Categories',source=f'https://www.bafta.org/awards/film/?award-year={year}',note='Documentary and Animated Film were not awarded in this edition. Historical category names and nomination counts are retained.',categories=sorted(cats.values(),key=lambda c:list(labels.values()).index(c['name']))))
save('bafta',events)

# Golden Globes public awards database; exclude television and music categories.
previous=json.loads((ROOT/'imports/globes-2006-2010-source.json').read_text())
labels={c['original_category']:c['name'] for c in previous['events'][0]['categories']}
events=[]
for year in range(2001,2006):
 raw=json.loads((CACHE/f'globes-{year}.html').read_text());cats=[]
 for label,display in labels.items():
  source=next(c for c in raw if c['award']==label);rows=[]
  for n in source['nominations']:
   if year==2001 and n['id']==72169:continue # Tilda Swinton's The Deep End nomination belongs to 2002, as the official 2002 archive confirms.
   if year==2001 and n['id']==69617:n={**n,'show':{'title':'Dancer in the Dark','link':'https://goldenglobes.com/film/dancer-in-the-dark/'},'nominees':[{'title':'Björk'}]} # Official Globes retrospective confirms the missing performance.
   f=n.get('show') or n['nominees'][0];assert '/film/' in f['link']
   title=htmlmod.unescape(f['title']).strip();title=re.sub(r'^(.*), (The|A|An)( \(\d{4}\))?$',lambda m:m[2]+' '+m[1]+(m[3] or ''),title)
   person=', '.join(htmlmod.unescape(p['title']) for p in n['nominees']) if n.get('show') else ''
   rows.append(dict(title=title,person=person,winner=n['winner'],source_id=n['id'],film_source=f['link']))
  if label in ['Best Screenplay - Motion Picture','Best Director - Motion Picture']:
   grouped={}
   for row in rows:
    if row['title'] not in grouped:grouped[row['title']]={**row,'source_ids':[row['source_id']]}
    else:
     g=grouped[row['title']];assert g['winner']==row['winner'];g['person']+=', '+row['person'];g['source_ids'].append(row['source_id'])
   rows=list(grouped.values())
  assert sum(r['winner'] for r in rows)>=1,(year,label)
  cats.append(dict(name=display,original_category=label,entries=rows))
 events.append(dict(event='Golden Globes',year=year,section='Major Film Categories',source=f'https://goldenglobes.com/winners-nominees/?year={year}',data_source=f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={year}',note='Animated Feature was not introduced until 2007.',categories=cats))
save('globes',events)

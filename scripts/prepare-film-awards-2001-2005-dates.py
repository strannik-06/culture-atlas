"""Append verified date-only metadata for the 30 historical editions.
Official archives supply Oscar, Berlin and Venice dates. Explicit secondary
edition references supply dates where the results archive omits them.
"""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
load=lambda p:json.loads((ROOT/p).read_text())
p=ROOT/'imports/award-event-dates.json';data=json.loads(p.read_text())
data['editions']=[e for e in data['editions'] if not(e['section']=='films' and 2001<=e['year']<=2005)]
bafta=['02-25','02-24','02-23','02-15','02-12'];globes=['01-21','01-20','01-19','01-25','01-16'];cannes=[('05-09','05-20'),('05-15','05-26'),('05-14','05-25'),('05-12','05-23'),('05-11','05-22')]
ordinals=['58th','59th','60th','61st','62nd']
for slug in ['oscars','bafta','globes','cannes','venice','berlinale']:
 for e in load(f'imports/{slug}-2001-2005-source.json')['events']:
  year=e['year'];i=year-2001
  if slug=='oscars':dates=[dict(label='Ceremony',start=e['ceremony_date'],source=e['source'])]
  elif slug in ['venice','berlinale']:dates=e['dates']
  elif slug=='bafta':dates=[dict(label='Ceremony',start=f'{year}-{bafta[i]}',source=f'https://en.wikipedia.org/wiki/{year-1947}th_British_Academy_Film_Awards')]
  elif slug=='globes':dates=[dict(label='Ceremony',start=f'{year}-{globes[i]}',source=f'https://en.wikipedia.org/wiki/{ordinals[i]}_Golden_Globe_Awards')]
  else:dates=[dict(label='Festival',start=f'{year}-{cannes[i][0]}',end=f'{year}-{cannes[i][1]}',source=f'https://en.wikipedia.org/wiki/{year}_Cannes_Film_Festival')]
  data['editions'].append(dict(section='films',event=e['event'],year=year,dates=dates))
p.write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')

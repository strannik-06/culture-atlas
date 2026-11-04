"""Merge sourced actual event dates for the 2016–2020 film batch."""
import json
from pathlib import Path
root=Path(__file__).resolve().parent.parent
load=lambda p:json.loads((root/p).read_text())
p=root/'imports/award-event-dates.json'
d=json.loads(p.read_text())
d['editions']=[e for e in d['editions'] if not(e['section']=='films' and 2016<=e['year']<=2020)]
d['editions']+=load('imports/oscars-2016-2020-dates.json')
for slug in ['bafta','globes','berlinale','venice']:
 for e in load(f'imports/{slug}-2016-2020-source.json')['events']:
  dates=e.get('dates')
  if not isinstance(dates,list):
   dates=[{'label':'Ceremony','start':e['ceremony_date'],'source':e['date_source']}]
  d['editions'].append({'section':'films','event':e['event'],'year':e['year'],'dates':dates})
sources={2016:('05-11','05-22','https://www.festival-cannes.com/en/press/press-releases/official-poster-for-the-69th-festival-de-cannes/'),2017:('05-17','05-28','https://www.festival-cannes.com/en/2016/submission-of-films-for-2017/'),2018:('05-08','05-19','https://www.festival-cannes.com/en/press/press-releases/dates-for-the-2018-festival-de-cannes/'),2019:('05-14','05-25','https://www.festival-cannes.com/en/press/press-releases/alejandro-gonzalez-inarritu-jury-president-of-the-festival-de-cannes-2019/')}
for year,(start,end,source) in sources.items():d['editions'].append({'section':'films','event':'Cannes','year':year,'dates':[{'label':'Festival','start':f'{year}-{start}','end':f'{year}-{end}','source':source}]})
d['editions'].append({'section':'films','event':'Cannes','year':2020,'status':'not-held','dates':[],'note':'Usual feature competitions and jury awards were not held.','source':'https://www.festival-cannes.com/en/press/press-releases/the-official-selection-2020/'})
p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')

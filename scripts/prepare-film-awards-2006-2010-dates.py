"""Merge sourced 2006–2010 ceremony/festival dates without changing other editions."""
import json
from pathlib import Path
root=Path(__file__).resolve().parent.parent
load=lambda p:json.loads((root/p).read_text())
p=root/'imports/award-event-dates.json';d=json.loads(p.read_text())
d['editions']=[e for e in d['editions'] if not(e['section']=='films' and 2006<=e['year']<=2010)]
d['editions']+=load('imports/oscars-2006-2010-dates.json')
for slug in ['bafta','globes','berlinale','venice','cannes']:
 for e in load(f'imports/{slug}-2006-2010-source.json')['events']:
  dates=e.get('dates')
  if not isinstance(dates,list):
   if 'ceremony_date' in e:dates=[{'label':'Ceremony','start':e['ceremony_date'],'source':e['date_source']}]
   elif 'announcement_date' in e:dates=[{'label':e.get('date_label','Winner announcement'),'start':e['announcement_date'],'source':e['date_source']}]
   else:dates=next(x['dates'] for x in load(f'imports/{slug}-2006-2010-dates.json') if x['year']==e['year'])
  d['editions'].append({'section':'films','event':e['event'],'year':e['year'],'dates':dates})
p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')

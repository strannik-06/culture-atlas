"""Rebuild normalized official archive evidence (Python 3 + lxml).
Downloads cache into /tmp/berlin-source by default. Does not touch catalogue data.
"""
import concurrent.futures
import json
import re
import urllib.request
from pathlib import Path
from lxml import html

CACHE=Path('/tmp/berlin-source')
CACHE.mkdir(exist_ok=True)
BASE='https://www.berlinale.de'

def fetch(key,url):
    path=CACHE/(key+'.html')
    if not path.exists():
        path.write_bytes(urllib.request.urlopen(url,timeout=90).read())
    return path.read_text()

def clean(s):return ' '.join(s.split())
def data(text):return json.JSONDecoder().raw_decode(text.split('initial_result: ',1)[1])[0]
def content(node,cls):return clean(' '.join(node.xpath('.//*[contains(concat(" ",normalize-space(@class)," ")," '+cls+' ")]//text()')))

tasks=[]
for year in range(2011,2016):
    for page in range(1,4):
        tasks.append((f'programme-{year}-{page}',f'{BASE}/en/archive/programme/programme-archive.html/y={year}/o=asc/p={page}/rp=200'))
    tasks.extend([(f'awards-{year}',f'{BASE}/en/archive/awards-juries/awards.html/y={year}/o=desc/p=1/rp=40'),(f'yearbook-{year}',f'{BASE}/en/archive/yearbooks/{year}.html')])
with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
    list(pool.map(lambda t:fetch(*t),tasks))

events=[]
expected={2011:[16],2012:[18],2013:[19],2014:[20],2015:[19]}
for year in range(2011,2016):
    programme=f'{BASE}/en/archive/programme/programme-archive.html/y={year}/o=asc/p=1/rp=200'
    awards=f'{BASE}/en/archive/awards-juries/awards.html/y={year}/o=desc/p=1/rp=40'
    yearbook=f'{BASE}/en/archive/yearbooks/{year}.html'
    date_text=clean(' '.join(html.fromstring((CACHE/f'yearbook-{year}.html').read_text()).xpath('//main//text()')))
    dates={2011:('2011-02-10','2011-02-20'),2012:('2012-02-09','2012-02-19'),2013:('2013-02-07','2013-02-17'),2014:('2014-02-06','2014-02-16'),2015:('2015-02-05','2015-02-15')}
    date_match=re.search(r'February \d+ – (?:March )?\d+, '+str(year),date_text)
    assert date_match, year
    event={'event':'Berlinale','year':year,'section':'Official Selection','source':programme,'awardsSource':awards,'dates':[{'label':'Festival','start':dates[year][0],'end':dates[year][1],'source':yearbook}],'date_source_text':date_match.group(),'programmes':[]}
    programmes={'Main Competition':{'name':'Main Competition','source':programme,'awardsSource':awards,'selection':[],'prizes':[]}}
    seen=set()
    for page in range(1,4):
        result=data((CACHE/f'programme-{year}-{page}.html').read_text())
        assert result['total']<=600
        for row in result['items']:
            if row['id'] in seen:continue
            seen.add(row['id'])
            node=html.fromstring(row['markup'])
            section=content(node,'section-tag')
            if section==f'Competition {year}':name='Main Competition'
            else:continue
            title=content(node,'ft__title')
            aliases=[clean(v) for v in content(node,'ft__other-title').split('|') if clean(v)]
            staff=content(node,'staff')
            director=staff.split(' | with ')[0].removeprefix('by ')
            country=content(node,'country')
            production_year=int(re.search(r'(\d{4})\s*$',country).group(1))
            runtime=int(re.search(r'\d+',content(node,'filmlength')).group())
            assert title and director and runtime>=40,(year,title)
            programmes[name]['selection'].append({'title':title,'aliases':aliases,'director':director,'year':production_year,'runtime':runtime,'source':BASE+row['targetPath']})
    award_tree=html.fromstring(data((CACHE/f'awards-{year}.html').read_text())['items'])
    by_url={f['source']:(p,f) for p in programmes.values() for f in p['selection']}
    for container in award_tree.xpath('//*[contains(concat(" ",normalize-space(@class)," ")," award-list__container ")]'):
        jury=clean(container.getprevious().text_content())
        included=jury==f'International Jury {year}' or 'First Feature' in jury or 'Documentary Award' in jury or 'Encounters' in jury
        if not included:continue
        for item in container.xpath('./div[contains(@class,"award-list__item")]'):
            original_name=content(item,'award-list__type')
            detail=item.xpath('.//*[contains(@class,"award-list__details")]/p')[0]
            for link in detail.xpath('.//a[contains(@href,"/programme/")]'):
                source=BASE+link.get('href')
                if source not in by_url:continue
                programme,film=by_url[source]
                name=original_name
                if name=='Golden Bear' or name.startswith('Golden Bear for Best Film'):name='Golden Bear for Best Film'
                historical_names={'Jury Grand Prix - Silver Bear':'Silver Bear Grand Jury Prize','Jury Grand Prix (Silver Bear)':'Silver Bear Grand Jury Prize','Alfred Bauer Prize':'Silver Bear Alfred Bauer Prize','Alfred Bauer Prize (Silver Bear)':'Silver Bear Alfred Bauer Prize','Award for Best Director (Silver Bear)':'Silver Bear for Best Director','Award for Best Actress (Silver Bear)':'Silver Bear for Best Actress','Award for Best Actor (Silver Bear)':'Silver Bear for Best Actor','Award for Best Script (Silver Bear)':'Silver Bear for Best Screenplay','Silver Bear for Best Script':'Silver Bear for Best Screenplay'}
                name=historical_names.get(name,name)
                if 'Encounters' in jury:name='Encounters '+name
                if name.startswith('Special Mention') and 'First Feature' in jury:name='GWFF Best First Feature Award – Special Mention'
                if name.startswith('Special Mention') and 'Documentary' in jury:name='Berlinale Documentary Award – Special Mention'
                if name in ['Best First Feature Award','GWFF Best First Feature']:name='GWFF Best First Feature Award'
                prefix=html.tostring(detail,encoding='unicode').split('<a ',1)[0]+' </p>'
                before=clean(html.fromstring(prefix).text_content())
                before=re.sub(r' for (?:the )?(?:cinematography|camera|photography|production design|editing|costume and production design) in$','',before)
                before=re.sub(r' \(in the category [^)]+\)$','',before)
                before=re.sub(r'^ex aequo\s*','',before)
                people=[before] if before and before!='ex aequo' else []
                award={'name':name,'source_name':original_name,'jury':jury,'source':awards,'source_text':clean(detail.text_content()),'entries':[{'title':film['title'],'winner':True,'people':people}]}
                programme['prizes'].append(award)
    event['programmes']=list(programmes.values())
    assert [len(p['selection']) for p in event['programmes']]==expected[year]
    events.append(event)
output={'scope':'Main Competition (final actual competitors) 2011–2015. Encounters did not yet exist. Official jury prizes and cross-section official prizes for selected films. Excludes out-of-competition screenings, withdrawn films, independent juries, other sections and honorary awards.','events':events}
path=Path('imports/berlinale-2011-2015-source.json');path.write_text(json.dumps(output,ensure_ascii=False,indent=2)+'\n')
for e in events:print(e['year'],[(p['name'],len(p['selection']),len(p['prizes'])) for p in e['programmes']])

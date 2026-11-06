"""Collect historical Venice evidence from La Biennale's public ASAC annual/film archive.

Only the public API used by the archive UI is requested. No credentials or private data.
Run from the repository root; optional VENICE_SOURCE_CACHE points to a scratch cache.
"""
import concurrent.futures
from datetime import datetime
import json
import os
from pathlib import Path
import re
import urllib.request
from zoneinfo import ZoneInfo

CACHE = Path(os.environ.get('VENICE_SOURCE_CACHE', '/tmp/venice-2001-2005'))
CACHE.mkdir(parents=True, exist_ok=True)
BASE = 'https://asac.labiennale.org'
YEARS = range(2001, 2006)
CLEAN = lambda value: ' '.join(str(value or '').split())


def request(index, query, cache_name):
    path = CACHE / cache_name
    if not path.exists():
        body = {'callBody': query, 'callIndex': index}
        req = urllib.request.Request(BASE + '/api/ricerca-semplice', data=json.dumps(body).encode(), headers={'Content-Type': 'application/json'})
        path.write_bytes(urllib.request.urlopen(req, timeout=45).read())
    result = json.loads(path.read_text())
    if result.get('error'):
        raise ValueError(result['error'])
    assert not result['data'].get('timed_out')
    return result['data']['hits']['hits']


def annual(year):
    rows = request('annali_cinema', {'query': {'match': {'anno': year}}}, f'annual-{year}.json')
    assert len(rows) == 1
    return rows[0]['_source']


def relevant(section, year):
    return section['titolo'] in {2001:['Venezia 58. Concorso','Cinema del Presente'],2002:['Venezia 59. Concorso','Controcorrente'],2003:['Venezia 60. Concorso','Controcorrente Concorso'],2004:['Venezia 61 In Concorso','Venezia 61 Orizzonti'],2005:['Venezia 62. - In Concorso','Orizzonti']}[year]


def collect(year):
    event = annual(year)
    sections = [section for section in event['sezione'] if relevant(section, year)]
    assert len(sections) == 2, [s['titolo'] for s in event['sezione']]
    ids = [film['id'] for section in sections for film in section['elenco_opere']]
    rows = request('cinema', {'query': {'terms': {'id': ids}}, 'size': 300}, f'films-{year}.json')
    by_id = {int(row['_id']): row['_source'] for row in rows}
    assert len(by_id) == len(ids)
    url = BASE + f'/attivita/cinema/annali?anno={year}'
    result = {'event': 'Venice', 'year': year, 'section': 'Official Selection', 'source': url, 'awardsSource': url, 'programmes': []}
    for section in sorted(sections, key=lambda section: 0 if ('Concorso' in section['titolo'] and section['titolo'].startswith('Venezia')) else 1):
        name = 'Venezia Competition' if ('Concorso' in section['titolo'] and section['titolo'].startswith('Venezia')) else ('Orizzonti' if 'Orizzonti' in section['titolo'] else 'Controcorrente' if 'Controcorrente' in section['titolo'] else 'Cinema del Presente')
        selection = []
        selected_ids = {}
        for record in sorted(section['elenco_opere'], key=lambda record: record['titolo'].lower()):
            film = by_id[record['id']]
            runtime = int(re.search(r'\d+', film['durata'])[0]) if re.search(r'\d+',str(film.get('durata',''))) else 0
            # These historical second sections are competing features/docs.
            # Two 2004 archive records omit runtime; provider verification must
            # establish feature length before inclusion.
            if name != 'Venezia Competition' and runtime < 40:
                continue
            assert runtime >= 40 or record['id'] in [7681,608], (year,record['id'],record['titolo'])
            aliases = []
            for field in ['titolo_biennale', 'titolo_originale', 'titolo_traduzione_en', 'titolo_distribuzione_en', 'titolo_attribuito_en', 'titolo_obbligatorio', 'titolo_altri_en']:
                title = CLEAN(film.get(field))
                if title and title != record['titolo'] and title not in aliases:
                    aliases.append(title)
            directors = ', '.join(CLEAN(person['nome_cognome']) for person in film.get('persona_istituzione', []) if person['ruolo'] == 'Regia')
            if record['id'] == 52718:
                directors = 'Jonathan Demme'
                aliases.append('Jimmy Carter: Man from Plains')
            assert directors
            item = {'title': record['titolo'], 'aliases': aliases, 'director': directors, 'year': film['anno_iniziale'], 'runtime': runtime or None, 'source': BASE + f"/attivita/cinema/{record['id']}"}
            if record['id'] == 179351 or str(record['id']) == '179351':
                item['year'] = 2009  # Viennale 2009 and filmmaker press kit; ASAC leaves year empty.
            if record['id'] == 52718:
                item['additional_sources'] = ['https://www.sonyclassics.com/downloads/Sony_Pictures_Classics_Non-Theatrical_Catalogue.pdf']
            selection.append(item)
            selected_ids[record['id']] = item
        labels = {4:'Silver Lion — Grand Jury Prize',26:'Volpi Cup',31:'Special Mention',39:'Lion of the Future — Special Mention',40:'Orizzonti Award',41:'Orizzonti Jury Special Mention',45:'Special Osella',258:'Outstanding Individual Contribution',259:'San Marco Award',260:'Special Directing Award',261:'Controcorrente Award',656:'Silver Lion — Special Directing Award',664:'Grand Jury Prize',665:'Best Screenplay',669:'Cinema del Presente — Lion of the Year',1362:'Cinema del Presente Special Jury Prize',1363:'Lion of the Future',1364:'Controcorrente Special Mention',1366:'Lion of the Future — Special Mention',2: 'Marcello Mastroianni Award', 6: 'Best Actor', 7: 'Best Actress', 8: 'Best Technical Contribution', 18: 'Special Jury Prize', 20: 'Golden Lion', 23: 'Best Director', 28: 'Orizzonti Award for Best Film', 29: 'Orizzonti Documentary Award', 34: 'Lion of the Future', 47: 'Silver Lion — Revelation', 586: 'Best Screenplay', 587: 'Best Cinematography', 718: 'Special Orizzonti Jury Prize', 1077: 'Special Jury Prize', 1369: 'Best Technical Contribution', 1372: 'Special Mention — Orizzonti Jury', 1373: 'Special Lion for Cinematic Innovation', 1374: 'Orizzonti Documentary Award'}
        prizes = []
        grouped = {}
        for prize in sorted(event['premi'], key=lambda prize: prize['ordine']):
            if prize['id'] not in labels:
                continue
            target_ids = [prize.get('id_opera')]
            targets = [film_id for film_id in target_ids if film_id in selected_ids]
            if not targets:
                continue
            key = (prize['id'], labels[prize['id']])
            if key not in grouped:
                item = {'name': labels[prize['id']], 'original_name': prize['titolo'], 'entries': [], 'source': url}
                grouped[key] = item
                prizes.append(item)
            for film_id in targets:
                item = grouped[key]
                entry = next((entry for entry in item['entries'] if entry['title'] == selected_ids[film_id]['title']), None)
                if entry is None:
                    entry = {'title': selected_ids[film_id]['title'], 'winner': True, 'people': []}
                    item['entries'].append(entry)
                person = CLEAN(prize.get('persona')).replace(' (I)', '')
                if person and person not in entry['people']:
                    entry['people'].append(person)
        result['programmes'].append({'name': name, 'source': url, 'awardsSource': url, 'selection': selection, 'prizes': prizes})
    # Archive dates are UTC instants for midnight Venice local time.
    local_date = lambda value: datetime.fromisoformat(value.replace('Z', '+00:00')).astimezone(ZoneInfo('Europe/Rome')).date().isoformat()
    result['dates'] = [{'label': 'Festival', 'start': local_date(event['data_inizio']), 'end': local_date(event['data_finale']), 'source': url}]
    ceremonies = [ceremony for ceremony in event.get('evento', []) if ceremony['titolo'].lower() in ['cerimonia di premiazione - chiusura', 'cerimonia di premiazione']]
    if ceremonies:
        assert len(ceremonies) == 1
        result['dates'].append({'label': 'Awards ceremony', 'start': ceremonies[0]['data'], 'source': url})
    return result


with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
    events = list(executor.map(collect, YEARS))
output = {'scope': 'Venezia Competition and the official second feature competition: Cinema del Presente (2001), Controcorrente (2002–2003), Orizzonti (2004–2005). Historical section and prize names are retained. Shorts, special screenings, out-of-competition titles, independent parallel sections and honorary/collateral awards excluded.', 'events': events}
Path('imports/venice-2001-2005-source.json').write_text(json.dumps(output, ensure_ascii=False, indent=2) + '\n')
for event in events:
    print(event['year'], [(section['name'], len(section['selection']), len(section['prizes'])) for section in event['programmes']])

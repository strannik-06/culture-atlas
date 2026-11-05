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

CACHE = Path(os.environ.get('VENICE_SOURCE_CACHE', '/tmp/venice-2006-2010'))
CACHE.mkdir(parents=True, exist_ok=True)
BASE = 'https://asac.labiennale.org'
YEARS = range(2006, 2011)
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
    return section['titolo'] in [f'Venezia {year - 1943}. - In Concorso', f'Venezia {year - 1943}. - Concorso', 'Orizzonti', 'Orizzonti - Concorso']


def collect(year):
    event = annual(year)
    sections = [section for section in event['sezione'] if relevant(section, year)]
    assert len(sections) == 2
    ids = [film['id'] for section in sections for film in section['elenco_opere']]
    rows = request('cinema', {'query': {'terms': {'id': ids}}, 'size': 300}, f'films-{year}.json')
    by_id = {int(row['_id']): row['_source'] for row in rows}
    assert len(by_id) == len(ids)
    url = BASE + f'/attivita/cinema/annali?anno={year}'
    result = {'event': 'Venice', 'year': year, 'section': 'Official Selection', 'source': url, 'awardsSource': url, 'programmes': []}
    for section in sorted(sections, key=lambda section: 0 if section['titolo'].startswith('Venezia') else 1):
        name = 'Venezia Competition' if section['titolo'].startswith('Venezia') else 'Orizzonti'
        selection = []
        selected_ids = {}
        for record in sorted(section['elenco_opere'], key=lambda record: record['titolo'].lower()):
            film = by_id[record['id']]
            runtime = int(re.search(r'\d+', film['durata'])[0])
            # Until 2009 the regular Orizzonti section consists entirely of
            # competing features/docs, including the 60-minute Crossing the Line.
            # In 2010 features and shorts/medium works share the archive section;
            # use the actual feature list (21 records), not a >=40-minute cutoff.
            feature = year <= 2009 or film.get('tipologia') == 'Lungometraggio'
            if name == 'Orizzonti' and (not feature or runtime < 40):
                continue
            assert runtime >= 40
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
            item = {'title': record['titolo'], 'aliases': aliases, 'director': directors, 'year': film['anno_iniziale'], 'runtime': runtime, 'source': BASE + f"/attivita/cinema/{record['id']}"}
            if record['id'] == 179351 or str(record['id']) == '179351':
                item['year'] = 2009  # Viennale 2009 and filmmaker press kit; ASAC leaves year empty.
            if record['id'] == 52718:
                item['additional_sources'] = ['https://www.sonyclassics.com/downloads/Sony_Pictures_Classics_Non-Theatrical_Catalogue.pdf']
            selection.append(item)
            selected_ids[record['id']] = item
        labels = {2: 'Marcello Mastroianni Award', 6: 'Best Actor', 7: 'Best Actress', 8: 'Best Technical Contribution', 18: 'Special Jury Prize', 20: 'Golden Lion', 23: 'Best Director', 28: 'Orizzonti Award for Best Film', 29: 'Orizzonti Documentary Award', 34: 'Lion of the Future', 47: 'Silver Lion — Revelation', 586: 'Best Screenplay', 587: 'Best Cinematography', 718: 'Special Orizzonti Jury Prize', 1077: 'Special Jury Prize', 1369: 'Best Technical Contribution', 1372: 'Special Mention — Orizzonti Jury', 1373: 'Special Lion for Cinematic Innovation', 1374: 'Orizzonti Documentary Award'}
        # 2007/2008 special Golden Lions for overall work are personal honours,
        # even though the archive attaches their recipients' competing film.
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
output = {'scope': 'Venezia Competition and feature-film Orizzonti Competition; official jury prizes and Lion of the Future recipients within those selections. From 2010 medium-length/short films are excluded; earlier regular feature/documentary selections retain all competing works. Events, special/out-of-competition screenings, parallel sections and honorary/collateral awards excluded.', 'events': events}
Path('imports/venice-2006-2010-source.json').write_text(json.dumps(output, ensure_ascii=False, indent=2) + '\n')
for event in events:
    print(event['year'], [(section['name'], len(section['selection']), len(section['prizes'])) for section in event['programmes']])

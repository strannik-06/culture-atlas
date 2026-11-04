"""Collect historical Golden Globes records from the official public database.

The normalized output retains nomination identities, source film links and
reviewed corrections. No catalogue or personal-data files are written.
"""
import concurrent.futures
import html
import json
import re
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
previous = json.loads((ROOT / 'imports/globes-2021-2025-source.json').read_text())
LABELS = {c['original_category']: c['name'] for c in previous['events'][0]['categories']}
DATES = {
    2011: ('2011-01-16', 'https://goldenglobes.com/articles/hfpa-announces-timetable-68th-annual-golden-globe-awards/'),
    2012: ('2012-01-15', 'https://goldenglobes.com/articles/hfpa-announces-timetable-69th-annual-golden-globe-awards/'),
    2013: ('2013-01-13', 'https://goldenglobes.com/articles/70th-golden-globes-timeline-announced/'),
    2014: ('2014-01-12', 'https://goldenglobes.com/articles/nominations-have-been-announced/'),
    2015: ('2015-01-11', 'https://goldenglobes.com/articles/nominations-have-been-announced-0/'),
}
MONEYBALL_SOURCE = 'https://goldenglobes.com/articles/69th-annual-golden-globe-awards-nominations/'


def normalize_title(value):
    value = html.unescape(value).strip()
    return re.sub(r'^(.*), (The|A|An)( \(\d{4}\))?$',
                  lambda m: m[2] + ' ' + m[1] + (m[3] or ''), value)


def normalize(year, raw):
    by_label = {category['award']: category for category in raw}
    categories = []
    for label, display in LABELS.items():
        rows = []
        for nomination in by_label[label]['nominations']:
            assert int(nomination['year']) == year
            film = nomination.get('show') or nomination['nominees'][0]
            people = nomination['nominees'] if nomination.get('show') else []
            assert '/film/' in film['link'], (year, label, nomination['id'])
            row = dict(title=normalize_title(film['title']),
                       person=', '.join(html.unescape(p['title']) for p in people),
                       winner=nomination['winner'], source_id=nomination['id'],
                       film_source=film['link'])
            if year == 2012 and nomination['id'] == 72166:
                row['source_original_person'] = row['person']
                row['person'] = 'Stan Chervin, Steven Zaillian, Aaron Sorkin'
                row['person_source'] = MONEYBALL_SOURCE
            rows.append(row)
        expected = 6 if year == 2012 and label == 'Best Motion Picture - Drama' else 3 if year == 2014 and label == 'Best Motion Picture - Animated' else 5
        assert len(rows) == expected, (year, label, len(rows))
        assert sum(row['winner'] for row in rows) == 1, (year, label)
        assert len({row['source_id'] for row in rows}) == len(rows)
        categories.append(dict(name=display, original_category=label, entries=rows))
    date, source = DATES[year]
    return dict(event='Golden Globes', year=year, section='Major Film Categories',
                source=f'https://goldenglobes.com/winners-nominees/?year={year}',
                data_source=f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={year}',
                ceremony_date=date, date_source=source, categories=categories)


def collect(year):
    url = f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={year}'
    return normalize(year, json.load(urllib.request.urlopen(url, timeout=45)))


def write(events):
    output = dict(scope=previous['scope'], source_corrections=[dict(
        year=2012, category='Best Screenplay - Motion Picture', source_id=72166,
        title='Moneyball', source_original_person='Aaron Sorkin, Stan Chervin',
        corrected_person='Stan Chervin, Steven Zaillian, Aaron Sorkin',
        reason='The current database omits Steven Zaillian; the contemporary official nominations announcement names all three writers.',
        source=MONEYBALL_SOURCE)], events=events)
    (ROOT / 'imports/globes-2011-2015-source.json').write_text(json.dumps(output, indent=2, ensure_ascii=False) + '\n')
    for event in events:
        print(event['year'], len(event['categories']),
              sum(len(c['entries']) for c in event['categories']),
              len({r['title'] for c in event['categories'] for r in c['entries']}))


if __name__ == '__main__':
    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
        write(list(pool.map(collect, range(2011, 2016))))

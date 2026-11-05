"""Collect 2006–2010 film nominations from the official Golden Globes API.

Historical category sizes and reviewed source repairs are explicit. Writes
source evidence only; no catalogue, ratings, database or shared UI changes.
"""
import concurrent.futures
import html
import json
import re
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PREVIOUS = json.loads((ROOT / 'imports/globes-2021-2025-source.json').read_text())
LABELS = {c['original_category']: c['name'] for c in PREVIOUS['events'][0]['categories']}
ANNOUNCEMENT_2006 = 'https://goldenglobes.com/articles/63rd-golden-globe-awards-nominations/'
MONIQUE_SOURCE = 'https://ir.paramount.com/static-files/0050ba1c-0090-4d55-b1d5-3becd2b038c9'
DATES = {
    2006: ('2006-01-16', 'https://goldenglobes.com/articles/golden-globe-announcements-november-16/'),
    2007: ('2007-01-15', 'https://goldenglobes.com/articles/hfpa-announces-timetable-64th-annual-golden-globe-awards/'),
    2008: ('2008-01-13', 'https://goldenglobes.com/articles/recipients-65th-annual-golden-globe-awards-be-announced-beverly-hilton-press-conference/'),
    2009: ('2009-01-11', 'https://goldenglobes.com/articles/66th-annual-golden-globe-award-winners/'),
    2010: ('2010-01-17', 'https://goldenglobes.com/articles/hfpa-finalizes-timetable-67th-annual-golden-globe-awards-telecast-will-be-aired-live-nbc/'),
}
CORRECTIONS = [
    dict(year=2006, category='Best Screenplay - Motion Picture', title='Munich', source_ids=[69980, 73121],
         reason='The API splits the two co-writers into separate nomination records. The contemporary official announcement gives one Munich nomination with Tony Kushner and Eric Roth.', source=ANNOUNCEMENT_2006),
    dict(year=2006, category='Best Screenplay - Motion Picture', title='Good Night, and Good Luck', source_id=69978,
         source_original_person='George Clooney', corrected_person='George Clooney, Grant Heslov',
         reason='Restore the co-nominated writer named in the contemporary official announcement.', source=ANNOUNCEMENT_2006),
    dict(year=2006, category='Best Screenplay - Motion Picture', title='Crash', source_id=69979,
         source_original_person='Paul Haggis', corrected_person='Paul Haggis, Bobby Moresco',
         reason='Restore the co-nominated writer named in the contemporary official announcement.', source=ANNOUNCEMENT_2006),
    dict(year=2010, category='Best Performance by a Female Actor in a Supporting Role in any Motion Picture', title='Precious: Based on the novel Push by Sapphire', source_id=71253,
         source_original_person='Mo’Nique Mo’nique', corrected_person="Mo'Nique",
         reason='Remove the duplicated stage name in the current API; contemporary BET/Paramount announcement identifies the winner as Mo\'Nique.', source=MONIQUE_SOURCE),
]


def normalize_title(value):
    value = html.unescape(value).strip()
    return re.sub(r'^(.*), (The|A|An)( \(\d{4}\))?$', lambda m: m[2] + ' ' + m[1] + (m[3] or ''), value)


def normalize(year, raw):
    by_label = {category['award']: category for category in raw}
    categories = []
    for label, display in LABELS.items():
        if year == 2006 and label == 'Best Motion Picture - Animated':
            assert label not in by_label  # Category introduced at the 2007 awards.
            continue
        rows = []
        for nomination in by_label[label]['nominations']:
            assert int(nomination['year']) == year
            if year == 2006 and nomination['id'] == 73121:
                continue  # Co-writer retained in the shared Munich nomination below.
            film = nomination.get('show') or nomination['nominees'][0]
            people = nomination['nominees'] if nomination.get('show') else []
            assert '/film/' in film['link'], (year, label, nomination['id'])
            row = dict(title=normalize_title(film['title']), person=', '.join(html.unescape(p['title']) for p in people),
                       winner=nomination['winner'], source_id=nomination['id'], film_source=film['link'])
            if year == 2006 and nomination['id'] in (69978, 69979, 69980):
                row['source_original_person'] = row['person']
                row['person'] = {69978: 'George Clooney, Grant Heslov', 69979: 'Paul Haggis, Bobby Moresco', 69980: 'Tony Kushner, Eric Roth'}[nomination['id']]
                row['person_source'] = ANNOUNCEMENT_2006
                if nomination['id'] == 69980:
                    row['source_ids'] = [69980, 73121]
                    row['source_original_persons'] = ['Tony Kushner', 'Eric Roth']
            if year == 2010 and nomination['id'] == 71253:
                row['source_original_person'] = row['person']
                row['person'] = "Mo'Nique"
                row['person_source'] = MONIQUE_SOURCE
            rows.append(row)
        expected = 3 if label == 'Best Motion Picture - Animated' and year < 2010 else 7 if year == 2008 and label == 'Best Motion Picture - Drama' else 6 if year == 2006 and label in ('Best Director - Motion Picture', 'Best Performance by an Actor in a Motion Picture - Musical or Comedy') else 5
        assert len(rows) == expected, (year, label, len(rows))
        assert sum(row['winner'] for row in rows) == 1, (year, label)
        assert len({row['source_id'] for row in rows}) == len(rows)
        categories.append(dict(name=display, original_category=label, entries=rows))
    date, source = DATES[year]
    event = dict(event='Golden Globes', year=year, section='Major Film Categories',
                 source=f'https://goldenglobes.com/winners-nominees/?year={year}',
                 data_source=f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={year}',
                 date_source=source, categories=categories)
    if year == 2008:
        event.update(announcement_date=date, date_label='Winners announcement',
                     note='The traditional ceremony was cancelled during the writers’ strike. Winners were announced at an HFPA press conference on 13 January 2008.')
    else:
        event['ceremony_date'] = date
    if year == 2006:
        event['note'] = 'The Animated Feature category began in 2007 and was not awarded in this edition.'
    return event


def collect(year):
    url = f'https://goldenglobes.com/wp-json/awdb/v1/winners-and-nominees/?year={year}'
    return normalize(year, json.load(urllib.request.urlopen(url, timeout=45)))


def write(events):
    output = dict(scope='Established major film categories that existed in each historical edition; ceremony/announcement year',
                  source_corrections=CORRECTIONS, events=events)
    (ROOT / 'imports/globes-2006-2010-source.json').write_text(json.dumps(output, indent=2, ensure_ascii=False) + '\n')
    for event in events:
        print(event['year'], len(event['categories']), sum(len(c['entries']) for c in event['categories']),
              len({r['title'] for c in event['categories'] for r in c['entries']}))


if __name__ == '__main__':
    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
        write(list(pool.map(collect, range(2006, 2011))))

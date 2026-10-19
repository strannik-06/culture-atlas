#!/usr/bin/env python3
"""Prepare the owner-permitted combined Dunno proposal; no database access."""
import argparse
import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE_ROWS = ('1276', '1359')


def proposal(source, catalogue):
    rows = [source[key] for key in SOURCE_ROWS]
    titles = [' '.join(row.get('source_title', '').split()) for row in rows]
    if titles != ['Незнайка на Луне 2', 'Незнайка на Луне'] or [row['source_year'] for row in rows] != ['1999', '1997']:
        raise ValueError('Source part identities changed; review required')
    scores = [float(row['rating']) for row in rows]
    if scores[0] != scores[1] or not .5 <= scores[0] <= 10 or scores[0] * 2 != int(scores[0] * 2):
        raise ValueError('Part ratings must be identical valid half-points; never average')
    if rows[0]['notes'] != rows[1]['notes']:
        raise ValueError('Part notes differ; review required before combining')
    work = next(work for work in catalogue if work['id'] == 'tv:99952')
    if work['tmdb_id'] != 99952 or work['imdb_id'] != 'tt0219207':
        raise ValueError('Combined catalogue identity changed')
    return {'format': 'culture-atlas-tv-progress-v1', 'replace_dekalog_episode': False,
            'ratings': [{'work_key': work['id'], 'rating': scores[0], 'rating_scope': 'whole_work',
                         'notes': rows[0]['notes'], 'watched_date': None}]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    output = args.output.resolve()
    if output == ROOT or ROOT in output.parents:
        parser.error('Personal rating files must be outside the public repository')
    with (ROOT / 'imports/personal-ratings-cleaned.csv').open(encoding='utf-8-sig', newline='') as handle:
        source = {row['source_rows']: row for row in csv.DictReader(handle)}
    text = (ROOT / 'tv-catalog.js').read_text()
    catalogue = json.loads(text.split(' = ', 1)[1].strip().removesuffix(';'))
    result = proposal(source, catalogue)
    output.mkdir(parents=True, exist_ok=True)
    target = output / 'culture-atlas-dunno-rating.json'
    target.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'proposed_ratings': 1, 'source_parts': 2, 'path': str(target),
                      'status': 'Proposal only. Merge and review before website import; existing ratings are skipped.'}))


if __name__ == '__main__':
    main()

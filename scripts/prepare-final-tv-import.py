#!/usr/bin/env python3
"""Prepare the final eight historical ratings privately; no network or database access."""
import argparse
import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def proposal(source, catalogue, plan):
    known = {work['id']: work for work in catalogue}
    ratings, audit, seen_sources, seen_targets = [], [], set(), set()
    for decision in plan['entries']:
        key = decision['accepted_work_key']
        work = known[key]
        if key in seen_targets:
            raise ValueError('Duplicate rating target')
        seen_targets.add(key)
        rows = []
        if decision['source_rows'] != [row['source_rows'] for row in decision['expected_sources']]:
            raise ValueError('Source identity plan changed')
        for expected in decision['expected_sources']:
            sr = expected['source_rows']
            if sr in seen_sources:
                raise ValueError('Source row used twice')
            seen_sources.add(sr)
            row = source[sr]
            if any(row[field] != expected[field] for field in ('source_title', 'source_year')):
                raise ValueError('Source title or year changed; review required')
            score = float(row['rating'])
            if not .5 <= score <= 10 or score * 2 != int(score * 2):
                raise ValueError('Invalid half-point source score')
            rows.append((row, score))
        if len(rows) > 1:
            if decision['decision'] != 'combined_equal_parts' or set(decision['source_rows']) != {'1276', '1359'} or key != 'tv:99952':
                raise ValueError('Only the owner-approved Dunno parts may be combined')
            if len({score for _, score in rows}) != 1 or len({row['notes'] for row, _ in rows}) != 1:
                raise ValueError('Part scores or notes differ; never average or discard')
        if decision['rating_scope'] != 'whole_work':
            raise ValueError('Unexpected reviewed scope')
        row, score = rows[0]
        rating = {'work_key': key, 'rating': score, 'rating_scope': 'whole_work',
                  'notes': row['notes'], 'watched_date': None}
        if len(rating['notes']) > 10000:
            raise ValueError('Source note exceeds import limit')
        ratings.append(rating)
        audit.append({'source_rows': ';'.join(decision['source_rows']), 'title': work['title'],
                      'scope': work.get('scope_label', 'Complete work'), **rating})
    if len(ratings) != 8 or len(seen_sources) != 9:
        raise ValueError('Final batch must resolve nine source rows into eight ratings')
    return {'format': 'culture-atlas-tv-progress-v1', 'ratings': ratings, 'replace_dekalog_episode': False}, audit


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    output = args.output.resolve()
    if output == ROOT or ROOT in output.parents:
        parser.error('Personal import files must be outside the public repository')
    with (ROOT / 'imports/personal-ratings-cleaned.csv').open(encoding='utf-8-sig', newline='') as handle:
        source = {row['source_rows']: row for row in csv.DictReader(handle)}
    text = (ROOT / 'tv-catalog.js').read_text()
    catalogue = json.loads(text.split(' = ', 1)[1].strip().removesuffix(';'))
    plan = json.loads((ROOT / 'imports/remaining-version-decisions.json').read_text())
    result, audit = proposal(source, catalogue, plan)
    output.mkdir(parents=True, exist_ok=True)
    (output / 'culture-atlas-final-8-ratings.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    with (output / 'final-8-ratings-review.csv').open('w', newline='') as handle:
        writer = csv.DictWriter(handle, fieldnames=list(audit[0]))
        writer.writeheader(); writer.writerows(audit)
    print(json.dumps({'proposed_ratings': 8, 'source_rows_resolved': 9,
                      'expected_total_if_all_missing': 2139, 'status': 'Private proposal only. No progress accessed or modified.'}))


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Apply the final reviewed overlay to the historical source ledger; metadata only."""
import argparse
from collections import Counter
import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def build():
    with (ROOT / 'import-previews/tv-version-source-catalogue-ledger.csv').open() as handle:
        ledger = list(csv.DictReader(handle))
    catalogue = json.loads((ROOT / 'tv-catalog.js').read_text().split(' = ', 1)[1].strip().removesuffix(';'))
    works = {row['id']: row for row in catalogue}
    plan = json.loads((ROOT / 'imports/remaining-version-decisions.json').read_text())
    decisions = {}
    for item in plan['entries']:
        assert item['accepted_work_key'] in works
        for sr in item['source_rows']:
            assert sr not in decisions
            decisions[sr] = item
    with (ROOT / 'imports/tv-version-56-reviewed-identities.csv').open() as handle:
        aliases = {row['source_rows']: row for row in csv.DictReader(handle) if row['decision'] == 'existing_movie_overlap'}
    assert len(aliases) == 4 and len(decisions) == 9
    resolutions = []
    for row in ledger:
        sr = row['source_rows']
        if sr in decisions:
            decision = decisions[sr]
            expected = next(item for item in decision['expected_sources'] if item['source_rows'] == sr)
            assert all(expected[k] == row[k] for k in ('source_title', 'source_year'))
            row.update(coverage_status='present_tv_catalogue', work_key=decision['accepted_work_key'])
            resolutions.append({'source_rows': sr, 'source_title': row['source_title'], 'work_key': row['work_key'], 'decision': decision['decision']})
        elif sr in aliases:
            review = aliases[sr]
            row.update(coverage_status='present_existing_film_alias', work_key='movie:' + review['existing_film_id'])
            resolutions.append({'source_rows': sr, 'source_title': row['source_title'], 'work_key': row['work_key'], 'decision': 'existing_movie_alias_no_new_rating'})
    unresolved = [row['source_rows'] for row in ledger if row['coverage_status'] not in ('present', 'present_tv_catalogue', 'present_existing_film_alias', 'duplicate_identity', 'consolidated')]
    assert len(ledger) == 2150 and len(resolutions) == 13 and not unresolved
    return {'source_entries': len(ledger), 'catalogue_tv_rating_targets': len(catalogue),
            'final_source_rows_resolved': 9, 'final_new_rating_targets': 8,
            'existing_movie_aliases_resolved_without_new_rating': 4,
            'coverage_counts': dict(sorted(Counter(row['coverage_status'] for row in ledger).items())),
            'unresolved_source_rows': unresolved, 'resolutions': resolutions,
            'note': 'Final reviewed overlay supersedes historical held decisions. Source coverage only; production progress is not read and counts are not independently verified.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    content = json.dumps(build(), ensure_ascii=False, indent=2) + '\n'
    target = ROOT / 'import-previews/final-source-coverage-summary.json'
    if args.check:
        assert target.read_text() == content, 'Final coverage summary is stale'
    else:
        target.write_text(content)
    print(json.dumps({'source_entries': 2150, 'unresolved_source_rows': 0, 'final_new_rating_targets': 8}))


if __name__ == '__main__':
    main()

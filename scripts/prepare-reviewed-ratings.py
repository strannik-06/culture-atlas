#!/usr/bin/env python3
"""Offline rating reconciliation using reviewed catalogue links; never accesses Supabase."""
import argparse
import collections
import csv
import hashlib
import json
from decimal import Decimal, InvalidOperation
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
# Reuse the explicit decisions already recorded in stage-personal-ratings.mjs.
# A changed source rating set invalidates the decision instead of selecting a new score.
PRIOR_DUPLICATE_DECISIONS = {
    49519: ({7.0, 6.5}, 6.5),
    31011: ({6.5, 7.0}, 7.0),
    13958: ({5.5, 6.0}, 6.0),
}


def read_csv(path):
    with Path(path).open(encoding='utf-8-sig', newline='') as handle:
        return list(csv.DictReader(handle))


def score(value):
    try:
        result = Decimal(str(value))
    except InvalidOperation as exc:
        raise ValueError('Invalid rating') from exc
    if not result.is_finite() or not 0 <= result <= 10 or result * 2 != (result * 2).to_integral_value():
        raise ValueError('Rating must be 0–10 in half-point steps')
    return float(result)


def progress_rows(rows):
    users = {r.get('user_id') for r in rows if r.get('user_id')}
    if len(users) > 1:
        raise ValueError('Export must contain one owner only')
    result = {}
    for row in rows:
        fid = row['film_id']
        if not fid.isdecimal() or int(fid) <= 0 or int(fid) in result:
            raise ValueError('Duplicate or invalid progress film_id')
        if row['watched'].lower() not in ('true', 'false'):
            raise ValueError('Invalid watched flag')
        result[int(fid)] = {
            'watched': row['watched'].lower() == 'true',
            'rating': score(row['rating']) if row['rating'] else None,
            'notes': row.get('notes', ''), 'watched_date': row.get('watched_date') or None,
        }
    return result


def prepare(source, ledger, films, progress=None):
    by_source = {r['source_rows']: r for r in source}
    if len(by_source) != len(source) or set(by_source) != {r['source_rows'] for r in ledger}:
        raise ValueError('Source and reviewed ledger must cover the same unique entries')
    by_id = {str(f['id']): f for f in films}
    groups = collections.defaultdict(list)
    held = []
    for row in ledger:
        original = by_source[row['source_rows']]
        if original['source_title'] != row['source_title'] or original['source_year'] != row['source_year']:
            raise ValueError('Source metadata drift at ' + row['source_rows'])
        if row['work_type'] != 'movie' or row['coverage_status'] not in ('present', 'consolidated', 'duplicate_identity'):
            held.append({'source_rows': row['source_rows'], 'reason': row['coverage_status']})
            continue
        film = by_id.get(row['catalogue_id'])
        if not film or row['work_key'] != 'movie:' + str(film['id']) or str(film['tmdb_id']) != row['tmdb_id'] or (film.get('imdb_id') or '') != row['imdb_id']:
            raise ValueError('Canonical identity drift at ' + row['source_rows'])
        if row['identity_review_required'].lower() != 'false':
            held.append({'source_rows': row['source_rows'], 'reason': 'identity_review_required'})
            continue
        groups[film['id']].append({'source_rows': row['source_rows'], 'rating': score(original['rating']), 'notes': original['notes'] or ''})
    decisions = []
    for fid, rows in groups.items():
        film = by_id[str(fid)]
        item = {'film_id': fid, 'tmdb_id': film['tmdb_id'], 'title': film['title'], 'source_entries': rows}
        ratings = {r['rating'] for r in rows}
        previous = PRIOR_DUPLICATE_DECISIONS.get(film['tmdb_id'])
        resolved = len(rows) == 2 and previous and ratings == previous[0]
        if len(ratings) != 1 and not resolved:
            item.update(decision='source_rating_conflict_no_write')
        else:
            notes = list(dict.fromkeys(r['notes'] for r in rows if r['notes']))
            item.update(rating=previous[1] if resolved else rows[0]['rating'], notes='\n'.join(notes), watched=True, watched_date=None)
            if resolved:
                item['duplicate_resolution'] = 'existing_explicit_staging_decision'
            prior = progress.get(fid) if progress is not None else None
            if progress is None:
                item['decision'] = 'needs_current_progress_export'
            elif prior is None:
                item['decision'] = 'missing_insert_candidate_after_review'
            else:
                agrees = prior['watched'] and prior['rating'] == item['rating'] and (not item['notes'] or prior['notes'] == item['notes'])
                item.update(decision='already_present_no_write' if agrees else 'existing_progress_conflict_no_write', existing=prior)
        decisions.append(item)
    return {'summary': {'source_entries': len(source), 'film_identity_groups': len(groups), 'held_source_entries': len(held),
                        'progress_snapshot_supplied': progress is not None, 'progress_rows': len(progress) if progress is not None else None,
                        'decisions': dict(sorted(collections.Counter(r['decision'] for r in decisions).items()))},
            'film_decisions': decisions, 'held_sources': held,
            'warning': 'Offline preview only. No database writes. Missing entries are candidates, not import approval. Existing progress is never replaced. Export freshness and owner must be confirmed before an import.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--progress', type=Path, help='Complete current owner-only film_progress CSV; not an audit subset')
    parser.add_argument('--output', required=True, type=Path, help='Private output directory outside the repository')
    args = parser.parse_args()
    output = args.output.resolve()
    if output == ROOT or ROOT in output.parents:
        parser.error('Personal rating reports must be saved outside the repository')
    source = ROOT / 'imports/personal-ratings-cleaned.csv'
    ledger = ROOT / 'import-previews/tv-version-source-catalogue-ledger.csv'
    catalogue = ROOT / 'film-catalog.js'
    films = json.loads(catalogue.read_text().split(' = ', 1)[1].strip().removesuffix(';'))
    if args.progress:
        with args.progress.open(encoding='utf-8-sig', newline='') as handle:
            header = next(csv.reader(handle), [])
        if not {'film_id', 'watched', 'rating', 'notes', 'watched_date'}.issubset(header):
            parser.error('Export requires film_id, watched, rating, notes and watched_date columns')
    report = prepare(read_csv(source), read_csv(ledger), films, progress_rows(read_csv(args.progress)) if args.progress else None)
    report['input_sha256'] = {name: hashlib.sha256(path.read_bytes()).hexdigest() for name, path in [('source', source), ('ledger', ledger), ('catalogue', catalogue)]}
    if args.progress:
        report['input_sha256']['progress'] = hashlib.sha256(args.progress.read_bytes()).hexdigest()
    output.mkdir(parents=True, exist_ok=True)
    (output / 'reviewed-ratings-reconciliation.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(report['summary'], indent=2))


if __name__ == '__main__':
    main()

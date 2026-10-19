#!/usr/bin/env python3
"""Reproduce the reviewed TV catalogue and source ledger without network/progress access."""
import argparse
import collections
import csv
import hashlib
import io
import json
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[1]
BASE = 'e3316643f3aa5200afe5451710b8661a6f1b51bf'


def at_base(path):
    return subprocess.check_output(['git', 'show', BASE + ':' + path], cwd=ROOT)


def rows(content):
    return list(csv.DictReader(io.StringIO(content.decode('utf-8-sig'))))


def csv_text(items):
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream, fieldnames=list(items[0]), lineterminator='\n')
    writer.writeheader()
    writer.writerows(items)
    return stream.getvalue()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    evidence_path = ROOT / 'imports/tv-version-56-tmdb-evidence.json'
    review_path = ROOT / 'imports/tv-version-56-reviewed-identities.csv'
    evidence = json.loads(evidence_path.read_text())
    reviews = rows(review_path.read_bytes())
    baseline = rows(at_base('import-previews/current-source-catalogue-ledger.csv'))
    pending = {r['source_rows']: r for r in baseline if r['coverage_status'] == 'deferred_tv_or_version_review'}
    assert evidence['base_commit'] == BASE and evidence['source_count'] == len(evidence['entries']) == 56
    by_source = {r['source_rows']: r for r in evidence['entries']}
    assert len(reviews) == len({r['source_rows'] for r in reviews}) == len(pending) == 56
    assert set(by_source) == set(pending) == {r['source_rows'] for r in reviews}
    film_bytes = at_base('film-catalog.js')
    baseline_films = json.loads(film_bytes.decode().split(' = ', 1)[1].strip().removesuffix(';'))
    films = json.loads((ROOT / 'film-catalog.js').read_text().split(' = ', 1)[1].strip().removesuffix(';'))
    assert len(baseline_films) == 2251
    assert films[:2251] == baseline_films, 'Existing film IDs and metadata must remain unchanged'
    assert len(films) == 2252 and films[-1]['id'] == 2253 and films[-1]['tmdb_id'] == 133919
    movie = next(c for c in by_source['1824']['candidates'] if c['media_type'] == 'movie' and c['tmdb_id'] == 133919)
    assert movie['runtime'] == 169 and movie['imdb_id'] == 'tt6725014'
    assert [d['name'] for d in movie['directors']] == ['Ingmar Bergman']
    expected_movie = {'id': 2253, 'title': movie['title'], 'director': 'Ingmar Bergman', 'year': int(movie['release_date'][:4]), 'tmdb_id': 133919, 'imdb_id': movie['imdb_id']}
    assert films[-1] == expected_movie
    imdb_films = {f['imdb_id']: f for f in films if f.get('imdb_id')}
    known_ids = {str(f['id']) for f in films}
    tv = []
    chosen = {}
    for r in reviews:
        sr = r['source_rows']
        prev = pending[sr]
        assert all(r[k] == prev[k] for k in ['source_title', 'source_director', 'source_year']), 'Source drift: ' + sr
        assert r['reason'] and 'source_rows=' + sr in r['evidence_ref']
        if r['decision'] == 'verified_new_tv_identity':
            tid = int(r['accepted_tmdb_tv_id'])
            f = next(c for c in by_source[sr]['candidates'] if c['media_type'] == 'tv' and c['tmdb_id'] == tid)
            assert f['imdb_id'] and f['imdb_id'] not in imdb_films, 'Existing movie overlap requires separate handling'
            assert r['accepted_work_key'] == 'tv:' + str(tid)
            kind = 'miniseries' if f['series_type'] == 'Miniseries' or sr in ['1570', '1716'] else 'series' if f['season_count'] > 1 else 'unknown'
            item = {'id': r['accepted_work_key'], 'work_type': 'tv', 'series_kind': kind,
                    'title': f['title'], 'original_title': f['original_title'], 'year': int(f['release_date'][:4]),
                    'first_air_date': f['release_date'], 'tmdb_id': tid, 'imdb_id': f['imdb_id'],
                    'original_language': f['original_language'], 'creators': f['creators'],
                    'directors': f['directors'], 'poster_path': f['poster_path']}
            tv.append(item)
            chosen[sr] = item
        elif r['decision'] == 'verified_new_movie_identity':
            assert sr == '1824' and r['accepted_work_key'] == 'movie:2253'
            assert r['rating_scope'] == 'owner_confirmed_theatrical_edit'
            chosen[sr] = films[-1]
        else:
            assert not r['accepted_work_key'] and not r['accepted_tmdb_tv_id'], 'Pending candidate promoted to active work'
            if r['existing_film_id']:
                assert r['existing_film_id'] in known_ids
                for tid in r['candidate_tmdb_tv_ids'].split(';'):
                    f = next(c for c in by_source[sr]['candidates'] if c['media_type'] == 'tv' and str(c['tmdb_id']) == tid)
                    assert str(imdb_films[f['imdb_id']]['id']) == r['existing_film_id']
    assert len(tv) == len({f['id'] for f in tv}) == len({f['imdb_id'] for f in tv}) == 43
    assert chosen['1532']['id'] == 'tv:42699' and chosen['1570']['id'] == 'tv:43090'
    assert chosen['673']['id'] == 'tv:19885' and chosen['1057']['id'] == 'tv:68187'
    decisions = {r['source_rows']: r for r in reviews}
    assert decisions['1532']['rating_scope'] == 'owner_confirmed_whole_cycle'
    assert decisions['1570']['rating_scope'] == 'owner_confirmed_whole_four_part_miniseries'
    assert decisions['1625']['rating_scope'] == 'owner_confirmed_wider_series'
    clarifications = json.loads((ROOT / 'imports/tv-version-owner-clarifications.json').read_text())
    for decision in clarifications['decisions']:
        for sr in decision['source_rows']:
            assert decisions[sr]['rating_scope'].startswith('owner_confirmed_')
            assert 'tv-version-owner-clarifications.json' in decisions[sr]['evidence_ref']
    ledger = []
    for prev in baseline:
        r = dict(prev)
        r['work_key'] = 'movie:' + r['catalogue_id'] if r['catalogue_id'] else ''
        r['work_type'] = 'movie' if r['catalogue_id'] else ''
        r['rating_scope'] = 'outside_tv_review'
        d = decisions.get(r['source_rows'])
        if d:
            r['rating_scope'] = d['rating_scope']
            r['identity_audit_status'] = d['decision']
            r['identity_audit_evidence'] = d['evidence_ref']
            r['reason'] = d['reason']
            f = chosen.get(r['source_rows'])
            if f and d['decision'] == 'verified_new_movie_identity':
                r.update(coverage_status='present', catalogue_id=f['id'], catalogue_title=f['title'],
                         catalogue_director=f['director'], catalogue_year=f['year'], tmdb_media_type='movie',
                         tmdb_id=f['tmdb_id'], imdb_id=f['imdb_id'], identity_review_required='false',
                         link_basis='reviewed_live_tmdb_theatrical_identity', work_key='movie:' + str(f['id']), work_type='movie')
            elif f:
                r.update(coverage_status='present_tv_catalogue', catalogue_id=f['id'], catalogue_title=f['title'],
                         catalogue_director='; '.join(p['name'] for p in f['directors']), catalogue_year=f['year'],
                         tmdb_media_type='tv', tmdb_id=f['tmdb_id'], imdb_id=f['imdb_id'],
                         link_basis='reviewed_live_tmdb_tv_identity', work_key=f['id'], work_type='tv')
        ledger.append(r)
    assert len(ledger) == 2150
    summary = {'base_commit': BASE, 'source_entries': len(ledger), 'deferred_sources_reviewed': 56,
               'film_entries_preserved': len(baseline_films), 'new_movie_entries': 1, 'film_entries': len(films), 'new_tv_entries': len(tv), 'combined_work_entries': len(films) + len(tv),
               'review_decisions': dict(sorted(collections.Counter(r['decision'] for r in reviews).items())),
               'coverage_counts': dict(sorted(collections.Counter(r['coverage_status'] for r in ledger).items())),
               'workflow_run_id': evidence['workflow_run_id'], 'lookup_errors': evidence['errors'],
               'film_catalogue_sha256': hashlib.sha256((ROOT / 'film-catalog.js').read_bytes()).hexdigest(),
               'review_sha256': hashlib.sha256(review_path.read_bytes()).hexdigest(),
               'evidence_sha256': hashlib.sha256(evidence_path.read_bytes()).hexdigest(),
               'warning': 'Catalogue identity only. TV UI and progress storage are not activated; no ratings or Supabase access. Held candidates are not active targets.'}
    outputs = {'tv-catalog.js': 'window.CULTURE_TV_CATALOG = ' + json.dumps(tv, ensure_ascii=False, indent=2) + ';\n',
               'import-previews/tv-version-source-catalogue-ledger.csv': csv_text(ledger),
               'import-previews/tv-version-56-summary.json': json.dumps(summary, ensure_ascii=False, indent=2) + '\n'}
    for name, content in outputs.items():
        if args.check:
            assert (ROOT / name).read_text() == content, 'Stale output: ' + name
        else:
            (ROOT / name).write_text(content)
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()

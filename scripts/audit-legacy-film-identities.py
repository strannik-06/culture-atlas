#!/usr/bin/env python3
"""Apply the explicit 699-row identity review to the merged PR #87 snapshot.

Default writes metadata-only audit outputs. --check reproduces them in memory.
No searching, fuzzy approval, rating selection, progress or network access.
"""
import argparse
import collections
import csv
import hashlib
import io
import json
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[1]
BASE = 'a6793872940f48e18bb10aa854f3be5b585697bd'
REVIEW = 'imports/legacy-699-reviewed-identities.csv'
EVIDENCE = 'imports/legacy-699-tmdb-evidence.json'


def at_base(path):
    return subprocess.check_output(['git', 'show', BASE + ':' + path], cwd=ROOT)


def read_csv(content):
    return list(csv.DictReader(io.StringIO(content.decode('utf-8-sig'))))


def sha(content):
    return hashlib.sha256(content).hexdigest()


def csv_text(rows):
    out = io.StringIO(newline='')
    writer = csv.DictWriter(out, fieldnames=list(rows[0]), lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
    return out.getvalue()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    old_bytes = at_base('import-previews/full-source-catalogue-ledger.csv')
    old = read_csv(old_bytes)
    assert len(old) == 2150 and len({r['source_rows'] for r in old}) == 2150
    flagged = {r['source_rows']: r for r in old if r['identity_review_required'] == 'true'}
    assert len(flagged) == 699
    review_bytes = (ROOT / REVIEW).read_bytes()
    review = read_csv(review_bytes)
    assert len(review) == 699 and len({r['source_rows'] for r in review}) == 699
    assert {r['source_rows'] for r in review} == set(flagged), 'Review must cover precisely the flagged baseline rows'
    prohibited = {'rating', 'personal_rating', 'historical_rating', 'notes', 'watched_date'}
    assert not prohibited.intersection(review[0]), 'Personal progress must not enter audit outputs'
    evidence_bytes = (ROOT / EVIDENCE).read_bytes()
    evidence = json.loads(evidence_bytes)
    assert evidence['source_library_file'] == 'libfile_b86e8030b9e481918c0da1cdddd755de'
    movies = {str(f['tmdb_id']): f for f in evidence['movies']}
    assert len(movies) == len(evidence['movies']) == 618
    assert all(not prohibited.intersection(f) for f in movies.values())
    catalogue_bytes = at_base('film-catalog.js')
    assert (ROOT / 'film-catalog.js').read_bytes() == catalogue_bytes, 'This audit must not change the catalogue'
    films = json.loads(catalogue_bytes.decode().split(' = ', 1)[1].strip().removesuffix(';'))
    by_id = {str(f['id']): f for f in films}
    assert len(films) == len(by_id) == 2251
    decisions = {}
    fields = ['source_title', 'source_director', 'source_year', 'catalogue_title', 'catalogue_director', 'catalogue_year', 'tmdb_id', 'imdb_id']
    for r in review:
        sr = r['source_rows']
        prev = flagged[sr]
        assert all(r[k] == prev[k] for k in fields), 'Review silently changed source or candidate: ' + sr
        assert r['previous_catalogue_id'] == prev['catalogue_id']
        f = by_id[r['previous_catalogue_id']]
        assert all(str(f[k] if f[k] is not None else '') == r[target] for k, target in [('title', 'catalogue_title'), ('director', 'catalogue_director'), ('year', 'catalogue_year'), ('tmdb_id', 'tmdb_id'), ('imdb_id', 'imdb_id')])
        assert r['decision'] in {'verified_existing_identity', 'defer_series_episode_scope'}
        assert all(r[k] for k in ['title_review', 'director_review', 'year_review', 'evidence_basis', 'evidence_refs', 'rationale'])
        if 'saved_tmdb_details' in r['evidence_basis']:
            m = movies[r['tmdb_id']]
            assert all(m[k] == f[k] for k in ['title', 'director', 'year', 'imdb_id', 'tmdb_id'])
            assert EVIDENCE + '#tmdb_id=' + r['tmdb_id'] in r['evidence_refs']
        else:
            assert 'public_title_director_corroboration' in r['evidence_basis'] and 'https://' in r['evidence_refs']
        decisions[sr] = r
    counts = collections.Counter(r['decision'] for r in review)
    assert counts == {'verified_existing_identity': 698, 'defer_series_episode_scope': 1}
    assert decisions['1532']['decision'] == 'defer_series_episode_scope'
    current = []
    for prev in old:
        r = dict(prev)
        # The 20 additions from PR #87 are now merged and present.
        if r['coverage_status'] == 'proposed_addition':
            r['coverage_status'] = 'present'
        r['identity_audit_status'] = 'outside_699_review'
        r['identity_audit_evidence'] = ''
        d = decisions.get(r['source_rows'])
        if d:
            r['identity_audit_status'] = d['decision']
            r['identity_audit_evidence'] = REVIEW + '#source_rows=' + r['source_rows']
            r['identity_review_required'] = 'false'
            if d['decision'] == 'verified_existing_identity':
                r['link_basis'] = 'reviewed_legacy_identity'
                r['reason'] = d['rationale'] + ' ' + d['year_review']
                if r['shared_identity_source_rows']:
                    r['reason'] += ' Shared source identity retained; rating conflict review remains separate.'
            else:
                r['coverage_status'] = 'deferred_tv_or_version_review'
                r['link_basis'] = 'reviewed_scope_mismatch'
                r['reason'] = d['rationale']
                for key in ['catalogue_id', 'catalogue_title', 'catalogue_director', 'catalogue_year', 'tmdb_media_type', 'tmdb_id', 'imdb_id', 'shared_identity_source_rows']:
                    r[key] = ''
        current.append(r)
    index = {r['source_rows']: r for r in current}
    assert index['1532']['catalogue_id'] == '' and index['1532']['tmdb_id'] == ''
    assert index['849']['catalogue_id'] == '708' and index['928']['catalogue_id'] == '796'
    assert all(index[sr]['catalogue_id'] == flagged[sr]['catalogue_id'] for sr, d in decisions.items() if d['decision'] == 'verified_existing_identity')
    assert all(not r['tmdb_id'] for r in current if not r['catalogue_id'])
    year_rows = [r for r in review if r['source_year'] != r['catalogue_year']]
    assert len(year_rows) == 54 and all(abs(int(r['source_year']) - int(r['catalogue_year'])) == 1 for r in year_rows)
    summary = {
        'base_commit': BASE, 'source_entries': len(current), 'catalogue_entries': len(films),
        'flagged_links_reviewed': len(review), 'verified_existing_identities': counts['verified_existing_identity'],
        'scope_mismatches_deferred': counts['defer_series_episode_scope'],
        'remaining_link_review_flags': sum(r['identity_review_required'] == 'true' for r in current),
        'coverage_counts': dict(sorted(collections.Counter(r['coverage_status'] for r in current).items())),
        'year_discrepancies_retained': len(year_rows),
        'reviewed_records_missing_imdb_id': [r['previous_catalogue_id'] for r in review if not r['imdb_id']],
        'evidence_counts': dict(collections.Counter(r['evidence_basis'] for r in review)),
        'baseline_ledger_sha256': sha(old_bytes), 'catalogue_sha256': sha(catalogue_bytes),
        'review_sha256': sha(review_bytes), 'metadata_evidence_sha256': sha(evidence_bytes),
        'warning': '698 reviewed source-to-record identities, not a fresh TMDB/IMDb revalidation or rating-import approval. Unflagged baseline links outside this review remain at their original evidence level. No Supabase or progress access.'
    }
    outputs = {
        'import-previews/current-source-catalogue-ledger.csv': csv_text(current),
        'import-previews/legacy-699-identity-summary.json': json.dumps(summary, ensure_ascii=False, indent=2) + '\n',
        'import-previews/legacy-699-year-discrepancies.csv': csv_text([{k:r[k] for k in ['source_rows', 'source_title', 'source_year', 'catalogue_title', 'catalogue_year', 'previous_catalogue_id', 'tmdb_id', 'year_review']} for r in year_rows]),
    }
    for name, content in outputs.items():
        if args.check:
            assert (ROOT / name).read_text() == content, 'Stale audit output: ' + name
        else:
            (ROOT / name).write_text(content)
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()

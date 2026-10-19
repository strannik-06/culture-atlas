#!/usr/bin/env python3
"""Reproducible metadata-only source coverage snapshot. Never accesses Supabase.

--apply-additions appends the explicitly reviewed evidence set to the pinned base.
Default regenerates ledger/summary; --check validates without writing files.
No ratings, notes, watched dates, credentials or progress payloads are emitted.
"""
import argparse, collections, csv, hashlib, io, json, pathlib, re, subprocess, unicodedata
ROOT = pathlib.Path(__file__).resolve().parents[1]
PREFIX = 'window.CULTURE_CATALOG = '

def csv_rows(name):
    with (ROOT / name).open(encoding='utf-8-sig', newline='') as f:
        return list(csv.DictReader(f))

def catalogue(text):
    assert text.startswith(PREFIX), 'Unexpected catalogue prefix'
    return json.loads(text[len(PREFIX):].strip().removesuffix(';'))

def norm(text):
    text = re.sub(r'\([^)]*(?:к/м|м/ф|новелла|short|сериал|TV Series|телеспектакль|т/с)[^)]*\)', '', text, flags=re.I)
    return ''.join(c for c in unicodedata.normalize('NFKD', text.casefold().replace('ё', 'е')) if c.isalnum())

def integer(value):
    return str(int(float(value))) if value else ''

def main():
    ap = argparse.ArgumentParser(description=__doc__)
    group = ap.add_mutually_exclusive_group()
    group.add_argument('--apply-additions', action='store_true')
    group.add_argument('--check', action='store_true')
    args = ap.parse_args()
    evidence = json.loads((ROOT / 'imports/full-source-coverage-evidence.json').read_text())
    base_text = subprocess.check_output(['git', 'show', evidence['base_commit'] + ':film-catalog.js'], cwd=ROOT, text=True)
    base = catalogue(base_text)
    source = csv_rows('imports/personal-ratings-cleaned.csv')
    legacy = csv_rows('imports/source-catalogue-legacy-evidence.csv')
    assert len(source) == len(legacy) == 2150
    assert {r['source_rows'] for r in source} == {r['source_rows'] for r in legacy}
    old = {r['source_rows']: r for r in legacy}
    seen_tmdb = {f['tmdb_id'] for f in base}
    seen_imdb = {f['imdb_id'] for f in base if f.get('imdb_id')}
    next_id = max(f['id'] for f in base) + 1
    additions = []
    for item in evidence['additions']:
        f = item['film']
        assert f['tmdb_id'] not in seen_tmdb and f['imdb_id'] not in seen_imdb, 'Identity collision'
        assert isinstance(f['tmdb_id'], int) and f['tmdb_id'] > 0 and re.fullmatch(r'tt\d{6,}', f['imdb_id'])
        assert f['title'] and f['director'] and isinstance(f['year'], int) and item['evidence_urls']
        seen_tmdb.add(f['tmdb_id']); seen_imdb.add(f['imdb_id'])
        additions.append({'id': next_id, **f}); next_id += 1
    expected = base + additions
    current_text = (ROOT / 'film-catalog.js').read_text()
    current = catalogue(current_text)
    if args.apply_additions:
        assert current in [base, expected], 'Catalogue differs from pinned base/proposal; regenerate against new main'
        if current == base:
            assert base_text.endswith('\n];\n')
            (ROOT / 'film-catalog.js').write_text(base_text[:-4] + ',\n' + json.dumps(additions, ensure_ascii=False, indent=2)[2:-2] + '\n];\n')
    else:
        assert current == expected, 'Proposed catalogue differs; use --apply-additions after reviewing evidence'
    by_tmdb = {str(f['tmdb_id']): f for f in expected}
    by_id = {f['id']: f for f in expected}
    by_title = collections.defaultdict(dict)
    for f in expected:
        for title in [f['title'], f.get('original_title', '')]:
            if title: by_title[norm(title)][f['id']] = f
    mappings = {}
    for name in ['imports/historical-55-reviewed-matches.csv', 'imports/historical-13-identity-candidates.csv', 'imports/spirits-of-the-dead-consolidation.csv']:
        for r in csv_rows(name):
            if r['tmdb_movie_id']: mappings[r['source_row']] = (r['tmdb_movie_id'], 'prior_reviewed_identity', '')
    for r in evidence['owner_reviewed_workbook_links']:
        if r['media_type'] == 'movie':
            mappings.setdefault(r['source_row'], (str(r['tmdb_id']), 'owner_workbook_link', r['owner_comment']))
    for r in evidence['existing_alias_corrections']:
        mappings[r['source_row']] = (str(r['tmdb_id']), 'reviewed_alias_correction', r['reason'])
    for r in evidence['additions']:
        mappings[r['source_row']] = (str(r['film']['tmdb_id']), 'new_verified_identity', r['reason'])
    # Miniseries, TV episodes, seasons and theatrical/TV edits need a media/version review.
    explicit_tv = {'209','228','355','673','952','1057','1222','1235','1276','1359','1457','1570','1595','1656','1690','1710','1711','1712','1742','1793','1824'}
    ledger = []
    for src in source:
        sr = src['source_rows']; prior = old[sr]
        decisions = [mappings[x] for x in sr.split(';') if x in mappings]
        assert len({d[0] for d in decisions}) <= 1, 'Conflicting reviewed source-row mapping: ' + sr
        mapping = decisions[0] if decisions else None
        f = None; basis = ''; reason = ''; status = ''; review = False
        is_tv = bool(re.search(r'сериал|TV Series|т/с', src['source_title'], re.I)) or sr in explicit_tv
        # Owner-reviewed movie correction for Kara overrides a mistaken legacy TV candidate.
        if sr == '1438': is_tv = False
        if is_tv:
            status = 'deferred_tv_or_version_review'; basis = 'source_media_type'
            reason = 'Series/miniseries/episode or source TV-version label: verify media type and scope; do not create or map a movie identity automatically.'
            if sr == '1570': reason = 'Owner confirmed rating covers entire four-part miniseries. TV catalogue and TMDB TV verification remain pending.'
            if sr == '1276': reason = 'Second part/season label of Незнайка на Луне; reconcile with source 1359 (candidate TV/99952), preserving separate source rows until rating conflict review.'
            if sr == '849': reason = 'Source labels 12 as miniseries but names Nikita Mikhalkov, matching existing movie 708. Confirm/correct source media label before progress mapping.'
            if sr == '928': reason = 'Source labels The Turkish Gambit as miniseries; theatrical movie 796 exists. Verify whether rating covers TV extended cut before linking.'
        elif sr in evidence['special_cases']:
            status = evidence['special_cases'][sr]['status']; reason = evidence['special_cases'][sr]['reason']; basis = 'specific_work_without_verified_external_pair'
        elif mapping:
            tid, basis, reason = mapping
            f = by_tmdb.get(tid)
            assert f, 'Reviewed mapping absent from proposal: ' + sr
            status = 'proposed_addition' if basis == 'new_verified_identity' else 'present'
            if not reason: reason = 'Reviewed external identity exists in catalogue; preserve existing canonical ID.'
            if sr == '1421' or ';' in sr:
                status = 'consolidated'
                reason += ' Owner/source duplicate consolidation retained; no extra catalogue identity or automatic rating overwrite.'
        else:
            tid = integer(prior['tmdb_id'])
            if prior['suggested_type'] == 'movie' and tid in by_tmdb:
                f = by_tmdb[tid]; status = 'present'; basis = 'legacy_movie_candidate_id'
                review = prior['match_status'] != 'high_confidence_candidate'
                reason = 'Legacy candidate ID exists in catalogue. Coverage link only; not proof of imported rating or a new independent identity verification.'
            else:
                matches = {}
                for title in [src['source_title'], src.get('original_title_hint', '')]:
                    if title:
                        for fid, candidate in by_title[norm(title)].items():
                            if abs((candidate['year'] or 0) - int(src['source_year'])) <= 2: matches[fid] = candidate
                if len(matches) == 1:
                    f = next(iter(matches.values())); status = 'present'; basis = 'unique_title_year_candidate'; review = True
                    reason = 'Unique normalized title/year catalogue candidate. Source and catalogue directors remain visible for identity review; no import approval inferred.'
                else:
                    status = 'unresolved_identity'; basis = 'no_safe_catalogue_link'
                    reason = 'No reviewed identity, existing legacy movie candidate or unique title/year link. Research required.'
        legacy_tid = integer(prior['tmdb_id'])
        ledger.append({'source_rows': sr, 'source_title': src['source_title'], 'source_director': src['directors'], 'source_year': src['source_year'], 'coverage_status': status, 'catalogue_id': f['id'] if f else '', 'catalogue_title': f['title'] if f else '', 'catalogue_director': f['director'] if f else '', 'catalogue_year': f['year'] if f else '', 'tmdb_media_type': 'movie' if f else '', 'tmdb_id': f['tmdb_id'] if f else '', 'imdb_id': f.get('imdb_id') or '' if f else '', 'link_basis': basis, 'identity_review_required': 'true' if review else 'false', 'legacy_match_status': prior['match_status'], 'legacy_candidate_media_type': prior['suggested_type'], 'legacy_candidate_tmdb_id': legacy_tid, 'reason': reason})
    groups = collections.defaultdict(list)
    for r in ledger:
        if r['catalogue_id']: groups[r['catalogue_id']].append(r['source_rows'])
    for r in ledger:
        r['shared_identity_source_rows'] = '|'.join(groups[r['catalogue_id']]) if r['catalogue_id'] and len(groups[r['catalogue_id']]) > 1 else ''
        if r['shared_identity_source_rows']:
            if r['coverage_status'] == 'present' and r['source_rows'] != groups[r['catalogue_id']][0]:
                r['coverage_status'] = 'duplicate_identity'
            r['reason'] += ' Multiple source records share this catalogue identity; preserve all source rows and audit rating conflicts separately.'
    out = io.StringIO(newline=''); writer = csv.DictWriter(out, fieldnames=list(ledger[0]), lineterminator='\n'); writer.writeheader(); writer.writerows(ledger)
    counts = dict(sorted(collections.Counter(r['coverage_status'] for r in ledger).items()))
    summary = {'base_commit': evidence['base_commit'], 'source_entries': len(source), 'original_sheet_rows_represented': sum(len(r['source_rows'].split(';')) for r in source), 'catalogue_before': len(base), 'verified_additions': len(additions), 'catalogue_after': len(expected), 'new_id_range': [additions[0]['id'], additions[-1]['id']], 'coverage_counts': counts, 'links_requiring_identity_review': sum(r['identity_review_required']=='true' for r in ledger), 'shared_identity_groups': {str(k):v for k,v in groups.items() if len(v)>1}, 'source_metadata_sha256': hashlib.sha256((ROOT/'imports/personal-ratings-cleaned.csv').read_bytes()).hexdigest(), 'legacy_evidence_sha256': hashlib.sha256((ROOT/'imports/source-catalogue-legacy-evidence.csv').read_bytes()).hexdigest(), 'warning': 'Coverage inventory, not a ratings-import approval. Legacy/unique-title links retain their evidence level. TV/version and unresolved rows have no automatic movie mapping. No Supabase or progress access.'}
    outputs = {'import-previews/full-source-catalogue-ledger.csv': out.getvalue(), 'import-previews/full-source-catalogue-summary.json': json.dumps(summary, ensure_ascii=False, indent=2)+'\n'}
    for name, content in outputs.items():
        if args.check: assert (ROOT/name).read_text() == content, 'Stale ledger: ' + name
        else: (ROOT/name).write_text(content)
    assert sum(counts.values()) == 2150
    checks = {r['source_rows']: r for r in ledger}
    for sr, cid in [('118', 31), ('620', 1454), ('1405', 1872)]:
        assert checks[sr]['catalogue_id'] == cid, 'Known false match returned: ' + sr
    assert checks['1570']['catalogue_id'] == '' and checks['1570']['coverage_status'] == 'deferred_tv_or_version_review'
    assert checks['1699']['catalogue_id'] == '' and checks['1699']['coverage_status'] == 'unresolved_identity'
    assert checks['1421']['catalogue_id'] == checks['1419']['catalogue_id']
    assert all(r['tmdb_id'] == '' for r in ledger if not r['catalogue_id']), 'Unverified candidate promoted to active identity'
    print(json.dumps(summary, ensure_ascii=False, indent=2))

if __name__ == '__main__': main()

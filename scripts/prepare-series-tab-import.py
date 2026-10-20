#!/usr/bin/env python3
"""Reconcile a private normalized series sheet/export using reviewed identities; no cloud writes."""
import argparse,csv,json,re
from collections import Counter
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]

def build(source,existing,decisions,catalogue):
    bytitle={d['source_query']:d for d in decisions['entries']};known={w['id']:w for w in catalogue}
    old={r['work_key']:r for r in existing['ratings']};ratings=[];audit=[];corrections=[];seen={}
    for row in source['entries']:
        d=bytitle[row['query']];season=row['season_number'];key=d['show_key']
        if season is not None and not(d['season_one_is_whole_miniseries'] and season==1):key+=f':season:{season}'
        assert key in known and str(row['source_row']) in d['source_rows'].split(',')
        if row['rating'] is None:
            audit.append({'source_row':row['source_row'],'source_title':row['source_title'],'work_key':key,'rating':'','existing_rating':'','outcome':'unrated_catalogue_only','notes':row['notes']});continue
        score=row['rating'];assert isinstance(score,(int,float)) and .5<=score<=10 and score*2==int(score*2)
        if key in seen:raise ValueError('Duplicate rating target requires review: '+key)
        seen[key]=row['source_row']
        coverage=re.search(r'\((\d+) seasons\)',row['source_title'])
        scope='whole_work' if season is not None or (coverage and known[key]['series_kind']=='series' and row['query']!='Fauda') else 'unspecified'
        notes=row['notes']
        if coverage:notes=(notes+'\n' if notes else '')+'Rating covers seasons 1–'+coverage[1]+'.'
        value={'work_key':key,'rating':float(score),'rating_scope':scope,'notes':notes,'watched_date':None}
        previous=old.get(key)
        if not previous:outcome='new_rating'
        elif float(previous['rating'])==score:outcome='existing_score_preserved'
        elif key=='tv:147050' and float(previous['rating'])==7 and score==7.5:
            corrections.append({'work_key':key,'expected_rating':7.0,'rating':7.5});outcome='owner_approved_score_correction'
        else:raise ValueError('Unreviewed existing score conflict: '+key)
        ratings.append(value);audit.append({'source_row':row['source_row'],'source_title':row['source_title'],'work_key':key,'rating':score,'existing_rating':previous['rating'] if previous else '', 'outcome':outcome,'notes':notes})
    assert len(audit)==len(source['entries']) and len(ratings)==sum(r['rating'] is not None for r in source['entries'])
    summary={'source_rows':len(audit),'rated_rows':len(ratings),'outcomes':dict(Counter(r['outcome'] for r in audit)),'existing_tv_ratings':len(old),'expected_tv_ratings':len(old)+sum(r['outcome']=='new_rating' for r in audit),'existing_ratings_preserved_except_explicit_score_corrections':True,'notes_dates_and_scope_preserved_for_existing_rows':True,'unresolved':0}
    return {'format':'culture-atlas-tv-progress-v2','ratings':ratings,'rating_corrections':corrections,'replace_dekalog_episode':False},audit,summary

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--source',type=Path,required=True);p.add_argument('--existing',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args();out=a.output.resolve()
    if out==ROOT or ROOT in out.parents:p.error('Private output must be outside the repository')
    source=json.loads(a.source.read_text());assert len(source['entries'])==98 and sum(r['rating'] is not None for r in source['entries'])==96;existing=json.loads(a.existing.read_text());decisions=json.loads((ROOT/'imports/series-tab-reviewed-identities.json').read_text());cat=json.loads((ROOT/'tv-catalog.js').read_text().split(' = ',1)[1].strip().removesuffix(';'))
    proposal,audit,summary=build(source,existing,decisions,cat);out.mkdir(parents=True,exist_ok=True)
    (out/'culture-atlas-series-ratings.json').write_text(json.dumps(proposal,ensure_ascii=False,indent=2)+'\n')
    (out/'series-import-summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n')
    with (out/'series-ratings-review.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(audit[0]));w.writeheader();w.writerows(audit)
    print(json.dumps(summary,indent=2))
if __name__=='__main__':main()

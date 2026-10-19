#!/usr/bin/env python3
"""Prepare a private TV rating proposal from reviewed identities; no database access."""
import argparse
import csv
import io
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args()
    output=args.output.resolve()
    if output==ROOT or ROOT in output.parents:
        parser.error('Personal rating files must be outside the public repository')
    def read(path):
        with (ROOT/path).open(encoding='utf-8-sig',newline='') as handle:
            return list(csv.DictReader(handle))
    source={r['source_rows']:r for r in read('imports/personal-ratings-cleaned.csv')}
    reviews=read('imports/tv-version-56-reviewed-identities.csv')
    catalogue=json.loads((ROOT/'tv-catalog.js').read_text().split(' = ',1)[1].strip().removesuffix(';'))
    bykey={r['id']:r for r in catalogue}
    ledger=[];ratings=[]
    for review in reviews:
        if review['decision']!='verified_new_tv_identity':continue
        row=source[review['source_rows']]
        assert row['source_title']==review['source_title'] and row['source_year']==review['source_year']
        work=bykey[review['accepted_work_key']]
        rating=float(row['rating'])
        assert .5<=rating<=10 and rating*2==int(rating*2)
        scope='whole_work' if review['rating_scope'].startswith('owner_confirmed_') else 'unspecified'
        ratings.append({'work_key':work['id'],'rating':rating,'rating_scope':scope,'notes':row['notes'] or '','watched_date':None})
        ledger.append({'source_rows':review['source_rows'],'source_title':row['source_title'],'title':work['title'],**ratings[-1]})
    assert len(ratings)==len({r['work_key'] for r in ratings})==43
    assert next(r for r in ratings if r['work_key']=='tv:42699')['rating']==10
    output.mkdir(parents=True,exist_ok=True)
    (output/'culture-atlas-43-tv-ratings.json').write_text(json.dumps({'format':'culture-atlas-tv-progress-v1','ratings':ratings,'replace_dekalog_episode':True},ensure_ascii=False,indent=2)+'\n')
    stream=io.StringIO(newline='');writer=csv.DictWriter(stream,fieldnames=list(ledger[0]));writer.writeheader();writer.writerows(ledger)
    (output/'43-tv-ratings-review.csv').write_text(stream.getvalue())
    summary={'verified_tv_identities':len(ratings),'owner_confirmed_whole_work':sum(r['rating_scope']=='whole_work' for r in ratings),'scope_unspecified':sum(r['rating_scope']=='unspecified' for r in ratings),'existing_movie_aliases_excluded':4,'dekalog_replacement':'Verify tv:42699=10 whole_work, then remove mistaken film 1920=10 atomically.','status':'Private proposal only; no progress queried or modified.'}
    (output/'tv-import-summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(summary,indent=2))

if __name__=='__main__':main()

#!/usr/bin/env python3
"""Build reviewed show/season metadata, without private scores or progress access."""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def read_js(name):return json.loads((ROOT/name).read_text().split(' = ',1)[1].strip().removesuffix(';'))
def main():
    catalogue=read_js('tv-catalog.js');bykey={x['id']:x for x in catalogue};baseline_keys={x['id'] for x in catalogue[:51]}
    evidence=json.loads((ROOT/'imports/series-tab-tmdb-evidence.json').read_text())
    assert evidence['source_count']==len(evidence['entries'])==62 and not evidence['errors']
    review_path=ROOT/'imports/series-tab-reviewed-identities.json'
    pinned={x['source_query']:x for x in json.loads(review_path.read_text())['entries']}
    decisions=[];parents={}
    for row in evidence['entries']:
        # Each selection is explicitly recorded for review; no runtime fuzzy matching.
        accepted=pinned[row['title']]
        c=next(c for c in row['candidates'] if c['tmdb_id']==accepted['tmdb_id'] and c['imdb_id']==accepted['imdb_id'])
        assert c['imdb_id'] and c['release_date']
        key='tv:'+str(c['tmdb_id']);parents[c['tmdb_id']]=c
        if key not in bykey:
            work={'id':key,'work_type':'tv','series_kind':'miniseries' if c['series_type']=='Miniseries' else 'series','title':c['title'],'original_title':c['original_title'],'year':int(c['release_date'][:4]),'first_air_date':c['release_date'],'tmdb_id':c['tmdb_id'],'imdb_id':c['imdb_id'],'original_language':c['original_language'],'creators':c['creators'],'directors':c['directors'],'poster_path':c['poster_path']}
            catalogue.append(work);bykey[key]=work
        decisions.append({'source_rows':row['source_rows'],'source_query':row['title'],'show_key':key,'tmdb_id':c['tmdb_id'],'imdb_id':c['imdb_id'],'first_air_date':c['release_date'],'season_one_is_whole_miniseries':c['series_type']=='Miniseries' and c['status']=='Ended' and len(c['seasons'])==1,'reason':'Reviewed title, IMDb identity, original premiere and requested seasons. Owner confirmed US adaptations for House of Cards, Lie to Me and How I Met Your Mother.'})
    # Existing TV metadata also supplies multi-season choices without altering prior records.
    old=json.loads((ROOT/'imports/tv-version-56-tmdb-evidence.json').read_text())
    for work in list(catalogue):
        if work['id']!='tv:'+str(work['tmdb_id']) or work['tmdb_id'] in parents:continue
        candidate=next((c for row in old['entries'] for c in row['candidates'] if c['media_type']=='tv' and c['tmdb_id']==work['tmdb_id']),None)
        if candidate and len(candidate['seasons'])>1:parents[work['tmdb_id']]=candidate
    for tid,c in parents.items():
        if c.get('series_type')=='Miniseries' and c.get('status')=='Ended' and len(c['seasons'])==1:continue
        for season in c['seasons']:
            if not season['air_date'] or not season['episode_count']:continue
            key=f"tv:{tid}:season:{season['season_number']}"
            if key in bykey:
                if key not in baseline_keys:
                    # Show aggregate directors are not verified season credits.
                    bykey[key].update(creators=[],directors=[])
                continue
            work={'id':key,'work_type':'tv','series_kind':'season','title':c['title']+' — Season '+str(season['season_number']),'original_title':c['original_title']+' — Season '+str(season['season_number']),'year':int(season['air_date'][:4]),'first_air_date':season['air_date'],'tmdb_id':tid,'tmdb_media_type':'tv','season_number':season['season_number'],'imdb_id':None,'original_language':c['original_language'],'creators':[],'directors':[],'poster_path':season.get('poster_path') or c['poster_path'],'scope_label':f"Season {season['season_number']} · {season['episode_count']} episodes"}
            catalogue.append(work);bykey[key]=work
    for row,d in zip(evidence['entries'],decisions):
        for n in row['requested_seasons']:
            assert d['season_one_is_whole_miniseries'] and n==1 or f"tv:{d['tmdb_id']}:season:{n}" in bykey
    (ROOT/'tv-catalog.js').write_text('window.CULTURE_TV_CATALOG = '+json.dumps(catalogue,ensure_ascii=False,indent=2)+';\n')
    (ROOT/'imports/series-tab-reviewed-identities.json').write_text(json.dumps({'source_library_file':'libfile_07805bb5711c81918f551f23f9aedd73','source_sheet':'series','workflow_run_id':evidence['workflow_run_id'],'owner_decisions':['Disclaimer: use series-tab 7.5 instead of existing 7.0; preserve its notes/date/scope.','Squid Game: keep existing overall 7.5 and add seasons independently.','Older House of Cards, Lie to Me and How I Met Your Mother are the US versions.'],'entries':decisions},ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'catalogue_targets':len(catalogue),'reviewed_shows':len(decisions),'season_targets':sum(w['series_kind']=='season' for w in catalogue)}))
if __name__=='__main__':main()

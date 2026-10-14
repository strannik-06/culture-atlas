#!/usr/bin/env node
// Read-only staging: input is the v2 TMDB matching artifact. No Supabase access.
import fs from 'node:fs';
import path from 'node:path';
const file=process.argv[2];
if(!file)throw Error('Usage: node scripts/stage-personal-ratings.mjs ratings-import-review-v2.json');
const input=JSON.parse(fs.readFileSync(file,'utf8'));
const root=path.resolve(import.meta.dirname,'..');
const source=fs.readFileSync(path.join(root,'film-catalog.js'),'utf8');
const catalog=JSON.parse(source.split('window.CULTURE_CATALOG = ')[1].trim().replace(/;$/,''));
const byTmdb=new Map(catalog.map(f=>[Number(f.tmdb_id),f]));
const groups=new Map(),exceptions=[];
for(const row of input.rows){
 if(row.match_status!=='high_confidence_candidate'){exceptions.push({source_row:row.source_row,title:row.source_title,reason:row.match_status});continue}
 const top=row.ranked_candidates?.[0];
 if(!top||top.media_type!=='movie'||!Number.isSafeInteger(top.tmdb_id)||top.director_match<.7||top.title_match<.65||top.year_delta===null||top.year_delta>1){
  exceptions.push({source_row:row.source_row,title:row.source_title,reason:'candidate_validation_failed'});continue
 }
 // Explicitly quarantine future releases; TMDB credit/title agreement is not proof of viewing.
 if(Number(top.year)>new Date().getUTCFullYear()||Number(top.year)===new Date().getUTCFullYear()&&Number(row.source_year)===new Date().getUTCFullYear()){
  exceptions.push({source_row:row.source_row,title:row.source_title,reason:'current_or_future_release_verify_watched'});continue
 }
 const id=top.tmdb_id;
 if(!groups.has(id))groups.set(id,[]);
 groups.get(id).push({source_row:row.source_row,source_title:row.source_title,source_director:row.source_director,rating:row.rating,notes:row.notes||'',tmdb_id:id,title:top.title,year:Number(top.year),director:(top.directors||[]).join(', ')});
}
const staged=[],duplicates=[],conflicts=[],resolved_duplicates=[];
const decisions=[
 {tmdb_id:49519,title:'The Croods',ratings:[7,6.5],keep:6.5},
 {tmdb_id:31011,title:'Mr. Nobody',ratings:[6.5,7],keep:7},
 {tmdb_id:13958,title:'The King of Kong',ratings:[5.5,6],keep:6},
 {tmdb_id:166424,title:'Fantastic Four',ratings:[4.5,4.5],keep:4.5}
];
const normalizeTitle=s=>String(s).toLowerCase().replace(/[^a-z0-9]/g,'');
for(const [tmdbId,rows] of groups){
 if(rows.length>1){
  const ratings=rows.map(r=>r.rating).sort((a,b)=>a-b);
  const decision=decisions.find(d=>d.tmdb_id===Number(tmdbId)&&
    d.ratings.length===ratings.length&&d.ratings.slice().sort((a,b)=>a-b).every((v,i)=>v===ratings[i]));
  if(!decision){
   duplicates.push({tmdb_id:tmdbId,title:rows[0].title,entries:rows.map(r=>({source_row:r.source_row,rating:r.rating}))});
   continue;
  }
  const chosen=rows.findLast(r=>r.rating===decision.keep);
  const combinedNotes=[...new Set(rows.map(r=>r.notes?.trim()).filter(Boolean))].join('\n');
  const row={...chosen,notes:combinedNotes},existing=byTmdb.get(tmdbId);
  if(existing&&existing.title!==row.title)conflicts.push({tmdb_id:tmdbId,existing_title:existing.title,matched_title:row.title,reason:'catalog_title_differs_check_identity'});
  staged.push({...row,film_id:existing?.id??null,action:existing?'existing_catalog_id':'new_catalog_entry',watched:true,watched_date:null});
  resolved_duplicates.push({tmdb_id:tmdbId,title:row.title,selected_rating:decision.keep,source_rows:rows.map(r=>r.source_row),discarded_ratings:rows.filter(r=>r!==chosen).map(r=>r.rating)});
  continue;
 }
 const row=rows[0],existing=byTmdb.get(tmdbId);
 if(existing&&existing.title!==row.title)conflicts.push({tmdb_id:tmdbId,existing_title:existing.title,matched_title:row.title,reason:'catalog_title_differs_check_identity'});
 staged.push({...row,film_id:existing?.id??null,action:existing?'existing_catalog_id':'new_catalog_entry',watched:true,watched_date:null});
}
const summary={total_source_rows:input.rows.length,staged:staged.length,existing_catalog:staged.filter(r=>r.film_id).length,new_catalog:staged.filter(r=>!r.film_id).length,duplicate_groups:duplicates.length,resolved_duplicate_groups:resolved_duplicates.length,quarantined:exceptions.length,catalog_title_differences:conflicts.length,notes:staged.filter(r=>r.notes).length,half_point_ratings:staged.filter(r=>r.rating%1!==0).length};
const output={summary,staged,duplicate_groups:duplicates,resolved_duplicate_groups:resolved_duplicates,quarantined:exceptions,catalog_title_differences:conflicts,warning:'Preview only. Existing Supabase film_progress cannot be compared without an authenticated export; do not insert before conflict reconciliation.'};
fs.writeFileSync('personal-ratings-staging-preview.json',JSON.stringify(output,null,2)+'\n');
console.log(JSON.stringify(summary,null,2));

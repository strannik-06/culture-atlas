#!/usr/bin/env node
// Build an auditable review queue from the original 2,150 source entries.
// Read-only. Does not infer that a film has been imported merely because its title resembles another.
import fs from 'node:fs';
import path from 'node:path';
const [reviewFile,sourceFile]=process.argv.slice(2);
if(!reviewFile||!sourceFile)throw Error('Usage: node scripts/prepare-remaining-ratings-review.mjs ratings-import-review-v2.json imports/personal-ratings-cleaned.csv');
const review=JSON.parse(fs.readFileSync(reviewFile,'utf8'));
const catalog=JSON.parse(fs.readFileSync(path.resolve(import.meta.dirname,'../film-catalog.js'),'utf8').split('window.CULTURE_CATALOG = ')[1].trim().replace(/;$/,''));
const byTmdb=new Map(catalog.map(f=>[Number(f.tmdb_id),f]));
function parseCSV(s){
 const records=[];let record=[],field='',quoted=false;
 for(let i=0;i<s.length;i++){const c=s[i];
  if(quoted){if(c==='"'&&s[i+1]==='"'){field+='"';i++}else if(c==='"')quoted=false;else field+=c}
  else if(c==='"')quoted=true;
  else if(c===','){record.push(field);field=''}
  else if(c==='\n'){record.push(field);records.push(record);record=[];field=''}
  else if(c!=='\r')field+=c;
 }
 if(field||record.length){record.push(field);records.push(record)}
 const header=records.shift().map((h,i)=>i===0?h.replace(/^\uFEFF/,''):h);
 return records.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(header.map((h,i)=>[h,r[i]??''])));
}
const source=parseCSV(fs.readFileSync(sourceFile,'utf8'));
const byRow=new Map(source.map(r=>[String(r.source_rows),r]));
const statusCounts={},queue=[],covered=[],unresolvedNotes=[];
const esc=s=>{const v=String(s??'');return /[",\n\r]/.test(v)?'"'+v.replace(/"/g,'""')+'"':v};
for(const row of review.rows){
 const src=byRow.get(String(row.source_row));
 if(!src)throw Error('Source row missing: '+row.source_row);
 const candidate=row.ranked_candidates?.[0]||null;
 const id=Number(candidate?.tmdb_id);
 const film=candidate?.media_type==='movie'?byTmdb.get(id):null;
 // A TMDB match in the catalogue is NOT proof that a user's historical rating was imported.
 const status=row.match_status;
 statusCounts[status]=(statusCounts[status]||0)+1;
 const item={source_row:row.source_row,source_title:row.source_title,original_title_hint:row.original_title_hint||'',source_director:row.source_director||src.directors||'',source_year:row.source_year,rating:row.rating,notes:src.notes||'',match_status:status,review_reasons:(row.review_reasons||[]).join('; '),candidate_tmdb_id:candidate?.tmdb_id||'',candidate_media_type:candidate?.media_type||'',candidate_title:candidate?.title||'',candidate_year:candidate?.year||'',candidate_directors:(candidate?.directors||[]).join(', '),candidate_title_score:candidate?.title_match??'',candidate_director_score:candidate?.director_match??'',catalog_film_id:film?.id||'',catalog_title:film?.title||'',decision:'',correct_tmdb_id:'',review_comment:''};
 if(status==='high_confidence_candidate'&&film){
  covered.push(item);
 }else{
  queue.push(item);
  if(item.notes)unresolvedNotes.push({source_row:item.source_row,title:item.source_title});
 }
}
const columns=['source_row','source_title','original_title_hint','source_director','source_year','rating','notes','match_status','review_reasons','candidate_tmdb_id','candidate_media_type','candidate_title','candidate_year','candidate_directors','candidate_title_score','candidate_director_score','catalog_film_id','catalog_title','decision','correct_tmdb_id','review_comment'];
const csv=[columns.join(','),...queue.map(r=>columns.map(c=>esc(r[c])).join(','))].join('\n')+'\n';
fs.writeFileSync('remaining-ratings-review.csv','\uFEFF'+csv);
const summary={source_entries:review.rows.length,already_in_catalogue_high_confidence:covered.length,needs_review:queue.length,status_counts:statusCounts,notes_in_review:unresolvedNotes,warning:'Catalogue presence does not prove a Supabase rating exists. Before any subsequent import, compare film_progress for this user and exclude already imported records. Review decisions are required for ambiguous identities and TV series.'};
fs.writeFileSync('remaining-ratings-review-summary.json',JSON.stringify(summary,null,2)+'\n');
console.log(JSON.stringify({source_entries:summary.source_entries,already_in_catalogue_high_confidence:covered.length,needs_review:queue.length,notes_in_review:unresolvedNotes.length},null,2));

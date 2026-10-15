#!/usr/bin/env node
// Read-only recovery of the ORIGINAL approved automatic matching pass.
// This does not search TMDB or re-evaluate film identity.
import fs from 'node:fs';
const input=process.argv[2];
if(!input)throw Error('Usage: node scripts/reuse-original-staging.mjs personal-ratings-staging-preview.json');
const original=JSON.parse(fs.readFileSync(input,'utf8'));
const catalogue=JSON.parse(fs.readFileSync('film-catalog.js','utf8').split('window.CULTURE_CATALOG = ')[1].trim().replace(/;$/,''));
const byTmdb=new Map(catalogue.map(f=>[Number(f.tmdb_id),f]));
const out=[],problems=[];
for(const r of original.staged||[]){
 const id=Number(r.tmdb_id),film=byTmdb.get(id);
 const item={source_row:r.source_row,source_title:r.source_title,tmdb_id:id,film_id:film?.id??'',catalogue_title:film?.title??'',rating:r.rating,notes:r.notes||'',watched_date:'',status:film?'original_match_catalogue_linked':'original_match_missing_catalogue'};
 out.push(item);
 if(!film)problems.push({source_row:r.source_row,tmdb_id:id,reason:'TMDB ID from original matching pass absent in current catalogue'});
}
const duplicates=new Map();
for(const r of out){const k=String(r.film_id);if(!r.film_id)continue;if(!duplicates.has(k))duplicates.set(k,[]);duplicates.get(k).push(r);}
for(const [id,rows] of duplicates)if(rows.length>1)problems.push({film_id:id,source_rows:rows.map(r=>r.source_row),reason:'Duplicate target film_id'});
const esc=x=>/[",\r\n]/.test(String(x??''))?'"'+String(x??'').replace(/"/g,'""')+'"':String(x??'');
const headers=['source_row','source_title','tmdb_id','film_id','catalogue_title','rating','notes','watched_date','status'];
fs.writeFileSync('original-auto-matches-recovered.csv','\uFEFF'+[headers.join(','),...out.map(r=>headers.map(h=>esc(r[h])).join(','))].join('\r\n')+'\r\n');
const summary={original_staged:out.length,linked_to_current_catalogue:out.filter(r=>r.film_id).length,missing_catalogue:out.filter(r=>!r.film_id).length,duplicate_target_groups:problems.filter(r=>r.reason==='Duplicate target film_id').length,original_quarantined:(original.quarantined||[]).length,original_unresolved_duplicate_groups:(original.duplicate_groups||[]).length,problems,notes:'This is the original automatic matching result; no TMDB search, no Supabase reads or writes. Other review queues are not included.'};
fs.writeFileSync('original-auto-matches-recovered-summary.json',JSON.stringify(summary,null,2)+'\n');
console.log(JSON.stringify({...summary,problems:problems.slice(0,15)},null,2));

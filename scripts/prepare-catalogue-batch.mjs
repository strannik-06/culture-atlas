#!/usr/bin/env node
// Prepare verified historical film catalogue additions; NO Supabase writes.
import fs from 'node:fs';
import path from 'node:path';
const [previewFile,progressFile]=process.argv.slice(2);
if(!previewFile||!progressFile)throw Error('Usage: node scripts/prepare-catalogue-batch.mjs canonical-catalogue-preview.json film_progress_rows.csv');
const root=path.resolve(import.meta.dirname,'..');
const preview=JSON.parse(fs.readFileSync(previewFile,'utf8'));
const original=fs.readFileSync(path.join(root,'film-catalog.js'),'utf8');
const prefix='window.CULTURE_CATALOG = ';
if(!original.startsWith(prefix))throw Error('Unexpected catalogue format');
const current=JSON.parse(original.slice(prefix.length).trim().replace(/;$/,''));
const knownTmdb=new Map(current.map(x=>[Number(x.tmdb_id),x]));
const knownImdb=new Set(current.map(x=>x.imdb_id).filter(Boolean));
const idSet=new Set(current.map(x=>x.id));
const expected=[['Cardiogram of Love',895256,'tt4516948'],['Infant',695633,'tt3065590'],['Two Kilometers from the New Year',558068,'tt3449464']];
const candidates=[...preview.proposed.map(x=>({...x,source:'preview'}))];
const manual=[];
for(const [title,tmdb,imdb] of expected){
 const x=preview.needs_review.find(e=>e.reason==='IMDb ID missing: review before canonical insertion'&&e.canonical?.tmdb_id===tmdb&&e.canonical?.title===title);
 if(!x)throw Error('Approved IMDb exception not found: '+title);
 candidates.push({...x.canonical,imdb_id:imdb,source_row:x.row.source_row,rating:x.row.rating,notes:x.row.notes||'',source:'owner_confirmed_imdb'});
 manual.push({title,tmdb_id:tmdb,imdb_id:imdb});
}
const progress=fs.readFileSync(progressFile,'utf8').replace(/^\uFEFF/,'');
const rows=progress.trim().split(/\r?\n/);
const headers=rows.shift().split(',').map(x=>x.replace(/^"|"$/g,'').trim());
for(const name of ['film_id','watched','rating'])if(!headers.includes(name))throw Error('Missing export column '+name);
const priorIds=new Set();
const userIds=new Set();
for(const line of rows){
 if(!line.trim())continue;
 const values=line.split(',');
 const row=Object.fromEntries(headers.map((h,i)=>[h,values[i]||'']));
 if(row.user_id)userIds.add(row.user_id);
 const id=Number(row.film_id);
 if(!Number.isSafeInteger(id)||priorIds.has(id))throw Error('Bad existing progress row '+id);
 priorIds.add(id);
}
if(userIds.size>1)throw Error('Multiple users in progress export');
const allTmdb=new Set(),allImdb=new Set(),added=[],held=[],ratings=[];
let nextId=Math.max(...idSet)+1;
for(const row of candidates){
 const tmdb=Number(row.tmdb_id);
 if(!Number.isSafeInteger(tmdb)||allTmdb.has(tmdb))throw Error('Repeated/bad TMDB ID '+tmdb);
 allTmdb.add(tmdb);
 if(knownTmdb.has(tmdb)){held.push({source_row:row.source_row,title:row.title,reason:'Existing catalogue TMDB ID: manual link review'});continue}
 const imdb=row.imdb_id;
 if(!/^tt\d{6,}$/.test(imdb||'')||knownImdb.has(imdb)||allImdb.has(imdb))throw Error('Missing/duplicate IMDb '+imdb);
 allImdb.add(imdb);
 if(row.year>=new Date().getUTCFullYear()){
  held.push({source_row:row.source_row,title:row.title,year:row.year,tmdb_id:tmdb,reason:'Current-year release: verify screening and film identity before importing'});
  continue;
 }
 const id=nextId++;
 if(priorIds.has(id))throw Error('Proposed ID already in existing progress: '+id);
 added.push({id,title:row.title,director:row.director,year:row.year,tmdb_id:tmdb,imdb_id:imdb,original_title:row.original_title,original_language:row.original_language});
 ratings.push({film_id:id,tmdb_id:tmdb,rating:row.rating,watched:true,notes:row.notes||'',watched_date:null,source_row:row.source_row});
}
for(const row of preview.linked_existing){
 const existing=knownTmdb.get(Number(row.tmdb_id));
 if(!existing||existing.id!==row.film_id)throw Error('Existing film identity changed');
 if(priorIds.has(existing.id)){held.push({film_id:existing.id,title:existing.title,reason:'Existing Supabase progress: manual conflict review'});continue}
 ratings.push({film_id:existing.id,tmdb_id:Number(row.tmdb_id),rating:row.rating,watched:true,notes:row.notes||'',watched_date:null,source_row:row.source_row});
}
const newCatalog=[...current,...added];
fs.writeFileSync(path.join(root,'film-catalog.js'),prefix+JSON.stringify(newCatalog,null,2)+';\n');
fs.mkdirSync(path.join(root,'import-previews'),{recursive:true});
const report={summary:{previous_catalogue:current.length,added:added.length,total:newCatalog.length,ratings_prepared:ratings.length,held_for_review:held.length,owner_imdb_mappings:manual.length,existing_progress_rows:priorIds.size},held,owner_imdb_mappings:manual,warning:'Catalogue proposal only. Ratings are NOT written to Supabase. Remaining 924 historical source entries excluded.'};
fs.writeFileSync(path.join(root,'import-previews','catalogue-batch-review.json'),JSON.stringify(report,null,2)+'\n');
fs.writeFileSync('personal-ratings-import-private-preview.json',JSON.stringify({summary:report.summary,ratings},null,2)+'\n');
console.log(JSON.stringify(report.summary,null,2));

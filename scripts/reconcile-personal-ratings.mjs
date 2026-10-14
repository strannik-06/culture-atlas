#!/usr/bin/env node
// Offline, read-only reconciliation of owner-exported progress against the canonical preview.
// Usage: node scripts/reconcile-personal-ratings.mjs canonical-catalogue-preview.json film-progress-export.csv
import fs from 'node:fs';
import path from 'node:path';
const [previewPath,exportPath]=process.argv.slice(2);
if(!previewPath||!exportPath)throw Error('Usage: node scripts/reconcile-personal-ratings.mjs canonical-catalogue-preview.json film-progress-export.csv');
const preview=JSON.parse(fs.readFileSync(previewPath,'utf8'));
const repo=path.resolve(import.meta.dirname,'..');
const catalog=JSON.parse(fs.readFileSync(path.join(repo,'film-catalog.js'),'utf8').split('window.CULTURE_CATALOG = ')[1].trim().replace(/;$/,''));
const byTmdb=new Map(catalog.map(f=>[Number(f.tmdb_id),f]));
function parseCSV(text){
 const records=[];let record=[],field='',quoted=false;
 text=text.replace(/^\uFEFF/,'');
 for(let i=0;i<text.length;i++){
  const c=text[i];
  if(quoted){if(c==='"'&&text[i+1]==='"'){field+='"';i++}else if(c==='"')quoted=false;else field+=c}
  else if(c==='"')quoted=true;
  else if(c===','){record.push(field);field=''}
  else if(c==='\n'){record.push(field.replace(/\r$/,''));records.push(record);record=[];field=''}
  else field+=c;
 }
 if(field||record.length){record.push(field);records.push(record)}
 if(quoted)throw Error('Unclosed CSV quote');
 const header=records.shift().map(s=>s.trim());
 for(const column of ['film_id','watched','rating'])if(!header.includes(column))throw Error('CSV missing '+column);
 return records.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(header.map((h,i)=>[h,r[i]??''])));
}
const exported=parseCSV(fs.readFileSync(exportPath,'utf8'));
const users=[...new Set(exported.map(r=>r.user_id).filter(Boolean))];
if(users.length>1)throw Error('Export contains multiple users; filter to the owner first');
const existing=new Map();
for(const r of exported){
 const id=Number(r.film_id);
 if(!Number.isSafeInteger(id)||id<=0||existing.has(id))throw Error('Duplicate/invalid film_id in export: '+r.film_id);
 const rating=r.rating===''||r.rating===null?null:Number(r.rating);
 if(rating!==null&&(!Number.isFinite(rating)||rating<0||rating>10))throw Error('Invalid rating at film '+id);
 existing.set(id,{film_id:id,watched:String(r.watched).toLowerCase()==='true',rating,notes:r.notes||'',watched_date:r.watched_date||null});
}
const approvedMissingImdb=new Map([
 [895256,{imdb_id:'tt4516948',title:'Cardiogram of Love'}],
 [695633,{imdb_id:'tt3065590',title:'Infant'}],
 [558068,{imdb_id:'tt3449464',title:'Two Kilometers from the New Year'}]
]);
const entries=[...preview.proposed.map(r=>({...r,action:'new_catalog_entry'})),...preview.linked_existing.map(r=>({...r,action:'existing_catalog_id'}))];
const addedOverrides=[];
for(const exception of preview.needs_review){
 const candidate=exception.canonical,source=exception.row;
 const override=approvedMissingImdb.get(Number(candidate?.tmdb_id));
 if(exception.reason!=='IMDb ID missing: review before canonical insertion'||!override||candidate.title!==override.title)continue;
 entries.push({...candidate,imdb_id:override.imdb_id,source_row:source.source_row,rating:source.rating,notes:source.notes||'',action:'new_catalog_entry'});
 addedOverrides.push({tmdb_id:candidate.tmdb_id,imdb_id:override.imdb_id,title:candidate.title});
}
const identities=new Set(),imdbIds=new Set(),ready=[],conflicts=[],newCatalog=[];
let nextId=Math.max(...catalog.map(f=>f.id))+1;
for(const entry of entries){
 const tmdb=Number(entry.tmdb_id);
 if(identities.has(tmdb))throw Error('Repeated TMDB ID in preview: '+tmdb);
 identities.add(tmdb);
 const catalogFilm=byTmdb.get(tmdb);
 const filmId=catalogFilm?.id??nextId++;
 const rating=Number(entry.rating);
 if(!Number.isFinite(rating)||rating<0||rating>10)throw Error('Invalid staged rating for '+tmdb);
 const record={film_id:filmId,tmdb_id:tmdb,title:entry.title||entry.canonical_title,rating,watched:true,notes:entry.notes||'',watched_date:null,source_row:entry.source_row};
 if(!catalogFilm){
  const imdb=entry.imdb_id;
  if(!imdb||imdbIds.has(imdb))throw Error('Missing/duplicate IMDb ID in proposed additions: '+imdb);
  imdbIds.add(imdb);
  newCatalog.push({id:filmId,title:entry.title,original_title:entry.original_title,original_language:entry.original_language,year:entry.year,director:entry.director,tmdb_id:tmdb,imdb_id:imdb});
 }
 const prior=existing.get(filmId);
 if(prior){
  const same=prior.watched===true&&prior.rating===rating&&(!record.notes||prior.notes===record.notes);
  if(same)ready.push({...record,decision:'already_present_no_write'});
  else conflicts.push({...record,existing:prior,decision:'manual_review_do_not_overwrite'});
 }else ready.push({...record,decision:'insert_only_after_approval'});
}
const output={summary:{existing_progress_rows:exported.length,proposed_rating_rows:entries.length,ready:ready.length,conflicts:conflicts.length,new_catalogue_entries:newCatalog.length,imdb_overrides:addedOverrides.length,previously_quarantined:preview.summary.previously_quarantined},approved_imdb_overrides:addedOverrides,ready,conflicts,new_catalogue:newCatalog,warning:'Read-only audit. No Supabase writes. Provisional IDs change if catalogue changes. Do not publish user progress exports or this report.'};
fs.writeFileSync('personal-ratings-conflict-report.json',JSON.stringify(output,null,2)+'\n');
fs.writeFileSync('reconciled-catalogue-additions.json',JSON.stringify(newCatalog,null,2)+'\n');
console.log(JSON.stringify(output.summary,null,2));

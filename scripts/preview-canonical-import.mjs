#!/usr/bin/env node
// Read-only: create a canonical catalogue proposal, never modify catalogue or Supabase.
import fs from 'node:fs';
import path from 'node:path';
const inputPath=process.argv[2];
if(!inputPath)throw Error('Usage: node scripts/preview-canonical-import.mjs staging-preview.json');
const staging=JSON.parse(fs.readFileSync(inputPath,'utf8'));
const root=path.resolve(import.meta.dirname,'..');
const catalog=JSON.parse(fs.readFileSync(path.join(root,'film-catalog.js'),'utf8').split('window.CULTURE_CATALOG = ')[1].trim().replace(/;$/,''));
const existing=new Map(catalog.map(f=>[Number(f.tmdb_id),f]));
const ids=new Set(catalog.map(f=>f.id));
let nextId=Math.max(...ids)+1;
const key=process.env.TMDB_API_KEY,token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!key&&!token)throw Error('TMDB_API_KEY or TMDB_READ_ACCESS_TOKEN required');
const wait=ms=>new Promise(resolve=>setTimeout(resolve,ms));
async function details(id){
 const url='https://api.themoviedb.org/3/movie/'+id+'?'+new URLSearchParams({language:'en-US',append_to_response:'credits,external_ids',...(key?{api_key:key}:{})});
 for(let retry=0;retry<5;retry++){
  const res=await fetch(url,{headers:{accept:'application/json',...(token?{Authorization:'Bearer '+token}:{})}});
  if(res.ok){const json=await res.json();await wait(260);return json}
  if(res.status!==429&&res.status<500)throw Error('TMDB '+id+': '+res.status);
  await wait(1000*(retry+1));
 }
 throw Error('TMDB '+id+' unavailable after retries');
}
const normalize=s=>String(s||'').toLowerCase().normalize('NFKD').replace(/[\u0300-\u036f]/g,'').replace(/[^\p{L}\p{N}]+/gu,' ').trim();
const proposed=[],linked=[],review=[],seen=new Set();
for(const row of staging.staged){
 const id=Number(row.tmdb_id);
 if(!Number.isSafeInteger(id)||id<=0||seen.has(id)){review.push({row,reason:'Invalid or repeated TMDB identity'});continue}
 seen.add(id);
 const film=await details(id);
 if(film.id!==id||!film.title||!film.release_date){review.push({row,reason:'Incomplete TMDB metadata'});continue}
 const directors=[...new Set((film.credits?.crew||[]).filter(c=>c.job==='Director').map(c=>c.name))];
 const originalDirectors=String(row.director||'').split(',').map(s=>s.trim()).filter(Boolean);
 const overlap=originalDirectors.some(d=>directors.some(c=>normalize(c)===normalize(d)));
 if(!overlap){review.push({row,tmdb_title:film.title,tmdb_directors:directors,reason:'Director differs from verified staging candidate'});continue}
 const canonical={title:film.title,original_title:film.original_title,original_language:film.original_language,year:Number(film.release_date.slice(0,4)),director:directors.join(', '),tmdb_id:id,imdb_id:film.imdb_id||film.external_ids?.imdb_id||null};
 const prior=existing.get(id);
 if(prior){
  linked.push({source_row:row.source_row,film_id:prior.id,tmdb_id:id,rating:row.rating,notes:row.notes||'',existing_title:prior.title,canonical_title:canonical.title,identity_review:normalize(prior.title)!==normalize(canonical.title)});
  continue;
 }
 if(!canonical.imdb_id){review.push({row,canonical,reason:'IMDb ID missing: review before canonical insertion'});continue}
 const idAssigned=nextId++;
 proposed.push({id:idAssigned,...canonical,source_row:row.source_row,rating:row.rating,notes:row.notes||'',watched_date:null});
 if(proposed.length%100===0)console.log('Prepared '+proposed.length+' new films');
}
const report={summary:{staged_input:staging.staged.length,new_catalogue_proposals:proposed.length,linked_existing:linked.length,needs_review:review.length,previously_quarantined:staging.quarantined.length},linked_existing:linked,needs_review:review,proposed,warning:'Read-only preview. IDs are provisional until approved catalogue commit. Existing Supabase film_progress has NOT been queried or reconciled.'};
fs.writeFileSync('canonical-catalogue-preview.json',JSON.stringify(report,null,2)+'\n');
fs.writeFileSync('proposed-film-catalogue-additions.json',JSON.stringify(proposed.map(({source_row,rating,notes,watched_date,...f})=>f),null,2)+'\n');
console.log(JSON.stringify(report.summary,null,2));

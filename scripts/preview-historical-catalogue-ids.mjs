#!/usr/bin/env node
// Read-only TMDB metadata preparation for owner-reviewed historical identities.
// Input: CSV with a single tmdb_id column. No ratings, notes or user data.
import fs from 'node:fs';
const file=process.argv[2];
if(!file)throw Error('Usage: node scripts/preview-historical-catalogue-ids.mjs ids.csv');
const ids=fs.readFileSync(file,'utf8').replace(/^\uFEFF/,'').trim().split(/\r?\n/).slice(1).map(s=>Number(s.trim()));
if(ids.length!==714||new Set(ids).size!==ids.length||ids.some(x=>!Number.isSafeInteger(x)||x<=0))throw Error('Expected 714 distinct valid TMDB IDs');
const prefix='window.CULTURE_CATALOG = ';
const catalog=JSON.parse(fs.readFileSync('film-catalog.js','utf8').slice(prefix.length).trim().replace(/;$/,''));
const existing=new Map(catalog.map(x=>[Number(x.tmdb_id),x]));
const existingImdb=new Set(catalog.map(x=>x.imdb_id).filter(Boolean));
const apiKey=process.env.TMDB_API_KEY,token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!apiKey&&!token)throw Error('TMDB credentials required');
const additions=[],held=[],linked=[];
for(let i=0;i<ids.length;i++){
 const id=ids[i];
 if(existing.has(id)){linked.push({tmdb_id:id,film_id:existing.get(id).id});continue;}
 const url='https://api.themoviedb.org/3/movie/'+id+'?'+new URLSearchParams({language:'en-US',append_to_response:'credits,external_ids',...(apiKey?{api_key:apiKey}:{})});
 let film;
 for(let attempt=0;attempt<5;attempt++){
  const response=await fetch(url,{headers:{accept:'application/json',...(token?{Authorization:'Bearer '+token}:{})}});
  if(response.ok){film=await response.json();break;}
  if(response.status!==429&&response.status<500){held.push({tmdb_id:id,reason:'TMDB HTTP '+response.status});break;}
  await new Promise(r=>setTimeout(r,(attempt+1)*1200));
 }
 if(!film){if(!held.some(x=>x.tmdb_id===id))held.push({tmdb_id:id,reason:'TMDB unavailable'});continue;}
 const directors=[...new Set((film.credits?.crew||[]).filter(x=>x.job==='Director').map(x=>x.name))];
 const imdb=film.imdb_id||film.external_ids?.imdb_id||'';
 const year=Number((film.release_date||'').slice(0,4));
 if(film.id!==id||!film.title||!directors.length||!Number.isInteger(year)||!/^tt\d{6,}$/.test(imdb)||existingImdb.has(imdb)||additions.some(x=>x.imdb_id===imdb)){
  held.push({tmdb_id:id,title:film.title,reason:'Missing metadata, director, IMDb ID, or duplicate IMDb identity'});continue;
 }
 additions.push({title:film.title,director:directors.join(', '),year,tmdb_id:id,imdb_id:imdb,original_title:film.original_title,original_language:film.original_language});
 if((i+1)%50===0)console.log('Checked '+(i+1)+' / '+ids.length);
 await new Promise(r=>setTimeout(r,260));
}
fs.writeFileSync('historical-catalogue-714-preview.json',JSON.stringify({summary:{input:ids.length,additions:additions.length,linked_existing:linked.length,held:held.length},additions,linked,held,warning:'Read-only metadata preview. No catalogue or Supabase writes. Owner must review held records and proposed additions before catalogue PR.'},null,2)+'\n');
console.log(JSON.stringify({input:ids.length,additions:additions.length,linked_existing:linked.length,held:held.length}));

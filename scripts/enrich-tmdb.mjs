#!/usr/bin/env node
// Usage: TMDB_READ_ACCESS_TOKEN=... node scripts/enrich-tmdb.mjs [--apply]
// Without --apply, write a matching audit only. Never auto-accept ambiguous matches.
import fs from 'node:fs';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
const file=path.join(root,'film-catalog.js');
const text=fs.readFileSync(file,'utf8');
const prefix='window.CULTURE_CATALOG = ';
if(!text.includes(prefix))throw Error('Unexpected film-catalog.js format');
const catalog=JSON.parse(text.slice(text.indexOf(prefix)+prefix.length).trim().replace(/;$/,''));
const token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!token)throw Error('Set TMDB_READ_ACCESS_TOKEN (do not commit tokens to GitHub)');
const apply=process.argv.includes('--apply');
const norm=s=>String(s||'').toLowerCase().replace(/[^a-z0-9]+/g,' ').trim();
const wait=ms=>new Promise(r=>setTimeout(r,ms));
async function api(endpoint,params={}){
 const url=new URL('https://api.themoviedb.org/3/'+endpoint);
 for(const [k,v] of Object.entries(params))url.searchParams.set(k,v);
 for(let attempt=0;attempt<4;attempt++){
  const response=await fetch(url,{headers:{Authorization:'Bearer '+token,accept:'application/json'}});
  if(response.status===429||response.status>=500){await wait(1500*(attempt+1));continue}
  if(!response.ok)throw Error('TMDB '+response.status+' for '+endpoint);
  return response.json();
 }
 throw Error('TMDB retries exhausted: '+endpoint);
}
const audit={matched:[],unresolved:[],alreadyLinked:0};
const seen=new Map(catalog.filter(f=>f.tmdb_id).map(f=>[f.tmdb_id,f.id]));
for(const film of catalog){
 if(film.tmdb_id){audit.alreadyLinked++;continue}
 const result=await api('search/movie',{query:film.title,include_adult:'false'});
 const candidates=(result.results||[]).filter(c=>norm(c.title)===norm(film.title)||norm(c.original_title)===norm(film.title));
 const matches=[];
 for(const candidate of candidates.slice(0,5)){
  const year=Number((candidate.release_date||'').slice(0,4));
  // Award ceremony year is not necessarily original release year. Never reject solely on year.
  const detail=await api('movie/'+candidate.id,{append_to_response:'credits,external_ids'});
  const directors=(detail.credits?.crew||[]).filter(c=>c.job==='Director').map(c=>c.name);
  if(film.director&&!directors.some(d=>norm(d)===norm(film.director)))continue;
  matches.push({tmdb_id:candidate.id,title:detail.title,year,directors,imdb_id:detail.imdb_id||detail.external_ids?.imdb_id||null});
  await wait(250);
 }
 // Without a director, only accept a unique title match within two years of the listed year.
 const safeMatches=film.director?matches:matches.filter(m=>film.year&&m.year&&Math.abs(film.year-m.year)<=1);
 if(safeMatches.length===1&&!seen.has(safeMatches[0].tmdb_id)){
  const match=safeMatches[0];audit.matched.push({id:film.id,title:film.title,...match});
  if(apply){film.tmdb_id=match.tmdb_id;film.imdb_id=match.imdb_id}
  seen.set(match.tmdb_id,film.id);
 }else audit.unresolved.push({id:film.id,title:film.title,director:film.director,year:film.year,reason:safeMatches.length===0?'No sufficiently confident title/director/year match':safeMatches.length>1?'Multiple plausible matches':'TMDB ID already linked',candidates:matches});
 await wait(300);
}
const report=path.join(root,'tmdb-match-report.json');
fs.writeFileSync(report,JSON.stringify(audit,null,2)+'\n');
if(apply)fs.writeFileSync(file,prefix+JSON.stringify(catalog,null,2)+';\n');
console.log(JSON.stringify({alreadyLinked:audit.alreadyLinked,matched:audit.matched.length,unresolved:audit.unresolved.length,applied:apply,report},null,2));
if(audit.unresolved.length)process.exitCode=2;

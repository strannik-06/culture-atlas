#!/usr/bin/env node
// Verify that every collection refers to a unique master-catalogue identity.
import fs from 'node:fs';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
function readGlobal(filename,globalName){
 const source=fs.readFileSync(path.join(root,filename),'utf8');
 const marker='window.'+globalName+' = ';
 const start=source.indexOf(marker);
 if(start<0)throw Error('Missing '+globalName);
 return JSON.parse(source.slice(start+marker.length).trim().replace(/;$/,''));
}
const catalog=readGlobal('film-catalog.js','CULTURE_CATALOG');
const awards=readGlobal('awards-2025.js','CULTURE_AWARDS');
const html=fs.readFileSync(path.join(root,'index.html'),'utf8');
const inline=html.match(/const films=(\[[^;]*\]);/);
if(!inline)throw Error('Could not locate 2025 Top 100');
const top2025=JSON.parse(inline[1]);
const top2024=readGlobal('films-2024.js','CULTURE_FILMS_2024');
const errors=[];
const ids=new Set(),tmdb=new Map(),imdb=new Map();
for(const film of catalog){
 if(!Number.isSafeInteger(film.id)||film.id<=0)errors.push('Invalid internal ID '+film.id);
 if(ids.has(film.id))errors.push('Duplicate internal ID '+film.id);
 ids.add(film.id);
 if(!film.tmdb_id)errors.push('Missing TMDB ID for '+film.id);
 for(const [name,value,map] of [['TMDB',film.tmdb_id,tmdb],['IMDb',film.imdb_id,imdb]]){
  if(!value)continue;
  if(map.has(value))errors.push('Duplicate '+name+' '+value+' for '+map.get(value)+' and '+film.id);
  map.set(value,film.id);
 }
}
for(const [name,films] of [['Top 100 2025',top2025],['Top 100 2024',top2024],...awards.map(e=>[e.event+' '+e.year,e.films])]){
 const seen=new Set();
 for(const film of films){
  if(!ids.has(film.id))errors.push(name+': unknown film ID '+film.id);
  if(seen.has(film.id))errors.push(name+': repeated film ID '+film.id);
  seen.add(film.id);
 }
}
for(const event of awards)for(const category of event.categories||[]){
 for(const id of category.nominees||[])if(!ids.has(id))errors.push(event.event+' '+event.year+': unknown nominee '+id);
 if(category.winner!=null&&!ids.has(category.winner))errors.push(event.event+' '+event.year+': unknown winner '+category.winner);
}
// Canonical film director is required whenever a film appears in awards.
for(const event of awards)for(const film of event.films){
 const canonical=catalog.find(f=>f.id===film.id);
 if(!String(canonical?.director||'').trim())errors.push(event.event+' '+event.year+': missing canonical director for film '+film.id);
 for(const key of ['title','director','year','genre','tier'])if(Object.hasOwn(film,key))errors.push(event.event+' '+event.year+': duplicated '+key+' for film '+film.id);
}
console.log('Canonical films: '+catalog.length+'; Top 100 references: '+(top2025.length+top2024.length)+'; award events: '+awards.length+'; errors: '+errors.length);
if(errors.length){for(const e of errors)console.error(e);process.exitCode=1}

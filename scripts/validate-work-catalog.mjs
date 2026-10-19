#!/usr/bin/env node
import fs from 'node:fs';
import vm from 'node:vm';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
function readCatalog(file,name){
 const source=fs.readFileSync(path.join(root,file),'utf8');
 const prefix='window.'+name+' = ';
 if(!source.startsWith(prefix))throw Error('Unexpected catalogue format: '+file);
 return JSON.parse(source.slice(prefix.length).trim().replace(/;$/,''));
}
const films=readCatalog('film-catalog.js','CULTURE_CATALOG');
const series=readCatalog('tv-catalog.js','CULTURE_TV_CATALOG');
const aliases=readCatalog('tv-film-aliases.js','CULTURE_TV_FILM_ALIASES');
const window={};
vm.runInNewContext(fs.readFileSync(path.join(root,'work-identities.js'),'utf8'),{window});
const registry=window.CULTURE_WORK_IDENTITIES.createRegistry(films,series,aliases);
for(const show of series){
 if(!show.title||!show.original_title||!['series','miniseries','unknown'].includes(show.series_kind))throw Error('Missing TV identity fields: '+show.id);
 if(!/^tt\d{6,}$/.test(show.imdb_id)||!/^\d{4}-\d{2}-\d{2}$/.test(show.first_air_date)||show.year!==Number(show.first_air_date.slice(0,4)))throw Error('Invalid TV external ID or date: '+show.id);
 for(const group of ['creators','directors']){
  if(!Array.isArray(show[group]))throw Error('TV credits must be role-separated arrays');
  for(const person of show[group])if(!Number.isSafeInteger(person.id)||person.id<=0||!person.name)throw Error('Invalid person credit: '+show.id);
 }
}
console.log('Canonical films: '+films.length+'; TV works: '+series.length+'; unique namespaced works: '+registry.list().length);

#!/usr/bin/env node
// Discover editorial score candidates for newly catalogued films.
// No guessed scores: only approved records are published.
// Requires BRAVE_SEARCH_API_KEY for --discover; TMDB refresh is handled by refresh-tmdb.mjs.
// Usage: node scripts/enrich-editorial.mjs --discover [--all]
//        node scripts/enrich-editorial.mjs --publish
//        node scripts/enrich-editorial.mjs --report
import fs from 'node:fs';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
const read=(name,key)=>{const s=fs.readFileSync(path.join(root,name),'utf8');return JSON.parse(s.split('window.'+key+' = ')[1].trim().replace(/;$/,''))};
const catalog=read('film-catalog.js','CULTURE_CATALOG');
const catalogIds=new Set(catalog.map(f=>f.id));
const approvedPath=path.join(root,'editorial-ratings-approved.json');
const outputPath=path.join(root,'editorial-ratings.js');
const candidatePath=path.join(root,'editorial-ratings-candidates.json');
const approved=fs.existsSync(approvedPath)?JSON.parse(fs.readFileSync(approvedPath,'utf8')):[];
const sources={
 ebert:{name:'Roger Ebert',domain:'rogerebert.com'},
 guardian:{name:'The Guardian',domain:'theguardian.com'},
 indiewire:{name:'IndieWire',domain:'indiewire.com'},
 lwl:{name:'Little White Lies',domain:'lwlies.com'}
};
function validate(row){
 if(!catalogIds.has(row.film_id)||!sources[row.source])throw Error('Unknown film/source: '+JSON.stringify(row));
 if(typeof row.url!=='string'||!row.url.startsWith('https://'))throw Error('Invalid URL');
 const host=new URL(row.url).hostname.toLowerCase();
 const domain=sources[row.source].domain;
 if(host!==domain&&!host.endsWith('.'+domain))throw Error('Wrong publisher domain for '+row.source+': '+host);
 if(typeof row.score_display!=='string'||!row.score_display.trim())throw Error('Missing score: do not invent or infer');
 if(!/^([0-5](?:\\.5)?\\s*\\/\\s*5|[0-4](?:\\.5)?\\s*\\/\\s*4|[0-9]{1,2}\\s*\\/\\s*10|[A-F][+-]?)$/.test(row.score_display.trim()))throw Error('Unsupported score format: '+row.score_display);
 if(row.verified!==true)throw Error('Review identity and score must be verified before publication');
}
if(process.argv.includes('--discover')){
 const key=process.env.BRAVE_SEARCH_API_KEY;if(!key)throw Error('Set BRAVE_SEARCH_API_KEY (never commit it)');
 const old=fs.existsSync(candidatePath)?JSON.parse(fs.readFileSync(candidatePath,'utf8')):[];
 const completed=new Set(old.map(r=>r.film_id+':'+r.source));
 const published=new Set(approved.map(r=>r.film_id+':'+r.source));
 const results=[...old];let failures=0;
 const selected=process.argv.includes('--all')?catalog:catalog.filter(f=>!old.some(r=>r.film_id===f.id));
 for(const film of selected)for(const [source,info] of Object.entries(sources)){
  if(completed.has(film.id+':'+source)||published.has(film.id+':'+source))continue;
  const query='"'+film.title+'" '+(film.year||'')+' '+(film.director||'')+' film review site:'+info.domain;
  try{
   const response=await fetch('https://api.search.brave.com/res/v1/web/search?'+new URLSearchParams({q:query,count:'5'}),{headers:{'X-Subscription-Token':key,Accept:'application/json'}});
   if(!response.ok)throw Error('Search HTTP '+response.status);
   const data=await response.json();
   const links=(data.web?.results||[]).filter(r=>{try{const h=new URL(r.url).hostname.toLowerCase();return h===info.domain||h.endsWith('.'+info.domain)}catch{return false}}).map(r=>({title:r.title,url:r.url,description:r.description||''}));
   results.push({film_id:film.id,film_title:film.title,year:film.year,director:film.director,source,candidates:links,status:'needs_verification'});
   completed.add(film.id+':'+source);
  }catch(e){failures++;console.error(film.id,source,String(e))}
  await new Promise(resolve=>setTimeout(resolve,250));
 }
 fs.writeFileSync(candidatePath,JSON.stringify(results,null,2)+'\n');
 console.log('Saved '+results.length+' source searches; failures: '+failures+'; review candidate titles and snippets are NOT verified scores');
 if(failures)process.exitCode=2;
}
if(process.argv.includes('--publish')){
 const seen=new Set(),output={};
 for(const row of approved){
  validate(row);const k=row.film_id+':'+row.source;if(seen.has(k))throw Error('Duplicate approved score '+k);seen.add(k);
  (output[row.film_id]??={})[row.source]={score:row.score_display.trim(),url:row.url};
 }
 fs.writeFileSync(outputPath,'// Approved, source-linked editorial ratings. Never publish unverified search snippets.\nwindow.CULTURE_EDITORIAL_RATINGS = '+JSON.stringify(output,null,2)+';\n');
 console.log('Published '+seen.size+' verified scores for '+Object.keys(output).length+' films');
}
if(process.argv.includes('--report')||process.argv.length===2){
 console.log('Catalogue films: '+catalog.length+'; approved scores: '+approved.length+'; candidates: '+(fs.existsSync(candidatePath)?JSON.parse(fs.readFileSync(candidatePath,'utf8')).length:0));
}

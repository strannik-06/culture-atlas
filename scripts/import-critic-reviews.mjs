#!/usr/bin/env node
// Review-link import and coverage report. Usage:
// node scripts/import-critic-reviews.mjs --report
// node scripts/import-critic-reviews.mjs path/to/verified-reviews.json
// JSON input: [{"film_id":59,"label":"Publication · Critic","url":"https://..."}]
// Only import human-verified links; search results alone are NOT verified reviews.
import fs from 'node:fs';
import vm from 'node:vm';
const context={window:{}};vm.runInNewContext(fs.readFileSync('film-catalog.js','utf8'),context);
vm.runInNewContext(fs.readFileSync('critic-reviews.js','utf8'),context);
const films=context.window.CULTURE_CATALOG,known=new Set(films.map(f=>f.id));
const reviews=context.window.CULTURE_CRITIC_REVIEWS;
const input=process.argv[2];
if(input&&input!=='--report'){
 const rows=JSON.parse(fs.readFileSync(input,'utf8'));
 if(!Array.isArray(rows))throw Error('Expected array of review entries');
 for(const row of rows){
  if(!known.has(row.film_id))throw Error('Unknown film ID '+row.film_id);
  if(typeof row.label!=='string'||!row.label.trim()||typeof row.url!=='string'||!/^https:\/\//.test(row.url))throw Error('Invalid review entry for '+row.film_id);
  const existing=reviews[row.film_id]||[];
  if(!existing.some(item=>item.url===row.url))existing.push({label:row.label.trim(),url:row.url});
  reviews[row.film_id]=existing;
 }
 fs.writeFileSync('critic-reviews.js','window.CULTURE_CRITIC_REVIEWS = '+JSON.stringify(reviews,null,2)+';\n');
 console.log('Imported '+rows.length+' verified review entries');
}
const covered=films.filter(f=>(reviews[f.id]||[]).length);
console.log('Review coverage: '+covered.length+'/'+films.length+' films; '+Object.values(reviews).reduce((n,items)=>n+items.length,0)+' links');
console.log('Missing: '+films.filter(f=>!(reviews[f.id]||[]).length).map(f=>f.id+' '+f.title).join(' | '));

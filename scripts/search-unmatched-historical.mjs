#!/usr/bin/env node
// Read-only TMDB search for historical records without candidates.
import fs from 'node:fs';
const input=process.argv[2];if(!input)throw Error('Usage: node scripts/search-unmatched-historical.mjs remaining-search_needed.csv');
const key=process.env.TMDB_API_KEY;if(!key)throw Error('TMDB_API_KEY required');
function parse(s){const out=[];let row=[],f='',q=false;for(let i=0;i<s.length;i++){const c=s[i];if(q){if(c==='"'&&s[i+1]==='"'){f+='"';i++}else if(c==='"')q=false;else f+=c;}else if(c==='"')q=true;else if(c===','){row.push(f);f='';}else if(c==='\n'){row.push(f);out.push(row);row=[];f='';}else if(c!=='\r')f+=c;}if(row.length||f){row.push(f);out.push(row);}const h=out.shift().map(x=>x.replace(/^\uFEFF/,''));return out.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(h.map((k,i)=>[k,r[i]??''])));}
const rows=parse(fs.readFileSync(input,'utf8'));
const esc=x=>/[",\n\r]/.test(String(x??''))?'"'+String(x??'').replace(/"/g,'""')+'"':String(x??'');
async function tmdb(endpoint,params){const u=new URL('https://api.themoviedb.org/3/'+endpoint);u.searchParams.set('api_key',key);for(const [k,v] of Object.entries(params))u.searchParams.set(k,v);for(let retry=0;retry<4;retry++){const r=await fetch(u);if(r.ok)return r.json();if(r.status!==429&&r.status<500)throw Error('TMDB '+r.status);await new Promise(resolve=>setTimeout(resolve,1000*(retry+1)));}throw Error('TMDB retries exhausted');}
const output=[];let errors=0;
for(const r of rows){
 const title=r.source_title.replace(/\s*\((?:сериал|мини-сериал|т\/с)\)\s*/gi,'').trim();
 const queries=[{query:title,language:'ru-RU'},{query:title,language:'en-US'}];
 const candidates=new Map();
 for(const q of queries){for(const type of ['movie','tv']){try{const data=await tmdb('search/'+type,{...q,include_adult:'false'});for(const c of (data.results||[]).slice(0,10)){const year=(c.release_date||c.first_air_date||'').slice(0,4);if(year&&Math.abs(Number(year)-Number(r.source_year))>2)continue;const id=type+':'+c.id;const existing=candidates.get(id);if(!existing||(!existing.title?.match(/[а-яё]/i)&&c.title?.match(/[а-яё]/i)))candidates.set(id,{id:c.id,type,title:c.title||c.name,original_title:c.original_title||c.original_name,year,popularity:c.popularity||0});}}catch(e){errors++;console.error('Search error',r.source_row,type,e.message);}}}
 const ranked=[...candidates.values()].sort((a,b)=>Math.abs(Number(a.year)-Number(r.source_year))-Math.abs(Number(b.year)-Number(r.source_year))||b.popularity-a.popularity).slice(0,5);
 output.push({...r,search_candidates:ranked,decision:'manual_identity_review'});
}
fs.writeFileSync('unmatched-search-candidates.json',JSON.stringify({total:rows.length,errors,rows:output},null,2)+'\n');
const cols=['source_row','source_title','source_director','source_year','rating','notes','candidate_1','candidate_2','candidate_3','candidate_4','candidate_5','correct_tmdb_url','review_decision'];
fs.writeFileSync('unmatched-search-review.csv','\uFEFF'+cols.join(',')+'\n'+output.map(r=>[r.source_row,r.source_title,r.source_director,r.source_year,r.rating,r.notes,...Array.from({length:5},(_,i)=>{const c=r.search_candidates[i];return c?`${c.title} (${c.year}) | ${c.type} | https://www.themoviedb.org/${c.type}/${c.id}`:'';}),'',''].map(esc).join(',')).join('\n')+'\n');
console.log(JSON.stringify({total:rows.length,with_candidates:output.filter(r=>r.search_candidates.length).length,no_candidates:output.filter(r=>!r.search_candidates.length).length,errors},null,2));

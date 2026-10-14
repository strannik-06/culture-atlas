#!/usr/bin/env node
// Read-only first pass of the personal film ratings import.
// Usage: node scripts/prepare-ratings-import.mjs path/to/source.csv [--tmdb]
// CSV columns: source_row,director,source_title,original_title_hint,source_year,rating,notes
// --tmdb requires TMDB_READ_ACCESS_TOKEN. Never commits user ratings or modifies Supabase.
import fs from 'node:fs';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
const marker='window.CULTURE_CATALOG = ';
const src=fs.readFileSync(path.join(root,'film-catalog.js'),'utf8');
const catalog=JSON.parse(src.slice(src.indexOf(marker)+marker.length).trim().replace(/;$/,''));
const input=process.argv[2];
if(!input||input.startsWith('--'))throw Error('Usage: node scripts/prepare-ratings-import.mjs source.csv [--tmdb]');
const useTmdb=process.argv.includes('--tmdb');
const token=process.env.TMDB_READ_ACCESS_TOKEN;
if(useTmdb&&!token)throw Error('TMDB_READ_ACCESS_TOKEN is required for --tmdb');
function parseCsv(s){
 const lines=[];let row=[],field='',quoted=false;
 for(let i=0;i<s.length;i++){const c=s[i];
  if(quoted){if(c==='"'&&s[i+1]==='"'){field+='"';i++}else if(c==='"')quoted=false;else field+=c}
  else if(c==='"')quoted=true;
  else if(c===','){row.push(field);field=''}
  else if(c==='\n'){row.push(field);lines.push(row);row=[];field=''}
  else if(c!=='\r')field+=c;
 }
 if(quoted)throw Error('Unclosed CSV quote');
 if(field||row.length){row.push(field);lines.push(row)}
 const headers=lines.shift().map((h,i)=>i===0?h.replace(/^\uFEFF/,''):h);
 const required=['source_row','director','source_title','source_year','rating'];
 for(const h of required)if(!headers.includes(h))throw Error('Missing column '+h);
 return lines.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(headers.map((h,i)=>[h,r[i]||''])));
}
const normalize=s=>String(s||'').normalize('NFKD').replace(/[\u0300-\u036f]/g,'').replace(/ё/g,'е').toLowerCase().replace(/[^\p{L}\p{N}]+/gu,' ').trim();
const rows=parseCsv(fs.readFileSync(input,'utf8'));
const out=[],cache=new Map();
const wait=ms=>new Promise(r=>setTimeout(r,ms));
async function searchTmdb(query,year,language){
 const key=[query,year,language].join('|');if(cache.has(key))return cache.get(key);
 const url='https://api.themoviedb.org/3/search/movie?'+new URLSearchParams({query,language,include_adult:'false',...(year?{year:String(year)}:{})});
 const response=await fetch(url,{headers:{Authorization:'Bearer '+token,accept:'application/json'}});
 if(!response.ok)throw Error('TMDB search '+response.status);
 const data=await response.json();const results=(data.results||[]).slice(0,10);
 cache.set(key,results);await wait(260);return results;
}
for(const row of rows){
 const year=Number(row.source_year),rating=Number(String(row.rating).replace(',','.'));
 if(!Number.isInteger(year)||year<1880||year>2100||!Number.isFinite(rating)||rating<0||rating>10)throw Error('Invalid year/rating at source row '+row.source_row);
 const title=row.source_title.trim(),director=row.director.trim(),hint=(row.original_title_hint||'').trim();
 const names=[title,hint].filter(Boolean).map(normalize);
 const existing=catalog.filter(f=>Math.abs(Number(f.year)-year)<=1&&[f.title,...(f.alternate_titles||[])].some(t=>names.includes(normalize(t))));
 let result={source_row:Number(row.source_row),source_title:title,source_director:director,source_year:year,rating,original_title_hint:hint,status:'needs_review',catalog_candidates:existing.map(f=>({id:f.id,title:f.title,director:f.director,year:f.year,tmdb_id:f.tmdb_id}))};
 if(existing.length===1){result.status='catalog_candidate';result.proposed_catalog_id=existing[0].id}
 else if(existing.length>1)result.status='ambiguous_catalog';
 else if(useTmdb){
  const candidates=new Map();
  for(const query of [hint,title].filter(Boolean)){
   for(const language of [/\p{Script=Cyrillic}/u.test(query)?'ru-RU':'en-US']){
    for(const candidate of await searchTmdb(query,year,language))candidates.set(candidate.id,candidate);
   }
  }
  const list=[...candidates.values()].map(c=>({tmdb_id:c.id,title:c.title,original_title:c.original_title,year:String(c.release_date||'').slice(0,4),popularity:c.popularity})).sort((a,b)=>b.popularity-a.popularity);
  result.tmdb_candidates=list.slice(0,10);result.status=list.length?'tmdb_candidates_need_director_check':'unmatched';
 }
 out.push(result);
}
const target=path.resolve(process.cwd(),'ratings-import-report.json');
fs.writeFileSync(target,JSON.stringify({source: path.basename(input),count:out.length,summary:Object.fromEntries([...new Set(out.map(r=>r.status))].map(k=>[k,out.filter(r=>r.status===k).length])),rows:out},null,2)+'\n');
console.log(JSON.stringify({count:out.length,summary:Object.fromEntries([...new Set(out.map(r=>r.status))].map(k=>[k,out.filter(r=>r.status===k).length])),report:target},null,2));
console.log('All candidates require review of director and release year before a database import. No database changes made.');

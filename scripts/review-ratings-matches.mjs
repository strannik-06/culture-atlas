#!/usr/bin/env node
// Second-pass review of historical film identities. Read-only: never writes to Supabase.
// Usage: node scripts/review-ratings-matches.mjs ratings-import-report.json prepared.csv
import fs from 'node:fs';
const [reportPath,csvPath]=process.argv.slice(2);
if(!reportPath||!csvPath)throw Error('Usage: node scripts/review-ratings-matches.mjs report.json prepared.csv');
const key=process.env.TMDB_API_KEY,token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!key&&!token)throw Error('Set TMDB_API_KEY or TMDB_READ_ACCESS_TOKEN');
const report=JSON.parse(fs.readFileSync(reportPath,'utf8'));
function csv(text){
 let rows=[],row=[],field='',quoted=false;
 for(let i=0;i<text.length;i++){const c=text[i];
  if(quoted){if(c==='"'&&text[i+1]==='"'){field+='"';i++}else if(c==='"')quoted=false;else field+=c}
  else if(c==='"')quoted=true;else if(c===','){row.push(field);field=''}
  else if(c==='\n'){row.push(field);rows.push(row);row=[];field=''}
  else if(c!=='\r')field+=c;
 }
 if(quoted)throw Error('Invalid CSV');
 if(field||row.length){row.push(field);rows.push(row)}
 const header=rows.shift().map((s,i)=>i===0?s.replace(/^\uFEFF/,''):s);
 return rows.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(header.map((h,i)=>[h,r[i]||''])));
}
const source=new Map(csv(fs.readFileSync(csvPath,'utf8')).map(r=>[r.source_row,r]));
const translit={'а':'a','б':'b','в':'v','г':'g','д':'d','е':'e','ё':'e','ж':'zh','з':'z','и':'i','й':'y','к':'k','л':'l','м':'m','н':'n','о':'o','п':'p','р':'r','с':'s','т':'t','у':'u','ф':'f','х':'kh','ц':'ts','ч':'ch','ш':'sh','щ':'shch','ъ':'','ы':'y','ь':'','э':'e','ю':'yu','я':'ya'};
const norm=s=>String(s||'').toLowerCase().replace(/[а-яё]/g,c=>translit[c]||c).normalize('NFKD').replace(/[\u0300-\u036f]/g,'').replace(/[^a-z0-9]+/g,' ').trim();
const tokens=s=>norm(s).split(' ').filter(x=>x.length>=3);
const wait=ms=>new Promise(r=>setTimeout(r,ms));
const cache=new Map();
async function tmdb(endpoint,params={}){
 const url='https://api.themoviedb.org/3/'+endpoint+'?'+new URLSearchParams({...params,...(key?{api_key:key}:{})});
 if(cache.has(url))return cache.get(url);
 let response;
 for(let retry=0;retry<4;retry++){
  response=await fetch(url,{headers:{accept:'application/json',...(token?{Authorization:'Bearer '+token}:{})}});
  if(response.ok)break;
  if(response.status!==429&&response.status<500)throw Error(endpoint+' HTTP '+response.status);
  await wait(1000*(retry+1));
 }
 if(!response.ok)throw Error(endpoint+' HTTP '+response.status);
 const value=await response.json();cache.set(url,value);await wait(270);return value;
}
function titleScore(row,c){
 const sourceTitles=[row.source_title,row.original_title_hint].filter(Boolean).map(norm);
 const candidateTitles=[c.title,c.original_title].filter(Boolean).map(norm);
 if(sourceTitles.some(t=>candidateTitles.includes(t)))return 1;
 if(sourceTitles.some(t=>candidateTitles.some(ct=>ct.includes(t)||t.includes(ct))))return .65;
 return 0;
}
function directorScore(sourceDirector,tmdbDirectors){
 if(!tmdbDirectors.length)return 0;
 const sourceNames=sourceDirector.split(/[;,|]/).map(tokens).filter(t=>t.length);
 let best=0;
 for(const a of sourceNames)for(const name of tmdbDirectors){
  const b=tokens(name);
  if(!b.length)continue;
  const shared=a.filter(t=>b.some(u=>u===t||u.startsWith(t)||t.startsWith(u))).length;
  const score=shared>=2?1:shared===1?.7:0;
  best=Math.max(best,score);
 }
 return best;
}
const rows=[];
for(let index=0;index<report.rows.length;index++){
 const original=report.rows[index],raw=source.get(String(original.source_row));
 if(!raw)throw Error('Missing source row '+original.source_row);
 const row={...original,notes:raw.notes||'',media_type:'movie',match_status:'review_required',review_reasons:[],ranked_candidates:[]};
 if(original.status==='catalog_candidate'||original.status==='ambiguous_catalog'){
  row.match_status='catalog_identity_review';row.review_reasons.push('Existing catalog match must be checked for director and identity');
  rows.push(row);continue;
 }
 let candidates=(original.tmdb_candidates||[]).map(c=>({...c,media_type:'movie'}));
 // Year filters miss valid international/TV titles; retry without year and search TV.
 if(candidates.length===0){
  for(const q of [row.original_title_hint,row.source_title].filter(Boolean)){
   for(const type of ['movie','tv']){
    const found=await tmdb('search/'+type,{query:q,language:/[а-яё]/i.test(q)?'ru-RU':'en-US',include_adult:'false'});
    for(const c of (found.results||[]).slice(0,8))candidates.push({tmdb_id:c.id,title:c.title||c.name,original_title:c.original_title||c.original_name,year:String(c.release_date||c.first_air_date||'').slice(0,4),popularity:c.popularity||0,media_type:type});
   }
  }
 }
 const unique=[...new Map(candidates.map(c=>[c.media_type+':'+c.tmdb_id,c])).values()];
 const scored=unique.map(c=>{
  const y=Number(c.year),delta=y?Math.abs(y-row.source_year):null;
  return {...c,title_match:titleScore(row,c),year_delta:delta,preliminary_score:titleScore(row,c)*5+(delta===0?3:delta===1?2:delta!==null&&delta<=3?1:0)+Math.min(1,Math.log1p(c.popularity||0)/10)};
 }).sort((a,b)=>b.preliminary_score-a.preliminary_score);
 // Check credits on only top 3 candidates to limit API requests and costs.
 for(const c of scored.slice(0,3)){
  try{
   const detail=await tmdb(c.media_type+'/'+c.tmdb_id,{append_to_response:c.media_type==='movie'?'credits':'aggregate_credits'});
   const crew=c.media_type==='movie'?(detail.credits?.crew||[]):(detail.aggregate_credits?.crew||[]);
   const directors=crew.filter(p=>p.job==='Director'||p.department==='Directing'&&p.jobs?.some(j=>j.job==='Director')).map(p=>p.name);
   c.directors=[...new Set(directors)];c.director_match=directorScore(row.source_director,c.directors);
   c.verified_score=c.preliminary_score+5*c.director_match;
  }catch(e){c.verification_error=e.message;c.verified_score=c.preliminary_score}
 }
 scored.sort((a,b)=>(b.verified_score??b.preliminary_score)-(a.verified_score??a.preliminary_score));
 row.ranked_candidates=scored.slice(0,10);
 if(!scored.length){row.match_status='unmatched';row.review_reasons.push('No TMDB candidate from year-filtered or yearless movie/TV search')}
 else{
  const top=scored[0],runner=scored[1];
  if(top.media_type==='tv')row.review_reasons.push('TV series: requires separate catalogue policy');
  if(top.year_delta!==null&&top.year_delta>1)row.review_reasons.push('Release year differs by '+top.year_delta);
  if(!top.director_match)row.review_reasons.push('Director not verified');
  if(!top.title_match)row.review_reasons.push('Title not verified');
  if(top.director_match>=.7&&top.title_match>=.65&&top.year_delta!==null&&top.year_delta<=1&&(!runner||(top.verified_score??top.preliminary_score)-(runner.verified_score??runner.preliminary_score)>=2)&&top.media_type==='movie'){
   row.match_status='high_confidence_candidate';
  }else row.match_status='review_required';
 }
 rows.push(row);
 if((index+1)%100===0)console.log('Reviewed '+(index+1)+'/'+report.rows.length);
}
const summary=Object.fromEntries([...new Set(rows.map(r=>r.match_status))].map(k=>[k,rows.filter(r=>r.match_status===k).length]));
fs.writeFileSync('ratings-import-review-v2.json',JSON.stringify({count:rows.length,summary,rows},null,2)+'\n');
console.log(JSON.stringify({count:rows.length,summary},null,2));
console.log('No database writes. High confidence is a candidate label, not permission to import.');

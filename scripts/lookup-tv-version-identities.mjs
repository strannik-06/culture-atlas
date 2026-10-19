#!/usr/bin/env node
// Read-only TMDB evidence collector. Outputs metadata only, never progress.
import fs from 'node:fs';
const seeds=JSON.parse(fs.readFileSync('imports/tv-version-56-seeds.json','utf8'));
const apiKey=process.env.TMDB_API_KEY;
const token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!apiKey&&!token)throw Error('Configure a TMDB API key or read-access token');
const errors=[];
async function request(endpoint,params={}){
 const url=new URL('https://api.themoviedb.org/3/'+endpoint);
 for(const [k,v] of Object.entries({language:'en-US',...params}))url.searchParams.set(k,String(v));
 if(apiKey)url.searchParams.set('api_key',apiKey);
 const headers=token?{Authorization:'Bearer '+token}:{};
 try{
  const response=await fetch(url,{headers,signal:AbortSignal.timeout(20000)});
  if(!response.ok){errors.push({endpoint,status:response.status});return null;}
  return await response.json();
 }catch{errors.push({endpoint,status:'network_error'});return null;}
}
const cache=new Map();
async function details(type,id){
 const key=type+':'+id;
 if(!cache.has(key))cache.set(key,(async()=>{
  const d=await request(type+'/'+id,{append_to_response:type==='tv'?'external_ids,aggregate_credits':'external_ids,credits'});
  if(!d)return null;
  const crew=d.aggregate_credits?.crew||d.credits?.crew||[];
  const directors=crew.filter(p=>p.job==='Director'||p.jobs?.some(j=>j.job==='Director')).map(p=>({id:p.id,name:p.name}));
  const byId=new Map(directors.map(p=>[p.id,p]));
  return {media_type:type,tmdb_id:d.id,title:d.name||d.title,original_title:d.original_name||d.original_title,release_date:d.first_air_date||d.release_date||null,imdb_id:d.external_ids?.imdb_id||d.imdb_id||null,original_language:d.original_language,series_type:d.type||null,episode_count:d.number_of_episodes||null,season_count:d.number_of_seasons||null,creators:(d.created_by||[]).map(p=>({id:p.id,name:p.name})),directors:[...byId.values()],seasons:(d.seasons||[]).filter(s=>s.season_number>0).map(s=>({season_number:s.season_number,title:s.name,air_date:s.air_date,episode_count:s.episode_count})),poster_path:d.poster_path||null};
 })());
 return cache.get(key);
}
const entries=[];
for(const seed of seeds.entries){
 const candidates=new Map();
 const add=(type,id,route)=>{const key=type+':'+id;if(!candidates.has(key))candidates.set(key,{type,id,routes:[]});candidates.get(key).routes.push(route);};
 if(seed.legacy_media_type&&seed.legacy_tmdb_id)add(seed.legacy_media_type,seed.legacy_tmdb_id,'legacy_candidate');
 if(seed.tv_id_hint)add('tv',seed.tv_id_hint,'public_tv_hint');
 if(seed.imdb_id_hint){
  const found=await request('find/'+seed.imdb_id_hint,{external_source:'imdb_id'});
  for(const type of ['tv','movie'])for(const f of found?.[type+'_results']||[])add(type,f.id,'imdb_lookup');
 }
 for(const title of seed.search_titles||[seed.title]){
  const query=title.replace(/\s*\([^)]*\)\s*/g,' ').trim();
  for(const type of seed.search_movies?['tv','movie']:['tv']){
   const found=await request('search/'+type,{query,include_adult:false});
   const results=(found?.results||[]).filter(f=>Math.abs(Number((f.first_air_date||f.release_date||'').slice(0,4))-seed.year)<=2).slice(0,4);
   for(const f of results)add(type,f.id,'title_year_search');
  }
 }
 const evidence=[];
 for(const c of candidates.values()){
  const d=await details(c.type,c.id);
  if(d)evidence.push({...d,lookup_routes:c.routes});
 }
 entries.push({...seed,candidates:evidence});
 console.log('TV_SOURCE_EVIDENCE '+JSON.stringify(entries.at(-1)));
}
const report={generated_at:new Date().toISOString(),base_commit:seeds.base_commit,source_count:entries.length,entries,errors,warning:'Candidate metadata only. Search, title/year and inherited IDs never approve identity or rating scope. No Supabase or progress access.'};
fs.writeFileSync('tv-version-56-tmdb-evidence.json',JSON.stringify(report,null,2)+'\n');
console.log('TV_LOOKUP_ERRORS '+JSON.stringify(errors));
console.log(JSON.stringify({source_count:entries.length,candidates:entries.reduce((n,r)=>n+r.candidates.length,0),errors:errors.length}));
if(errors.some(e=>[401,403].includes(e.status)))process.exitCode=1;

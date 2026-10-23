// Build reviewed 2026 award memberships; match new films by director + title, never title alone.
import fs from 'node:fs';
import vm from 'node:vm';
import {mergeMetadata,present} from './complete-film-metadata.mjs';
const read=(file,key)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(file,'utf8'),c);return JSON.parse(JSON.stringify(c.window[key]));};
const write=(file,key,data)=>fs.writeFileSync(file,'window.'+key+' = '+JSON.stringify(data,null,2)+';\n');
const raw=JSON.parse(fs.readFileSync('imports/awards-2026-source.json','utf8'));
const films=read('film-catalog.js','CULTURE_CATALOG'),details=read('film-details.js','CULTURE_FILM_DETAILS');
const directorsMatch=(candidate,actual)=>[candidate.director,...candidate.director_aliases||[]].some(expected=>directorMatches(expected,actual));
const norm=s=>String(s||'').normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
const words=s=>String(s||'').normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().match(/[\p{L}\p{N}]+/gu)||[];
const directorMatches=(expected,actual)=>{if(norm(actual).includes(norm(expected)))return true;const a=new Set(words(actual));return words(expected).filter(w=>w!=='and').every(w=>a.has(w));};
const key=process.env.TMDB_API_KEY,token=process.env.TMDB_READ_ACCESS_TOKEN;
const overrides=fs.existsSync('imports/awards-2026-identity-overrides.json')?JSON.parse(fs.readFileSync('imports/awards-2026-identity-overrides.json','utf8')):{};
async function api(path,params={}){
 const u=new URL('https://api.themoviedb.org/3/'+path);for(const[k,v]of Object.entries(params))if(v!=null)u.searchParams.set(k,String(v));if(!token)u.searchParams.set('api_key',key||'');
 for(let i=0;i<4;i++){try{const r=await fetch(u,{headers:token?{Authorization:'Bearer '+token}:{},signal:AbortSignal.timeout(20000)});if(r.ok)return r.json();if(r.status!==429&&r.status<500)throw Error('TMDB HTTP '+r.status);}catch(e){if(i===3)throw Error('TMDB request failed for '+path+' ('+e.name+')');}await new Promise(r=>setTimeout(r,500*(i+1)));}throw Error('TMDB unavailable');
}
const audit={edition:2026,matched:[],added:[],unresolved:[]};let next=Math.max(...films.map(f=>f.id))+1;
const title=t=>raw.aliases[t]||t;
const existing=t=>films.filter(f=>f.year>=2024&&[f.title,f.original_title,...f.alternate_titles||[]].some(x=>norm(x)===norm(title(t))));
const candidates=[...raw.extra_films,...raw.events.flatMap(e=>e.programmes?e.programmes.flatMap(s=>s.selection):e.selection||[])];
for(const candidate of candidates){
 const names=[candidate.title,...candidate.aliases||[]],same=films.filter(f=>names.some(t=>[f.title,f.original_title,...f.alternate_titles||[]].some(x=>norm(t)===norm(x)))&&directorsMatch(candidate,f.director));
 if(same.length===1){audit.matched.push({title:candidate.title,id:same[0].id,tmdb_id:same[0].tmdb_id});continue;}
 if(same.length>1){audit.unresolved.push({...candidate,reason:'Ambiguous existing identity'});continue;}
 if(!key&&!token){audit.unresolved.push({...candidate,reason:'TMDB credentials required'});continue;}
 try{
  const movieIds=new Set();if(candidate.imdb_id){const found=await api('find/'+candidate.imdb_id,{external_source:'imdb_id'});for(const m of found.movie_results||[])movieIds.add(m.id);}
  if(overrides[candidate.title])movieIds.add(overrides[candidate.title]);
  else if(!movieIds.size)for(const name of names){const response=await api('search/movie',{query:name,include_adult:false});for(const m of response.results||[])if(Math.abs(Number(m.release_date?.slice(0,4)||candidate.year)-candidate.year)<=2&&[m.title,m.original_title].some(t=>names.some(n=>norm(n)===norm(t))))movieIds.add(m.id);}
  const verified=[],reviewed=[];
  for(const id of movieIds){try{const m=await api('movie/'+id,{append_to_response:'credits,external_ids'});const directors=(m.credits?.crew||[]).filter(p=>p.job==='Director').map(p=>p.name).join(', ');reviewed.push({tmdb_id:m.id,title:m.title,original_title:m.original_title,directors});if(directorsMatch(candidate,directors)&&(!candidate.imdb_id||m.imdb_id===candidate.imdb_id)&&(!candidate.expected_original_title||norm(m.original_title)===norm(candidate.expected_original_title)))verified.push(m);}catch(error){reviewed.push({tmdb_id:id,reason:'Provider record unavailable'});}}
  if(verified.length!==1){audit.unresolved.push({...candidate,reason:'Expected one title/director match; found '+verified.length,reviewed});continue;}
  const m=verified[0],old=films.find(f=>f.tmdb_id===m.id||m.imdb_id&&f.imdb_id===m.imdb_id);
  if(old){audit.matched.push({title:candidate.title,id:old.id,tmdb_id:m.id});candidate.canonical_id=old.id;continue;}
  const film={id:next++,title:m.title,director:m.credits.crew.filter(p=>p.job==='Director').map(p=>p.name).join(', '),year:Number(m.release_date?.slice(0,4))||candidate.year,tmdb_id:m.id,...(m.imdb_id?{imdb_id:m.imdb_id}:{}),original_title:m.original_title,original_language:m.original_language,alternate_titles:[...new Set(names.filter(n=>norm(n)!==norm(m.title)&&norm(n)!==norm(m.original_title)))]};
  films.push(film);details[film.id]=mergeMetadata(film,{},m);candidate.canonical_id=film.id;audit.added.push({title:candidate.title,...film});
 }catch(e){audit.unresolved.push({...candidate,reason:e.message});}
}
const lookup=t=>{const candidate=candidates.find(f=>norm(f.title)===norm(title(t))||f.aliases?.some(a=>norm(a)===norm(title(t))));if(candidate?.canonical_id)return candidate.canonical_id;const hits=existing(t);if(hits.length===1)return hits[0].id;if(candidate){const hits=films.filter(f=>directorsMatch(candidate,f.director)&&[candidate.title,...candidate.aliases||[]].some(n=>[f.title,f.original_title,...f.alternate_titles||[]].some(x=>norm(n)===norm(x))));if(hits.length===1)return hits[0].id;}throw Error('Unresolved film '+t);};
const output=[];
for(const e of raw.events){try{
 const slug=name=>name.normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'');
 const categories=e.programmes?e.programmes.map(section=>{
  const entries=section.selection.map(film=>{const film_id=lookup(film.title);const prizes=section.prizes.flatMap(prize=>{const winners=prize.entries.filter(row=>row.winner&&lookup(row.title)===film_id);if(!winners.length)return [];const people=[...new Set(winners.map(row=>row.person).filter(Boolean))];return [prize.name+(people.length?' · '+people.join(', '):'')];});return {film_id,winner:prizes.length>0,prizes,prize_rank:section.prizes.findIndex(prize=>prize.entries.some(row=>row.winner&&lookup(row.title)===film_id))};});
  const winners=entries.filter(row=>row.winner).sort((a,b)=>a.prize_rank-b.prize_rank).map(row=>row.film_id);
  return {id:slug(section.name),name:section.name,nomination_kind:'competition',source:section.source,awardsSource:section.awardsSource,nominees:entries.map(row=>row.film_id),winner:winners[0]??null,winners,entries};
 }):e.categories.map((c,i)=>{
  const entries=c.entries.map(row=>({film_id:lookup(row.title),...(row.person?{person:row.person}:{}),winner:row.winner}));
  const nominees=[...new Set(entries.map(x=>x.film_id))],winners=[...new Set(entries.filter(x=>x.winner).map(x=>x.film_id))];
  return {id:c.name.normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,''),name:c.name,nominees,winner:winners[0]??null,winners,entries,...(c.nomination_kind?{nomination_kind:c.nomination_kind}:{})};
 });
 const ids=[...new Set(categories.flatMap(c=>c.nominees))];
 output.push({event:e.event,year:2026,section:e.section,dates:e.dates,source:e.source,awardsSource:e.awardsSource||e.source,resultsUrl:e.awardsSource||e.source,categories,films:ids.map(id=>({id,awards:e.programmes?categories.flatMap(c=>c.entries.find(row=>row.film_id===id)?.prizes||[]):categories.filter(c=>c.winners.includes(id)).map(c=>c.name)}))});
}catch(error){audit.unresolved.push({event:e.event,reason:error.message});}}
// Identity-checked official supplements fill provider gaps without replacing metadata.
const supplements=JSON.parse(fs.readFileSync('imports/film-metadata-overrides.json','utf8')).entries;
for(const entry of supplements){const film=films.find(f=>f.id===entry.id);if(!film||film.tmdb_id!==entry.tmdb_id)throw Error('Supplement identity mismatch '+entry.id);for(const [field,value]of Object.entries(entry.fields))if(!present(details[film.id]?.[field])){details[film.id]||={};details[film.id][field]=value;}}
write('film-catalog.js','CULTURE_CATALOG',films);write('film-details.js','CULTURE_FILM_DETAILS',details);write('awards-2026.js','CULTURE_AWARDS_2026',output);
fs.writeFileSync('imports/awards-2026-audit.json',JSON.stringify({...audit,new_canonical_ids:films.filter(f=>f.id>raw.baseline_max_id).map(f=>({id:f.id,title:f.title,tmdb_id:f.tmdb_id})),programme_new_ids:films.filter(f=>f.id>(raw.programme_baseline_max_id??Infinity)).map(f=>({id:f.id,title:f.title,tmdb_id:f.tmdb_id})),event_counts:output.map(e=>({event:e.event,films:e.films.length,categories:e.categories.length}))},null,2)+'\n');
console.log(JSON.stringify({matched:audit.matched.length,added:audit.added.length,unresolved:audit.unresolved.length,events:output.length}));
// Keep partial work reviewable; unresolved entries must be resolved before final validation.

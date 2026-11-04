// Resolve the complete 2016–2020 batch before publishing any of its award pages.
import fs from 'node:fs';
import vm from 'node:vm';
import crypto from 'node:crypto';
import {mergeMetadata,fields,present} from './complete-film-metadata.mjs';
const batch=process.argv[2]||'2016-2020';
if(!['2016-2020','2011-2015'].includes(batch))throw Error('Unsupported award batch');
const [firstYear,lastYear]=batch.split('-').map(Number);
const slugs=['oscars','bafta','globes','cannes','venice','berlinale'];
const read=(p,k)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(p,'utf8'),c);return JSON.parse(JSON.stringify(c.window[k]));};
const write=(p,k,v)=>fs.writeFileSync(p,'window.'+k+' = '+JSON.stringify(v,null,2)+';\n');
const norm=s=>String(s||'').normalize('NFKD').replace(/\p{M}/gu,'').replace(/[łŁ]/g,'l').replace(/[øØ]/g,'o').replace(/[đĐðÐ]/g,'d').replace(/æ/gi,'ae').replace(/œ/gi,'oe').replace(/ı/g,'i').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
const directorKey=s=>norm(s).split('').sort().join('');
const overrides=JSON.parse(fs.readFileSync(`imports/film-awards-${batch}-overrides.json`,'utf8'));
const sources=slugs.map(slug=>({slug,...JSON.parse(fs.readFileSync(`imports/${slug}-${batch}-source.json`,'utf8'))}));
const films=read('film-catalog.js','CULTURE_CATALOG'),details=read('film-details.js','CULTURE_FILM_DETAILS');
const auditPath=`imports/film-awards-${batch}-audit.json`,previous=fs.existsSync(auditPath)?JSON.parse(fs.readFileSync(auditPath)):{};
const audit={verified:[],new_canonical_ids:previous.new_canonical_ids||[],unresolved:[]};
const tasks=new Map();
for(const source of sources)for(const e of source.events){
 if(e.status==='not-held')continue;
 for(const p of e.programmes||[])for(const f of p.selection){const key=f.source;if(!tasks.has(key))tasks.set(key,{key,event:e.event,year:e.year,...f,festival:true});}
 for(const c of e.categories||[])for(const r of c.entries){const key=`${e.event}/${e.year}/${r.title}`;if(!tasks.has(key))tasks.set(key,{key,event:e.event,year:e.year,title:r.title,source:e.source,anchors:[],category_names:[]});const t=tasks.get(key);t.category_names.push(c.name);if(c.name==='Directing'||c.name==='Director'||/^Best Director/.test(c.name))t.anchors.push({person:r.person,director:true});else if(/^(Actor|Actress) in |^(Leading|Supporting) (Actor|Actress)$|^Best Performance/.test(c.name))t.anchors.push({person:r.person});}
}
async function api(path,params={}){const u=new URL('https://api.themoviedb.org/3/'+path);for(const [k,v]of Object.entries(params))u.searchParams.set(k,v);if(!process.env.TMDB_READ_ACCESS_TOKEN)u.searchParams.set('api_key',process.env.TMDB_API_KEY);for(let i=0;i<3;i++){try{const r=await fetch(u,{headers:process.env.TMDB_READ_ACCESS_TOKEN?{Authorization:'Bearer '+process.env.TMDB_READ_ACCESS_TOKEN}:{},signal:AbortSignal.timeout(25000)});if(r.ok)return await r.json();if(r.status!==429&&r.status<500)throw Error('TMDB HTTP '+r.status);}catch(error){if(i===2)throw error;}}throw Error('Provider unavailable');}
const providerCache=new Map();
function movie(id){if(!providerCache.has(id))providerCache.set(id,api('movie/'+id,{append_to_response:'credits,external_ids'}));return providerCache.get(id);}
const results=new Map();
async function resolve(t){const override=overrides[t.key]||{};const signature=crypto.createHash('sha256').update(JSON.stringify({t,override})).digest('hex');
 const cached=previous.verified?.find(r=>r.key===t.key&&r.signature===signature);if(cached&&films.some(f=>f.id===cached.id&&f.tmdb_id===cached.tmdb_id)){audit.verified.push(cached);results.set(t.key,cached.id);return;}
 const names=[...new Set([t.title,t.title.replace(/\s*\(\d{4}\)$/,''),...t.aliases||[],...override.aliases||[]])],expected=[t.director,...override.director_aliases||[]].filter(Boolean),ids=new Set();
 if(override.tmdb_id)ids.add(override.tmdb_id);else if(override.imdb_id){const found=await api('find/'+override.imdb_id,{external_source:'imdb_id'});for(const m of found.movie_results||[])ids.add(m.id);}else{
 // Reuse catalogue candidates but still verify their provider identity and credits.
 for(const f of films)if(f.tmdb_id&&f.year>=t.year-3&&f.year<=t.year+(t.festival?4:0)&&[f.title,f.original_title,...f.alternate_titles||[]].some(n=>names.some(a=>norm(n)===norm(a))))ids.add(f.tmdb_id);
 for(const query of names){const response=await api('search/movie',{query,include_adult:false});for(const m of response.results||[])if([m.title,m.original_title].some(n=>names.some(a=>norm(n)===norm(a)))&&Number(m.release_date?.slice(0,4))>=t.year-3&&Number(m.release_date?.slice(0,4))<=t.year+(t.festival?4:0))ids.add(m.id);}
 }
 const matches=[],reviewed=[];
 for(const id of ids){const m=await movie(id),directors=m.credits.crew.filter(p=>p.job==='Director').map(p=>p.name).join(', ');reviewed.push({tmdb_id:id,title:m.title,year:m.release_date,director:directors});
 if(![m.title,m.original_title].some(n=>names.some(a=>norm(n)===norm(a))))continue;
 if(m.runtime<40&&!(override.runtime&&override.runtime>=40&&t.runtime===override.runtime))continue;
 if(t.category_names?.some(n=>/Documentary/.test(n))&&!m.genres?.some(g=>g.name==='Documentary'))continue;
 if(t.category_names?.some(n=>/Animated/.test(n))&&!m.genres?.some(g=>g.name==='Animation'))continue;
 if(expected.length&&!expected.some(d=>directorKey(d)===directorKey(directors)))continue;
 if((t.anchors||[]).some(a=>a.director?![a.person,...override.director_anchor_aliases||[]].some(n=>directorKey(n)===directorKey(directors)):!m.credits.cast.some(p=>[p.name,p.original_name].some(n=>norm(n)===norm(a.person)))))continue;
 if(override.imdb_id&&override.imdb_id!==m.imdb_id)continue;
 if(override.required_cast?.some(n=>!m.credits.cast.some(p=>norm(p.name)===norm(n))))continue;
 if(override.runtime&&!m.runtime)m.runtime=override.runtime;
 matches.push(m);
 }
 if(matches.length!==1)throw Error('Expected one title/year/credit match; found '+matches.length+'; candidates '+JSON.stringify(reviewed));
 const m=matches[0],directors=m.credits.crew.filter(p=>p.job==='Director').map(p=>p.name).join(', ');
 if(!directors||!m.imdb_id)throw Error('Missing director or IMDb identity');
 const old=films.filter(f=>f.tmdb_id===m.id||f.imdb_id===m.imdb_id);if(old.length>1)throw Error('Duplicate catalogue provider identity');let f=old[0];
 if(f&&directorKey(f.director)!==directorKey(directors)&&!expected.some(d=>directorKey(d)===directorKey(f.director)))throw Error('Existing director differs: '+f.director+' / '+directors);
 if(!f){f={id:Math.max(...films.map(f=>f.id))+1,title:m.title,director:override.authoritative_director||directors,year:t.festival?t.year:Number(m.release_date.slice(0,4)),tmdb_id:m.id,imdb_id:m.imdb_id,original_title:m.original_title,original_language:m.original_language,alternate_titles:names.filter(n=>![norm(m.title),norm(m.original_title)].includes(norm(n)))};films.push(f);details[f.id]=mergeMetadata(f,{},m);if(override.authoritative_director)details[f.id].director=override.authoritative_director;audit.new_canonical_ids.push(f);}
 results.set(t.key,f.id);audit.verified.push({key:t.key,signature,title:t.title,source:t.source,id:f.id,tmdb_id:m.id,imdb_id:m.imdb_id,director:directors,provider_release_date:m.release_date,method:'Official title/alias, festival director or all nominated acting/directing credits, feature runtime, release window and unique provider identity'});
}
const queue=[...tasks.values()];let done=0;
await Promise.all(Array.from({length:5},async()=>{while(queue.length){const t=queue.shift();try{await resolve(t);}catch(error){audit.unresolved.push({...t,reason:error.message});}if(++done%50===0)console.log(`Checked ${done}/${tasks.size}; unresolved ${audit.unresolved.length}`);}}));
audit.verified.sort((a,b)=>a.key.localeCompare(b.key));audit.unresolved.sort((a,b)=>a.key.localeCompare(b.key));
fs.writeFileSync(auditPath,JSON.stringify(audit,null,2)+'\n');
// Persist only verified appended identities; an unresolved source never becomes a page.
write('film-catalog.js','CULTURE_CATALOG',films);write('film-details.js','CULTURE_FILM_DETAILS',details);
if(audit.unresolved.length){console.log(JSON.stringify(audit.unresolved,null,2));process.exitCode=1;}else{
 const generated=[];
 for(const s of sources)for(const e of s.events){
  if(e.status==='not-held'){generated.push({...e,categories:[],films:[]});continue;}
  const categories=e.programmes?e.programmes.map(p=>{
   const entries=p.selection.map(f=>{const prizes=p.prizes.flatMap(prize=>prize.entries.filter(r=>r.winner&&[f.title,...f.aliases||[]].some(n=>norm(n)===norm(r.title))).map(r=>prize.name+(r.people?.length?' · '+r.people.join(', '):'')));return {film_id:results.get(f.source),winner:prizes.length>0,prizes,prize_rank:p.prizes.findIndex(prize=>prize.entries.some(r=>r.winner&&[f.title,...f.aliases||[]].some(n=>norm(n)===norm(r.title))))};});
   for(const prize of p.prizes)for(const r of prize.entries)if(r.winner&&p.selection.filter(f=>[f.title,...f.aliases||[]].some(n=>norm(n)===norm(r.title))).length!==1)throw Error('Unmatched prize '+e.event+' '+e.year+' '+r.title);
   const winners=entries.filter(r=>r.winner).sort((a,b)=>a.prize_rank-b.prize_rank).map(r=>r.film_id);return {id:p.name.toLowerCase().replace(/[^a-z0-9]+/g,'-'),name:p.name,nomination_kind:'competition',source:p.source,awardsSource:p.awardsSource,entries,nominees:entries.map(r=>r.film_id),winners,winner:winners[0]??null};
  }):e.categories.map(c=>{const entries=c.entries.map(r=>({film_id:results.get(`${e.event}/${e.year}/${r.title}`),person:r.person,winner:r.winner})),winners=entries.filter(r=>r.winner).map(r=>r.film_id);return {id:c.name.toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/-$/,''),name:c.name,entries,nominees:[...new Set(entries.map(r=>r.film_id))],winners,winner:winners[0]};});
  generated.push({event:e.event,year:e.year,section:e.section,source:e.source,awardsSource:e.awardsSource||e.source,resultsUrl:e.awardsSource||e.source,...(e.note?{note:e.note}:{}),categories,films:[...new Set(categories.flatMap(c=>c.nominees))].map(id=>({id,awards:categories.flatMap(c=>{return [...new Set(c.entries.filter(r=>r.film_id===id&&r.winner).flatMap(r=>r.prizes||[c.name]))];})}))});
 }
 const old=read('awards-2025.js','CULTURE_AWARDS').filter(e=>e.year<firstYear||e.year>lastYear);write('awards-2025.js','CULTURE_AWARDS',[...old,...generated]);
 const report=JSON.parse(fs.readFileSync('imports/film-metadata-completion.json'));report.total=films.length;report.after=Object.fromEntries(fields.map(k=>[k,films.filter(f=>present(details[f.id]?.[k])).length]));report.catalogue_extension=`Film awards ${batch}: appended verified identities; earlier audit history preserved`;fs.writeFileSync('imports/film-metadata-completion.json',JSON.stringify(report,null,2)+'\n');
 console.log(`Complete: ${generated.length} editions, ${audit.verified.length} source identities, ${audit.new_canonical_ids.length} new catalogue entries.`);
}

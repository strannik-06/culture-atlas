// Fill gaps for already-verified identities; never search/remap films or write progress.
import fs from 'node:fs';
import vm from 'node:vm';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
export const fields=['poster','overview','runtime','release_date','genres','countries','cast'];
export const present=v=>Array.isArray(v)?v.length>0:typeof v==='number'?v>0:typeof v==='string'?v.trim().length>0:v!==null&&v!==undefined;
export function mergeMetadata(film,current,movie,poster=null){
 if(movie.id!==film.tmdb_id)throw Error('TMDB identity differs');
 const imdb=movie.imdb_id||movie.external_ids?.imdb_id;
 if(film.imdb_id&&imdb&&film.imdb_id!==imdb)throw Error('IMDb identity differs');
 if(current.tmdb_id&&current.tmdb_id!==film.tmdb_id)throw Error('Existing metadata identity differs');
 const image=(p,size)=>typeof p==='string'&&/^\/[a-zA-Z0-9_./-]+$/.test(p)?'https://image.tmdb.org/t/p/'+size+p:null;
 const incoming={tmdb_id:film.tmdb_id,title:movie.title,original_title:movie.original_title,overview:movie.overview,runtime:movie.runtime,release_date:movie.release_date,genres:(movie.genres||[]).map(g=>g.name),countries:(movie.production_countries||[]).map(c=>c.iso_3166_1),original_language:movie.original_language,director:(movie.credits?.crew||[]).filter(p=>p.job==='Director').map(p=>p.name).join(', '),cast:(movie.credits?.cast||[]).slice(0,5).map(p=>p.name),poster:image(poster||movie.poster_path,'w500'),backdrop:image(movie.backdrop_path,'w1280'),tmdb_rating:movie.vote_average,tmdb_votes:movie.vote_count};
 const merged={...current};for(const[k,v]of Object.entries(incoming))if(!present(merged[k])&&present(v))merged[k]=v;
 if(!present(current.imdb?.url)&&/^tt\d+$/.test(imdb||''))merged.imdb={...current.imdb,url:'https://www.imdb.com/title/'+imdb+'/'};
 return merged;
}
const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)),'..');
const read=(file,name)=>{const c={window:{}};vm.createContext(c);vm.runInContext(fs.readFileSync(path.join(root,file),'utf8'),c);return JSON.parse(JSON.stringify(c.window[name]));};
const coverage=(films,details)=>Object.fromEntries(fields.map(k=>[k,films.filter(f=>present(details[f.id]?.[k])).length]));
export async function complete({films,details,api,overrides=[],progress=()=>{}}){
 const report={format:'culture-atlas-metadata-completion-v1',generated_at:new Date().toISOString(),total:films.length,before:coverage(films,details),requested:0,updated:[],unresolved:[],unavailable:[]};
 report.manual_sources=[];
 for(const entry of overrides){
  const film=films.find(f=>f.id===entry.id);if(!film||film.tmdb_id!==entry.tmdb_id)throw Error('Manual metadata identity differs');
  const current=details[film.id]||{},merged={...current};for(const[k,v]of Object.entries(entry.fields))if(!present(merged[k])&&present(v))merged[k]=v;
  details[film.id]=merged;report.manual_sources.push({id:entry.id,fields:Object.keys(entry.fields),source_urls:entry.source_urls,note:entry.note});
  if(JSON.stringify(current)!==JSON.stringify(merged))report.updated.push(film.id);
 }
 const targets=films.filter(f=>fields.some(k=>!present(details[f.id]?.[k])));let next=0,done=0;
 await Promise.all(Array.from({length:5},async()=>{
  while(next<targets.length){
   const film=targets[next++];report.requested++;
   try{
    if(!Number.isSafeInteger(film.tmdb_id)||film.tmdb_id<1)throw Error('Missing verified TMDB ID');
    const current=details[film.id]||{},movie=await api('movie/'+film.tmdb_id,{append_to_response:'credits,external_ids'});
    // Check identity before making optional image requests, too.
    let merged=mergeMetadata(film,current,movie);
    if(!present(merged.overview)&&movie.original_language&&movie.original_language!=='en'){
     try{const localised=await api('movie/'+film.tmdb_id,{language:movie.original_language});if(localised.id===film.tmdb_id&&present(localised.overview)){merged.overview=localised.overview;merged.overview_language=movie.original_language;}}catch{/* Report missing synopsis rather than inventing one. */}
    }
    if(!present(merged.poster)){
     try{const images=await api('movie/'+film.tmdb_id+'/images');const posters=(images.posters||[]).filter(p=>p.file_path).sort((a,b)=>(b.iso_639_1==='en')-(a.iso_639_1==='en')||(b.vote_count||0)-(a.vote_count||0));if(posters.length)merged=mergeMetadata(film,merged,movie,posters[0].file_path);}catch{/* Missing image alternatives are reported below. */}
    }
    details[film.id]=merged;
    if(JSON.stringify(merged)!==JSON.stringify(current))report.updated.push(film.id);
    const missing=fields.filter(k=>!present(merged[k]));if(missing.length)report.unavailable.push({id:film.id,title:film.title,tmdb_id:film.tmdb_id,fields:missing});
   }catch(error){report.unresolved.push({id:film.id,title:film.title,tmdb_id:film.tmdb_id,reason:error.message});}
   done++;if(done%100===0||done===targets.length)progress({processed:done,total:targets.length,unresolved:report.unresolved.length});
  }
 }));
 report.updated=[...new Set(report.updated)].sort((a,b)=>a-b);report.unresolved.sort((a,b)=>a.id-b.id);report.unavailable.sort((a,b)=>a.id-b.id);report.after=coverage(films,details);return {details,report};
}
async function main(){
 const token=process.env.TMDB_READ_ACCESS_TOKEN,key=process.env.TMDB_API_KEY;if(!token&&!key)throw Error('Configure TMDB_API_KEY or TMDB_READ_ACCESS_TOKEN in repository Actions secrets.');
 const api=async(endpoint,params={})=>{
  const url=new URL('https://api.themoviedb.org/3/'+endpoint);for(const[k,v]of Object.entries(params))url.searchParams.set(k,v);if(!token)url.searchParams.set('api_key',key);
  for(let attempt=0;attempt<4;attempt++){
   try{const r=await fetch(url,{headers:token?{Authorization:'Bearer '+token}:{},signal:AbortSignal.timeout(20000)});
    if((r.status===429||r.status>=500)&&attempt<3){await new Promise(r=>setTimeout(r,1000*(attempt+1)));continue;}
    if(!r.ok)throw Error('TMDB HTTP '+r.status);return await r.json();
   }catch(e){if(attempt===3)throw Error('TMDB request failed after retries');await new Promise(r=>setTimeout(r,1000*(attempt+1)));}
  }
 };
 const films=read('film-catalog.js','CULTURE_CATALOG'),details=read('film-details.js','CULTURE_FILM_DETAILS');
 const overridePath=path.join(root,'imports/film-metadata-overrides.json'),overrides=fs.existsSync(overridePath)?JSON.parse(fs.readFileSync(overridePath)).entries:[];
 await api('configuration');
 const reportPath=path.join(root,'imports/film-metadata-completion.json'),previous=fs.existsSync(reportPath)?JSON.parse(fs.readFileSync(reportPath)):null;
 const result=await complete({films,details,api,overrides,progress:p=>console.log(JSON.stringify(p))});
 result.report.initial_before=previous?.initial_before||previous?.before||result.report.before;
 result.report.updated_total=[...new Set([...(previous?.updated_total||previous?.updated||[]),...result.report.updated])].sort((a,b)=>a-b);
 fs.writeFileSync(path.join(root,'film-details.js'),'// TMDB metadata snapshot; missing fields filled by scripts/complete-film-metadata.mjs.\nwindow.CULTURE_FILM_DETAILS = '+JSON.stringify(result.details,null,2)+';\n');
 fs.writeFileSync(path.join(root,'imports/film-metadata-completion.json'),JSON.stringify(result.report,null,2)+'\n');
 console.log(JSON.stringify({updated:result.report.updated.length,before:result.report.before,after:result.report.after,unresolved:result.report.unresolved.length,unavailable:result.report.unavailable.length},null,2));
}
if(process.argv[1]&&path.resolve(process.argv[1])===fileURLToPath(import.meta.url))main().catch(e=>{console.error(e.message);process.exitCode=1;});

#!/usr/bin/env node
// Read-only TMDB metadata audit. --apply writes film-details.js locally, never to GitHub.
import fs from 'node:fs';
import path from 'node:path';
const root=path.resolve(import.meta.dirname,'..');
function readGlobal(file,name){
 const source=fs.readFileSync(path.join(root,file),'utf8');
 const marker='window.'+name+' = ';
 const index=source.indexOf(marker);
 if(index<0)throw Error('Missing '+name+' in '+file);
 return JSON.parse(source.slice(index+marker.length).trim().replace(/;$/,''));
}
const catalog=readGlobal('film-catalog.js','CULTURE_CATALOG');
const details=readGlobal('film-details.js','CULTURE_FILM_DETAILS');
const token=process.env.TMDB_READ_ACCESS_TOKEN;
if(!token)throw Error('Missing TMDB_READ_ACCESS_TOKEN');
const apply=process.argv.includes('--apply');
const delay=ms=>new Promise(resolve=>setTimeout(resolve,ms));
const report={total:catalog.length,linked:catalog.filter(f=>f.tmdb_id).length,validated:0,missingIds:[],mismatches:[],warnings:[],failed:[],applied:false};
const seen=new Map();
for(const film of catalog){
 if(!film.tmdb_id){report.missingIds.push({id:film.id,title:film.title});continue}
 if(seen.has(film.tmdb_id)){report.mismatches.push({id:film.id,title:film.title,reason:'Duplicate TMDB ID',otherId:seen.get(film.tmdb_id)});continue}
 seen.set(film.tmdb_id,film.id);
 try{
  const response=await fetch('https://api.themoviedb.org/3/movie/'+film.tmdb_id+'?append_to_response=credits,external_ids',{headers:{Authorization:'Bearer '+token,accept:'application/json'}});
  if(!response.ok){report.failed.push({id:film.id,tmdb_id:film.tmdb_id,status:response.status});continue}
  const movie=await response.json();
  const directors=(movie.credits?.crew||[]).filter(c=>c.job==='Director').map(c=>c.name);
  const normalize=s=>String(s||'').normalize('NFKD').replace(/[\u0300-\u036f]/g,'').toLowerCase().replace(/[^a-z0-9]+/g,' ').trim();
  const names=[film.title,...(film.alternate_titles||[])];
  const titleMatches=names.some(n=>[movie.title,movie.original_title].some(t=>normalize(n)===normalize(t)||normalize(t).startsWith(normalize(n)+' ')));
  const directorAliases={78:['Tsou Shih-ching'],98:['Alexander Woo'],166:['Anselm Chan Mau-Yin'],169:['Dante Lam Chiu-yin']};
  const creditedNames=[film.director,...(directorAliases[film.id]||[])].filter(Boolean).map(normalize);
  const creditedParts=String(film.director||'').split(/\s*(?:&|,)\s*/).map(normalize).filter(Boolean);
  const creditedTokens=creditedParts.map(part=>part.split(' '));
  // Shared family names are often omitted in the first half of a paired credit:
  // "Jean-Pierre & Luc Dardenne" vs "Jean-Pierre Dardenne", "Luc Dardenne".
  const sharedSurnames=new Set(creditedTokens.filter(words=>words.length>1).map(words=>words.at(-1)));
  const directorMatches=!film.director||(directors.length>0&&directors.every(d=>{
   const normalized=normalize(d);
   const tokens=normalized.split(' ');
   return creditedNames.some(name=>name===normalized||name.includes(normalized)||normalized.includes(name))||
    creditedTokens.some(words=>words.length>0&&words.every(w=>tokens.includes(w))&&
      (words.length>1||[...sharedSurnames].some(surname=>tokens.includes(surname))));
  }));
  const imdbMatches=!film.imdb_id||!movie.external_ids?.imdb_id||film.imdb_id===movie.external_ids.imdb_id;
  const releaseYear=Number(String(movie.release_date||'').slice(0,4));
  const yearMatches=!film.year||!releaseYear||Math.abs(film.year-releaseYear)<=1;
  if(!yearMatches)report.warnings.push({id:film.id,title:film.title,catalogYear:film.year,tmdbYear:releaseYear,reason:'Release year differs; review list placement'});
  if((!titleMatches&&!film.imdb_id)||!directorMatches||!imdbMatches){
   report.mismatches.push({id:film.id,title:film.title,tmdb_id:film.tmdb_id,tmdbTitle:movie.title,tmdbOriginalTitle:movie.original_title,tmdbDirectors:directors,tmdbYear:releaseYear,reason:[!titleMatches&&'title',!directorMatches&&'director',!imdbMatches&&'IMDb ID',!yearMatches&&'year warning'].filter(Boolean).join(', ')});
   continue;
  }
  if(!titleMatches)report.warnings.push({id:film.id,title:film.title,tmdbTitle:movie.title,reason:'Title differs but IMDb ID and director agree'});
  const current=details[film.id]||{};
  details[film.id]={...current,tmdb_id:film.tmdb_id,title:movie.title,original_title:movie.original_title,overview:movie.overview,runtime:movie.runtime,release_date:movie.release_date,genres:(movie.genres||[]).map(g=>g.name),countries:(movie.production_countries||[]).map(c=>c.iso_3166_1),original_language:movie.original_language,director:directors.join(', '),cast:(movie.credits?.cast||[]).slice(0,5).map(c=>c.name),poster:movie.poster_path?'https://image.tmdb.org/t/p/w500'+movie.poster_path:(current.poster||null),backdrop:movie.backdrop_path?'https://image.tmdb.org/t/p/w1280'+movie.backdrop_path:null,tmdb_rating:movie.vote_average,tmdb_votes:movie.vote_count,imdb:{...current.imdb,url:movie.external_ids?.imdb_id?'https://www.imdb.com/title/'+movie.external_ids.imdb_id+'/':current.imdb?.url}};
  report.validated++;
 }catch(error){report.failed.push({id:film.id,tmdb_id:film.tmdb_id,error:String(error)})}
 await delay(300);
}
fs.writeFileSync(path.join(root,'tmdb-metadata-report.json'),JSON.stringify(report,null,2)+'\n');
if(apply&&report.failed.length===0&&report.mismatches.length===0&&report.missingIds.length===0){
 fs.writeFileSync(path.join(root,'film-details.js'),'// TMDB metadata snapshot; generated by scripts/refresh-tmdb.mjs.\nwindow.CULTURE_FILM_DETAILS = '+JSON.stringify(details,null,2)+';\n');
 report.applied=true;
 fs.writeFileSync(path.join(root,'tmdb-metadata-report.json'),JSON.stringify(report,null,2)+'\n');
}
console.log(JSON.stringify({total:report.total,linked:report.linked,validated:report.validated,mismatches:report.mismatches.length,failed:report.failed.length,missingIds:report.missingIds.length,applied:report.applied},null,2));
if(report.failed.length||report.mismatches.length||report.missingIds.length)process.exitCode=2;

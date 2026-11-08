// Resolve catalogue additions against TMDB; credentials stay in Actions secrets.
import fs from 'node:fs';
const source=JSON.parse(fs.readFileSync('imports/list-catalogue-source.json','utf8'));
const norm=s=>String(s||'').normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
async function api(path,params={}){const u=new URL('https://api.themoviedb.org/3/'+path);for(const[k,v]of Object.entries(params))u.searchParams.set(k,v);const token=process.env.TMDB_READ_ACCESS_TOKEN;if(!token)u.searchParams.set('api_key',process.env.TMDB_API_KEY);const r=await fetch(u,{headers:token?{Authorization:'Bearer '+token}:{}});if(!r.ok)throw Error('TMDB request failed: '+r.status);return r.json();}
const records=[],unresolved=[];
for(const spec of source){try{
 const candidates=[];for(const query of [spec.title,...spec.aliases||[]]){const result=await api('search/'+spec.type,{query,...(spec.type==='movie'?{year:spec.year}:{first_air_date_year:spec.year})});const extra=await api('search/'+spec.type,{query});for(const r of [...result.results||[],...extra.results||[]])if(!candidates.some(x=>x.id===r.id))candidates.push(r);}
 const hits=[];for(const r of candidates){const title=r.title||r.name,date=r.release_date||r.first_air_date||'';if(![spec.title,...spec.aliases||[]].some(t=>[title,r.original_title||r.original_name].some(x=>norm(x)===norm(t))))continue;if(Math.abs(Number(date.slice(0,4))-spec.year)>1)continue;
 const m=await api(spec.type+'/'+r.id,{append_to_response:'credits,external_ids'});if(spec.director&&!m.credits?.crew?.some(p=>p.job==='Director'&&norm(p.name)===norm(spec.director)))continue;
 if(spec.creator&&!m.created_by?.some(p=>norm(p.name)===norm(spec.creator)))continue;hits.push(m);}
 if(hits.length!==1)throw Error('Expected one title/year/director match; got '+hits.length);
 const m=hits[0],date=m.release_date||m.first_air_date||'',directors=(m.credits?.crew||[]).filter(p=>p.job==='Director');
 const metadata={title:m.title||m.name,original_title:m.original_title||m.original_name,year:Number(date.slice(0,4))||spec.year,tmdb_id:m.id,imdb_id:m.imdb_id||m.external_ids?.imdb_id||null,overview:m.overview||'',poster_path:m.poster_path,cast:(m.credits?.cast||[]).slice(0,8).map(p=>p.name),genres:(m.genres||[]).map(g=>g.name),countries:(m.production_countries||[]).map(c=>c.iso_3166_1),tmdb_rating:m.vote_average||null,release_date:date,runtime:m.runtime||null};
 if(spec.type==='movie')metadata.director=directors.map(p=>p.name).join(', ');else Object.assign(metadata,{id:'tv:'+m.id,series_kind:m.type==='Miniseries'?'miniseries':'series',tmdb_media_type:'tv',creators:m.created_by||[],directors,credit_names:[...(m.created_by||[]).map(p=>p.name),...directors.map(p=>p.name)],seasons:(m.seasons||[]).filter(s=>s.season_number>0).map(s=>({number:s.season_number,name:s.name,date:s.air_date})),first_air_date:date,last_air_date:m.last_air_date,status:m.status});
 records.push({requested:spec.title,type:spec.type,provider_key:spec.type+':'+m.id,metadata,evidence:'https://www.themoviedb.org/'+spec.type+'/'+m.id});console.log('Verified '+spec.title+' → '+metadata.title+' ('+metadata.year+')');
 }catch(e){unresolved.push({title:spec.title,error:e.message});console.log('Unresolved '+spec.title+': '+e.message);}}
fs.writeFileSync('imports/list-catalogue-resolved.json',JSON.stringify({records,unresolved},null,2)+'\n');if(unresolved.length)process.exitCode=1;

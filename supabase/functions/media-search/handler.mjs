// Dependency-free handler, also exercised under Node with mocked HTTP services.
class SafeError extends Error {}
export function createHandler(env, fetcher=fetch) {
 const base=env('SUPABASE_URL'),anon=env('SUPABASE_ANON_KEY'),service=env('SUPABASE_SERVICE_ROLE_KEY');
 const origin=env('MEDIA_ALLOWED_ORIGIN')||'https://strannik-06.github.io';
 return async request=>{
  const headers={'Access-Control-Allow-Origin':origin,'Access-Control-Allow-Headers':'authorization,apikey,content-type,x-client-info','Access-Control-Allow-Methods':'POST, OPTIONS','Vary':'Origin','Content-Type':'application/json'};
  const respond=(body,status=200)=>new Response(JSON.stringify(body),{status,headers});
  if(request.headers.get('origin')&&request.headers.get('origin')!==origin)return respond({error:'Origin not allowed'},403);
  if(request.method==='OPTIONS')return new Response(null,{status:204,headers});
  if(request.method!=='POST')return respond({error:'Use POST'},405);
  try{
   const authorization=request.headers.get('authorization')||'';
   if(!authorization.startsWith('Bearer '))return respond({error:'Sign in to search and rate.'},401);
   const auth=await fetcher(base+'/auth/v1/user',{headers:{apikey:anon,Authorization:authorization}});
   if(!auth.ok)return respond({error:'Sign in again to continue.'},401);
   const user=await auth.json();if(!user.id)return respond({error:'Sign in again.'},401);
   const raw=await request.text();if(raw.length>30000)return respond({error:'Request too large'},413);
   const body=JSON.parse(raw),type=body.type;
   if(!['movie','tv'].includes(type)||!['search','details','save'].includes(body.action))return respond({error:'Invalid request'},400);
   const db=async(path,options={})=>{const r=await fetcher(base+'/rest/v1/'+path,{...options,headers:{apikey:service,Authorization:'Bearer '+service,'Content-Type':'application/json',...options.headers}});if(!r.ok){const err=await r.json().catch(()=>({}));throw new SafeError(err.code==='40001'?'This rating changed. Select the result again before saving.':'Unable to save or load the catalogue. Check the media migrations and try again.');}return r.json();};
   const tmdb=async(path,query={})=>{const token=env('TMDB_READ_ACCESS_TOKEN'),key=env('TMDB_API_KEY');if(!token&&!key)throw new SafeError('Film and TV search needs its TMDB server key configured.');const url=new URL('https://api.themoviedb.org/3/'+path);for(const[k,v]of Object.entries(query))url.searchParams.set(k,String(v));if(!token)url.searchParams.set('api_key',key);const r=await fetcher(url,{headers:token?{Authorization:'Bearer '+token}:{},signal:AbortSignal.timeout(15000)});if(!r.ok)throw new SafeError(r.status===429?'Search is busy. Try again shortly.':'TMDB could not load this title. Try again.');return r.json();};
   if(body.action==='search'){
    const page=body.page??1,mode=body.mode??'title';
    if(!Number.isSafeInteger(page)||page<1||page>500||!['title','director'].includes(mode)||mode==='director'&&type!=='movie')return respond({error:'Invalid search mode or page.'},400);
    if(body.year&&!/^\d{4}$/.test(String(body.year)))return respond({error:'Use a four-digit year.'},400);
    const validQuery=typeof body.query==='string'&&body.query.trim().length>=2&&body.query.length<=200;
    if(mode==='director'&&body.person_id!=null){
     if(!Number.isSafeInteger(body.person_id)||body.person_id<1)return respond({error:'Invalid director.'},400);
     const person=await tmdb('person/'+body.person_id),credits=await tmdb('person/'+body.person_id+'/movie_credits');
     const seen=new Set(),films=(credits.crew||[]).filter(x=>{
      if(x.job!=='Director'||x.adult||seen.has(x.id)||body.year&&String(x.release_date||'').slice(0,4)!==String(body.year))return false;
      seen.add(x.id);return true;
     }).sort((a,b)=>String(b.release_date||'').localeCompare(String(a.release_date||''))||String(a.title).localeCompare(String(b.title)));
     return respond({kind:'works',director:person.name,page,total_pages:Math.max(1,Math.ceil(films.length/20)),results:films.slice((page-1)*20,page*20).map(x=>({id:x.id,title:x.title,original_title:x.original_title,date:x.release_date,poster_path:x.poster_path,director:person.name}))});
    }
    if(!validQuery)return respond({error:'Enter a title or director name of 2–200 characters.'},400);
    if(mode==='director'){
     const result=await tmdb('search/person',{query:body.query.trim(),include_adult:false,page});
     return respond({kind:'people',page,total_pages:Math.min(500,result.total_pages||1),results:(result.results||[]).slice(0,20).map(x=>({id:x.id,title:x.name,poster_path:x.profile_path,department:x.known_for_department,known_for:(x.known_for||[]).map(w=>w.title||w.name).filter(Boolean).slice(0,3)}))});
    }
    const query={query:body.query.trim(),include_adult:false,page};if(body.year)query[type==='movie'?'primary_release_year':'first_air_date_year']=body.year;
    const result=await tmdb('search/'+type,query);
    return respond({kind:'works',page,total_pages:Math.min(500,result.total_pages||1),results:(result.results||[]).slice(0,20).map(x=>({id:x.id,title:x.title||x.name,original_title:x.original_title||x.original_name,date:x.release_date||x.first_air_date,poster_path:x.poster_path,overview:x.overview}))});
   }
   if(!Number.isSafeInteger(body.id)||body.id<1||body.season!=null&&(!Number.isSafeInteger(body.season)||body.season<1||type!=='tv'))return respond({error:'Invalid title or season'},400);
   const detail=await tmdb(type+'/'+body.id,{append_to_response:'credits,external_ids'});
   const seasons=(detail.seasons||[]).filter(s=>s.season_number>0).map(s=>({number:s.season_number,name:s.name,date:s.air_date,episodes:s.episode_count}));
   let provider=type+':'+body.id,season=null;
   if(body.season!=null){
    if(!seasons.some(s=>s.number===body.season))return respond({error:'This season is not listed by TMDB.'},400);
    // A complete, ended, one-season miniseries is already the whole work.
    if(!(detail.type==='Miniseries'&&detail.status==='Ended'&&seasons.length===1)){
     season=await tmdb('tv/'+body.id+'/season/'+body.season);provider+=':season:'+body.season;
    }
   }
   const credits=(detail.credits?.crew||[]).filter(p=>p.job==='Director').map(p=>({id:p.id,name:p.name}));
   const parent={work_type:type,title:detail.title||detail.name,original_title:detail.original_title||detail.original_name,tmdb_id:body.id,imdb_id:detail.imdb_id||detail.external_ids?.imdb_id||null,year:Number((detail.release_date||detail.first_air_date||'').slice(0,4))||null,release_date:detail.release_date,first_air_date:detail.first_air_date,director:credits.map(p=>p.name).join(', '),directors:credits,creators:detail.created_by||[],poster_path:detail.poster_path,series_kind:detail.type==='Miniseries'?'miniseries':'series'};
   const metadata=season?{...parent,title:parent.title+' — Season '+body.season,series_kind:'season',season_number:body.season,imdb_id:null,year:Number((season.air_date||'').slice(0,4))||parent.year,parent}:parent;
   if(body.action==='save'){
    if(typeof body.rating!=='number'||body.rating<.5||body.rating>10||!Number.isInteger(body.rating*2)||typeof body.notes!=='string'||body.notes.length>10000||!['whole_work','unspecified'].includes(body.scope)||body.date!=null&&!/^\d{4}-\d{2}-\d{2}$/.test(body.date))return respond({error:'Choose a half-point rating and valid notes, date and scope.'},400);
    return respond(await db('rpc/save_media_rating',{method:'POST',body:JSON.stringify({p_user:user.id,p_provider:provider,p_metadata:metadata,p_rating:body.rating,p_notes:body.notes,p_date:body.date,p_scope:body.scope,p_expected:body.expected_updated_at||null})}));
   }
   let links=await db('media_provider_links?select=work_key&provider_key=eq.'+encodeURIComponent(provider)),record=null;
   if(links.length)record=(await db('media_catalogue?select=*&work_key=eq.'+encodeURIComponent(links[0].work_key)))[0];
   if(!record&&!season&&parent.imdb_id){const matches=await db('media_catalogue?select=*&metadata->>imdb_id=eq.'+encodeURIComponent(parent.imdb_id)+'&order=is_static.desc,work_key.asc');record=matches.find(x=>!x.work_key.includes(':season:'));}
   let progress=null;if(record){const table=record.work_type==='movie'?'film_progress':'tv_progress',column=record.work_type==='movie'?'film_id':'work_key',key=record.film_id||record.work_key;progress=(await db(table+'?select=*&user_id=eq.'+encodeURIComponent(user.id)+'&'+column+'=eq.'+encodeURIComponent(key)))[0]||null;}
   return respond({provider,metadata,seasons,existing:record,progress});
  }catch(error){return respond({error:error instanceof SyntaxError?'Invalid request':error instanceof SafeError?error.message:'Unable to complete this request. Please try again.'},400);}
 };
}

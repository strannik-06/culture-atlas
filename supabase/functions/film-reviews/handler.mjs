const publishers={guardian:{name:'The Guardian',host:'theguardian.com'},lwl:{name:'Little White Lies',host:'lwlies.com'},ebert:{name:'Roger Ebert',host:'rogerebert.com'},indiewire:{name:'IndieWire',host:'indiewire.com'},imdb:{name:'IMDb',host:'imdb.com'}};
const norm=s=>String(s||'').normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^a-z0-9]/g,'');
export function allowed(url,source){try{const u=new URL(url);return u.protocol==='https:'&&!u.username&&!u.password&&!u.port&&(u.hostname===publishers[source].host||u.hostname==='www.'+publishers[source].host);}catch{return false;}}
export function extract(html,film,source,url){
 if(!allowed(url,source))return null;
 const nodes=[];const visit=x=>{if(!x||typeof x!=='object')return;if(Array.isArray(x))return x.forEach(visit);nodes.push(x);for(const v of Object.values(x))if(v&&typeof v==='object')visit(v);};
 for(const m of html.matchAll(/<script\b[^>]*type=["']application\/ld\+json["'][^>]*>([\s\S]*?)<\/script>/gi))try{visit(JSON.parse(m[1]));}catch{}
 const titles=[film.title,film.original_title].filter(Boolean).map(norm);
 const movie=nodes.find(n=>[].concat(n['@type']||[]).includes('Movie')&&titles.includes(norm(n.name)));
 // Require an exact film identity plus year/director evidence; snippets alone never qualify.
 if(!movie)return null;
 const year=String(movie.datePublished||movie.dateCreated||'').slice(0,4),directors=[].concat(movie.director||[]).map(x=>typeof x==='string'?x:x.name).filter(Boolean);
 if(year!==String(film.year)&&!directors.some(d=>norm(film.director).includes(norm(d))))return null;
 const review=nodes.find(n=>[].concat(n['@type']||[]).includes('Review')&&(n.itemReviewed===movie||titles.includes(norm(n.itemReviewed?.name))))||([].concat(movie.review||[])[0]);
 const rating=source==='imdb'?movie.aggregateRating:review?.reviewRating;
 const value=Number(rating?.ratingValue),best=Number(rating?.bestRating),worst=Number(rating?.worstRating??0);
 const score=Number.isFinite(value)&&Number.isFinite(best)&&best>0&&value>=worst&&value<=best?`${value}/${best}`:null;
 const author=[].concat(review?.author||[]).map(x=>typeof x==='string'?x:x.name).filter(Boolean).join(', ');
 if(source!=='imdb'&&!review)return null;
 return {source,url,score,author,label:publishers[source].name+(author?' · '+author:''),verified_at:new Date().toISOString()};
}
export function createHandler(env,fetcher=fetch){return async request=>{
 const origin=env('MEDIA_ALLOWED_ORIGIN')||'https://strannik-06.github.io',headers={'Access-Control-Allow-Origin':origin,'Access-Control-Allow-Headers':'authorization,apikey,content-type,x-client-info','Access-Control-Allow-Methods':'POST, OPTIONS','Content-Type':'application/json','Vary':'Origin'};
 const respond=(x,status=200)=>new Response(JSON.stringify(x),{status,headers});
 if(request.headers.get('origin')&&request.headers.get('origin')!==origin)return respond({error:'Origin not allowed'},403);
 if(request.method==='OPTIONS')return new Response(null,{status:204,headers});if(request.method!=='POST')return respond({error:'Use POST'},405);
 try{
 const base=env('SUPABASE_URL'),service=env('SUPABASE_SERVICE_ROLE_KEY'),authorization=request.headers.get('authorization')||'';
 const auth=await fetcher(base+'/auth/v1/user',{headers:{apikey:env('SUPABASE_ANON_KEY'),Authorization:authorization},signal:AbortSignal.timeout(10000)});if(!auth.ok||!(await auth.json()).id)return respond({error:'Sign in to find or refresh reviews.'},401);
 const raw=await request.text();if(raw.length>1000)return respond({error:'Request too large'},413);const {film_id}=JSON.parse(raw);if(!Number.isSafeInteger(film_id)||film_id<1)return respond({error:'Invalid film'},400);
 const db=async(path,options={})=>{const r=await fetcher(base+'/rest/v1/'+path,{...options,headers:{apikey:service,Authorization:'Bearer '+service,'Content-Type':'application/json',...options.headers},signal:AbortSignal.timeout(10000)});if(!r.ok)throw Error('Review storage is unavailable. Please try again.');return r.json();};
 const records=await db('media_catalogue?select=metadata&work_type=eq.movie&film_id=eq.'+film_id);if(records.length!==1)return respond({error:'Film is not registered in the catalogue.'},404);const film=records[0].metadata;
 const old=(await db('film_review_snapshots?select=*&film_id=eq.'+film_id))[0];if(old&&Date.now()-Date.parse(old.checked_at)<60000)return respond(old);
 if(!env('BRAVE_SEARCH_API_KEY'))return respond({error:'Review discovery needs the server search key configured.'},503);
 const results=[],warnings=[];
 // Bounded publisher-only discovery, then verify the actual publisher page.
 await Promise.all(Object.entries(publishers).map(async([source,p])=>{try{
 let urls=[],found=false;
 if(source==='imdb'&&/^tt\d+$/.test(film.imdb_id||''))urls=['https://www.imdb.com/title/'+film.imdb_id+'/'];
 else{
 const u=new URL('https://api.search.brave.com/res/v1/web/search');u.search=new URLSearchParams({q:`"${film.title}" ${film.year} ${film.director||''} film review site:${p.host}`,count:'3'});
 const r=await fetcher(u,{headers:{'X-Subscription-Token':env('BRAVE_SEARCH_API_KEY'),Accept:'application/json'},signal:AbortSignal.timeout(10000)});if(!r.ok)throw Error();urls=(await r.json()).web?.results?.map(x=>x.url)||[];
 }
 for(let url of urls.filter(u=>allowed(u,source)).slice(0,3)){
 // Never follow redirects to an untrusted host, even for links returned by search.
 let response;for(let n=0;n<3;n++){response=await fetcher(url,{redirect:'manual',signal:AbortSignal.timeout(8000),headers:{Accept:'text/html'}});if(response.status>=300&&response.status<400){const next=new URL(response.headers.get('location'),url).href;if(!allowed(next,source))throw Error();url=next;continue;}break;}
 if(!response?.ok)continue;const length=Number(response.headers.get('content-length'));if(length>2000000)continue;const text=await response.text();if(text.length>2000000)continue;const item=extract(text,film,source,url);if(item){results.push(item);found=true;break;}
 }
 if(!found)warnings.push(p.name+': no verifiable review or rating found.');
 }catch{warnings.push(p.name+' could not be checked.');}}));
 if(!results.length)return respond({error:'No source pages could be verified. Existing ratings and reviews are preserved. Try again later.'},422);
 return respond(await db('rpc/merge_film_reviews',{method:'POST',body:JSON.stringify({p_film:film_id,p_items:results,p_warnings:warnings})}));
 }catch(e){return respond({error:e instanceof SyntaxError?'Invalid request':e.message?.startsWith('Review storage')?e.message:'Unable to check reviews. Existing results are preserved.'},400);}
};}

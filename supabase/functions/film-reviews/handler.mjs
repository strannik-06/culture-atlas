const DISCOVERY_VERSION=2;
const publishers={guardian:{name:'The Guardian',host:'theguardian.com'},lwl:{name:'Little White Lies',host:'lwlies.com'},ebert:{name:'Roger Ebert',host:'rogerebert.com'},indiewire:{name:'IndieWire',host:'indiewire.com'},imdb:{name:'IMDb',host:'imdb.com'},bfi:{name:'Sight and Sound',host:'bfi.org.uk',reviewOnly:true},timeout:{name:'Time Out',host:'timeout.com',reviewOnly:true},latimes:{name:'Los Angeles Times',host:'latimes.com',reviewOnly:true},avclub:{name:'A.V. Club',host:'avclub.com',reviewOnly:true}};
const decode=s=>String(s||'').replace(/&#(x[0-9a-f]+|[0-9]+);/gi,(_,n)=>{const c=n[0].toLowerCase()==='x'?parseInt(n.slice(1),16):Number(n);return c>0&&c<=0x10ffff?String.fromCodePoint(c):'';}).replace(/&(amp|quot|apos|nbsp|lt|gt);/gi,(_,n)=>({amp:'&',quot:'\"',apos:"'",nbsp:' ',lt:'<',gt:'>'})[n.toLowerCase()]);
const norm=s=>decode(s).normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
export function allowed(url,source){try{const u=new URL(url);return u.protocol==='https:'&&!u.username&&!u.password&&!u.port&&(u.hostname===publishers[source].host||u.hostname==='www.'+publishers[source].host);}catch{return false;}}
export function extract(html,film,source,url){
 if(!allowed(url,source))return null;
 const nodes=[];const visit=x=>{if(!x||typeof x!=='object')return;if(Array.isArray(x))return x.forEach(visit);nodes.push(x);for(const v of Object.values(x))if(v&&typeof v==='object')visit(v);};
 for(const m of html.matchAll(/<script\b[^>]*type=["']application\/ld\+json["'][^>]*>([\s\S]*?)<\/script>/gi))try{visit(JSON.parse(m[1]));}catch{}
 const titles=[film.title,film.original_title].filter(Boolean).map(norm);
 const movie=nodes.find(n=>[].concat(n['@type']||[]).includes('Movie')&&titles.includes(norm(n.name)));
 // Require an exact film identity plus year/director evidence; snippets alone never qualify.
 if(!movie){
  if(source==='imdb')return null;
  const article=nodes.find(n=>[].concat(n['@type']||[]).some(t=>['Article','NewsArticle','Review'].includes(t))&&titles.some(t=>norm(n.headline||n.name).startsWith(t+'review')));
  if(!article)return null;
  const articleMarkup=(html.match(/<article\b[^>]*>[\s\S]*?<\/article>/i)||[])[0]||'';
  const bodyText=articleMarkup.replace(/<(script|style)\b[^>]*>[\s\S]*?<\/\1>/gi,' ').replace(/<[^>]+>/g,' ');
  const descriptions=[article.headline||'',article.description||'',article.articleBody||'',article.reviewBody||'',bodyText,...(html.match(/<meta\b[^>]*>/gi)||[]).filter(t=>/\b(?:name|property)=["'](?:description|og:description|article:tag)["']/i.test(t)).map(t=>t.match(/\bcontent=["']([^"']*)["']/i)?.[1]||'')].join(' ');
  const published=Number(String(article.datePublished||'').slice(0,4));
  const directors=String(film.director||'').split(/,| & | and /).map(norm).filter(Boolean);
  if(!directors.length||!directors.some(d=>norm(descriptions).includes(d))||!Number.isInteger(film.year)||!Number.isInteger(published)||published<film.year||published>film.year+3)return null;
  const author=[].concat(article.author||[]).map(a=>decode(typeof a==='string'?a:a.name)).filter(Boolean).join(', ');
  if(!author)return null;
  const grade=source==='indiewire'?decode(html).match(/<h[1-6]\b[^>]*>\s*Grade:\s*([ABCDF][+-]?)\s*<\/h[1-6]>/i)?.[1]?.toUpperCase():null;
  return {source,url,score:grade||null,author,label:publishers[source].name+' · '+author,verified_at:new Date().toISOString()};
 }
 const year=String(movie.datePublished||movie.dateCreated||'').slice(0,4),directors=[].concat(movie.director||[]).map(x=>decode(typeof x==='string'?x:x.name)).filter(Boolean);
 const directorMatches=directors.some(d=>norm(film.director).includes(norm(d)));
 if(directors.length&&film.director&&!directorMatches)return null;
 if(year!==String(film.year)&&!directorMatches)return null;
 const review=nodes.find(n=>[].concat(n['@type']||[]).includes('Review')&&(n.itemReviewed===movie||titles.includes(norm(n.itemReviewed?.name))))||([].concat(movie.review||[])[0]);
 const rating=source==='imdb'?movie.aggregateRating:review?.reviewRating;
 const value=Number(rating?.ratingValue),best=Number(rating?.bestRating),worst=Number(rating?.worstRating??0);
 const score=!publishers[source].reviewOnly&&Number.isFinite(value)&&Number.isFinite(best)&&best>0&&value>=worst&&value<=best?`${value}/${best}`:null;
 const author=[].concat(review?.author||[]).map(x=>decode(typeof x==='string'?x:x.name)).filter(Boolean).join(', ');
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
 const old=(await db('film_review_snapshots?select=*&film_id=eq.'+film_id))[0];if(old?.items?.some(i=>i.discovery_version===DISCOVERY_VERSION)&&Date.now()-Date.parse(old.checked_at)<60000)return respond(old);
 if(!env('BRAVE_SEARCH_API_KEY'))return respond({error:'Review discovery needs the server search key configured.'},503);
 const results=[],warnings=[];
 // Start with the title, without forcing production year onto later release reviews.
 await Promise.all(Object.entries(publishers).map(async([source,p])=>{try{
  const publisherSignal=AbortSignal.timeout(20000);
  let found=false,blocked=null,searchFailed=false,rejected=false,blockedStatus=null;
  const seen=new Set();
  const imdb=source==='imdb'&&/^tt\d+$/.test(film.imdb_id||'');
  const queries=imdb?[null]:[...new Set([`"${film.title}" review site:${p.host}`,`"${film.original_title||film.title}" ${film.director||''} review site:${p.host}`].map(q=>q.replace(/\s+/g,' ').trim()))];
  for(const query of queries){
   let candidates;
   if(imdb)candidates=[{url:'https://www.imdb.com/title/'+film.imdb_id+'/'}];
   else{
    const u=new URL('https://api.search.brave.com/res/v1/web/search');u.search=new URLSearchParams({q:query,count:'5'});
    const r=await fetcher(u,{headers:{'X-Subscription-Token':env('BRAVE_SEARCH_API_KEY'),Accept:'application/json'},signal:publisherSignal});
    if(!r.ok){searchFailed=true;continue;}candidates=(await r.json()).web?.results||[];
   }
   for(const candidate of candidates.filter(c=>allowed(c.url,source)&&!seen.has(c.url)).sort((a,b)=>Number(/\/(?:reviews?|criticism)\//.test(new URL(b.url).pathname))-Number(/\/(?:reviews?|criticism)\//.test(new URL(a.url).pathname))).slice(0,3)){
    let url=candidate.url;seen.add(url);
    const named=[film.title,film.original_title].filter(Boolean).some(t=>norm(candidate.title).includes(norm(t)))&&/review/i.test(candidate.title||'')&&/review|criticism/i.test(new URL(url).pathname);
    const anchored=named&&(norm(candidate.description).includes(norm(film.director))&&!!film.director||String(candidate.description||'').includes(String(film.year)));
    let response;
    try{
     for(let n=0;n<3;n++){response=await fetcher(url,{redirect:'manual',signal:publisherSignal,headers:{Accept:'text/html','User-Agent':'CultureAtlas/1.0 (review link verification)'}});if(response.status>=300&&response.status<400){const next=new URL(response.headers.get('location'),url).href;if(!allowed(next,source))throw Error('Untrusted redirect');url=next;continue;}break;}
    }catch{blockedStatus='network timeout';if(anchored)blocked={source,url:candidate.url,score:null,author:'',label:p.name+' · Review link (page unavailable)',verification:'search_result',discovered_at:new Date().toISOString()};continue;}
    if(!response?.ok){blockedStatus='HTTP '+response?.status;if(anchored&&[402,403,429,503].includes(response?.status))blocked={source,url:candidate.url,score:null,author:'',label:p.name+' · Review link (page unavailable)',verification:'search_result',discovered_at:new Date().toISOString()};continue;}
    if(Number(response.headers.get('content-length'))>2000000)continue;
    const text=await response.text();if(text.length>2000000)continue;
    const item=extract(text,film,source,url);if(item){results.push({...item,verification:'publisher_page'});found=true;break;}rejected=true;
   }
   if(found)break;
  }
  if(!found&&blocked){const prior=old?.items?.find(i=>i.url===blocked.url&&i.verification!=='search_result'&&i.verified_at);results.push(prior||blocked);warnings.push(p.name+': review link found; publisher page unavailable ('+blockedStatus+'). No new rating extracted.');}
  else if(!found)warnings.push(p.name+': '+(blockedStatus?'publisher page unavailable ('+blockedStatus+'); a review may still exist.':searchFailed?'search service unavailable; please retry.':rejected?'pages found, but film/review details could not be verified.':'no matching review returned by search.'));
 }catch{warnings.push(p.name+' could not be checked.');}}));
 if(!results.length)return respond({error:'No source pages could be verified. Existing ratings and reviews are preserved. Try again later.'},422);
 return respond(await db('rpc/merge_film_reviews',{method:'POST',body:JSON.stringify({p_film:film_id,p_items:results.map(i=>({...i,discovery_version:DISCOVERY_VERSION})),p_warnings:warnings})}));
 }catch(e){return respond({error:e instanceof SyntaxError?'Invalid request':e.message?.startsWith('Review storage')?e.message:'Unable to check reviews. Existing results are preserved.'},400);}
};}

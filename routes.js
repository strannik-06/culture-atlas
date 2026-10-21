/* Public navigation state only. No ratings, notes, credentials or drafts in URLs. */
(() => {
 'use strict';
 const defaults={films:'top100',tv:'catalogue',books:'ratings'};
 const views={films:['top100','awards','ratings','catalogue','search'],tv:['catalogue','ratings','search'],books:['ratings','catalogue','search']};
 const fields={
  'films/top100':{q:['search',''],year:['year','2025'],tier:['tier',''],genre:['genre',''],status:['status','']},
  'films/awards':{event:['award-event',null],year:['award-year',null],category:['award-category','all'],result:['award-filter','all']},
  'films/ratings':{q:['ratings-search',''],sort:['ratings-sort','rating']},
  'films/catalogue':{q:['ratings-search',''],sort:['ratings-sort','rating']},
  'tv/catalogue':{q:['tv-search',''],kind:['tv-kind',''],sort:['tv-sort','year']},
  'tv/ratings':{q:['tv-search',''],kind:['tv-kind',''],sort:['tv-sort','year']},
  'books/search':{q:['book-query',''],author:['book-author','']},
  'films/search':{q:['media-query','']},'tv/search':{q:['media-query','']}
 };
 const positive=s=>/^[1-9]\d*$/.test(String(s))&&Number.isSafeInteger(Number(s));
 function tvRoute(key){const entity=String(key).replace(/^tv:/,'').replaceAll(':','/');return parse('#/tv/'+entity)||{section:'tv',view:'catalogue'};}
 const tvKey=entity=>'tv:'+entity.replaceAll('/',':');
 function parse(hash){
  try{
   const [raw,query='']=String(hash||'').replace(/^#\/?/,'').split('?');
   const parts=raw.split('/').filter(Boolean).map(decodeURIComponent),section=parts.shift()||'films';
   if(!views[section])return null;
   const params=Object.fromEntries(new URLSearchParams(query)),head=parts.shift()||defaults[section];
   let view=head,entity;
   if(section==='films'&&positive(head)&&!parts.length)entity=head;
   else if(section==='books'&&/^OL[1-9]\d*W$/.test(head)&&!parts.length)entity=head;
   else if(section==='tv'&&positive(head)&&(!parts.length||parts.length===2&&parts[0]==='season'&&/^(0|[1-9]\d*)$/.test(parts[1])))entity=[head,...parts].join('/');
   else if(section==='tv'&&parts.length===1&&((head==='movie'&&positive(parts[0]))||(head==='imdb'&&/^tt\d+$/.test(parts[0]))||(head==='local'&&/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(parts[0]))))entity=[head,...parts].join('/');
   else if(parts.length||!views[section].includes(view))return null;
   if(entity)view=views[section].includes(params.from)&&params.from!=='search'?params.from:defaults[section];
   const allowed=new Set(Object.keys(fields[section+'/'+view]||{}));
   if(['ratings','catalogue'].includes(view))allowed.add('page');
   if(view==='search'&&section!=='books'){allowed.add('director');allowed.add('year');}
   const clean={};
   for(const k of allowed)if(typeof params[k]==='string'&&params[k].length<=300){
    if(k==='page'){if(positive(params[k])&&Number(params[k])>1)clean[k]=String(Math.min(100000,Number(params[k])));}
    else if(k==='director'){if(positive(params[k]))clean[k]=params[k];}
    else if(k==='year'&&view==='search'){if(/^\d{4}$/.test(params[k]))clean[k]=params[k];}
    else if(params[k]!==fields[section+'/'+view]?.[k]?.[1])clean[k]=params[k];
   }
   return {section,view,...(entity?{entity}:{}),params:clean};
  }catch{return null;}
 }
 function format(route){
  const r=parse('#/'+route.section+'/'+(route.entity||route.view||defaults[route.section])+'?'+new URLSearchParams({...route.params,...(route.entity?{from:route.view}: {})}));
  if(!r)return '#/films/top100';
  const params=new URLSearchParams();
  if(r.entity&&r.view!==defaults[r.section])params.set('from',r.view);
  for(const k of Object.keys(r.params).sort())params.set(k,r.params[k]);
  return '#/'+r.section+'/'+(r.entity||r.view)+(params.size?'?'+params:'');
 }
 function start(app){
  const $=id=>document.getElementById(id);
  let applying=false,current,entityShown=null,lastLocation='',refreshQueued=false,reloadEntity=false;
  let authPending=/^#(?:access_token|error|refresh_token)=/.test(location.hash)||new URLSearchParams(location.search).has('code');
  let overlayReturn=null;
  const resolving=new Set();
  const error=document.createElement('p');error.id='route-status';error.className='meta';error.setAttribute('role','status');error.hidden=true;document.querySelector('main').prepend(error);
  const entityKey=r=>r.entity?r.section+'/'+r.entity:null;
  const schema=r=>fields[r.section+'/'+r.view]||{};
  function selectValue(el,value){if(el.tagName==='SELECT'&&![...el.options].some(o=>o.value===value))return;el.value=value;}
  function setFilters(r){for(const[k,[id,fallback]]of Object.entries(schema(r))){const el=$(id);if(!el)continue;selectValue(el,r.params[k]??fallback??el.options[0]?.value??'');if(k==='year'&&r.view==='awards')app.awardCategories();}}
  function title(r){const name={films:'Films',tv:'TV Series',books:'Books'}[r.section];document.title='Culture Atlas · '+name+' · '+({top100:'Top 100',ratings:'My ratings',catalogue:'Catalogue',search:'Search',awards:'Awards'}[r.view]);}
  function showEntity(r,force=false){
   if(!r.entity)return;
   const key=entityKey(r),reopen=key!==entityShown||force||(r.section==='tv'&&$('tv-editor').hidden)||(r.section==='books'&&$('book-editor').hidden);
   if(!reopen)return;
   let exists=false;
   if(r.section==='films'){exists=app.hasFilm(r.entity);if(exists){app.openFilm(r.entity);document.title=app.filmTitle(r.entity)+' · Culture Atlas';}}
   if(r.section==='tv'){const work=tvKey(r.entity);exists=app.tv.route.has(work);if(exists){app.tv.route.choose(work);document.title=app.tv.route.title()+' · Culture Atlas';}}
   if(r.section==='books'){const work='/works/'+r.entity;exists=app.books.route.has(work);if(!exists&&!resolving.has(work)){resolving.add(work);app.books.route.ensureWork(work).catch(()=>{}).finally(()=>api.refresh());}if(exists){app.books.route.choose(work);document.title=app.books.route.title()+' · Culture Atlas';}}
   error.hidden=exists;error.textContent=exists?'':'This item is not available in the loaded catalogue. It may still be loading; try refreshing or return to the catalogue.';
   entityShown=exists?key:null;
  }
  function apply(r){
   applying=true;
   try{
    const previous=current;current=r;error.hidden=true;
    if(entityKey(previous||{})!==entityKey(r)){
     entityShown=null;
     if($('film-detail-dialog').open)$('film-detail-dialog').close();
     app.books.route.closeEditor();app.tv.route.closeEditor();
    }
    if(r.view!=='search'||r.section==='books'){if($('media-dialog').open)app.media.route.close();}
    for(const b of document.querySelectorAll('[data-section]')){const on=b.dataset.section===r.section;b.classList.toggle('active',on);b.setAttribute('aria-pressed',String(on));}
    $('cinema-area').hidden=r.section!=='films';$('tv-view').hidden=r.section!=='tv';$('books-view').hidden=r.section!=='books';
    title(r);
    if(r.section==='films')app.filmView(r.view==='top100'?'films':r.view==='search'?'catalogue':r.view);
    if(r.section==='tv')app.tv.route.switchTab(r.view==='search'?'catalogue':r.view);
    if(r.section==='books')app.books.route.switchTab(r.view);
    setFilters(r);
    if(r.section==='films'){app.setPage(Number(r.params.page)||1);app.renderFilms();}
    if(r.section==='tv')app.tv.route.switchTab(r.view==='search'?'catalogue':r.view);
    if(r.section==='books'){app.books.route.setVisible((Number(r.params.page)||1)*48);if(r.view==='search'&&r.params.q?.length>=2)app.books.route.search();}
    if(r.view==='search'&&r.section!=='books'){
     const kind=r.section==='films'?'movie':'tv';
     if($('media-dialog').open&&app.media.route.getType()!==kind)app.media.route.close();
     if(!$('media-dialog').open)app.media.route.open(kind);
     app.media.route.restore(r.params);
    }
    showEntity(r);
   }finally{applying=false;}
  }
  function saveScroll(){if(!authPending)history.replaceState({...history.state,atlas:true,scroll:scrollY},'',location.href);}
  function navigate(route,{replace=false,overlay=false}={}){
   if(applying||authPending)return;
   const next=parse(format(route));if(!next)return;
   const hash=format(next),same=hash===location.hash;
   if(same)return;
   saveScroll();
   overlayReturn=overlay?{child:hash,parent:location.hash}:null;
   history[replace?'replaceState':'pushState']({atlas:true,scroll:overlay?scrollY:0},'',hash);lastLocation=location.href;
   apply(next);if(!overlay)window.scrollTo(0,0);
  }
  function readLocation(){
   if(authPending)return;
   if(location.href===lastLocation)return;
   overlayReturn=null;
   const route=parse(location.hash);
   if(!route){error.hidden=false;error.textContent='This page address is not recognised. Choose Films, TV Series or Books to continue.';return;}
   lastLocation=location.href;apply(route);
   window.scrollTo(0,history.state?.scroll||0);
  }
  function capture(){
   if(applying||authPending||!current)return;
   const params={...current.params};
   for(const[k,[id,fallback]]of Object.entries(schema(current))){const el=$(id);if(!el)continue;const value=el.value;delete params[k];if(value!==fallback)params[k]=value;}
   if(['ratings','catalogue'].includes(current.view)){
    const page=current.section==='films'?app.getPage():current.section==='books'?Math.ceil(app.books.route.getVisible()/48):1;
    if(page>1)params.page=String(page);else delete params.page;
   }
   const next={...current,params},hash=format(next);if(hash===location.hash)return;
   history.replaceState({...history.state,atlas:true},'',hash);current=parse(hash);lastLocation=location.href;
  }
  function closeOverlay(){
   if(applying||!current)return;
   if(overlayReturn?.child===location.hash&&history.state?.atlas){history.back();return;}
   navigate({section:current.section,view:current.view==='search'?defaults[current.section]:current.view,params:current.view==='search'?{}:current.params},{replace:true});
  }
  const api={
   navigate,
   openFilm:id=>{if(applying)return false;navigate({section:'films',view:current?.section==='films'&&current.view!=='search'?current.view:'catalogue',entity:String(id),params:current?.section==='films'?current.params:{}},{overlay:true});return true;},
   openTV:key=>{if(applying)return false;navigate({...tvRoute(key),view:current?.section==='tv'?current.view:'catalogue',params:current?.section==='tv'?current.params:{}},{overlay:true});return true;},
   openBook:work=>{if(applying)return false;navigate({section:'books',view:current?.section==='books'&&current.view!=='search'?current.view:'catalogue',entity:work.split('/').pop(),params:current?.section==='books'?current.params:{}},{overlay:true});return true;},
   openSearch:kind=>{if(applying)return false;navigate({section:kind==='movie'?'films':'tv',view:'search'},{overlay:true});return true;},
   closeDetail:kind=>{if(!applying&&current?.entity&&{film:'films',tv:'tv',book:'books'}[kind]===current.section)closeOverlay();},
   closeSearch:()=>{if(!applying&&current?.view==='search'&&current.section!=='books')closeOverlay();},
   searchChanged:body=>{if(applying||current?.view!=='search')return;const params=body.mode==='director'?{director:String(body.person_id),...(body.year?{year:String(body.year)}:{})}:{q:body.query||''};const r={...current,params};history.replaceState({...history.state,atlas:true},'',format(r));current=parse(location.hash);lastLocation=location.href;},
   refresh:(options={})=>{reloadEntity||=!!options.reloadEntity;if(refreshQueued)return;refreshQueued=true;queueMicrotask(()=>{refreshQueued=false;if(!current||authPending)return;applying=true;try{const force=reloadEntity;reloadEntity=false;if(current.section==='films'&&['ratings','catalogue'].includes(current.view)){app.setPage(Number(current.params.page)||1);app.renderRatings();}showEntity(current,current.section==='films'||force);if(current.view==='search'&&current.section!=='books')app.media.route.restore(current.params);}finally{applying=false;}});},
   authRedirect:()=>{try{sessionStorage.setItem('culture-atlas:return-route',location.hash);}catch{}return location.origin+location.pathname;},
   authReady:()=>{if(!authPending)return;authPending=false;let hash;try{hash=sessionStorage.getItem('culture-atlas:return-route');sessionStorage.removeItem('culture-atlas:return-route');}catch{}const route=parse(hash)||{section:'films',view:'top100'};history.replaceState({atlas:true},'',format(route));lastLocation=location.href;apply(parse(location.hash));},
   get current(){return current;},get applying(){return applying;}
  };
  document.addEventListener('click',event=>{
   const link=event.target.closest('a[href^="#/"]');
   if(link){if(event.button||event.metaKey||event.ctrlKey||event.shiftKey||event.altKey)return;const r=parse(link.getAttribute('href'));if(r){event.preventDefault();event.stopImmediatePropagation();if(r.entity&&r.section===current?.section&&current.view!=='search'){r.view=current.view;r.params=current.params;}navigate(r,{overlay:!!r.entity});}return;}
   const target=event.target.closest('[data-section],[data-view],[data-tv-tab],[data-book-tab],[data-media-type]');
   if(!target)return;
   if(event.metaKey||event.ctrlKey||event.shiftKey||event.altKey)return;
   event.preventDefault();event.stopImmediatePropagation();
   const section=target.dataset.section||(target.dataset.tvTab?'tv':target.dataset.bookTab?'books':target.dataset.mediaType==='tv'?'tv':'films');
   const view=target.dataset.view==='films'?'top100':target.dataset.view||target.dataset.tvTab||target.dataset.bookTab||(target.dataset.mediaType?'search':defaults[section]);
   navigate({section,view},{overlay:!!target.dataset.mediaType});
  },true);
  document.addEventListener('input',event=>{if(event.target.id==='media-query'&&current?.view==='search'){delete current.params.director;delete current.params.year;}if(Object.values(schema(current||{})).some(([id])=>id===event.target.id))capture();});
  document.addEventListener('change',event=>{if(Object.values(schema(current||{})).some(([id])=>id===event.target.id))capture();});
  $('ratings-pagination').addEventListener('click',capture);$('book-more').addEventListener('click',capture);
  window.addEventListener('popstate',readLocation);window.addEventListener('hashchange',readLocation);
  window.addEventListener('scroll',saveScroll,{passive:true});
  if('scrollRestoration'in history)history.scrollRestoration='manual';
  // Keep Supabase's OAuth fragment intact until its SDK consumes it.
  const parsed=parse(location.hash),initial=parsed||{section:'films',view:'top100',params:{}};
  if(!authPending&&(parsed||!location.hash)){history.replaceState({atlas:true,scroll:0},'',format(initial));lastLocation=location.href;}
  apply(initial);
  if(!parsed&&!authPending){error.hidden=false;error.textContent='This page address is not recognised. Choose Films, TV Series or Books to continue.';}
  return api;
 }
 window.CultureRoutes={parse,format,tvRoute,start};
})();

/* Authenticated discovery. Each result owns its draft and optimistic version. */
(() => {
 'use strict';
 const $=id=>document.getElementById(id);
 const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const today=()=>{const d=new Date();return [d.getFullYear(),String(d.getMonth()+1).padStart(2,'0'),String(d.getDate()).padStart(2,'0')].join('-');};
 const imagePath=p=>typeof p==='string'&&/^\/[a-zA-Z0-9_./-]+$/.test(p)?'https://image.tmdb.org/t/p/w185'+p:null;
 let client,user=null,generation=0,request=0,type='movie',hooks={},cards=new Map(),peopleSeen=new Set(),searchBody=null,page=0,totalPages=0,searchBusy=false;
 let picker,active=null,preview=null,routeSignature=null;
 const status=s=>$('media-status').textContent=s;
 const alive=(turn,serial)=>turn===generation&&serial===request;
 async function call(body){
  if(!user)throw Error('Sign in using the account menu to search and save.');
  if(!client?.functions)throw Error('Search is unavailable. Reload the page and try again.');
  const {data,error}=await client.functions.invoke('media-search',{body});
  if(error){let message;try{message=(await error.context.json()).error;}catch{}throw Error(message||'Unable to complete this request. Please try again.');}
  if(data?.error)throw Error(data.error);return data;
 }
 async function loadCatalogue(){
  const works=[];
  for(let offset=0;;offset+=500){
   const {data,error}=await client.from('media_catalogue').select('metadata,work_type,is_static').eq('is_static',false).order('work_key').range(offset,offset+499);
   if(error)throw Error('Saved, but the catalogue could not refresh. Reload the page to try again.');
   works.push(...(data||[]));if((data||[]).length<500)break;
  }
  hooks.onCatalogue(works);
 }
 function closeStars(){if(active)active.element.querySelector('[data-stars]')?.setAttribute('aria-expanded','false');if(picker)picker.hidden=true;active=null;preview=null;}
 function reset(){routeSignature=null;closeStars();request++;cards.clear();peopleSeen.clear();searchBody=null;page=0;totalPages=0;searchBusy=false;$('media-results').replaceChildren();$('media-more').hidden=true;$('media-search-submit').disabled=false;}
 function open(kind){
  if(window.CultureRouter?.openSearch(kind))return;
  type=kind;reset();$('media-search-form').reset();
  $('media-heading').textContent=kind==='movie'?'Find a film':'Find a TV series';$('media-query').placeholder=kind==='movie'?'Title or director, e.g. Dune 2021':'Series title and year…';
  $('media-dialog').showModal();status(user?(kind==='movie'?'Search a title or director; add a release year if you like.':'Search a series title; add a release year if you like.'):'Sign in using the account menu to search and save.');$('media-query').focus();
 }
 function capture(card){
  if(!card.draft)return;
  card.draft.notes=card.element.querySelector('[data-notes]').value;
  card.draft.date=card.element.querySelector('[data-date]').value||null;
 }
 function notice(card,message){card.element.querySelector('[data-status]').textContent=message;}
 function paint(value){
  picker.querySelectorAll('[data-star]').forEach((b,i)=>b.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,value-i))*100}%`);
  picker.querySelector('.rating-preview').textContent=value?value.toFixed(1)+' / 10':'Not rated';
 }
 function setRating(card,value){
  card.draft.rating=value;
  if(!card.data.progress?.rating&&!card.draft.dateEdited){card.draft.date=today();card.element.querySelector('[data-date]').value=card.draft.date;}
  const b=card.element.querySelector('[data-stars]');b.innerHTML=(value?'★':'☆')+' <span class="value">'+(value?value.toFixed(1)+'/10':'Rate')+'</span>';
  card.element.querySelector('[data-save]').disabled=!value||card.busy;
 }
 function initStars(dialog){
  picker=document.createElement('div');picker.id='media-star-picker';picker.className='star-picker';picker.hidden=true;picker.setAttribute('role','dialog');picker.setAttribute('aria-label','Choose a rating');
  picker.innerHTML='<div class="star-choices" role="group" aria-label="Rating out of ten">'+Array.from({length:10},(_,i)=>`<button class="star-choice" type="button" data-star="${i}" aria-label="${i+1} stars"><span class="star-empty">★</span><span class="star-fill">★</span></button>`).join('')+'</div><span class="rating-preview" aria-live="polite"></span>';
  // A modal dialog is in the browser top layer; its picker must be inside it.
  dialog.append(picker);
  const pointer=(e,b)=>Number(b.dataset.star)+(e.clientX-b.getBoundingClientRect().left<b.getBoundingClientRect().width/2?.5:1);
  const commit=value=>{if(!active)return;const card=active,trigger=card.element.querySelector('[data-stars]');setRating(card,value);closeStars();trigger.focus();};
  picker.addEventListener('pointermove',e=>{const b=e.target.closest('[data-star]');if(b){preview=pointer(e,b);paint(preview);}});
  picker.addEventListener('pointerleave',()=>{preview=null;if(active)paint(active.draft.rating||0);});
  picker.addEventListener('click',e=>{const b=e.target.closest('[data-star]');if(b)commit(e.detail===0?(preview??Number(b.dataset.star)+1):pointer(e,b));});
  picker.addEventListener('keydown',e=>{
   if(e.key==='Escape'){e.preventDefault();e.stopPropagation();const trigger=active?.element.querySelector('[data-stars]');closeStars();trigger?.focus();}
   if(['ArrowLeft','ArrowDown','ArrowRight','ArrowUp'].includes(e.key)&&active){e.preventDefault();preview=Math.max(.5,Math.min(10,(preview??(active.draft.rating||0))+(['ArrowRight','ArrowUp'].includes(e.key)?.5:-.5)));paint(preview);}
   if((e.key==='Enter'||e.key===' ')&&preview!==null){e.preventDefault();commit(preview);}
   if(e.key==='Tab')closeStars();
  });
  document.addEventListener('pointerdown',e=>{if(active&&!picker.contains(e.target)&&!active.element.querySelector('[data-stars]').contains(e.target))closeStars();});
  dialog.addEventListener('scroll',closeStars,{passive:true});window.addEventListener('resize',closeStars);
 }
 function openStars(card){
  if(card.busy||!card.draft)return;if(active===card){closeStars();return;}closeStars();active=card;preview=null;picker.hidden=false;paint(card.draft.rating||0);
  const b=card.element.querySelector('[data-stars]');b.setAttribute('aria-expanded','true');const r=b.getBoundingClientRect(),width=Math.min(300,innerWidth-20),height=picker.offsetHeight;
  picker.style.left=Math.max(10,Math.min(innerWidth-width-10,r.left))+'px';picker.style.top=(r.top>height+12?r.top-height-8:Math.max(10,Math.min(innerHeight-height-10,r.bottom+8)))+'px';
  picker.querySelectorAll('[data-star]')[Math.max(0,Math.ceil(card.draft.rating||1)-1)].focus();
 }
 function renderEditor(card){
  const {metadata:m,progress:p,seasons=[]}=card.data,d=card.draft,season=card.season;
  const credits=m.director||(m.creators||[]).map(x=>x.name).join(', ')||'Credits not listed';
  card.element.querySelector('[data-credit]').textContent=credits;
  card.element.querySelector('[data-title]').textContent=m.title;
  card.element.querySelector('[data-editor]').innerHTML=`${type==='tv'?`<label class="media-target">Rate<select data-season aria-label="Series or season for ${esc(m.title)}"><option value="">${d.scope==='unspecified'?'Series (scope not specified)':'Whole series'}</option>${seasons.map(s=>`<option value="${s.number}" ${season===s.number?'selected':''}>${esc(s.name)}${s.date?' · '+esc(s.date.slice(0,4)):''}</option>`).join('')}</select></label>`:''}<form class="media-rating-form"><fieldset><legend class="sr-only">Your rating for ${esc(m.title)}</legend><div class="media-quick-fields"><button data-stars type="button" class="star-trigger" aria-label="Set personal rating for ${esc(m.title)}" aria-haspopup="dialog" aria-controls="media-star-picker" aria-expanded="false"></button><label>Watched<input data-date type="date" value="${esc(d.date||'')}" aria-label="Watched date for ${esc(m.title)}"></label><button data-save type="submit" class="action">${p?.rating?'Save changes':'Save rating'}</button></div><details class="media-notes"><summary>${p?.notes?'Notes (saved)':'Add notes'}</summary><label><span class="sr-only">Your notes for ${esc(m.title)}</span><textarea data-notes maxlength="10000" placeholder="Your thoughts…">${esc(d.notes)}</textarea></label></details></fieldset></form>`;
  card.element.querySelector('[data-source]').href='https://www.themoviedb.org/'+type+'/'+card.id+(season?'/season/'+season:'');
  setRating(card,d.rating);notice(card,p?.rating?'Edit your existing rating here.':'Choose stars and save.');
  card.element.querySelector('[data-stars]').onclick=()=>openStars(card);
  card.element.querySelector('[data-date]').oninput=()=>{d.dateEdited=true;};
  card.element.querySelector('[data-season]')?.addEventListener('change',e=>loadCard(card,e.target.value?Number(e.target.value):null));
  card.element.querySelector('form').onsubmit=e=>{e.preventDefault();save(card);};
 }
 async function loadCard(card,season=null){
  const turn=generation,serial=request,version=++card.version;
  if(card.draft){capture(card);card.drafts.set(String(card.season),{data:card.data,draft:card.draft});}
  if(active===card)closeStars();card.season=season;card.busy=true;card.data=null;card.draft=null;
  const oldEditor=card.element.querySelector('[data-editor]');oldEditor.replaceChildren();notice(card,'Loading credits and your rating…');
  const apply=data=>{card.data=data;const cached=card.drafts.get(String(season));card.draft=cached?.draft||{rating:Number(data.progress?.rating)||null,notes:data.progress?.notes??'',date:data.progress?.rating?data.progress.watched_date??null:today(),scope:data.progress?.rating_scope||'whole_work',dateEdited:false};if(cached)card.data=cached.data;card.busy=false;renderEditor(card);};
  try{
   const cached=card.drafts.get(String(season));if(cached){apply(cached.data);return;}
   const data=await call({action:'details',type,id:card.id,season});if(!alive(turn,serial)||version!==card.version)return;apply(data);
  }catch(e){if(alive(turn,serial)&&version===card.version){card.busy=false;notice(card,e.message);const retry=document.createElement('button');retry.type='button';retry.className='action';retry.textContent='Retry loading rating';retry.onclick=()=>loadCard(card,season);oldEditor.append(retry);}}
 }
 function makeCard(result){
  const element=document.createElement('article');element.className='media-card';element.dataset.mediaId=result.id;
  const poster=imagePath(result.poster_path);
  element.innerHTML=`<div class="media-poster">${poster?`<img src="${esc(poster)}" loading="lazy" alt="Poster for ${esc(result.title)}">`:'<span aria-hidden="true">'+esc((result.title||'?')[0])+'</span>'}</div><div class="media-card-body"><div class="media-card-heading"><h3 data-title>${esc(result.title)}</h3></div><p class="meta media-identity">${esc(result.date?.slice(0,4)||'Year unknown')}${result.original_title&&result.original_title!==result.title?' · '+esc(result.original_title):''}</p><p data-credit class="meta">${esc(result.director||'Loading credits…')}</p><div data-editor></div><p data-status class="meta" role="status" aria-live="polite"></p><a data-source target="_blank" rel="noopener noreferrer" class="meta">TMDB ↗</a></div>`;
  element.querySelector('img')?.addEventListener('error',e=>{e.target.hidden=true;});
  const card={id:result.id,element,season:null,busy:false,version:0,data:null,draft:null,drafts:new Map()};cards.set(result.id,card);$('media-results').append(element);return card;
 }
 async function hydrate(list,turn,serial){
  let next=0;await Promise.all(Array.from({length:Math.min(3,list.length)},async()=>{while(next<list.length&&alive(turn,serial)){const card=list[next++];await loadCard(card);}}));
 }
 async function save(card){
  if(card.busy||!card.draft?.rating)return;capture(card);closeStars();const turn=generation,serial=request,version=card.version;
  const body={action:'save',type,id:card.id,season:card.season,rating:card.draft.rating,notes:card.draft.notes,date:card.draft.date,scope:card.draft.scope,expected_updated_at:card.data.progress?.updated_at||null};
  card.busy=true;card.element.querySelector('fieldset').disabled=true;const target=card.element.querySelector('[data-season]');if(target)target.disabled=true;notice(card,'Saving…');
  try{
   const data=await call(body);if(!alive(turn,serial)||version!==card.version)return;
   card.data.progress=data.progress;card.data.existing={work_key:data.work_key,work_type:data.work_key.startsWith('movie:')?'movie':'tv'};card.draft.date=data.progress?.watched_date??body.date;card.drafts.set(String(card.season),{data:card.data,draft:card.draft});card.busy=false;renderEditor(card);notice(card,'Saved.');
   try{await loadCatalogue();if(alive(turn,serial))await hooks.onSaved();}catch(e){if(alive(turn,serial))notice(card,'Rating saved. '+e.message);}
  }catch(e){if(alive(turn,serial)&&version===card.version){card.busy=false;card.element.querySelector('fieldset').disabled=false;if(target)target.disabled=false;notice(card,e.message);
   if(/changed|removed/i.test(e.message)){
    const reload=document.createElement('button');reload.className='action';reload.type='button';reload.textContent='Reload saved rating (discard draft)';
    reload.onclick=()=>{card.drafts.delete(String(card.season));card.draft=null;card.data=null;loadCard(card,card.season);};
    card.element.querySelector('[data-editor]').append(reload);
   }
  }}
 }
 async function search(body,append=false){
  if(searchBusy)return;if(!append){window.CultureRouter?.searchChanged(body);reset();routeSignature=JSON.stringify([type,body.mode==='director'?'':body.query||'',body.mode==='director'?body.person_id:0,body.year||null]);}const turn=generation,serial=request;searchBusy=true;$('media-search-submit').disabled=true;$('media-more').disabled=true;status('Searching…');
  try{
   const data=await call({...body,action:'search',type});if(!alive(turn,serial))return;searchBody=body;page=data.page||1;totalPages=data.total_pages||1;
   const list=[];
   for(const result of data.results){
    if(data.kind==='people'||result.kind==='person'){
     if(peopleSeen.has(result.id))continue;peopleSeen.add(result.id);
     const person=result,article=document.createElement('article');article.className='media-person';const poster=imagePath(person.poster_path);
     article.innerHTML=`${poster?`<img src="${esc(poster)}" alt="${esc(person.title)}" loading="lazy">`:''}<div><h3>${esc(person.title)}</h3><p class="meta">${esc([person.department,...person.known_for||[]].filter(Boolean).join(' · '))}</p><button class="action" type="button">Show directed films</button></div>`;
     article.querySelector('button').onclick=()=>search({mode:'director',person_id:person.id,year:data.year||body.year||null,page:1});$('media-results').append(article);
    }else if(!cards.has(result.id))list.push(makeCard(result));
   }
   status(data.results.length?(data.director?'Films directed by '+data.director+'. ':'')+(type==='movie'?'Rate a film below, or choose a director to browse their films.':'Rate the series or a season below.'):'No results. Try another spelling or remove the year.');
   void hydrate(list,turn,serial);
   $('media-more').hidden=page>=totalPages;
  }catch(e){if(alive(turn,serial))status(e.message);}finally{if(alive(turn,serial)){searchBusy=false;$('media-search-submit').disabled=false;$('media-more').disabled=false;}}
 }
 function init(c,callbacks){
  client=c;hooks=callbacks;const dialog=document.createElement('dialog');dialog.id='media-dialog';dialog.setAttribute('aria-labelledby','media-heading');
  dialog.innerHTML='<button id="media-close" type="button" class="action">Close</button><h2 id="media-heading"></h2><form id="media-search-form" class="media-search-fields"><input id="media-query" type="search" required minlength="2" maxlength="200" placeholder="Title…" aria-label="Film, TV title or director"><button id="media-search-submit" type="submit" class="action">Search</button></form><p id="media-status" role="status" aria-live="polite"></p><div id="media-results"></div><button id="media-more" type="button" class="action" hidden>Show more results</button><p class="meta media-attribution"><a href="https://www.themoviedb.org" target="_blank" rel="noopener noreferrer"><img src="assets/tmdb-logo.svg" width="80" alt="TMDB"></a> This product uses the TMDB API but is not endorsed or certified by TMDB.</p>';
  document.body.append(dialog);initStars(dialog);
  for(const[k,container,label]of [['movie','#cinema-area .film-subnav','Add film'],['tv','#tv-view .film-subnav','Add series']]){const b=document.createElement('button');b.type='button';b.className='film-subtab';b.dataset.mediaType=k;b.textContent=label;b.onclick=()=>open(k);document.querySelector(container)?.append(b);}
  $('media-close').onclick=()=>{if(window.CultureRouter)window.CultureRouter.closeSearch();else{dialog.close();reset();}};dialog.addEventListener('cancel',event=>{if(window.CultureRouter){event.preventDefault();window.CultureRouter.closeSearch();}else reset();});
  $('media-search-form').onsubmit=e=>{e.preventDefault();search({mode:'smart',query:$('media-query').value,page:1});};
  $('media-more').onclick=()=>search({...searchBody,page:page+1},true);

  if(client)loadCatalogue().catch(e=>console.warn(e.message));
 }
 function setSession(next){user=next;generation++;reset();status(user?'Ready to search.':'Sign in to search and save.');window.CultureRouter?.refresh();}
 window.CultureMedia={init,setSession,route:{open,getType:()=>type,close:()=>{closeStars();$('media-dialog').close();reset();},
  restore:params=>{const query=params.q||'',person=Number(params.director)||0;const signature=JSON.stringify([type,query,person,params.year||null]);
   $('media-query').value=query;
   if(user&&(query.length>=2||person)&&signature!==routeSignature){
    if(searchBusy)reset();
    search(person?{mode:'director',person_id:person,year:params.year||null,page:1}:{mode:'smart',query,page:1});
   }
  }
 }};
})();

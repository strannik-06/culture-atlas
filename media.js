/* Authenticated TMDB discovery; private drafts stay in memory, never localStorage. */
(() => {
 'use strict';
 const $=id=>document.getElementById(id),esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 let client,user=null,generation=0,request=0,type='movie',selected=null,id=null,hooks={};
 const status=s=>$('media-status').textContent=s;
 async function call(body){
  if(!user)throw Error('Sign in using the account menu to search and save.');
  if(!client?.functions)throw Error('Search is unavailable. Reload the page and try again.');
  const {data,error}=await client.functions.invoke('media-search',{body});
  if(error){let message;try{message=(await error.context.json()).error;}catch{}throw Error(message||'Search is unavailable. Check the media-search deployment and sign in again.');}
  if(data?.error)throw Error(data.error);return data;
 }
 async function loadCatalogue(){
  const works=[];for(let offset=0;;offset+=500){const {data,error}=await client.from('media_catalogue').select('metadata,work_type,is_static').eq('is_static',false).order('work_key').range(offset,offset+499);if(error)throw Error('New catalogue entries could not load. Use Add film / Add series again after checking setup.');works.push(...(data||[]));if((data||[]).length<500)break;}
  hooks.onCatalogue(works);
 }
 function reset(){selected=null;id=null;request++;$('media-editor').hidden=true;$('media-results').replaceChildren();$('media-form').reset();}
 function open(kind){type=kind;reset();$('media-heading').textContent=kind==='movie'?'Find a film':'Find a TV series';$('media-dialog').showModal();status(user?'Search by title; add a year to narrow the results.':'Sign in using the account menu to search and save.');$('media-query').focus();}
 async function choose(target,season=null){
  const turn=generation,serial=++request;selected=null;$('media-editor').hidden=true;status('Loading title and your existing rating…');
  try{
   const data=await call({action:'details',type,id:target,season});if(turn!==generation||serial!==request)return;
   selected=data;id=target;const m=data.metadata,p=data.progress;
   $('media-title').textContent=m.title;$('media-credits').textContent=[m.original_title,m.year,m.director||(m.creators||[]).map(p=>p.name).join(', ')].filter(Boolean).join(' · ');
   $('media-source').href='https://www.themoviedb.org/'+type+'/'+target+(season?'/season/'+season:'');
   $('media-season-label').hidden=type!=='tv';$('media-season').innerHTML='<option value="">Whole series</option>'+(data.seasons||[]).map(s=>`<option value="${s.number}">${esc(s.name)}${s.date?' · '+esc(s.date):''} · ${s.episodes} episodes</option>`).join('');$('media-season').value=season??'';
   $('media-rating').value=p?.rating??'';$('media-notes').value=p?.notes??'';$('media-date').value=p?.watched_date??'';$('media-scope').value=p?.rating_scope||'whole_work';$('media-scope-label').hidden=type==='movie'||season!=null;
   $('media-editor').hidden=false;$('media-save').disabled=false;status(p?'You already rated this work. Saving will update the rating shown below.':data.existing?'Already in the catalogue. Save your rating below.':'Review the title and version, then add it with your rating.');
  }catch(e){if(turn===generation&&serial===request)status(e.message);}
 }
 function init(c,callbacks){
  client=c;hooks=callbacks;
  const dialog=document.createElement('dialog');dialog.id='media-dialog';dialog.setAttribute('aria-labelledby','media-heading');
  dialog.innerHTML=`<button id="media-close" type="button" class="action">Close</button><h2 id="media-heading"></h2><form id="media-search-form" class="filters"><input id="media-query" type="search" required minlength="2" maxlength="200" placeholder="Title…" aria-label="Film or TV title"><input id="media-year" type="number" min="1800" max="2999" placeholder="Year (optional)" aria-label="Release year (optional)"><button class="action">Search</button></form><p id="media-status" role="status" aria-live="polite"></p><div id="media-results"></div><section id="media-editor" hidden><h3 id="media-title"></h3><p id="media-credits" class="meta"></p><a id="media-source" target="_blank" rel="noopener noreferrer">Check on TMDB ↗</a><label id="media-season-label">Rate series or season<select id="media-season"></select></label><form id="media-form"><label>Your rating<select id="media-rating" required><option value="">Choose rating</option>${Array.from({length:20},(_,i)=>`<option value="${(i+1)/2}">★ ${(i+1)/2} / 10</option>`).join('')}</select></label><label id="media-scope-label">Rating covers<select id="media-scope"><option value="whole_work">Whole work / series</option><option value="unspecified">Seasons or parts not specified</option></select></label><label>Watched date (optional)<input id="media-date" type="date"></label><label>Your notes (optional)<textarea id="media-notes" maxlength="10000"></textarea></label><button id="media-save" class="action">Save to catalogue & ratings</button></form></section><p class="meta"><a href="https://www.themoviedb.org" target="_blank" rel="noopener noreferrer"><img src="assets/tmdb-logo.svg" width="100" alt="TMDB"></a> Search data from TMDB. This product uses the TMDB API but is not endorsed or certified by TMDB.</p>`;
  document.body.append(dialog);
  for(const[k,container,label]of [['movie','#cinema-area .film-subnav','Add film'],['tv','#tv-view .film-subnav','Add series']]){const b=document.createElement('button');b.type='button';b.className='film-subtab';b.textContent=label;b.addEventListener('click',()=>open(k));document.querySelector(container)?.append(b);}
  $('media-close').onclick=()=>{dialog.close();reset();};dialog.addEventListener('cancel',reset);
  $('media-search-form').onsubmit=async e=>{
   e.preventDefault();const turn=generation,serial=++request;selected=null;$('media-editor').hidden=true;$('media-results').replaceChildren();status('Searching…');
   try{const data=await call({action:'search',type,query:$('media-query').value,year:$('media-year').value||null});if(turn!==generation||serial!==request)return;
    $('media-results').innerHTML=data.results.map(r=>`<button class="media-result action" type="button" data-id="${Number(r.id)}"><strong>${esc(r.title)}</strong> <span class="meta">${esc(r.date||'Year unknown')} · ${esc(r.original_title||'')}</span></button>`).join('');status(data.results.length?'Select the correct title to review its details.':'No results. Try its original title or remove the year.');
   }catch(err){if(turn===generation&&serial===request)status(err.message);}
  };
  $('media-results').onclick=e=>{const b=e.target.closest('[data-id]');if(b)choose(Number(b.dataset.id));};
  $('media-season').onchange=()=>choose(id,$('media-season').value?Number($('media-season').value):null);
  $('media-form').onsubmit=async e=>{
   e.preventDefault();if(!selected||$('media-save').disabled)return;const turn=generation,serial=request;
   const body={action:'save',type,id,season:$('media-season').value?Number($('media-season').value):null,rating:Number($('media-rating').value),notes:$('media-notes').value,date:$('media-date').value||null,scope:$('media-scope').value,expected_updated_at:selected.progress?.updated_at||null};
   $('media-save').disabled=true;status('Saving…');
   try{await call(body);if(turn!==generation||serial!==request)return;
    selected=null;$('media-editor').hidden=true;status('Saved. Refreshing your catalogue and ratings…');await loadCatalogue();if(turn!==generation)return;await hooks.onSaved();if(turn===generation)status('Saved to your catalogue and ratings. You can search for another title.');
   }catch(err){if(turn===generation&&serial===request)status(err.message);}finally{if(turn===generation&&serial===request)$('media-save').disabled=false;}
  };
  if(client)loadCatalogue().catch(e=>console.warn(e.message));
 }
 function setSession(next){user=next;generation++;reset();status(user?'Ready to search.':'Sign in to search and save.');}
 window.CultureMedia={init,setSession};
})();

/* TV ratings: reviewed work identities; private progress; explicit, insert-only imports. */
(() => {
  'use strict';
  const $=id=>document.getElementById(id);
  const escape=value=>String(value??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const scopes={whole_work:'Whole work / series',unspecified:'Seasons or parts not specified'};
  const kinds={series:'Series',miniseries:'Miniseries',unknown:'TV work',season:'Season',episode:'TV installment',opening:'Opening sequence'};
  const wholeScope=w=>({season:'Complete selected season',episode:'This installment',opening:'This opening sequence'}[w.series_kind]||'Whole work / series');
  function sourceLinks(w){
    const links=[];
    if(Number.isSafeInteger(w.tmdb_id)&&w.tmdb_id>0){
      const type=w.tmdb_media_type==='movie'?'movie':'tv';
      const suffix=w.series_kind==='season'?'/season/'+w.season_number:'';
      links.push({url:'https://www.themoviedb.org/'+type+'/'+w.tmdb_id+suffix,label:'TMDB'});
    }
    if(/^tt\d{6,}$/.test(w.imdb_id||''))links.push({url:'https://www.imdb.com/title/'+w.imdb_id+'/',label:'IMDb'});
    if(!links.length)for(const url of w.evidence_urls||[])if(typeof url==='string'&&/^https:\/\//.test(url))links.push({url,label:'Reference'});
    return links.map(link=>`<a href="${escape(link.url)}" target="_blank" rel="noopener noreferrer">${escape(link.label)} ↗</a>`).join(' ');
  }
  const validRating=n=>typeof n==='number'&&Number.isFinite(n)&&n>=.5&&n<=10&&Number.isInteger(n*2);
  const validDate=s=>s===null||(typeof s==='string'&&/^\d{4}-\d{2}-\d{2}$/.test(s)&&Number.isFinite(Date.parse(s+'T00:00:00Z'))&&new Date(s+'T00:00:00Z').toISOString().slice(0,10)===s);
  function validateImport(input,catalogue) {
    if(!['culture-atlas-tv-progress-v1','culture-atlas-tv-progress-v2'].includes(input?.format)||!Array.isArray(input.ratings)||input.ratings.length<1||input.ratings.length>500)throw Error('Choose a Culture Atlas TV ratings file with 1–500 entries.');
    if(input.replace_dekalog_episode!==undefined&&typeof input.replace_dekalog_episode!=='boolean')throw Error('Invalid Dekalog correction flag.');
    const known=new Set(catalogue.map(w=>w.id)),seen=new Set();
    const ratings=input.ratings.map(p=>{
      if(!p||!known.has(p.work_key)||seen.has(p.work_key)||!validRating(p.rating)||!Object.hasOwn(scopes,p.rating_scope)||typeof p.notes!=='string'||p.notes.length>10000||!validDate(p.watched_date??null))throw Error('Unknown, duplicate or invalid TV rating. No changes made.');
      seen.add(p.work_key);
      return {work_key:p.work_key,rating:p.rating,rating_scope:p.rating_scope,notes:p.notes,watched_date:p.watched_date??null};
    });
    const replace=Boolean(input.replace_dekalog_episode);
    if(replace&&!ratings.some(p=>p.work_key==='tv:42699'&&p.rating===10&&p.rating_scope==='whole_work'))throw Error('The Dekalog correction requires the whole-cycle 10.0 rating in this file.');
    const corrections=[];
    if(input.rating_corrections!==undefined){
      if(input.format!=='culture-atlas-tv-progress-v2'||replace||!Array.isArray(input.rating_corrections)||input.rating_corrections.length>50)throw Error('Invalid reviewed rating corrections.');
      const keys=new Set();
      for(const c of input.rating_corrections){
        if(!c||!known.has(c.work_key)||keys.has(c.work_key)||!validRating(c.expected_rating)||!validRating(c.rating)||c.expected_rating===c.rating)throw Error('Invalid or duplicate reviewed correction.');
        keys.add(c.work_key);corrections.push({work_key:c.work_key,expected_rating:c.expected_rating,rating:c.rating});
      }
    }
    return {ratings,replace,corrections};
  }
  function previewImport(ratings,existing) {
    const present=ratings.filter(p=>existing.has(p.work_key));
    return {missing:ratings.length-present.length,existing:present.length,conflicts:present.filter(p=>{
      const old=existing.get(p.work_key);
      return Number(old.rating)!==p.rating||old.notes!==p.notes||old.rating_scope!==p.rating_scope||(old.watched_date??null)!==p.watched_date;
    }).length};
  }
  let client,user=null,generation=0,loading=false,busy=false,ready=false,current=null,editorVersion=null,tab='catalogue';
  let rows=new Map(),linked=new Map(),shows=[],aliases=[],hooks={};
  let awardBrowser;let quickPicker,quickState=null;
  let picker,preview=null,editorHydrated=false,editing=false;const detailMetadata=new Map();
  function message(text){$('tv-message').textContent=text;}
  function closeStars(){if(picker)picker.hidden=true;$('tv-star-trigger')?.setAttribute('aria-expanded','false');preview=null;}
  function closeEditor(){closeQuick();closeStars();current=null;editorVersion=null;$('tv-editor').close();$('tv-editor').hidden=true;$('tv-rating-form').reset();$('tv-editor').append($('tv-selected-title'),$('tv-selected-meta'));$('tv-detail-read').replaceChildren();}
  function paint(value){picker.querySelectorAll('.star-choice').forEach((b,i)=>b.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,value-i))*100}%`);picker.querySelector('.rating-preview').textContent=value?`${value.toFixed(1)} / 10`:'Not rated';}
  function setRating(value){$('tv-rating').value=value??'';$('tv-star-trigger').innerHTML=value?`★ <span class="value">${value.toFixed(1)}/10</span>`:'☆ <span class="value">Rate</span>';paint(value||0);}
  function initStars(){
    picker=document.createElement('div');picker.className='star-picker';picker.id='tv-star-picker';picker.hidden=true;picker.setAttribute('role','dialog');picker.setAttribute('aria-label','Choose a TV rating');
    picker.innerHTML='<div class="star-choices" role="group" aria-label="Rating out of ten">'+Array.from({length:10},(_,i)=>`<button class="star-choice" type="button" data-star="${i}" aria-label="${i+1} stars"><span class="star-empty">★</span><span class="star-fill">★</span></button>`).join('')+'</div><span class="rating-preview" aria-live="polite"></span><div class="rating-actions"><button type="button" class="action rating-save" hidden>Save</button></div>';
    let pending=null,original=null;const stage=value=>{pending=value;preview=null;paint(value);picker.querySelector('.rating-save').hidden=value===original;};
    $('tv-editor').append(picker);
    $('tv-star-trigger').addEventListener('click',()=>{
      if(!picker.hidden){closeStars();return;}original=Number($('tv-rating').value)||null;pending=original;picker.querySelector('.rating-save').hidden=true;picker.hidden=false;preview=null;paint(pending||0);$('tv-star-trigger').setAttribute('aria-expanded','true');
      const r=$('tv-star-trigger').getBoundingClientRect(),width=Math.min(300,innerWidth-20),height=picker.offsetHeight;
      picker.style.left=Math.max(10,Math.min(innerWidth-width-10,r.left))+'px';picker.style.top=(r.top>height+12?r.top-height-8:Math.max(10,Math.min(innerHeight-height-10,r.bottom+8)))+'px';
      picker.querySelectorAll('.star-choice')[Math.max(0,Math.ceil(Number($('tv-rating').value)||1)-1)].focus();
    });
    const pointer=(e,b)=>Number(b.dataset.star)+(e.clientX-b.getBoundingClientRect().left<b.getBoundingClientRect().width/2?.5:1);
    picker.addEventListener('pointermove',e=>{const b=e.target.closest('[data-star]');if(b){preview=pointer(e,b);paint(preview);}});
    picker.addEventListener('pointerleave',()=>{preview=null;paint(pending||0);});
    picker.addEventListener('click',e=>{const b=e.target.closest('[data-star]');if(b)stage(e.detail===0?(preview??Number(b.dataset.star)+1):pointer(e,b));if(e.target.closest('.rating-save')){setRating(pending);closeStars();$('tv-star-trigger').focus();}});
    picker.addEventListener('keydown',e=>{
      if(e.key==='Escape'){e.preventDefault();e.stopPropagation();closeStars();$('tv-star-trigger').focus();}
      if(['ArrowLeft','ArrowDown','ArrowRight','ArrowUp'].includes(e.key)){e.preventDefault();preview=Math.max(.5,Math.min(10,(preview??(pending||0))+(['ArrowRight','ArrowUp'].includes(e.key)?.5:-.5)));paint(preview);}
      if((e.key==='Enter'||e.key===' ')&&preview!==null&&!e.target.closest('.rating-save')){e.preventDefault();stage(preview);}

    });
    document.addEventListener('pointerdown',e=>{if(!picker.hidden&&!picker.contains(e.target)&&!$('tv-star-trigger').contains(e.target))closeStars();});
    window.addEventListener('scroll',closeStars,{passive:true});window.addEventListener('resize',closeStars);
  }
  function closeQuick(){if(quickState?.saving)return;quickState=null;if(quickPicker)quickPicker.hidden=true;}
  function openQuick(trigger,key){
    if(!user||!ready||busy||loading){message('Sign in and load your ratings to rate this work.');return;}
    if(quickState?.saving)return;
    const work=shows.find(w=>w.id===key);if(!work)return;
    const old=rows.get(key);quickState={key,old:old?{...old}:null,value:Number(old?.rating)||null,original:Number(old?.rating)||null,generation,owner:user.id,saving:false};
    if(!quickPicker){quickPicker=document.createElement('div');quickPicker.id='tv-quick-stars';quickPicker.className='star-picker';quickPicker.setAttribute('role','dialog');quickPicker.setAttribute('aria-label','Rate series or season');
      quickPicker.innerHTML='<p class="rating-popup-title"></p><div class="star-choices">'+Array.from({length:10},(_,i)=>`<button type="button" class="star-choice" data-quick-star="${i}" aria-label="${i+1} stars"><span class="star-empty">★</span><span class="star-fill">★</span></button>`).join('')+'</div><span class="rating-preview" aria-live="polite"></span><div class="rating-actions"><button type="button" class="action rating-save" hidden>Save</button></div><p class="rating-popup-status" role="status"></p>';
      const paintQuick=value=>{quickPicker.querySelectorAll('.star-choice').forEach((b,i)=>b.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,(value||0)-i))*100}%`);quickPicker.querySelector('.rating-preview').textContent=value?value.toFixed(1)+' / 10':'Not rated';};
      const stage=value=>{if(!quickState||quickState.saving)return;quickState.value=value;paintQuick(value);quickPicker.querySelector('.rating-save').hidden=value===quickState.original;};
      const pointer=(e,b)=>Number(b.dataset.quickStar)+(e.clientX-b.getBoundingClientRect().left<b.getBoundingClientRect().width/2?.5:1);
      quickPicker.addEventListener('pointermove',e=>{const b=e.target.closest('[data-quick-star]');if(b&&quickState&&!quickState.saving)paintQuick(pointer(e,b));});
      quickPicker.querySelector('.star-choices').addEventListener('pointerleave',()=>{if(quickState)paintQuick(quickState.value);});
      quickPicker.addEventListener('click',e=>{const b=e.target.closest('[data-quick-star]');if(b)stage(e.detail===0?Number(b.dataset.quickStar)+1:pointer(e,b));if(e.target.closest('.rating-save'))saveQuick();});
      quickPicker.addEventListener('keydown',e=>{if(e.key==='Escape'){e.preventDefault();e.stopPropagation();closeQuick();}if(['ArrowLeft','ArrowDown','ArrowRight','ArrowUp'].includes(e.key)){e.preventDefault();stage(Math.max(.5,Math.min(10,(quickState?.value||0)+(['ArrowRight','ArrowUp'].includes(e.key)?.5:-.5))));}});
      document.addEventListener('pointerdown',e=>{if(quickState&&!quickPicker.contains(e.target)&&!e.target.closest('[data-tv-edit]'))closeQuick();});
      window.addEventListener('resize',closeQuick);window.addEventListener('scroll',closeQuick,{passive:true});
    }
    ($('tv-editor').open?$('tv-editor'):document.body).append(quickPicker);quickPicker.hidden=false;
    quickPicker.querySelector('.rating-popup-title').textContent=work.series_kind==='season'?work.title:'Whole series · '+work.title;
    quickPicker.querySelector('.rating-popup-status').textContent='';quickPicker.querySelector('.rating-save').hidden=true;quickPicker.querySelectorAll('button').forEach(b=>b.disabled=false);
    quickPicker.querySelectorAll('.star-choice').forEach((b,i)=>b.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,(quickState.value||0)-i))*100}%`);quickPicker.querySelector('.rating-preview').textContent=quickState.value?quickState.value.toFixed(1)+' / 10':'Not rated';
    const r=trigger.getBoundingClientRect(),height=quickPicker.offsetHeight,width=Math.min(300,innerWidth-20);quickPicker.style.left=Math.max(10,Math.min(innerWidth-width-10,r.left))+'px';quickPicker.style.top=Math.max(10,Math.min(innerHeight-height-10,r.top>=height+12?r.top-height-8:r.bottom+8))+'px';
  }
  async function saveQuick(){
    const draft=quickState;if(!draft||draft.saving||!validRating(draft.value)||draft.value===draft.original)return;
    draft.saving=true;quickPicker.querySelectorAll('button').forEach(b=>b.disabled=true);quickPicker.querySelector('.rating-popup-status').textContent='Saving…';
    try{await checkSession(draft.generation);if(user.id!==draft.owner)throw Error('Your account changed. Reopen the rating popup.');
      const old=draft.old;
      const {data,error}=await client.rpc('save_tv_rating',{p_work_key:draft.key,p_rating:draft.value,p_scope:old?.rating_scope||'whole_work',p_notes:old?.notes||'',p_watched_date:old?.watched_date||null,p_expected_updated_at:old?.updated_at||null});if(error)throw error;
      if(generation!==draft.generation)return;rows.set(draft.key,data);draft.saving=false;closeQuick();render();if(current&&!editing){renderDetails();editorVersion=rows.get(current.id)?.updated_at||null;}message('TV rating saved to your account.');
    }catch(error){if(quickState===draft)quickPicker.querySelector('.rating-popup-status').textContent=error.message||'Could not save rating.';}
    finally{draft.saving=false;if(quickPicker)quickPicker.querySelectorAll('button').forEach(b=>b.disabled=false);}
  }
  async function readAll(table,fields,owner){
    const result=[];
    for(let offset=0;;offset+=500){
      let query=client.from(table).select(fields).eq('user_id',owner);
      if(table==='film_progress')query=query.in('film_id',aliases.map(a=>Number(a.work_key.split(':')[1])));
      const {data,error}=await query.order(table==='tv_progress'?'work_key':'film_id',{ascending:true}).range(offset,offset+499);
      if(error)throw error;result.push(...data);if(data.length<500)return result;
    }
  }
  async function setSession(nextUser){
    const changed=user?.id!==nextUser?.id;
    user=nextUser||null;const version=++generation;ready=false;loading=!!user;
    if(changed){if(quickState)quickState.saving=false;closeQuick();closeEditor();rows=new Map();linked=new Map();closeStars();current=null;editorVersion=null;$('tv-editor').hidden=true;$('tv-rating-form').reset();}
    render();
    if(!user){message('Sign in using your account menu to save and import TV ratings.');return;}
    if(!client){loading=false;message('Cloud connection is unavailable.');render();return;}
    message('Loading TV ratings…');
    const results=await Promise.allSettled([readAll('tv_progress','work_key,rating,rating_scope,notes,watched_date,updated_at',user.id),readAll('film_progress','film_id,rating',user.id)]);
    if(version!==generation)return;
    loading=false;
    if(results[1].status==='fulfilled')linked=new Map(results[1].value.map(p=>['movie:'+p.film_id,p]));
    if(results[0].status==='fulfilled'){rows=new Map(results[0].value.map(p=>[p.work_key,p]));ready=true;message(results[1].status==='fulfilled'?'TV ratings synced.':'TV ratings synced; linked film ratings could not be loaded. Choose Refresh to try again.');}
    else message('TV rating storage is unavailable. Run the TV setup SQL from the PR, then choose Refresh.');
    render();window.CultureRouter?.refresh();
  }
  async function checkSession(version){
    const {data,error}=await client.auth.getSession();
    if(error||version!==generation||!user||data?.session?.user?.id!==user.id)throw Error('Your account changed. Refresh TV ratings before continuing.');
  }
  function children(work){return shows.filter(s=>s.series_kind==='season'&&work.id==='tv:'+s.tmdb_id).sort((a,b)=>a.season_number-b.season_number);}
  function hasRating(work){return rows.has(work.id)||children(work).some(s=>rows.has(s.id));}
  function seasonControls(work){
    const seasons=children(work),rated=seasons.filter(s=>rows.has(s.id));
    if(!seasons.length)return '';
    return `<details class="tv-seasons"><summary>Seasons · ${rated.length} rated</summary>${seasons.filter(s=>tab!=='ratings'||rows.has(s.id)).map(s=>`<div class="tv-season-row"><button type="button" class="action tv-season-button" data-tv-edit="${s.id}" ${!user||loading||busy||!ready?'disabled':''}>Season ${s.season_number}${rows.has(s.id)?' · ★ '+Number(rows.get(s.id).rating).toFixed(1)+'/10':' · Rate'}</button><span class="meta">${escape(s.scope_label||'')}</span></div>`).join('')}</details>`;
  }
  function card(w,entry){
      w={...window.CultureTVAwards?.details(w.id),...w};
      const p=(w.linked?linked:rows).get(w.id),rating=Number(p?.rating)||0;
      const poster=typeof w.poster_path==='string'&&/^\/[A-Za-z0-9._-]+$/.test(w.poster_path)?'https://image.tmdb.org/t/p/w342'+w.poster_path:null;
      const names=[...(w.directors?.length?w.directors:w.creators||[]).map(p=>p.name),...(w.credit_names||[])];
      const credits=names.slice(0,3).join(', ')+(names.length>3?' +'+(names.length-3):'');
      const cast=(w.cast||[]).map(p=>typeof p==='string'?p:p.name).filter(Boolean).slice(0,3).join(', ');
      return `<article class="film ${entry?.winner?'award-winner':''} ${rating||(!w.linked&&hasRating(w))?'watched':''}" tabindex="0" role="button" aria-label="View details for ${escape(w.title)}" data-tv-work="${escape(w.id)}"><div class="poster">${poster?`<img loading="lazy" alt="Poster for ${escape(w.title)}" src="${escape(poster)}">`:`<span class="initial">${escape(w.title[0])}</span>`}${entry?`<span class="award-entry-label award-entry-badge">${entry.winner?'★ Winner':'Nominee'}</span>`:''}<span class="tier">${escape(w.tmdb_media_type==='movie'?'Documentary programme':kinds[w.series_kind])}</span></div><div class="body"><h3>${w.linked?escape(w.title):`<a href="${window.CultureRoutes?.format(window.CultureRoutes.tvRoute(w.id))||'#'}">${escape(entry?.display_title||w.title)}</a>`}</h3><div class="meta">${escape(credits)}${credits?' · ':''}${escape(w.year)}</div>${cast?`<div class="cast">${escape(cast)}</div>`:''}${entry?`<div class="recognition">${escape(entry.winner?'Winner':'Nominee')} · ${escape(entry.category_name)} · ${escape(entry.award_year||2025)}</div><p class="meta">${w.tmdb_media_type==='movie'?'Programme rating':'Series rating'+(children(w).length?' · seasons in Details':'')}</p>`:w.recognition?`<div class="recognition">${escape(w.recognition)}</div>`:''}<div class="controls">${w.linked?`<button class="star-trigger" type="button" data-linked-film="${w.id.split(':')[1]}">${rating?'★ '+rating.toFixed(1)+'/10':'☆ Rate'}</button>`:`<button type="button" class="star-trigger" data-tv-edit="${w.id}" aria-label="Edit personal rating for ${escape(w.title)}">${rating?'★ <span class="value">'+rating.toFixed(1)+'/10</span>':'☆ <span class="value">Rate</span>'}</button>`}</div></div></article>`;

  }
  function render(){
    $('tv-view').querySelector('.hero h1').textContent=tab==='awards'?'Television awards.':'Television worth keeping.';
    $('tv-view').querySelector('.hero p').textContent=tab==='awards'?'Explore winning and nominated programmes. Your series and season ratings stay separate.':'Rate TV works and keep notes about the seasons or parts you watched.';
    const query=$('tv-search').value.toLocaleLowerCase(),kind=$('tv-kind').value;
    const all=[...shows,...aliases.map(a=>({...a,id:a.work_key,linked:true}))];
    const visible=all.filter(w=>(kind==='season'||w.series_kind!=='season'||!shows.some(p=>p.id==='tv:'+w.tmdb_id))&&(!kind||w.series_kind===kind)&&(!query||(w.title+' '+(w.original_title||'')+' '+(w.directors||[]).map(p=>p.name).join(' ')+' '+(w.creators||[]).map(p=>p.name).join(' ')+' '+(w.credit_names||[]).join(' ')).toLocaleLowerCase().includes(query))&&(tab!=='ratings'||(w.linked?linked.has(w.id)&&validRating(Number(linked.get(w.id).rating)):hasRating(w))));
    const sort=$('tv-sort').value;visible.sort((a,b)=>sort==='title'?a.title.localeCompare(b.title):sort==='year'?b.year-a.year:((Number((b.linked?linked:rows).get(b.id)?.rating)||0)-(Number((a.linked?linked:rows).get(a.id)?.rating)||0)||a.title.localeCompare(b.title)));
    const tvCount=shows.filter(w=>rows.has(w.id)).length,linkedCount=aliases.filter(w=>validRating(Number(linked.get(w.work_key)?.rating))).length;
    $('tv-count').textContent=`${tvCount} TV ratings · ${linkedCount} linked film ratings · ${visible.length} works shown`;
    $('tv-grid').innerHTML=visible.map(w=>card(w)).join('');
    $('tv-tools').hidden=tab==='awards';
    $('tv-list-view').hidden=tab==='awards';$('tv-awards-view').hidden=tab!=='awards';
    if(tab==='awards')awardBrowser?.render();
    $('tv-empty').hidden=visible.length>0;
    for(const id of ['tv-import','tv-import-button','tv-export'])$(id).disabled=!user||loading||busy||!ready;
    $('tv-refresh').disabled=loading||busy;$('tv-detail-edit').disabled=busy||loading||!user||!ready;
    for(const el of $('tv-rating-form').elements)el.disabled=busy||loading||!ready||!user;
  }
  function choose(key){
    if(busy)return;
    if(window.CultureRouter?.openTV(key))return;
    const w=shows.find(w=>w.id===key);if(!w)return;current=w;showDetails();
  }
  function editMode(value){
    editing=value;closeStars();$('tv-rating-form').hidden=!value;
    $('tv-detail-edit').textContent=value?'Save':'Edit';$('tv-detail-edit').classList.toggle('detail-save',value);
    $('tv-detail-edit').disabled=busy||loading||!user||!ready;
    const personal=$('tv-detail-read').querySelector('[data-personal]');if(personal)personal.hidden=value;
  }
  function renderDetails(){
    if(!current)return;const w={...window.CultureTVAwards?.details(current.id),...current},p=rows.get(w.id);
    const titleNode=$('tv-selected-title'),metaNode=$('tv-selected-meta');
    const poster=typeof w.poster_path==='string'&&/^\/[A-Za-z0-9._-]+$/.test(w.poster_path)?'https://image.tmdb.org/t/p/w500'+w.poster_path:null;
    const cast=(w.cast||[]).map(p=>typeof p==='string'?p:p.name).filter(Boolean).join(', ');
    $('tv-detail-read').innerHTML=`<div class="film-detail-layout"><div>${poster?`<img class="film-detail-poster" src="${escape(poster)}" alt="Poster for ${escape(w.title)}">`:'<div class="detail-poster-empty">Poster unavailable</div>'}</div><div><h3>Synopsis</h3><p>${escape(w.overview||'Synopsis unavailable.')}</p>${w.scope_label?`<p class="meta">${escape(w.scope_label)}</p>`:''}${cast?`<h3>Cast</h3><p>${escape(cast)}</p>`:''}<h3>Awards</h3><p class="meta">${escape([w.recognition,...(window.CultureTVAwards?.recognitions(w.id)||[])].filter(Boolean).join(' · ')||'No recorded awards.')}</p><h3>Website ratings & links</h3>${typeof w.tmdb_rating==='number'&&w.tmdb_rating>0?`<p class="meta">TMDB: ${escape(w.tmdb_rating.toFixed(1))}/10</p>`:''}<div class="sources">${sourceLinks(w)}</div><div data-personal ${editing?'hidden':''}><h3>Your rating</h3><p class="detail-rating">${p?'★ '+Number(p.rating).toFixed(1)+'/10':'Not rated yet'}</p><p class="meta">${escape(p?.rating_scope==='whole_work'?wholeScope(w):scopes[p?.rating_scope]||'Scope not specified')}${p?.watched_date?' · Watched '+escape(p.watched_date):''}</p><h3>Your notes</h3><p class="detail-notes">${escape(p?.notes||'No notes yet.')}</p></div><h3>Critics’ reviews</h3><p class="meta">No verified critic reviews yet.</p>${seasonControls(w)}</div></div>`;
    $('tv-detail-read').querySelector('.film-detail-layout>div:last-child').prepend(titleNode,metaNode);
  }
  function showDetails(){
    const w=current,key=w.id;editorHydrated=!!(ready&&user);
    $('tv-selected-meta').textContent=[w.year,kinds[w.series_kind],w.scope_label,...(w.directors?.length?w.directors:w.creators||[]).map(p=>p.name)].filter(Boolean).join(' · ');
    const parent=w.series_kind==='season'?shows.find(p=>p.id==='tv:'+w.tmdb_id):w;
    const targets=parent?[parent,...children(parent)]:[w];
    $('tv-target-label').hidden=targets.length<2;
    $('tv-target').innerHTML=targets.map(t=>`<option value="${escape(t.id)}">${t.series_kind==='season'?'Season '+t.season_number:'Whole series'}</option>`).join('');$('tv-target').value=w.id;
    $('tv-scope').querySelector('[value="whole_work"]').textContent=wholeScope(w);
    const p=rows.get(key);editorVersion=p?.updated_at||null;$('tv-editor').hidden=false;$('tv-selected-title').textContent=w.title;$('tv-scope').value=p?.rating_scope||(w.series_kind==='season'?'whole_work':'unspecified');$('tv-notes').value=p?.notes||'';$('tv-date').value=p?.watched_date||'';setRating(Number(p?.rating)||null);$('tv-remove').hidden=!p;$('tv-editor-status').textContent='';if(!$('tv-editor').open)$('tv-editor').showModal();renderDetails();editMode(false);
    if(user&&w.tmdb_id&&!detailMetadata.has(key)&&window.CultureMedia?.details){const version=generation;detailMetadata.set(key,true);window.CultureMedia.details(w.tmdb_media_type==='movie'?'movie':'tv',w.tmdb_id,w.series_kind==='season'?w.season_number:null).then(data=>{if(version!==generation)return;if(data.metadata?.overview)w.overview=data.metadata.overview;if(Array.isArray(data.metadata?.cast))w.cast=data.metadata.cast;if(typeof data.metadata?.tmdb_rating==='number')w.tmdb_rating=data.metadata.tmdb_rating;render();if(current?.id===key)renderDetails();}).catch(()=>{detailMetadata.delete(key);});}
    for(const el of $('tv-rating-form').elements)el.disabled=busy||loading||!ready||!user;
    if(!user)$('tv-editor-status').textContent='Sign in using Account to rate this work.';
  }
  async function save(event){
    event.preventDefault();if(!current||busy||loading||!user||!ready)return;
    const rating=Number($('tv-rating').value);if(!validRating(rating)){$('tv-editor-status').textContent='Choose a half-point star rating from 0.5 to 10.';return;}
    const version=generation,work=current.id,expectedVersion=editorVersion,scope=$('tv-scope').value,notes=$('tv-notes').value,date=$('tv-date').value||null;
    if(!Object.hasOwn(scopes,scope)||notes.length>10000||!validDate(date))return;
    busy=true;render();
    try{
      await checkSession(version);
      const {data,error}=await client.rpc('save_tv_rating',{p_work_key:work,p_rating:rating,p_scope:scope,p_notes:notes,p_watched_date:date,p_expected_updated_at:expectedVersion});
      if(error)throw error;if(version!==generation)return;
      rows.set(work,data);editorVersion=data.updated_at;renderDetails();editMode(false);$('tv-editor-status').textContent='Saved to your account.';message('TV rating saved to your account.');
    }catch(error){if(version===generation)$('tv-editor-status').textContent=error.message||'TV rating could not be saved.';}
    finally{busy=false;render();}
  }
  async function remove(){
    if(!current||busy||!user)return;const work=current.id,old=rows.get(work);if(!old||!confirm('Remove your TV rating and notes for '+current.title+'?'))return;
    const version=generation;busy=true;render();
    try{await checkSession(version);const {error}=await client.rpc('remove_tv_rating',{p_work_key:work,p_expected_updated_at:editorVersion});if(error)throw error;if(version!==generation)return;rows.delete(work);closeEditor();window.CultureRouter?.closeDetail('tv');message('TV rating removed.');}
    catch(error){if(version===generation)$('tv-editor-status').textContent=error.message||'Could not remove TV rating.';}
    finally{busy=false;render();}
  }
  async function importFile(event){
    const file=event.target.files?.[0];if(!file||busy||!user||!ready)return;
    if(file.size>2000000){message('TV import file is too large.');event.target.value='';return;}
    const owner=user.id;let version=generation;
    try{
      const proposal=validateImport(JSON.parse(await file.text()),shows);
      if(version!==generation)throw Error('Your account changed. Refresh before importing.');
      await setSession(user);if(user?.id!==owner)throw Error('Your account changed. Refresh before importing.');version=generation;if(!ready)throw Error('TV ratings could not be refreshed. Nothing imported.');
      const summary=previewImport(proposal.ratings,rows),cycle=rows.get('tv:42699');
      if(proposal.replace&&cycle&&(Number(cycle.rating)!==10||cycle.rating_scope!=='whole_work'))throw Error('The existing Dekalog rating differs. Review it before correcting the episode assignment.');
      const corrections=proposal.corrections.flatMap(c=>{
        const old=rows.get(c.work_key);
        if(old&&Number(old.rating)===c.rating)return [];
        if(!old||Number(old.rating)!==c.expected_rating||!old.updated_at)throw Error('A reviewed rating changed. Nothing imported; review the correction again.');
        return [{...c,expected_updated_at:old.updated_at}];
      });
      const reviewed=corrections.length?' Reviewed score changes: '+corrections.map(c=>(shows.find(w=>w.id===c.work_key)?.title||c.work_key)+' '+c.expected_rating.toFixed(1)+' → '+c.rating.toFixed(1)).join('; ')+'. Existing notes, scope and dates are retained.':'';
      const correction=proposal.replace?' Also replace the mistaken Decalogue V film assignment only after verifying the whole-cycle Dekalog 10.0.':'';
      if(!summary.missing&&!proposal.replace&&!corrections.length){message(`Nothing to import: ${summary.existing} already present; ${summary.conflicts} differ and were preserved.`);return;}
      if(!confirm(`TV import preview: ${proposal.ratings.length} input; ${summary.missing} missing; ${summary.existing} existing; ${summary.conflicts} differing. Existing rows are preserved except the explicitly reviewed score changes.${reviewed}${correction} Proceed?`))return;
      busy=true;render();await checkSession(version);
      const {data,error}=await (corrections.length?client.rpc('import_tv_ratings_reviewed',{p_entries:proposal.ratings,p_rating_corrections:corrections}):client.rpc('import_tv_ratings',{p_entries:proposal.ratings,p_replace_dekalog:proposal.replace}));if(error)throw error;if(version!==generation)return;
      await setSession(user);
      if(data.dekalog_episode_removed)await hooks.onFilmProgressChanged?.();
      message(`Imported ${data.inserted_keys.length} TV ratings; ${data.skipped_existing-(data.corrected_keys?.length||0)} existing ratings preserved.${data.corrected_keys?.length?' Applied '+data.corrected_keys.length+' reviewed score correction(s).':''}${data.dekalog_episode_removed?' Replaced the mistaken Decalogue V assignment with the whole-cycle Dekalog rating.':''}`);
    }catch(error){if(version===generation)message(error.message||'TV import could not be confirmed. Refresh before retrying.');}
    finally{busy=false;event.target.value='';render();}
  }
  function exportFile(){
    if(!user||!ready)return;
    const data={format:'culture-atlas-tv-progress-v1',ratings:[...rows.values()].map(p=>({work_key:p.work_key,rating:Number(p.rating),rating_scope:p.rating_scope,notes:p.notes,watched_date:p.watched_date??null})),replace_dekalog_episode:false};
    const url=URL.createObjectURL(new Blob([JSON.stringify(data,null,2)+'\n'],{type:'application/json'})),a=document.createElement('a');a.href=url;a.download='culture-atlas-tv-ratings.json';a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);
  }
  function init(supabaseClient,callbacks={}){
    client=supabaseClient;hooks=callbacks;shows=[...(window.CULTURE_TV_CATALOG||[])];aliases=window.CULTURE_TV_FILM_ALIASES||[];
    window.CULTURE_WORK_IDENTITIES.createRegistry(window.CULTURE_CATALOG||[],shows,aliases);
    const section=document.createElement('section');section.id='tv-view';section.hidden=true;section.setAttribute('aria-label','TV Series');
    section.innerHTML=`<div class="hero"><div class="eyebrow">Series and miniseries</div><h1>Television worth keeping.</h1><p>Rate TV works and keep notes about the seasons or parts you watched.</p></div><nav class="film-subnav" aria-label="TV sections"><button type="button" class="film-subtab active" data-tv-tab="catalogue" aria-pressed="true">Catalogue</button><button type="button" class="film-subtab" data-tv-tab="ratings" aria-pressed="false">My ratings</button><button type="button" class="film-subtab" data-tv-tab="awards" aria-pressed="false">Awards</button></nav><p id="tv-message" class="meta" role="status" aria-live="polite"></p><div id="tv-tools" class="tv-tools"><button id="tv-refresh" type="button" class="action">Refresh</button><button id="tv-export" type="button" class="action" disabled>Export TV ratings</button><button id="tv-import-button" type="button" class="action" disabled>Import TV ratings</button><input id="tv-import" type="file" accept=".json,application/json" hidden disabled></div><dialog id="tv-editor" class="tv-editor media-detail-dialog" aria-labelledby="tv-selected-title" hidden><div class="detail-toolbar"><button id="tv-detail-edit" type="button" class="action">Edit</button><button id="tv-detail-close" type="button" class="action">Close ×</button></div><h2 id="tv-selected-title"></h2><p id="tv-selected-meta" class="meta"></p><div id="tv-detail-read"></div><form id="tv-rating-form" hidden><label id="tv-target-label" hidden>Rate series or season<select id="tv-target"></select></label><input id="tv-rating" type="hidden"><div class="star-control"><button id="tv-star-trigger" class="star-trigger" type="button" aria-label="Set personal TV rating" aria-haspopup="dialog" aria-controls="tv-star-picker" aria-expanded="false">☆ <span class="value">Rate</span></button></div><div class="filters"><label>Rating covers<select id="tv-scope"><option value="unspecified">Seasons or parts not specified</option><option value="whole_work">Whole work / series</option></select></label><label>Watched date (optional)<input id="tv-date" type="date"></label></div><label for="tv-notes">Your notes</label><textarea id="tv-notes" maxlength="10000" placeholder="Seasons, parts, or your thoughts…"></textarea><div class="tv-tools"><button type="submit" class="action" hidden>Save TV rating</button><button id="tv-cancel" class="action" type="button">Cancel</button><button id="tv-remove" class="action" type="button" hidden>Remove TV rating</button></div></form><p id="tv-editor-status" class="meta" role="status"></p></dialog><div id="tv-list-view"><div class="filters"><input id="tv-search" type="search" aria-label="Search TV works" placeholder="Search titles, creators or directors…"><select id="tv-kind" aria-label="TV kind"><option value="">All TV works</option><option value="series">Series</option><option value="miniseries">Miniseries</option><option value="season">Seasons</option><option value="episode">TV installments</option><option value="opening">Opening sequences</option><option value="unknown">Other TV works</option></select><select id="tv-sort" aria-label="Sort TV works"><option value="year">Year newest first</option><option value="rating">Highest rated first</option><option value="title">Title A–Z</option></select></div><p id="tv-count" class="count"></p><div id="tv-grid" class="grid"></div><p id="tv-empty" class="empty" hidden>No TV works match these filters.</p></div><section id="tv-awards-view" hidden aria-label="TV awards"><nav id="tv-award-tabs" class="award-tabs" aria-label="TV awards"></nav><div class="award-edition-bar"><h2 id="tv-award-edition-title"></h2><nav id="tv-award-year-nav" class="award-year-nav" aria-label="TV award editions"></nav></div><nav id="tv-award-years" class="award-years" aria-label="Available TV award years"></nav><div hidden><select id="tv-award-event" aria-label="TV award"></select><select id="tv-award-year" aria-label="TV award year"></select><select id="tv-award-category" aria-label="TV award category"></select><select id="tv-award-filter" aria-label="TV award result"><option value="all">All nominees</option><option value="winners">Winners only</option></select></div><p id="tv-awards-count" class="count"></p><p id="tv-awards-event-details" class="meta" aria-live="polite"></p><div id="tv-awards-grid"></div><p id="tv-awards-source" class="meta"></p></section>`;
    document.querySelector('main').append(section);initStars();
    if(window.CultureTVAwards){awardBrowser=window.CultureTVAwards.create({getWork:id=>shows.find(w=>w.id===id),renderCard:card});awardBrowser.configure();awardBrowser.configureCategories();}
    for(const id of ['tv-award-event','tv-award-year'])$(id).addEventListener('change',()=>{awardBrowser?.configureCategories();render();});
    for(const id of ['tv-award-category','tv-award-filter'])$(id).addEventListener('change',render);
    $('tv-detail-edit').addEventListener('click',()=>{if(busy)return;if(editing)$('tv-rating-form').requestSubmit();else editMode(true);});
    $('tv-editor').addEventListener('cancel',e=>{e.preventDefault();if(!busy){closeEditor();window.CultureRouter?.closeDetail('tv');}});
    $('tv-editor').addEventListener('scroll',closeStars,{passive:true});
    section.addEventListener('keydown',e=>{if(['Enter',' '].includes(e.key)&&e.target.matches('article[data-tv-work]')){e.preventDefault();const key=e.target.dataset.tvWork;if(key.startsWith('movie:'))hooks.onOpenFilm?.(Number(key.split(':')[1]));else choose(key);}});
    $('tv-detail-close').addEventListener('click',()=>{closeEditor();window.CultureRouter?.closeDetail('tv');});
    $('tv-target').addEventListener('change',()=>choose($('tv-target').value));
    $('tv-rating-form').addEventListener('submit',save);$('tv-cancel').addEventListener('click',()=>{if(!busy&&current)showDetails();});$('tv-remove').addEventListener('click',remove);
    $('tv-search').addEventListener('input',render);$('tv-kind').addEventListener('change',render);$('tv-sort').addEventListener('change',render);$('tv-import').addEventListener('change',importFile);$('tv-import-button').addEventListener('click',()=>$('tv-import').click());$('tv-export').addEventListener('click',exportFile);$('tv-refresh').addEventListener('click',()=>setSession(user));
    section.addEventListener('click',e=>{
      const button=e.target.closest('[data-tv-tab]');if(button){tab=button.dataset.tvTab;closeEditor();section.querySelectorAll('[data-tv-tab]').forEach(b=>{b.classList.toggle('active',b===button);b.setAttribute('aria-pressed',String(b===button));});render();return;}
      const edit=e.target.closest('[data-tv-edit]');if(edit){openQuick(edit,edit.dataset.tvEdit);return;}
      const card=e.target.closest('article[data-tv-work]');if(card&&!e.target.closest('a,button')){if(card.dataset.tvWork.startsWith('movie:'))hooks.onOpenFilm?.(Number(card.dataset.tvWork.split(':')[1]));else choose(card.dataset.tvWork);}
      const link=e.target.closest('[data-linked-film]');if(link)hooks.onOpenFilm?.(Number(link.dataset.linkedFilm));
    });
    section.addEventListener('error',e=>{if(e.target.tagName==='IMG')e.target.hidden=true;},true);
    // Registered after the existing Books navigation handler; final visibility
    // handles all three sections without changing the Books module.
    for(const button of document.querySelectorAll('[data-section]'))button.addEventListener('click',()=>{
      const name=button.dataset.section;closeEditor();$('cinema-area').hidden=name!=='films';$('books-view').hidden=name!=='books';section.hidden=name!=='tv';document.title='Culture Atlas · '+({films:'Films',books:'Books',tv:'TV Series'}[name]||'Films');
    });
    render();message('Sign in using your account menu to save and import TV ratings.');
  }
  window.CultureTV={init,setSession,validRating,validateImport,previewImport,route:{choose,closeEditor,awardCategories:()=>awardBrowser?.configureCategories(),needsHydration:()=>!!(current&&!editorHydrated&&ready&&user),has:key=>shows.some(w=>w.id===key),title:()=>current?.title,switchTab:value=>{tab=value;document.querySelectorAll('[data-tv-tab]').forEach(b=>{b.classList.toggle('active',b.dataset.tvTab===value);b.setAttribute('aria-pressed',String(b.dataset.tvTab===value));});render();}},setCatalogue:extra=>{const known=new Set(shows.map(w=>w.id));for(const w of extra)if(!known.has(w.id)){shows.push(w);known.add(w.id);}render();}};
})();

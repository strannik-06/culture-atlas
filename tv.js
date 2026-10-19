/* TV ratings: reviewed work identities; private progress; explicit, insert-only imports. */
(() => {
  'use strict';
  const $=id=>document.getElementById(id);
  const escape=value=>String(value??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const scopes={whole_work:'Whole work / series',unspecified:'Seasons or parts not specified'};
  const kinds={series:'Series',miniseries:'Miniseries',unknown:'TV work'};
  const validRating=n=>typeof n==='number'&&Number.isFinite(n)&&n>=.5&&n<=10&&Number.isInteger(n*2);
  const validDate=s=>s===null||(typeof s==='string'&&/^\d{4}-\d{2}-\d{2}$/.test(s)&&Number.isFinite(Date.parse(s+'T00:00:00Z'))&&new Date(s+'T00:00:00Z').toISOString().slice(0,10)===s);
  function validateImport(input,catalogue) {
    if(input?.format!=='culture-atlas-tv-progress-v1'||!Array.isArray(input.ratings)||input.ratings.length<1||input.ratings.length>500)throw Error('Choose a Culture Atlas TV ratings file with 1–500 entries.');
    if(input.replace_dekalog_episode!==undefined&&typeof input.replace_dekalog_episode!=='boolean')throw Error('Invalid Dekalog correction flag.');
    const known=new Set(catalogue.map(w=>w.id)),seen=new Set();
    const ratings=input.ratings.map(p=>{
      if(!p||!known.has(p.work_key)||seen.has(p.work_key)||!validRating(p.rating)||!Object.hasOwn(scopes,p.rating_scope)||typeof p.notes!=='string'||p.notes.length>10000||!validDate(p.watched_date??null))throw Error('Unknown, duplicate or invalid TV rating. No changes made.');
      seen.add(p.work_key);
      return {work_key:p.work_key,rating:p.rating,rating_scope:p.rating_scope,notes:p.notes,watched_date:p.watched_date??null};
    });
    const replace=Boolean(input.replace_dekalog_episode);
    if(replace&&!ratings.some(p=>p.work_key==='tv:42699'&&p.rating===10&&p.rating_scope==='whole_work'))throw Error('The Dekalog correction requires the whole-cycle 10.0 rating in this file.');
    return {ratings,replace};
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
  let picker,preview=null;
  function message(text){$('tv-message').textContent=text;}
  function closeStars(){if(picker)picker.hidden=true;$('tv-star-trigger')?.setAttribute('aria-expanded','false');preview=null;}
  function closeEditor(){closeStars();current=null;editorVersion=null;$('tv-editor').hidden=true;$('tv-rating-form').reset();}
  function paint(value){picker.querySelectorAll('.star-choice').forEach((b,i)=>b.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,value-i))*100}%`);picker.querySelector('.rating-preview').textContent=value?`${value.toFixed(1)} / 10`:'Not rated';}
  function setRating(value){$('tv-rating').value=value??'';$('tv-star-trigger').innerHTML=value?`★ <span class="value">${value.toFixed(1)}/10</span>`:'☆ <span class="value">Rate</span>';paint(value||0);}
  function initStars(){
    picker=document.createElement('div');picker.className='star-picker';picker.id='tv-star-picker';picker.hidden=true;picker.setAttribute('role','dialog');picker.setAttribute('aria-label','Choose a TV rating');
    picker.innerHTML='<div class="star-choices" role="group" aria-label="Rating out of ten">'+Array.from({length:10},(_,i)=>`<button class="star-choice" type="button" data-star="${i}" aria-label="${i+1} stars"><span class="star-empty">★</span><span class="star-fill">★</span></button>`).join('')+'</div><span class="rating-preview" aria-live="polite"></span>';
    document.body.append(picker);
    $('tv-star-trigger').addEventListener('click',()=>{
      if(!picker.hidden){closeStars();return;}picker.hidden=false;preview=null;paint(Number($('tv-rating').value)||0);$('tv-star-trigger').setAttribute('aria-expanded','true');
      const r=$('tv-star-trigger').getBoundingClientRect(),width=Math.min(300,innerWidth-20),height=picker.offsetHeight;
      picker.style.left=Math.max(10,Math.min(innerWidth-width-10,r.left))+'px';picker.style.top=(r.top>height+12?r.top-height-8:Math.max(10,Math.min(innerHeight-height-10,r.bottom+8)))+'px';
      picker.querySelectorAll('.star-choice')[Math.max(0,Math.ceil(Number($('tv-rating').value)||1)-1)].focus();
    });
    const pointer=(e,b)=>Number(b.dataset.star)+(e.clientX-b.getBoundingClientRect().left<b.getBoundingClientRect().width/2?.5:1);
    picker.addEventListener('pointermove',e=>{const b=e.target.closest('[data-star]');if(b){preview=pointer(e,b);paint(preview);}});
    picker.addEventListener('pointerleave',()=>{preview=null;paint(Number($('tv-rating').value)||0);});
    picker.addEventListener('click',e=>{const b=e.target.closest('[data-star]');if(!b)return;setRating(e.detail===0?(preview??Number(b.dataset.star)+1):pointer(e,b));closeStars();$('tv-star-trigger').focus();});
    picker.addEventListener('keydown',e=>{
      if(e.key==='Escape'){e.preventDefault();closeStars();$('tv-star-trigger').focus();}
      if(['ArrowLeft','ArrowDown','ArrowRight','ArrowUp'].includes(e.key)){e.preventDefault();preview=Math.max(.5,Math.min(10,(preview??(Number($('tv-rating').value)||0))+(['ArrowRight','ArrowUp'].includes(e.key)?.5:-.5)));paint(preview);}
      if((e.key==='Enter'||e.key===' ')&&preview!==null){e.preventDefault();setRating(preview);closeStars();$('tv-star-trigger').focus();}
      if(e.key==='Tab')closeStars();
    });
    document.addEventListener('pointerdown',e=>{if(!picker.hidden&&!picker.contains(e.target)&&!$('tv-star-trigger').contains(e.target))closeStars();});
    window.addEventListener('scroll',closeStars,{passive:true});window.addEventListener('resize',closeStars);
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
    if(changed){rows=new Map();linked=new Map();closeEditor();}
    render();
    if(!user){message('Sign in using your account menu to save and import TV ratings.');return;}
    if(!client){loading=false;message('Cloud connection is unavailable.');render();return;}
    message('Loading TV ratings…');
    const results=await Promise.allSettled([readAll('tv_progress','work_key,rating,rating_scope,notes,watched_date,updated_at',user.id),readAll('film_progress','film_id,rating',user.id)]);
    if(version!==generation)return;
    loading=false;
    if(results[1].status==='fulfilled')linked=new Map(results[1].value.map(p=>['movie:'+p.film_id,p]));
    if(results[0].status==='fulfilled'){rows=new Map(results[0].value.map(p=>[p.work_key,p]));ready=true;message(results[1].status==='fulfilled'?'TV ratings synced. Historical imports never overwrite an existing TV rating.':'TV ratings synced; linked film ratings could not be loaded. Choose Refresh to try again.');}
    else message('TV rating storage is unavailable. Run the TV setup SQL from the PR, then choose Refresh.');
    render();
  }
  async function checkSession(version){
    const {data,error}=await client.auth.getSession();
    if(error||version!==generation||!user||data?.session?.user?.id!==user.id)throw Error('Your account changed. Refresh TV ratings before continuing.');
  }
  function render(){
    const query=$('tv-search').value.toLocaleLowerCase(),kind=$('tv-kind').value;
    const all=[...shows,...aliases.map(a=>({...a,id:a.work_key,linked:true}))];
    const visible=all.filter(w=>(!kind||w.series_kind===kind)&&(!query||(w.title+' '+(w.original_title||'')+' '+(w.directors||[]).map(p=>p.name).join(' ')+' '+(w.creators||[]).map(p=>p.name).join(' ')).toLocaleLowerCase().includes(query))&&(tab!=='ratings'||(w.linked?linked.has(w.id)&&validRating(Number(linked.get(w.id).rating)):rows.has(w.id))));
    const sort=$('tv-sort').value;visible.sort((a,b)=>sort==='title'?a.title.localeCompare(b.title):sort==='year'?b.year-a.year:((Number((b.linked?linked:rows).get(b.id)?.rating)||0)-(Number((a.linked?linked:rows).get(a.id)?.rating)||0)||a.title.localeCompare(b.title)));
    const tvCount=shows.filter(w=>rows.has(w.id)).length,linkedCount=aliases.filter(w=>validRating(Number(linked.get(w.work_key)?.rating))).length;
    $('tv-count').textContent=`${tvCount} TV ratings · ${linkedCount} linked film ratings · ${visible.length} works shown`;
    $('tv-grid').innerHTML=visible.map(w=>{
      const p=(w.linked?linked:rows).get(w.id),rating=Number(p?.rating)||0;
      const poster=typeof w.poster_path==='string'&&/^\/[A-Za-z0-9._-]+$/.test(w.poster_path)?'https://image.tmdb.org/t/p/w342'+w.poster_path:null;
      const credits=(w.directors?.length?w.directors:w.creators||[]).map(p=>p.name).join(', ');
      return `<article class="film ${rating?'watched':''}"><div class="poster">${poster?`<img loading="lazy" alt="Poster for ${escape(w.title)}" src="${escape(poster)}">`:`<span class="initial">${escape(w.title[0])}</span>`}<span class="tier">${escape(kinds[w.series_kind])}</span></div><div class="body"><h3>${escape(w.title)}</h3><div class="meta">${escape(credits)}${credits?' · ':''}${escape(w.year)}</div>${w.original_title&&w.original_title!==w.title?`<div class="meta">${escape(w.original_title)}</div>`:''}<div class="meta tv-scope">${w.linked?'Same work already represented in Films':rating?escape(scopes[p.rating_scope]):'Not rated'}</div>${p?.notes?`<p class="tv-notes">${escape(p.notes)}</p>`:''}${p?.watched_date?`<div class="meta">Watched: ${escape(p.watched_date)}</div>`:''}<div class="sources"><a href="https://www.themoviedb.org/tv/${w.tmdb_id}" target="_blank" rel="noopener noreferrer">TMDB ↗</a></div><div class="controls">${w.linked?`<button class="action" type="button" data-linked-film="${w.id.split(':')[1]}">${rating?rating.toFixed(1)+'/10 · ':''}View film rating</button>`:`<button type="button" class="star-trigger" data-tv-edit="${w.id}" aria-label="Rate ${escape(w.title)}" ${!user||loading||busy||!ready?'disabled':''}>${rating?'★ <span class="value">'+rating.toFixed(1)+'/10</span>':'☆ <span class="value">Rate</span>'}</button>`}</div></div></article>`;
    }).join('');
    $('tv-empty').hidden=visible.length>0;
    for(const id of ['tv-import','tv-import-button','tv-export'])$(id).disabled=!user||loading||busy||!ready;
    $('tv-refresh').disabled=loading||busy;
    for(const el of $('tv-rating-form').elements)el.disabled=busy||loading||!ready||!user;
  }
  function choose(key){
    if(busy||loading||!ready||!user)return;
    const w=shows.find(w=>w.id===key);if(!w)return;current=w;
    const p=rows.get(key);editorVersion=p?.updated_at||null;$('tv-editor').hidden=false;$('tv-selected-title').textContent=w.title;$('tv-scope').value=p?.rating_scope||'unspecified';$('tv-notes').value=p?.notes||'';$('tv-date').value=p?.watched_date||'';setRating(Number(p?.rating)||null);$('tv-remove').hidden=!p;$('tv-editor-status').textContent='';$('tv-editor').scrollIntoView({behavior:'smooth',block:'start'});
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
      rows.set(work,data);closeEditor();message('TV rating saved to your account.');
    }catch(error){if(version===generation)$('tv-editor-status').textContent=error.message||'TV rating could not be saved.';}
    finally{busy=false;render();}
  }
  async function remove(){
    if(!current||busy||!user)return;const work=current.id,old=rows.get(work);if(!old||!confirm('Remove your TV rating and notes for '+current.title+'?'))return;
    const version=generation;busy=true;render();
    try{await checkSession(version);const {error}=await client.rpc('remove_tv_rating',{p_work_key:work,p_expected_updated_at:editorVersion});if(error)throw error;if(version!==generation)return;rows.delete(work);closeEditor();message('TV rating removed.');}
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
      const correction=proposal.replace?' Also replace the mistaken Decalogue V film assignment only after verifying the whole-cycle Dekalog 10.0.':'';
      if(!summary.missing&&!proposal.replace){message(`Nothing to import: ${summary.existing} already present; ${summary.conflicts} differ and were preserved.`);return;}
      if(!confirm(`TV import preview: ${proposal.ratings.length} input; ${summary.missing} missing; ${summary.existing} existing; ${summary.conflicts} differing. Existing TV ratings will never be overwritten.${correction} Proceed?`))return;
      busy=true;render();await checkSession(version);
      const {data,error}=await client.rpc('import_tv_ratings',{p_entries:proposal.ratings,p_replace_dekalog:proposal.replace});if(error)throw error;if(version!==generation)return;
      await setSession(user);
      if(data.dekalog_episode_removed)await hooks.onFilmProgressChanged?.();
      message(`Imported ${data.inserted_keys.length} TV ratings; ${data.skipped_existing} existing ratings preserved.${data.dekalog_episode_removed?' Replaced the mistaken Decalogue V assignment with the whole-cycle Dekalog rating.':''}`);
    }catch(error){if(version===generation)message(error.message||'TV import could not be confirmed. Refresh before retrying.');}
    finally{busy=false;event.target.value='';render();}
  }
  function exportFile(){
    if(!user||!ready)return;
    const data={format:'culture-atlas-tv-progress-v1',ratings:[...rows.values()].map(p=>({work_key:p.work_key,rating:Number(p.rating),rating_scope:p.rating_scope,notes:p.notes,watched_date:p.watched_date??null})),replace_dekalog_episode:false};
    const url=URL.createObjectURL(new Blob([JSON.stringify(data,null,2)+'\n'],{type:'application/json'})),a=document.createElement('a');a.href=url;a.download='culture-atlas-tv-ratings.json';a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);
  }
  function init(supabaseClient,callbacks={}){
    client=supabaseClient;hooks=callbacks;shows=window.CULTURE_TV_CATALOG||[];aliases=window.CULTURE_TV_FILM_ALIASES||[];
    window.CULTURE_WORK_IDENTITIES.createRegistry(window.CULTURE_CATALOG||[],shows,aliases);
    const section=document.createElement('section');section.id='tv-view';section.hidden=true;section.setAttribute('aria-label','TV Series');
    section.innerHTML=`<div class="hero"><div class="eyebrow">Series and miniseries</div><h1>Television worth keeping.</h1><p>Rate TV works and keep notes about the seasons or parts you watched.</p></div><nav class="film-subnav" aria-label="TV sections"><button type="button" class="film-subtab active" data-tv-tab="catalogue" aria-pressed="true">Catalogue</button><button type="button" class="film-subtab" data-tv-tab="ratings" aria-pressed="false">My ratings</button></nav><p id="tv-message" class="meta" role="status" aria-live="polite"></p><div class="tv-tools"><button id="tv-refresh" type="button" class="action">Refresh</button><button id="tv-export" type="button" class="action" disabled>Export TV ratings</button><button id="tv-import-button" type="button" class="action" disabled>Import TV ratings</button><input id="tv-import" type="file" accept=".json,application/json" hidden disabled></div><section id="tv-editor" class="tv-editor" aria-label="Rate selected TV work" hidden><h2 id="tv-selected-title"></h2><form id="tv-rating-form"><input id="tv-rating" type="hidden"><div class="star-control"><button id="tv-star-trigger" class="star-trigger" type="button" aria-label="Set personal TV rating" aria-haspopup="dialog" aria-controls="tv-star-picker" aria-expanded="false">☆ <span class="value">Rate</span></button></div><div class="filters"><label>Rating covers<select id="tv-scope"><option value="unspecified">Seasons or parts not specified</option><option value="whole_work">Whole work / series</option></select></label><label>Watched date (optional)<input id="tv-date" type="date"></label></div><label for="tv-notes">Your notes</label><textarea id="tv-notes" maxlength="10000" placeholder="Seasons, parts, or your thoughts…"></textarea><div class="tv-tools"><button type="submit" class="action">Save TV rating</button><button id="tv-cancel" class="action" type="button">Cancel</button><button id="tv-remove" class="action" type="button" hidden>Remove TV rating</button></div><p id="tv-editor-status" class="meta" role="status"></p></form></section><div class="filters"><input id="tv-search" type="search" aria-label="Search TV works" placeholder="Search titles, creators or directors…"><select id="tv-kind" aria-label="TV kind"><option value="">All TV works</option><option value="series">Series</option><option value="miniseries">Miniseries</option><option value="unknown">Other TV works</option></select><select id="tv-sort" aria-label="Sort TV works"><option value="year">Year newest first</option><option value="rating">Highest rated first</option><option value="title">Title A–Z</option></select></div><p id="tv-count" class="count"></p><div id="tv-grid" class="grid"></div><p id="tv-empty" class="empty" hidden>No TV works match these filters.</p>`;
    document.querySelector('main').append(section);initStars();
    $('tv-rating-form').addEventListener('submit',save);$('tv-cancel').addEventListener('click',closeEditor);$('tv-remove').addEventListener('click',remove);
    $('tv-search').addEventListener('input',render);$('tv-kind').addEventListener('change',render);$('tv-sort').addEventListener('change',render);$('tv-import').addEventListener('change',importFile);$('tv-import-button').addEventListener('click',()=>$('tv-import').click());$('tv-export').addEventListener('click',exportFile);$('tv-refresh').addEventListener('click',()=>setSession(user));
    section.addEventListener('click',e=>{
      const button=e.target.closest('[data-tv-tab]');if(button){tab=button.dataset.tvTab;closeEditor();section.querySelectorAll('[data-tv-tab]').forEach(b=>{b.classList.toggle('active',b===button);b.setAttribute('aria-pressed',String(b===button));});render();return;}
      const edit=e.target.closest('[data-tv-edit]');if(edit)choose(edit.dataset.tvEdit);
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
  window.CultureTV={init,setSession,validRating,validateImport,previewImport};
})();

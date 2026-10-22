/* Books v1: Open Library work search; Supabase owns catalogue + private ratings. */
(() => {
  'use strict';
  const $ = id => document.getElementById(id);
  const escape = value => String(value ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const formats = {kindle:'Kindle', audio:'Audio', unknown:'Not specified'};
  const bookKey = book => book.open_library_work_id || (book.id?`local-${book.id}`:`goodreads-${book.goodreads_id}`);
  const workPattern = /^\/works\/OL\d+W$/;
  const goodreadsId = value => typeof value==='string' && /^[1-9]\d{0,19}$/.test(value) ? value : null;
  function goodreadsLink(book) {
    const id=goodreadsId(book.goodreads_id);
    return id?`https://www.goodreads.com/book/show/${id}`:`https://www.goodreads.com/search?q=${encodeURIComponent([book.title,...book.authors].join(' '))}`;
  }
  function fallbackCover(value) {
    if(typeof value!=='string')return null;
    try {const url=new URL(value);return url.protocol==='https:'&&!url.username&&!url.password&&!url.port&&['i.gr-assets.com','images.gr-assets.com'].includes(url.hostname)?url.href:null;}catch{return null;}
  }
  function goodreadsMarkup(book) {
    const id=goodreadsId(book.goodreads_id),rating=book.goodreads_rating;
    const snapshot=id && typeof rating==='number' && Number.isFinite(rating) && rating>=0 && rating<=5 && book.goodreads_ratings_count>0 && /^\d{4}-\d{2}-\d{2}$/.test(book.goodreads_observed_on||'') && ['manual','search_index'].includes(book.goodreads_rating_source);
    return `<p class="meta book-goodreads"><a href="${escape(goodreadsLink(book))}" target="_blank" rel="noopener noreferrer">${id?'Goodreads ↗':'Find on Goodreads ↗'}</a>${snapshot?`<br><span>Goodreads: ${rating.toFixed(2)} / 5 · ${escape(book.goodreads_ratings_count)} ratings</span><br><small>Saved ${escape(book.goodreads_observed_on)}${book.goodreads_rating_source==='search_index'?' · search-index snapshot':''}</small>`:id?'<br><small>Goodreads rating not saved</small>':''}</p>`;
  }
  // Open Library's all-word search can miss a work if an article is absent
  // from its stored title. Relax only empty searches, never replace a match.
  function searchVariants(query) {
    const variants=[query];
    const withoutArticle=query.replace(/^(?:the|an?)\s+/iu,'').trim();
    if(withoutArticle && withoutArticle!==query) variants.push(withoutArticle);
    const commonWords=new Set(['the','a','an','and','of','in','on','for','to','is','are','и','в','на','о']);
    const words=query.split(/\s+/).filter(word=>!commonWords.has(word.toLocaleLowerCase()));
    const shorter=words.join(' ');
    if(words.length>=2 && !variants.includes(shorter)) variants.push(shorter);
    return variants;
  }
  function normaliseBook(doc) {
    if (!doc || !workPattern.test(doc.key) || typeof doc.title !== 'string' || !doc.title.trim()) return null;
    const authors = (Array.isArray(doc.author_name) ? doc.author_name : []).filter(a => typeof a === 'string' && a.trim()).slice(0,20);
    if (!authors.length) return null;
    return {open_library_work_id:doc.key, title:doc.title, authors,
      first_publish_year:Number.isInteger(doc.first_publish_year) && doc.first_publish_year >= -5000 && doc.first_publish_year <= 3000 ? doc.first_publish_year : null,
      cover_id:Number.isSafeInteger(doc.cover_i) && doc.cover_i > 0 ? doc.cover_i : null};
  }
  function validRating(value) {
    return typeof value === 'number' && Number.isFinite(value) && value >= .5 && value <= 10 && Number.isInteger(value*2);
  }
  const normaliseText=value=>String(value).normalize('NFKD').replace(/\p{M}/gu,'').toLocaleLowerCase().replace(/[^\p{L}\p{N}]+/gu,' ').trim();
  const withoutArticle=value=>value.replace(/^(the|an?) /u,'');
  function containsWords(text,words) {
    const available=text.split(' ');
    return words.every(word=>{const i=available.indexOf(word);if(i<0)return false;available.splice(i,1);return true;});
  }
  function rankBooks(docs,query,author='',isbn=false) {
    const target=normaliseText(query),titleTarget=withoutArticle(target);
    const words=titleTarget.split(' ').filter(word=>!['of','in','on','for','to','and','is','are','и','в','на','о'].includes(word));
    const authorWords=normaliseText(author).split(' ').filter(Boolean);
    const unique=new Map();
    for(const doc of docs) {
      const book=normaliseBook(doc);if(!book)continue;
      const title=normaliseText(book.title),authors=normaliseText(book.authors.join(' '));
      if(authorWords.length&&!containsWords(authors,authorWords))continue;
      const score=isbn?100:title===target?100:withoutArticle(title)===titleTarget?95:title.startsWith(target+' ')?85:(' '+title+' ').includes(' '+titleTarget+' ')?70:words.length&&containsWords(title,words)?50:words.length&&containsWords(title+' '+authors,words)?30:0;
      if(!score)continue;
      book.search_match=score>=95?'Exact title match':score>=50?'Title match':'Title / author match';
      if(!unique.has(book.open_library_work_id))unique.set(book.open_library_work_id,{book,score});
    }
    return [...unique.values()].sort((a,b)=>b.score-a.score||Number(!!b.book.cover_id)-Number(!!a.book.cover_id)).map(row=>row.book).slice(0,20);
  }
  function searchPlan(query,author) {
    const isbn=query.replace(/[\s-]/g,'');
    if(/^(?:\d{13}|\d{9}[\dXx])$/.test(isbn))return [{params:{isbn},text:query,isbn:true}];
    const quote=value=>'"'+value.replace(/[\\"]/g,'\\$&')+'"';
    return [...searchVariants(query).map(text=>({params:{q:'title_suggest:'+quote(text),...(author?{author}: {})},text})),{params:{q:query,...(author?{author}: {})},text:query}];
  }
  let client, user=null, generation=0, books=[], progress=new Map(), results=[], selected=null;
  let editorHydrated=false, readings=[], importDraft=null, importing=false;
  function readingDate(r) {
    if(r.read_date_precision==='unknown')return 'Date not recorded';
    if(r.read_date_precision==='year_range')return `${r.read_year}–${r.read_year_end}`;
    if(r.read_date_precision==='year')return String(r.read_year);
    const date=new Date(r.read_date+'T12:00:00Z');
    return date.toLocaleDateString('en-GB',{timeZone:'UTC',year:'numeric',month:'long',...(r.read_date_precision==='day'?{day:'numeric'}:{})});
  }
  function historyFor(book) {return readings.filter(r=>r.book_id===book.id).sort((a,b)=>(b.read_year||0)-(a.read_year||0)||String(b.read_date||'').localeCompare(a.read_date||''));}
  function resetImport() {importDraft=null;$('book-import-file').value='';$('book-import-preview').replaceChildren();$('book-import-apply').hidden=true;message('book-import-status','');}

  let searchController, searchSequence=0, saving=false, loading=false, activeTab='ratings', visible=48;
  const cache = new Map();
  let starPicker, starPreview=null;
  function paintBookStars(value) {
    starPicker?.querySelectorAll('.star-choice').forEach((button,index)=>{
      button.querySelector('.star-fill').style.width=`${Math.max(0,Math.min(1,value-index))*100}%`;
    });
    if(starPicker) starPicker.querySelector('.rating-preview').textContent=value?`${value.toFixed(1)} / 10`:'Not rated';
  }
  function updateRatingTrigger() {
    const value=Number($('book-rating').value)||0;
    $('book-rating-trigger').innerHTML=value?`★ <span class="value">${value.toFixed(1)}/10</span>`:'☆ <span class="value">Rate</span>';
    $('book-rating-trigger').setAttribute('aria-label',value?`Change personal book rating, currently ${value}/10`:'Set personal book rating');
    paintBookStars(value);
  }
  function closeBookStars(restoreFocus=false) {
    if(starPicker) starPicker.hidden=true;
    starPreview=null; $('book-rating-trigger').setAttribute('aria-expanded','false');
    if(restoreFocus) $('book-rating-trigger').focus({preventScroll:true});
  }
  function initBookStars() {
    starPicker=document.createElement('div');
    starPicker.id='book-star-picker';starPicker.className='star-picker';starPicker.hidden=true;
    starPicker.setAttribute('role','dialog');starPicker.setAttribute('aria-label','Choose a personal book rating');
    starPicker.innerHTML='<div class="star-choices" role="group" aria-label="Choose a rating out of ten">'+Array.from({length:10},(_,i)=>`<button type="button" class="star-choice" data-index="${i}" aria-label="${i+1} stars"><span class="star-empty">★</span><span class="star-fill">★</span></button>`).join('')+'</div><span class="rating-preview" aria-live="polite"></span><button type="button" class="clear-rating">Clear rating</button>';
    document.body.append(starPicker);
    const trigger=$('book-rating-trigger');
    trigger.addEventListener('click',()=>{
      if(!starPicker.hidden) {closeBookStars();return;}
      starPreview=null;starPicker.hidden=false;trigger.setAttribute('aria-expanded','true');
      paintBookStars(Number($('book-rating').value)||0);
      const rect=trigger.getBoundingClientRect(),width=Math.min(300,window.innerWidth-20),height=starPicker.offsetHeight;
      starPicker.style.left=Math.max(10,Math.min(window.innerWidth-width-10,rect.left))+'px';
      starPicker.style.top=(rect.top>=height+12?rect.top-height-8:Math.min(window.innerHeight-height-10,rect.bottom+8))+'px';
      starPicker.querySelectorAll('.star-choice')[Math.max(0,Math.ceil(Number($('book-rating').value)||1)-1)].focus({preventScroll:true});
    });
    const pointerValue=(event,button)=>{
      const rect=button.getBoundingClientRect();
      return Number(button.dataset.index)+(event.clientX-rect.left<rect.width/2?.5:1);
    };
    const commit=value=>{
      if(saving) return;
      $('book-rating').value=value===null?'':String(value);
      updateRatingTrigger();closeBookStars(true);
    };
    starPicker.addEventListener('pointermove',event=>{
      const button=event.target.closest('.star-choice');if(!button)return;
      starPreview=pointerValue(event,button);paintBookStars(starPreview);
    });
    starPicker.querySelector('.star-choices').addEventListener('pointerleave',()=>{starPreview=null;paintBookStars(Number($('book-rating').value)||0);});
    starPicker.addEventListener('click',event=>{
      const button=event.target.closest('.star-choice');
      if(button) commit(event.detail===0?(starPreview??Number(button.dataset.index)+1):pointerValue(event,button));
      else if(event.target.closest('.clear-rating')) commit(null);
    });
    starPicker.addEventListener('keydown',event=>{
      if(event.key==='Escape') {event.preventDefault();closeBookStars(true);return;}
      if(['ArrowLeft','ArrowDown','ArrowRight','ArrowUp'].includes(event.key)) {
        event.preventDefault();starPreview=Math.max(.5,Math.min(10,(starPreview??(Number($('book-rating').value)||0))+(['ArrowRight','ArrowUp'].includes(event.key)?.5:-.5)));paintBookStars(starPreview);
      }
      if((event.key==='Enter'||event.key===' ')&&starPreview!==null) {event.preventDefault();commit(starPreview);}
      if(event.key==='Tab') closeBookStars(true);
    });
    document.addEventListener('pointerdown',event=>{if(!starPicker.hidden&&!starPicker.contains(event.target)&&!trigger.contains(event.target)) closeBookStars();});
    window.addEventListener('scroll',()=>closeBookStars(),{passive:true});
    window.addEventListener('resize',()=>closeBookStars());
    updateRatingTrigger();
  }
  function message(id, text) { $(id).textContent=text; }
  function errorMessage(error) {
    if (['42P01','42883','PGRST202','PGRST205'].includes(error?.code)) return 'Books storage is not ready yet. The Books database migration needs to be applied.';
    return error?.message || 'Something went wrong. Please try again.';
  }
  function card(book, result=false) {
    book={...book,...books.find(b=>bookKey(b)===bookKey(book))};
    const p=progress.get(bookKey(book)), known=books.find(b=>bookKey(b)===bookKey(book));
    const cover=Number.isSafeInteger(Number(book.cover_id)) && Number(book.cover_id)>0;
    const coverUrl=cover?`https://covers.openlibrary.org/b/id/${Number(book.cover_id)}-M.jpg?default=false`:fallbackCover(book.cover_url);
    return `<article class="film book-card"><div class="poster"><span class="cover-fallback">Cover unavailable</span>${coverUrl?`<img loading="lazy" src="${escape(coverUrl)}" alt="Cover of ${escape(book.title)}">`:''}</div><div class="body"><h3>${book.id||book.open_library_work_id?`<a href="#/books/${escape(bookKey(book).split('/').pop())}">${escape(book.title)}</a>`:escape(book.title)}</h3>${result&&book.search_match?`<p class="meta">${escape(book.search_match)}</p>`:''}<p class="meta">${escape(book.authors.join(', '))}</p><p class="meta">${escape(book.first_publish_year??'Year unavailable')}</p>${p?`<p class="book-score">Your rating: ${escape(p.rating)}/10</p><p class="meta">${escape(formats[p.reading_format]||formats.unknown)}</p>${historyFor(book).length?`<p class="meta">Read: ${escape(readingDate(historyFor(book)[0]))}${historyFor(book).length>1?` · ${historyFor(book).length} readings`:''}</p>`:''}${!result&&p.notes?`<p class="book-notes">${escape(p.notes)}</p>`:''}`:''}${book.open_library_work_id?`<a class="meta" href="https://openlibrary.org${escape(book.open_library_work_id)}" target="_blank" rel="noopener noreferrer">Open Library ↗</a>`:`<p class="meta">${book.work_scope==='collection'?'Collection · ':''}${goodreadsId(book.goodreads_id)?'Goodreads-linked catalogue record':'Source catalogue record'}</p>`}${goodreadsMarkup(book)}<button type="button" class="action" data-book-work="${escape(bookKey(book))}">${p?'Edit rating':known?'Rate book':'Select & rate'}</button></div></article>`;
  }
  function render() {
    const rated=books.filter(b=>progress.has(bookKey(b))).sort((a,b)=>new Date(progress.get(bookKey(b)).updated_at)-new Date(progress.get(bookKey(a)).updated_at));
    $('book-ratings-grid').innerHTML=rated.slice(0,visible).map(b=>card(b)).join('');
    $('book-catalogue-grid').innerHTML=books.slice(0,visible).map(b=>card(b)).join('');
    $('book-search-results').innerHTML=results.map(b=>card(b,true)).join('');
    $('book-ratings-empty').hidden=!!rated.length;
    $('book-ratings-empty').textContent=user?'No rated books yet. Find a book in Add book to get started.':'Sign in to see your book ratings. You can search for books in Add book.';
    $('book-catalogue-empty').hidden=!!books.length;
    message('book-ratings-count',`${rated.length} rated book${rated.length===1?'':'s'}`);
    message('book-catalogue-count',`${books.length} book${books.length===1?'':'s'} in the catalogue`);
    $('book-more').hidden=activeTab==='search'||(activeTab==='ratings'?rated.length:books.length)<=visible;
  }
  function switchTab(tab) {
    activeTab=tab; visible=48;
    for (const el of document.querySelectorAll('[data-book-tab]')) {
      el.classList.toggle('active',el.dataset.bookTab===tab);
      el.setAttribute('aria-pressed',String(el.dataset.bookTab===tab));
    }
    for (const panel of document.querySelectorAll('.book-panel')) panel.hidden=panel.dataset.bookPanel!==tab;
    render();
  }
  function closeEditor() {
    if(saving) return;
    closeBookStars();
    selected=null; $('book-editor').hidden=true; $('book-rating-form').reset(); $('book-rating').value='';
    updateRatingTrigger();
    message('book-save-status','');
  }
  function choose(workId) {
    if(saving) return;
    if(!workId.startsWith('goodreads-') && window.CultureRouter?.openBook(workId))return;
    closeBookStars();
    selected=books.find(b=>bookKey(b)===workId)||results.find(b=>bookKey(b)===workId);
    if(!selected) return;
    editorHydrated=!loading;
    const p=progress.get(workId);
    $('book-rating-form').reset();
    message('book-selected-title',selected.title);
    message('book-selected-author',selected.authors.join(', '));
    $('book-rating').value=p?String(p.rating):'';
    updateRatingTrigger();
    $('book-format').value=p?.reading_format||'';
    $('book-notes').value=p?.notes||'';
    $('book-reading-history').innerHTML=historyFor(selected).length?'<h3>Reading history</h3><p class="meta">Imported readings are preserved when you edit your current rating.</p><ul>'+historyFor(selected).map(r=>`<li>${escape(readingDate(r))} · ${escape(r.rating)}/10 · ${escape(formats[r.reading_format])}${r.notes?`<p class="book-notes">${escape(r.notes)}</p>`:''}</li>`).join('')+'</ul>':'';
    message('book-save-status',user?'': 'Sign in using Account to save this book.');
    $('book-editor').hidden=false;
    $('book-editor').scrollIntoView({behavior:'smooth',block:'start'});
    $('book-rating-trigger').focus({preventScroll:true});
  }
  async function search(event) {
    event.preventDefault();
    const query=$('book-query').value.trim();
    const author=$('book-author').value.trim();
    const cacheKey=query.toLocaleLowerCase()+'\0'+author.toLocaleLowerCase();
    if(query.length<2) { message('book-search-status','Enter at least two characters: a title, author or ISBN.');return; }
    searchController?.abort();
    const sequence=++searchSequence;
    const controller=searchController=new AbortController();
    const timeout=setTimeout(()=>controller.abort(),20000);
    $('book-search-submit').disabled=true; $('book-search-results').setAttribute('aria-busy','true');
    message('book-search-status','Searching Open Library…'); results=[]; render();
    try {
      let cached=cache.get(cacheKey);
      if(!cached) {
        let candidates=[],matchedQuery=query;
        const plan=searchPlan(query,author);
        for(const [index,stage] of plan.entries()) {
          if(controller.signal.aborted) throw new DOMException('Search cancelled','AbortError');
          if(sequence!==searchSequence) return;
          const started=Date.now();
          const params=new URLSearchParams({...stage.params,limit:'50',fields:'key,title,author_name,first_publish_year,cover_i'});
          const response=await fetch(`https://openlibrary.org/search.json?${params}`,{signal:controller.signal});
          if(!response.ok) throw Error(response.status===429?'Open Library is busy. Please wait a moment and search again.':'Book search is unavailable. Please try again shortly.');
          const payload=await response.json();
          if(!Array.isArray(payload.docs)) throw Error('Book search returned an unexpected response. Please try again.');
          candidates=rankBooks(payload.docs,query,author,stage.isbn);matchedQuery=stage.text;
          if(candidates.length) break;
          // Keep fallback calls within Open Library's anonymous request limit.
          if(index<plan.length-1) await new Promise(resolve=>setTimeout(resolve,Math.max(0,1000-(Date.now()-started))));
        }
        cached={candidates,matchedQuery};
        if(controller.signal.aborted) throw new DOMException('Search cancelled','AbortError');
        if(sequence!==searchSequence) return;
        if(cache.size>=20) cache.delete(cache.keys().next().value);
        cache.set(cacheKey,cached);
      }
      if(sequence!==searchSequence) return;
      results=cached.candidates;
      const relaxed=cached.matchedQuery.toLocaleLowerCase()!==query.toLocaleLowerCase()?'Found using a shorter search. ':'';
      message('book-search-status',results.length?`${relaxed}${results.length} results, with exact title matches first. Check the author and year before selecting a book.`:'No close matches found. Try the Author field, an ISBN, or a transliterated title.');
      render();
    } catch(error) {
      if(sequence===searchSequence) message('book-search-status',error.name==='AbortError'?'Search timed out. Please try again.':error.message);
    } finally {
      clearTimeout(timeout);
      if(sequence===searchSequence) { $('book-search-submit').disabled=false; $('book-search-results').setAttribute('aria-busy','false'); }
    }
  }
  async function readAll(table, fields, userId) {
    const rows=[];
    for(let offset=0;;offset+=500) {
      let query=client.from(table).select(fields).order(table==='books'?'id':'book_id',{ascending:true}).range(offset,offset+499);
      if(table==='book_readings')query=query.order('source_key',{ascending:true});
      if(userId) query=query.eq('user_id',userId);
      const {data,error}=await query;
      if(error) throw error;
      rows.push(...data);
      if(data.length<500) return rows;
    }
  }
  async function setSession(nextUser) {
    const changed=user?.id!==nextUser?.id;
    user=nextUser||null; const version=++generation;
    loading=true;
    if(changed) {
      closeBookStars();
      progress=new Map(); readings=[];selected=null;resetImport();$('book-reading-history').replaceChildren();
      $('book-editor').hidden=true; $('book-rating-form').reset(); $('book-rating').value=''; message('book-save-status','');
      updateRatingTrigger();
    }
    render();
    if(!client) { loading=false;message('book-sync-status','Cloud connection is unavailable. Reload the page to try again.');return; }
    message('book-sync-status','Loading books…');
    try {
      const [catalogue,ratings,history]=await Promise.all([readAll('books','id,open_library_work_id,title,authors,first_publish_year,cover_id,work_scope,cover_url,goodreads_id,goodreads_rating,goodreads_ratings_count,goodreads_observed_on,goodreads_rating_source,goodreads_source_url'),user?readAll('book_progress','book_id,rating,reading_format,notes,updated_at',user.id):Promise.resolve([]),user?readAll('book_readings','book_id,source_key,rating,reading_format,notes,read_date,read_date_precision,read_year,read_year_end,started_date',user.id):Promise.resolve([])]);
      if(version!==generation) return;
      books=catalogue;readings=history;
      const byId=new Map(books.map(b=>[b.id,bookKey(b)]));
      progress=new Map(ratings.filter(p=>byId.has(p.book_id)).map(p=>[byId.get(p.book_id),p]));
      message('book-sync-status',user?'Books and ratings synced to your account.':'Sign in using Account to save ratings, reading format and notes.');
      render();
      window.CultureRouter?.refresh();
    } catch(error) { if(version===generation) message('book-sync-status',errorMessage(error)); }
    finally { if(version===generation) loading=false; }
  }
  async function save(event) {
    event.preventDefault();
    if(saving||!selected) return;
    if(!client||!user) { message('book-save-status','Sign in using Account before saving. Your form is still here.');return; }
    if(loading) { message('book-save-status','Your account is still loading. Please try saving again in a moment.');return; }
    const rating=Number($('book-rating').value),format=$('book-format').value,notes=$('book-notes').value;
    if(!validRating(rating)||!Object.hasOwn(formats,format)||notes.length>10000) { message('book-save-status','Choose a rating and reading format, with notes up to 10,000 characters.');return; }
    const version=generation,book=selected;
    closeBookStars();saving=true;
    for(const el of $('book-rating-form').elements) el.disabled=true;
    message('book-save-status','Saving book and rating…');
    try {
      const {data,error}=await client.rpc(!book.id&&book.goodreads_id?'save_goodreads_book':book.open_library_work_id?'save_book_rating':'update_book_rating',!book.id&&book.goodreads_id?{p_metadata:book,p_rating:rating,p_format:format,p_notes:notes}:book.open_library_work_id?{p_work_id:book.open_library_work_id,p_title:book.title,p_authors:book.authors,p_year:book.first_publish_year,p_cover_id:book.cover_id,p_rating:rating,p_format:format,p_notes:notes}:{p_book_id:book.id,p_rating:rating,p_format:format,p_notes:notes});
      if(version!==generation) return;
      if(error) throw error;
      if(!data?.book||!data?.progress) throw Error('The server did not confirm the save. Refresh your ratings before trying again.');
      books=[data.book,...books.filter(b=>b.id!==data.book.id)];
      progress.set(bookKey(data.book),data.progress);
      message('book-sync-status',`Saved “${data.book.title}” to the catalogue and your ratings.`);
      saving=false; closeEditor(); switchTab('ratings');window.CultureRouter?.navigate({section:'books',view:'ratings'});
    } catch(error) {
      if(version===generation) message('book-save-status',`Could not save: ${errorMessage(error)} Your form has been kept.`);
    } finally {
      saving=false;
      for(const el of $('book-rating-form').elements) el.disabled=false;
      if(version!==generation) closeEditor();
    }
  }
  function initImport() {
    $('book-import-file').addEventListener('change',async event=>{
      if(importing)return;
      importDraft=null;$('book-import-apply').hidden=true;$('book-import-preview').replaceChildren();
      const file=event.target.files?.[0],version=generation;if(!file)return;
      if(!user){message('book-import-status','Sign in before importing.');return;}
      if(file.size>8000000){message('book-import-status','The prepared file must be under 8 MB.');return;}
      importing=true;$('book-import-file').disabled=true;
      message('book-import-status','Checking the prepared file…');
      try {
        const payload=JSON.parse(await file.text());
        if(payload.format!=='culture-atlas-books-import-prepared-v1'||!Array.isArray(payload.books)||!Array.isArray(payload.readings))throw Error('Choose books-import.json from the prepared import package.');
        const {data,error}=await client.rpc('import_book_readings',{p_payload:payload,p_apply:false});
        if(version!==generation)return;if(error)throw error;
        importDraft=payload;
        const pending=payload.books.filter(b=>!b.open_library_work_id).length;
        message('book-import-status',`${data.new_books} new catalogue books, ${data.new_ratings} new ratings, ${data.new_readings} new readings. ${data.preserved_ratings} existing ratings will be preserved. ${pending} books use source metadata while catalogue matching is pending.`);
        const bySource=new Map(payload.readings.map(r=>[r.source_key,r]));
        $('book-import-preview').innerHTML='<table><thead><tr><th>Book</th><th>Rating</th><th>Read</th><th>Format</th></tr></thead><tbody>'+payload.books.map(b=>{const r=bySource.get(b.latest_source_key);return `<tr><td>${escape(b.title)}<br><small>${escape(b.author)}</small></td><td>${escape(r.rating)}/10</td><td>${escape(readingDate(r))}</td><td>${escape(formats[r.reading_format])}</td></tr>`;}).join('')+'</tbody></table>';
        $('book-import-apply').hidden=false;
      } catch(error) {if(version===generation)message('book-import-status',errorMessage(error));}
      finally{importing=false;$('book-import-file').disabled=false;}
    });
    $('book-import-apply').addEventListener('click',async()=>{
      if(importing||!importDraft||!user)return;
      const version=generation,payload=importDraft;importing=true;
      $('book-import-apply').disabled=true;$('book-import-file').disabled=true;
      message('book-import-status','Importing books and reading records…');
      try {
        const {data,error}=await client.rpc('import_book_readings',{p_payload:payload,p_apply:true});
        if(version!==generation)return;if(error)throw error;
        importDraft=null;$('book-import-apply').hidden=true;
        await setSession(user);
        if(version+1===generation)message('book-import-status',`Imported ${data.new_ratings} ratings and ${data.new_readings} readings. Existing ratings were preserved.`);
      } catch(error){if(version===generation)message('book-import-status',`Import failed: ${errorMessage(error)} No partial import was saved.`);}
      finally{importing=false;$('book-import-apply').disabled=false;$('book-import-file').disabled=false;}
    });
  }
  const workLoads=new Map();
  // A shared URL can name a book which has not been saved to our catalogue yet.
  // Resolve public metadata only; selecting or opening a URL never saves a rating.
  async function ensureWork(workId){
    if(workLoads.has(workId))return workLoads.get(workId);
    const pending=(async()=>{
      if(!workPattern.test(workId))return;
      const response=await fetch('https://openlibrary.org'+workId+'.json');if(!response.ok)throw Error('Book metadata is unavailable.');
      const doc=await response.json();if(!doc.title||!Array.isArray(doc.authors))return;
      const authors=await Promise.all(doc.authors.slice(0,10).map(async item=>{
        const key=item.author?.key;if(!/^\/authors\/OL\d+A$/.test(key||''))return null;
        const response=await fetch('https://openlibrary.org'+key+'.json');if(!response.ok)return null;
        return (await response.json()).name;
      }));
      const names=authors.filter(name=>typeof name==='string'&&name.trim());if(!names.length)return;
      const book={open_library_work_id:workId,title:doc.title,authors:names,cover_id:doc.covers?.find(id=>Number.isSafeInteger(id)&&id>0)||null,first_publish_year:null};
      if(!results.some(b=>bookKey(b)===workId))results.push(book);
    })();workLoads.set(workId,pending);return pending;
  }
  function init(supabaseClient) {
    client=supabaseClient;
    // Account UI must remain reachable while the Films area is hidden.
    document.body.append($('account'));
    initBookStars();
    initImport();
    $('book-goodreads-form').addEventListener('submit',event=>{
      event.preventDefault();if(saving)return;
      const url=$('book-goodreads-url').value.trim();
      const match=url.match(/^https:\/\/(?:www\.)?goodreads\.com\/(?:[a-z]{2}\/)?book\/show\/([1-9]\d{0,19})(?:[.\-/?#].*)?$/);
      const title=$('book-goodreads-title').value.trim(),author=$('book-goodreads-author').value.trim();
      const year=$('book-goodreads-year').value?Number($('book-goodreads-year').value):null;
      const cover=$('book-goodreads-cover').value.trim();
      if(!match||!title||!author||(year!==null&&(!Number.isInteger(year)||year< -5000||year>3000))||(cover&&!fallbackCover(cover))){message('book-goodreads-status','Enter a Goodreads book link, title and author. An optional cover must use a Goodreads image URL.');return;}
      const existing=books.find(b=>b.goodreads_id===match[1]);
      if(existing){choose(bookKey(existing));return;}
      const duplicate=books.find(b=>normaliseText(b.title)===normaliseText(title)&&normaliseText(b.authors.join(' '))===normaliseText(author));
      if(duplicate){choose(bookKey(duplicate));message('book-goodreads-status','This title and author are already in the catalogue. Opened the existing book for rating.');return;}
      const book={goodreads_id:match[1],title,authors:[author],first_publish_year:year,cover_url:cover||null,goodreads_source_url:`https://www.goodreads.com/book/show/${match[1]}`};
      results=results.filter(b=>bookKey(b)!==bookKey(book));results.push(book);render();choose(bookKey(book));
      message('book-goodreads-status','Choose your rating, format and notes below, then save to add this book.');
    });
    $('book-search-form').addEventListener('submit',search);
    $('book-rating-form').addEventListener('submit',save);
    $('book-cancel').addEventListener('click',()=>{closeEditor();window.CultureRouter?.closeDetail('book');});
    $('books-view').addEventListener('click',event=>{
      const tab=event.target.closest('[data-book-tab]'); if(tab) { if(!saving) { closeEditor();switchTab(tab.dataset.bookTab); }return; }
      const choice=event.target.closest('[data-book-work]'); if(choice) choose(choice.dataset.bookWork);
    });
    $('books-view').addEventListener('error',event=>{if(event.target.tagName==='IMG') event.target.hidden=true;},true);
    $('book-more').addEventListener('click',()=>{visible+=48;render();});
    for(const button of document.querySelectorAll('[data-section]')) button.addEventListener('click',()=>{
      const isBooks=button.dataset.section==='books';
      closeBookStars();
      $('cinema-area').hidden=isBooks; $('books-view').hidden=!isBooks;
      for(const tab of document.querySelectorAll('[data-section]')) {tab.classList.toggle('active',tab===button);tab.setAttribute('aria-pressed',String(tab===button));}
      document.title=`Culture Atlas · ${isBooks?'Books':'Films'}`;
    });
    render();
  }
  window.CultureBooks={init,setSession,normaliseBook,validRating,rankBooks,
    route:{switchTab,closeEditor,choose,ensureWork,needsHydration:()=>!!(selected&&!editorHydrated&&!loading),has:id=>books.some(b=>bookKey(b)===id)||results.some(b=>bookKey(b)===id),title:()=>selected?.title,
      getVisible:()=>visible,setVisible:n=>{visible=n;render();},search:()=>search({preventDefault(){}})}
  };
})();

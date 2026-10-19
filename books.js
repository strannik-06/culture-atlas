/* Books v1: Open Library work search; Supabase owns catalogue + private ratings. */
(() => {
  'use strict';
  const $ = id => document.getElementById(id);
  const escape = value => String(value ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const formats = {kindle:'Kindle', audio:'Audio', unknown:'Not specified'};
  const workPattern = /^\/works\/OL\d+W$/;
  function normaliseBook(doc) {
    if (!workPattern.test(doc.key) || typeof doc.title !== 'string' || !doc.title.trim()) return null;
    const authors = (Array.isArray(doc.author_name) ? doc.author_name : []).filter(a => typeof a === 'string' && a.trim()).slice(0,20);
    if (!authors.length) return null;
    return {open_library_work_id:doc.key, title:doc.title, authors,
      first_publish_year:Number.isInteger(doc.first_publish_year) && doc.first_publish_year >= -5000 && doc.first_publish_year <= 3000 ? doc.first_publish_year : null,
      cover_id:Number.isSafeInteger(doc.cover_i) && doc.cover_i > 0 ? doc.cover_i : null};
  }
  function validRating(value) {
    return typeof value === 'number' && Number.isFinite(value) && value >= .5 && value <= 10 && Number.isInteger(value*2);
  }
  let client, user=null, generation=0, books=[], progress=new Map(), results=[], selected=null;
  let searchController, searchSequence=0, saving=false, loading=false, activeTab='ratings', visible=48;
  const cache = new Map();
  function message(id, text) { $(id).textContent=text; }
  function errorMessage(error) {
    if (['42P01','42883','PGRST202','PGRST205'].includes(error?.code)) return 'Books storage is not ready yet. The Books database migration needs to be applied.';
    return error?.message || 'Something went wrong. Please try again.';
  }
  function card(book, result=false) {
    const p=progress.get(book.open_library_work_id), known=books.find(b=>b.open_library_work_id===book.open_library_work_id);
    const cover=Number.isSafeInteger(Number(book.cover_id)) && Number(book.cover_id)>0;
    return `<article class="film book-card"><div class="poster"><span class="cover-fallback">Cover unavailable</span>${cover?`<img loading="lazy" src="https://covers.openlibrary.org/b/id/${Number(book.cover_id)}-M.jpg?default=false" alt="Cover of ${escape(book.title)}">`:''}</div><div class="body"><h3>${escape(book.title)}</h3><p class="meta">${escape(book.authors.join(', '))}</p><p class="meta">${escape(book.first_publish_year??'Year unavailable')}</p>${p?`<p class="book-score">Your rating: ${escape(p.rating)}/10</p><p class="meta">${escape(formats[p.reading_format]||formats.unknown)}</p>${!result&&p.notes?`<p class="book-notes">${escape(p.notes)}</p>`:''}`:''}<a class="meta" href="https://openlibrary.org${escape(book.open_library_work_id)}" target="_blank" rel="noopener noreferrer">Open Library ↗</a><button type="button" class="action" data-book-work="${escape(book.open_library_work_id)}">${p?'Edit rating':known?'Rate book':'Select & rate'}</button></div></article>`;
  }
  function render() {
    const rated=books.filter(b=>progress.has(b.open_library_work_id)).sort((a,b)=>new Date(progress.get(b.open_library_work_id).updated_at)-new Date(progress.get(a.open_library_work_id).updated_at));
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
    selected=null; $('book-editor').hidden=true; $('book-rating-form').reset();
    message('book-save-status','');
  }
  function choose(workId) {
    if(saving) return;
    selected=books.find(b=>b.open_library_work_id===workId)||results.find(b=>b.open_library_work_id===workId);
    if(!selected) return;
    const p=progress.get(workId);
    $('book-rating-form').reset();
    message('book-selected-title',selected.title);
    message('book-selected-author',selected.authors.join(', '));
    $('book-rating').value=p?String(p.rating):'';
    $('book-format').value=p?.reading_format||'';
    $('book-notes').value=p?.notes||'';
    message('book-save-status',user?'': 'Sign in using Account to save this book.');
    $('book-editor').hidden=false;
    $('book-editor').scrollIntoView({behavior:'smooth',block:'start'});
    $('book-rating').focus({preventScroll:true});
  }
  async function search(event) {
    event.preventDefault();
    const query=$('book-query').value.trim();
    if(query.length<2) { message('book-search-status','Enter at least two characters: a title, author or ISBN.');return; }
    searchController?.abort();
    const sequence=++searchSequence;
    const controller=searchController=new AbortController();
    const timeout=setTimeout(()=>controller.abort(),20000);
    $('book-search-submit').disabled=true; $('book-search-results').setAttribute('aria-busy','true');
    message('book-search-status','Searching Open Library…'); results=[]; render();
    try {
      let docs=cache.get(query.toLocaleLowerCase());
      if(!docs) {
        const params=new URLSearchParams({q:query,limit:'20',fields:'key,title,author_name,first_publish_year,cover_i'});
        const response=await fetch(`https://openlibrary.org/search.json?${params}`,{signal:controller.signal});
        if(!response.ok) throw Error(response.status===429?'Open Library is busy. Please wait a moment and search again.':'Book search is unavailable. Please try again shortly.');
        const payload=await response.json();
        if(!Array.isArray(payload.docs)) throw Error('Book search returned an unexpected response. Please try again.');
        docs=payload.docs;
        if(cache.size>=20) cache.delete(cache.keys().next().value);
        cache.set(query.toLocaleLowerCase(),docs);
      }
      if(sequence!==searchSequence) return;
      results=[...new Map(docs.map(normaliseBook).filter(Boolean).map(b=>[b.open_library_work_id,b])).values()];
      message('book-search-status',results.length?`${results.length} results. Check the author and year before selecting a book.`:'No matches found. Try a shorter title, add the author, or use a transliterated title.');
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
      progress=new Map(); selected=null;
      $('book-editor').hidden=true; $('book-rating-form').reset(); message('book-save-status','');
    }
    render();
    if(!client) { loading=false;message('book-sync-status','Cloud connection is unavailable. Reload the page to try again.');return; }
    message('book-sync-status','Loading books…');
    try {
      const [catalogue,ratings]=await Promise.all([readAll('books','id,open_library_work_id,title,authors,first_publish_year,cover_id'),user?readAll('book_progress','book_id,rating,reading_format,notes,updated_at',user.id):Promise.resolve([])]);
      if(version!==generation) return;
      books=catalogue;
      const byId=new Map(books.map(b=>[b.id,b.open_library_work_id]));
      progress=new Map(ratings.filter(p=>byId.has(p.book_id)).map(p=>[byId.get(p.book_id),p]));
      message('book-sync-status',user?'Books and ratings synced to your account.':'Sign in using Account to save ratings, reading format and notes.');
      render();
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
    saving=true;
    for(const el of $('book-rating-form').elements) el.disabled=true;
    message('book-save-status','Saving book and rating…');
    try {
      const {data,error}=await client.rpc('save_book_rating',{p_work_id:book.open_library_work_id,p_title:book.title,p_authors:book.authors,p_year:book.first_publish_year,p_cover_id:book.cover_id,p_rating:rating,p_format:format,p_notes:notes});
      if(version!==generation) return;
      if(error) throw error;
      if(!data?.book||!data?.progress) throw Error('The server did not confirm the save. Refresh your ratings before trying again.');
      books=[data.book,...books.filter(b=>b.id!==data.book.id)];
      progress.set(data.book.open_library_work_id,data.progress);
      message('book-sync-status',`Saved “${data.book.title}” to the catalogue and your ratings.`);
      saving=false; closeEditor(); switchTab('ratings');
    } catch(error) {
      if(version===generation) message('book-save-status',`Could not save: ${errorMessage(error)} Your form has been kept.`);
    } finally {
      saving=false;
      for(const el of $('book-rating-form').elements) el.disabled=false;
      if(version!==generation) closeEditor();
    }
  }
  function init(supabaseClient) {
    client=supabaseClient;
    // Account UI must remain reachable while the Films area is hidden.
    document.body.append($('account'));
    $('book-rating').innerHTML='<option value="">Choose rating</option>'+Array.from({length:20},(_,i)=>{const n=(i+1)/2;return `<option value="${n}">${n}/10</option>`;}).join('');
    $('book-search-form').addEventListener('submit',search);
    $('book-rating-form').addEventListener('submit',save);
    $('book-cancel').addEventListener('click',closeEditor);
    $('books-view').addEventListener('click',event=>{
      const tab=event.target.closest('[data-book-tab]'); if(tab) { if(!saving) { closeEditor();switchTab(tab.dataset.bookTab); }return; }
      const choice=event.target.closest('[data-book-work]'); if(choice) choose(choice.dataset.bookWork);
    });
    $('books-view').addEventListener('error',event=>{if(event.target.tagName==='IMG') event.target.hidden=true;},true);
    $('book-more').addEventListener('click',()=>{visible+=48;render();});
    for(const button of document.querySelectorAll('[data-section]')) button.addEventListener('click',()=>{
      const isBooks=button.dataset.section==='books';
      $('cinema-area').hidden=isBooks; $('books-view').hidden=!isBooks;
      for(const tab of document.querySelectorAll('[data-section]')) {tab.classList.toggle('active',tab===button);tab.setAttribute('aria-pressed',String(tab===button));}
      document.title=`Culture Atlas · ${isBooks?'Books':'Films'}`;
    });
    render();
  }
  window.CultureBooks={init,setSession,normaliseBook,validRating};
})();

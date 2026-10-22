import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
import {Window} from 'happy-dom';

const userA='00000000-0000-0000-0000-000000000001';
const userB='00000000-0000-0000-0000-000000000002';
const migration=await readFile(new URL('../supabase/migrations/20261019_books_search_ratings.sql',import.meta.url),'utf8');
const source=await readFile(new URL('../books.js',import.meta.url),'utf8');
const markup=await readFile(new URL('../index.html',import.meta.url),'utf8');
const work={open_library_work_id:'/works/OL35708581W',title:'Orbital',authors:['Samantha Harvey'],first_publish_year:2023,cover_id:14541972};

test('Title relevance: Booker novels rank first, repeated words count, stems do not count as exact titles',async()=>{
  const {window}=await setup();
  try {
    const john=[
      {key:'/works/OL23204W',title:'Of Mice and Men',author_name:['John Steinbeck']},
      {key:'/works/OL45341670W',title:'John of John',author_name:['Douglas Stuart'],first_publish_year:2026},
      {key:'/works/OL45691929W',title:'John of John',author_name:['Douglas Stuart'],first_publish_year:2026,cover_i:15234094},
      {key:'/works/OL99W',title:'John',author_name:['Someone Else']},
    ];
    const rows=window.CultureBooks.rankBooks(john,'John of John');
    assert.equal(rows.length,2);assert.equal(rows[0].open_library_work_id,'/works/OL45691929W');
    assert.equal(rows[0].search_match,'Exact title match');
    const disappearers=[{key:'/works/OL39905W',title:'The Disappearing Floor',author_name:['Leslie McFarlane']},{key:'/works/OL45862992W',title:'The Disappearers',author_name:['Marlon James'],cover_i:15243723,first_publish_year:2026}];
    const d=window.CultureBooks.rankBooks(disappearers,'The Disappearers');
    assert.equal(d.length,1);assert.equal(d[0].authors[0],'Marlon James');
    assert.equal(window.CultureBooks.rankBooks(disappearers,'The Disappearers','Other Author').length,0);
  } finally {await window.happyDOM.close();}
});

test('Search submits title phrases and isolates author-filtered cache entries',async()=>{
  const {window,$,flush,submit}=await setup();
  try {
    const requests=[];
    window.fetch=async url=>{
      const p=new URL(url).searchParams;requests.push(p);
      const john=p.get('q').includes('John of John');
      return {ok:true,json:async()=>({docs:john?[{key:'/works/OL45691929W',title:'John of John',author_name:['Douglas Stuart'],cover_i:15234094,first_publish_year:2026}]:[{key:'/works/OL45862992W',title:'The Disappearers',author_name:['Marlon James'],cover_i:15243723,first_publish_year:2026}]})};
    };
    $('book-query').value='John of John';submit('book-search-form');await flush();
    assert.equal(requests[0].get('q'),'title_suggest:"John of John"');
    assert.match($('book-search-results').textContent,/Douglas Stuart/);
    assert.doesNotMatch($('book-search-results').textContent,/Steinbeck/);
    $('book-query').value='The Disappearers';submit('book-search-form');await flush();
    assert.equal(requests[1].get('q'),'title_suggest:"The Disappearers"');
    assert.match($('book-search-results').textContent,/Marlon James/);
    $('book-author').value='Marlon James';submit('book-search-form');await flush();
    assert.equal(requests.length,3);assert.equal(requests[2].get('author'),'Marlon James');
    submit('book-search-form');await flush();assert.equal(requests.length,3);
    assert.equal($('book-editor').hidden,true); // reader still chooses explicitly
  } finally {await window.happyDOM.close();}
});

test('Postgres: atomic save, unique catalogue works, private notes, validation and role grants',async()=>{
  const db=new PGlite();
  try {
    await db.exec(`create role anon;create role authenticated;create schema auth;
      create table auth.users(id uuid primary key);
      insert into auth.users values ('${userA}'),('${userB}');
      create function auth.uid() returns uuid language sql stable as
        $$ select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid $$;
      grant usage on schema auth to anon,authenticated;`);
    await db.exec(migration);
    await db.exec(migration); // repeat installation is safe
    const save=(rating=8,format='kindle',notes='Private note',title='Orbital',id=work.open_library_work_id)=>db.query(
      'select public.save_book_rating($1,$2,$3::text[],$4,$5,$6,$7,$8) as saved',
      [id,title,work.authors,2023,work.cover_id,rating,format,notes]);
    await db.exec(`set role anon`);
    await assert.rejects(save(),/permission denied/);
    await db.exec(`set role authenticated`);
    await assert.rejects(save(),/Sign in/);
    await db.query("select set_config('request.jwt.claim.sub',$1,false)",[userA]);
    const first=(await save()).rows[0].saved;
    assert.equal(first.progress.rating,8);
    assert.equal(first.progress.user_id,userA);
    assert.equal(first.book.title,'Orbital');
    await save(8.5,'audio','Changed note','Untrusted new title');
    assert.equal((await db.query('select count(*)::integer as n from public.books')).rows[0].n,1);
    assert.equal((await db.query('select title from public.books')).rows[0].title,'Orbital');
    const updated=(await db.query('select * from public.book_progress')).rows[0];
    assert.equal(Number(updated.rating),8.5);assert.equal(updated.reading_format,'audio');assert.equal(updated.notes,'Changed note');
    for(const rating of [0,10.5,7.25,null]) await assert.rejects(save(rating),/Choose a half-point/);
    await assert.rejects(save(8,'paper'),/Choose a half-point/);
    await assert.rejects(save(8,'kindle','x'.repeat(10001),'Bad','/works/OL999999W'),/Choose a half-point/);
    assert.equal((await db.query('select count(*)::integer as n from public.books')).rows[0].n,1);
    // Force the second insert to fail AFTER the catalogue insert: both roll back.
    await db.exec('reset role; alter table public.book_progress add constraint test_forced_failure check (notes <> \'fail-after-book\'); set role authenticated;');
    await assert.rejects(save(8,'audio','fail-after-book','Rollback work','/works/OL999999W'),/test_forced_failure/);
    assert.equal((await db.query('select count(*)::integer as n from public.books')).rows[0].n,1);
    await assert.rejects(db.query("insert into public.books(open_library_work_id,title,authors) values ('/works/OL1W','No',ARRAY['No'])"),/permission denied/);
    await assert.rejects(db.query('update public.book_progress set notes=\'No\''),/permission denied/);
    await db.query("select set_config('request.jwt.claim.sub',$1,false)",[userB]);
    assert.equal((await db.query('select * from public.book_progress')).rows.length,0);
    await save(6,'kindle','Other account');
    assert.equal((await db.query('select * from public.book_progress')).rows.length,1);
    assert.equal((await db.query('select count(*)::integer as n from public.books')).rows[0].n,1);
    await db.query("select set_config('request.jwt.claim.sub',$1,false)",[userA]);
    assert.equal((await db.query('select notes from public.book_progress')).rows[0].notes,'Changed note');
  } finally { await db.close(); }
});

async function setup() {
  const window=new Window({url:'https://example.test/culture-atlas/',settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true}});
  window.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));
  window.HTMLElement.prototype.scrollIntoView=()=>{};
  const state={books:[],ratings:[],history:[],calls:[],fail:false,pending:null};
  const client={from(table) {
    let id;
    const q={select(){return q;},order(){return q;},range(){return q;},in(){return q;},eq(_field,value){id=value;return q;},then(resolve,reject){return Promise.resolve({data:table==='books'?state.books:(table==='book_readings'?state.history:state.ratings).filter(r=>r.user_id===id),error:null}).then(resolve,reject);}};
    return q;
  },async rpc(name,payload){
    state.calls.push({name,payload});
    if(state.pending) await state.pending;
    if(state.fail)return {error:{message:'Network unavailable'}};
    const book={id:1,...work};
    const p={book_id:1,user_id:userA,rating:payload.p_rating,reading_format:payload.p_format,notes:payload.p_notes,updated_at:new Date().toISOString()};
    state.books=[book];state.ratings=[p];return {data:{book,progress:p},error:null};
  }};
  window.eval(source);
  window.CultureBooks.init(client);
  const $=id=>window.document.getElementById(id);
  const flush=()=>new Promise(resolve=>setTimeout(resolve,10));
  const submit=id=>$(id).dispatchEvent(new window.Event('submit',{bubbles:true,cancelable:true}));
  return {window,state,$,flush,submit,client};
}

test('Books UI: search → select → save → edit; errors preserve form; sign-out clears private data',async()=>{
  const {window,state,$,flush,submit}=await setup();
  try {
    await window.CultureBooks.setSession({id:userA});
    window.document.querySelector('[data-section="books"]').click();
    assert.equal($('cinema-area').hidden,true);assert.equal($('books-view').hidden,false);
    assert.equal($('account').parentElement,window.document.body);
    window.document.querySelector('[data-book-tab="search"]').click();
    let fetches=0;
    window.fetch=async()=>{fetches++;return {ok:true,json:async()=>({docs:[{key:work.open_library_work_id,title:work.title,author_name:work.authors,cover_i:work.cover_id,first_publish_year:2023},{key:'/books/OL1M',title:'Invalid edition',author_name:['No']}]})};};
    $('book-query').value='Orbital Samantha Harvey';submit('book-search-form');await flush();
    assert.equal($('book-search-results').querySelectorAll('article').length,1);
    assert.equal(state.books.length,0);assert.equal(state.calls.length,0);
    $('book-search-results').querySelector('button').click();
    $('book-rating').value='8.5';$('book-format').value='audio';$('book-notes').value='<img src=x onerror=alert(1)>';
    state.fail=true;submit('book-rating-form');await flush();
    assert.equal($('book-editor').hidden,false);assert.match($('book-save-status').textContent,/Network unavailable/);
    assert.equal($('book-notes').value,'<img src=x onerror=alert(1)>');
    state.fail=false;submit('book-rating-form');await flush();
    assert.equal($('book-editor').hidden,true);assert.equal(state.books.length,1);
    assert.equal($('book-ratings-grid').querySelectorAll('article').length,1);
    assert.equal($('book-ratings-grid').querySelector('.book-notes').textContent,'<img src=x onerror=alert(1)>');
    assert.equal($('book-ratings-grid').querySelector('.book-notes img'),null);
    assert.match($('book-ratings-grid').textContent,/8.5\/10/);assert.match($('book-ratings-grid').textContent,/Audio/);
    $('book-ratings-grid').querySelector('button').click();
    assert.equal($('book-rating').value,'8.5');assert.equal($('book-format').value,'audio');
    $('book-rating').value='9';submit('book-rating-form');submit('book-rating-form');await flush();
    assert.equal(state.calls.length,3); // failure + success + one edit, no double submit
    await window.CultureBooks.setSession({id:userA});
    assert.match($('book-ratings-grid').textContent,/9\/10/);
    window.document.querySelector('[data-book-tab="search"]').click();submit('book-search-form');await flush();
    assert.equal(fetches,1); // cached explicit repeat
    $('book-search-results').querySelector('button').click();
    await window.CultureBooks.setSession(null);
    assert.equal($('book-editor').hidden,true);assert.equal($('book-notes').value,'');
    assert.equal($('book-ratings-grid').querySelectorAll('article').length,0);
    assert.doesNotMatch($('book-search-results').textContent,/Your rating/);
    assert.equal(window.localStorage.length,0);
    window.document.querySelector('[data-section="films"]').click();assert.equal($('cinema-area').hidden,false);
  } finally { await window.happyDOM.close(); }
});

test('Full page boots with film scripts and shared Account menu still works under Books',async()=>{
  const {window,$,flush,client}=await setup();
  try {
    // A fresh window is needed because the real inline app initializes Books.
    const w=new Window({url:'https://example.test/culture-atlas/',settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true}});
    try {
      w.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));
      w.HTMLElement.prototype.scrollIntoView=()=>{};
      w.supabase={createClient:()=>({...client,auth:{onAuthStateChange(){},getSession:async()=>({data:{session:null}})}})};
      for(const [,name] of markup.matchAll(/<script src="([^"]+)"/g)) {
        if(!/^https?:/.test(name)) w.eval(await readFile(new URL('../'+name,import.meta.url),'utf8'));
      }
      const inline=[...markup.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];
      w.eval(inline);await flush();
      assert.equal(w.document.querySelectorAll('#grid article').length,100);
      assert.equal(w.eval("filmPoster({poster:'assets/film-posters/1451.jpg'})"),'assets/film-posters/1451.jpg');
      assert.equal(w.eval("filmPoster({poster:'assets/film-posters/../../secret.jpg'})"),null);
      assert.equal(w.eval("filmPoster({poster:'https://unknown.test/image.jpg'})"),null);
      w.document.querySelector('[data-section="books"]').click();
      w.document.getElementById('account-toggle').click();
      assert.equal(w.document.getElementById('account').hidden,false);
      w.document.querySelector('[data-section="tv"]').click();
      assert.equal(w.document.getElementById('tv-view').hidden,false);
      assert.equal(w.document.getElementById('books-view').hidden,true);
      assert.equal(w.document.querySelectorAll('[data-tv-edit]').length,w.CULTURE_TV_CATALOG.length);
      w.document.querySelector('[data-section="films"]').click();
      w.document.querySelector('[data-view="awards"]').click();
      assert.equal(w.document.getElementById('awards-view').hidden,false);
      assert.equal(w.document.getElementById('cinema-area').hidden,false);
      w.document.querySelector('[data-view="catalogue"]').click();
      assert.equal(w.document.getElementById('ratings-view').hidden,false);
      assert.match(w.document.getElementById('ratings-count').textContent,/2252 films/);
      assert.doesNotMatch(w.document.getElementById('ratings-grid').textContent,/NaN/);
      w.document.getElementById('ratings-search').value='Spirits of the Dead';
      w.document.getElementById('ratings-search').dispatchEvent(new w.Event('input'));
      assert.equal(w.document.querySelectorAll('#ratings-grid article').length,1);
      w.document.getElementById('ratings-search').value='Cardiogram of Love';
      w.document.getElementById('ratings-search').dispatchEvent(new w.Event('input'));
      assert.equal(w.document.querySelector('#ratings-grid img').getAttribute('src'),'assets/film-posters/1451.jpg');
      const addFilm=[...w.document.querySelectorAll('#cinema-area button')].find(b=>b.textContent==='Add film');addFilm.click();
      assert.equal(w.document.getElementById('media-dialog').open,true);
      assert.match(w.document.getElementById('media-status').textContent,/Sign in/);
    } finally {await w.happyDOM.close();}
  } finally {await window.happyDOM.close();}
});

test('Books UI: signed-out save, API failures and account changes during save never expose old notes',async()=>{
  const {window,state,$,flush,submit}=await setup();
  try {
    await window.CultureBooks.setSession(null);
    window.fetch=async()=>({ok:false,status:429});
    $('book-query').value='Orbital';submit('book-search-form');await flush();
    assert.match($('book-search-status').textContent,/busy/);
    window.fetch=async()=>({ok:true,json:async()=>({docs:[]})});
    submit('book-search-form');await new Promise(resolve=>setTimeout(resolve,1100));await flush();assert.match($('book-search-status').textContent,/No close matches/);
    $('book-query').value='Orbital Samantha Harvey';
    window.fetch=async()=>({ok:true,json:async()=>({docs:[{key:work.open_library_work_id,title:work.title,author_name:work.authors}]})});
    submit('book-search-form');await flush();$('book-search-results').querySelector('button').click();
    $('book-rating').value='7';$('book-format').value='kindle';submit('book-rating-form');await flush();
    assert.equal(state.calls.length,0);assert.match($('book-save-status').textContent,/Sign in/);
    await window.CultureBooks.setSession({id:userA});
    $('book-search-results').querySelector('button').click();$('book-rating').value='7';$('book-format').value='kindle';$('book-notes').value='private A';
    let resolve;state.pending=new Promise(r=>{resolve=r;});
    submit('book-rating-form');await flush();
    await window.CultureBooks.setSession({id:userB});
    assert.equal($('book-editor').hidden,true);assert.equal($('book-notes').value,'');
    resolve();await flush();
    assert.doesNotMatch($('book-ratings-grid').textContent,/private A/);
    assert.doesNotMatch($('book-sync-status').textContent,/Saved/);
  } finally { await window.happyDOM.close(); }
});

test('Search regression: Tehran title retries without The, keeps selection explicit and caches the result',async()=>{
  const {window,state,$,flush,submit}=await setup();
  try {
    const queries=[];
    window.fetch=async url=>{
      const q=new URL(url).searchParams.get('q');queries.push(q);
      return {ok:true,json:async()=>({docs:q.startsWith('title_suggest:"The ')?[]:[{key:'/works/OL42426263W',title:'Nights Are Quiet in Tehran',author_name:['Shida Bazyar','Ruth Martin'],first_publish_year:2025}]})};
    };
    $('book-query').value='The nights are quiet in Tehran';submit('book-search-form');
    await new Promise(resolve=>setTimeout(resolve,1100));await flush();
    assert.deepEqual(queries,['title_suggest:"The nights are quiet in Tehran"','title_suggest:"nights are quiet in Tehran"']);
    assert.match($('book-search-status').textContent,/Found using a shorter search/);
    assert.equal($('book-search-results').querySelectorAll('article').length,1);
    assert.match($('book-search-results').textContent,/Shida Bazyar/);
    assert.equal($('book-query').value,'The nights are quiet in Tehran');
    assert.equal(state.calls.length,0);assert.equal($('book-editor').hidden,true);
    $('book-search-results').querySelector('button').click();
    assert.equal($('book-selected-title').textContent,'Nights Are Quiet in Tehran');
    assert.equal($('book-editor').hidden,false);
    submit('book-search-form');await flush();
    assert.equal(queries.length,2);
    // A successful original query must not trigger broader searches.
    $('book-query').value='Shida Bazyar';submit('book-search-form');await flush();
    assert.deepEqual(queries,['title_suggest:"The nights are quiet in Tehran"','title_suggest:"nights are quiet in Tehran"','title_suggest:"Shida Bazyar"']);
  } finally {await window.happyDOM.close();}
});

test('Book star picker: half points, keyboard, clear, draft-only changes and existing rating editing',async()=>{
  const {window,state,$,flush,submit}=await setup();
  try {
    state.books=[{id:1,...work}];
    state.ratings=[{user_id:userA,book_id:1,rating:7,reading_format:'kindle',notes:'Keep these notes',updated_at:new Date().toISOString()}];
    await window.CultureBooks.setSession({id:userA});
    $('book-ratings-grid').querySelector('button').click();
    const trigger=$('book-rating-trigger'),picker=$('book-star-picker');
    assert.equal($('book-rating').type,'hidden');assert.match(trigger.textContent,/7.0\/10/);
    trigger.click();assert.equal(picker.hidden,false);assert.equal(trigger.getAttribute('aria-expanded'),'true');
    const eighth=picker.querySelectorAll('.star-choice')[7];
    eighth.getBoundingClientRect=()=>({left:100,width:30});
    eighth.dispatchEvent(new window.MouseEvent('click',{bubbles:true,detail:1,clientX:105}));
    assert.equal($('book-rating').value,'7.5');assert.equal(picker.hidden,true);
    assert.match(trigger.textContent,/7.5\/10/);assert.equal(state.calls.length,0);
    assert.equal($('book-notes').value,'Keep these notes');
    trigger.click();
    picker.dispatchEvent(new window.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
    assert.match(picker.querySelector('.rating-preview').textContent,/8.0/);
    picker.dispatchEvent(new window.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));
    assert.equal($('book-rating').value,'8');
    trigger.click();picker.querySelector('.clear-rating').click();
    assert.equal($('book-rating').value,'');assert.match(trigger.textContent,/Rate/);
    submit('book-rating-form');await flush();assert.equal(state.calls.length,0);
    trigger.click();picker.querySelectorAll('.star-choice')[8].click();
    assert.equal($('book-rating').value,'9');
    trigger.click();picker.dispatchEvent(new window.KeyboardEvent('keydown',{key:'ArrowLeft',bubbles:true}));
    picker.dispatchEvent(new window.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
    assert.equal($('book-rating').value,'9'); // Escape discards preview
    submit('book-rating-form');await flush();
    assert.equal(state.calls.length,1);assert.equal(state.calls[0].payload.p_rating,9);
    $('book-ratings-grid').querySelector('button').click();assert.match(trigger.textContent,/9.0\/10/);
    trigger.click();await window.CultureBooks.setSession(null);
    assert.equal(picker.hidden,true);assert.equal($('book-rating').value,'');
  } finally {await window.happyDOM.close();}
});

test('Prepared import UI previews before applying, supports local books and clears private history on sign-out',async()=>{
  const {window,state,$,flush,client}=await setup();
  try {
    await window.CultureBooks.setSession({id:userA});
    const payload={format:'culture-atlas-books-import-prepared-v1',books:[{title:'<Unmatched collection>',author:'An Author',open_library_work_id:null,latest_source_key:'read:1'}],readings:[{source_key:'read:1',rating:7.5,reading_format:'audio',read_date:'2022-07-01',read_date_precision:'month',read_year:2022}]};
    client.rpc=async(name,args)=>{
      state.calls.push({name,payload:args});
      if(name==='import_book_readings') {
        if(args.p_apply){state.books=[{id:99,open_library_work_id:null,title:'<Unmatched collection>',authors:['An Author'],work_scope:'collection'}];state.ratings=[{user_id:userA,book_id:99,rating:7.5,reading_format:'audio',notes:'Current notes',updated_at:'2026-10-22'}];state.history=[{user_id:userA,book_id:99,...payload.readings[0],notes:'<Private historical note>'}];}
        return {data:{new_books:1,new_readings:1,new_ratings:1,preserved_ratings:0}};
      }
      return {error:{message:'Save test response'}};
    };
    Object.defineProperty($('book-import-file'),'files',{configurable:true,value:[{size:1000,text:async()=>JSON.stringify(payload)}]});
    $('book-import-file').dispatchEvent(new window.Event('change'));await flush();
    assert.equal(state.calls.length,1);assert.equal(state.calls[0].payload.p_apply,false);
    assert.match($('book-import-preview').textContent,/July 2022/);
    assert.equal($('book-import-preview').querySelector('unmatched'),null);
    assert.equal($('book-import-apply').hidden,false);
    $('book-import-apply').click();await flush();await flush();
    assert.equal(state.calls[1].payload.p_apply,true);
    assert.match($('book-ratings-grid').textContent,/July 2022/);
    assert.match($('book-ratings-grid').textContent,/Collection/);
    assert.equal($('book-ratings-grid').querySelector('h3 a').getAttribute('href'),'#/books/local-99');
    $('book-ratings-grid').querySelector('button').click();
    assert.match($('book-reading-history').textContent,/<Private historical note>/);
    assert.equal($('book-reading-history').querySelector('private'),null);
    $('book-rating-form').dispatchEvent(new window.Event('submit',{cancelable:true}));await flush();
    assert.equal(state.calls.at(-1).name,'update_book_rating');assert.equal(state.calls.at(-1).payload.p_book_id,99);
    await window.CultureBooks.setSession(null);
    assert.equal($('book-reading-history').textContent,'');assert.equal($('book-import-preview').textContent,'');
    assert.equal($('book-import-apply').hidden,true);
  } finally {await window.happyDOM.close();}
});

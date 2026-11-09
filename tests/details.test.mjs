import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {Window} from 'happy-dom';
const root=new URL('../',import.meta.url),markup=await readFile(new URL('index.html',root),'utf8');
const sources=await Promise.all([...markup.matchAll(/<script src="([^"]+)"/g)].filter(([,name])=>!/^https?:/.test(name)).map(async([,name])=>readFile(new URL(name,root),'utf8')));
const inline=[...markup.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];
const tick=()=>new Promise(r=>setTimeout(r,25));
async function setup(options={}){
 const w=new Window({url:'https://example.test/',settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});
 w.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};
 w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;this.dispatchEvent(new w.Event('close'));};
 const state={user:{id:'owner-a',email:'reader@example.test'},fail:false,writes:[],film:{film_id:229,watched:true,rating:8,notes:'<em>My private note</em>',watched_date:'2026-09-01',updated_at:'2026-10-22T10:00:00Z'}};if(options.film)Object.assign(state.film,options.film);
 const client={auth:{onAuthStateChange(_callback){state.authCallback=_callback;},getSession:async()=>({data:{session:state.user?{user:state.user}:null}})},from(table){let mutation,values,filters={};
  const q={select(){return q;},eq(k,v){filters[k]=v;return q;},in(){return q;},order(){return q;},range(){return q;},upsert(v){mutation='upsert';values=v;return q;},update(v){mutation='update';values=v;return q;},insert(v){mutation='insert';values=v;return q;},single(){return q;},maybeSingle(){return q;},then(resolve,reject){
   if(mutation){state.writes.push({table,mutation,values});if(state.fail)return Promise.resolve({error:{message:'Save unavailable'}}).then(resolve,reject);state.film={...state.film,...values};return Promise.resolve({data:state.film}).then(resolve,reject);}
   if(table==='book_readings'&&options.history)return options.history(filters).then(resolve,reject);
   return Promise.resolve({data:table==='film_progress'?[state.film]:table==='books'?[{id:99,title:'A book',authors:['Author'],open_library_work_id:null,goodreads_id:'123'}]:table==='book_progress'?[{book_id:99,rating:7.5,reading_format:'audio',notes:'Private book note'}]:[]}).then(resolve,reject);
  }};return q;
 },functions:{invoke:async()=>({data:{metadata:{overview:'Synopsis',cast:['Actor A'],tmdb_rating:8}}})}};
 w.fetch=async url=>String(url).startsWith('assets/film-details/')&&options.filmDetails?options.filmDetails(url):({ok:true,json:async()=>({})});w.supabase={createClient:()=>client};for(const s of sources)w.eval(s);w.eval(inline);await tick();
 return {w,state,$:id=>w.document.getElementById(id),close:()=>w.happyDOM.close()};
}
test('Film popup edits stars, date and escaped notes explicitly; failed saves retain the draft',async()=>{
 const a=await setup();try{
  const {w,$,state}=a;w.CultureRouter.openFilm(229);assert.equal($('film-detail-dialog').open,true);assert.equal($('film-detail-form').hidden,true);
  assert.match($('film-personal-read').textContent,/<em>My private note<\/em>/);assert.equal($('film-personal-read').querySelector('em'),null);
  $('film-detail-edit').click();assert.equal($('film-detail-edit').textContent,'Save');$('film-detail-notes').value='A changed note';$('film-detail-date').value='2026-10-20';
  $('film-detail-stars').click();const picker=$('film-detail-dialog').querySelector('.star-picker');assert.equal(picker.parentElement,$('film-detail-dialog'));
  picker.dispatchEvent(new w.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));picker.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));assert.equal(state.writes.length,0);picker.querySelector('.rating-save').click();
  state.fail=true;$('film-detail-edit').click();await tick();assert.equal($('film-detail-notes').value,'A changed note');assert.match($('film-detail-status').textContent,/Save unavailable/);assert.equal($('film-detail-form').hidden,false);
  state.fail=false;$('film-detail-edit').click();await tick();assert.equal(state.writes.at(-1).values.rating,8.5);assert.equal(state.writes.at(-1).values.watched_date,'2026-10-20');assert.equal($('film-detail-form').hidden,true);assert.equal($('film-detail-dialog').open,true);assert.match($('film-personal-read').textContent,/A changed note/);
  assert.doesNotMatch(w.location.hash,/note|8.5/);assert.doesNotMatch(w.localStorage.getItem('culture-atlas:films:v1')||'',/private|changed note/);
 }finally{await a.close();}
});
test('Account changes clear private film popup content and compact book cards keep notes in details',async()=>{
 const a=await setup();try{
  const {w,$,state}=a;w.CultureRouter.openFilm(229);$('film-detail-edit').click();$('film-detail-notes').value='Unsaved private draft';
  state.user=null;state.authCallback('SIGNED_OUT',null);await tick();assert.equal($('film-detail-form').hidden,true);assert.doesNotMatch($('film-detail-content').textContent,/private/);
  w.CultureRouter.navigate({section:'books',view:'catalogue'});await w.CultureBooks.setSession({id:'owner-a'});
  const card=$('book-catalogue-grid').querySelector('article');assert.doesNotMatch(card.textContent,/Private book note|Audio|Goodreads/);card.click();
  assert.equal($('book-editor').open,true);assert.equal($('book-rating-form').hidden,true);assert.match($('book-detail-personal').textContent,/Private book note/);assert.match($('book-detail-summary').textContent,/Goodreads/);
  $('book-detail-edit').click();assert.equal($('book-detail-edit').textContent,'Save');$('book-detail-close').click();assert.equal($('book-editor').open,false);
 }finally{await a.close();}
});
test('Film list stars stage changes and clear until explicit Save; dismissing cancels them',async()=>{
 const a=await setup();try{const{w,$,state}=a;w.CultureRouter.navigate({section:'films',view:'catalogue',params:{q:'Dreams'}});const trigger=$('ratings-grid').querySelector('[data-open-stars="229"]');assert.ok(trigger);trigger.click();const p=w.document.body.querySelector(':scope > .star-picker');assert.ok(p);p.querySelector('[data-index="8"]').click();assert.equal(state.writes.length,0);assert.equal(p.hidden,false);assert.match(trigger.textContent,/8.0/);p.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));trigger.click();assert.match(p.querySelector('.rating-preview').textContent,/8.0/);p.querySelector('[data-index="8"]').click();p.querySelector('.rating-save').click();await tick();assert.equal(state.writes.length,1);assert.equal(state.writes[0].values.rating,9);
 }finally{await a.close();}
});

test('Reading history is deferred, scoped and cached without resetting drafts',async()=>{let finish,calls=[];const a=await setup({history:filters=>{calls.push(filters);return new Promise(r=>finish=r)}});try{assert.equal(calls.length,0);a.w.CultureRouter.openBook('local-99');await tick();assert.equal(calls.length,1);assert.equal(calls[0].user_id,'owner-a');assert.equal(calls[0].book_id,99);assert.match(a.$('book-reading-history').textContent,/Loading/);a.$('book-detail-edit').click();a.$('book-notes').value='Keep my draft';finish({data:[{book_id:99,rating:8,reading_format:'audio',notes:'Historic note',read_date_precision:'year',read_year:2020}]});await tick();assert.match(a.$('book-reading-history').textContent,/Historic note/);assert.equal(a.$('book-notes').value,'Keep my draft');a.$('book-detail-close').click();await tick();a.w.CultureRouter.openBook('local-99');await tick();assert.equal(calls.length,1);}finally{await a.close()}});
test('History errors retry and late private history is ignored after sign-out',async()=>{let calls=0,finish;const a=await setup({history:()=>{calls++;return calls===1?Promise.resolve({error:{message:'Unavailable'}}):new Promise(r=>finish=r)}});try{a.w.CultureRouter.openBook('local-99');await tick();assert.match(a.$('book-reading-history').textContent,/could not load/);a.$('book-reading-history').querySelector('button').click();await tick();assert.equal(calls,2);a.state.user=null;a.state.authCallback('SIGNED_OUT',null);await tick();finish({data:[{book_id:99,notes:'Do not reveal',rating:8,reading_format:'audio',read_date_precision:'year',read_year:2020}]});await tick();assert.doesNotMatch(a.$('book-reading-history').textContent,/Do not reveal/);assert.doesNotMatch(a.$('book-detail-personal').textContent,/Private book note/);}finally{await a.close()}});

test('Late full film metadata hydrates public details without changing drafts or a different film',async()=>{let finish;const a=await setup({filmDetails:()=>new Promise(r=>finish=r)});try{a.w.CultureRouter.openFilm(229);a.$('film-detail-edit').click();a.$('film-detail-notes').value='Draft to preserve';const file=a.w.CULTURE_FILM_DETAIL_FILES[2],data=JSON.parse(await readFile(new URL('assets/film-details/'+file,root),'utf8'));finish({ok:true,json:async()=>data});await tick();assert.equal(a.$('film-detail-notes').value,'Draft to preserve');assert.equal(a.$('film-detail-edit').textContent,'Save');assert.ok(a.$('film-detail-content').querySelector('[data-film-public]').textContent.includes(data.films[229].overview));a.w.CultureRouter.openFilm(1);await tick();a.w.CultureRouter.openFilm(2);finish({ok:true,json:async()=>JSON.parse(await readFile(new URL('assets/film-details/'+a.w.CULTURE_FILM_DETAIL_FILES[0],root),'utf8'))});await tick();assert.match(a.$('film-detail-content').textContent,/Sentimental Value/);assert.doesNotMatch(a.$('film-detail-content').textContent,/Draft to preserve/);}finally{await a.close()}});

test('Film quick ratings send a date for first ratings and preserve known and unknown dates on edits',async()=>{
 for(const [rating,date] of [[null,null],[8,'2024-03-02'],[8,null]]){
 const a=await setup({film:{rating,watched_date:date}});try{
  a.w.CultureRouter.navigate({section:'films',view:'catalogue',params:{q:'Dreams'}});
  a.$('ratings-grid').querySelector('[data-open-stars="229"]').click();
  const picker=a.w.document.body.querySelector(':scope > .star-picker');picker.querySelector('[data-index="8"]').click();picker.querySelector('.rating-save').click();await tick();
  const saved=a.state.writes.at(-1).values.watched_date;
  if(rating===null)assert.match(saved,/^\d{4}-\d{2}-\d{2}$/);else assert.equal(saved,date);
 }finally{await a.close();}
 }
});

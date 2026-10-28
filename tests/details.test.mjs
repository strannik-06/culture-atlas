import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {Window} from 'happy-dom';
const root=new URL('../',import.meta.url),markup=await readFile(new URL('index.html',root),'utf8');
const sources=await Promise.all([...markup.matchAll(/<script src="([^"]+)"/g)].filter(([,name])=>!/^https?:/.test(name)).map(async([,name])=>readFile(new URL(name,root),'utf8')));
const inline=[...markup.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];
const tick=()=>new Promise(r=>setTimeout(r,25));
async function setup(){
 const w=new Window({url:'https://example.test/',settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});
 w.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};
 w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;this.dispatchEvent(new w.Event('close'));};
 const state={user:{id:'owner-a',email:'reader@example.test'},fail:false,writes:[],film:{film_id:229,watched:true,rating:8,notes:'<em>My private note</em>',watched_date:'2026-09-01',updated_at:'2026-10-22T10:00:00Z'}};
 const client={auth:{onAuthStateChange(_callback){state.authCallback=_callback;},getSession:async()=>({data:{session:state.user?{user:state.user}:null}})},from(table){let mutation,values;
  const q={select(){return q;},eq(){return q;},in(){return q;},order(){return q;},range(){return q;},upsert(v){mutation='upsert';values=v;return q;},update(v){mutation='update';values=v;return q;},insert(v){mutation='insert';values=v;return q;},single(){return q;},maybeSingle(){return q;},then(resolve,reject){
   if(mutation){state.writes.push({table,mutation,values});if(state.fail)return Promise.resolve({error:{message:'Save unavailable'}}).then(resolve,reject);state.film={...state.film,...values};return Promise.resolve({data:state.film}).then(resolve,reject);}
   return Promise.resolve({data:table==='film_progress'?[state.film]:table==='books'?[{id:99,title:'A book',authors:['Author'],open_library_work_id:null,goodreads_id:'123'}]:table==='book_progress'?[{book_id:99,rating:7.5,reading_format:'audio',notes:'Private book note'}]:[]}).then(resolve,reject);
  }};return q;
 },functions:{invoke:async()=>({data:{metadata:{overview:'Synopsis',cast:['Actor A'],tmdb_rating:8}}})}};
 w.fetch=async()=>({ok:true,json:async()=>({})});w.supabase={createClient:()=>client};for(const s of sources)w.eval(s);w.eval(inline);await tick();
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

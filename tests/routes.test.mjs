import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {Window} from 'happy-dom';
const markup=await readFile(new URL('../index.html',import.meta.url),'utf8');
const sources=await Promise.all([...markup.matchAll(/<script src="([^"]+)"/g)].filter(([,name])=>!/^https?:/.test(name)).map(async([,name])=>readFile(new URL('../'+name,import.meta.url),'utf8')));
const inline=[...markup.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];
const tick=()=>new Promise(r=>setTimeout(r,30));
async function boot(hash='',options={}){
 const w=new Window({url:'https://example.test/culture-atlas/'+hash,settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});
 w.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));
 w.HTMLElement.prototype.scrollIntoView=()=>{};
 // Happy DOM does not implement modal methods consistently across versions.
 w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};
 w.HTMLDialogElement.prototype.close=function(){this.open=false;this.dispatchEvent(new w.Event('close'));};
 const state={books:[],media:[],...options},calls=[];if(options.returnRoute)w.sessionStorage.setItem('culture-atlas:return-route',options.returnRoute);
 w.fetch=async url=>{calls.push(String(url));return {ok:true,json:async()=>({docs:[{key:'/works/OL42W',title:'A shared book',author_name:['Author']} ]})};};
 const client={from(table){let filter;const q={select(){return q;},order(){return q;},range(){return q;},in(){return q;},eq(k,v){filter=v;return q;},then(resolve,reject){return Promise.resolve({data:table==='books'?state.books:table==='media_catalogue'?state.media:[],error:null}).then(resolve,reject);}};return q;},auth:{onAuthStateChange(){},getSession:async()=>{state.authHash=w.location.hash;if(state.authGate)await state.authGate;return {data:{session:state.user?{user:state.user}:null}};}}};
 state.invocations=[];client.functions={invoke:async(_name,{body})=>{state.invocations.push(body);return {data:{results:[],page:1,total_pages:1}};}};
 w.supabase={createClient:()=>client};
 for(const s of sources)w.eval(s);
 w.eval(inline);await tick();
 return {w,$:id=>w.document.getElementById(id),calls,state,close:()=>w.happyDOM.close()};
}
test('Routes: typed stable IDs, canonical defaults, public allowlist and malformed input',async()=>{
 const w=new Window({settings:{enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});
 try{
  w.eval(await readFile(new URL('../routes.js',import.meta.url),'utf8'));const r=w.CultureRoutes;
  for(const hash of ['#/films/top100','#/films/229?from=catalogue&page=3&q=Dreams','#/tv/1399/season/0?from=ratings','#/tv/movie/126850','#/tv/imdb/tt4324832','#/tv/local/good-night-little-ones-tatarskiy-opening','#/books/OL42W','#/books/search?author=Douglas+Stuart&q=John+of+John'])assert.equal(r.format(r.parse(hash)),hash);
  for(const hash of ['#/unknown','#/films/nope','#/films/1/garbage','#/tv/1/season/-1','#/books/OL2W/bad','#/films/%zz'])assert.equal(r.parse(hash),null);
  const safe=r.format(r.parse('#/films/catalogue?notes=secret&rating=9&access_token=token&page=-2&q=%3Cscript%3E'));
  assert.equal(safe,'#/films/catalogue?q=%3Cscript%3E');assert.equal(r.format(r.parse('#/films')),'#/films/top100');
 }finally{await w.happyDOM.close();}
});
test('Navigation: filters/page refresh, real film links, modal Back/Forward and close preserve list',async()=>{
 const a=await boot('#/films/catalogue?sort=title&page=3');
 try{
  const {w,$}=a;assert.equal($('ratings-view').hidden,false);assert.equal($('ratings-sort').value,'title');assert.match($('ratings-pagination').textContent,/Page 3/);
  const link=$('ratings-grid').querySelector('h3 a'),id=link.getAttribute('href').split('/').pop();link.click();
  assert.equal(w.location.hash,`#/films/${id}?from=catalogue&page=3&sort=title`);assert.equal($('film-detail-dialog').open,true);
  w.history.back();await tick();assert.equal(w.location.hash,'#/films/catalogue?page=3&sort=title');assert.equal($('film-detail-dialog').open,false);assert.match($('ratings-pagination').textContent,/Page 3/);
  w.history.forward();await tick();assert.equal($('film-detail-dialog').open,true);
  $('film-detail-dialog').querySelector('.film-detail-close').click();await tick();assert.equal($('film-detail-dialog').open,false);
  $('ratings-search').value='Tarkovsky';$('ratings-search').dispatchEvent(new w.Event('input',{bubbles:true}));assert.match(w.location.hash,/q=Tarkovsky/);assert.doesNotMatch(w.location.hash,/page=3/);
  const reload=await boot(w.location.hash);try{assert.equal(reload.$('ratings-search').value,'Tarkovsky');assert.equal(reload.$('ratings-sort').value,'title');}finally{await reload.close();}
 }finally{await a.close();}
});
test('Direct film links and invalid identities are read-only, close falls back without leaving site',async()=>{
 const a=await boot('#/films/229');
 try{
  assert.equal(a.$('film-detail-dialog').open,true);assert.match(a.w.document.title,/Dreams/);
  a.$('film-detail-dialog').dispatchEvent(new a.w.Event('cancel',{cancelable:true}));await tick();assert.equal(a.w.location.hash,'#/films/top100');assert.equal(a.$('film-detail-dialog').open,false);
  a.w.CultureRouter.navigate({section:'films',view:'catalogue',entity:'999999999'});assert.equal(a.$('route-status').hidden,false);assert.equal(a.$('film-detail-dialog').open,false);
  a.w.CultureRouter.navigate({section:'books',view:'ratings'});assert.equal(a.$('route-status').hidden,true);assert.equal(a.$('books-view').hidden,false);
 }finally{await a.close();}
});
test('TV season and book deep links survive public catalogue loading; notes are never URL state',async()=>{
 const showSource=await readFile(new URL('../tv-catalog.js',import.meta.url),'utf8');
 const a=await boot('#/tv/catalogue?q=Decalogue&sort=title');
 try{
  const {w,$}=a;assert.equal($('tv-view').hidden,false);assert.equal($('tv-search').value,'Decalogue');
  for(const item of w.CULTURE_TV_CATALOG)assert.ok(w.CultureRoutes.tvRoute(item.id).entity,'Unroutable TV identity: '+item.id);
  const season=w.CULTURE_TV_CATALOG.find(s=>s.series_kind==='season');assert.ok(season,showSource.slice(0,30));
  const route=w.CultureRoutes.tvRoute(season.id);w.CultureRouter.navigate(route);assert.equal($('tv-editor').hidden,false);assert.equal($('tv-selected-title').textContent,season.title);assert.equal($('tv-rating').disabled,true);
  const reload=await boot(w.location.hash);try{assert.equal(reload.$('tv-selected-title').textContent,season.title);}finally{await reload.close();}
  a.state.books=[{id:42,open_library_work_id:'/works/OL42W',title:'A shared book',authors:['Author']}];
  w.CultureRouter.navigate({section:'books',view:'catalogue',entity:'OL42W'});assert.equal($('route-status').hidden,false);
  await w.CultureBooks.setSession(null);await tick();assert.equal($('book-editor').hidden,false);assert.equal($('book-selected-title').textContent,'A shared book');assert.equal($('route-status').hidden,true);
  $('book-notes').value='private thoughts';$('book-notes').dispatchEvent(new w.Event('input',{bubbles:true}));assert.doesNotMatch(w.location.href,/private|notes|rating=/);
  $('book-cancel').click();await tick();assert.equal(w.location.hash,'#/books/catalogue');
 }finally{await a.close();}
});
test('Search routes restore public queries, section switches close dialogs, OAuth keeps tokens for SDK',async()=>{
 const a=await boot('#/books/search?q=John+of+John&author=Douglas+Stuart');
 try{
  const {w,$}=a;assert.equal($('book-query').value,'John of John');assert.equal($('book-author').value,'Douglas Stuart');assert.ok(a.calls.length);
  w.document.querySelector('[data-section="films"]').click();w.document.querySelector('[data-media-type="movie"]').click();assert.equal(w.location.hash,'#/films/search');assert.equal($('media-dialog').open,true);
  w.document.querySelector('[data-section="tv"]').click();assert.equal($('media-dialog').open,false);assert.equal($('tv-view').hidden,false);assert.equal($('books-view').hidden,true);
  const before=w.location.hash;assert.equal(w.CultureRouter.authRedirect(),'https://example.test/culture-atlas/');assert.equal(w.sessionStorage.getItem('culture-atlas:return-route'),before);
 }finally{await a.close();}
});

test('Auth callback fragment remains intact until the SDK reads it, then restores the prior public route',async()=>{
 let release;const gate=new Promise(r=>release=r);
 const a=await boot('#access_token=private-token&refresh_token=private-refresh',{authGate:gate,returnRoute:'#/tv/1399/season/2'});
 try{
  assert.match(a.state.authHash,/private-token/);assert.match(a.w.location.hash,/private-token/);
  release();await tick();assert.equal(a.w.location.hash,'#/tv/1399/season/2');assert.doesNotMatch(a.w.location.href,/private-token|private-refresh/);
 }finally{release();await a.close();}
});

test('An unsaved book URL resolves public work and author metadata without writing to Supabase',async()=>{
 const a=await boot();
 try{
  const requests=[];a.w.fetch=async url=>{requests.push(String(url));return {ok:true,json:async()=>String(url).includes('/authors/')?{name:'Public Author'}:{title:'Unsaved book',authors:[{author:{key:'/authors/OL7A'}}],covers:[123]}};};
  a.w.CultureRouter.navigate({section:'books',view:'catalogue',entity:'OL99W'});await tick();
  assert.equal(a.$('book-selected-title').textContent,'Unsaved book');assert.equal(a.$('book-selected-author').textContent,'Public Author');assert.equal(requests.length,2);assert.equal(a.state.books.length,0);
 }finally{await a.close();}
});

test('Newly added film deep links wait for the public dynamic catalogue',async()=>{
 const a=await boot('#/films/1000000001',{media:[{work_type:'movie',metadata:{id:1000000001,title:'Dynamic film',director:'Director',year:2026}}]});
 try{assert.equal(a.$('film-detail-dialog').open,true);assert.match(a.$('film-detail-content').textContent,/Dynamic film/);assert.equal(a.$('route-status').hidden,true);}finally{await a.close();}
});

test('Authenticated search URLs restore the correct media type without repeating searches on refresh callbacks',async()=>{
 const a=await boot('#/films/search?q=Dune',{user:{id:'test-user',email:'test@example.test'}});
 try{
  await tick();assert.equal(a.state.invocations.length,1);assert.equal(a.state.invocations[0].type,'movie');
  a.w.CultureRouter.refresh();await tick();assert.equal(a.state.invocations.length,1);
  a.w.CultureRouter.navigate({section:'tv',view:'search',params:{q:'Dark'}});await tick();assert.equal(a.state.invocations.at(-1).type,'tv');assert.match(a.$('media-heading').textContent,/TV series/);
  a.w.CultureRouter.navigate({section:'films',view:'search',params:{director:'525',year:'2010'}});await tick();const body=a.state.invocations.at(-1);assert.equal(body.type,'movie');assert.equal(body.person_id,525);assert.equal(body.year,'2010');
  a.w.CultureRouter.refresh();await tick();assert.equal(a.state.invocations.length,3);
 }finally{await a.close();}
});

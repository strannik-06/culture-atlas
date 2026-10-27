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
 const client={from(table){let filter;const q={select(){return q;},order(){return q;},range(){return q;},in(){return q;},eq(k,v){filter=v;return q;},then(resolve,reject){return Promise.resolve({data:table==='books'?state.books:table==='media_catalogue'?state.media:table==='tv_progress'?(state.tvRows||[]):[],error:null}).then(resolve,reject);}};return q;},auth:{onAuthStateChange(){},getSession:async()=>{state.authHash=w.location.hash;if(state.authGate)await state.authGate;return {data:{session:state.user?{user:state.user}:null}};}}};
 state.rpcCalls=[];client.rpc=async(name,payload)=>{state.rpcCalls.push({name,payload});return {error:{message:'Changed on another device'}};};
 state.invocations=[];client.functions={invoke:async(_name,{body})=>{state.invocations.push(body);return {data:{results:[],page:1,total_pages:1}};}};
 w.supabase={createClient:()=>client};
 for(const s of sources)w.eval(s);
 w.eval(inline);await tick();
 return {w,$:id=>w.document.getElementById(id),calls,state,close:()=>w.happyDOM.close()};
}
const official=JSON.parse(await readFile(new URL('../imports/tv-awards-2025-source.json',import.meta.url),'utf8'));
test('2025 TV pilot preserves all ten complete official category lists and canonical programme references',async()=>{
 const a=await boot('#/tv/awards');try{
 const events=a.w.CULTURE_TV_AWARDS,shows=a.w.CULTURE_TV_CATALOG;assert.equal(events.length,3);assert.equal(events.flatMap(e=>e.categories).length,10);assert.equal(events.flatMap(e=>e.categories.flatMap(c=>c.entries)).length,57);
 for(const e of events){const src=official.events.find(x=>x.event===e.event);assert.equal(e.year,2025);assert.match(e.note,/eligible run/);for(const c of e.categories){const expected=src.categories.find(x=>x.name===c.name);assert.equal(c.entries.length,expected.entries.length);assert.equal(c.entries.filter(r=>r.winner).length,1);for(const r of c.entries){const original=expected.entries.find(x=>(x.display_title||x.title)===r.display_title);assert.ok(original);assert.equal(r.winner,original.winner);assert.equal(shows.filter(w=>w.id===r.item_id).length,1);}}}
 assert.equal(a.$('tv-award-tabs').children.length,3);assert.equal(a.$('tv-awards-grid').querySelectorAll('article').length,21);assert.equal(a.$('tv-list-view').hidden,true);assert.equal(a.state.rpcCalls.length,0);
 }finally{await a.close();}
});
test('TV award tabs, winners, category URLs, details refresh and browser Back preserve the award list',async()=>{
 const a=await boot('#/tv/awards?event=Golden+Globes&year=2025');try{const {w,$}=a;
 assert.equal($('tv-award-edition-title').textContent,'Golden Globes 2025');assert.equal($('tv-awards-grid').querySelector('.award-category article').classList.contains('award-winner'),true);
 $('tv-awards-grid').querySelector('h3 a').click();assert.equal($('tv-editor').open,true);assert.match(w.location.hash,/from=awards/);assert.match(w.location.hash,/event=Golden/);
 const b=await boot(w.location.hash);try{assert.equal(b.$('tv-editor').open,true);b.$('tv-detail-close').click();assert.equal(b.$('tv-awards-view').hidden,false);assert.equal(b.$('tv-award-edition-title').textContent,'Golden Globes 2025');}finally{await b.close();}
 w.history.back();await tick();assert.equal($('tv-editor').open,false);assert.equal($('tv-awards-view').hidden,false);
 w.CultureRouter.navigate({section:'tv',view:'awards',params:{event:'BAFTA Television',year:'2025',category:'limited-drama',result:'winners'}});assert.equal($('tv-awards-grid').querySelectorAll('article').length,1);assert.match($('tv-awards-grid').textContent,/Mr Bates/);
 w.CultureRouter.navigate({section:'tv',view:'awards',params:{event:'Emmys',year:'2024'}});assert.match($('tv-awards-grid').textContent,/not been added/);
 }finally{await a.close();}
});
test('Award cards reuse whole-series ratings and preserve separately rated seasons and private notes',async()=>{
 const a=await boot('#/tv/awards?event=Emmys&year=2025',{user:{id:'u'},tvRows:[{work_key:'tv:83867',rating:8.5,rating_scope:'whole_work',notes:'Private series note',updated_at:'v1'},{work_key:'tv:83867:season:1',rating:9,rating_scope:'whole_work',notes:'Private season note',updated_at:'v2'}]});try{
 const card=a.$('tv-awards-grid').querySelector('[data-tv-work="tv:83867"]');assert.match(card.querySelector('.star-trigger').textContent,/8.5/);assert.doesNotMatch(card.textContent,/Private/);card.querySelector('h3 a').click();assert.match(a.$('tv-detail-read').textContent,/Private series note/);assert.doesNotMatch(a.w.location.hash,/note|rating/);
 a.w.CultureRouter.navigate({section:'tv',view:'catalogue'});const normal=a.$('tv-grid').querySelector('[data-tv-work="tv:83867"]');assert.match(normal.querySelector('.star-trigger').textContent,/8.5/);assert.equal(a.state.rpcCalls.length,0);
 }finally{await a.close();}
});
test('TV catalogue registration is idempotent, preserves private progress and rejects provider conflicts',async()=>{
 const {PGlite}=await import('@electric-sql/pglite');const db=new PGlite(),sql=await readFile(new URL('../imports/tv-awards-2025-catalogue-sync.sql',import.meta.url),'utf8');
 try{await db.exec("create table media_catalogue(work_key text primary key,work_type text,metadata jsonb,is_static boolean);create table media_provider_links(provider_key text primary key,work_key text);create table tv_progress(work_key text,rating numeric,notes text);insert into tv_progress values('tv:83867',8.5,'Preserved private note');");await db.exec(sql);const first=(await db.query('select * from media_catalogue order by work_key')).rows;assert.ok(first.length>0);await db.exec(sql);assert.deepEqual((await db.query('select * from media_catalogue order by work_key')).rows,first);assert.equal((await db.query('select notes from tv_progress')).rows[0].notes,'Preserved private note');
 const link=(await db.query('select * from media_provider_links limit 1')).rows[0];await db.query('update media_provider_links set work_key=$1 where provider_key=$2',['tv:999999',link.provider_key]);await assert.rejects(db.exec(sql),/Conflicting provider identity/);await db.exec('rollback');
 }finally{await db.close();}
});

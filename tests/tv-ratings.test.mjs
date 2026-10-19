import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
import {Window} from 'happy-dom';
const root=new URL('../',import.meta.url);
const sql=await fs.readFile(new URL('supabase/migrations/20261019_tv_ratings.sql',root),'utf8');
const source=await fs.readFile(new URL('tv.js',root),'utf8');
const markup=await fs.readFile(new URL('index.html',root),'utf8');
const a='00000000-0000-0000-0000-000000000001',b='00000000-0000-0000-0000-000000000002';
const entry=(key,rating=8,scope='unspecified')=>({work_key:key,rating,rating_scope:scope,notes:'Private note',watched_date:null});
const setupSQL=async()=>{
 const db=new PGlite();
 await db.exec(`create role anon;create role authenticated;create schema auth;create table auth.users(id uuid primary key);insert into auth.users values ('${a}'),('${b}');
 create function auth.uid() returns uuid language sql stable as $$ select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid $$;grant usage on schema auth to anon,authenticated;
 create table film_progress(user_id uuid not null,film_id integer not null,watched boolean not null,rating numeric(3,1),notes text,watched_date date,updated_at timestamptz default now(),primary key(user_id,film_id));
 alter table film_progress enable row level security;grant select,insert,update,delete on film_progress to authenticated;
 create policy own_films on film_progress for all to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
 insert into film_progress(user_id,film_id,watched,rating) values('${a}',1920,true,10),('${a}',31,true,7),('${b}',1920,true,9);`);
 await db.exec(sql);await db.exec(sql);return db;
};
const importSQL=(db,items,replace=false)=>db.query('select public.import_tv_ratings($1::jsonb,$2) as result',[JSON.stringify(items),replace]);

test('Postgres: private TV ratings, typed identities, atomic missing-only import and guarded Dekalog correction',async()=>{
 const db=await setupSQL();
 try{
  await db.exec('set role anon');await assert.rejects(db.query('select * from tv_progress'),/permission denied/);await assert.rejects(importSQL(db,[entry('tv:1920')]),/permission denied/);
  await db.exec('set role authenticated');await assert.rejects(importSQL(db,[entry('tv:1920')]),/Sign in/);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[a]);
  // A conflicting episode makes the ENTIRE import roll back, including other new works.
  await db.query('update film_progress set rating=9 where film_id=1920');
  await assert.rejects(importSQL(db,[entry('tv:1920'),{...entry('tv:42699',10,'whole_work'),notes:''}],true),/record changed/);
  assert.equal((await db.query('select * from tv_progress')).rows.length,0);
  await db.query('update film_progress set rating=10 where film_id=1920');
  const result=(await importSQL(db,[entry('tv:1920'),{...entry('tv:42699',10,'whole_work'),notes:''}],true)).rows[0].result;
  assert.equal(result.inserted_keys.length,2);assert.equal(result.dekalog_episode_removed,true);
  assert.equal((await db.query('select * from film_progress where film_id=1920')).rows.length,0);
  assert.equal(Number((await db.query('select rating from film_progress where film_id=31')).rows[0].rating),7);
  const repeated=(await importSQL(db,[entry('tv:1920',9.5)])).rows[0].result;
  assert.equal(repeated.inserted_keys.length,0);assert.equal(repeated.skipped_existing,1);
  assert.equal(Number((await db.query("select rating from tv_progress where work_key='tv:1920'")).rows[0].rating),8);
  // Both namespaces can use the number 1920 without a storage collision.
  for(const invalid of [entry('movie:31'),entry('tv:0'),entry('tv:5904'),entry('tv:777',7.25),entry('tv:777','8'),{...entry('tv:777'),rating_scope:'season_1'},{...entry('tv:777'),watched_date:'2024-02-31'}]){
   await assert.rejects(importSQL(db,[entry('tv:888'),invalid]));
   assert.equal((await db.query("select * from tv_progress where work_key='tv:888'")).rows.length,0);
  }
  await assert.rejects(importSQL(db,[entry('tv:777'),entry('tv:777')]),/Duplicate/);
  await assert.rejects(db.query('insert into tv_progress(user_id,work_key,rating) values($1,\'tv:777\',8)',[b]),/row-level security/);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[b]);
  assert.equal((await db.query('select * from tv_progress')).rows.length,0);
  assert.equal(Number((await db.query('select rating from film_progress where film_id=1920')).rows[0].rating),9);
  await importSQL(db,[entry('tv:1920',6)]);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[a]);
  assert.equal(Number((await db.query("select rating from tv_progress where work_key='tv:1920'")).rows[0].rating),8);
 }finally{await db.close();}
});

test('Postgres: deliberate edits and removal use optimistic concurrency; stale saves cannot resurrect deletion',async()=>{
 const db=await setupSQL();
 try{
  await db.exec('set role authenticated');await db.query("select set_config('request.jwt.claim.sub',$1,false)",[a]);
  const save=(rating,version=null)=>db.query("select public.save_tv_rating('tv:1920',$1,'unspecified','note',null,$2) as saved",[rating,version]);
  const first=(await save(7.5)).rows[0].saved;
  await assert.rejects(save(8),/changed/);
  const updated=(await save(8.5,first.updated_at)).rows[0].saved;
  await assert.rejects(save(9,first.updated_at),/changed/);
  await assert.rejects(db.query("select public.remove_tv_rating('tv:1920',null)"),/changed/);
  await db.query("select public.remove_tv_rating('tv:1920',$1)",[updated.updated_at]);
  await assert.rejects(save(9,updated.updated_at),/removed/);
  assert.equal((await db.query('select * from tv_progress')).rows.length,0);
 }finally{await db.close();}
});

async function setupUI(){
 const window=new Window({url:'https://example.test/',settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true}});
 window.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));window.HTMLElement.prototype.scrollIntoView=()=>{};
 for(const name of ['film-catalog.js','tv-catalog.js','tv-film-aliases.js','work-identities.js','books.js'])window.eval(await fs.readFile(new URL(name,root),'utf8'));
 const writes=[];let currentUser={id:a};let persisted=[];let filmRefresh=0;
 const client={auth:{getSession:async()=>({data:{session:{user:currentUser}},error:null})},from(table){
  const query={select(){return this;},eq(){return this;},in(){return this;},order(){return this;},range:async()=>({data:table==='tv_progress'?persisted:table==='film_progress'?[{film_id:1955,rating:8}]:[],error:null})};return query;
 },async rpc(name,args){writes.push({name,args});if(name==='save_tv_rating'){const row={work_key:args.p_work_key,rating:args.p_rating,rating_scope:args.p_scope,notes:args.p_notes,watched_date:args.p_watched_date,updated_at:'2026-10-19T18:00:00Z'};persisted=[row];return {data:row,error:null};}if(name==='import_tv_ratings'){persisted=args.p_entries.map(p=>({...p,updated_at:'2026-10-19T18:00:00Z'}));return {data:{inserted_keys:persisted.map(p=>p.work_key),skipped_existing:0,dekalog_episode_removed:args.p_replace_dekalog},error:null};}return {data:true,error:null};}};
 window.CultureBooks.init(client);window.eval(source);window.CultureTV.init(client,{onFilmProgressChanged:()=>{filmRefresh++;}});
 return {window,client,writes,get filmRefresh(){return filmRefresh;},setUser(user){currentUser=user;},setPersisted(data){persisted=data;}};
}
const settle=async()=>{for(let i=0;i<10;i++)await new Promise(resolve=>setTimeout(resolve,0));};

test('UI: navigation, catalogue aliases, half-point stars and private save',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  await w.CultureTV.setSession(null);assert.equal(d.querySelectorAll('[data-tv-edit]').length,43);assert.equal(d.querySelectorAll('[data-linked-film]').length,4);assert.equal(h.writes.length,0);
  d.querySelector('[data-section="tv"]').click();assert.equal(d.querySelector('#tv-view').hidden,false);assert.equal(d.querySelector('#cinema-area').hidden,true);assert.equal(d.querySelector('#books-view').hidden,true);
  d.querySelector('[data-section="books"]').click();assert.equal(d.querySelector('#tv-view').hidden,true);assert.equal(d.querySelector('#books-view').hidden,false);
  d.querySelector('[data-section="tv"]').click();await w.CultureTV.setSession({id:a});
  assert.match(d.querySelector('#tv-count').textContent,/1 linked film ratings/);
  d.querySelector('[data-tv-edit="tv:42699"]').click();d.querySelector('#tv-star-trigger').click();
  for(let i=0;i<15;i++)d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
  d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));assert.equal(d.querySelector('#tv-rating').value,'7.5');
  d.querySelector('#tv-notes').value='<script>private</script>';d.querySelector('#tv-rating-form').dispatchEvent(new w.Event('submit',{bubbles:true,cancelable:true}));await settle();
  assert.equal(h.writes.length,1);assert.equal(h.writes[0].name,'save_tv_rating');assert.equal(h.writes[0].args.p_work_key,'tv:42699');assert.equal(h.writes[0].args.p_rating,7.5);assert.equal(h.writes[0].args.p_expected_updated_at,null);
  assert.equal(d.querySelector('#tv-grid script'),null);assert.match(d.querySelector('#tv-grid').textContent,/<script>private/);
  h.setPersisted([]);h.setUser({id:b});await w.CultureTV.setSession({id:b});assert.doesNotMatch(d.querySelector('#tv-grid').textContent,/<script>private/);assert.equal(d.querySelector('#tv-editor').hidden,true);
 }finally{await w.happyDOM.close();}
});

test('UI/import: unknown identities, aliases, duplicate rows and invalid ratings fail before writes',async()=>{
 const h=await setupUI(),w=h.window,known=w.CULTURE_TV_CATALOG;
 try{
  const input={format:'culture-atlas-tv-progress-v1',ratings:[entry('tv:42699',10,'whole_work')],replace_dekalog_episode:true};
  const p=w.CultureTV.validateImport(input,known);assert.equal(p.replace,true);
  for(const invalid of [entry('movie:1920'),entry('tv:5904'),entry('tv:987654321'),entry('tv:42699',7.25),{...entry('tv:42699'),watched_date:'2024-02-31'}])assert.throws(()=>w.CultureTV.validateImport({...input,ratings:[invalid]},known));
  assert.throws(()=>w.CultureTV.validateImport({...input,ratings:[input.ratings[0],input.ratings[0]]},known));
  const preview=w.CultureTV.previewImport(p.ratings,new Map([['tv:42699',entry('tv:42699',9,'whole_work')]]));assert.equal(preview.missing,0);assert.equal(preview.conflicts,1);assert.equal(h.writes.length,0);
  // Exercise the file handler and its explicit confirmation.
  await w.CultureTV.setSession({id:a});w.confirm=()=>true;const file=new w.File([JSON.stringify(input)],'ratings.json',{type:'application/json'});
  Object.defineProperty(w.document.querySelector('#tv-import'),'files',{value:[file],configurable:true});w.document.querySelector('#tv-import').dispatchEvent(new w.Event('change',{bubbles:true}));await settle();
  assert.equal(h.writes[0]?.name,'import_tv_ratings');assert.equal(h.writes[0].args.p_replace_dekalog,true);assert.equal(h.filmRefresh,1);
 }finally{await w.happyDOM.close();}
});

test('reviewed aliases resolve to the existing film key without adding another canonical work',async()=>{
 const h=await setupUI(),w=h.window;
 try{
  const r=w.CULTURE_WORK_IDENTITIES.createRegistry(w.CULTURE_CATALOG,w.CULTURE_TV_CATALOG,w.CULTURE_TV_FILM_ALIASES);
  assert.equal(r.byExternalId('tv',5904).work_key,'movie:1955');assert.equal(r.list().length,2295);assert.equal(r.list('tv').length,43);
  assert.throws(()=>w.CULTURE_WORK_IDENTITIES.createRegistry(w.CULTURE_CATALOG,w.CULTURE_TV_CATALOG,[{media_type:'tv',tmdb_id:5904,work_key:'movie:1955',imdb_id:'ttWRONG'}]));
 }finally{await w.happyDOM.close();}
});

test('UI: a refresh cannot silently advance the version of an open editor',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  const old={...entry('tv:42699'),updated_at:'2026-10-19T18:00:00Z'};
  h.setPersisted([old]);await w.CultureTV.setSession({id:a});d.querySelector('[data-tv-edit="tv:42699"]').click();
  h.setPersisted([{...old,rating:9,updated_at:'2026-10-19T18:01:00Z'}]);await w.CultureTV.setSession({id:a});
  d.querySelector('#tv-rating-form').dispatchEvent(new w.Event('submit',{bubbles:true,cancelable:true}));await settle();
  assert.equal(h.writes[0].args.p_expected_updated_at,old.updated_at);
 }finally{await w.happyDOM.close();}
});

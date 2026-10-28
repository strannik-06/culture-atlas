import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
import {Window} from 'happy-dom';
const root=new URL('../',import.meta.url);
const sql=await fs.readFile(new URL('supabase/migrations/20261019_tv_ratings.sql',root),'utf8');
const scopedSQL=await fs.readFile(new URL('supabase/migrations/20261019_tv_scoped_identities.sql',root),'utf8');
const reviewedSQL=await fs.readFile(new URL('supabase/migrations/20261020_tv_reviewed_score_import.sql',root),'utf8');
const source=await fs.readFile(new URL('tv.js',root),'utf8');
const markup=await fs.readFile(new URL('index.html',root),'utf8');
const a='00000000-0000-0000-0000-000000000001',b='00000000-0000-0000-0000-000000000002';
const entry=(key,rating=8,scope='unspecified')=>({work_key:key,rating,rating_scope:scope,notes:'Private note',watched_date:null});
const setupSQL=async(withScopes=true)=>{
 const db=new PGlite();
 await db.exec(`create role anon;create role authenticated;create schema auth;create table auth.users(id uuid primary key);insert into auth.users values ('${a}'),('${b}');
 create function auth.uid() returns uuid language sql stable as $$ select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid $$;grant usage on schema auth to anon,authenticated;
 create table film_progress(user_id uuid not null,film_id integer not null,watched boolean not null,rating numeric(3,1),notes text,watched_date date,updated_at timestamptz default now(),primary key(user_id,film_id));
 alter table film_progress enable row level security;grant select,insert,update,delete on film_progress to authenticated;
 create policy own_films on film_progress for all to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
 insert into film_progress(user_id,film_id,watched,rating) values('${a}',1920,true,10),('${a}',31,true,7),('${b}',1920,true,9);`);
 await db.exec(sql);await db.exec(sql);if(withScopes){await db.exec(scopedSQL);await db.exec(scopedSQL);await db.exec(reviewedSQL);await db.exec(reviewedSQL);}return db;
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
 },async rpc(name,args){writes.push({name,args});if(name==='save_tv_rating'){const row={work_key:args.p_work_key,rating:args.p_rating,rating_scope:args.p_scope,notes:args.p_notes,watched_date:args.p_watched_date,updated_at:'2026-10-19T18:00:00Z'};persisted=[row];return {data:row,error:null};}if(name==='import_tv_ratings'||name==='import_tv_ratings_reviewed'){const added=args.p_entries.filter(p=>!persisted.some(old=>old.work_key===p.work_key));persisted.push(...added.map(p=>({...p,updated_at:'2026-10-19T18:00:00Z'})));for(const c of args.p_rating_corrections||[]){const row=persisted.find(p=>p.work_key===c.work_key);row.rating=c.rating;}return {data:{inserted_keys:added.map(p=>p.work_key),skipped_existing:args.p_entries.length-added.length,dekalog_episode_removed:args.p_replace_dekalog,corrected_keys:(args.p_rating_corrections||[]).map(c=>c.work_key)},error:null};}return {data:true,error:null};}};
 window.CultureBooks.init(client);window.eval(source);window.CultureTV.init(client,{onFilmProgressChanged:()=>{filmRefresh++;}});
 return {window,client,writes,get filmRefresh(){return filmRefresh;},setUser(user){currentUser=user;},setPersisted(data){persisted=data;}};
}
const openEditor=(w,key)=>{w.CultureTV.route.choose(key);w.document.querySelector('#tv-detail-edit').click();};
const settle=async()=>{for(let i=0;i<10;i++)await new Promise(resolve=>setTimeout(resolve,0));};

test('UI: navigation, catalogue aliases, half-point stars and private save',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  await w.CultureTV.setSession(null);assert.ok(d.querySelectorAll('#tv-grid [data-tv-edit]').length>100);assert.equal(d.querySelectorAll('[data-linked-film]').length,4);assert.equal(h.writes.length,0);
  d.querySelector('[data-section="tv"]').click();assert.equal(d.querySelector('#tv-view').hidden,false);assert.equal(d.querySelector('#cinema-area').hidden,true);assert.equal(d.querySelector('#books-view').hidden,true);
  d.querySelector('[data-section="books"]').click();assert.equal(d.querySelector('#tv-view').hidden,true);assert.equal(d.querySelector('#books-view').hidden,false);
  d.querySelector('[data-section="tv"]').click();await w.CultureTV.setSession({id:a});
  assert.match(d.querySelector('#tv-count').textContent,/1 linked film ratings/);
  openEditor(w,'tv:42699');d.querySelector('#tv-star-trigger').click();
  for(let i=0;i<15;i++)d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
  d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));d.querySelector('#tv-star-picker .rating-save').click();assert.equal(d.querySelector('#tv-rating').value,'7.5');
  d.querySelector('#tv-notes').value='<script>private</script>';d.querySelector('#tv-rating-form').dispatchEvent(new w.Event('submit',{bubbles:true,cancelable:true}));await settle();
  assert.equal(h.writes.length,1);assert.equal(h.writes[0].name,'save_tv_rating');assert.equal(h.writes[0].args.p_work_key,'tv:42699');assert.equal(h.writes[0].args.p_rating,7.5);assert.equal(h.writes[0].args.p_expected_updated_at,null);
  assert.equal(d.querySelector('#tv-grid script'),null);assert.doesNotMatch(d.querySelector('#tv-grid').textContent,/<script>private/);assert.match(d.querySelector('#tv-detail-read').textContent,/<script>private/);
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
  assert.equal(r.byExternalId('tv',5904).work_key,'movie:1955');assert.equal(r.list().length,w.CULTURE_CATALOG.length+w.CULTURE_TV_CATALOG.length);assert.equal(r.list('tv').length,w.CULTURE_TV_CATALOG.length);
  assert.throws(()=>w.CULTURE_WORK_IDENTITIES.createRegistry(w.CULTURE_CATALOG,w.CULTURE_TV_CATALOG,[{media_type:'tv',tmdb_id:5904,work_key:'movie:1955',imdb_id:'ttWRONG'}]));
 }finally{await w.happyDOM.close();}
});

test('UI: a refresh cannot silently advance the version of an open editor',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  const old={...entry('tv:42699'),updated_at:'2026-10-19T18:00:00Z'};
  h.setPersisted([old]);await w.CultureTV.setSession({id:a});openEditor(w,'tv:42699');
  h.setPersisted([{...old,rating:9,updated_at:'2026-10-19T18:01:00Z'}]);await w.CultureTV.setSession({id:a});
  d.querySelector('#tv-rating-form').dispatchEvent(new w.Event('submit',{bubbles:true,cancelable:true}));await settle();
  assert.equal(h.writes[0].args.p_expected_updated_at,old.updated_at);
 }finally{await w.happyDOM.close();}
});

test('scoped migration preserves prior ratings; final eight targets import atomically and skip existing records',async()=>{
 const db=await setupSQL(false);
 try{
  await db.exec('set role authenticated');await db.query("select set_config('request.jwt.claim.sub',$1,false)",[a]);
  await importSQL(db,[{...entry('tv:99952',9),notes:'Existing personal note',watched_date:'2020-01-02'},entry('tv:42699',10,'whole_work')]);
  const before=(await db.query('select * from tv_progress order by work_key')).rows;
  await db.exec('reset role');await db.exec(scopedSQL);await db.exec(scopedSQL);await db.exec('set role authenticated');
  assert.deepEqual((await db.query('select * from tv_progress order by work_key')).rows,before);
  const keys=['tv:99952','tv:1455:season:1','tv:1455:season:2','tv:movie:126850','tv:movie:126846','tv:movie:126854','tv:imdb:tt4324832','tv:local:good-night-little-ones-tatarskiy-opening'];
  const batch=keys.map(key=>entry(key,7.5,'whole_work'));
  const result=(await importSQL(db,batch)).rows[0].result;
  assert.equal(result.inserted_keys.length,7);assert.equal(result.skipped_existing,1);assert.equal(result.dekalog_episode_removed,false);
  assert.deepEqual((await db.query("select * from tv_progress where work_key='tv:99952'")).rows[0],before.find(row=>row.work_key==='tv:99952'));
  assert.equal((await importSQL(db,batch)).rows[0].result.inserted_keys.length,0);
  for(const key of ['tv:1455:season:0','tv:movie:0','tv:imdb:4324832','tv:local:','tv:local:../secret','movie:31']){
   await assert.rejects(importSQL(db,[entry('tv:888'),entry(key)]));
   assert.equal((await db.query("select * from tv_progress where work_key='tv:888'")).rows.length,0);
  }
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[b]);
  assert.equal((await db.query('select * from tv_progress')).rows.length,0);
  await assert.rejects(db.query('insert into tv_progress(user_id,work_key,rating) values($1,$2,8)',[a,'tv:imdb:tt4324832']),/row-level security/);
 }finally{await db.close();}
});

test('UI shows exact season/installment scope and honest manual reference links',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  await w.CultureTV.setSession({id:a});
  const card=key=>d.querySelector(`[data-tv-edit="${key}"]`).closest('article');
  d.querySelector('#tv-kind').value='season';d.querySelector('#tv-kind').dispatchEvent(new w.Event('change'));
  card('tv:1455:season:1').click();assert.match(d.querySelector('#tv-selected-meta').textContent,/Season 1 · 26 episodes/);
  card('tv:1455:season:2').click();assert.match(d.querySelector('#tv-detail-read .sources a').href,/\/tv\/1455\/season\/2$/);
  d.querySelector('#tv-kind').value='';d.querySelector('#tv-kind').dispatchEvent(new w.Event('change'));
  card('tv:movie:126850').click();assert.match(d.querySelector('#tv-detail-read .sources a').href,/\/movie\/126850$/);
  const manual=card('tv:imdb:tt4324832');manual.click();assert.match(d.querySelector('#tv-detail-read .sources a').href,/imdb.com\/title\/tt4324832/);assert.doesNotMatch(manual.innerHTML,/themoviedb.org/);
  const opening=card('tv:local:good-night-little-ones-tatarskiy-opening');assert.match(opening.textContent,/Opening sequence/);assert.match(opening.textContent,/Aleksandr Tatarskiy/);assert.doesNotMatch(opening.innerHTML,/themoviedb.org/);
  openEditor(w,'tv:1455:season:1');assert.equal(d.querySelector('#tv-scope [value="whole_work"]').textContent,'Complete selected season');
  openEditor(w,'tv:movie:126850');assert.equal(d.querySelector('#tv-scope [value="whole_work"]').textContent,'This installment');
  const catalogue=w.CULTURE_TV_CATALOG;
  const batch=catalogue.slice(-8).map(work=>entry(work.id,7.5,'whole_work'));
  assert.equal(w.CultureTV.validateImport({format:'culture-atlas-tv-progress-v1',ratings:batch},catalogue).ratings.length,8);
  assert.throws(()=>w.CultureTV.validateImport({format:'culture-atlas-tv-progress-v1',ratings:[entry('tv:1455')]},catalogue),/Unknown/);
 }finally{await w.happyDOM.close();}
});

test('reviewed import corrects only the approved score, preserving notes/scope/date and rolling back stale changes',async()=>{
 const db=await setupSQL();
 try{
  await db.exec('set role anon');await assert.rejects(db.query("select public.import_tv_ratings_reviewed('[]','[]')"),/permission denied/);
  await db.exec('set role authenticated');await db.query("select set_config('request.jwt.claim.sub',$1,false)",[a]);
  const saved=(await db.query("select public.save_tv_rating('tv:147050',7,'unspecified','Keep this note','2025-01-02',null) as row")).rows[0].row;
  const correction={work_key:'tv:147050',expected_rating:7,rating:7.5,expected_updated_at:saved.updated_at};
  const apply=(batch,corrections)=>db.query('select public.import_tv_ratings_reviewed($1::jsonb,$2::jsonb) as result',[JSON.stringify(batch),JSON.stringify(corrections)]);
  await assert.rejects(apply([entry('tv:247718:season:1')],[{...correction,expected_updated_at:'2000-01-01T00:00:00Z'}]),/reviewed rating changed/);
  assert.equal((await db.query("select count(*) from tv_progress where work_key='tv:247718:season:1'")).rows[0].count,0);
  const result=(await apply([entry('tv:147050',7.5),entry('tv:247718:season:1',8)],[correction])).rows[0].result;
  assert.equal(result.inserted_keys.length,1);assert.deepEqual(result.corrected_keys,['tv:147050']);
  const after=(await db.query("select to_jsonb(t) as row from tv_progress t where work_key='tv:147050'")).rows[0].row;
  assert.equal(Number(after.rating),7.5);assert.equal(after.notes,'Keep this note');assert.equal(after.rating_scope,'unspecified');assert.equal(after.watched_date,'2025-01-02');
  await assert.rejects(apply([entry('tv:247718:season:2')],[correction]),/reviewed rating changed/);
  assert.equal((await db.query("select count(*) from tv_progress where work_key='tv:247718:season:2'")).rows[0].count,0);
  await assert.rejects(apply([entry('tv:777')],[{...correction,rating:7.25}]),/Invalid correction score/);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[b]);
  await assert.rejects(apply([entry('tv:888')],[{...correction,expected_rating:7.5,rating:8,expected_updated_at:after.updated_at}]),/reviewed rating changed/);
  assert.equal((await db.query('select * from tv_progress')).rows.length,0);
 }finally{await db.close();}
});

test('series and season editors keep independent scores and navigation is Films, TV Series, Books',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  assert.deepEqual([...d.querySelectorAll('[data-section]')].map(el=>el.dataset.section),['films','tv','books']);
  h.setPersisted([{...entry('tv:247718:season:1',7.5,'whole_work'),notes:'Season one only',updated_at:'2026-10-19T18:00:00Z'}]);
  await w.CultureTV.setSession({id:a});
  const parent=d.querySelector('[data-tv-edit="tv:247718"]').closest('article');
  assert.equal(parent.querySelector('.tv-seasons'),null);parent.click();assert.match(d.querySelector('#tv-detail-read .tv-seasons').textContent,/1 rated/);assert.match(d.querySelector('#tv-detail-read [data-tv-edit="tv:247718:season:1"]').textContent,/7.5/);
  assert.match(parent.querySelector('[data-tv-edit="tv:247718"]').textContent,/Rate/);
  d.querySelector('[data-tv-tab="ratings"]').click();assert.ok(d.querySelector('[data-tv-edit="tv:247718"]'));openEditor(w,'tv:247718');
  openEditor(w,'tv:247718:season:1');assert.equal(d.querySelector('#tv-notes').value,'Season one only');
  d.querySelector('#tv-target').value='tv:247718';d.querySelector('#tv-target').dispatchEvent(new w.Event('change'));
  assert.equal(d.querySelector('#tv-rating').value,'');assert.equal(d.querySelector('#tv-notes').value,'');
  d.querySelector('#tv-target').value='tv:247718:season:2';d.querySelector('#tv-target').dispatchEvent(new w.Event('change'));
  assert.equal(d.querySelector('#tv-scope').value,'whole_work');d.querySelector('#tv-star-trigger').click();
  for(let i=0;i<16;i++)d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
  d.querySelector('#tv-star-picker').dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));d.querySelector('#tv-star-picker .rating-save').click();
  d.querySelector('#tv-rating-form').dispatchEvent(new w.Event('submit',{bubbles:true,cancelable:true}));await settle();
  assert.equal(h.writes.at(-1).args.p_work_key,'tv:247718:season:2');assert.equal(h.writes.at(-1).args.p_rating,8);
 }finally{await w.happyDOM.close();}
});

test('v2 file preview names approved score correction and uses the current row version',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{
  h.setPersisted([{...entry('tv:147050',7),notes:'Existing private note',updated_at:'2026-10-19T18:00:00Z'}]);await w.CultureTV.setSession({id:a});
  const input={format:'culture-atlas-tv-progress-v2',ratings:[entry('tv:147050',7.5),entry('tv:247718:season:1',8)],rating_corrections:[{work_key:'tv:147050',expected_rating:7,rating:7.5}]};
  let prompt='';w.confirm=text=>{prompt=text;return true;};
  const file=new w.File([JSON.stringify(input)],'series.json',{type:'application/json'});Object.defineProperty(d.querySelector('#tv-import'),'files',{value:[file],configurable:true});d.querySelector('#tv-import').dispatchEvent(new w.Event('change',{bubbles:true}));await settle();
  assert.match(prompt,/Disclaimer 7.0 → 7.5/);assert.equal(h.writes[0].name,'import_tv_ratings_reviewed');assert.equal(h.writes[0].args.p_rating_corrections[0].expected_updated_at,'2026-10-19T18:00:00Z');
  assert.throws(()=>w.CultureTV.validateImport({...input,format:'culture-atlas-tv-progress-v1'},w.CULTURE_TV_CATALOG),/Invalid reviewed/);
  assert.throws(()=>w.CultureTV.validateImport({...input,rating_corrections:[...input.rating_corrections,...input.rating_corrections]},w.CULTURE_TV_CATALOG),/duplicate/);
 }finally{await w.happyDOM.close();}
});

test('Quick series and season stars require Save, dismiss drafts and preserve notes, scope, date and row version',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;
 try{const old={...entry('tv:247718:season:1',7.5,'whole_work'),notes:'Keep season notes',watched_date:'2026-10-01',updated_at:'original-version'};h.setPersisted([old]);await w.CultureTV.setSession({id:a});
 d.querySelector('[data-tv-edit="tv:247718"]').click();assert.equal(d.querySelector('#tv-editor').hidden,true);let p=d.querySelector('#tv-quick-stars');p.querySelector('[data-quick-star="8"]').click();assert.equal(h.writes.length,0);assert.equal(p.hidden,false);p.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));assert.equal(p.hidden,true);
 d.querySelector('[data-tv-work="tv:247718"]').click();assert.equal(d.querySelector('#tv-rating-form').hidden,true);d.querySelector('[data-tv-edit="tv:247718:season:1"]').click();p.querySelector('[data-quick-star="8"]').click();assert.equal(h.writes.length,0);p.querySelector('.rating-save').click();await settle();assert.equal(h.writes.length,1);assert.equal(h.writes[0].args.p_work_key,old.work_key);assert.equal(h.writes[0].args.p_notes,old.notes);assert.equal(h.writes[0].args.p_watched_date,old.watched_date);assert.equal(h.writes[0].args.p_expected_updated_at,'original-version');assert.equal(h.writes[0].args.p_rating,9);assert.equal(d.querySelector('#tv-rating-form').hidden,true);
 d.querySelector('#tv-detail-close').click();d.querySelector('[data-tv-edit="tv:247718"]').click();p.querySelector('[data-quick-star="7"]').click();p.querySelector('.rating-save').click();await settle();assert.equal(h.writes.at(-1).args.p_work_key,'tv:247718');assert.equal(h.writes.at(-1).args.p_rating,8);
 }finally{await w.happyDOM.close();}
});
test('Quick-rating errors retain the draft and repeated Save clicks cannot issue duplicate requests',async()=>{
 const h=await setupUI(),w=h.window,d=w.document;try{await w.CultureTV.setSession({id:a});const original=h.client.rpc;let calls=0,finish;h.client.rpc=async()=>{calls++;await new Promise(r=>finish=r);return{error:{message:'Changed on another device'}};};d.querySelector('[data-tv-edit="tv:247718"]').click();const p=d.querySelector('#tv-quick-stars');p.querySelector('[data-quick-star="7"]').click();p.querySelector('.rating-save').click();await settle();p.querySelector('.rating-save').click();assert.equal(calls,1);finish();await settle();assert.equal(p.hidden,false);assert.match(p.querySelector('.rating-popup-status').textContent,/Changed on another device/);assert.match(p.querySelector('.rating-preview').textContent,/8.0/);h.client.rpc=original;p.querySelector('.rating-save').click();await settle();assert.equal(p.hidden,true);
 }finally{await w.happyDOM.close();}
});

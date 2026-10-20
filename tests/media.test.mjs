import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
import {Window} from 'happy-dom';
import {spawnSync} from 'node:child_process';
import {createHandler} from '../supabase/functions/media-search/handler.mjs';
const read=p=>fs.readFile(new URL('../'+p,import.meta.url),'utf8');
const user='00000000-0000-0000-0000-000000000001',other='00000000-0000-0000-0000-000000000002';

test('SQL: seeded identities, aliases, atomic saves, optimistic edits, private grants and complete service snapshot',async()=>{
 const db=new PGlite();
 try{
  await db.exec(`create role anon;create role authenticated;create role service_role;create schema auth;create table auth.users(id uuid primary key);insert into auth.users values('${user}'),('${other}');create function auth.uid() returns uuid language sql stable as $$select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid$$;
  create table film_progress(user_id uuid,film_id integer,watched boolean,rating numeric(3,1),notes text,watched_date date,updated_at timestamptz default now(),primary key(user_id,film_id));`);
  for(const f of ['20261019_books_search_ratings.sql','20261019_tv_ratings.sql','20261019_tv_scoped_identities.sql','20261021_media_catalogue.sql','20261021_media_catalogue_seed.sql','20261021_backup_snapshot.sql']){const sql=await read('supabase/migrations/'+f);await db.exec(sql);await db.exec(sql);}
  const save=async(provider,metadata,rating=8,version=null,uid=user)=>(await db.query("select save_media_rating($1,$2,$3::jsonb,$4,'private',null,'whole_work',$5) as saved",[uid,provider,JSON.stringify(metadata),rating,version])).rows[0].saved;
  const meta={title:'A new title',tmdb_id:9999999,imdb_id:'tt999999999',year:2026};
  const first=await save('movie:9999999',meta);assert.equal(first.work_key,'movie:1000000000');
  await assert.rejects(save('movie:9999999',meta,9),/changed/);
  const updated=await save('movie:9999999',meta,9,first.progress.updated_at);assert.equal(updated.progress.rating,9);
  await assert.rejects(save('movie:9999999',meta,6,first.progress.updated_at),/changed/);
  // Cross-media IMDb aliases reuse the original numeric film and cannot overwrite it.
  const duplicate=await save('tv:9999999',meta,7,null,other);assert.equal(duplicate.work_key,first.work_key);
  const known=await save('tv:5904',{title:'Guest from the Future',tmdb_id:5904});assert.equal(known.work_key,'movie:1955');
  await assert.rejects(save('movie:9999998',{title:'Bad title'},7.25));assert.equal((await db.query("select * from media_provider_links where provider_key='movie:9999998'")).rows.length,0);
  const season=await save('tv:9999998:season:2',{title:'New series — Season 2',tmdb_id:9999998,series_kind:'season',season_number:2,parent:{title:'New series',tmdb_id:9999998,series_kind:'series'}});
  assert.equal(season.work_key,'tv:9999998:season:2');assert.equal((await db.query("select * from media_catalogue where work_key='tv:9999998'")).rows.length,1);
  assert.equal((await db.query("select * from tv_progress where work_key='tv:9999998'")).rows.length,0);
  await db.exec('set role authenticated');await assert.rejects(save('movie:7777777',meta),/permission denied/);await assert.rejects(db.query('select culture_backup_snapshot()'),/permission denied/);await assert.rejects(db.query("insert into media_catalogue values('tv:7','tv',null,'{}')"),/permission denied/);
  assert.ok((await db.query('select * from media_catalogue')).rows.length>2500);
  await db.exec('set role service_role');const snapshot=(await db.query('select culture_backup_snapshot() as data')).rows[0].data;assert.equal(snapshot.film_progress.length,3);assert.equal(snapshot.tv_progress.length,1);assert.equal(snapshot.film_progress[0].notes,'private');assert.ok(snapshot.media_catalogue.length>2500);
  await db.exec('reset role');
  // Legacy star saves must invalidate a discovery editor's loaded version too.
  await db.query('update film_progress set rating=9.5 where user_id=$1 and film_id=$2',[user,first.progress.film_id]);
  await assert.rejects(save('movie:9999999',meta,6,updated.progress.updated_at),/changed/);
  await db.query('delete from film_progress where user_id=$1 and film_id=1955',[user]);
  const generated=spawnSync('python3',['-c',"import runpy,json,sys; module=runpy.run_path('scripts/restore-backup.py'); print(module['make_sql'](json.load(sys.stdin)))"],{cwd:new URL('../',import.meta.url),input:JSON.stringify(snapshot),encoding:'utf8',maxBuffer:4000000});
  assert.equal(generated.status,0,generated.stderr);await db.exec(generated.stdout);
  assert.equal(Number((await db.query('select rating from film_progress where user_id=$1 and film_id=$2',[user,first.progress.film_id])).rows[0].rating),9.5);
  assert.equal(Number((await db.query('select rating from film_progress where user_id=$1 and film_id=1955',[user])).rows[0].rating),8);
  assert.equal((await db.query('select * from film_progress')).rows.length,3);
 }finally{await db.close();}
});

function endpoint(){const requests=[];let existing=null,progress=null;const env={SUPABASE_URL:'https://example.supabase.co',SUPABASE_ANON_KEY:'anon',SUPABASE_SERVICE_ROLE_KEY:'service-secret',TMDB_API_KEY:'tmdb-secret'};
 const handler=createHandler(k=>env[k],async(url,options={})=>{url=String(url);requests.push({url,options});
  if(url.includes('/auth/v1/user'))return Response.json(options.headers.Authorization==='Bearer valid'?{id:user}:{error:'bad'}, {status:options.headers.Authorization==='Bearer valid'?200:401});
  if(url.includes('/search/'))return Response.json({results:[{id:10,title:'New film',release_date:'2026-01-01'}]});
  if(url.includes('api.themoviedb.org'))return Response.json({id:10,title:'New film',name:'New show',imdb_id:'tt1234567',seasons:[{season_number:1,name:'Season 1',episode_count:6}],credits:{crew:[{id:2,name:'Director',job:'Director'}]}});
  if(url.includes('/rpc/'))return Response.json({work_key:'movie:1000000000',metadata:JSON.parse(options.body).p_metadata});
  if(url.includes('media_provider_links'))return Response.json(existing?[{work_key:existing.work_key}]:[]);
  if(url.includes('media_catalogue'))return Response.json(existing?[existing]:[]);
  return Response.json(progress?[progress]:[]);
 });
 const call=(body,token='valid')=>handler(new Request('https://edge.test',{method:'POST',headers:{Authorization:'Bearer '+token,Origin:'https://strannik-06.github.io'},body:JSON.stringify(body)}));
 return {requests,call,setExisting:(e,p)=>{existing=e;progress=p;}};
}
test('Edge: validates session before provider access; bounded explicit search, trusted refetch and own progress',async()=>{
 const h=endpoint();assert.equal((await h.call({action:'search',type:'movie',query:'Film'},'bad')).status,401);assert.equal(h.requests.length,1);
 assert.equal((await h.call({action:'search',type:'movie',query:'Film',year:2026})).status,200);assert.match(h.requests.at(-1).url,/primary_release_year=2026/);
 const result=await(await h.call({action:'save',type:'movie',id:10,rating:8,notes:'note',date:null,scope:'whole_work',metadata:{title:'Forged'}})).json();assert.equal(result.metadata.title,'New film');const args=JSON.parse(h.requests.at(-1).options.body);assert.equal(args.p_user,user);assert.equal(args.p_metadata.director,'Director');
 h.setExisting({work_key:'movie:1',work_type:'movie',film_id:1},{rating:7,notes:'private',updated_at:'v1'});const loaded=await(await h.call({action:'details',type:'movie',id:10})).json();assert.equal(loaded.progress.notes,'private');assert.match(h.requests.at(-1).url,new RegExp('user_id=eq.'+user));
 const seasonSave=await(await h.call({action:'save',type:'tv',id:10,season:1,rating:8.5,notes:'season note',date:null,scope:'whole_work'})).json();assert.equal(seasonSave.metadata.season_number,1);assert.equal(JSON.parse(h.requests.at(-1).options.body).p_provider,'tv:10:season:1');
 assert.equal((await h.call({action:'details',type:'tv',id:10,season:2})).status,400);
 const count=h.requests.length;assert.equal((await h.call({action:'details',type:'movie',id:10,season:1})).status,400);assert.equal(h.requests.length,count+1);
});

test('UI: review existing notes, save expected version, preserve failed draft, clear on account switch',async()=>{
 const w=new Window({settings:{enableJavaScriptEvaluation:true,disableCSSFileLoading:true,disableJavaScriptFileLoading:true}}),d=w.document;
 d.write('<main><div id="cinema-area"><nav class="film-subnav"></nav></div><div id="tv-view"><nav class="film-subnav"></nav></div></main>');
 const writes=[];let fail=false,pending=null;const response={metadata:{title:'Test film',year:2026},seasons:[],progress:{rating:7,notes:'existing private note',updated_at:'v1'}};
 const client={from:()=>({select(){return this;},eq(){return this;},order(){return this;},range:async()=>({data:[],error:null})}),functions:{invoke:async(name,{body})=>{writes.push(body);if(pending)return pending;if(body.action==='search')return {data:{results:[{id:10,title:'Test film',date:'2026'}]}};if(body.action==='details')return {data:response};return fail?{error:{message:'failed'}}:{data:{work_key:'movie:1'}};}}};
 try{
  w.eval(await read('media.js'));let refreshed=0;w.CultureMedia.init(client,{onCatalogue:()=>{},onSaved:()=>{refreshed++;}});w.CultureMedia.setSession({id:user});
  d.querySelector('#cinema-area button').click();d.querySelector('#media-query').value='Test';d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await new Promise(r=>setTimeout(r,5));d.querySelector('[data-id]').click();await new Promise(r=>setTimeout(r,5));assert.equal(d.querySelector('#media-notes').value,'existing private note');
  fail=true;d.querySelector('#media-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await new Promise(r=>setTimeout(r,5));assert.equal(d.querySelector('#media-notes').value,'existing private note');assert.equal(writes.at(-1).expected_updated_at,'v1');
  fail=false;d.querySelector('#media-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await new Promise(r=>setTimeout(r,5));assert.equal(refreshed,1);
  let resolve;pending=new Promise(r=>{resolve=r;});d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));w.CultureMedia.setSession({id:other});resolve({data:{results:[{id:99,title:'Old account'}]}});await new Promise(r=>setTimeout(r,5));assert.equal(d.querySelector('#media-results').children.length,0);assert.equal(d.querySelector('#media-notes').value,'');
 }finally{await w.happyDOM.close();}
});

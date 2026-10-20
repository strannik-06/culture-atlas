import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
import {Window} from 'happy-dom';
import {spawnSync} from 'node:child_process';
import {createHandler,parseSearchQuery} from '../supabase/functions/media-search/handler.mjs';
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

async function setupMediaUI(){
 const w=new Window({settings:{enableJavaScriptEvaluation:true,disableCSSFileLoading:true,disableJavaScriptFileLoading:true}}),d=w.document;
 d.write('<main><div id="cinema-area"><nav class="film-subnav"></nav></div><div id="tv-view"><nav class="film-subnav"></nav></div></main>');
 const writes=[],state={fail:false,pending:null,saved:[],refreshes:0};
 const results=[{id:10,title:'Rated film',date:'2026-01-01',poster_path:'/poster.jpg'},{id:11,title:'Unrated film',date:'2025-01-01'}];
 const client={from:()=>({select(){return this;},eq(){return this;},order(){return this;},range:async()=>({data:[],error:null})}),functions:{invoke:async(name,{body})=>{
  writes.push(body);if(state.pending)return state.pending;
  if(body.action==='search')return {data:body.mode==='smart'&&body.query==='A director'?{kind:'mixed',results:[{kind:'person',id:22,title:'A director',department:'Directing',known_for:['Film A']},...results]}:{kind:'works',page:body.page||1,total_pages:2,results:body.page===2?[{id:12,title:'Next page film'}]:results}};
  if(body.action==='details'&&state.pendingDetails)return state.pendingDetails;
  if(body.action==='details')return {data:{metadata:{title:body.type==='tv'?'TV show':'Film '+body.id,year:2026,director:'A director'},seasons:[{number:1,name:'Season 1'},{number:2,name:'Season 2'}],existing:body.id===10?{work_type:body.type}:null,progress:body.id===10&&!body.season?{rating:7,notes:'existing private note',watched_date:null,rating_scope:'unspecified',updated_at:'v1'}:null}};
  if(state.fail)return {error:{context:{json:async()=>({error:typeof state.fail==='string'?state.fail:'Server unavailable'})}}};
  state.saved.push(body);return {data:{work_key:body.type==='tv'?'tv:'+body.id+(body.season?':season:'+body.season:''):'movie:1',progress:{rating:body.rating,notes:body.notes,watched_date:body.date,rating_scope:body.scope,updated_at:'v2'}}};
 }}};
 w.eval(await read('media.js'));w.CultureMedia.init(client,{onCatalogue:()=>{},onSaved:()=>{state.refreshes++;}});w.CultureMedia.setSession({id:user});
 const settle=async()=>{for(let i=0;i<10;i++)await new Promise(r=>setTimeout(r,0));};
 const search=async(type='movie')=>{d.querySelector(type==='movie'?'#cinema-area button':'#tv-view button').click();d.querySelector('#media-query').value='Test';d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await settle();};
 const card=id=>d.querySelector('[data-media-id="'+id+'"]');
 const submit=el=>el.querySelector('form').dispatchEvent(new w.Event('submit',{cancelable:true}));
 const rate=(el,value)=>{el.querySelector('[data-stars]').click();const picker=d.querySelector('#media-star-picker'),current=Number(el.querySelector('[data-stars] .value').textContent.split('/')[0])||0;
  // Keyboard half points use the same control as the other sections.
  let n=current;while(n!==value){picker.dispatchEvent(new w.KeyboardEvent('keydown',{key:n<value?'ArrowRight':'ArrowLeft',bubbles:true}));n+=n<value?.5:-.5;}
  picker.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));
 };
 return {w,d,state,writes,settle,search,card,submit,rate};
}
test('UI: cards show posters, directors and existing ratings; star saves keep other drafts and dates private',async()=>{
 const h=await setupMediaUI(),{w,d,state,writes,settle,search,card,submit,rate}=h;
 try{
  await search();const rated=card(10),fresh=card(11);
  assert.equal(d.querySelectorAll('.media-card').length,2);assert.match(rated.querySelector('img').src,/image.tmdb.org/);assert.equal(rated.querySelector('[data-credit]').textContent,'A director');assert.equal(rated.querySelector('[data-badge]'),null);assert.match(rated.querySelector('[data-stars]').textContent,/7.0/);
  assert.equal(rated.querySelector('[data-notes]').value,'existing private note');assert.equal(rated.querySelector('details').open,false);
  assert.equal(rated.querySelector('[data-date]').value,''); // An old unknown viewing date is preserved.
  assert.equal(d.querySelectorAll('[data-season], [data-scope], select[data-rating]').length,0);
  const now=new Date(),today=[now.getFullYear(),String(now.getMonth()+1).padStart(2,'0'),String(now.getDate()).padStart(2,'0')].join('-');assert.equal(fresh.querySelector('[data-date]').value,today);
  fresh.querySelector('[data-notes]').value='Other draft';rate(fresh,8.5);
  rate(rated,7.5);state.fail=true;submit(rated);await settle();assert.equal(rated.querySelector('[data-notes]').value,'existing private note');assert.equal(writes.at(-1).expected_updated_at,'v1');assert.equal(rated.querySelector('fieldset').disabled,false);
  state.fail=false;submit(rated);await settle();assert.equal(state.refreshes,1);assert.equal(fresh.querySelector('[data-notes]').value,'Other draft');assert.match(fresh.querySelector('[data-stars]').textContent,/8.5/);assert.match(rated.querySelector('[data-stars]').textContent,/7.5/);
  fresh.querySelector('[data-date]').value='2026-10-01';fresh.querySelector('[data-date]').dispatchEvent(new w.Event('input'));submit(fresh);await settle();assert.equal(state.saved.at(-1).date,'2026-10-01');assert.equal(state.saved.at(-1).notes,'Other draft');assert.equal(state.saved.at(-1).rating,8.5);
  d.querySelector('#media-more').click();await settle();assert.equal(d.querySelectorAll('.media-card').length,3);assert.equal(rated.querySelector('[data-notes]').value,'existing private note');
  let resolve;state.pending=new Promise(r=>{resolve=r;});d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));w.CultureMedia.setSession({id:other});resolve({data:{results:[{id:99,title:'Old account'}]}});await settle();assert.equal(d.querySelector('#media-results').children.length,0);assert.equal(d.querySelector('[data-notes]'),null);
 }finally{await w.happyDOM.close();}
});
test('UI: TV-only controls, independent season drafts, explicit director selection and pagination',async()=>{
 const h=await setupMediaUI(),{w,d,state,writes,settle,search,card,submit,rate}=h;
 try{
  await search('tv');const tv=card(10);assert.ok(tv.querySelector('[data-season]'));assert.equal(tv.querySelector('[data-scope]'),null);assert.match(tv.querySelector('[data-season] option').textContent,/scope not specified/);
  tv.querySelector('[data-notes]').value='Whole-series draft';rate(tv,8);
  tv.querySelector('[data-season]').value='2';tv.querySelector('[data-season]').dispatchEvent(new w.Event('change'));await settle();assert.equal(tv.querySelector('[data-scope]'),null);assert.equal(tv.querySelector('[data-notes]').value,'');rate(tv,9);submit(tv);await settle();assert.equal(state.saved.at(-1).season,2);assert.equal(state.saved.at(-1).rating,9);
  tv.querySelector('[data-season]').value='';tv.querySelector('[data-season]').dispatchEvent(new w.Event('change'));await settle();assert.equal(tv.querySelector('[data-notes]').value,'Whole-series draft');assert.match(tv.querySelector('[data-stars]').textContent,/8.0/);submit(tv);await settle();assert.equal(state.saved.at(-1).scope,'unspecified');
  d.querySelector('#media-close').click();d.querySelector('#cinema-area button').click();assert.equal(d.querySelector('#media-mode'),null);assert.equal(d.querySelector('#media-year'),null);d.querySelector('#media-query').value='A director';d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await settle();assert.match(d.querySelector('.media-person').textContent,/A director/);assert.equal(d.querySelectorAll('.media-card').length,2);
  d.querySelector('.media-person button').click();await settle();assert.ok(writes.some(x=>x.action==='search'&&x.person_id===22));assert.equal(d.querySelectorAll('.media-card').length,2);
  d.querySelector('#media-more').click();await settle();assert.equal(writes.filter(x=>x.action==='search').at(-1).person_id,22);assert.equal(writes.filter(x=>x.action==='search').at(-1).page,2);
 }finally{await w.happyDOM.close();}
});
test('UI: stale saves offer an explicit reload; late private details never appear after account changes',async()=>{
 const h=await setupMediaUI(),{w,d,state,settle,search,card,submit,rate}=h;
 try{
  await search();const rated=card(10);rated.querySelector('[data-notes]').value='Unsaved edit';rate(rated,8);
  state.fail='This rating changed. Select the result again before saving.';submit(rated);await settle();
  assert.equal(rated.querySelector('[data-notes]').value,'Unsaved edit');const reload=[...rated.querySelectorAll('button')].find(b=>b.textContent.includes('discard draft'));assert.ok(reload);
  state.fail=false;reload.click();await settle();assert.equal(rated.querySelector('[data-notes]').value,'existing private note');
  let resolve;state.pendingDetails=new Promise(r=>{resolve=r;});d.querySelector('#media-search-form').dispatchEvent(new w.Event('submit',{cancelable:true}));await settle();assert.equal(d.querySelector('[data-stars]'),null);
  w.CultureMedia.setSession({id:other});resolve({data:{metadata:{title:'Old title'},progress:{rating:9,notes:'PRIVATE OLD ACCOUNT',updated_at:'old'}}});await settle();assert.equal(d.querySelector('.media-card'),null);assert.doesNotMatch(d.body.textContent,/PRIVATE OLD ACCOUNT/);
 }finally{await w.happyDOM.close();}
});
test('Edge: director search lists only directed films, deduplicates credits and validates person IDs',async()=>{
 const requests=[],handler=createHandler(k=>({SUPABASE_URL:'https://example.supabase.co',SUPABASE_ANON_KEY:'anon',SUPABASE_SERVICE_ROLE_KEY:'service',TMDB_API_KEY:'key'})[k],async url=>{
  url=String(url);requests.push(url);if(url.includes('/auth/'))return Response.json({id:user});
  if(url.includes('search/person'))return Response.json({results:[{id:22,name:'Director',known_for_department:'Directing',known_for:[{title:'Example'}]}],total_pages:1});
  if(url.includes('movie_credits'))return Response.json({crew:[{id:10,title:'Directed',job:'Director',release_date:'2026-01-01'},{id:10,title:'Directed',job:'Director',release_date:'2026-01-01'},{id:11,title:'Only acted',job:'Actor'},{id:12,title:'Adult',job:'Director',adult:true}]});
  return Response.json({id:22,name:'Director'});
 });
 const call=async body=>{const r=await handler(new Request('https://edge.test',{method:'POST',headers:{Authorization:'Bearer valid'},body:JSON.stringify({action:'search',type:'movie',...body})}));return {status:r.status,data:await r.json()};};
 assert.equal((await call({mode:'director',query:'Director'})).data.kind,'people');
 const films=await call({mode:'director',person_id:22,year:2026});assert.equal(films.data.results.length,1);assert.equal(films.data.results[0].title,'Directed');assert.equal(films.data.director,'Director');
 assert.equal((await call({mode:'director',person_id:'22'})).status,400);assert.equal((await call({mode:'director',person_id:22,type:'tv'})).status,400);assert.equal((await call({query:'Title',page:501})).status,400);
});

test('Smart search: one query combines films/directors, parses years, and keeps numeric film titles intact',async()=>{
 const calls=[];
 const person={id:22,name:'Steven Soderbergh',known_for_department:'Directing'};
 const film={id:10,title:'Black Bag',release_date:'2025-03-12'};
 const handler=createHandler(k=>({SUPABASE_URL:'https://example.supabase.co',SUPABASE_ANON_KEY:'anon',SUPABASE_SERVICE_ROLE_KEY:'service',TMDB_API_KEY:'key'})[k],async raw=>{
  const url=new URL(raw);calls.push(url);
  if(url.pathname.includes('/auth/'))return Response.json({id:user});
  const q=url.searchParams.get('query');
  if(url.pathname.endsWith('search/person'))return Response.json({results:['Steven Soderbergh','Soderbergh'].includes(q)?[person]:[],total_pages:1});
  if(url.pathname.endsWith('movie_credits'))return Response.json({crew:[{...film,job:'Director'},{...film,job:'Director'},{id:33,title:'Black Bag',job:'Actor'},{id:34,title:'Other',job:'Director'}]});
  if(url.pathname.endsWith('search/movie'))return Response.json({results:q==='Black Bag'?[film]:q==='Blade Runner 2049'?[{id:11,title:q,release_date:'2017-01-01'}]:q==='Steven Soderbergh'?[{id:12,title:'A documentary about Steven Soderbergh'}]:[],total_pages:1});
  if(url.pathname.endsWith('search/tv'))return Response.json({results:[{id:13,name:'TV title',first_air_date:'2020-01-01'}],total_pages:1});
  throw Error('Unexpected request');
 });
 const search=async(query,type='movie')=>{const r=await handler(new Request('https://edge.test',{method:'POST',headers:{Authorization:'Bearer valid'},body:JSON.stringify({action:'search',mode:'smart',type,query})}));assert.equal(r.status,200);return r.json();};
 const dated=await search('Black Bag 2025');assert.equal(dated.year,'2025');assert.equal(dated.results[0].title,'Black Bag');assert.ok(calls.some(u=>u.searchParams.get('primary_release_year')==='2025'));
 const mixed=await search('Steven Soderbergh');assert.equal(mixed.results[0].kind,'person');assert.ok(mixed.results.some(x=>x.kind==='work'));
 const combined=await search('Black Bag Soderbergh 2025');assert.equal(combined.results.filter(x=>x.kind==='work').length,1);assert.equal(combined.results.find(x=>x.kind==='work').id,10);assert.equal(combined.results.find(x=>x.kind==='person').id,22);
 const numbered=await search('Blade Runner 2049');assert.equal(numbered.year,null);assert.equal(numbered.results[0].title,'Blade Runner 2049');
 assert.equal(parseSearchQuery('1984').year,null);assert.equal(parseSearchQuery('2001 A Space Odyssey').year,null);assert.equal(parseSearchQuery('Dune (2021)').year,'2021');
 const tv=await search('TV title 2020','tv');assert.equal(tv.results[0].title,'TV title');assert.ok(calls.some(u=>u.searchParams.get('first_air_date_year')==='2020'));
});

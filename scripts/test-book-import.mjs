import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {PGlite} from '@electric-sql/pglite';
const uid='00000000-0000-0000-0000-000000000001',other='00000000-0000-0000-0000-000000000002';
const book={work_key:'manual:aaaaaaaaaaaaaaaaaaaaaaaa',title:'A collection',authors:['An Author'],source_publication_year:2013,scope:'collection',open_library_work_id:null,cover_id:null,latest_source_key:'test:new'};
const reading={source_key:'test:new',work_key:book.work_key,rating:7.5,reading_format:'audio',notes:'Original private note',read_date:'2022-07-01',read_date_precision:'month',read_year:2022,read_year_end:null,started_date:'2022-04-01'};
const fixture=()=>({format:'culture-atlas-books-import-prepared-v1',books:[book],readings:[{...reading,source_key:'test:old',rating:8,read_date:null,read_date_precision:'year',read_year:2018,started_date:null},reading]});

async function setup(){
 const db=new PGlite();
 await db.exec(`create role anon;create role authenticated;create role service_role;create schema auth;
 create table auth.users(id uuid primary key);insert into auth.users values('${uid}'),('${other}');
 create function auth.uid() returns uuid language sql stable as $$select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid$$;
 grant usage on schema auth to anon,authenticated;
 create table public.film_progress(id integer);create table public.tv_progress(id integer);
 create table public.media_catalogue(id integer);create table public.media_provider_links(id integer);`);
 await db.exec(await readFile(new URL('../supabase/migrations/20261019_books_search_ratings.sql',import.meta.url),'utf8'));
 await db.exec(await readFile(new URL('../supabase/migrations/20261022093314_books_reading_history_import.sql',import.meta.url),'utf8'));
 return db;
}
test('Import preview, atomic application, rereads, no-op rerun, conflict rollback and private history',async()=>{
 const db=await setup();
 const run=async(payload=fixture(),apply=false)=>(await db.query('select public.import_book_readings($1::jsonb,$2) result',[JSON.stringify(payload),apply])).rows[0].result;
 try{
  await db.exec('set role anon');await assert.rejects(run(),/permission denied/);
  await db.exec('set role authenticated');await assert.rejects(run(),/Sign in/);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[uid]);
  assert.deepEqual(await run(),{applied:false,new_books:1,new_readings:2,new_ratings:1,preserved_ratings:0});
  assert.equal((await db.query('select * from public.books')).rows.length,0);
  const bad=fixture();bad.readings=structuredClone(bad.readings);bad.readings[1].read_date='2022-07-02';
  await assert.rejects(run(bad),/Invalid reading/);
  await assert.rejects(run(bad,true),/Invalid reading/); // earlier inserts are rolled back too
  assert.equal((await db.query('select * from public.books')).rows.length,0);
  assert.equal((await run(fixture(),true)).new_readings,2);
  const b=(await db.query('select * from public.books')).rows[0];assert.equal(b.work_scope,'collection');assert.equal(b.open_library_work_id,null);
  assert.equal((await db.query('select * from public.book_readings')).rows.length,2);
  assert.deepEqual(await run(fixture(),true),{applied:true,new_books:0,new_readings:0,new_ratings:0,preserved_ratings:1});
  await db.query('select public.update_book_rating($1,9,$2,$3)',[b.id,'kindle','Current edited note']);
  await run(fixture(),true);
  assert.equal((await db.query('select rating from public.book_progress')).rows[0].rating,'9.0');
  assert.equal((await db.query("select notes from public.book_readings where source_key='test:new'")).rows[0].notes,'Original private note');
  const changed=fixture();changed.readings=structuredClone(changed.readings);changed.readings[1].rating=6;
  await assert.rejects(run(changed,true),/Imported reading changed/);
  const duplicate=fixture();duplicate.books=[book,{...book}];await assert.rejects(run(duplicate),/Duplicate/);
  await assert.rejects(db.query("insert into public.book_readings(user_id) values($1)",[uid]),/permission denied/);
  await db.query("select set_config('request.jwt.claim.sub',$1,false)",[other]);
  assert.equal((await db.query('select * from public.book_readings')).rows.length,0);
  assert.equal((await db.query('select * from public.book_progress')).rows.length,0);
  assert.equal((await run(fixture(),true)).new_readings,2);
  await db.exec('reset role;set role service_role');
  assert.equal((await db.query('select public.culture_backup_snapshot() s')).rows[0].s.book_readings.length,4);
 }finally{await db.close();}
});

test('Provider identity reuse preserves the existing rating and rejects repeated provider IDs',async()=>{
 const db=await setup();
 try{
  await db.exec('set role authenticated');await db.query("select set_config('request.jwt.claim.sub',$1,false)",[uid]);
  await db.query("select public.save_book_rating('/works/OL123W','Existing',array['Author'],2020,null,6,'audio','Keep me')");
  const payload=fixture();payload.books=[{...book,scope:'work',open_library_work_id:'/works/OL123W'}];
  const result=(await db.query('select public.import_book_readings($1,true) r',[JSON.stringify(payload)])).rows[0].r;
  assert.equal(result.new_books,0);assert.equal(result.preserved_ratings,1);
  assert.equal((await db.query('select notes from public.book_progress')).rows[0].notes,'Keep me');
  payload.books.push({...payload.books[0],work_key:'manual:bbbbbbbbbbbbbbbbbbbbbbbb'});
  await assert.rejects(db.query('select public.import_book_readings($1,false)',[JSON.stringify(payload)]),/Duplicate/);
 }finally{await db.close();}
});

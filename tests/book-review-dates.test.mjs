import {test} from 'node:test';import assert from 'node:assert/strict';import {readFile} from 'node:fs/promises';import {PGlite} from '@electric-sql/pglite';const uid='00000000-0000-0000-0000-000000000001',other='00000000-0000-0000-0000-000000000002';
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
 await db.exec(`create function auth.jwt() returns jsonb language sql stable as $$select '{}'::jsonb$$`);return db;
}
test('Reviews and imported history share dates, preserve rereads and reject unauthorized writes',async()=>{const db=await setup();try{
 const change=await readFile(new URL('../supabase/changes/book_review_reading_dates.sql',import.meta.url),'utf8');
 await db.exec(change);await db.exec(`set role authenticated;set request.jwt.claim.sub='${uid}'`);
 const meta={open_library_work_id:'/works/OL99999W',title:'Date book',authors:['Writer']};
 const save=(m,date,rating=8)=>db.query("select public.save_book_review($1::jsonb,$2,'audio','Review',$3::date) result",[JSON.stringify(m),rating,date]);
 const first=(await save(meta,'2026-11-09')).rows[0].result;assert.equal(first.progress.read_date,'2026-11-09');
 const id=first.book.id;await save({id},'2026-10-01',9);assert.equal((await db.query('select * from book_readings')).rows.length,1);assert.equal((await db.query('select * from book_readings')).rows[0].read_date.toISOString().slice(0,10),'2026-10-01');
 await db.exec('reset role');await db.query(`insert into book_readings(user_id,book_id,source_key,rating,reading_format,notes,read_date,read_date_precision,read_year,source_payload) values($1,$2,'import:old',7,'audio','Earlier','2020-04-01','month',2020,'{}')`,[uid,id]);
 await db.query("update book_readings set read_date_precision='month' where source_key=$1",[first.progress.reading_source_key]);
 await db.query('update book_progress set reading_source_key=null,read_date=null');await db.exec(change);
 const projected=(await db.query('select * from book_progress')).rows[0];assert.equal(projected.read_date.toISOString().slice(0,10),'2026-10-01');
 await db.exec('set role authenticated');await save({id},'2026-10-01');const rows=(await db.query('select * from book_readings order by read_date')).rows;assert.equal(rows.length,2);assert.equal(rows[0].notes,'Earlier');assert.equal(rows[1].read_date_precision,'month');
 await db.query("select set_config('request.jwt.claim.sub',$1,false)",[other]);await save({id},'2026-11-01');assert.equal((await db.query('select * from book_readings')).rows.length,1);
 await db.exec('set role anon');await assert.rejects(save(meta,'2026-11-09'),/permission denied/);
}finally{await db.close();}});

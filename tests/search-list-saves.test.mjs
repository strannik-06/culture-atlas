import test from 'node:test';import assert from 'node:assert/strict';import {PGlite} from '@electric-sql/pglite';import {readFile} from 'node:fs/promises';
const read=p=>readFile(new URL('../'+p,import.meta.url),'utf8');
test('Search saves register catalogue and private list atomically without progress; repeated saves and IMDb aliases reuse identities',async()=>{
const db=new PGlite();const uid='00000000-0000-0000-0000-000000000001';try{
await db.exec(`create role anon;create role authenticated;create role service_role;create schema auth;create table auth.users(id uuid primary key);insert into auth.users values('${uid}');create function auth.uid() returns uuid language sql stable as $$select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid$$;create function auth.jwt() returns jsonb language sql stable as $$select '{}'::jsonb$$;grant usage on schema auth to authenticated;create table film_progress(user_id uuid,film_id integer,watched boolean,rating numeric,notes text,watched_date date,updated_at timestamptz,primary key(user_id,film_id));`);
for(const f of ['20261019_books_search_ratings.sql','20261019_tv_ratings.sql','20261019_tv_scoped_identities.sql','20261021_media_catalogue.sql','20261022093314_books_reading_history_import.sql'])await db.exec(await read('supabase/migrations/'+f));
await db.exec(await read('supabase/changes/personal_lists.sql'));await db.exec(await read('supabase/changes/search_list_saves.sql'));
await db.exec(`set role authenticated;set request.jwt.claim.sub='${uid}'`);
const saveBook=m=>db.query("select save_book_to_list($1::jsonb,'/works/OL99999W') result",[JSON.stringify(m)]);
const meta={title:'Unread',authors:['Writer'],open_library_work_id:'/works/OL99999W'};
const first=(await saveBook(meta)).rows[0].result;await saveBook(meta);
assert.equal(first.entry.kind,'book');assert.equal((await db.query('select * from books')).rows.length,1);assert.equal((await db.query('select * from book_progress')).rows.length,0);assert.equal((await db.query('select * from book_readings')).rows.length,0);
await assert.rejects(db.query("select save_media_to_list($1,'movie:7','{}')",[uid]),/permission denied/);
await db.exec('reset role');
const movie={title:'Unwatched',imdb_id:'tt99999999',tmdb_id:99999999};
const saveMedia=p=>db.query('select save_media_to_list($1,$2,$3::jsonb) result',[uid,p,JSON.stringify(movie)]);
const film=(await saveMedia('movie:99999999')).rows[0].result;const alias=(await saveMedia('tv:99999999')).rows[0].result;assert.equal(alias.work_key,film.work_key);
assert.equal((await db.query('select * from film_progress')).rows.length,0);assert.equal((await db.query('select * from tv_progress')).rows.length,0);assert.equal((await db.query('select * from personal_lists')).rows.length,2);
await db.exec('set role anon');await assert.rejects(saveBook(meta),/permission denied/);
}finally{await db.close();}});

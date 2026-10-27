import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';
const read=(p,k)=>{let c={window:{}};vm.runInNewContext(fs.readFileSync(new URL('../'+p,import.meta.url),'utf8'),c);return JSON.parse(JSON.stringify(c.window[k]));};
test('Five Golden Globes ceremony years preserve every official nomination and winner',()=>{
 const source=JSON.parse(fs.readFileSync(new URL('../imports/globes-2021-2025-source.json',import.meta.url),'utf8'));
 const events=read('awards-2025.js','CULTURE_AWARDS'),catalog=read('film-catalog.js','CULTURE_CATALOG');
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/globes-2021-2025-audit.json',import.meta.url),'utf8'));assert.deepEqual(audit.unresolved,[]);
 const identities=new Map(audit.verified.map(r=>[r.title,r.id]));assert.equal(source.events.length,5);
 for(const expected of source.events){let matches=events.filter(e=>e.event==='Golden Globes'&&e.year===expected.year);assert.equal(matches.length,1);let actual=matches[0];assert.equal(actual.categories.length,12);
 for(let c of expected.categories){let found=actual.categories.find(x=>x.name===c.name);assert.ok(found);assert.deepEqual(found.entries.map(r=>({film_id:r.film_id,person:r.person,winner:r.winner})),c.entries.map(r=>({film_id:identities.get(r.title),person:r.person,winner:r.winner})));assert.equal(found.winners.length,1);for(let id of found.nominees)assert.ok(catalog.some(f=>f.id===id));}
 }
});

test('Historical Golden Globess deployment is idempotent, preserves existing data and aborts on provider conflicts',async()=>{
 const {PGlite}=await import('@electric-sql/pglite');const db=new PGlite();
 const sql=fs.readFileSync(new URL('../imports/globes-2021-2025-catalogue-sync.sql',import.meta.url),'utf8');
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/globes-2021-2025-audit.json',import.meta.url),'utf8'));
 try{
  await db.exec("create table media_catalogue(work_key text primary key,work_type text,film_id bigint unique,metadata jsonb,is_static boolean);create table media_provider_links(provider_key text primary key,work_key text references media_catalogue);create table film_progress(film_id bigint primary key,rating numeric,notes text);insert into film_progress values (1,8.5,'Preserve my notes');");
  await db.exec(sql);assert.equal((await db.query('select count(*) as n from media_catalogue')).rows[0].n,audit.new_canonical_ids.length);
  const first=audit.new_canonical_ids[0];await db.query("update media_catalogue set metadata=metadata||'{\"curated\":true}'::jsonb where film_id=$1",[first.id]);
  await db.exec(sql);assert.equal((await db.query('select metadata from media_catalogue where film_id=$1',[first.id])).rows[0].metadata.curated,true);assert.equal(Number((await db.query('select rating from film_progress')).rows[0].rating),8.5);assert.equal((await db.query('select notes from film_progress')).rows[0].notes,'Preserve my notes');
  await db.exec("insert into media_catalogue values('movie:999999','movie',999999,'{}',false)");await db.query('update media_provider_links set work_key=$1 where provider_key=$2',['movie:999999','movie:'+first.tmdb_id]);
  await assert.rejects(db.exec(sql),/different work/);await db.exec('rollback');assert.equal((await db.query('select work_key from media_provider_links where provider_key=$1',['movie:'+first.tmdb_id])).rows[0].work_key,'movie:999999');
 }finally{await db.close();}
});

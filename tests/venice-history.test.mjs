import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';
const read=(p,k)=>{let c={window:{}};vm.runInNewContext(fs.readFileSync(new URL('../'+p,import.meta.url),'utf8'),c);return JSON.parse(JSON.stringify(c.window[k]));};
test('Venice history preserves every selected film and aggregates jury prizes within two sections',()=>{
 const source=JSON.parse(fs.readFileSync(new URL('../imports/venice-2021-2025-source.json',import.meta.url),'utf8')),audit=JSON.parse(fs.readFileSync(new URL('../imports/venice-2021-2025-audit.json',import.meta.url),'utf8')),events=read('awards-2025.js','CULTURE_AWARDS'),catalog=read('film-catalog.js','CULTURE_CATALOG');assert.deepEqual(audit.unresolved,[]);assert.equal(audit.verified.length,202);const ids=new Map(audit.verified.map(r=>[r.source,r.id]));const norm=s=>String(s).normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
 for(let expected of source.events){assert.deepEqual(expected.unmatched_awards,[]);let matches=events.filter(e=>e.event==='Venice'&&e.year===expected.year);assert.equal(matches.length,1);const event=matches[0];assert.equal(event.categories.length,2);
 for(let p of expected.programmes){const c=event.categories.find(c=>c.name===p.name);assert.ok(c);assert.equal(c.entries.length,p.selection.length);assert.equal(new Set(c.entries.map(r=>r.film_id)).size,c.entries.length);assert.deepEqual(c.nominees,p.selection.map(f=>ids.get(f.source)));
 for(let f of p.selection){const id=ids.get(f.source),row=c.entries.find(r=>r.film_id===id);assert.ok(catalog.some(f=>f.id===id));let prizes=p.prizes.flatMap(prize=>prize.entries.filter(r=>r.winner&&[f.title,...f.aliases||[]].some(t=>norm(t)===norm(r.title))).map(r=>prize.name+(r.people?.length?' · '+r.people.join(', '):'')));assert.deepEqual(row.prizes,prizes);assert.equal(row.winner,prizes.length>0);assert.deepEqual(event.films.find(f=>f.id===id).awards,prizes);}
 }
 }
 const e=events.find(e=>e.event==='Venice'&&e.year===2024),film=catalog.find(f=>f.title==='Familiar Touch');assert.equal(e.films.find(f=>f.id===film.id).awards.length,3);

});

test('Historical Golden Globess deployment is idempotent, preserves existing data and aborts on provider conflicts',async()=>{
 const {PGlite}=await import('@electric-sql/pglite');const db=new PGlite();
 const sql=fs.readFileSync(new URL('../imports/venice-2021-2025-catalogue-sync.sql',import.meta.url),'utf8');
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/venice-2021-2025-audit.json',import.meta.url),'utf8'));
 try{
  await db.exec("create table media_catalogue(work_key text primary key,work_type text,film_id bigint unique,metadata jsonb,is_static boolean);create table media_provider_links(provider_key text primary key,work_key text references media_catalogue);create table film_progress(film_id bigint primary key,rating numeric,notes text);insert into film_progress values (1,8.5,'Preserve my notes');");
  await db.exec(sql);assert.equal((await db.query('select count(*) as n from media_catalogue')).rows[0].n,audit.new_canonical_ids.length);
  const first=audit.new_canonical_ids[0];await db.query("update media_catalogue set metadata=metadata||'{\"curated\":true}'::jsonb where film_id=$1",[first.id]);
  await db.exec(sql);assert.equal((await db.query('select metadata from media_catalogue where film_id=$1',[first.id])).rows[0].metadata.curated,true);assert.equal(Number((await db.query('select rating from film_progress')).rows[0].rating),8.5);assert.equal((await db.query('select notes from film_progress')).rows[0].notes,'Preserve my notes');
  await db.exec("insert into media_catalogue values('movie:999999','movie',999999,'{}',false)");await db.query('update media_provider_links set work_key=$1 where provider_key=$2',['movie:999999','movie:'+first.tmdb_id]);
  await assert.rejects(db.exec(sql),/different work/);await db.exec('rollback');assert.equal((await db.query('select work_key from media_provider_links where provider_key=$1',['movie:'+first.tmdb_id])).rows[0].work_key,'movie:999999');
 }finally{await db.close();}
});

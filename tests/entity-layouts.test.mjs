import test from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {Window} from 'happy-dom';
import {PGlite} from '@electric-sql/pglite';

const script = await readFile(new URL('../entity-layouts.js', import.meta.url), 'utf8');
const tick = () => new Promise(resolve => setTimeout(resolve, 0));

test('Shared grids remember each page, isolate account choices, and synchronize recent edits', async () => {
 const window = new Window({url:'https://atlas.test', settings:{
  enableJavaScriptEvaluation:true, suppressInsecureJavaScriptEnvironmentWarning:true
 }});
 const document = window.document;
 document.body.innerHTML = '<p id="count">Results</p><div id="results"></div>';
 const count = document.getElementById('count');
 const results = document.getElementById('results');
 const mode = () => results.dataset.entityLayout;
 const choose = value => document.querySelector('[data-layout-choice='+value+']').click();
 const remote = new Map([['alice', new Map([['films/catalogue','cards']])]]);
 let resolveRead;
 let finishWrite;
 const writes = [];
 try {
  window.eval(script);
  const layouts = window.CultureLayouts;
  layouts.init({from:()=>({
   select:()=>({eq:(_column,id)=>id==='alice'
    ? new Promise(resolve => { resolveRead = resolve; })
    : Promise.resolve({data:[],error:null})}),
   async upsert(row) {
    writes.push(row);
    if (writes.length === 1) await new Promise(resolve => {finishWrite = resolve;});
    if (!remote.has(row.user_id)) remote.set(row.user_id, new Map());
    remote.get(row.user_id).set(row.page_key,row.layout);
    return {error:null};
   }
  })});
  layouts.mount(results,count,'films/catalogue');
  choose('list');
  assert.equal(mode(),'list');
  layouts.mount(results,count,'films/ratings');
  assert.equal(mode(),'cards');
  layouts.mount(results,count,'films/catalogue');
  assert.equal(mode(),'list');
  const alice = layouts.setSession({id:'alice'});
  assert.equal(mode(),'cards');
  choose('list');
  choose('cards');
  choose('list');
  finishWrite();
  await tick();
  assert.deepEqual(writes.map(row=>row.layout), ['list','list']);
  resolveRead({data:[{page_key:'films/catalogue',layout:'cards'}],error:null});
  await alice;
  assert.equal(mode(),'list');
  assert.equal(remote.get('alice').get('films/catalogue'),'list');
  await layouts.setSession({id:'bob'});
  assert.equal(mode(),'cards');
  assert.equal(document.querySelectorAll('.entity-layout-switch').length,1);
  await layouts.setSession(null);
  assert.equal(mode(),'list');
  layouts.mount(results,count,'films/statistics/drilldown','list');
  assert.equal(mode(),'list');
 } finally {
  await window.happyDOM.close();
 }
});

test('Account layout storage allows own upserts and rejects other accounts and guests', async () => {
 const db = new PGlite();
 const alice = '00000000-0000-0000-0000-000000000001';
 const bob = '00000000-0000-0000-0000-000000000002';
 const migration = await readFile(new URL('../supabase/changes/entity_layout_preferences.sql', import.meta.url), 'utf8');
 try {
  await db.exec(`
   create role anon;
   create role authenticated;
   create schema auth;
   create table auth.users(id uuid primary key);
   insert into auth.users values ('${alice}'), ('${bob}');
   create function auth.uid() returns uuid language sql as
    $$select nullif(current_setting('request.jwt.sub',true),'')::uuid$$;
   create function auth.jwt() returns jsonb language sql as
    $$select coalesce(nullif(current_setting('request.jwt.claims',true),'')::jsonb,'{}')$$;
   grant usage on schema auth to authenticated;
  `);
  await db.exec(migration);
  await db.exec(`set role authenticated; set request.jwt.sub='${alice}';`);
  const upsert = layout => db.query(`
   insert into public.entity_layout_preferences(user_id, page_key, layout)
   values(auth.uid(),'films/catalogue',$1)
   on conflict(user_id,page_key) do update set layout=excluded.layout
  `,[layout]);
  await upsert('cards');
  await upsert('list');
  assert.equal((await db.query('select layout from public.entity_layout_preferences')).rows[0].layout,'list');
  await assert.rejects(upsert('unknown'), /check constraint/);
  await assert.rejects(db.query(`insert into public.entity_layout_preferences values ('${bob}','films/catalogue','list')`), /row-level security/);
  await db.exec(`set request.jwt.sub='${bob}';`);
  assert.equal((await db.query('select * from public.entity_layout_preferences')).rows.length,0);
  await db.exec(`set request.jwt.claims='{"is_anonymous":true}';`);
  await assert.rejects(upsert('cards'), /row-level security/);
  await db.exec('reset role; set role anon;');
  await assert.rejects(db.query('select * from public.entity_layout_preferences'), /permission denied/);
 } finally {
  await db.close();
 }
});

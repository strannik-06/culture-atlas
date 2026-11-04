import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';
const root=new URL('../',import.meta.url),json=p=>JSON.parse(fs.readFileSync(new URL(p,root))),read=(p,k)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(new URL(p,root),'utf8'),c);return JSON.parse(JSON.stringify(c.window[k]));};
const norm=s=>String(s).normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
test('All 30 film editions preserve every sourced selection, nomination, person and prize',()=>{
 const events=read('awards-2025.js','CULTURE_AWARDS'),catalogue=read('film-catalog.js','CULTURE_CATALOG'),audit=json('imports/film-awards-2011-2015-audit.json');assert.deepEqual(audit.unresolved,[]);const ids=new Map(audit.verified.map(r=>[r.key,r.id]));
 assert.equal(events.filter(e=>e.year>=2011&&e.year<=2015).length,30);
 for(const slug of ['oscars','bafta','globes','cannes','venice','berlinale'])for(const s of json(`imports/${slug}-2011-2015-source.json`).events){
 const e=events.filter(e=>e.event===s.event&&e.year===s.year);assert.equal(e.length,1);const actual=e[0];
 if(s.status==='not-held'){assert.equal(actual.status,'not-held');assert.deepEqual(actual.films,[]);assert.deepEqual(actual.categories,[]);continue;}
 assert.equal(actual.categories.length,(s.programmes||s.categories).length);
 if(s.categories)for(const c of s.categories){const expected=c.entries.map(r=>({film_id:ids.get(`${s.event}/${s.year}/${r.title}`),person:r.person,winner:r.winner})),a=actual.categories.find(a=>a.name===c.name);assert.deepEqual(a.entries,expected);assert.equal(a.entries.filter(r=>r.winner).length,1);}
 else for(const p of s.programmes){const a=actual.categories.find(a=>a.name===p.name);assert.deepEqual(a.nominees,p.selection.map(f=>ids.get(f.source)));assert.equal(new Set(a.nominees).size,a.nominees.length);for(const f of p.selection){const r=a.entries.find(r=>r.film_id===ids.get(f.source)),prizes=p.prizes.flatMap(prize=>prize.entries.filter(r=>r.winner&&[f.title,...f.aliases||[]].some(t=>norm(t)===norm(r.title))).map(r=>prize.name+(r.people?.length?' · '+r.people.join(', '):'')));assert.deepEqual(r.prizes,prizes);assert.equal(r.winner,!!prizes.length);}}
 for(const f of actual.films){assert.ok(catalogue.some(c=>c.id===f.id));assert.deepEqual(f.awards,actual.categories.flatMap(c=>[...new Set(c.entries.filter(r=>r.film_id===f.id&&r.winner).flatMap(r=>r.prizes||[c.name]))]));}
 }
 const berlin=events.filter(e=>e.event==='Berlinale'&&e.year>=2011&&e.year<=2015).sort((a,b)=>a.year-b.year);assert.deepEqual(berlin.map(e=>e.categories.length),[1,1,1,1,1]);assert.equal(berlin[4].categories[0].name,'Main Competition');
});

test('New catalogue registration is repeatable and preserves ratings and curated metadata',async()=>{
 const {PGlite}=await import('@electric-sql/pglite'),db=new PGlite(),audit=json('imports/film-awards-2011-2015-audit.json'),sql=fs.readFileSync(new URL('imports/film-awards-2011-2015-catalogue-sync.sql',root),'utf8');
 try{await db.exec("create table media_catalogue(work_key text primary key,work_type text,film_id bigint unique,metadata jsonb,is_static boolean);create table media_provider_links(provider_key text primary key,work_key text references media_catalogue);create table film_progress(film_id bigint primary key,rating numeric,notes text);insert into film_progress values(1,8.5,'Keep my notes');");await db.exec(sql);assert.equal((await db.query('select count(*) as n from media_catalogue')).rows[0].n,audit.new_canonical_ids.length);const first=audit.new_canonical_ids[0];await db.query("update media_catalogue set metadata=metadata||'{\"curated\":true}'::jsonb where film_id=$1",[first.id]);await db.exec(sql);assert.equal((await db.query('select metadata from media_catalogue where film_id=$1',[first.id])).rows[0].metadata.curated,true);assert.equal(Number((await db.query('select rating from film_progress')).rows[0].rating),8.5);assert.equal((await db.query('select notes from film_progress')).rows[0].notes,'Keep my notes');await db.exec("insert into media_catalogue values('movie:999999','movie',999999,'{}',false)");await db.query('update media_provider_links set work_key=$1 where provider_key=$2',['movie:999999','movie:'+first.tmdb_id]);await assert.rejects(db.exec(sql),/different work/);await db.exec('rollback');}finally{await db.close();}
});

test('Previously merged catalogue identities and detail metadata remain byte-equivalent',async()=>{
 const {createHash}=await import('node:crypto'),b=json('imports/film-awards-2011-2015-baseline.json'),ids=new Set(b.ids),hash=o=>createHash('sha256').update(JSON.stringify(o)).digest('hex');
 assert.equal(hash(read('film-catalog.js','CULTURE_CATALOG').filter(f=>ids.has(f.id))),b.catalogue_sha256);
 assert.equal(hash(read('awards-2025.js','CULTURE_AWARDS').filter(e=>e.year<2011||e.year>2015)),b.awards_sha256);
 assert.equal(hash(Object.fromEntries(Object.entries(read('film-details.js','CULTURE_FILM_DETAILS')).filter(([id])=>ids.has(Number(id))))),b.details_sha256);
});

test('Main prizes use the correct historical editions and canonical films',()=>{
 const events=read('awards-2025.js','CULTURE_AWARDS'),films=read('film-catalog.js','CULTURE_CATALOG');
 const expected={'Golden Globes':['The Social Network','The Descendants','Argo','12 Years a Slave','Boyhood'],Oscars:["The King's Speech",'The Artist','Argo','12 Years a Slave','Birdman or (The Unexpected Virtue of Ignorance)'],BAFTA:["The King's Speech",'The Artist','Argo','12 Years a Slave','Boyhood'],Cannes:['The Tree of Life','Amour',"Blue Is the Warmest Color",'Winter Sleep','Dheepan'],Venice:['Faust','Pietà','Sacro GRA','A Pigeon Sat on a Branch Reflecting on Existence','From Afar'],Berlinale:['A Separation','Caesar Must Die',"Child’s Pose",'Black Coal, Thin Ice','Taxi']};
 for(const[event,titles]of Object.entries(expected))for(const[i,title]of titles.entries()){if(!title)continue;const e=events.find(e=>e.event===event&&e.year===2011+i),id=e.categories[0].winner;assert.equal(norm(films.find(f=>f.id===id)?.title),norm(title),event+' '+(2011+i));}
});

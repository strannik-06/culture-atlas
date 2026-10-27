import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';
import {Window} from 'happy-dom';
const html=fs.readFileSync(new URL('../index.html',import.meta.url),'utf8');
const globalFrom=(file,key)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(new URL('../'+file,import.meta.url),'utf8'),c);return JSON.parse(JSON.stringify(c.window[key]));};
const editions=globalFrom('awards-2026.js','CULTURE_AWARDS_2026');
const spec=JSON.parse(fs.readFileSync(new URL('../imports/awards-2026-source.json',import.meta.url),'utf8'));
const tick=()=>new Promise(r=>setTimeout(r,20));
async function boot(hash='#/films/awards'){
 const w=new Window({url:'https://example.test/culture-atlas/'+hash,settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});
 w.document.write(html.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};
 w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;};
 for(const[,name]of html.matchAll(/<script src="([^"]+)"/g))if(!/^https?:/.test(name))w.eval(fs.readFileSync(new URL('../'+name,import.meta.url),'utf8'));
 w.eval([...html.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1]);await tick();return {w,$:id=>w.document.getElementById(id),close:()=>w.happyDOM.close()};
}
test('2026: every award, complete selected feature scope, winners and canonical references match source records',()=>{
 assert.equal(editions.length,6);const films=globalFrom('film-catalog.js','CULTURE_CATALOG'),known=new Map(films.map(f=>[f.id,f]));
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/awards-2026-audit.json',import.meta.url),'utf8'));assert.deepEqual(audit.unresolved,[]);
 for(const expected of spec.events){const e=editions.find(e=>e.event===expected.event);assert.ok(e,expected.event);
  const sourceGroups=expected.programmes||expected.categories;assert.equal(e.categories.length,sourceGroups.length);
  for(const[cindex,c]of e.categories.entries()){
   const source=sourceGroups[cindex];assert.equal(c.entries.length,(source.selection||source.entries).length);
   assert.equal(new Set(c.nominees).size,c.nominees.length);assert.equal(new Set(c.entries.map(r=>r.film_id)).size,expected.programmes?c.entries.length:c.nominees.length);assert.ok(c.winners.every(id=>c.nominees.includes(id)));
   for(const row of c.entries){assert.ok(known.has(row.film_id));assert.ok(e.films.some(f=>f.id===row.film_id));}
   if(expected.programmes){assert.equal(c.name,source.name);for(const row of c.entries){assert.equal(row.winner,row.prizes.length>0);for(const prize of row.prizes)assert.ok(e.films.find(f=>f.id===row.film_id).awards.includes(prize));}}
   else {assert.equal(c.entries.filter(e=>e.winner).length,source.entries.filter(e=>e.winner).length);for(const winner of c.entries.filter(x=>x.winner))assert.ok(e.films.find(f=>f.id===winner.film_id).awards.includes(c.name));}
  }
 }
 const oscars=editions.find(e=>e.event==='Oscars');assert.equal(oscars.categories[0].name,'Best Picture');assert.equal(oscars.categories[0].entries.length,10);
 assert.equal(known.get(oscars.categories[0].winner).title.toLowerCase(),'one battle after another');
});
test('Award tabs, latest editions, year history, category repeats and winner-first cards survive refresh',async()=>{
 const a=await boot();try{
  const{w,$}=a;assert.equal($('award-tabs').querySelectorAll('a').length,6);assert.equal($('award-year').value,'2026');assert.equal($('award-event').closest('[hidden]').hidden,true);
  $('award-tabs').querySelector('a[href*="event=Oscars"]').click();assert.equal($('award-edition-title').textContent,'Oscars 2026');
  const groups=$('awards-grid').querySelectorAll('.award-category');assert.equal(groups.length,11);assert.equal(groups[0].querySelector('h3').textContent,'Best Picture');assert.match(groups[0].querySelector('article').textContent,/One Battle After Another|One Battle after Another/);assert.match(groups[0].querySelector('article').className,/award-winner/);
  const id=groups[0].querySelector('article').dataset.filmId;assert.ok($('awards-grid').querySelectorAll(`[data-film-id="${id}"]`).length>1);
  const previous=$('award-year-nav').querySelector('[rel="prev"]');assert.ok(previous);previous.click();assert.equal($('award-year').value,'2025');
  w.history.back();await tick();assert.equal($('award-year').value,'2026');
  const reload=await boot(w.location.hash);try{assert.equal(reload.$('award-edition-title').textContent,'Oscars 2026');assert.equal(reload.$('awards-grid').querySelectorAll('.award-category').length,11);}finally{await reload.close();}
  const card=$('awards-grid').querySelector('article');card.querySelector('h3 a').click();assert.equal($('film-detail-dialog').open,true);w.history.back();await tick();assert.equal($('film-detail-dialog').open,false);assert.equal($('award-edition-title').textContent,'Oscars 2026');
 }finally{await a.close();}
});
test('Festivals show one card per film per section and aggregate every prize and shared performer',async()=>{
 for(const name of ['Cannes','Venice','Berlinale']){
  const a=await boot('#/films/awards?event='+name+'&year=2026');try{
   const{$}=a,groups=$('awards-grid').querySelectorAll('.award-category'),e=editions.find(e=>e.event===name);assert.equal(groups.length,2);
   for(const [i,panel]of [...groups].entries()){
    const cards=[...panel.querySelectorAll('article')],ids=cards.map(c=>c.dataset.filmId);assert.equal(new Set(ids).size,ids.length);assert.equal(cards.length,e.categories[i].entries.length);
    for(const card of cards){const row=e.categories[i].entries.find(r=>String(r.film_id)===card.dataset.filmId);assert.equal(card.querySelectorAll('.festival-prizes>div').length,row.prizes.length);for(const prize of row.prizes)assert.ok(card.textContent.includes(prize));}
   }
   assert.equal(groups[0].querySelector('article').dataset.filmId,String(e.categories[0].winner));
   if(name==='Cannes'){assert.match(groups[0].textContent,/Virginie EFIRA|Virginie Efira/);assert.match(groups[0].textContent,/Tao OKAMOTO|Tao Okamoto/);assert.match(groups[1].textContent,/Caméra d’or/);}
   if(name==='Venice'){assert.match(groups[1].textContent,/Lion of the Future/);const row=e.categories[0].entries.find(r=>r.prizes.length>1);assert.ok(row);}
  }finally{await a.close();}
 }
});
test('Ceremony performer nominations still repeat and share one rating',async()=>{
 const a=await boot('#/films/awards?event=Oscars&year=2026');try{
  const{w,$}=a,groups=$('awards-grid').querySelectorAll('.award-category'),id=groups[0].querySelector('article').dataset.filmId;
  const first=$('awards-grid').querySelector(`[data-film-id="${id}"]`);first.querySelector('[data-open-stars]').click();const stars=$('star-picker')||w.document.querySelector('.star-picker:not([hidden])');assert.ok(stars);
  for(let i=0;i<16;i++)stars.dispatchEvent(new w.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));stars.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Enter',bubbles:true}));
  const copies=$('awards-grid').querySelectorAll(`[data-film-id="${id}"] [data-open-stars]`);assert.ok(copies.length>1);for(const copy of copies)assert.match(copy.textContent,/8.0\/10/);
 }finally{await a.close();}
});
test('Award URLs preserve older category/winners bookmarks and reject unavailable editions honestly',async()=>{
 const a=await boot('#/films/awards?event=Oscars&year=2025&category=0&result=winners');try{
  assert.equal(a.$('awards-grid').querySelectorAll('.award-category').length,1);assert.equal(a.$('awards-grid').querySelectorAll('article').length,1);
  a.w.CultureRouter.navigate({section:'films',view:'awards',params:{event:'Cannes',year:'2024'}});assert.match(a.$('awards-grid').textContent,/not been added/);assert.equal(a.$('award-years').querySelectorAll('a').length,2);
 }finally{await a.close();}
});

test('Catalogue deployment is idempotent, preserves existing data and aborts on provider conflicts',async()=>{
 const {PGlite}=await import('@electric-sql/pglite');const db=new PGlite();
 const sql=fs.readFileSync(new URL('../imports/awards-2026-catalogue-sync.sql',import.meta.url),'utf8');
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/awards-2026-audit.json',import.meta.url),'utf8'));
 try{
  await db.exec("create table media_catalogue(work_key text primary key,work_type text,film_id bigint unique,metadata jsonb,is_static boolean);create table media_provider_links(provider_key text primary key,work_key text references media_catalogue);create table film_progress(film_id bigint primary key,rating numeric,notes text);insert into film_progress values (1,8.5,'Preserve my notes');");
  await db.exec(sql);assert.equal((await db.query('select count(*) as n from media_catalogue')).rows[0].n,audit.new_canonical_ids.length);
  const first=audit.new_canonical_ids[0];await db.query("update media_catalogue set metadata=metadata||'{\"curated\":true}'::jsonb where film_id=$1",[first.id]);
  await db.exec(sql);assert.equal((await db.query('select metadata from media_catalogue where film_id=$1',[first.id])).rows[0].metadata.curated,true);assert.equal(Number((await db.query('select rating from film_progress')).rows[0].rating),8.5);assert.equal((await db.query('select notes from film_progress')).rows[0].notes,'Preserve my notes');
  await db.exec("insert into media_catalogue values('movie:999999','movie',999999,'{}',false)");await db.query('update media_provider_links set work_key=$1 where provider_key=$2',['movie:999999','movie:'+first.tmdb_id]);
  await assert.rejects(db.exec(sql),/different work/);await db.exec('rollback');assert.equal((await db.query('select work_key from media_provider_links where provider_key=$1',['movie:'+first.tmdb_id])).rows[0].work_key,'movie:999999');
 }finally{await db.close();}
});

test('Historical Oscar editions navigate all five years and restore categories on reload',async()=>{
 for(const year of [2021,2022,2023,2024,2025]){
  const a=await boot(`#/films/awards?event=Oscars&year=${year}`);try{
   assert.equal(a.$('award-edition-title').textContent,`Oscars ${year}`);
   assert.equal(a.$('awards-grid').querySelectorAll('.award-category').length,11);
   assert.equal(a.$('award-years').querySelectorAll('a').length,6);
   const main=a.$('awards-grid').querySelector('.award-category');assert.match(main.textContent,/Best Picture/);
   const first=main.querySelector('article');assert.ok(first);assert.match(first.textContent,/Winner/);
  }finally{await a.close();}
 }
});

test('BAFTA historical editions preserve twelve categories, year navigation and winner-first cards',async()=>{
 for(const year of [2021,2022,2023,2024,2025]){
  const a=await boot(`#/films/awards?event=BAFTA&year=${year}`);try{
   assert.equal(a.$('award-edition-title').textContent,`BAFTA ${year}`);
   assert.equal(a.$('awards-grid').querySelectorAll('.award-category').length,12);
   assert.equal(a.$('award-years').querySelectorAll('a').length,6);
   const main=a.$('awards-grid').querySelector('.award-category');assert.match(main.textContent,/Best Film/);assert.match(main.querySelector('article').textContent,/Winner/);
  }finally{await a.close();}
 }
});

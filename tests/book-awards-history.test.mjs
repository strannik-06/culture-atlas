import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';import{Window}from'happy-dom';
const root=new URL('../',import.meta.url),html=fs.readFileSync(new URL('index.html',root),'utf8');
const read=(file,key)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(new URL(file,root),'utf8'),c);return JSON.parse(JSON.stringify(c.window[key]));};
const history=read('book-awards-history.js','CULTURE_BOOK_AWARDS_HISTORY'),tick=()=>new Promise(r=>setTimeout(r,30));
async function boot(hash='#/books/awards'){
 const w=new Window({url:'https://example.test/culture-atlas/'+hash,settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});w.document.write(html.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;};
 for(const[,file]of html.matchAll(/<script src="([^"]+)"/g))if(!/^https?:/.test(file))w.eval(fs.readFileSync(new URL(file,root),'utf8'));
 w.fetch=async()=>({ok:false});w.eval([...html.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1]);await tick();return{w,$:id=>w.document.getElementById(id),close:()=>w.happyDOM.close()};
}
const event=(name,year)=>history.events.find(e=>e.event===name&&e.year===year);
test('All six awards cover every year from 2011 through 2025 with the correct historical formats',()=>{
 assert.equal(history.events.length,90);const books=new Map(history.books.map(b=>[b.key,b]));assert.equal(books.size,history.books.length);
 for(const name of ['Booker Prize','International Booker','Pulitzer Prize','Nobel Literature','National Book Awards','Prix Goncourt'])for(let year=2011;year<=2025;year++){
  const e=event(name,year);assert.ok(e,`${name} ${year}`);assert.ok(e.source);const known=new Set([...books.keys(),...(e.author_items||[]).map(a=>a.id)]);
  for(const c of e.categories){assert.ok(c.source);assert.equal(new Set(c.entries.map(r=>r.item_id)).size,c.entries.length);for(const r of c.entries)assert.ok(known.has(r.item_id));}
  if(name==='Booker Prize')assert.equal(e.categories[0].entries.length,6);
  if(name==='International Booker'&&year>=2016){assert.equal(e.categories[0].entries.length,6);assert.ok(e.categories[0].entries.every(r=>r.translator));}
  if(name==='National Book Awards'){assert.equal(e.categories.length,year<2018?4:5);assert.ok(e.categories.every(c=>c.entries.length===5&&c.entries.filter(r=>r.winner).length===1));}
  if(name==='Prix Goncourt'){assert.equal(e.categories[0].entries.length,4);assert.equal(e.categories[0].entries.filter(r=>r.winner).length,1);}
  if(name==='Nobel Literature'){assert.equal(e.books.length,3);assert.ok(e.categories[0].entries.every(r=>!r.winner));assert.ok(e.laureate.name);}
 }
 assert.equal(event('Booker Prize',2019).categories[0].entries.filter(r=>r.winner).length,2);
 assert.equal(event('Pulitzer Prize',2012).categories.find(c=>c.name==='Fiction').entries.filter(r=>r.winner).length,0);
 assert.equal(event('Pulitzer Prize',2023).categories.find(c=>c.name==='Fiction').entries.filter(r=>r.winner).length,2);
 for(const year of [2012,2014]){assert.equal(event('International Booker',year).status,'not-held');assert.equal(event('International Booker',year).books.length,0);}
 for(const [year,count]of [[2011,13],[2013,10],[2015,10]]){const e=event('International Booker',year);assert.equal(e.author_items.length,count);assert.equal(e.author_items.filter(a=>a.winner).length,1);assert.equal(e.books.length,3);}
 const aliases=new Map();for(const b of history.books){assert.ok(b.authors.length);assert.ok(b.sources.length);for(const id of [b.open_library_work_id,...b.alternate_work_ids||[]].filter(Boolean)){assert.ok(!aliases.has(id)||aliases.get(id)===b.key);aliases.set(id,b.key);}}
});
test('Historic book URLs render all award types and distinguish author awards, non-editions and shared prizes',async()=>{
 for(const [name,year]of [['Booker Prize',2019],['Pulitzer Prize',2012],['Nobel Literature',2018],['National Book Awards',2011],['Prix Goncourt',2025],['International Booker',2011],['International Booker',2012]]){
  const a=await boot(`#/books/awards?event=${encodeURIComponent(name)}&year=${year}`);try{assert.equal(a.$('book-award-edition-title').textContent,`${name} ${year}`);assert.equal(a.$('book-award-years').querySelectorAll('a').length,16);
   if(name==='International Booker'&&year===2011){assert.equal(a.$('book-awards-grid').querySelectorAll('.award-author-card').length,13);assert.equal(a.$('book-awards-grid').querySelectorAll('.award-author-card [data-book-rate]').length,0);assert.match(a.$('book-award-intro').textContent,/Philip Roth/);}
   if(name==='International Booker'&&year===2012)assert.match(a.$('book-awards-grid').textContent,/No prize was awarded/);
   if(name==='Nobel Literature'){assert.match(a.$('book-award-intro').textContent,/Olga Tokarczuk/);assert.match(a.$('book-awards-event-details').textContent,/2019/);assert.doesNotMatch(a.$('book-award-intro').textContent,/Anne Carson/);}
  }finally{await a.close();}
 }
});
test('Historical books registration preserves private rows and existing metadata, is idempotent and rejects conflicting identities',async()=>{
 const {PGlite}=await import('@electric-sql/pglite'),db=new PGlite();const source=JSON.parse(fs.readFileSync(new URL('../imports/book-awards-2011-2025-source.json',import.meta.url),'utf8')),sql=fs.readFileSync(new URL('../imports/book-awards-2011-2025-catalogue-sync.sql',import.meta.url),'utf8');
 try{await db.exec('create table books(id bigint generated by default as identity primary key,open_library_work_id text unique,source_key text unique,title text,authors text[],first_publish_year integer,cover_id bigint,goodreads_id text unique,work_scope text);create table book_progress(book_id bigint,rating numeric,notes text);');
 for(const b of source.books.filter(b=>b.catalogue_id))await db.query('insert into books(id,open_library_work_id,title,authors) values($1,$2,$3,$4)',[b.catalogue_id,b.open_library_work_id,b.catalogue_snapshot.title,b.catalogue_snapshot.authors]);await db.exec('alter table books alter column id restart with 10000');await db.exec("insert into book_progress values(39,8.5,'Preserve this note')");
 await db.exec(sql);assert.equal((await db.query('select count(*) n from books')).rows[0].n,source.books.length);const before=await db.query('select * from books order by id');await db.exec(sql);assert.deepEqual((await db.query('select * from books order by id')).rows,before.rows);assert.equal((await db.query('select notes from book_progress')).rows[0].notes,'Preserve this note');
 const reused=source.books.find(b=>b.catalogue_id);await db.query('update books set title=$1 where id=$2',['Wrong work',reused.catalogue_id]);await assert.rejects(db.exec(sql),/identity changed|another identity/);await db.exec('rollback');
 }finally{await db.close();}
});

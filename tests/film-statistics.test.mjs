import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';
import {Window} from 'happy-dom';
const read=f=>fs.readFileSync(new URL('../'+f,import.meta.url),'utf8');
const ctx={window:{}};vm.runInNewContext(read('film-statistics-core.js'),ctx);const C=ctx.window.CultureFilmStatisticsCore;
const films=[{id:1,title:'One',year:2000,director:'A'},{id:2,title:'Two',year:2010,director:'A'},{id:3,title:'Three',year:2020,director:'B'},{id:4,title:'Four',year:null,director:'B'}];
const metadata={1:{genres:['Drama','Drama'],countries:['FR','US'],cast:['Actor A','Actor A']},2:{genres:['Drama','Comedy'],countries:['US'],cast:['Actor A','Actor B']},3:{genres:['Comedy'],countries:['FR'],cast:['Actor B']}};
const progress={1:{rating:8,watched_date:'2024-01-03'},2:{rating:6,watched_date:'2024-03-15'},3:{watched:true,watched_date:'2026-01-01'},4:{rating:9,watched_date:'2024-02-30'}};
test('Statistics: canonical deduplication, half-point ratings, missing metadata, and recorded dates only',()=>{
 const rows=C.records([...films,films[0]],progress,metadata);assert.equal(rows.length,4);assert.equal(rows[2].rating,null);assert.equal(rows[3].date,null);assert.equal(rows[3].year,null);assert.equal(JSON.stringify(rows[3].genres),'["Unknown"]');assert.equal(rows[0].actors.length,1);
 assert.equal(C.records([{id:7}],{7:{rating:'8'}}).length,0);assert.equal(C.records([{id:7}],{7:{rating:7.2}}).length,0);
 assert.equal(C.validDate('2024-02-29'),'2024-02-29');assert.equal(C.validDate('2023-02-29'),null);
});
test('Statistics: overlapping country/genre counts, exposure includes unrated films, averages do not',()=>{
 const rows=C.records(films,progress,metadata),fr=C.groups(rows,'countries').find(g=>g.name==='FR');assert.equal(fr.count,2);assert.equal(fr.rated,1);assert.equal(fr.average,8);assert.equal(fr.loved,1);
 const drama=C.groups(rows,'genres').find(g=>g.name==='Drama');assert.equal(drama.count,2);assert.equal(drama.average,7);
 const rank=C.rank(rows,'actors',{minimum:2});assert.equal(rank.length,1);assert.equal(rank[0].name,'Actor A');assert.equal(rank[0].average,7);
 assert.equal(C.mean(rows),23/3);assert.equal(C.rank(rows,'directors',{minimum:3}).length,0);
});
test('Statistics: combined release, country, genre, person, rating and watched-date filters',()=>{
 const rows=C.records(films,progress,metadata);
 const found=C.filter(rows,{from:'1990',to:'2005',country:'FR',genre:'Drama',actor:'Actor A',director:'A',rating:'8',watchedFrom:'2024-01-01',watchedTo:'2024-12-31'});assert.equal(found.length,1);assert.equal(found[0].id,1);
 assert.equal(C.filter(rows,{watchedFrom:'2025-01-01'}).length,1);assert.equal(C.filter(rows,{from:'2021'}).length,0);assert.equal(C.filter(rows,{genre:'Unknown'}).length,1);
 const histogram=C.distribution(rows);assert.equal(histogram.length,20);assert.equal(histogram.reduce((s,b)=>s+b.count,0),3);assert.equal(histogram.find(b=>b.key==='8').count,1);
});
test('Statistics: watched timeline has zero periods, unknown-date exclusion, current rating means, and release separation',()=>{
 const rows=C.records(films,progress,metadata),months=C.timeline(rows,{basis:'watched',unit:'month'});assert.equal(months.length,25);assert.equal(months[1].key,'2024-02');assert.equal(months[1].count,0);assert.equal(months[1].average,null);assert.equal(months.at(-1).average,null);
 assert.equal(C.timeline(rows,{basis:'watched',unit:'year'}).reduce((s,g)=>s+g.count,0),3);
 assert.equal(C.timeline(rows,{basis:'release',unit:'decade'}).map(g=>g.key).join(','),'2000,2010,2020');
 const bounded=C.timeline(C.filter(rows,{watchedFrom:'2024-01-01',watchedTo:'2024-04-01'}),{basis:'watched',unit:'month',from:'2024-01-01',to:'2024-04-01'});assert.equal(bounded.length,4);assert.equal(bounded.at(-1).count,0);
});
test('Generated statistics index matches full metadata and remains off the initial script payload',()=>{
 const w={};vm.runInNewContext(read('film-cards.js'),{window:w});const full={};vm.runInNewContext(read('film-details.js'),{window:full});const index=JSON.parse(read(w.CULTURE_FILM_STATISTICS_FILE));assert.equal(index.version,1);assert.equal(Object.keys(index.films).length,Object.keys(full.CULTURE_FILM_DETAILS).length);
 for(const[id,d]of Object.entries(full.CULTURE_FILM_DETAILS)){assert.equal(JSON.stringify(index.films[id]),JSON.stringify({genres:d.genres||[],countries:d.countries||[],cast:d.cast||[]}));}
 assert.equal(w.CULTURE_FILM_DETAILS[1].genres,undefined);assert.ok(w.CULTURE_FILM_DETAILS[1].cast.length<=3);
});

const markup=read('index.html'),sources=[...markup.matchAll(/<script src="([^"]+)"/g)].filter(([,f])=>!/^https?:/.test(f)).map(([,f])=>read(f));
const inline=[...markup.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];
const tick=()=>new Promise(resolve=>setTimeout(resolve,40));
async function boot({user={id:'owner'},hash='#/films/statistics',gate,failMetadata=false,progressRows=[{film_id:1,watched:true,rating:8,watched_date:'2024-01-03'},{film_id:2,watched:true,rating:6,watched_date:null},{film_id:3,watched:true,rating:null,watched_date:'2024-03-15'}]}={}){
 const w=new Window({url:'https://example.test/'+hash,settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}}),calls=[];
 w.document.write(markup.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;this.dispatchEvent(new w.Event('close'));};
 const state={user,failMetadata};let onAuth;
 const client={from(table){const query={select(){return query;},eq(){return query;},order(){return query;},in(){return query;},range(){return query;},then(resolve,reject){return Promise.resolve({data:table==='film_progress'?progressRows:[],error:null}).then(resolve,reject);}};return query;},auth:{onAuthStateChange(callback){onAuth=callback;},getSession:async()=>({data:{session:state.user?{user:state.user}:null}})}};
 w.supabase={createClient:()=>client};w.fetch=async path=>{calls.push(String(path));if(String(path).includes('/statistics-')){if(gate)await gate;if(state.failMetadata)throw Error('offline');}return {ok:true,json:async()=>JSON.parse(read(path))};};
 for(const source of sources)w.eval(source);w.eval(inline);await tick();
 return {w,$:id=>w.document.getElementById(id),calls,state,async session(user){state.user=user;onAuth('SIGNED_IN',user?{user}:null);await tick();},close:()=>w.happyDOM.close()};
}
test('Dashboard: signed-in route, shared filters, taste exposure, timeline, drill-down and film overlay preserve state',async()=>{
 const a=await boot();try{const{w,$}=a;assert.equal($('film-statistics-view').hidden,false);assert.equal($('fs-content').hidden,false);assert.match($('fs-selection').textContent,/3 of 3 watched films · 2 rated/);assert.match($('fs-metrics').textContent,/7.00/);
 assert.equal(w.document.querySelector('[data-view="statistics"]').hidden,false);
 w.document.querySelector('[data-fs-view="taste"]').click();assert.match($('fs-taste-table').textContent,/100.0%/);
 w.document.querySelector('[data-fs-view="history"]').click();assert.match($('fs-history-coverage').textContent,/2 of 3/);assert.match($('fs-history-coverage').textContent,/1 undated/);
 w.document.querySelector('[data-fs-view="overview"]').click();w.document.querySelector('[data-fs-chart="distribution"][data-fs-key="8"]').click();assert.equal($('fs-films').hidden,false);assert.match($('fs-scope').textContent,/Personal rating: 8 · 1 films/);
 const link=$('fs-film-table').querySelector('a');link.click();assert.match(w.location.hash,/from=statistics/);assert.equal($('film-detail-dialog').open,true);
 $('film-detail-dialog').querySelector('.film-detail-close').click();await tick();assert.equal(w.location.hash,'#/films/statistics');assert.match($('fs-scope').textContent,/Personal rating: 8/);
 $('fs-clear-drill').click();$('fs-more').click();$('fs-rating').value='8';$('fs-rating').dispatchEvent(new w.Event('change',{bubbles:true}));assert.match($('fs-selection').textContent,/1 of 3/);assert.doesNotMatch(w.location.hash,/rating/);
 }finally{await a.close();}
});
test('Dashboard: guests cannot reach statistics and do not fetch the index',async()=>{
 for(const user of [null,{id:'anon',is_anonymous:true}]){const a=await boot({user});try{assert.equal(a.w.location.hash,'#/films/catalogue');assert.equal(a.$('film-statistics-view').hidden,true);assert.equal(a.calls.some(p=>p.includes('/statistics-')),false);assert.equal(a.w.document.querySelector('[data-view="statistics"]').hidden,true);}finally{await a.close();}}
});
test('Dashboard: logout clears rendered data and filters even when public metadata arrives late',async()=>{
 let release;const gate=new Promise(r=>{release=r;});const a=await boot({gate});try{assert.equal(a.$('fs-content').hidden,true);await a.session(null);release();await tick();assert.equal(a.$('fs-film-table').textContent,'');assert.equal(a.$('fs-metrics').textContent,'');assert.equal(a.$('fs-content').hidden,true);assert.equal(a.w.location.hash,'#/films/catalogue');}finally{release();await a.close();}
 const b=await boot();try{b.$('fs-more').click();b.$('fs-rating').value='8';b.$('fs-rating').dispatchEvent(new b.w.Event('change',{bubbles:true}));await b.session({id:'other'});assert.equal(b.$('fs-rating').value,'');assert.doesNotMatch(b.w.location.hash,/rating/);}finally{await b.close();}
});
test('Dashboard: metadata failures offer retry without displaying incomplete statistics',async()=>{
 const a=await boot({failMetadata:true});try{assert.equal(a.$('fs-content').hidden,true);assert.match(a.$('fs-status').textContent,/could not load/);a.state.failMetadata=false;a.w.document.querySelector('[data-fs-retry]').click();await tick();assert.equal(a.$('fs-content').hidden,false);assert.match(a.$('fs-selection').textContent,/3 of 3/);}finally{await a.close();}
});

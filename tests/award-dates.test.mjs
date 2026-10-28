import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';import{Window}from'happy-dom';
const root=new URL('../',import.meta.url),html=fs.readFileSync(new URL('index.html',root),'utf8');
const read=(file,key)=>{const c={window:{}};vm.runInNewContext(fs.readFileSync(new URL(file,root),'utf8'),c);return JSON.parse(JSON.stringify(c.window[key]));};
const tick=()=>new Promise(r=>setTimeout(r,30));
async function boot(hash='#/books/awards'){
 const w=new Window({url:'https://example.test/culture-atlas/'+hash,settings:{disableCSSFileLoading:true,disableJavaScriptFileLoading:true,enableJavaScriptEvaluation:true,suppressInsecureJavaScriptEnvironmentWarning:true}});w.document.write(html.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,''));w.HTMLElement.prototype.scrollIntoView=()=>{};w.HTMLDialogElement.prototype.showModal=function(){this.open=true;};w.HTMLDialogElement.prototype.close=function(){this.open=false;};
 for(const[,file]of html.matchAll(/<script src="([^"]+)"/g))if(!/^https?:/.test(file))w.eval(fs.readFileSync(new URL(file,root),'utf8'));
 w.fetch=async()=>({ok:false});w.eval([...html.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1]);await tick();return{w,$:id=>w.document.getElementById(id),close:()=>w.happyDOM.close()};
}
const dates=JSON.parse(fs.readFileSync(new URL('imports/award-event-dates.json',root),'utf8'));
test('Every loaded award edition has sourced dates or an explicit non-edition, with no invented calendar years',()=>{
 const films=[...read('awards-2025.js','CULTURE_AWARDS'),...read('awards-2026.js','CULTURE_AWARDS_2026')];
 const books=[...read('book-awards-2026.js','CULTURE_BOOK_AWARDS_2026').events,...read('book-awards-history.js','CULTURE_BOOK_AWARDS_HISTORY').events];
 const tv=read('tv-awards-2025.js','CULTURE_TV_AWARDS');const expected=[...films.map(e=>['films',e]),...books.map(e=>['books',e]),...tv.map(e=>['tv',e])];assert.equal(expected.length,135);assert.equal(dates.editions.length,135);
 const w={};vm.runInNewContext(fs.readFileSync(new URL('award-dates-data.js',root),'utf8'),{window:w});vm.runInNewContext(fs.readFileSync(new URL('award-dates.js',root),'utf8'),{window:w});
 for(const [section,e]of expected){const m=w.CultureAwardDates.find(section,e.event,e.year);assert.ok(m,section+'/'+e.event+'/'+e.year);const html=w.CultureAwardDates.render(section,e);if(e.status==='not-held'){assert.equal(m.dates.length,0);assert.match(html,/Not held/);assert.doesNotMatch(html,/<time/);}else{assert.ok(m.dates.length);assert.match(html,/<time datetime="\d{4}-\d{2}-\d{2}">/);for(const d of m.dates){assert.match(d.source,/^https:\/\//);assert.equal(new Date(d.start+'T00:00:00Z').toISOString().slice(0,10),d.start);assert.ok(!d.end||d.end>=d.start);}}}
 const nobel=w.CultureAwardDates.find('books','Nobel Literature',2018);assert.equal(nobel.dates[0].start,'2019-10-10');assert.equal(nobel.dates[1].start,'2019-12-10');
 assert.equal(w.CultureAwardDates.find('films','Berlinale',2021).dates.length,2);assert.equal(w.CultureAwardDates.find('tv','Golden Globes',2025).dates[0].start,w.CultureAwardDates.find('films','Golden Globes',2025).dates[0].start);
 assert.equal(w.CultureAwardDates.find('books','Booker Prize',2026).dates[0].scheduled,true);
});
test('Date ranges, future schedules and legacy dates render safely and without timezone shifts',()=>{
 const w={};vm.runInNewContext(fs.readFileSync(new URL('award-dates-data.js',root),'utf8'),{window:w});vm.runInNewContext(fs.readFileSync(new URL('award-dates.js',root),'utf8'),{window:w});const d=w.CultureAwardDates;
 assert.match(d.range('2022-08-31','2022-09-10'),/31 August.*10 September 2022/);assert.match(d.range('2025-05-13','2025-05-24'),/>13<.*–.*>24 May 2025</);assert.match(d.range('2024-12-31','2025-01-01'),/2024.*2025/);assert.match(d.render('books',{event:'Booker Prize',year:2026}),/Scheduled Ceremony/);
 assert.equal(d.render('films',{event:'Unknown',year:2030}), '');assert.match(d.render('films',{event:'Unknown',year:2030,dates:'<unsafe>'}),/&lt;unsafe&gt;/);
});
test('Dates are visible across media on deep links and refresh, while unavailable editions clear the previous date',async()=>{
 const a=await boot('#/films/awards?event=Venice&year=2022');try{const{w,$}=a;assert.match($('award-event-dates').textContent,/31 August.*10 September 2022/);assert.doesNotMatch($('awards-event-details').textContent,/31 August/);
 const examples=[['films','Berlinale',2021,/1–5 March 2021.*9–20 June 2021/],['books','Booker Prize',2026,/Scheduled Ceremony: 9 November 2026/],['books','Pulitzer Prize',2021,/Winner announcement: 11 June 2021/],['books','Nobel Literature',2018,/10 October 2019.*10 December 2019/],['books','International Booker',2011,/18 May 2011.*28 June 2011/],['books','International Booker',2012,/Not held/],['tv','Emmys',2025,/Ceremony: 14 September 2025/],['tv','BAFTA Television',2025,/11 May 2025/]];
 for(const[section,event,year,expected]of examples){w.CultureRouter.navigate({section,view:'awards',params:{event,year:String(year)}});const id=(section==='films'?'':section==='books'?'book-':'tv-')+'award-event-dates';assert.equal($(id).hidden,false);assert.match($(id).textContent,expected);}
 const b=await boot(w.location.hash);try{assert.match(b.$('tv-award-event-dates').textContent,/11 May 2025/);}finally{await b.close();}
 w.CultureRouter.navigate({section:'tv',view:'awards',params:{event:'Emmys',year:'2020'}});assert.equal($('tv-award-event-dates').hidden,true);assert.equal($('tv-award-event-dates').textContent,'');
 }finally{await a.close();}
});

// Real-browser smoke check and signed-out screenshots for the review branch.
import {chromium} from 'playwright';
import fs from 'node:fs/promises';import http from 'node:http';import path from 'node:path';import assert from 'node:assert/strict';
const root=process.cwd(),mime={'.html':'text/html','.js':'application/javascript','.css':'text/css','.svg':'image/svg+xml','.jpg':'image/jpeg','.png':'image/png'};
const server=http.createServer(async(req,res)=>{try{const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname),file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));if(!file.startsWith(root+path.sep))throw Error();const data=await fs.readFile(file);res.writeHead(200,{'Content-Type':mime[path.extname(file)]||'application/octet-stream'});res.end(data);}catch{res.writeHead(404);res.end();}});
await new Promise(resolve=>server.listen(8765,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true});const errors=[];
try{
 const context=await browser.newContext({viewport:{width:1440,height:1200},deviceScaleFactor:1});
 // All progress in this fresh preview context stays local; the production database is never contacted.
 await context.route('**/supabase-js@2/**',route=>route.fulfill({contentType:'application/javascript',body:'window.supabase=undefined;'}));
 await context.route('**/*.supabase.co/**',route=>route.abort());
 const page=await context.newPage();page.on('pageerror',e=>errors.push(e.message));
 await fs.mkdir('docs/previews',{recursive:true});
 for(const name of ['Oscars','BAFTA','Golden Globes','Cannes','Venice','Berlinale'])for(let year=2001;year<=2005;year++){
  await page.goto('http://127.0.0.1:8765/#/films/awards?event='+encodeURIComponent(name)+'&year='+year);
  await page.waitForSelector('#award-edition-title');assert.equal(await page.locator('#award-edition-title').textContent(),name+' '+year);
  const date=await page.locator('#award-event-dates').textContent();assert.ok(date.trim(),name+' '+year+' missing date');
  assert.ok(await page.locator('#awards-grid article').count()>0,name+' '+year+' empty');assert.ok(await page.locator('#award-event-dates time').count()>0);
  const count=await page.locator('#awards-grid article').count();await page.locator('#award-filter').evaluate(s=>{s.value='winners';s.dispatchEvent(new Event('change',{bubbles:true}));});assert.ok(await page.locator('#awards-grid article').count()>0);assert.ok(await page.locator('#awards-grid article').count()<=count);
  await page.locator('#award-filter').evaluate(s=>{s.value='all';s.dispatchEvent(new Event('change',{bubbles:true}));});
 }
 await page.goto('http://127.0.0.1:8765/#/films/awards?event=Oscars&year=2001');await page.waitForSelector('#awards-grid article');
 await page.waitForTimeout(2500);await page.screenshot({path:'docs/previews/film-awards-2001-desktop.png'});
 await page.locator('#award-year-nav [rel="next"]').click();await page.waitForURL(/year=2002/);await page.reload();assert.equal(await page.locator('#award-edition-title').textContent(),'Oscars 2002');
 await page.goto('http://127.0.0.1:8765/#/films/awards?event=Berlinale&year=2005');await page.waitForSelector('#awards-grid article');assert.equal(await page.locator('#awards-grid .award-category').count(),1);
 await page.setViewportSize({width:390,height:1000});await page.waitForTimeout(1000);assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),'Mobile overflow');await page.screenshot({path:'docs/previews/film-awards-2005-mobile.png'});
 assert.deepEqual(errors,[]);console.log('All 30 editions, dates, winners filters, year navigation, refresh and mobile layout passed.');
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

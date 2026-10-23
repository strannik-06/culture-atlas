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
 await page.goto('http://127.0.0.1:8765/#/films/awards?event=Oscars&year=2026');await page.waitForSelector('#award-tabs a');
 assert.equal(await page.locator('#award-tabs a').count(),6);assert.equal(await page.locator('#awards-grid .award-category').count(),11);
 assert.match(await page.locator('#awards-grid .award-category').first().locator('article').first().textContent(),/One Battle [Aa]fter Another/);
 await page.locator('#award-year-nav [rel="prev"]').click();await page.waitForURL(/year=2025/);await page.goBack();await page.waitForURL(/year=2026/);
 await page.locator('#awards-grid h3 a').first().click();await page.waitForFunction(()=>document.getElementById('film-detail-dialog').open);await page.reload();await page.waitForFunction(()=>document.getElementById('film-detail-dialog').open);await page.locator('.film-detail-close').click();await page.waitForFunction(()=>!document.getElementById('film-detail-dialog').open);
 for(const name of ['Cannes','Venice','Berlinale','Oscars','BAFTA','Golden Globes']){
  await page.locator('#award-tabs a').filter({hasText:name}).click();assert.equal(await page.locator('#award-edition-title').textContent(),name+' 2026');assert.ok(await page.locator('#awards-grid .award-category').count()>0);
 }
 await page.locator('#award-tabs a').filter({hasText:'Oscars'}).click();await page.evaluate(()=>window.scrollTo(0,100));await page.waitForTimeout(3000);
 await fs.mkdir('docs/previews',{recursive:true});await page.screenshot({path:'docs/previews/awards-2026-desktop.png'});
 await page.setViewportSize({width:390,height:1000});await page.evaluate(()=>window.scrollTo(0,180));await page.waitForTimeout(500);
 assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),'Mobile layout overflows horizontally');
 await page.screenshot({path:'docs/previews/awards-2026-mobile.png'});assert.deepEqual(errors,[]);console.log('Awards browser navigation, refresh, six editions and mobile layout passed.');
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

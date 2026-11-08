// Real-browser smoke check and signed-out screenshots for the review branch.
import {execFileSync} from 'node:child_process';
import {chromium} from 'playwright';
import fs from 'node:fs/promises';import http from 'node:http';import path from 'node:path';import assert from 'node:assert/strict';
const root=process.cwd(),mime={'.html':'text/html','.js':'application/javascript','.css':'text/css','.svg':'image/svg+xml','.jpg':'image/jpeg','.png':'image/png'};
const server=http.createServer(async(req,res)=>{try{const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname),file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));if(!file.startsWith(root+path.sep))throw Error();const data=await fs.readFile(file);res.writeHead(200,{'Content-Type':mime[path.extname(file)]||'application/octet-stream'});res.end(data);}catch{res.writeHead(404);res.end();}});
await new Promise(resolve=>server.listen(8765,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true});const errors=[];
try{
 const baseline=execFileSync('git',['show','ad86c18a327c7a9c0825bb55eeda530b23eb04a7:index.html'],{encoding:'utf8'});
 for(const mode of ['baseline','deferred']){const context=await browser.newContext();const requested=[];
 await context.route('**/supabase-js@2/**',r=>r.fulfill({contentType:'application/javascript',body:'window.supabase=undefined;'}));
 await context.route('**/*',async r=>{if(r.request().resourceType()==='image')return r.abort();return r.fallback()});
 if(mode==='baseline')await context.route('http://127.0.0.1:8765/',r=>r.fulfill({contentType:'text/html',body:baseline}));
 const page=await context.newPage();page.on('request',r=>requested.push(r.url()));const errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.goto('http://127.0.0.1:8765/#/books/catalogue',{waitUntil:'domcontentloaded'});await page.waitForFunction(()=>window.CultureRouter?.current?.section==='books'&&document.querySelectorAll('#book-catalogue-grid article').length>0);
 const result=await page.evaluate(()=>({readyMs:Math.round(performance.now()),scriptBodyBytes:performance.getEntriesByType('resource').filter(r=>r.initiatorType==='script').reduce((n,r)=>n+r.encodedBodySize,0)}));console.log(JSON.stringify({mode,...result}));
 if(mode==='deferred'){assert.equal(requested.some(u=>u.endsWith('/film-details.js')),false);assert.equal(requested.some(u=>u.includes('/assets/film-details/')),false);
 await page.evaluate(()=>window.CultureRouter.openFilm(229));await page.waitForFunction(()=>window.CultureFilmDetails.isLoaded(229));assert.ok(await page.locator('[data-film-public]').textContent());assert.equal(requested.filter(u=>u.includes('/assets/film-details/')).length,1);
 await page.evaluate(()=>window.CultureRouter.openFilm(230));await page.waitForFunction(()=>document.getElementById('film-detail-content').textContent.includes('Culture Atlas')||window.CultureFilmDetails.isLoaded(230));assert.equal(requested.filter(u=>u.includes('/assets/film-details/')).length,1);
 await page.goto('http://127.0.0.1:8765/#/films/1',{waitUntil:'domcontentloaded'});await page.waitForFunction(()=>window.CultureFilmDetails.isLoaded(1));assert.ok(await page.locator('#film-detail-dialog').isVisible());
 }
 assert.deepEqual(errors,[]);await context.close();}
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

// Real-browser smoke check and signed-out screenshots for the review branch.
import {chromium} from 'playwright';
import fs from 'node:fs/promises';import http from 'node:http';import path from 'node:path';import assert from 'node:assert/strict';
const root=process.cwd(),mime={'.html':'text/html','.js':'application/javascript','.css':'text/css','.svg':'image/svg+xml','.jpg':'image/jpeg','.png':'image/png'};
const server=http.createServer(async(req,res)=>{try{const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname),file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));if(!file.startsWith(root+path.sep))throw Error();const data=await fs.readFile(file);res.writeHead(200,{'Content-Type':mime[path.extname(file)]||'application/octet-stream'});res.end(data);}catch{res.writeHead(404);res.end();}});
await new Promise(resolve=>server.listen(8765,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true});const errors=[];
try{
 const context=await browser.newContext({viewport:{width:1440,height:1100}});
 await context.route('**/supabase-js@2/**',r=>r.fulfill({contentType:'application/javascript',body:'window.supabase=undefined;'}));
 await context.route('**/*.supabase.co/**',r=>r.abort());
 const page=await context.newPage();page.on('pageerror',e=>errors.push(e.message));
 await fs.mkdir('docs/previews',{recursive:true});
 for(const [section,selector] of [['films','[data-open-stars]'],['tv','[data-tv-edit]'],['books','[data-book-rate]']]){
  await page.goto('http://127.0.0.1:8765/#/'+section+'/awards');
  const card=page.locator('article:visible').filter({has:page.locator(selector)}).first();await card.waitFor();
  await page.waitForFunction(s=>document.querySelector(s)?.textContent.includes('Sign in to rate'),selector);
  await card.locator(selector).click();await page.waitForFunction(()=>!document.getElementById('account').hidden);
  await page.locator('#account-toggle').click();
  await card.locator('[data-list-toggle]').click();await page.waitForFunction(()=>!document.getElementById('account').hidden);
  await page.setViewportSize({width:390,height:1000});await page.waitForTimeout(100);
  assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),section+' mobile overflow');
  await page.screenshot({path:'docs/previews/private-lists-'+section+'-mobile.png'});
  await page.setViewportSize({width:1440,height:1100});
 }
 // The authenticated module's integration is covered by the DOM and SQL tests; Chromium verifies the public entry points and layout.
 assert.deepEqual(errors,[]);console.log('Guest rating and bookmark prompts passed for films, TV and books; all mobile layouts fit.');
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

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
 // Use a separate fake authenticated client; production requests remain blocked.
 await context.unroute('**/supabase-js@2/**');
 await context.route('**/supabase-js@2/**',r=>r.fulfill({contentType:'application/javascript',body:`
 window.__previewUser={id:'preview-owner',email:'preview@example.test'};window.__previewRows=[];
 window.supabase={createClient:()=>({auth:{getSession:async()=>({data:{session:window.__previewUser?{user:window.__previewUser}:null}}),onAuthStateChange(cb){window.__previewAuth=cb;}},from(table){let action='read',row,filters={};const q={select(){return q},eq(k,v){filters[k]=v;return q},in(){return q},order(){return q},range(){return q},upsert(v){action='save';row=v;return q},delete(){action='remove';return q},then(resolve,reject){let data=[];if(table==='personal_lists'){if(action==='save')window.__previewRows.push(row);if(action==='remove')window.__previewRows=window.__previewRows.filter(r=>!Object.entries(filters).every(([k,v])=>r[k]===v));if(action==='read')data=window.__previewRows;}return Promise.resolve({data,error:null}).then(resolve,reject)}};return q;}})};
 `}));
 await page.reload();await page.waitForFunction(()=>document.getElementById('account-toggle').textContent.includes('My account'));
 for(const section of ['films','tv','books']){
  await page.evaluate(section=>window.CultureRouter.navigate({section,view:'awards',params:{}}),section);
  const button=page.locator('article:visible [data-list-toggle]').first();await button.waitFor();await page.waitForFunction(()=>[...document.querySelectorAll('[data-list-toggle]')].some(b=>!b.disabled));
  await button.click();await page.waitForFunction(()=>!document.querySelector('article [data-list-toggle]:disabled'));
  await page.waitForTimeout(100);assert.equal(await button.getAttribute('aria-pressed'),'true');
 }
 assert.equal(await page.evaluate(()=>window.__previewRows.length),3);
 await page.locator('#personal-list-open').click();assert.equal(await page.locator('#personal-list-items .saved-list-row').count(),3);
 await page.locator('#personal-list-kind').selectOption('book');assert.equal(await page.locator('#personal-list-items .saved-list-row').count(),1);
 await page.locator('#personal-list-items [data-list-remove]').click();await page.waitForFunction(()=>window.__previewRows.length===2);
 await page.locator('#personal-list-kind').selectOption('all');await page.screenshot({path:'docs/previews/private-lists-saved-desktop.png'});
 await page.evaluate(()=>{window.__previewUser=null;window.__previewAuth('SIGNED_OUT',null);});await page.waitForFunction(()=>!document.getElementById('personal-lists').open);
 assert.equal(await page.locator('#personal-list-items .saved-list-row').count(),0);
 assert.deepEqual(errors,[]);console.log('Guest prompts, all mobile layouts, authenticated saves for all three media, filtering, removal and sign-out passed.');
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

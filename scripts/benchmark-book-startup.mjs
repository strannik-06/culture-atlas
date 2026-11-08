// Real-browser smoke check and signed-out screenshots for the review branch.
import {execFileSync} from 'node:child_process';
import {chromium} from 'playwright';
import fs from 'node:fs/promises';import http from 'node:http';import path from 'node:path';import assert from 'node:assert/strict';
const root=process.cwd(),mime={'.html':'text/html','.js':'application/javascript','.css':'text/css','.svg':'image/svg+xml','.jpg':'image/jpeg','.png':'image/png'};
const server=http.createServer(async(req,res)=>{try{const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname),file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));if(!file.startsWith(root+path.sep))throw Error();const data=await fs.readFile(file);res.writeHead(200,{'Content-Type':mime[path.extname(file)]||'application/octet-stream'});res.end(data);}catch{res.writeHead(404);res.end();}});
await new Promise(resolve=>server.listen(8765,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true});const errors=[];
try{
 const baseline=execFileSync('git',['show','42123b4c075d5ca75df63cf9ed926420f410aef9:books.js'],{encoding:'utf8'});
 for(const mode of ['baseline','deferred']){
  const context=await browser.newContext();
  await context.route('**/supabase-js@2/**',r=>r.fulfill({contentType:'application/javascript',body:`window.__historyRequests=0;window.supabase={createClient:()=>({auth:{onAuthStateChange(){},getSession:async()=>({data:{session:{user:{id:'benchmark-owner',email:'benchmark@example.test'}}}})},from(table){const q={select(){return q},eq(){return q},in(){return q},order(){return q},range(){return q},then(resolve,reject){if(table==='books'){window.__catalogueStart=performance.now();return Promise.resolve({data:[{id:999999,title:'Load test book',authors:['Test author']}]}).then(resolve,reject);}if(table==='book_readings'){window.__historyRequests++;return new Promise(r=>setTimeout(()=>r({data:[]}),600)).then(resolve,reject);}return Promise.resolve({data:[]}).then(resolve,reject)}};return q}})};`}));
  await context.route('**/*.supabase.co/**',r=>r.abort());await context.route('**/*',async r=>{if(r.request().resourceType()==='image')return r.abort();return r.fallback()});
  if(mode==='baseline')await context.route('**/books.js',r=>r.fulfill({contentType:'application/javascript',body:baseline}));
  const page=await context.newPage();await page.goto('http://127.0.0.1:8765/#/books/catalogue',{waitUntil:'domcontentloaded'});
  await page.waitForFunction(()=>window.__catalogueStart&&document.getElementById('book-sync-status').textContent===''&&document.getElementById('book-catalogue-count').textContent.includes('in the catalogue'));
  const result=await page.evaluate(()=>({mode:null,coldReadyMs:Math.round(performance.now()),afterCatalogueQueryMs:Math.round(performance.now()-window.__catalogueStart),historyRequests:window.__historyRequests,scriptBodyBytes:performance.getEntriesByType('resource').filter(r=>r.initiatorType==='script').reduce((n,r)=>n+r.encodedBodySize,0)}));result.mode=mode;console.log(JSON.stringify(result));
  if(mode==='deferred')assert.equal(result.historyRequests,0);else assert.ok(result.historyRequests>0);
  await context.close();
 }
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}

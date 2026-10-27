import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import vm from 'node:vm';
const read=(p,k)=>{let c={window:{}};vm.runInNewContext(fs.readFileSync(new URL('../'+p,import.meta.url),'utf8'),c);return JSON.parse(JSON.stringify(c.window[k]));};
test('Five Oscar ceremony years preserve every official nomination and winner',()=>{
 const source=JSON.parse(fs.readFileSync(new URL('../imports/oscars-2021-2025-source.json',import.meta.url),'utf8'));
 const events=read('awards-2025.js','CULTURE_AWARDS'),catalog=read('film-catalog.js','CULTURE_CATALOG');
 const audit=JSON.parse(fs.readFileSync(new URL('../imports/oscars-2021-2025-audit.json',import.meta.url),'utf8'));assert.deepEqual(audit.unresolved,[]);
 const identities=new Map(audit.verified.map(r=>[r.title,r.id]));assert.equal(source.events.length,5);
 for(const expected of source.events){let matches=events.filter(e=>e.event==='Oscars'&&e.year===expected.year);assert.equal(matches.length,1);let actual=matches[0];assert.equal(actual.categories.length,11);
 for(let c of expected.categories){let found=actual.categories.find(x=>x.name===c.name);assert.ok(found);assert.deepEqual(found.entries.map(r=>({film_id:r.film_id,person:r.person,winner:r.winner})),c.entries.map(r=>({film_id:identities.get(r.title),person:r.person,winner:r.winner})));assert.equal(found.winners.length,1);for(let id of found.nominees)assert.ok(catalog.some(f=>f.id===id));}
 }
});

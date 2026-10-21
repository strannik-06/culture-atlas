import test from 'node:test';import assert from 'node:assert/strict';
import {mergeMetadata,complete,fields,present} from '../scripts/complete-film-metadata.mjs';
const film={id:1,title:'Canonical title',tmdb_id:10,imdb_id:'tt1234567'};
const movie={id:10,title:'Provider title',imdb_id:'tt1234567',poster_path:'/poster.jpg',overview:'Synopsis',runtime:100,release_date:'2020-01-01',genres:[{name:'Drama'}],production_countries:[{iso_3166_1:'NL'}],credits:{cast:[{name:'Actor'}],crew:[{job:'Director',name:'Director'}]}};
test('fills missing fields without replacing curated metadata, links or canonical identity',()=>{
 const current={overview:'Reviewed synopsis',poster:'https://image.tmdb.org/t/p/w500/curated.jpg',imdb:{score:'7/10'},custom:'preserve'};
 const copy=structuredClone(current),result=mergeMetadata(film,current,movie);
 assert.equal(result.poster,current.poster);assert.equal(result.overview,current.overview);assert.equal(result.imdb.score,'7/10');assert.equal(result.custom,'preserve');assert.deepEqual(result.cast,['Actor']);assert.equal(result.runtime,100);assert.deepEqual(current,copy);assert.equal(film.title,'Canonical title');
 assert.throws(()=>mergeMetadata(film,{}, {...movie,imdb_id:'tt7654321'}),/identity differs/);assert.throws(()=>mergeMetadata(film,{}, {...movie,id:11}),/identity differs/);
});
test('completion is idempotent, isolates identity errors and reports genuinely unavailable fields',async()=>{
 const films=[film,{...film,id:2,tmdb_id:11},{...film,id:3,tmdb_id:12}];
 const api=async endpoint=>endpoint.endsWith('/images')?{posters:[]}:endpoint==='movie/10'?movie:endpoint==='movie/11'?{...movie,id:11,imdb_id:'tt7654321'}:{id:12,imdb_id:film.imdb_id};
 const first=await complete({films,details:{},api});assert.equal(first.report.updated.length,2);assert.equal(first.report.unresolved.length,1);assert.equal(first.details[2],undefined);assert.equal(first.report.unavailable[0].id,3);assert.ok(first.report.unavailable[0].fields.includes('poster'));
 const before=structuredClone(first.details);const second=await complete({films,details:first.details,api});assert.deepEqual(second.details,before);assert.equal(second.report.updated.length,0);
});
test('uses verified alternative poster only when a poster is missing',async()=>{
 const result=await complete({films:[film],details:{},api:async endpoint=>endpoint.endsWith('/images')?{posters:[{file_path:'/alternate.jpg',iso_639_1:'en'}]}:{...movie,poster_path:null}});
 assert.equal(result.details[1].poster,'https://image.tmdb.org/t/p/w500/alternate.jpg');assert.equal(result.report.after.poster,1);
});
test('checked-in metadata stays attached to canonical identities and its completion audit is accurate',async()=>{
 const fs=await import('node:fs');const vm=await import('node:vm');const c={window:{}};vm.createContext(c);
 for(const file of ['film-catalog.js','film-details.js'])vm.runInContext(fs.readFileSync(new URL('../'+file,import.meta.url),'utf8'),c);
 const films=c.window.CULTURE_CATALOG,details=c.window.CULTURE_FILM_DETAILS,known=new Map(films.map(f=>[String(f.id),f]));
 for(const[id,d]of Object.entries(details)){assert.ok(known.has(id),'Unknown metadata ID '+id);if(d.tmdb_id)assert.equal(d.tmdb_id,known.get(id).tmdb_id);if(d.poster?.startsWith('assets/film-posters/'))assert.ok(fs.existsSync(new URL('../'+d.poster,import.meta.url)));if(d.poster)assert.match(d.poster,/^(https:\/\/image\.tmdb\.org\/t\/p\/|assets\/film-posters\/[1-9][0-9]*\.jpg$)/);}
 const file=new URL('../imports/film-metadata-completion.json',import.meta.url);
 if(fs.existsSync(file)){const report=JSON.parse(fs.readFileSync(file));assert.equal(report.total,films.length);for(const field of fields)assert.equal(report.after[field],films.filter(f=>present(details[f.id]?.[field])).length);}
});
test('manual source supplements are identity-checked, additive and keep original provenance',async()=>{
 const override={id:1,tmdb_id:10,fields:{poster:'assets/film-posters/1.jpg',runtime:90},source_urls:['https://publisher.test/film'],note:'Producer source'};
 const result=await complete({films:[film],details:{1:{overview:'Curated text'}},overrides:[override],api:async()=>movie});
 assert.equal(result.details[1].poster,'assets/film-posters/1.jpg');assert.equal(result.details[1].runtime,90);assert.equal(result.details[1].overview,'Curated text');assert.equal(result.report.manual_sources.length,1);
 await assert.rejects(complete({films:[film],details:{},overrides:[{...override,tmdb_id:11}],api:async()=>movie}),/identity differs/);
});
test('missing English synopsis uses the verified original-language record without replacing existing text',async()=>{
 const result=await complete({films:[film],details:{},api:async(endpoint,params)=>params.language==='ru'?{id:10,overview:'Русское описание'}:{...movie,overview:'',original_language:'ru'}});
 assert.equal(result.details[1].overview,'Русское описание');assert.equal(result.details[1].overview_language,'ru');
});

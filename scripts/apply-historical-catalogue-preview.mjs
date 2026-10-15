#!/usr/bin/env node
// Catalogue-only additions from existing TMDB identity preview; no personal data or Supabase access.
import fs from 'node:fs';
const file=process.argv[2];
if(!file)throw Error('Usage: node scripts/apply-historical-catalogue-preview.mjs preview.json');
const preview=JSON.parse(fs.readFileSync(file,'utf8'));
if(preview.summary.input!==714||preview.additions.length!==710||preview.held.length!==4)throw Error('Unexpected preview counts; manual review required');
const prefix='window.CULTURE_CATALOG = ';
const raw=fs.readFileSync('film-catalog.js','utf8');
if(!raw.startsWith(prefix))throw Error('Unexpected catalogue format');
const catalogue=JSON.parse(raw.slice(prefix.length).trim().replace(/;$/,''));
const tmdb=new Set(catalogue.map(f=>Number(f.tmdb_id)));
const imdb=new Set(catalogue.map(f=>f.imdb_id).filter(Boolean));
const ids=new Set(catalogue.map(f=>f.id));
let next=Math.max(...ids)+1;
const additions=[];
for(const film of preview.additions){
 if(!Number.isSafeInteger(film.tmdb_id)||tmdb.has(film.tmdb_id)||!/^tt\d{6,}$/.test(film.imdb_id)||imdb.has(film.imdb_id)||!film.title||!film.director||!Number.isInteger(film.year))throw Error('Catalogue identity collision or invalid metadata: '+JSON.stringify(film));
 tmdb.add(film.tmdb_id);imdb.add(film.imdb_id);
 additions.push({id:next++,...film});
}
const merged=[...catalogue,...additions];
fs.writeFileSync('film-catalog.js',prefix+JSON.stringify(merged,null,2)+';\n');
fs.mkdirSync('import-previews',{recursive:true});
fs.writeFileSync('import-previews/historical-714-catalogue-review.json',JSON.stringify({summary:{previous:catalogue.length,added:additions.length,total:merged.length,held:preview.held.length},held:preview.held,warning:'Catalogue-only. No Supabase writes. Personal ratings and notes not included.'},null,2)+'\n');
console.log(JSON.stringify({previous:catalogue.length,added:additions.length,total:merged.length,held:preview.held.length}));

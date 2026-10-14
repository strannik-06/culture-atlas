#!/usr/bin/env node
// Convert the private, deduplicated Movies export to the matching script's schema.
// Never commit the input or output; both contain personal ratings.
import fs from 'node:fs';
const [input,output]=process.argv.slice(2);
if(!input||!output)throw Error('Usage: node scripts/convert-ratings-export.mjs cleaned.csv prepared.csv');
function csvParse(text){
 let rows=[],row=[],field='',quote=false;
 for(let i=0;i<text.length;i++){const c=text[i];
  if(quote){if(c==='"'&&text[i+1]==='"'){field+='"';i++}else if(c==='"')quote=false;else field+=c}
  else if(c==='"')quote=true;else if(c===','){row.push(field);field=''}
  else if(c==='\n'){row.push(field);rows.push(row);row=[];field=''}
  else if(c!=='\r')field+=c;
 }
 if(quote)throw Error('Unterminated CSV field');
 if(field||row.length){row.push(field);rows.push(row)}
 const header=rows.shift().map((h,i)=>i===0?h.replace(/^\uFEFF/,''):h);
 return rows.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(header.map((h,i)=>[h,r[i]||''])));
}
function csvCell(v){const s=String(v??'');return /[",\n\r]/.test(s)?'"'+s.replace(/"/g,'""')+'"':s}
const rows=csvParse(fs.readFileSync(input,'utf8'));
const required=['source_rows','directors','source_title','source_year','rating'];
for(const key of required)if(rows.some(r=>!(key in r)))throw Error('Missing column: '+key);
const columns=['source_row','director','source_title','original_title_hint','source_year','rating','notes'];
const converted=rows.map(r=>({
 source_row:r.source_rows, director:r.directors, source_title:r.source_title,
 original_title_hint:r.original_title_hint||'',source_year:r.source_year,
 rating:r.rating,notes:r.notes||''
}));
fs.writeFileSync(output,[columns.join(','),...converted.map(r=>columns.map(c=>csvCell(r[c])).join(','))].join('\n')+'\n');
console.log('Converted '+converted.length+' unique entries. Original source row references retained.');

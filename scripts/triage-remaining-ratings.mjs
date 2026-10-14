#!/usr/bin/env node
// Read-only triage: do not interpret missing director verification as positive identity proof.
import fs from 'node:fs';
const file=process.argv[2];if(!file)throw Error('Usage: node scripts/triage-remaining-ratings.mjs remaining-ratings-review.csv');
function csv(s){let out=[],r=[],f='',q=false;for(let i=0;i<s.length;i++){const c=s[i];if(q){if(c==='"'&&s[i+1]==='"'){f+='"';i++}else if(c==='"')q=false;else f+=c}else if(c==='"')q=true;else if(c===','){r.push(f);f=''}else if(c==='\n'){r.push(f);out.push(r);r=[];f=''}else if(c!=='\r')f+=c}if(f||r.length){r.push(f);out.push(r)}const h=out.shift().map((x,i)=>i===0?x.replace(/^\uFEFF/,''):x);return out.filter(x=>x.some(Boolean)).map(x=>Object.fromEntries(h.map((k,i)=>[k,x[i]??''])));}
const rows=csv(fs.readFileSync(file,'utf8'));
const buckets={existing_catalogue:[],director_verification_needed:[],search_needed:[],tv_or_series:[],current_year_review:[],other_identity_review:[]};
for(const r of rows){
 const year=Number(r.candidate_year||r.source_year);
 if(r.match_status==='catalog_identity_review'||r.catalog_film_id){buckets.existing_catalogue.push(r);continue}
 if(/\b(tv series|mini.series|сериал|мини-сериал|т\/с)\b/i.test(r.source_title)||r.candidate_media_type==='tv'){buckets.tv_or_series.push(r);continue}
 // Release year alone is never grounds to hold a genuine watched-film rating.
 if(r.match_status==='unmatched'||!r.candidate_tmdb_id){buckets.search_needed.push(r);continue}
 if(r.review_reasons.includes('Director not verified')&&Number(r.candidate_title_score)>=.65&&Math.abs(Number(r.source_year)-Number(r.candidate_year))<=1&&r.candidate_media_type==='movie'){buckets.director_verification_needed.push(r);continue}
 buckets.other_identity_review.push(r);
}
const columns=['source_row','source_title','original_title_hint','source_director','source_year','rating','notes','match_status','review_reasons','candidate_tmdb_id','candidate_media_type','candidate_title','candidate_year','candidate_directors','candidate_title_score','candidate_director_score','catalog_film_id','catalog_title','decision','correct_tmdb_id','review_comment'];
const esc=v=>/[",\n\r]/.test(String(v??''))?'"'+String(v??'').replace(/"/g,'""')+'"':String(v??'');
for(const [name,items] of Object.entries(buckets))fs.writeFileSync('remaining-'+name+'.csv','\uFEFF'+[columns.join(','),...items.map(r=>columns.map(k=>esc(r[k])).join(','))].join('\n')+'\n');
const summary={total:rows.length,counts:Object.fromEntries(Object.entries(buckets).map(([k,v])=>[k,v.length])),notes:rows.filter(r=>r.notes).map(r=>({source_row:r.source_row,title:r.source_title,bucket:Object.keys(buckets).find(k=>buckets[k].includes(r))})),warning:'Triage only. No candidate is approved for import; director verification and Supabase conflict checks remain required.'};
fs.writeFileSync('remaining-triage-summary.json',JSON.stringify(summary,null,2)+'\n');console.log(JSON.stringify(summary,null,2));

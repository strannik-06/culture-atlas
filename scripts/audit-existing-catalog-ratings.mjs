#!/usr/bin/env node
// Read-only: compare catalogue-linked historical rows to the authenticated user's film_progress.
// No database writes. Does not export private ratings, user IDs, or credentials.
import fs from 'node:fs';
const input=process.argv[2];if(!input)throw Error('Usage: node scripts/audit-existing-catalog-ratings.mjs remaining-existing_catalogue.csv');
const url=process.env.SUPABASE_URL,anon=process.env.SUPABASE_ANON_KEY,jwt=process.env.SUPABASE_USER_ACCESS_TOKEN;
if(!url||!anon||!jwt)throw Error('SUPABASE_URL, SUPABASE_ANON_KEY and SUPABASE_USER_ACCESS_TOKEN are required');
function csv(s){const out=[];let row=[],f='',q=false;for(let i=0;i<s.length;i++){const c=s[i];if(q){if(c==='"'&&s[i+1]==='"'){f+='"';i++}else if(c==='"')q=false;else f+=c;}else if(c==='"')q=true;else if(c===','){row.push(f);f='';}else if(c==='\n'){row.push(f);out.push(row);row=[];f='';}else if(c!=='\r')f+=c;}if(f||row.length){row.push(f);out.push(row);}const headers=out.shift().map(x=>x.replace(/^\uFEFF/,''));return out.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(headers.map((k,i)=>[k,r[i]??''])));}
const rows=csv(fs.readFileSync(input,'utf8'));
const ids=[...new Set(rows.map(r=>Number(r.catalog_film_id)).filter(x=>Number.isSafeInteger(x)&&x>0))];
const headers={apikey:anon,Authorization:'Bearer '+jwt,Accept:'application/json'};
const me=await fetch(url.replace(/\/$/,'')+'/auth/v1/user',{headers});
if(!me.ok)throw Error('Supabase user authentication failed: '+me.status);
const user=await me.json();if(!user.id)throw Error('Supabase did not return an authenticated user');
const found=new Set();
for(let i=0;i<ids.length;i+=100){const batch=ids.slice(i,i+100);const endpoint=new URL(url.replace(/\/$/,'')+'/rest/v1/film_progress');endpoint.searchParams.set('select','film_id');endpoint.searchParams.set('film_id','in.('+batch.join(',')+')');endpoint.searchParams.set('user_id','eq.'+user.id);
 const res=await fetch(endpoint,{headers});if(!res.ok)throw Error('Supabase read failed: '+res.status);
 for(const record of await res.json())found.add(Number(record.film_id));}
const esc=s=>/[",\r\n]/.test(String(s??''))?'"'+String(s??'').replace(/"/g,'""')+'"':String(s??'');
const report=rows.map(r=>({...r,audit_status:!Number(r.catalog_film_id)?'missing_catalog_id':found.has(Number(r.catalog_film_id))?'progress_exists':'no_progress_record',next_step:!Number(r.catalog_film_id)?'verify_catalog_identity':found.has(Number(r.catalog_film_id))?'review_existing_progress_do_not_overwrite':'identity_review_before_import'}));
const cols=['source_row','source_title','source_year','catalog_film_id','catalog_title','candidate_tmdb_id','audit_status','next_step'];
fs.writeFileSync('existing-catalog-progress-audit.csv','\uFEFF'+cols.join(',')+'\n'+report.map(r=>cols.map(c=>esc(r[c])).join(',')).join('\n')+'\n');
const counts=Object.fromEntries([...new Set(report.map(r=>r.audit_status))].map(k=>[k,report.filter(r=>r.audit_status===k).length]));
fs.writeFileSync('existing-catalog-progress-summary.json',JSON.stringify({total:rows.length,unique_catalog_ids:ids.length,counts,warning:'A progress record may exist without a rating or watched=true. Existing records must not be overwritten. No database changes made.'},null,2)+'\n');
console.log(JSON.stringify({total:rows.length,counts},null,2));

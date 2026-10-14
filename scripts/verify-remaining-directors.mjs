#!/usr/bin/env node
// Read-only director identity verification. Never writes to Supabase or approves an import.
import fs from 'node:fs';
const input=process.argv[2];
if(!input)throw Error('Usage: node scripts/verify-remaining-directors.mjs remaining-director_verification_needed.csv');
function parseCsv(s){const out=[];let row=[],field='',quoted=false;for(let i=0;i<s.length;i++){const c=s[i];if(quoted){if(c==='"'&&s[i+1]==='"'){field+='"';i++}else if(c==='"')quoted=false;else field+=c;}else if(c==='"')quoted=true;else if(c===','){row.push(field);field='';}else if(c==='\n'){row.push(field);out.push(row);row=[];field='';}else if(c!=='\r')field+=c;}if(field||row.length){row.push(field);out.push(row);}const header=out.shift().map(x=>x.replace(/^\uFEFF/,''));return out.filter(r=>r.some(Boolean)).map(r=>Object.fromEntries(header.map((k,i)=>[k,r[i]??''])));}
const translit={а:'a',б:'b',в:'v',г:'g',д:'d',е:'e',ё:'yo',ж:'zh',з:'z',и:'i',й:'y',к:'k',л:'l',м:'m',н:'n',о:'o',п:'p',р:'r',с:'s',т:'t',у:'u',ф:'f',х:'kh',ц:'ts',ч:'ch',ш:'sh',щ:'shch',ъ:'',ы:'y',ь:'',э:'e',ю:'yu',я:'ya'};
function norm(s){return String(s??'').toLowerCase().normalize('NFKD').replace(/[\u0300-\u036f]/g,'').replace(/[а-яё]/g,c=>translit[c]??c).replace(/[^a-z0-9]+/g,' ').trim().replace(/\s+/g,' ');}
function dist(a,b){const p=Array.from({length:b.length+1},(_,i)=>i);for(let i=1;i<=a.length;i++){let prev=p[0];p[0]=i;for(let j=1;j<=b.length;j++){const old=p[j];p[j]=Math.min(p[j]+1,p[j-1]+1,prev+(a[i-1]===b[j-1]?0:1));prev=old;}}return p[b.length];}
// Normalize common cross-language transliteration variants conservatively.
// This is only supporting evidence; film title, year and uniqueness still gate approval.
function phonetic(s){return s.replace(/sch/g,'sh').replace(/tch/g,'ch').replace(/dzh/g,'j').replace(/zh/g,'j').replace(/kh/g,'h').replace(/ph/g,'f').replace(/ck/g,'k').replace(/qu/g,'k').replace(/ou/g,'u').replace(/w/g,'v').replace(/y/g,'i').replace(/j/g,'i').replace(/ks/g,'x').replace(/ii/g,'i').replace(/([a-z])\\1+/g,'$1');}
function tokenSimilarity(a,b){if(a===b)return 1;const d=dist(a,b);const p=phonetic(a),q=phonetic(b);const pd=dist(p,q);return Math.max(1-d/Math.max(a.length,b.length,1),1-pd/Math.max(p.length,q.length,1));}
// Confirmed identities from the owner's manual review; never used as general fuzzy rules.
const confirmed=new Map([
 ['гарленд алекс|alex garland',1],
 ['джонсон райан|rian johnson',1],
 ['уайлд оливия|olivia wilde',1],
 ['кэмпион джейн|jane campion',1],
 ['одиар жак|jacques audiard',1]
]);
function nameScore(a,b){
 const exact=confirmed.get(String(a).toLowerCase().trim()+'|'+String(b).toLowerCase().trim());
 if(exact)return exact;const x=norm(a).split(' ').filter(Boolean),y=norm(b).split(' ').filter(Boolean);if(x.length<2||y.length<2)return 0;const forward=x.map((t,i)=>tokenSimilarity(t,y[i]??'')).reduce((a,b)=>a+b,0)/Math.max(x.length,y.length);const reversed=x.map((t,i)=>tokenSimilarity(t,y[y.length-1-i]??'')).reduce((a,b)=>a+b,0)/Math.max(x.length,y.length);return Math.max(forward,reversed);}
const rows=parseCsv(fs.readFileSync(input,'utf8'));
const approved=[],pending=[];
for(const r of rows){
 const directors=String(r.candidate_directors||'').split(/\s*[,;|]\s*/).filter(Boolean);
 const scores=directors.map(d=>({director:d,score:nameScore(r.source_director,d)})).sort((a,b)=>b.score-a.score);
 const best=scores[0]??{director:'',score:0};
 const title=Number(r.candidate_title_score),yearGap=Math.abs(Number(r.source_year)-Number(r.candidate_year));
 // Strict threshold: transliteration alone is not sufficient when title/year/media identity is weak.
 const unique=directors.length===1 || (scores.length>1 && best.score-(scores[1]?.score??0)>=0.12);
 const safe=r.candidate_media_type==='movie'&&Boolean(r.candidate_tmdb_id)&&title>=0.95&&yearGap<=1&&best.score>=0.82&&unique&&!r.catalog_film_id;
 const output={...r,verified_director:best.director,director_name_similarity:best.score.toFixed(3),verification_decision:safe?'director_name_supported':'manual_review',verification_note:safe?'Director name supported with strong title and year (±1); still requires catalogue conflict check':'Insufficient identity evidence; do not auto-import'};
 (safe?approved:pending).push(output);
}
const columns=[...Object.keys(rows[0]??{}),'verified_director','director_name_similarity','verification_decision','verification_note'];
const esc=x=>/[",\r\n]/.test(String(x??''))?'"'+String(x??'').replace(/"/g,'""')+'"':String(x??'');
function write(path,items){fs.writeFileSync(path,'\uFEFF'+columns.join(',')+'\n'+items.map(r=>columns.map(k=>esc(r[k])).join(',')).join('\n')+'\n');}
write('remaining-directors-supported.csv',approved);write('remaining-directors-manual-review.csv',pending);
const summary={total:rows.length,director_name_supported:approved.length,manual_review:pending.length,warning:'Read-only name evidence, not an import approval. No Supabase changes. Check catalogue conflicts before importing.'};
fs.writeFileSync('remaining-director-verification-summary.json',JSON.stringify(summary,null,2)+'\n');console.log(JSON.stringify(summary,null,2));

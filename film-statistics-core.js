/* Pure statistics over account-owned progress and public film metadata. */
(()=>{'use strict';
const UNKNOWN='Unknown';
const names=value=>[...new Set((Array.isArray(value)?value:typeof value==='string'?[value]:[]).map(v=>typeof v==='string'?v.trim():v?.name).filter(Boolean))];
const validRating=value=>typeof value==='number'&&value>=0.5&&value<=10&&Number.isInteger(value*2);
function validDate(value){if(typeof value!=='string'||!/^\d{4}-\d{2}-\d{2}$/.test(value))return null;const date=new Date(value+'T00:00:00Z');return Number.isFinite(+date)&&date.toISOString().slice(0,10)===value?value:null;}
function records(films,progress,metadata={},getYear=f=>f.year){
 const unique=new Map();
 for(const f of films){if(unique.has(f.id))continue;const p=progress[f.id];if(!p||(!p.watched&&!validRating(p.rating)))continue;const m=metadata[f.id]||{},year=Number(getYear(f));
  unique.set(f.id,{id:f.id,title:f.title,directors:names(m.directors?.length?m.directors:f.director||m.director),actors:names(m.cast),countries:names(m.countries).length?names(m.countries):[UNKNOWN],genres:names(m.genres).length?names(m.genres):[UNKNOWN],year:Number.isInteger(year)&&year>1880?year:null,rating:validRating(p.rating)?p.rating:null,date:validDate(p.watched_date)});
 }return [...unique.values()];
}
function filter(rows,f={}){return rows.filter(r=>(!f.from||(r.year!==null&&r.year>=Number(f.from)))&&(!f.to||(r.year!==null&&r.year<=Number(f.to)))&&(!f.country||r.countries.includes(f.country))&&(!f.genre||r.genres.includes(f.genre))&&(!f.director||r.directors.includes(f.director))&&(!f.actor||r.actors.includes(f.actor))&&(!f.rating||(r.rating!==null&&r.rating>=Number(f.rating)))&&(!f.watchedFrom||(r.date&&r.date>=f.watchedFrom))&&(!f.watchedTo||(r.date&&r.date<=f.watchedTo)));}
const mean=rows=>{const a=rows.filter(r=>r.rating!==null);return a.length?a.reduce((s,r)=>s+r.rating,0)/a.length:null;};
function groups(rows,key){const m=new Map();for(const r of rows)for(const name of new Set(r[key])){if(!m.has(name))m.set(name,[]);m.get(name).push(r);}return [...m].map(([name,films])=>({name,films,count:films.length,rated:films.filter(r=>r.rating!==null).length,average:mean(films),loved:films.filter(r=>r.rating>=8).length}));}
function rank(rows,key,{minimum=3,sort='average'}={}){return groups(rows,key).filter(g=>g.rated>=minimum).sort((a,b)=>(sort==='average'?(b.average??-1)-(a.average??-1):b[sort]-a[sort])||b.rated-a.rated||a.name.localeCompare(b.name));}
function distribution(rows){return Array.from({length:20},(_,i)=>{const rating=(i+1)/2;return {key:String(rating),label:rating.toFixed(1),count:rows.filter(r=>r.rating===rating).length};});}
function timeline(rows,{basis='release',unit='decade',from='',to=''}={}){
 const key=r=>basis==='watched'?r.date?.slice(0,unit==='month'?7:4):r.year===null?null:String(unit==='decade'?Math.floor(r.year/10)*10:r.year);
 const m=new Map();for(const r of rows){const k=key(r);if(!k)continue;if(!m.has(k))m.set(k,[]);m.get(k).push(r);}
 const keys=[...m.keys()].sort();
 // Include empty periods, so viewing gaps remain visible rather than disappearing.
 if(basis==='watched'&&keys.length){let start=(from||keys[0]).slice(0,unit==='month'?7:4),end=(to||keys.at(-1)).slice(0,unit==='month'?7:4);if(unit==='month'){if(start.length===4)start+='-01';if(end.length===4)end+='-12';}for(let k=start,n=0;k<=end&&n<2400;n++){if(!m.has(k))m.set(k,[]);if(unit==='month'){const[y,mo]=k.split('-').map(Number);k=mo===12?String(y+1)+'-01':y+'-'+String(mo+1).padStart(2,'0');}else k=String(Number(k)+1);}}
 return [...m].sort(([a],[b])=>a.localeCompare(b)).map(([k,films])=>({key:k,label:k+(basis==='release'&&unit==='decade'?'s':''),count:films.length,rated:films.filter(r=>r.rating!==null).length,average:mean(films)}));
}
window.CultureFilmStatisticsCore={UNKNOWN,names,validDate,records,filter,mean,groups,rank,distribution,timeline};
})();

// Normalize the final official retrospective, rather than the initial announcement.
// Run after downloading {2001..2005}-{selection,awards}.html to the input directory.
import fs from 'node:fs';
import {Window} from 'happy-dom';
const directory=process.argv[2]||'/tmp/cannes-2001-2005';
const clean=s=>String(s||'').replace(/\s+/g,' ').trim();
const norm=s=>clean(s).normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^\p{L}\p{N}]/gu,'');
const doc=(year,kind)=>{const w=new Window();w.document.write(fs.readFileSync(`${directory}/cannes-${kind}-${year}.html`,'utf8'));return w.document;};
const featureRows=container=>{let short=false;return [...container.querySelectorAll('h3,.list_item')].filter(n=>{if(n.tagName==='H3'){short=/Short films/i.test(clean(n.textContent));return false;}return !short;});};
const events=[];
for(let year=2001;year<=2005;year++){
 const base=`https://www.festival-cannes.com/en/retrospective/${year}/`,selection=doc(year,'selection'),awards=doc(year,'awards');
 const programmes=[];const shortTitles=new Set([...selection.querySelectorAll('h2')].filter(h=>/Short films/i.test(clean(h.parentElement.querySelector('h3')?.textContent))).flatMap(h=>[...h.parentElement.querySelectorAll('a.list_item__content__title')].map(a=>norm(clean(a.querySelector('p')?.textContent)))));const excludedShortAwards=[];
 for(const h of selection.querySelectorAll('h2')){
  const heading=clean(h.textContent),container=h.parentElement;
  if(heading!=='Un Certain Regard'&&!(heading==='In Competition'&&clean(container.querySelector('h3')?.textContent)==='Feature films'))continue;
  const rows=featureRows(container).map(row=>{
   const link=row.querySelector('a.list_item__content__title'),title=clean(link.querySelector('p')?.textContent),whole=clean(link.textContent);
   const aliases=whole===title?[]:[whole.slice(title.length).trim().replace(/^\(|\)$/g,'').trim()];
   const director=clean(link.parentElement.querySelector('span')?.textContent).replace(/^by /,'');
   if(!director||!title)throw Error('Missing selection identity');
   return {title,aliases,director,year,source:link.href,...(link.href==='https://www.festival-cannes.com/en/f/marock/'?{runtime:102,runtime_source:link.href}: {})};
  });
  programmes.push({name:heading==='In Competition'?'Main Competition':heading,source:base+'selection/',awardsSource:base+'awards/',selection:rows,prizes:[]});
 }
 const excludedShortSelections=[];for(const p of programmes){for(const f of p.selection.filter(f=>['TY DA IA DA MY S TOBO','YELLOW FELLA'].includes(f.title)))excludedShortSelections.push({...f,runtime:f.title.startsWith('TY ')?27:25,reason:'Short film selected within Un Certain Regard; excluded from this feature-film catalogue batch.'});p.selection=p.selection.filter(f=>!excludedShortSelections.some(x=>x.source===f.source));}
 const locate=title=>{const matches=programmes.flatMap(p=>p.selection.filter(f=>[f.title,...f.aliases].some(n=>norm(n)===norm(title))).map(f=>({p,f})));if(matches.length>1)throw Error('Ambiguous prize '+title);return matches[0];};
 for(const h of awards.querySelectorAll('h2')){
  const heading=clean(h.textContent),container=h.parentElement;
  if(!['In Competition','Un Certain Regard',"Caméra d'or"].includes(heading)||heading==='In Competition'&&clean(container.querySelector('h3')?.textContent)!=='Feature films')continue;
  for(const row of featureRows(container)){
   const label=clean(row.querySelector('.list_item__award')?.textContent);
   // The scope is festival juries and Caméra d'or, never CST or honorary prizes.
   if(/C\.S\.T\.|CST|technician|Honorary|Lifetime achievement|Special Prize for the 61st Festival/i.test(label))continue;
   const link=row.querySelector('a.list_item__content__title');if(!link)throw Error('Prize without title');
   const text=clean(link.querySelector('p')?.textContent),following=clean(link.parentElement.querySelector('span')?.textContent);
   const people=following.startsWith('for')?[text]:[];
   const title=people.length?clean(following.replace(/^for\s*/,'')):text;
   const match=locate(title);
   if(!match){if(shortTitles.has(norm(title))){excludedShortAwards.push({title,label,reason:'Official selection identifies this work in the short-film competition; retrospective laureates misgroup it under feature films.'});continue;}if(heading==="Caméra d'or")continue;throw Error('Unmatched prize '+year+' '+title+' '+label);}
   const previous=match.p.prizes.find(p=>p.name===label&&p.entries.some(r=>r.title===match.f.title));
   if(previous){const r=previous.entries.find(r=>r.title===match.f.title);for(const person of people)if(!r.people.includes(person))r.people.push(person);}
   else match.p.prizes.push({name:label,entries:[{title:match.f.title,winner:true,people}]});
  }
 }
 events.push({event:'Cannes',year,section:'Official Selection',source:base+'selection/',awardsSource:base+'awards/',programmes,...(excludedShortSelections.length?{excluded_short_selections:excludedShortSelections}:{}),...(excludedShortAwards.length?{excluded_short_awards:excludedShortAwards}:{})});
}
fs.writeFileSync('imports/cannes-2001-2005-source.json',JSON.stringify({events},null,2)+'\n');
console.log(events.map(e=>({year:e.year,sections:e.programmes.map(p=>({name:p.name,films:p.selection.length,prizeRecords:p.prizes.length}))})));

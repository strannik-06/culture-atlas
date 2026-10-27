/* Award navigation and grouping. Catalogue identities and private progress stay with the app. */
(() => {
 'use strict';
 const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const brands={Cannes:{icon:'cannes',title:'Cannes',prize:'Palme d’Or',main:/palme d.or/i},Venice:{icon:'venice',title:'Venice',prize:'Golden Lion',main:/golden lion/i},Berlinale:{icon:'berlinale',title:'Berlinale',prize:'Golden Bear',main:/golden bear/i},Oscars:{icon:'oscars',title:'Oscars'},BAFTA:{icon:'bafta',title:'BAFTA'},'Golden Globes':{icon:'globes',title:'Golden Globes'}};
 const slug=s=>s.normalize('NFKD').replace(/\p{M}/gu,'').toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'');
 function categories(event){
  if(event.categories?.length)return event.categories;
  // Older editions only contain a main selection; prizes belong on its cards.
  return [{id:'main-competition',name:event.event==='Venice'?'Venezia Competition':'Main Competition',nomination_kind:'competition',entries:(event.films||[]).map(f=>({film_id:f.id,winner:!!f.awards?.length,prizes:f.awards||[],prize_rank:f.awards?.some(label=>brands[event.event]?.main?.test(label))?0:1}))}];
 }
 function entries(category){
  const rows=category.entries||category.nominees.map(film_id=>({film_id,winner:(category.winners||[category.winner]).includes(film_id),person:category.nomineeNames?.[film_id]?.join(' · ')}));
  return rows.map((row,index)=>({...row,index})).sort((a,b)=>Number(b.winner)-Number(a.winner)||(a.prize_rank??0)-(b.prize_rank??0)||a.index-b.index);
 }
 function create({events,renderCard,brands:customBrands,section='films',prefix='',getCategories=categories,getItems=e=>e.films,itemNoun='films',renderIntro=()=>''}){
  const awardBrands=customBrands||brands,$=id=>document.getElementById(prefix+id),names=Object.keys(awardBrands).filter(name=>events.some(e=>e.event===name));
  const url=(event,year,extra={})=>window.CultureRoutes.format({section,view:'awards',params:{event,year:String(year),...extra}});
  const years=name=>[...new Set(events.filter(e=>e.event===name).map(e=>e.year))].sort((a,b)=>b-a);
  function configure(){
   $('award-event').innerHTML=names.map(name=>`<option>${esc(name)}</option>`).join('');
   $('award-year').innerHTML=[...new Set(events.map(e=>e.year))].sort((a,b)=>b-a).map(year=>`<option value="${year}">${year}</option>`).join('');
  }
  function configureCategories(){
   const event=events.find(e=>e.event===$('award-event').value&&String(e.year)===$('award-year').value),previous=$('award-category').value;
   $('award-category').innerHTML='<option value="all">All categories</option>'+(event?getCategories(event).map((c,i)=>`<option value="${c.id||i}">${esc(c.name)}</option>`).join(''):'');
   // Older bookmarks used numeric category indices.
   const list=event?getCategories(event):[];
   $('award-category').value=[...$('award-category').options].some(o=>o.value===previous)?previous:/^\d+$/.test(previous)&&list[Number(previous)]?String(list[Number(previous)].id||previous):'all';
  }
  function render(){
   const name=$('award-event').value,year=Number($('award-year').value),edition=events.find(e=>e.event===name&&e.year===year),available=years(name),index=available.indexOf(year);
   $('award-tabs').innerHTML=names.map(n=>`<a class="award-tab${n===name?' active':''}" href="${esc(url(n,years(n)[0]))}" ${n===name?'aria-current="page"':''}><img src="${esc(awardBrands[n].icon.includes('/')?awardBrands[n].icon:'assets/awards/'+awardBrands[n].icon+'.svg')}" alt="" width="32" height="32"><span>${esc(n)}</span></a>`).join('');
   const previous=available[index+1],next=available[index-1];
   $('award-edition-title').textContent=name+' '+year;
   $('award-year-nav').innerHTML=(previous?`<a class="action" rel="prev" aria-label="Previous edition: ${previous}" href="${esc(url(name,previous))}">← ${previous}</a>`:'<span></span>')+`<span class="award-year-current">${year}<small>${section==='books'?'Prize edition':edition?.section==='Major Film Categories'?'Ceremony edition':'Festival edition'}</small></span>`+(next?`<a class="action" rel="next" aria-label="Next edition: ${next}" href="${esc(url(name,next))}">${next} →</a>`:'<span></span>');
   $('award-years').innerHTML=available.map(y=>`<a href="${esc(url(name,y))}" ${y===year?'aria-current="page"':''}>${y}</a>`).join('');
   const rail=$('award-years'),activeYear=rail.querySelector('[aria-current="page"]');if(activeYear&&rail.scrollWidth>rail.clientWidth)rail.scrollLeft+=activeYear.getBoundingClientRect().left-rail.getBoundingClientRect().left-(rail.clientWidth-activeYear.offsetWidth)/2;
   if(!edition){$('awards-grid').innerHTML='<p class="empty">This edition has not been added yet. Choose an available year above.</p>';$('awards-count').textContent='';$('awards-source').replaceChildren();$('awards-event-details').textContent='';if($('award-intro'))$('award-intro').replaceChildren();return;}
   const festival=section==='films'&&!!awardBrands[name].prize,groups=getCategories(edition),selected=$('award-category').value,winnersOnly=$('award-filter').value==='winners',byId=new Map(getItems(edition).map(f=>[f.id,f]));
   const shown=selected==='all'?groups:groups.filter((c,i)=>(c.id||String(i))===selected||String(i)===selected);
   $('awards-count').textContent=edition.status==='not-held'?'No prize this year':`${getItems(edition).length} ${edition.item_noun||itemNoun} · ${groups.length} ${groups.length===1?(festival?'section':'category'):(festival?'sections':'categories')}`+(winnersOnly?' · Winners only':'');
   $('awards-event-details').textContent=(edition.dates?edition.dates+' · ':'')+(edition.note||(section==='books'?'Prize edition year; books may have been published earlier.':festival?'Festival selections, with prizes shown on each winning film.':'Ceremony year; films may have premiered in the previous year.'));
   if($('award-intro'))$('award-intro').innerHTML=renderIntro(edition);
   $('awards-source').innerHTML=`Official sources: <a href="${esc(edition.source)}" target="_blank" rel="noopener noreferrer">${section==='books'?'Award information':edition.section==='Major Film Categories'?'Nominees and results':'Competition selection'}</a>`+(edition.awardsSource&&edition.awardsSource!==edition.source?` · <a href="${esc(edition.awardsSource)}" target="_blank" rel="noopener noreferrer">Prize results</a>`:'');
   $('awards-grid').innerHTML=edition.status==='not-held'?`<p class="empty">${esc(edition.note)}</p>`:shown.map((c,i)=>{
    const rows=entries(c).filter(row=>!winnersOnly||row.winner);if(!rows.length)return '';
    const win=rows.filter(r=>r.winner).length,kind=c.nomination_kind==='competition'?'In competition':c.nomination_kind==='winners_only'?'Prize recipients':'Nominees';
    return `<section class="award-category${i===0?' award-category-main':''}" aria-labelledby="${esc(prefix)}award-heading-${i}"><header class="award-category-heading"><div><p class="eyebrow">${esc(c.eyebrow||(festival?(i===0?'Main section':'Section'):(i===0?'Main category':'Category')))}</p><h3 id="${esc(prefix)}award-heading-${i}">${esc(c.name)}</h3></div><span class="meta">${section==='books'&&!win?rows.length+' '+(c.item_noun||(c.name==='Selected works'?'selected works':'books')):`${win} ${win===1?'winner':'winners'}${rows.length>win?' · '+(rows.length-win)+' '+(kind==='In competition'?'other selected films':'nominees'):''}`}</span></header>${c.source?`<p class="meta award-section-sources"><a href="${esc(c.source)}" target="_blank" rel="noopener noreferrer">${esc(c.source_label||(section==='books'?'Official list':'Official selection'))}</a>${c.awardsSource?` · <a href="${esc(c.awardsSource)}" target="_blank" rel="noopener noreferrer">Prize results</a>`:''}</p>`:''}<div class="grid award-category-grid">${rows.map(row=>{const film=byId.get(row.item_id??row.film_id);if(!film)return '';return renderCard(film,{...row,person:/actor|actress|performance|leading|supporting|screenplay/i.test(c.name)?row.person:undefined,label:row.label||(row.winner?(festival?'Winner':win>1?'Joint winner':'Winner'):kind==='In competition'?'Selected':'Nominee')});}).join('')}</div></section>`;
   }).join('');
  }
  return {configure,configureCategories,render,years};
 }
 window.CultureAwards={create,categories,entries};
})();

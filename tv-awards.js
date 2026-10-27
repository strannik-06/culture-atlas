/* Awarded programmes reference canonical TV identities; progress is owned by CultureTV. */
(() => {
 'use strict';
 const events=()=>window.CULTURE_TV_AWARDS||[];
 const brands={Emmys:{icon:'assets/awards/emmys.svg'},'Golden Globes':{icon:'assets/awards/globes.svg'},'BAFTA Television':{icon:'assets/awards/bafta.svg'}};
 function create({getWork,renderCard}){return window.CultureAwards.create({events:events(),brands,section:'tv',prefix:'tv-',itemNoun:'programmes',getCategories:e=>e.categories,getItems:e=>e.works.map(r=>getWork(r.id)).filter(Boolean),renderCard});}
 function recognitions(key){return events().flatMap(e=>e.categories.flatMap(c=>c.entries.filter(r=>r.item_id===key).map(r=>`${e.event} ${e.year} · ${c.name} · ${r.winner?'Winner':'Nominee'} (${r.display_title}; eligible programme/run)`)));}
 window.CultureTVAwards={create,recognitions,details:key=>window.CULTURE_TV_AWARD_DETAILS?.[key]||{}};
})();

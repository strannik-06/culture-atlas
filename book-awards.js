/* Public, reviewed award metadata. Private progress belongs to CultureBooks. */
(() => {
 'use strict';
 let cached;const data=()=>cached||=(()=>{const current=window.CULTURE_BOOK_AWARDS_2026||{books:[],events:[]},history=window.CULTURE_BOOK_AWARDS_HISTORY||{books:[],events:[]};const books=new Map(current.books.map(b=>[b.key,b]));for(const b of history.books)books.set(b.key,{...books.get(b.key),...b});return {books:[...books.values()],events:[...current.events,...history.events]};})();
 const escape=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const brands={'Booker Prize':{icon:'assets/awards/booker.svg'},'International Booker':{icon:'assets/awards/international-booker.svg'},'Pulitzer Prize':{icon:'assets/awards/pulitzer.svg'},'Nobel Literature':{icon:'assets/awards/nobel.svg'},'National Book Awards':{icon:'assets/awards/national-books.svg'},'Prix Goncourt':{icon:'assets/awards/goncourt.svg'}};
 function matches(a,b){return !!(a&&b&&(a.key&&(a.key===b.award_key||a.key===b.key)||a.catalogue_id&&a.catalogue_id===b.id||a.open_library_work_id&&a.open_library_work_id===b.open_library_work_id||a.alternate_work_ids?.includes(b.open_library_work_id)||a.goodreads_id&&a.goodreads_id===b.goodreads_id||a.source_key&&a.source_key===b.source_key));}
 let index,recognitionIndex;
 function indexes(){if(index)return;index=new Map();recognitionIndex=new Map();
 const add=(key,work,rank)=>{if(key&&!index.has(key))index.set(key,{work,rank});};
 data().books.forEach((a,rank)=>{for(const key of [a.key&&'key:'+a.key,a.catalogue_id&&'id:'+a.catalogue_id,a.open_library_work_id,...a.alternate_work_ids||[],a.goodreads_id&&'gr:'+a.goodreads_id,a.source_key&&'source:'+a.source_key])add(key,a,rank);});
 for(const e of data().events)for(const c of e.categories)for(const r of c.entries){const list=recognitionIndex.get(r.item_id)||[];list.push({event:e.event,year:e.year,category:c.name,winner:r.winner,label:e.laureate?'Selected work by '+e.laureate.name:r.label,url:window.CultureRoutes.format({section:'books',view:'awards',params:{event:e.event,year:String(e.year)}})});recognitionIndex.set(r.item_id,list);}
 }
 const find=book=>{if(!book)return;indexes();let best;for(const key of [book.award_key&&'key:'+book.award_key,book.key&&'key:'+book.key,book.id&&'id:'+book.id,book.open_library_work_id,book.goodreads_id&&'gr:'+book.goodreads_id,book.source_key&&'source:'+book.source_key]){const hit=index.get(key);if(hit&&(!best||hit.rank<best.rank))best=hit;}return best?.work;};
 const byKey=key=>{indexes();return index.get(key.startsWith('award-')?'key:'+key.slice(6):key.startsWith('local-')?'id:'+key.slice(6):key)?.work;};
 function recognitions(book){const work=find(book);return work?(recognitionIndex.get(work.key)||[]):[];}
 function create({renderCard}){
  return window.CultureAwards.create({events:data().events,brands,section:'books',prefix:'book-',getCategories:e=>e.categories,getItems:e=>[...e.books,...e.author_items||[]],itemNoun:'items',renderCard:(item,entry)=>item.kind==='author'?`<article class="film book-card award-author-card ${entry.winner?'award-winner':''}"><div class="poster award-author-emblem"><img src="assets/awards/international-booker.svg" alt="" width="64" height="64"><span class="award-entry-label award-entry-badge">${escape(entry.label)}</span></div><div class="body"><h3>${escape(item.name)}</h3><p class="meta">Author · body-of-work award</p><a href="${escape(item.source)}" target="_blank" rel="noopener noreferrer">Author & bibliography ↗</a></div></article>`:renderCard(item,entry),
   renderIntro:e=>e.laureate?`<aside class="award-laureate" aria-label="Award laureate"><div class="laureate-emblem" aria-hidden="true"><img src="${escape(brands[e.event].icon)}" alt="" width="64" height="64"></div><div><p class="eyebrow">${e.year} ${e.event==='Nobel Literature'?'Nobel laureate in Literature':'International Booker laureate'}</p><h3>${escape(e.laureate.name)}</h3><p>${escape(e.laureate.description)}</p><a href="${escape(e.laureate.source)}" target="_blank" rel="noopener noreferrer">Biography & bibliography ↗</a></div></aside>`:''});
 }
 window.CultureBookAwards={create,matches,find,byKey,recognitions,books:()=>data().books};
})();

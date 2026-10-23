/* Public, reviewed award metadata. Private progress belongs to CultureBooks. */
(() => {
 'use strict';
 const data=()=>window.CULTURE_BOOK_AWARDS_2026||{books:[],events:[]};
 const escape=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const brands={'Booker Prize':{icon:'assets/awards/booker.svg'},'International Booker':{icon:'assets/awards/international-booker.svg'},'Pulitzer Prize':{icon:'assets/awards/pulitzer.svg'},'Nobel Literature':{icon:'assets/awards/nobel.svg'},'National Book Awards':{icon:'assets/awards/national-books.svg'},'Prix Goncourt':{icon:'assets/awards/goncourt.svg'}};
 function matches(a,b){return !!(a&&b&&(a.key&&(a.key===b.award_key||a.key===b.key)||a.catalogue_id&&a.catalogue_id===b.id||a.open_library_work_id&&a.open_library_work_id===b.open_library_work_id||a.alternate_work_ids?.includes(b.open_library_work_id)||a.goodreads_id&&a.goodreads_id===b.goodreads_id||a.source_key&&a.source_key===b.source_key));}
 const find=book=>data().books.find(a=>matches(a,book));
 const byKey=key=>data().books.find(b=>'award-'+b.key===key||b.open_library_work_id===key||b.alternate_work_ids?.includes(key)||b.catalogue_id&&'local-'+b.catalogue_id===key);
 function recognitions(book){const work=find(book);if(!work)return [];return data().events.flatMap(e=>e.categories.flatMap(c=>c.entries.filter(r=>r.item_id===work.key).map(r=>({event:e.event,year:e.year,category:c.name,winner:r.winner,label:e.laureate?'Works by Nobel laureate Anne Carson':r.label,url:window.CultureRoutes.format({section:'books',view:'awards',params:{event:e.event,year:String(e.year)}})}))));}
 function create({renderCard}){
  return window.CultureAwards.create({events:data().events,brands,section:'books',prefix:'book-',getCategories:e=>e.categories,getItems:e=>e.books,itemNoun:'books',renderCard,
   renderIntro:e=>e.laureate?`<aside class="award-laureate" aria-label="Nobel laureate"><div class="laureate-emblem" aria-hidden="true"><img src="assets/awards/nobel.svg" alt="" width="64" height="64"></div><div><p class="eyebrow">2026 Nobel laureate in Literature</p><h3>${escape(e.laureate.name)}</h3><p>${escape(e.laureate.description)}</p><a href="${escape(e.laureate.source)}" target="_blank" rel="noopener noreferrer">Biography & bibliography ↗</a></div></aside>`:''});
 }
 window.CultureBookAwards={create,matches,find,byKey,recognitions,books:()=>data().books};
})();

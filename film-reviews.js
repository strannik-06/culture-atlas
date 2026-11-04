/* Public shared snapshots; only the authenticated backend discovers and writes. */
(() => {
 async function find(client,id){
  const {data,error}=await client.functions.invoke('film-reviews',{body:{film_id:Number(id)}});
  if(error){let message;try{message=(await error.context.json()).error;}catch{}throw Error(message||'Review lookup failed. Please try again.');}
  if(data?.error)throw Error(data.error);return data;
 }
 function mount(container,film,{client,user,hasReviews,onSnapshot}){
  const box=document.createElement('div'),button=document.createElement('button'),status=document.createElement('p');
  button.type='button';button.className='action';status.className='meta';status.setAttribute('role','status');
  let revision=0,filled=hasReviews;const current=()=>box.isConnected&&container.contains(box);const label=()=>button.textContent=filled?'Refresh ratings and reviews':'Find ratings and reviews';label();box.append(button,status);container.querySelector('[data-review-action]').append(box);
  const apply=s=>{if(!current())return;if(s?.items?.length){filled=true;onSnapshot(s);label();}return s;};
  button.onclick=async()=>{if(button.disabled)return;revision++;if(!user){status.textContent='Sign in to find or refresh ratings and reviews.';return;}button.disabled=true;status.textContent='Checking source pages…';try{const s=apply(await find(client,film.id));if(current())status.textContent=s?.warnings?.length?'Updated available reviews. '+s.warnings.join(' '):'Ratings and reviews updated.';}catch(e){if(current())status.textContent=e.message;}finally{if(current())button.disabled=false;}};
  if(client)Promise.resolve().then(()=>client.from('film_review_snapshots').select('items,warnings,checked_at').eq('film_id',film.id).maybeSingle()).then(({data,error})=>{if(!error&&revision===0)apply(data);}).catch(()=>{});
 }
 window.CultureFilmReviews={find,mount};
})();

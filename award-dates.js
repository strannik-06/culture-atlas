/* Shared, date-only metadata; ceremony year stays distinct from the actual event date. */
(() => {
 'use strict';
 const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const key=(section,event,year)=>JSON.stringify([section,event,Number(year)]);
 const editions=new Map((window.CULTURE_AWARD_EVENT_DATES||[]).map(e=>[key(e.section,e.event,e.year),e]));
 const day=s=>new Intl.DateTimeFormat('en-GB',{day:'numeric',month:'long',year:'numeric',timeZone:'UTC'}).format(new Date(s+'T00:00:00Z'));
 const time=(iso,text=day(iso))=>`<time datetime="${esc(iso)}">${esc(text)}</time>`;
 function range(start,end){
  if(!end||end===start)return time(start);
  if(start.slice(0,7)===end.slice(0,7))return time(start,String(Number(start.slice(-2))))+'–'+time(end);
  if(start.slice(0,4)===end.slice(0,4))return time(start,day(start).replace(/ \d{4}$/, ''))+' – '+time(end);
  return time(start)+' – '+time(end);
 }
 function render(section,edition){
  const e=editions.get(key(section,edition.event,edition.year));
  if(e?.status==='not-held'||edition.status==='not-held')return '<span class="award-date-entry">Not held this year</span>';
  if(!e)return edition.dates?`<span class="award-date-entry">${esc(edition.dates)}</span>`:'';
  return e.dates.map(d=>`<span class="award-date-entry"><span class="award-date-label">${d.scheduled?'Scheduled ':''}${esc(d.label)}:</span> <span>${range(d.start,d.end)}</span> <a class="award-date-source" href="${esc(d.source)}" target="_blank" rel="noopener noreferrer" aria-label="Date source: ${esc(edition.event)} ${edition.year}, ${esc(d.label)}">Source ↗</a></span>`).join('');
 }
 window.CultureAwardDates={render,range,find:(section,event,year)=>editions.get(key(section,event,year))};
})();

// Rebuild public award metadata and an insert-only catalogue registration batch.
import fs from 'node:fs';
const source=JSON.parse(fs.readFileSync('imports/book-awards-2011-2025-source.json','utf8'));
const keys=new Set(),providers=new Map();
for(const b of source.books){
 if(keys.has(b.key)||!/^[-a-z0-9]+$/.test(b.key)||!b.title||!b.authors?.length)throw Error('Invalid or duplicate award work '+b.key);keys.add(b.key);
 for(const id of [b.open_library_work_id,...b.alternate_work_ids||[]].filter(Boolean)){if(!/^\/works\/OL\d+W$/.test(id)||providers.has(id)&&providers.get(id)!==b.key)throw Error('Ambiguous provider identity '+id);providers.set(id,b.key);}
 if(b.cover_asset&&!fs.existsSync(b.cover_asset))throw Error('Missing cached cover '+b.key);
 if(b.cover_image_url&&!/^https:\/\//.test(b.cover_image_url))throw Error('Invalid cover URL '+b.key);
}
for(const e of source.events){const used=new Set(),people=new Set((e.author_items||[]).map(a=>a.id));for(const c of e.categories){const seen=new Set();for(const row of c.entries){if((!keys.has(row.item_id)&&!people.has(row.item_id))||seen.has(row.item_id))throw Error('Invalid category membership '+e.event+' '+e.year);seen.add(row.item_id);if(keys.has(row.item_id))used.add(row.item_id);}}if(used.size!==e.books.length||e.books.some(b=>!used.has(b.id)))throw Error('Edition count mismatch '+e.event+' '+e.year);}
const publicBooks=source.books.map(({provider_candidates,provider_verification,identity_status,catalogue_snapshot,...book})=>book);
fs.writeFileSync('book-awards-history.js','window.CULTURE_BOOK_AWARDS_HISTORY = '+JSON.stringify({...source,books:publicBooks},null,2)+';\n');
const quote=s=>"'"+String(s).replaceAll("'","''")+"'";
const payload=source.books.map(b=>({key:b.key,title:b.title,authors:b.authors,year:b.first_publish_year,cover_id:b.cover_id||null,open_library_work_id:b.open_library_work_id||null,alternate_work_ids:b.alternate_work_ids||[],goodreads_id:b.goodreads_id||null,source_key:b.source_key,catalogue_id:b.catalogue_id||null,catalogue_snapshot:b.catalogue_snapshot||null}));
fs.writeFileSync('imports/book-awards-2011-2025-catalogue-sync.sql',`-- Reviewed 2011–2025 book awards: public catalogue data only. Apply after PR merge.
-- Reuses reviewed IDs/provider identities; never overwrites metadata or ratings.
begin;
do $book_awards$
declare item jsonb; existing public.books%rowtype; matches integer;
begin
 for item in select value from jsonb_array_elements(${quote(JSON.stringify(payload))}::jsonb) loop
  select count(*) into matches from public.books b where
   (item->>'catalogue_id' is not null and b.id=(item->>'catalogue_id')::bigint)
   or b.source_key=item->>'source_key'
   or (item->>'open_library_work_id' is not null and b.open_library_work_id=item->>'open_library_work_id')
   or b.open_library_work_id in (select jsonb_array_elements_text(item->'alternate_work_ids'))
   or (item->>'goodreads_id' is not null and b.goodreads_id=item->>'goodreads_id');
  if matches>1 then raise exception 'Multiple catalogue records for award book %. Reconcile before registration.',item->>'title'; end if;
  if matches=1 then
   select * into strict existing from public.books b where
    (item->>'catalogue_id' is not null and b.id=(item->>'catalogue_id')::bigint)
    or b.source_key=item->>'source_key'
    or (item->>'open_library_work_id' is not null and b.open_library_work_id=item->>'open_library_work_id')
    or b.open_library_work_id in (select jsonb_array_elements_text(item->'alternate_work_ids'))
    or (item->>'goodreads_id' is not null and b.goodreads_id=item->>'goodreads_id');
   if existing.source_key=item->>'source_key' and (existing.title is distinct from item->>'title' or to_jsonb(existing.authors) is distinct from item->'authors') then raise exception 'Award catalogue key is attached to another identity: %.',item->>'title'; end if;
   if item->>'catalogue_id' is not null and existing.id=(item->>'catalogue_id')::bigint
      and (existing.title is distinct from item->'catalogue_snapshot'->>'title'
       or to_jsonb(existing.authors) is distinct from item->'catalogue_snapshot'->'authors')
   then raise exception 'Reviewed catalogue identity changed for %. Recheck before registration.',item->>'title'; end if;
  else
   if item->>'catalogue_id' is not null then raise exception 'Reviewed catalogue record is missing for %.',item->>'title'; end if;
   insert into public.books(open_library_work_id,source_key,title,authors,first_publish_year,cover_id,goodreads_id,work_scope)
   values(item->>'open_library_work_id',item->>'source_key',item->>'title',array(select jsonb_array_elements_text(item->'authors')),(item->>'year')::integer,(item->>'cover_id')::bigint,item->>'goodreads_id','work');
  end if;
 end loop;
end $book_awards$;
commit;
`);
const audit={verified_on:source.verified_on,total_books:source.books.length,reused_catalogue:source.books.filter(b=>b.catalogue_id).map(b=>({key:b.key,id:b.catalogue_id,title:b.title})),new_books:source.books.filter(b=>!b.catalogue_id).map(b=>({key:b.key,title:b.title,open_library_work_id:b.open_library_work_id||null,identity_status:b.identity_status})),provider_aliases:source.books.filter(b=>b.alternate_work_ids?.length).map(b=>({key:b.key,aliases:b.alternate_work_ids})),coverage:source.events.map(e=>({event:e.event,year:e.year,status:e.status,books:e.books.length,authors:e.author_items?.length||0,categories:e.categories.length})),metadata_gaps:source.books.filter(b=>!b.open_library_work_id||!(b.cover_id||b.cover_image_url)||!b.first_publish_year).map(b=>({key:b.key,title:b.title,provider:!!b.open_library_work_id,cover:!!(b.cover_id||b.cover_image_url),year:!!b.first_publish_year})),covers:source.books.filter(b=>b.cover_image_url||b.cover_id||b.cover_url).length,unresolved:[]};
fs.writeFileSync('imports/book-awards-2011-2025-audit.json',JSON.stringify(audit,null,2)+'\n');console.log(JSON.stringify({books:source.books.length,reused:audit.reused_catalogue.length,new:audit.new_books.length,covers:audit.covers}));

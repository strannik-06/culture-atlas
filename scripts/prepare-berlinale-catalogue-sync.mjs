// Produce the small, insert-only deployment batch for the new award identities.
import fs from 'node:fs';
const report=JSON.parse(fs.readFileSync('imports/berlinale-2021-2025-audit.json','utf8'));
if(report.unresolved.length)throw Error('Resolve every award identity before preparing deployment');
const rows=report.new_canonical_ids,ids=new Set(rows.map(f=>String(f.id)));
const values=rows.map(f=>`('movie:${f.tmdb_id}','movie:${f.id}',${f.tmdb_id})`).join(',\n');
const seed=fs.readFileSync('supabase/migrations/20261021_media_catalogue_seed.sql','utf8').split('\n');
const inserts=seed.filter(line=>line.startsWith('insert into public.media_catalogue')?ids.has(line.match(/values\('movie:(\d+)'/)?.[1]):line.startsWith('insert into public.media_provider_links')&&ids.has(line.match(/,'movie:(\d+)'\)/)?.[1]));
if(inserts.length!==rows.length*2)throw Error('Incomplete catalogue/provider deployment batch');
const guard=`do $$ begin
 if exists (
  select 1 from (values\n${values}\n) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;`;
fs.writeFileSync('imports/berlinale-2021-2025-catalogue-sync.sql','-- Berlinale 2021–2025: '+rows.length+' verified catalogue identities and provider links.\n-- Apply after merging the catalogue PR. Existing rows are preserved.\nbegin;\n'+guard+'\n'+inserts.join('\n')+'\ncommit;\n');
console.log('Prepared '+rows.length+' catalogue rows and '+rows.length+' provider links; no rating writes.');

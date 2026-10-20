-- Apply before enabling media-search. No existing progress is changed.
begin;
create sequence if not exists public.media_film_ids start 1000000000 maxvalue 2000000000;
create table if not exists public.media_catalogue (
 work_key text primary key, work_type text not null check(work_type in ('movie','tv')),
 film_id integer unique, metadata jsonb not null, is_static boolean not null default false,
 created_at timestamptz not null default now(),
 check ((work_type='movie' and film_id is not null and film_id>0 and work_key='movie:'||film_id) or (work_type='tv' and film_id is null and public.is_valid_tv_work_key(work_key)))
);
create table if not exists public.media_provider_links (
 provider_key text primary key, work_key text not null references public.media_catalogue(work_key)
);
alter table public.media_catalogue enable row level security;
alter table public.media_provider_links enable row level security;
revoke all on public.media_catalogue,public.media_provider_links from anon,authenticated;
grant select on public.media_catalogue,public.media_provider_links to anon,authenticated;
drop policy if exists "Read media catalogue" on public.media_catalogue;
create policy "Read media catalogue" on public.media_catalogue for select using(true);
drop policy if exists "Read media identities" on public.media_provider_links;
create policy "Read media identities" on public.media_provider_links for select using(true);
-- Legacy film star controls also write directly. Every edit must advance the
-- version observed by the new review editor, even when the client omits it.
create or replace function public.media_film_progress_version()
returns trigger language plpgsql set search_path='' as $$
begin new.updated_at:=clock_timestamp(); return new; end $$;
revoke all on function public.media_film_progress_version() from public,anon,authenticated;
drop trigger if exists media_film_progress_version on public.film_progress;
create trigger media_film_progress_version before update on public.film_progress
for each row execute function public.media_film_progress_version();
-- This RPC accepts trusted TMDB metadata ONLY from the authenticated Edge Function.
-- Never expose the service-role key in the browser.
create or replace function public.save_media_rating(p_user uuid,p_provider text,p_metadata jsonb,p_rating numeric,p_notes text,p_date date,p_scope text,p_expected timestamptz default null)
returns jsonb language plpgsql security definer set search_path='' as $$
declare k text; f integer; kind text; previous timestamptz; result jsonb; meta jsonb;
begin
 if p_user is null or p_provider !~ '^(movie|tv):[1-9][0-9]*(:season:[1-9][0-9]*)?$' or length(coalesce(p_metadata->>'title','')) not between 1 and 1000 then raise exception 'Invalid media identity'; end if;
 if p_rating is null or p_rating not between .5 and 10 or p_rating*2<>trunc(p_rating*2) or length(coalesce(p_notes,''))>10000 or p_scope not in ('whole_work','unspecified') or p_scope is null then raise exception 'Invalid rating'; end if;
 -- Serialise additions and edits to this provider identity, including first saves.
 perform pg_advisory_xact_lock(hashtextextended(p_provider,0));
 if p_provider !~ ':season:' and coalesce(p_metadata->>'imdb_id','') ~ '^tt[0-9]+$' then
   perform pg_advisory_xact_lock(hashtextextended('imdb:'||(p_metadata->>'imdb_id'),0));
 end if;
 select work_key into k from public.media_provider_links where provider_key=p_provider;
 -- Root cross-media IMDb matches are aliases, not a second watched title.
 if k is null and p_provider !~ ':season:' and coalesce(p_metadata->>'imdb_id','') ~ '^tt[0-9]+$' then
   select work_key into k from public.media_catalogue where metadata->>'imdb_id'=p_metadata->>'imdb_id' and work_key !~ ':season:' order by is_static desc,work_key limit 1;
 end if;
 if k is null and p_provider ~ '^tv:[0-9]+:season:' and p_metadata ? 'parent' and not exists(select 1 from public.media_provider_links where provider_key='tv:'||split_part(p_provider,':',2)) then
   insert into public.media_catalogue(work_key,work_type,metadata)
   values(split_part(p_provider,':',1)||':'||split_part(p_provider,':',2),'tv',(p_metadata->'parent')||jsonb_build_object('id','tv:'||split_part(p_provider,':',2))) on conflict do nothing;
   insert into public.media_provider_links values('tv:'||split_part(p_provider,':',2),'tv:'||split_part(p_provider,':',2)) on conflict do nothing;
 end if;
 if k is null then
   kind:=split_part(p_provider,':',1);
   if kind='movie' then f:=nextval('public.media_film_ids'); k:='movie:'||f; else k:=p_provider; end if;
   meta:=p_metadata||jsonb_build_object('id',case when kind='movie' then to_jsonb(f) else to_jsonb(k) end);
   insert into public.media_catalogue(work_key,work_type,film_id,metadata) values(k,kind,f,meta) on conflict do nothing;
 end if;
 insert into public.media_provider_links values(p_provider,k) on conflict do nothing;
 select work_type,film_id,metadata into kind,f,meta from public.media_catalogue where work_key=k for update;
 if kind='movie' then
   select updated_at into previous from public.film_progress where user_id=p_user and film_id=f for update;
 else
   select updated_at into previous from public.tv_progress where user_id=p_user and work_key=k for update;
 end if;
 if previous is distinct from p_expected then raise exception 'This rating changed. Select the result again before saving.' using errcode='40001'; end if;
 if kind='movie' then
   insert into public.film_progress(user_id,film_id,watched,rating,notes,watched_date,updated_at) values(p_user,f,true,p_rating,coalesce(p_notes,''),p_date,clock_timestamp())
   on conflict(user_id,film_id) do update set watched=true,rating=excluded.rating,notes=excluded.notes,watched_date=excluded.watched_date,updated_at=excluded.updated_at returning to_jsonb(film_progress.*) into result;
 else
   insert into public.tv_progress(user_id,work_key,rating,rating_scope,notes,watched_date,updated_at) values(p_user,k,p_rating,p_scope,coalesce(p_notes,''),p_date,clock_timestamp())
   on conflict(user_id,work_key) do update set rating=excluded.rating,rating_scope=excluded.rating_scope,notes=excluded.notes,watched_date=excluded.watched_date,updated_at=excluded.updated_at returning to_jsonb(tv_progress.*) into result;
 end if;
 return jsonb_build_object('work_key',k,'metadata',meta,'progress',result);
end $$;
revoke all on function public.save_media_rating(uuid,text,jsonb,numeric,text,date,text,timestamptz) from public,anon,authenticated;
grant execute on function public.save_media_rating(uuid,text,jsonb,numeric,text,date,text,timestamptz) to service_role;
notify pgrst,'reload schema';
commit;

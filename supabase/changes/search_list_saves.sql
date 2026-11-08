begin;
-- Catalogue registration and private list insertion are one transaction; no rating is created.
create or replace function private.save_book_to_list(p_metadata jsonb,p_work_key text)
returns jsonb language plpgsql security definer set search_path='' as $$
declare uid uuid:=auth.uid(); b public.books%rowtype; k text; saved public.personal_lists%rowtype;
begin
 if uid is null or coalesce(auth.jwt()->>'is_anonymous','false')='true' then raise exception 'Sign in to save a book.' using errcode='42501'; end if;
 if p_metadata is null or jsonb_typeof(p_metadata)<>'object' or octet_length(p_metadata::text)>20000 then raise exception 'Invalid book metadata'; end if;
 b:=jsonb_populate_record(null::public.books,p_metadata);
 if b.id is not null then select * into strict b from public.books where id=b.id;
 else
 if b.title is null or length(btrim(b.title)) not between 1 and 1000 or b.authors is null or cardinality(b.authors) not between 1 and 20 or array_ndims(b.authors)<>1 or exists(select 1 from unnest(b.authors) a where a is null or length(btrim(a)) not between 1 and 500) or (b.first_publish_year is not null and b.first_publish_year not between -5000 and 3000) or (b.cover_id is not null and b.cover_id<=0) then raise exception 'Invalid book metadata'; end if;
 if b.open_library_work_id ~ '^/works/OL[0-9]+W$' then
 insert into public.books(open_library_work_id,title,authors,first_publish_year,cover_id) values(b.open_library_work_id,b.title,b.authors,b.first_publish_year,b.cover_id) on conflict(open_library_work_id) do nothing;
 select * into strict b from public.books where open_library_work_id=b.open_library_work_id;
 elsif b.goodreads_id is not null and private.valid_book_sources(b) then
 insert into public.books(source_key,title,authors,first_publish_year,goodreads_id,cover_url) values('goodreads:'||b.goodreads_id,b.title,b.authors,b.first_publish_year,b.goodreads_id,b.cover_url) on conflict(goodreads_id) do nothing;
 select * into strict b from public.books where goodreads_id=b.goodreads_id;
 else raise exception 'A supported book identity is required'; end if;
 end if;
 k:=case when p_work_key ~ '^award-[a-z0-9-]+$' then p_work_key else coalesce(b.open_library_work_id,'local-'||b.id) end;
 insert into public.personal_lists(user_id,kind,work_key,metadata) values(uid,'book',k,jsonb_build_object('title',b.title,'subtitle',array_to_string(b.authors,', '),'href','#/books/'||regexp_replace(k,'^/works/',''),'book',to_jsonb(b))) on conflict(user_id,kind,work_key) do nothing;
 select * into strict saved from public.personal_lists where user_id=uid and kind='book' and work_key=k;
 return jsonb_build_object('book',to_jsonb(b),'entry',to_jsonb(saved));
end $$;
revoke all on function private.save_book_to_list(jsonb,text) from public,anon;
grant execute on function private.save_book_to_list(jsonb,text) to authenticated;
create or replace function public.save_book_to_list(p_metadata jsonb,p_work_key text) returns jsonb language sql security invoker set search_path='' as $$select private.save_book_to_list(p_metadata,p_work_key)$$;
revoke all on function public.save_book_to_list(jsonb,text) from public,anon;
grant execute on function public.save_book_to_list(jsonb,text) to authenticated;

-- Only the authenticated media-search endpoint supplies trusted TMDB metadata.
create or replace function public.save_media_to_list(p_user uuid,p_provider text,p_metadata jsonb)
returns jsonb language plpgsql security invoker set search_path='' as $$
declare k text; f integer; list_kind text; m jsonb; saved public.personal_lists%rowtype;
begin
 if p_user is null or p_provider !~ '^(movie|tv):[1-9][0-9]*$' or p_provider is null or p_metadata is null or length(coalesce(p_metadata->>'title','')) not between 1 and 1000 then raise exception 'Invalid media identity'; end if;
 perform pg_advisory_xact_lock(hashtextextended(p_provider,0));
 if coalesce(p_metadata->>'imdb_id','') ~ '^tt[0-9]+$' then perform pg_advisory_xact_lock(hashtextextended('imdb:'||(p_metadata->>'imdb_id'),0)); end if;
 select work_key into k from public.media_provider_links where provider_key=p_provider;
 if k is null and coalesce(p_metadata->>'imdb_id','') ~ '^tt[0-9]+$' then select work_key into k from public.media_catalogue where metadata->>'imdb_id'=p_metadata->>'imdb_id' and work_key !~ ':season:' order by is_static desc,work_key limit 1; end if;
 if k is null then
 list_kind:=split_part(p_provider,':',1);
 if list_kind='movie' then f:=nextval('public.media_film_ids');k:='movie:'||f;else k:=p_provider;end if;
 insert into public.media_catalogue(work_key,work_type,film_id,metadata) values(k,list_kind,f,p_metadata||jsonb_build_object('id',case when list_kind='movie' then to_jsonb(f) else to_jsonb(k) end));
 end if;
 insert into public.media_provider_links values(p_provider,k) on conflict do nothing;
 select metadata,case when work_type='movie' then 'film' else 'tv' end into m,list_kind from public.media_catalogue where work_key=k;
 insert into public.personal_lists(user_id,kind,work_key,metadata) values(p_user,list_kind,k,jsonb_build_object('title',m->>'title','subtitle',coalesce(m->>'director',''),'href',case when list_kind='film' then '#/films/'||split_part(k,':',2) else '#/tv/'||k end,'poster',case when m->>'poster_path' is not null then 'https://image.tmdb.org/t/p/w500'||(m->>'poster_path') else null end)) on conflict(user_id,kind,work_key) do nothing;
 select * into strict saved from public.personal_lists where user_id=p_user and personal_lists.kind=list_kind and work_key=k;
 return jsonb_build_object('work_key',k,'entry',to_jsonb(saved));
end $$;
revoke all on function public.save_media_to_list(uuid,text,jsonb) from public,anon,authenticated;
grant execute on function public.save_media_to_list(uuid,text,jsonb) to service_role;
notify pgrst,'reload schema';
commit;

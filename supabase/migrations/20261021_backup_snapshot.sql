-- Service-only consistent snapshot. No auth credentials are included.
begin;
create or replace function public.culture_backup_snapshot()
returns jsonb language sql stable security definer set search_path='' as $$
select jsonb_build_object(
 'snapshot_at',statement_timestamp(),
 'film_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.film_progress t),'[]'::jsonb),
 'tv_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.tv_progress t),'[]'::jsonb),
 'book_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.book_progress t),'[]'::jsonb),
 'books',coalesce((select jsonb_agg(to_jsonb(t)) from public.books t),'[]'::jsonb),
 'media_catalogue',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_catalogue t),'[]'::jsonb),
 'media_provider_links',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_provider_links t),'[]'::jsonb)
);
$$;
revoke all on function public.culture_backup_snapshot() from public,anon,authenticated;
grant execute on function public.culture_backup_snapshot() to service_role;
notify pgrst,'reload schema';
commit;

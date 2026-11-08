begin;
-- Apply after merging the private watch/read lists PR.
create table public.personal_lists (
 user_id uuid not null references auth.users(id) on delete cascade,
 kind text not null check (kind in ('film','tv','book')),
 work_key text not null check (length(work_key) between 1 and 500),
 metadata jsonb not null check (jsonb_typeof(metadata) = 'object' and octet_length(metadata::text) <= 20000),
 created_at timestamptz not null default now(),
 primary key (user_id,kind,work_key)
);
alter table public.personal_lists enable row level security;
revoke all on public.personal_lists from anon;
grant select,insert,update,delete on public.personal_lists to authenticated;
create policy "Read own saved titles" on public.personal_lists for select to authenticated using ((select auth.uid()) = user_id);
create policy "Save own titles" on public.personal_lists for insert to authenticated with check ((select auth.uid()) = user_id and coalesce((select auth.jwt())->>'is_anonymous','false') = 'false');
create policy "Update own titles" on public.personal_lists for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id and coalesce((select auth.jwt())->>'is_anonymous','false') = 'false');
create policy "Remove own titles" on public.personal_lists for delete to authenticated using ((select auth.uid()) = user_id);

create or replace function public.culture_backup_snapshot()
returns jsonb language sql stable security definer set search_path='' as $$
select jsonb_build_object(
 'snapshot_at',statement_timestamp(),
 'personal_lists',coalesce((select jsonb_agg(to_jsonb(t)) from public.personal_lists t),'[]'::jsonb),
 'film_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.film_progress t),'[]'::jsonb),
 'tv_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.tv_progress t),'[]'::jsonb),
 'book_progress',coalesce((select jsonb_agg(to_jsonb(t)) from public.book_progress t),'[]'::jsonb),
 'book_readings',coalesce((select jsonb_agg(to_jsonb(t)) from public.book_readings t),'[]'::jsonb),
 'books',coalesce((select jsonb_agg(to_jsonb(t)) from public.books t),'[]'::jsonb),
 'media_catalogue',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_catalogue t),'[]'::jsonb),
 'media_provider_links',coalesce((select jsonb_agg(to_jsonb(t)) from public.media_provider_links t),'[]'::jsonb));
$$;
revoke all on function public.culture_backup_snapshot() from public,anon,authenticated;
grant execute on function public.culture_backup_snapshot() to service_role;
notify pgrst,'reload schema';

commit;

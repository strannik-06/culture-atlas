begin;

create table public.entity_layout_preferences (
 user_id uuid not null references auth.users(id) on delete cascade,
 page_key text not null check (length(page_key) <= 64 and page_key ~ '^(films|tv|books)/[a-z0-9/-]+$'),
 layout text not null check (layout in ('cards', 'list')),
 primary key (user_id, page_key)
);

alter table public.entity_layout_preferences enable row level security;
revoke all on public.entity_layout_preferences from public, anon, authenticated;
grant select, insert, update on public.entity_layout_preferences to authenticated;

create policy "Manage own entity layouts"
 on public.entity_layout_preferences for all to authenticated
 using ((select auth.uid()) = user_id and coalesce((select auth.jwt())->>'is_anonymous', 'false') = 'false')
 with check ((select auth.uid()) = user_id and coalesce((select auth.jwt())->>'is_anonymous', 'false') = 'false');

notify pgrst, 'reload schema';
commit;

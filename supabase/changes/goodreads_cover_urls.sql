begin;

-- Accept the Goodreads cover path on Amazon alongside the legacy image hosts.
create or replace function private.valid_book_sources(b public.books) returns boolean
language sql immutable security invoker set search_path='' as $$
 select
 (b.goodreads_id is null or b.goodreads_id ~ '^[1-9][0-9]{0,19}$')
 and (b.goodreads_ratings_count is null or b.goodreads_ratings_count>=0)
 and (b.goodreads_rating is null or (
   b.goodreads_id is not null and b.goodreads_rating between 0 and 5
   and b.goodreads_ratings_count is not null and b.goodreads_ratings_count>0
   and b.goodreads_observed_on is not null
   and b.goodreads_rating_source is not null and b.goodreads_rating_source in ('manual','search_index')
   and b.goodreads_source_url is not null))
 and (b.goodreads_rating_source is null or b.goodreads_rating_source in ('manual','search_index'))
 and (b.goodreads_source_url is null or (length(b.goodreads_source_url)<=2000 and b.goodreads_source_url ~ '^https://www[.]goodreads[.]com/(book/show|author/show|author/list)/[1-9][0-9]*([._/-][^[:space:]]*)?$'))
 and (b.cover_url is null or (length(b.cover_url)<=2000 and (
   b.cover_url ~ '^https://(i|images)[.]gr-assets[.]com/[^[:space:]]+$'
   or b.cover_url ~ '^https://m[.]media-amazon[.]com/images/S/compressed[.]photo[.]goodreads[.]com/books/[^/[:space:]?#][^[:space:]]*$'
 )))
$$;

commit;

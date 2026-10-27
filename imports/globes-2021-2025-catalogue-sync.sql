-- Golden Globes 2021–2025: 25 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:556574','movie:2520',556574),
('movie:586101','movie:2521',586101),
('movie:587792','movie:2522',587792),
('movie:611213','movie:2523',611213),
('movie:529203','movie:2524',529203),
('movie:617708','movie:2525',617708),
('movie:621744','movie:2526',621744),
('movie:556678','movie:2527',556678),
('movie:599960','movie:2528',599960),
('movie:601666','movie:2529',601666),
('movie:520900','movie:2530',520900),
('movie:602269','movie:2531',602269),
('movie:831738','movie:2532',831738),
('movie:337404','movie:2533',337404),
('movie:467909','movie:2534',467909),
('movie:727293','movie:2535',727293),
('movie:642538','movie:2536',642538),
('movie:837938','movie:2537',837938),
('movie:754609','movie:2538',754609),
('movie:593643','movie:2539',593643),
('movie:1022796','movie:2540',1022796),
('movie:502356','movie:2541',502356),
('movie:1020006','movie:2542',1020006),
('movie:823482','movie:2543',823482),
('movie:798286','movie:2544',798286)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2520','movie',2520,'{"id":2520,"title":"Hamilton","director":"Thomas Kail","year":2020,"tmdb_id":556574,"imdb_id":"tt8503618","original_title":"Hamilton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2521','movie',2521,'{"id":2521,"title":"Music","director":"Sia","year":2021,"tmdb_id":586101,"imdb_id":"tt7541720","original_title":"Music","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2522','movie',2522,'{"id":2522,"title":"Palm Springs","director":"Max Barbakow","year":2020,"tmdb_id":587792,"imdb_id":"tt9484998","original_title":"Palm Springs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2523','movie',2523,'{"id":2523,"title":"The Prom","director":"Ryan Murphy","year":2020,"tmdb_id":611213,"imdb_id":"tt10161886","original_title":"The Prom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2524','movie',2524,'{"id":2524,"title":"The Croods: A New Age","director":"Joel Crawford","year":2020,"tmdb_id":529203,"imdb_id":"tt2850386","original_title":"The Croods: A New Age","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2525','movie',2525,'{"id":2525,"title":"La Llorona","director":"Jayro Bustamante","year":2019,"tmdb_id":617708,"imdb_id":"tt10767168","original_title":"La Llorona","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2526','movie',2526,'{"id":2526,"title":"Two of Us","director":"Filippo Meneghetti","year":2020,"tmdb_id":621744,"imdb_id":"tt9845110","original_title":"Deux","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2527','movie',2527,'{"id":2527,"title":"Emma.","director":"Autumn de Wilde","year":2020,"tmdb_id":556678,"imdb_id":"tt9214832","original_title":"Emma.","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2528','movie',2528,'{"id":2528,"title":"French Exit","director":"Azazel Jacobs","year":2021,"tmdb_id":599960,"imdb_id":"tt10279362","original_title":"French Exit","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2529','movie',2529,'{"id":2529,"title":"I Care a Lot","director":"J Blakeson","year":2021,"tmdb_id":601666,"imdb_id":"tt9893250","original_title":"I Care a Lot","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2530','movie',2530,'{"id":2530,"title":"The Personal History of David Copperfield","director":"Armando Iannucci","year":2019,"tmdb_id":520900,"imdb_id":"tt6439020","original_title":"The Personal History of David Copperfield","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2531','movie',2531,'{"id":2531,"title":"The Little Things","director":"John Lee Hancock","year":2021,"tmdb_id":602269,"imdb_id":"tt10016180","original_title":"The Little Things","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2532','movie',2532,'{"id":2532,"title":"My Sunny Maad","director":"Michaela Pavlátová","year":2021,"tmdb_id":831738,"imdb_id":"tt14749948","original_title":"Moje slunce Mad","original_language":"cs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2533','movie',2533,'{"id":2533,"title":"Cruella","director":"Craig Gillespie","year":2021,"tmdb_id":337404,"imdb_id":"tt3228774","original_title":"Cruella","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2534','movie',2534,'{"id":2534,"title":"In the Heights","director":"Jon M. Chu","year":2021,"tmdb_id":467909,"imdb_id":"tt1321510","original_title":"In the Heights","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2535','movie',2535,'{"id":2535,"title":"The Tender Bar","director":"George Clooney","year":2021,"tmdb_id":727293,"imdb_id":"tt3108894","original_title":"The Tender Bar","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2536','movie',2536,'{"id":2536,"title":"Inu-Oh","director":"Masaaki Yuasa","year":2022,"tmdb_id":642538,"imdb_id":"tt10540510","original_title":"犬王","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2537','movie',2537,'{"id":2537,"title":"The Inspection","director":"Elegance Bratton","year":2022,"tmdb_id":837938,"imdb_id":"tt13495458","original_title":"The Inspection","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2538','movie',2538,'{"id":2538,"title":"Mrs. Harris Goes to Paris","director":"Anthony Fabian","year":2022,"tmdb_id":754609,"imdb_id":"tt5151570","original_title":"Mrs. Harris Goes to Paris","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2539','movie',2539,'{"id":2539,"title":"The Menu","director":"Mark Mylod","year":2022,"tmdb_id":593643,"imdb_id":"tt9764362","original_title":"The Menu","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2540','movie',2540,'{"id":2540,"title":"Wish","director":"Fawn Veerasunthorn, Chris Buck","year":2023,"tmdb_id":1022796,"imdb_id":"tt11304740","original_title":"Wish","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2541','movie',2541,'{"id":2541,"title":"The Super Mario Bros. Movie","director":"Aaron Horvath, Michael Jelenic","year":2023,"tmdb_id":502356,"imdb_id":"tt6718170","original_title":"The Super Mario Bros. Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2542','movie',2542,'{"id":2542,"title":"Priscilla","director":"Sofia Coppola","year":2023,"tmdb_id":1020006,"imdb_id":"tt22041854","original_title":"Priscilla","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2543','movie',2543,'{"id":2543,"title":"Dream Scenario","director":"Kristoffer Borgli","year":2023,"tmdb_id":823482,"imdb_id":"tt21942866","original_title":"Dream Scenario","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2544','movie',2544,'{"id":2544,"title":"Beau Is Afraid","director":"Ari Aster","year":2023,"tmdb_id":798286,"imdb_id":"tt13521006","original_title":"Beau Is Afraid","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:556574','movie:2520') on conflict do nothing;
insert into public.media_provider_links values('movie:586101','movie:2521') on conflict do nothing;
insert into public.media_provider_links values('movie:587792','movie:2522') on conflict do nothing;
insert into public.media_provider_links values('movie:611213','movie:2523') on conflict do nothing;
insert into public.media_provider_links values('movie:529203','movie:2524') on conflict do nothing;
insert into public.media_provider_links values('movie:617708','movie:2525') on conflict do nothing;
insert into public.media_provider_links values('movie:621744','movie:2526') on conflict do nothing;
insert into public.media_provider_links values('movie:556678','movie:2527') on conflict do nothing;
insert into public.media_provider_links values('movie:599960','movie:2528') on conflict do nothing;
insert into public.media_provider_links values('movie:601666','movie:2529') on conflict do nothing;
insert into public.media_provider_links values('movie:520900','movie:2530') on conflict do nothing;
insert into public.media_provider_links values('movie:602269','movie:2531') on conflict do nothing;
insert into public.media_provider_links values('movie:831738','movie:2532') on conflict do nothing;
insert into public.media_provider_links values('movie:337404','movie:2533') on conflict do nothing;
insert into public.media_provider_links values('movie:467909','movie:2534') on conflict do nothing;
insert into public.media_provider_links values('movie:727293','movie:2535') on conflict do nothing;
insert into public.media_provider_links values('movie:642538','movie:2536') on conflict do nothing;
insert into public.media_provider_links values('movie:837938','movie:2537') on conflict do nothing;
insert into public.media_provider_links values('movie:754609','movie:2538') on conflict do nothing;
insert into public.media_provider_links values('movie:593643','movie:2539') on conflict do nothing;
insert into public.media_provider_links values('movie:1022796','movie:2540') on conflict do nothing;
insert into public.media_provider_links values('movie:502356','movie:2541') on conflict do nothing;
insert into public.media_provider_links values('movie:1020006','movie:2542') on conflict do nothing;
insert into public.media_provider_links values('movie:823482','movie:2543') on conflict do nothing;
insert into public.media_provider_links values('movie:798286','movie:2544') on conflict do nothing;
commit;

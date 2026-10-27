-- BAFTA 2021–2025: 58 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:644583','movie:2462',644583),
('movie:575773','movie:2463',575773),
('movie:522098','movie:2464',522098),
('movie:665764','movie:2465',665764),
('movie:575776','movie:2466',575776),
('movie:574396','movie:2467',574396),
('movie:532865','movie:2468',532865),
('movie:575774','movie:2469',575774),
('movie:554371','movie:2470',554371),
('movie:565307','movie:2471',565307),
('movie:620897','movie:2472',620897),
('movie:581859','movie:2473',581859),
('movie:623238','movie:2474',623238),
('movie:587609','movie:2475',587609),
('movie:586863','movie:2476',586863),
('movie:664280','movie:2477',664280),
('movie:653746','movie:2478',653746),
('movie:656690','movie:2479',656690),
('movie:714011','movie:2480',714011),
('movie:541524','movie:2481',541524),
('movie:661365','movie:2482',661365),
('movie:807196','movie:2483',807196),
('movie:730047','movie:2484',730047),
('movie:624899','movie:2485',624899),
('movie:644495','movie:2486',644495),
('movie:576845','movie:2487',576845),
('movie:765245','movie:2488',765245),
('movie:632617','movie:2489',632617),
('movie:423333','movie:2490',423333),
('movie:749004','movie:2491',749004),
('movie:774823','movie:2492',774823),
('movie:661348','movie:2493',661348),
('movie:680058','movie:2494',680058),
('movie:705996','movie:2495',705996),
('movie:724495','movie:2496',724495),
('movie:668482','movie:2497',668482),
('movie:821881','movie:2498',821881),
('movie:823766','movie:2499',823766),
('movie:913814','movie:2500',913814),
('movie:814757','movie:2501',814757),
('movie:758330','movie:2502',758330),
('movie:854239','movie:2503',854239),
('movie:541134','movie:2504',541134),
('movie:837881','movie:2505',837881),
('movie:888321','movie:2506',888321),
('movie:957457','movie:2507',957457),
('movie:994108','movie:2508',994108),
('movie:1049638','movie:2509',1049638),
('movie:935906','movie:2510',935906),
('movie:787699','movie:2511',787699),
('movie:1075175','movie:2512',1075175),
('movie:753342','movie:2513',753342),
('movie:970348','movie:2514',970348),
('movie:1171816','movie:2515',1171816),
('movie:1070032','movie:2516',1070032),
('movie:1058699','movie:2517',1058699),
('movie:1134865','movie:2518',1134865),
('movie:520758','movie:2519',520758)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2462','movie',2462,'{"id":2462,"title":"The Mauritanian","director":"Kevin Macdonald","year":2021,"tmdb_id":644583,"imdb_id":"tt4761112","original_title":"The Mauritanian","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2463','movie',2463,'{"id":2463,"title":"Rocks","director":"Sarah Gavron","year":2020,"tmdb_id":575773,"imdb_id":"tt9067182","original_title":"Rocks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2464','movie',2464,'{"id":2464,"title":"Babyteeth","director":"Shannon Murphy","year":2020,"tmdb_id":522098,"imdb_id":"tt8399664","original_title":"Babyteeth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2465','movie',2465,'{"id":2465,"title":"Mogul Mowgli","director":"Bassam Tariq","year":2020,"tmdb_id":665764,"imdb_id":"tt9892094","original_title":"Mogul Mowgli","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2466','movie',2466,'{"id":2466,"title":"Saint Maud","director":"Rose Glass","year":2020,"tmdb_id":575776,"imdb_id":"tt7557108","original_title":"Saint Maud","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2467','movie',2467,'{"id":2467,"title":"Calm with Horses","director":"Nick Rowland","year":2020,"tmdb_id":574396,"imdb_id":"tt4460792","original_title":"Calm with Horses","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2468','movie',2468,'{"id":2468,"title":"The Dig","director":"Simon Stone","year":2021,"tmdb_id":532865,"imdb_id":"tt3661210","original_title":"The Dig","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2469','movie',2469,'{"id":2469,"title":"His House","director":"Remi Weekes","year":2020,"tmdb_id":575774,"imdb_id":"tt8508734","original_title":"His House","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2470','movie',2470,'{"id":2470,"title":"Limbo","director":"Ben Sharrock","year":2020,"tmdb_id":554371,"imdb_id":"tt9138170","original_title":"Limbo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2471','movie',2471,'{"id":2471,"title":"Clemency","director":"Chinonye Chukwu","year":2019,"tmdb_id":565307,"imdb_id":"tt5577494","original_title":"Clemency","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2472','movie',2472,'{"id":2472,"title":"The Forty-Year-Old Version","director":"Radha Blank","year":2020,"tmdb_id":620897,"imdb_id":"tt10642834","original_title":"The Forty-Year-Old Version","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2473','movie',2473,'{"id":2473,"title":"Da 5 Bloods","director":"Spike Lee","year":2020,"tmdb_id":581859,"imdb_id":"tt9777644","original_title":"Da 5 Bloods","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2474','movie',2474,'{"id":2474,"title":"County Lines","director":"Henry Blake","year":2020,"tmdb_id":623238,"imdb_id":"tt7156898","original_title":"County Lines","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2475','movie',2475,'{"id":2475,"title":"Dear Comrades!","director":"Andrei Konchalovsky","year":2020,"tmdb_id":587609,"imdb_id":"tt10796286","original_title":"Дорогие товарищи!","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2476','movie',2476,'{"id":2476,"title":"Les Misérables","director":"Ladj Ly","year":2019,"tmdb_id":586863,"imdb_id":"tt10199590","original_title":"Les Misérables","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2477','movie',2477,'{"id":2477,"title":"David Attenborough: A Life on Our Planet","director":"Alastair Fothergill, Keith Scholey, Jonathan Hughes","year":2020,"tmdb_id":664280,"imdb_id":"tt11989890","original_title":"David Attenborough: A Life on Our Planet","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2478','movie',2478,'{"id":2478,"title":"The Dissident","director":"Bryan Fogel","year":2020,"tmdb_id":653746,"imdb_id":"tt11382384","original_title":"The Dissident","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2479','movie',2479,'{"id":2479,"title":"The Social Dilemma","director":"Jeff Orlowski","year":2020,"tmdb_id":656690,"imdb_id":"tt11464826","original_title":"The Social Dilemma","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2480','movie',2480,'{"id":2480,"title":"After Love","director":"Aleem Khan","year":2021,"tmdb_id":714011,"imdb_id":"tt10692788","original_title":"After Love","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2481','movie',2481,'{"id":2481,"title":"Passing","director":"Rebecca Hall","year":2021,"tmdb_id":541524,"imdb_id":"tt8893974","original_title":"Passing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2482','movie',2482,'{"id":2482,"title":"Ali & Ava","director":"Clio Barnard","year":2022,"tmdb_id":661365,"imdb_id":"tt11559472","original_title":"Ali & Ava","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2483','movie',2483,'{"id":2483,"title":"Boiling Point","director":"Philip Barantini","year":2021,"tmdb_id":807196,"imdb_id":"tt11127680","original_title":"Boiling Point","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2484','movie',2484,'{"id":2484,"title":"Cyrano","director":"Joe Wright","year":2021,"tmdb_id":730047,"imdb_id":"tt12889404","original_title":"Cyrano","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2485','movie',2485,'{"id":2485,"title":"Everybody''s Talking About Jamie","director":"Jonathan Butterell","year":2021,"tmdb_id":624899,"imdb_id":"tt8635092","original_title":"Everybody''s Talking About Jamie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2486','movie',2486,'{"id":2486,"title":"House of Gucci","director":"Ridley Scott","year":2021,"tmdb_id":644495,"imdb_id":"tt11214590","original_title":"House of Gucci","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2487','movie',2487,'{"id":2487,"title":"Last Night in Soho","director":"Edgar Wright","year":2021,"tmdb_id":576845,"imdb_id":"tt9639470","original_title":"Last Night in Soho","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2488','movie',2488,'{"id":2488,"title":"Swan Song","director":"Benjamin Cleary","year":2021,"tmdb_id":765245,"imdb_id":"tt13207508","original_title":"Swan Song","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2489','movie',2489,'{"id":2489,"title":"C''mon C''mon","director":"Mike Mills","year":2021,"tmdb_id":632617,"imdb_id":"tt10986222","original_title":"C''mon C''mon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2490','movie',2490,'{"id":2490,"title":"Mass","director":"Fran Kranz","year":2021,"tmdb_id":423333,"imdb_id":"tt11389748","original_title":"Mass","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2491','movie',2491,'{"id":2491,"title":"Petite Maman","director":"Céline Sciamma","year":2021,"tmdb_id":749004,"imdb_id":"tt13204490","original_title":"Petite Maman","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2492','movie',2492,'{"id":2492,"title":"Becoming Cousteau","director":"Liz Garbus","year":2021,"tmdb_id":774823,"imdb_id":"tt10334438","original_title":"Becoming Cousteau","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2493','movie',2493,'{"id":2493,"title":"Cow","director":"Andrea Arnold","year":2022,"tmdb_id":661348,"imdb_id":"tt11548822","original_title":"Cow","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2494','movie',2494,'{"id":2494,"title":"The Rescue","director":"Jimmy Chin, Elizabeth Chai Vasarhelyi","year":2021,"tmdb_id":680058,"imdb_id":"tt9098872","original_title":"The Rescue","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2495','movie',2495,'{"id":2495,"title":"Decision to Leave","director":"Park Chan-wook","year":2022,"tmdb_id":705996,"imdb_id":"tt12477480","original_title":"헤어질 결심","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2496','movie',2496,'{"id":2496,"title":"The Woman King","director":"Gina Prince-Bythewood","year":2022,"tmdb_id":724495,"imdb_id":"tt8093700","original_title":"The Woman King","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2497','movie',2497,'{"id":2497,"title":"Roald Dahl''s Matilda the Musical","director":"Matthew Warchus","year":2022,"tmdb_id":668482,"imdb_id":"tt3447590","original_title":"Roald Dahl''s Matilda the Musical","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2498','movie',2498,'{"id":2498,"title":"The Swimmers","director":"Sally El Hosaini","year":2022,"tmdb_id":821881,"imdb_id":"tt8745676","original_title":"The Swimmers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2499','movie',2499,'{"id":2499,"title":"The Wonder","director":"Sebastián Lelio","year":2022,"tmdb_id":823766,"imdb_id":"tt9288822","original_title":"The Wonder","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2500','movie',2500,'{"id":2500,"title":"Brian and Charles","director":"Jim Archer","year":2022,"tmdb_id":913814,"imdb_id":"tt13270424","original_title":"Brian and Charles","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2501','movie',2501,'{"id":2501,"title":"Empire of Light","director":"Sam Mendes","year":2022,"tmdb_id":814757,"imdb_id":"tt14402146","original_title":"Empire of Light","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2502','movie',2502,'{"id":2502,"title":"Good Luck to You, Leo Grande","director":"Sophie Hyde","year":2022,"tmdb_id":758330,"imdb_id":"tt13352968","original_title":"Good Luck to You, Leo Grande","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2503','movie',2503,'{"id":2503,"title":"Till","director":"Chinonye Chukwu","year":2022,"tmdb_id":854239,"imdb_id":"tt4960748","original_title":"Till","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2504','movie',2504,'{"id":2504,"title":"The Good Nurse","director":"Tobias Lindholm","year":2022,"tmdb_id":541134,"imdb_id":"tt4273800","original_title":"The Good Nurse","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2505','movie',2505,'{"id":2505,"title":"She Said","director":"Maria Schrader","year":2022,"tmdb_id":837881,"imdb_id":"tt11198810","original_title":"She Said","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2506','movie',2506,'{"id":2506,"title":"Corsage","director":"Marie Kreutzer","year":2022,"tmdb_id":888321,"imdb_id":"tt11992694","original_title":"Corsage","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2507','movie',2507,'{"id":2507,"title":"Moonage Daydream","director":"Brett Morgen","year":2022,"tmdb_id":957457,"imdb_id":"tt9883832","original_title":"Moonage Daydream","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2508','movie',2508,'{"id":2508,"title":"All of Us Strangers","director":"Andrew Haigh","year":2023,"tmdb_id":994108,"imdb_id":"tt21192142","original_title":"All of Us Strangers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2509','movie',2509,'{"id":2509,"title":"Rye Lane","director":"Raine Allen-Miller","year":2023,"tmdb_id":1049638,"imdb_id":"tt15893750","original_title":"Rye Lane","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2510','movie',2510,'{"id":2510,"title":"Scrapper","director":"Charlotte Regan","year":2023,"tmdb_id":935906,"imdb_id":"tt8649252","original_title":"Scrapper","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2511','movie',2511,'{"id":2511,"title":"Wonka","director":"Paul King","year":2023,"tmdb_id":787699,"imdb_id":"tt6166392","original_title":"Wonka","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2512','movie',2512,'{"id":2512,"title":"How to Have Sex","director":"Molly Manning Walker","year":2023,"tmdb_id":1075175,"imdb_id":"tt22890246","original_title":"How to Have Sex","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2513','movie',2513,'{"id":2513,"title":"Napoleon","director":"Ridley Scott","year":2023,"tmdb_id":753342,"imdb_id":"tt13287846","original_title":"Napoleon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2514','movie',2514,'{"id":2514,"title":"The Old Oak","director":"Ken Loach","year":2023,"tmdb_id":970348,"imdb_id":"tt19883634","original_title":"The Old Oak","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2515','movie',2515,'{"id":2515,"title":"American Symphony","director":"Matthew Heineman","year":2023,"tmdb_id":1171816,"imdb_id":"tt28865980","original_title":"American Symphony","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2516','movie',2516,'{"id":2516,"title":"Beyond Utopia","director":"Madeleine Gavin","year":2023,"tmdb_id":1070032,"imdb_id":"tt25470468","original_title":"Beyond Utopia","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2517','movie',2517,'{"id":2517,"title":"STILL: A Michael J. Fox Movie","director":"Davis Guggenheim","year":2023,"tmdb_id":1058699,"imdb_id":"tt19853258","original_title":"STILL: A Michael J. Fox Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2518','movie',2518,'{"id":2518,"title":"WHAM!","director":"Chris Smith","year":2023,"tmdb_id":1134865,"imdb_id":"tt27726927","original_title":"WHAM!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2519','movie',2519,'{"id":2519,"title":"Chicken Run: Dawn of the Nugget","director":"Sam Fell","year":2023,"tmdb_id":520758,"imdb_id":"tt8337264","original_title":"Chicken Run: Dawn of the Nugget","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:644583','movie:2462') on conflict do nothing;
insert into public.media_provider_links values('movie:575773','movie:2463') on conflict do nothing;
insert into public.media_provider_links values('movie:522098','movie:2464') on conflict do nothing;
insert into public.media_provider_links values('movie:665764','movie:2465') on conflict do nothing;
insert into public.media_provider_links values('movie:575776','movie:2466') on conflict do nothing;
insert into public.media_provider_links values('movie:574396','movie:2467') on conflict do nothing;
insert into public.media_provider_links values('movie:532865','movie:2468') on conflict do nothing;
insert into public.media_provider_links values('movie:575774','movie:2469') on conflict do nothing;
insert into public.media_provider_links values('movie:554371','movie:2470') on conflict do nothing;
insert into public.media_provider_links values('movie:565307','movie:2471') on conflict do nothing;
insert into public.media_provider_links values('movie:620897','movie:2472') on conflict do nothing;
insert into public.media_provider_links values('movie:581859','movie:2473') on conflict do nothing;
insert into public.media_provider_links values('movie:623238','movie:2474') on conflict do nothing;
insert into public.media_provider_links values('movie:587609','movie:2475') on conflict do nothing;
insert into public.media_provider_links values('movie:586863','movie:2476') on conflict do nothing;
insert into public.media_provider_links values('movie:664280','movie:2477') on conflict do nothing;
insert into public.media_provider_links values('movie:653746','movie:2478') on conflict do nothing;
insert into public.media_provider_links values('movie:656690','movie:2479') on conflict do nothing;
insert into public.media_provider_links values('movie:714011','movie:2480') on conflict do nothing;
insert into public.media_provider_links values('movie:541524','movie:2481') on conflict do nothing;
insert into public.media_provider_links values('movie:661365','movie:2482') on conflict do nothing;
insert into public.media_provider_links values('movie:807196','movie:2483') on conflict do nothing;
insert into public.media_provider_links values('movie:730047','movie:2484') on conflict do nothing;
insert into public.media_provider_links values('movie:624899','movie:2485') on conflict do nothing;
insert into public.media_provider_links values('movie:644495','movie:2486') on conflict do nothing;
insert into public.media_provider_links values('movie:576845','movie:2487') on conflict do nothing;
insert into public.media_provider_links values('movie:765245','movie:2488') on conflict do nothing;
insert into public.media_provider_links values('movie:632617','movie:2489') on conflict do nothing;
insert into public.media_provider_links values('movie:423333','movie:2490') on conflict do nothing;
insert into public.media_provider_links values('movie:749004','movie:2491') on conflict do nothing;
insert into public.media_provider_links values('movie:774823','movie:2492') on conflict do nothing;
insert into public.media_provider_links values('movie:661348','movie:2493') on conflict do nothing;
insert into public.media_provider_links values('movie:680058','movie:2494') on conflict do nothing;
insert into public.media_provider_links values('movie:705996','movie:2495') on conflict do nothing;
insert into public.media_provider_links values('movie:724495','movie:2496') on conflict do nothing;
insert into public.media_provider_links values('movie:668482','movie:2497') on conflict do nothing;
insert into public.media_provider_links values('movie:821881','movie:2498') on conflict do nothing;
insert into public.media_provider_links values('movie:823766','movie:2499') on conflict do nothing;
insert into public.media_provider_links values('movie:913814','movie:2500') on conflict do nothing;
insert into public.media_provider_links values('movie:814757','movie:2501') on conflict do nothing;
insert into public.media_provider_links values('movie:758330','movie:2502') on conflict do nothing;
insert into public.media_provider_links values('movie:854239','movie:2503') on conflict do nothing;
insert into public.media_provider_links values('movie:541134','movie:2504') on conflict do nothing;
insert into public.media_provider_links values('movie:837881','movie:2505') on conflict do nothing;
insert into public.media_provider_links values('movie:888321','movie:2506') on conflict do nothing;
insert into public.media_provider_links values('movie:957457','movie:2507') on conflict do nothing;
insert into public.media_provider_links values('movie:994108','movie:2508') on conflict do nothing;
insert into public.media_provider_links values('movie:1049638','movie:2509') on conflict do nothing;
insert into public.media_provider_links values('movie:935906','movie:2510') on conflict do nothing;
insert into public.media_provider_links values('movie:787699','movie:2511') on conflict do nothing;
insert into public.media_provider_links values('movie:1075175','movie:2512') on conflict do nothing;
insert into public.media_provider_links values('movie:753342','movie:2513') on conflict do nothing;
insert into public.media_provider_links values('movie:970348','movie:2514') on conflict do nothing;
insert into public.media_provider_links values('movie:1171816','movie:2515') on conflict do nothing;
insert into public.media_provider_links values('movie:1070032','movie:2516') on conflict do nothing;
insert into public.media_provider_links values('movie:1058699','movie:2517') on conflict do nothing;
insert into public.media_provider_links values('movie:1134865','movie:2518') on conflict do nothing;
insert into public.media_provider_links values('movie:520758','movie:2519') on conflict do nothing;
commit;

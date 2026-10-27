-- Oscars 2021–2025: 82 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:600354','movie:2380',600354),
('movie:583406','movie:2381',583406),
('movie:615643','movie:2382',615643),
('movie:615667','movie:2383',615667),
('movie:566076','movie:2384',566076),
('movie:641662','movie:2385',641662),
('movie:661914','movie:2386',661914),
('movie:740985','movie:2387',740985),
('movie:592984','movie:2388',592984),
('movie:628534','movie:2389',628534),
('movie:575813','movie:2390',575813),
('movie:618363','movie:2391',618363),
('movie:669363','movie:2392',669363),
('movie:728118','movie:2393',728118),
('movie:682110','movie:2394',682110),
('movie:653725','movie:2395',653725),
('movie:653756','movie:2396',653756),
('movie:653729','movie:2397',653729),
('movie:508439','movie:2398',508439),
('movie:560050','movie:2399',560050),
('movie:422803','movie:2400',422803),
('movie:441130','movie:2401',441130),
('movie:614917','movie:2402',614917),
('movie:597208','movie:2403',597208),
('movie:511809','movie:2404',511809),
('movie:537116','movie:2405',537116),
('movie:591538','movie:2406',591538),
('movie:601470','movie:2407',601470),
('movie:554230','movie:2408',554230),
('movie:766798','movie:2409',766798),
('movie:716612','movie:2410',716612),
('movie:680813','movie:2411',680813),
('movie:722778','movie:2412',722778),
('movie:627087','movie:2413',627087),
('movie:776527','movie:2414',776527),
('movie:822138','movie:2415',822138),
('movie:858059','movie:2416',858059),
('movie:776557','movie:2417',776557),
('movie:568124','movie:2418',568124),
('movie:508943','movie:2419',508943),
('movie:501929','movie:2420',501929),
('movie:527774','movie:2421',527774),
('movie:76600','movie:2422',76600),
('movie:614934','movie:2423',614934),
('movie:817758','movie:2424',817758),
('movie:777245','movie:2425',777245),
('movie:965150','movie:2426',965150),
('movie:760099','movie:2427',760099),
('movie:301502','movie:2428',301502),
('movie:823147','movie:2429',823147),
('movie:595586','movie:2430',595586),
('movie:505642','movie:2431',505642),
('movie:714888','movie:2432',714888),
('movie:901563','movie:2433',901563),
('movie:785398','movie:2434',785398),
('movie:916405','movie:2435',916405),
('movie:926676','movie:2436',926676),
('movie:913838','movie:2437',913838),
('movie:1004663','movie:2438',1004663),
('movie:913823','movie:2439',913823),
('movie:913743','movie:2440',913743),
('movie:869626','movie:2441',869626),
('movie:315162','movie:2442',315162),
('movie:560057','movie:2443',560057),
('movie:508947','movie:2444',508947),
('movie:523607','movie:2445',523607),
('movie:898713','movie:2446',898713),
('movie:895549','movie:2447',895549),
('movie:558915','movie:2448',558915),
('movie:839369','movie:2449',839369),
('movie:906126','movie:2450',906126),
('movie:998022','movie:2451',998022),
('movie:1058616','movie:2452',1058616),
('movie:1004683','movie:2453',1004683),
('movie:1032760','movie:2454',1032760),
('movie:1069193','movie:2455',1069193),
('movie:1015356','movie:2456',1015356),
('movie:508883','movie:2457',508883),
('movie:976573','movie:2458',976573),
('movie:961323','movie:2459',961323),
('movie:838240','movie:2460',838240),
('movie:569094','movie:2461',569094)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2380','movie',2380,'{"id":2380,"title":"The Father","director":"Florian Zeller","year":2020,"tmdb_id":600354,"imdb_id":"tt10272386","original_title":"The Father","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2381','movie',2381,'{"id":2381,"title":"Judas and the Black Messiah","director":"Shaka King","year":2021,"tmdb_id":583406,"imdb_id":"tt9784798","original_title":"Judas and the Black Messiah","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2382','movie',2382,'{"id":2382,"title":"Minari","director":"Lee Isaac Chung","year":2020,"tmdb_id":615643,"imdb_id":"tt10633456","original_title":"Minari","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2383','movie',2383,'{"id":2383,"title":"Ma Rainey''s Black Bottom","director":"George C. Wolfe","year":2020,"tmdb_id":615667,"imdb_id":"tt10514222","original_title":"Ma Rainey''s Black Bottom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2384','movie',2384,'{"id":2384,"title":"The United States vs. Billie Holiday","director":"Lee Daniels","year":2021,"tmdb_id":566076,"imdb_id":"tt8521718","original_title":"The United States vs. Billie Holiday","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2385','movie',2385,'{"id":2385,"title":"Pieces of a Woman","director":"Kornél Mundruczó","year":2020,"tmdb_id":641662,"imdb_id":"tt11161474","original_title":"Pieces of a Woman","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2386','movie',2386,'{"id":2386,"title":"One Night in Miami...","director":"Regina King","year":2020,"tmdb_id":661914,"imdb_id":"tt10612922","original_title":"One Night in Miami...","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2387','movie',2387,'{"id":2387,"title":"Borat Subsequent Moviefilm: Delivery of Prodigious Bribe to American Regime for Make Benefit Once Glorious Nation of Kazakhstan","director":"Jason Woliner","year":2020,"tmdb_id":740985,"imdb_id":"tt13143964","original_title":"Borat Subsequent Moviefilm: Delivery of Prodigious Bribe to American Regime for Make Benefit Once Glorious Nation of Kazakhstan","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2388','movie',2388,'{"id":2388,"title":"Hillbilly Elegy","director":"Ron Howard","year":2020,"tmdb_id":592984,"imdb_id":"tt6772802","original_title":"Hillbilly Elegy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2389','movie',2389,'{"id":2389,"title":"The White Tiger","director":"Ramin Bahrani","year":2021,"tmdb_id":628534,"imdb_id":"tt6571548","original_title":"The White Tiger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2390','movie',2390,'{"id":2390,"title":"Better Days","director":"Derek Tsang Kwok-Cheung","year":2019,"tmdb_id":575813,"imdb_id":"tt9586294","original_title":"少年的你","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2391','movie',2391,'{"id":2391,"title":"Collective","director":"Alexander Nanau","year":2019,"tmdb_id":618363,"imdb_id":"tt10706602","original_title":"Colectiv","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2392','movie',2392,'{"id":2392,"title":"The Man Who Sold His Skin","director":"Kaouther Ben Hania","year":2021,"tmdb_id":669363,"imdb_id":"tt10360862","original_title":"الرجل الذي باع ظهره","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2393','movie',2393,'{"id":2393,"title":"Quo Vadis, Aida?","director":"Jasmila Žbanić","year":2021,"tmdb_id":728118,"imdb_id":"tt8633462","original_title":"Quo Vadis, Aida?","original_language":"sr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2394','movie',2394,'{"id":2394,"title":"My Octopus Teacher","director":"James Reed, Pippa Ehrlich","year":2020,"tmdb_id":682110,"imdb_id":"tt12888462","original_title":"My Octopus Teacher","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2395','movie',2395,'{"id":2395,"title":"Crip Camp: A Disability Revolution","director":"Jim LeBrecht, Nicole Newnham","year":2020,"tmdb_id":653725,"imdb_id":"tt8923484","original_title":"Crip Camp: A Disability Revolution","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2396','movie',2396,'{"id":2396,"title":"The Mole Agent","director":"Maite Alberdi","year":2020,"tmdb_id":653756,"imdb_id":"tt11394298","original_title":"El agente topo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2397','movie',2397,'{"id":2397,"title":"Time","director":"Garrett Bradley","year":2020,"tmdb_id":653729,"imdb_id":"tt11416746","original_title":"Time","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2398','movie',2398,'{"id":2398,"title":"Onward","director":"Dan Scanlon","year":2020,"tmdb_id":508439,"imdb_id":"tt7146812","original_title":"Onward","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2399','movie',2399,'{"id":2399,"title":"Over the Moon","director":"Glen Keane","year":2020,"tmdb_id":560050,"imdb_id":"tt7488208","original_title":"Over the Moon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2400','movie',2400,'{"id":2400,"title":"A Shaun the Sheep Movie: Farmageddon","director":"Will Becher, Richard Phelan","year":2019,"tmdb_id":422803,"imdb_id":"tt6193408","original_title":"A Shaun the Sheep Movie: Farmageddon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2401','movie',2401,'{"id":2401,"title":"Wolfwalkers","director":"Tomm Moore, Ross Stewart","year":2020,"tmdb_id":441130,"imdb_id":"tt5198068","original_title":"Wolfwalkers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2402','movie',2402,'{"id":2402,"title":"King Richard","director":"Reinaldo Marcus Green","year":2021,"tmdb_id":614917,"imdb_id":"tt9620288","original_title":"King Richard","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2403','movie',2403,'{"id":2403,"title":"Nightmare Alley","director":"Guillermo del Toro","year":2021,"tmdb_id":597208,"imdb_id":"tt7740496","original_title":"Nightmare Alley","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2404','movie',2404,'{"id":2404,"title":"West Side Story","director":"Steven Spielberg","year":2021,"tmdb_id":511809,"imdb_id":"tt3581652","original_title":"West Side Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2405','movie',2405,'{"id":2405,"title":"tick, tick... BOOM!","director":"Lin-Manuel Miranda","year":2021,"tmdb_id":537116,"imdb_id":"tt8721424","original_title":"tick, tick... BOOM!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2406','movie',2406,'{"id":2406,"title":"The Tragedy of Macbeth","director":"Joel Coen","year":2021,"tmdb_id":591538,"imdb_id":"tt10095582","original_title":"The Tragedy of Macbeth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2407','movie',2407,'{"id":2407,"title":"The Eyes of Tammy Faye","director":"Michael Showalter","year":2021,"tmdb_id":601470,"imdb_id":"tt9115530","original_title":"The Eyes of Tammy Faye","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2408','movie',2408,'{"id":2408,"title":"The Lost Daughter","director":"Maggie Gyllenhaal","year":2021,"tmdb_id":554230,"imdb_id":"tt9100054","original_title":"The Lost Daughter","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2409','movie',2409,'{"id":2409,"title":"Parallel Mothers","director":"Pedro Almodóvar","year":2021,"tmdb_id":766798,"imdb_id":"tt12618926","original_title":"Madres paralelas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2410','movie',2410,'{"id":2410,"title":"Spencer","director":"Pablo Larraín","year":2021,"tmdb_id":716612,"imdb_id":"tt12536294","original_title":"Spencer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2411','movie',2411,'{"id":2411,"title":"Flee","director":"Jonas Poher Rasmussen","year":2021,"tmdb_id":680813,"imdb_id":"tt8430054","original_title":"Flugt","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2412','movie',2412,'{"id":2412,"title":"The Hand of God","director":"Paolo Sorrentino","year":2021,"tmdb_id":722778,"imdb_id":"tt12680684","original_title":"È stata la mano di Dio","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2413','movie',2413,'{"id":2413,"title":"Lunana: A Yak in the Classroom","director":"Pawo Choyning Dorji","year":2019,"tmdb_id":627087,"imdb_id":"tt10189300","original_title":"ལུང་ནག་ན","original_language":"dz","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2414','movie',2414,'{"id":2414,"title":"Summer of Soul (...Or, When the Revolution Could Not Be Televised)","director":"Questlove","year":2021,"tmdb_id":776527,"imdb_id":"tt7378922","original_title":"Summer of Soul (...Or, When the Revolution Could Not Be Televised)","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2415','movie',2415,'{"id":2415,"title":"Ascension","director":"Jessica Kingdon","year":2021,"tmdb_id":822138,"imdb_id":"tt14505430","original_title":"Ascension","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2416','movie',2416,'{"id":2416,"title":"Attica","director":"Traci A. Curry, Stanley Nelson","year":2021,"tmdb_id":858059,"imdb_id":"tt12482898","original_title":"Attica","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2417','movie',2417,'{"id":2417,"title":"Writing with Fire","director":"Rintu Thomas, Sushmit Ghosh","year":2021,"tmdb_id":776557,"imdb_id":"tt13630174","original_title":"Writing with Fire","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2418','movie',2418,'{"id":2418,"title":"Encanto","director":"Byron Howard, Jared Bush","year":2021,"tmdb_id":568124,"imdb_id":"tt2953050","original_title":"Encanto","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2419','movie',2419,'{"id":2419,"title":"Luca","director":"Enrico Casarosa","year":2021,"tmdb_id":508943,"imdb_id":"tt12801262","original_title":"Luca","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2420','movie',2420,'{"id":2420,"title":"The Mitchells vs. the Machines","director":"Mike Rianda","year":2021,"tmdb_id":501929,"imdb_id":"tt7979580","original_title":"The Mitchells vs. the Machines","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2421','movie',2421,'{"id":2421,"title":"Raya and the Last Dragon","director":"Don Hall, Carlos López Estrada","year":2021,"tmdb_id":527774,"imdb_id":"tt5109280","original_title":"Raya and the Last Dragon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2422','movie',2422,'{"id":2422,"title":"Avatar: The Way of Water","director":"James Cameron","year":2022,"tmdb_id":76600,"imdb_id":"tt1630029","original_title":"Avatar: The Way of Water","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2423','movie',2423,'{"id":2423,"title":"Elvis","director":"Baz Luhrmann","year":2022,"tmdb_id":614934,"imdb_id":"tt3704428","original_title":"Elvis","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2424','movie',2424,'{"id":2424,"title":"TÁR","director":"Todd Field","year":2022,"tmdb_id":817758,"imdb_id":"tt14444726","original_title":"TÁR","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2425','movie',2425,'{"id":2425,"title":"Women Talking","director":"Sarah Polley","year":2022,"tmdb_id":777245,"imdb_id":"tt13669038","original_title":"Women Talking","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2426','movie',2426,'{"id":2426,"title":"Aftersun","director":"Charlotte Wells","year":2022,"tmdb_id":965150,"imdb_id":"tt19770238","original_title":"Aftersun","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2427','movie',2427,'{"id":2427,"title":"Living","director":"Oliver Hermanus","year":2022,"tmdb_id":760099,"imdb_id":"tt9051908","original_title":"Living","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2428','movie',2428,'{"id":2428,"title":"Blonde","director":"Andrew Dominik","year":2022,"tmdb_id":301502,"imdb_id":"tt1655389","original_title":"Blonde","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2429','movie',2429,'{"id":2429,"title":"To Leslie","director":"Michael Morris","year":2022,"tmdb_id":823147,"imdb_id":"tt8129806","original_title":"To Leslie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2430','movie',2430,'{"id":2430,"title":"Causeway","director":"Lila Neugebauer","year":2022,"tmdb_id":595586,"imdb_id":"tt10192406","original_title":"Causeway","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2431','movie',2431,'{"id":2431,"title":"Black Panther: Wakanda Forever","director":"Ryan Coogler","year":2022,"tmdb_id":505642,"imdb_id":"tt9114286","original_title":"Black Panther: Wakanda Forever","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2432','movie',2432,'{"id":2432,"title":"Argentina 1985","director":"Santiago Mitre","year":2022,"tmdb_id":714888,"imdb_id":"tt15301048","original_title":"Argentina 1985","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2433','movie',2433,'{"id":2433,"title":"Close","director":"Lukas Dhont","year":2022,"tmdb_id":901563,"imdb_id":"tt9660502","original_title":"Close","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2434','movie',2434,'{"id":2434,"title":"EO","director":"Jerzy Skolimowski","year":2022,"tmdb_id":785398,"imdb_id":"tt19652910","original_title":"EO","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2435','movie',2435,'{"id":2435,"title":"The Quiet Girl","director":"Colm Bairéad","year":2022,"tmdb_id":916405,"imdb_id":"tt15109082","original_title":"An Cailín Ciúin","original_language":"ga","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2436','movie',2436,'{"id":2436,"title":"Navalny","director":"Daniel Roher","year":2022,"tmdb_id":926676,"imdb_id":"tt17041964","original_title":"Navalny","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2437','movie',2437,'{"id":2437,"title":"All That Breathes","director":"Shaunak Sen","year":2022,"tmdb_id":913838,"imdb_id":"tt16377862","original_title":"All That Breathes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2438','movie',2438,'{"id":2438,"title":"All the Beauty and the Bloodshed","director":"Laura Poitras","year":2022,"tmdb_id":1004663,"imdb_id":"tt21374850","original_title":"All the Beauty and the Bloodshed","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2439','movie',2439,'{"id":2439,"title":"Fire of Love","director":"Sara Dosa","year":2022,"tmdb_id":913823,"imdb_id":"tt16227014","original_title":"Fire of Love","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2440','movie',2440,'{"id":2440,"title":"A House Made of Splinters","director":"Simon Lereng Wilmont","year":2023,"tmdb_id":913743,"imdb_id":"tt16377920","original_title":"Будинок зі скалок","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2441','movie',2441,'{"id":2441,"title":"Marcel the Shell with Shoes On","director":"Dean Fleischer Camp","year":2022,"tmdb_id":869626,"imdb_id":"tt15339456","original_title":"Marcel the Shell with Shoes On","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2442','movie',2442,'{"id":2442,"title":"Puss in Boots: The Last Wish","director":"Joel Crawford","year":2022,"tmdb_id":315162,"imdb_id":"tt3915174","original_title":"Puss in Boots: The Last Wish","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2443','movie',2443,'{"id":2443,"title":"The Sea Beast","director":"Chris Williams","year":2022,"tmdb_id":560057,"imdb_id":"tt9288046","original_title":"The Sea Beast","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2444','movie',2444,'{"id":2444,"title":"Turning Red","director":"Domee Shi","year":2022,"tmdb_id":508947,"imdb_id":"tt8097030","original_title":"Turning Red","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2445','movie',2445,'{"id":2445,"title":"Maestro","director":"Bradley Cooper","year":2023,"tmdb_id":523607,"imdb_id":"tt5535276","original_title":"Maestro","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2446','movie',2446,'{"id":2446,"title":"Rustin","director":"George C. Wolfe","year":2023,"tmdb_id":898713,"imdb_id":"tt14160834","original_title":"Rustin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2447','movie',2447,'{"id":2447,"title":"NYAD","director":"Jimmy Chin, Elizabeth Chai Vasarhelyi","year":2023,"tmdb_id":895549,"imdb_id":"tt5302918","original_title":"NYAD","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2448','movie',2448,'{"id":2448,"title":"The Color Purple","director":"Blitz Bazawule","year":2023,"tmdb_id":558915,"imdb_id":"tt1200263","original_title":"The Color Purple","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2449','movie',2449,'{"id":2449,"title":"May December","director":"Todd Haynes","year":2023,"tmdb_id":839369,"imdb_id":"tt13651794","original_title":"May December","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2450','movie',2450,'{"id":2450,"title":"Society of the Snow","director":"J. A. Bayona","year":2023,"tmdb_id":906126,"imdb_id":"tt16277242","original_title":"La sociedad de la nieve","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2451','movie',2451,'{"id":2451,"title":"The Teachers'' Lounge","director":"İlker Çatak","year":2023,"tmdb_id":998022,"imdb_id":"tt26612950","original_title":"Das Lehrerzimmer","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2452','movie',2452,'{"id":2452,"title":"20 Days in Mariupol","director":"Mstyslav Chernov","year":2023,"tmdb_id":1058616,"imdb_id":"tt24082438","original_title":"20 Days in Mariupol","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2453','movie',2453,'{"id":2453,"title":"Bobi Wine: The People''s President","director":"Christopher Sharp, Moses Bwayo","year":2023,"tmdb_id":1004683,"imdb_id":"tt21376900","original_title":"Bobi Wine: The People''s President","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2454','movie',2454,'{"id":2454,"title":"The Eternal Memory","director":"Maite Alberdi","year":2023,"tmdb_id":1032760,"imdb_id":"tt24082488","original_title":"La memoria infinita","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2455','movie',2455,'{"id":2455,"title":"Four Daughters","director":"Kaouther Ben Hania","year":2023,"tmdb_id":1069193,"imdb_id":"tt27502426","original_title":"Les Filles d''Olfa","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2456','movie',2456,'{"id":2456,"title":"To Kill a Tiger","director":"Nisha Pahuja","year":2023,"tmdb_id":1015356,"imdb_id":"tt21688772","original_title":"To Kill a Tiger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2457','movie',2457,'{"id":2457,"title":"The Boy and the Heron","director":"Hayao Miyazaki","year":2023,"tmdb_id":508883,"imdb_id":"tt6587046","original_title":"君たちはどう生きるか","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2458','movie',2458,'{"id":2458,"title":"Elemental","director":"Peter Sohn","year":2023,"tmdb_id":976573,"imdb_id":"tt15789038","original_title":"Elemental","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2459','movie',2459,'{"id":2459,"title":"Nimona","director":"Troy Quane, Nick Bruno","year":2023,"tmdb_id":961323,"imdb_id":"tt19500164","original_title":"Nimona","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2460','movie',2460,'{"id":2460,"title":"Robot Dreams","director":"Pablo Berger","year":2023,"tmdb_id":838240,"imdb_id":"tt13429870","original_title":"Robot Dreams","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2461','movie',2461,'{"id":2461,"title":"Spider-Man: Across the Spider-Verse","director":"Justin K. Thompson, Kemp Powers, Joaquim Dos Santos","year":2023,"tmdb_id":569094,"imdb_id":"tt9362722","original_title":"Spider-Man: Across the Spider-Verse","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:600354','movie:2380') on conflict do nothing;
insert into public.media_provider_links values('movie:583406','movie:2381') on conflict do nothing;
insert into public.media_provider_links values('movie:615643','movie:2382') on conflict do nothing;
insert into public.media_provider_links values('movie:615667','movie:2383') on conflict do nothing;
insert into public.media_provider_links values('movie:566076','movie:2384') on conflict do nothing;
insert into public.media_provider_links values('movie:641662','movie:2385') on conflict do nothing;
insert into public.media_provider_links values('movie:661914','movie:2386') on conflict do nothing;
insert into public.media_provider_links values('movie:740985','movie:2387') on conflict do nothing;
insert into public.media_provider_links values('movie:592984','movie:2388') on conflict do nothing;
insert into public.media_provider_links values('movie:628534','movie:2389') on conflict do nothing;
insert into public.media_provider_links values('movie:575813','movie:2390') on conflict do nothing;
insert into public.media_provider_links values('movie:618363','movie:2391') on conflict do nothing;
insert into public.media_provider_links values('movie:669363','movie:2392') on conflict do nothing;
insert into public.media_provider_links values('movie:728118','movie:2393') on conflict do nothing;
insert into public.media_provider_links values('movie:682110','movie:2394') on conflict do nothing;
insert into public.media_provider_links values('movie:653725','movie:2395') on conflict do nothing;
insert into public.media_provider_links values('movie:653756','movie:2396') on conflict do nothing;
insert into public.media_provider_links values('movie:653729','movie:2397') on conflict do nothing;
insert into public.media_provider_links values('movie:508439','movie:2398') on conflict do nothing;
insert into public.media_provider_links values('movie:560050','movie:2399') on conflict do nothing;
insert into public.media_provider_links values('movie:422803','movie:2400') on conflict do nothing;
insert into public.media_provider_links values('movie:441130','movie:2401') on conflict do nothing;
insert into public.media_provider_links values('movie:614917','movie:2402') on conflict do nothing;
insert into public.media_provider_links values('movie:597208','movie:2403') on conflict do nothing;
insert into public.media_provider_links values('movie:511809','movie:2404') on conflict do nothing;
insert into public.media_provider_links values('movie:537116','movie:2405') on conflict do nothing;
insert into public.media_provider_links values('movie:591538','movie:2406') on conflict do nothing;
insert into public.media_provider_links values('movie:601470','movie:2407') on conflict do nothing;
insert into public.media_provider_links values('movie:554230','movie:2408') on conflict do nothing;
insert into public.media_provider_links values('movie:766798','movie:2409') on conflict do nothing;
insert into public.media_provider_links values('movie:716612','movie:2410') on conflict do nothing;
insert into public.media_provider_links values('movie:680813','movie:2411') on conflict do nothing;
insert into public.media_provider_links values('movie:722778','movie:2412') on conflict do nothing;
insert into public.media_provider_links values('movie:627087','movie:2413') on conflict do nothing;
insert into public.media_provider_links values('movie:776527','movie:2414') on conflict do nothing;
insert into public.media_provider_links values('movie:822138','movie:2415') on conflict do nothing;
insert into public.media_provider_links values('movie:858059','movie:2416') on conflict do nothing;
insert into public.media_provider_links values('movie:776557','movie:2417') on conflict do nothing;
insert into public.media_provider_links values('movie:568124','movie:2418') on conflict do nothing;
insert into public.media_provider_links values('movie:508943','movie:2419') on conflict do nothing;
insert into public.media_provider_links values('movie:501929','movie:2420') on conflict do nothing;
insert into public.media_provider_links values('movie:527774','movie:2421') on conflict do nothing;
insert into public.media_provider_links values('movie:76600','movie:2422') on conflict do nothing;
insert into public.media_provider_links values('movie:614934','movie:2423') on conflict do nothing;
insert into public.media_provider_links values('movie:817758','movie:2424') on conflict do nothing;
insert into public.media_provider_links values('movie:777245','movie:2425') on conflict do nothing;
insert into public.media_provider_links values('movie:965150','movie:2426') on conflict do nothing;
insert into public.media_provider_links values('movie:760099','movie:2427') on conflict do nothing;
insert into public.media_provider_links values('movie:301502','movie:2428') on conflict do nothing;
insert into public.media_provider_links values('movie:823147','movie:2429') on conflict do nothing;
insert into public.media_provider_links values('movie:595586','movie:2430') on conflict do nothing;
insert into public.media_provider_links values('movie:505642','movie:2431') on conflict do nothing;
insert into public.media_provider_links values('movie:714888','movie:2432') on conflict do nothing;
insert into public.media_provider_links values('movie:901563','movie:2433') on conflict do nothing;
insert into public.media_provider_links values('movie:785398','movie:2434') on conflict do nothing;
insert into public.media_provider_links values('movie:916405','movie:2435') on conflict do nothing;
insert into public.media_provider_links values('movie:926676','movie:2436') on conflict do nothing;
insert into public.media_provider_links values('movie:913838','movie:2437') on conflict do nothing;
insert into public.media_provider_links values('movie:1004663','movie:2438') on conflict do nothing;
insert into public.media_provider_links values('movie:913823','movie:2439') on conflict do nothing;
insert into public.media_provider_links values('movie:913743','movie:2440') on conflict do nothing;
insert into public.media_provider_links values('movie:869626','movie:2441') on conflict do nothing;
insert into public.media_provider_links values('movie:315162','movie:2442') on conflict do nothing;
insert into public.media_provider_links values('movie:560057','movie:2443') on conflict do nothing;
insert into public.media_provider_links values('movie:508947','movie:2444') on conflict do nothing;
insert into public.media_provider_links values('movie:523607','movie:2445') on conflict do nothing;
insert into public.media_provider_links values('movie:898713','movie:2446') on conflict do nothing;
insert into public.media_provider_links values('movie:895549','movie:2447') on conflict do nothing;
insert into public.media_provider_links values('movie:558915','movie:2448') on conflict do nothing;
insert into public.media_provider_links values('movie:839369','movie:2449') on conflict do nothing;
insert into public.media_provider_links values('movie:906126','movie:2450') on conflict do nothing;
insert into public.media_provider_links values('movie:998022','movie:2451') on conflict do nothing;
insert into public.media_provider_links values('movie:1058616','movie:2452') on conflict do nothing;
insert into public.media_provider_links values('movie:1004683','movie:2453') on conflict do nothing;
insert into public.media_provider_links values('movie:1032760','movie:2454') on conflict do nothing;
insert into public.media_provider_links values('movie:1069193','movie:2455') on conflict do nothing;
insert into public.media_provider_links values('movie:1015356','movie:2456') on conflict do nothing;
insert into public.media_provider_links values('movie:508883','movie:2457') on conflict do nothing;
insert into public.media_provider_links values('movie:976573','movie:2458') on conflict do nothing;
insert into public.media_provider_links values('movie:961323','movie:2459') on conflict do nothing;
insert into public.media_provider_links values('movie:838240','movie:2460') on conflict do nothing;
insert into public.media_provider_links values('movie:569094','movie:2461') on conflict do nothing;
commit;

-- Venice 2021–2025: 133 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:522526','movie:2673',522526),
('movie:664506','movie:2674',664506),
('movie:807185','movie:2675',807185),
('movie:668640','movie:2676',668640),
('movie:660708','movie:2677',660708),
('movie:854359','movie:2678',854359),
('movie:660000','movie:2679',660000),
('movie:571468','movie:2680',571468),
('movie:668408','movie:2681',668408),
('movie:800368','movie:2682',800368),
('movie:788931','movie:2683',788931),
('movie:818621','movie:2684',818621),
('movie:643532','movie:2685',643532),
('movie:828920','movie:2686',828920),
('movie:617246','movie:2687',617246),
('movie:854317','movie:2688',854317),
('movie:854323','movie:2689',854323),
('movie:854550','movie:2690',854550),
('movie:832284','movie:2691',832284),
('movie:852355','movie:2692',852355),
('movie:854554','movie:2693',854554),
('movie:796162','movie:2694',796162),
('movie:833417','movie:2695',833417),
('movie:854567','movie:2696',854567),
('movie:854569','movie:2697',854569),
('movie:786918','movie:2698',786918),
('movie:796157','movie:2699',796157),
('movie:796150','movie:2700',796150),
('movie:772437','movie:2701',772437),
('movie:854572','movie:2702',854572),
('movie:720035','movie:2703',720035),
('movie:807888','movie:2704',807888),
('movie:682533','movie:2705',682533),
('movie:840098','movie:2706',840098),
('movie:770724','movie:2707',770724),
('movie:925943','movie:2708',925943),
('movie:927594','movie:2709',927594),
('movie:852046','movie:2710',852046),
('movie:790867','movie:2711',790867),
('movie:1004664','movie:2712',1004664),
('movie:910782','movie:2713',910782),
('movie:540549','movie:2714',540549),
('movie:974521','movie:2715',974521),
('movie:1004657','movie:2716',1004657),
('movie:971594','movie:2717',971594),
('movie:803694','movie:2718',803694),
('movie:1004895','movie:2719',1004895),
('movie:714339','movie:2720',714339),
('movie:715742','movie:2721',715742),
('movie:1005279','movie:2722',1005279),
('movie:1005290','movie:2723',1005290),
('movie:936373','movie:2724',936373),
('movie:577921','movie:2725',577921),
('movie:958219','movie:2726',958219),
('movie:869886','movie:2727',869886),
('movie:999119','movie:2728',999119),
('movie:1005141','movie:2729',1005141),
('movie:870724','movie:2730',870724),
('movie:1000618','movie:2731',1000618),
('movie:859981','movie:2732',859981),
('movie:925714','movie:2733',925714),
('movie:1005299','movie:2734',1005299),
('movie:936363','movie:2735',936363),
('movie:1005309','movie:2736',1005309),
('movie:944401','movie:2737',944401),
('movie:1044741','movie:2738',1044741),
('movie:1057999','movie:2739',1057999),
('movie:1013869','movie:2740',1013869),
('movie:1047016','movie:2741',1047016),
('movie:1023962','movie:2742',1023962),
('movie:753336','movie:2743',753336),
('movie:800158','movie:2744',800158),
('movie:932801','movie:2745',932801),
('movie:991708','movie:2746',991708),
('movie:365620','movie:2747',365620),
('movie:1021803','movie:2748',1021803),
('movie:1156130','movie:2749',1156130),
('movie:989496','movie:2750',989496),
('movie:1156151','movie:2751',1156151),
('movie:1070997','movie:2752',1070997),
('movie:1090097','movie:2753',1090097),
('movie:1156166','movie:2754',1156166),
('movie:872508','movie:2755',872508),
('movie:900376','movie:2756',900376),
('movie:1000092','movie:2757',1000092),
('movie:1025377','movie:2758',1025377),
('movie:1084066','movie:2759',1084066),
('movie:603531','movie:2760',603531),
('movie:1156219','movie:2761',1156219),
('movie:730256','movie:2762',730256),
('movie:1075989','movie:2763',1075989),
('movie:1156110','movie:2764',1156110),
('movie:1158416','movie:2765',1158416),
('movie:1077877','movie:2766',1077877),
('movie:1156208','movie:2767',1156208),
('movie:1174246','movie:2768',1174246),
('movie:1148663','movie:2769',1148663),
('movie:1228685','movie:2770',1228685),
('movie:1104937','movie:2771',1104937),
('movie:1141163','movie:2772',1141163),
('movie:936946','movie:2773',936946),
('movie:1319196','movie:2774',1319196),
('movie:948184','movie:2775',948184),
('movie:1032765','movie:2776',1032765),
('movie:1108795','movie:2777',1108795),
('movie:1195108','movie:2778',1195108),
('movie:1313006','movie:2779',1313006),
('movie:1320279','movie:2780',1320279),
('movie:1265717','movie:2781',1265717),
('movie:1195113','movie:2782',1195113),
('movie:1315541','movie:2783',1315541),
('movie:951055','movie:2784',951055),
('movie:1319473','movie:2785',1319473),
('movie:1299351','movie:2786',1299351),
('movie:1063307','movie:2787',1063307),
('movie:1096642','movie:2788',1096642),
('movie:1118770','movie:2789',1118770),
('movie:1517062','movie:2790',1517062),
('movie:794228','movie:2791',794228),
('movie:1339666','movie:2792',1339666),
('movie:1025389','movie:2793',1025389),
('movie:1517120','movie:2794',1517120),
('movie:1000879','movie:2795',1000879),
('movie:1285895','movie:2796',1285895),
('movie:1517125','movie:2797',1517125),
('movie:1517070','movie:2798',1517070),
('movie:1516518','movie:2799',1516518),
('movie:1517129','movie:2800',1517129),
('movie:1442922','movie:2801',1442922),
('movie:1418361','movie:2802',1418361),
('movie:1310573','movie:2803',1310573),
('movie:1319520','movie:2804',1319520),
('movie:1517064','movie:2805',1517064)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2673','movie',2673,'{"id":2673,"title":"Mona Lisa and the Blood Moon","director":"Ana Lily Amirpour","year":2021,"tmdb_id":522526,"imdb_id":"tt8760670","original_title":"Mona Lisa and the Blood Moon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2674','movie',2674,'{"id":2674,"title":"Another World","director":"Stéphane Brizé","year":2021,"tmdb_id":664506,"imdb_id":"tt15115102","original_title":"Un autre monde","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2675','movie',2675,'{"id":2675,"title":"America Latina","director":"Fabio D''Innocenzo, Damiano D''Innocenzo","year":2021,"tmdb_id":807185,"imdb_id":"tt13932304","original_title":"America Latina","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2676','movie',2676,'{"id":2676,"title":"Official Competition","director":"Gastón Duprat, Mariano Cohn","year":2021,"tmdb_id":668640,"imdb_id":"tt11700260","original_title":"Competencia oficial","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2677','movie',2677,'{"id":2677,"title":"Il Buco","director":"Michelangelo Frammartino","year":2021,"tmdb_id":660708,"imdb_id":"tt11012320","original_title":"Il buco","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2678','movie',2678,'{"id":2678,"title":"Sundown","director":"Michel Franco","year":2021,"tmdb_id":854359,"imdb_id":"tt15115280","original_title":"Sundown","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2679','movie',2679,'{"id":2679,"title":"Lost Illusions","director":"Xavier Giannoli","year":2021,"tmdb_id":660000,"imdb_id":"tt10505316","original_title":"Illusions perdues","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2680','movie',2680,'{"id":2680,"title":"Freaks Out","director":"Gabriele Mainetti","year":2021,"tmdb_id":571468,"imdb_id":"tt7270808","original_title":"Freaks Out","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2681','movie',2681,'{"id":2681,"title":"The King of Laughter","director":"Mario Martone","year":2021,"tmdb_id":668408,"imdb_id":"tt9526392","original_title":"Qui rido io","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2682','movie',2682,'{"id":2682,"title":"On the Job: The Missing 8","director":"Erik Matti","year":2021,"tmdb_id":800368,"imdb_id":"tt3785036","original_title":"On the Job: The Missing 8","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2683','movie',2683,'{"id":2683,"title":"Leave No Traces","director":"Jan P. Matuszyński","year":2021,"tmdb_id":788931,"imdb_id":"tt13473548","original_title":"Żeby nie było śladów","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2684','movie',2684,'{"id":2684,"title":"Captain Volkonogov Escaped","director":"Natalya Merkulova, Alexey Chupov","year":2021,"tmdb_id":818621,"imdb_id":"tt13322726","original_title":"Капитан Волконогов бежал","original_language":"ru","alternate_titles":["Kapitan Volkonogov bezhal"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2685','movie',2685,'{"id":2685,"title":"The Card Counter","director":"Paul Schrader","year":2021,"tmdb_id":643532,"imdb_id":"tt11196036","original_title":"The Card Counter","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2686','movie',2686,'{"id":2686,"title":"Reflection","director":"Valentyn Vasyanovych","year":2021,"tmdb_id":828920,"imdb_id":"tt14225832","original_title":"Відблиск","original_language":"uk","alternate_titles":["Vidblysk"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2687','movie',2687,'{"id":2687,"title":"The Box","director":"Lorenzo Vigas","year":2021,"tmdb_id":617246,"imdb_id":"tt13846544","original_title":"La caja","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2688','movie',2688,'{"id":2688,"title":"Atlantide","director":"Yuri Ancarani","year":2021,"tmdb_id":854317,"imdb_id":"tt15119666","original_title":"Atlantide","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2689','movie',2689,'{"id":2689,"title":"Miracle","director":"Bogdan George Apetri","year":2021,"tmdb_id":854323,"imdb_id":"tt14355860","original_title":"Miracol","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2690','movie',2690,'{"id":2690,"title":"Pilgrims","director":"Laurynas Bareiša","year":2021,"tmdb_id":854550,"imdb_id":"tt15118036","original_title":"Piligrimai","original_language":"lt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2691','movie',2691,'{"id":2691,"title":"The Peacock’s Paradise","director":"Laura Bispuri","year":2021,"tmdb_id":832284,"imdb_id":"tt13757758","original_title":"Il paradiso del pavone","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2692','movie',2692,'{"id":2692,"title":"The Falls","director":"Chung Mong-hong","year":2021,"tmdb_id":852355,"imdb_id":"tt15119668","original_title":"瀑布","original_language":"zh","alternate_titles":["Pubu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2693','movie',2693,'{"id":2693,"title":"The Hole in the Fence","director":"Joaquín del Paso","year":2021,"tmdb_id":854554,"imdb_id":"tt12579120","original_title":"El hoyo en la cerca","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2694','movie',2694,'{"id":2694,"title":"Amira","director":"Mohamed Diab","year":2021,"tmdb_id":796162,"imdb_id":"tt12244822","original_title":"أميرة","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2695','movie',2695,'{"id":2695,"title":"Full Time","director":"Eric Gravel","year":2021,"tmdb_id":833417,"imdb_id":"tt13269580","original_title":"À plein temps","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2696','movie',2696,'{"id":2696,"title":"107 Mothers","director":"Peter Kerekeš","year":2021,"tmdb_id":854567,"imdb_id":"tt15119676","original_title":"Цензорка","original_language":"uk","alternate_titles":["Cenzorka"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2697','movie',2697,'{"id":2697,"title":"Vera Dreams of the Sea","director":"Kaltrina Krasniqi","year":2021,"tmdb_id":854569,"imdb_id":"tt10166880","original_title":"Vera andrron detin","original_language":"sq","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2698','movie',2698,'{"id":2698,"title":"Promises","director":"Thomas Kruithof","year":2021,"tmdb_id":786918,"imdb_id":"tt13846472","original_title":"Les Promesses","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2699','movie',2699,'{"id":2699,"title":"White Building","director":"Kavich Neang","year":2021,"tmdb_id":796157,"imdb_id":"tt11813228","original_title":"ប៊ូឌីញ ស","original_language":"km","alternate_titles":["Bodeng sar"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2700','movie',2700,'{"id":2700,"title":"Anatomy of Time","director":"Jakrawal Nilthamrong","year":2021,"tmdb_id":796150,"imdb_id":"tt13153782","original_title":"เวลา","original_language":"th","alternate_titles":["Wela"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2701','movie',2701,'{"id":2701,"title":"The Other Tom","director":"Rodrigo Plá, Laura Santullo","year":2021,"tmdb_id":772437,"imdb_id":"tt9056484","original_title":"El otro Tom","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2702','movie',2702,'{"id":2702,"title":"The Great Movement","director":"Kiro Russo","year":2021,"tmdb_id":854572,"imdb_id":"tt15108354","original_title":"El Gran Movimiento","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2703','movie',2703,'{"id":2703,"title":"Once Upon a Time in Calcutta","director":"Aditya Vikram Sengupta","year":2021,"tmdb_id":720035,"imdb_id":"tt12381206","original_title":"মায়ানগর","original_language":"bn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2704','movie',2704,'{"id":2704,"title":"Rhino","director":"Oleh Sentsov","year":2021,"tmdb_id":807888,"imdb_id":"tt3781118","original_title":"Носоріг","original_language":"uk","alternate_titles":["Nosorih"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2705','movie',2705,'{"id":2705,"title":"True Things","director":"Harry Wootliff","year":2021,"tmdb_id":682533,"imdb_id":"tt10310074","original_title":"True Things","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2706','movie',2706,'{"id":2706,"title":"Lord of the Ants","director":"Gianni Amelio","year":2022,"tmdb_id":840098,"imdb_id":"tt14575898","original_title":"Il signore delle formiche","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2707','movie',2707,'{"id":2707,"title":"L''immensità","director":"Emanuele Crialese","year":2022,"tmdb_id":770724,"imdb_id":"tt13051724","original_title":"L''immensità","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2708','movie',2708,'{"id":2708,"title":"Saint Omer","director":"Alice Diop","year":2022,"tmdb_id":925943,"imdb_id":"tt15376894","original_title":"Saint Omer","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2709','movie',2709,'{"id":2709,"title":"Love Life","director":"Koji Fukada","year":2022,"tmdb_id":927594,"imdb_id":"tt18235306","original_title":"LOVE LIFE","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2710','movie',2710,'{"id":2710,"title":"Athena","director":"Romain Gavras","year":2022,"tmdb_id":852046,"imdb_id":"tt15445056","original_title":"Athena","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2711','movie',2711,'{"id":2711,"title":"The Eternal Daughter","director":"Joanna Hogg","year":2022,"tmdb_id":790867,"imdb_id":"tt13874422","original_title":"The Eternal Daughter","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2712','movie',2712,'{"id":2712,"title":"Beyond The Wall","director":"Vahid Jalilvand","year":2022,"tmdb_id":1004664,"imdb_id":"tt13920988","original_title":"شب، داخلی، دیوار","original_language":"fa","alternate_titles":["Shab, Dakheli, Divar"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2713','movie',2713,'{"id":2713,"title":"Chiara","director":"Susanna Nicchiarelli","year":2022,"tmdb_id":910782,"imdb_id":"tt15027532","original_title":"Chiara","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2714','movie',2714,'{"id":2714,"title":"Monica","director":"Andrea Pallaoro","year":2022,"tmdb_id":540549,"imdb_id":"tt6337816","original_title":"Monica","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2715','movie',2715,'{"id":2715,"title":"No Bears","director":"Jafar Panahi","year":2022,"tmdb_id":974521,"imdb_id":"tt20205236","original_title":"خرس نیست","original_language":"fa","alternate_titles":["Khers nist"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2716','movie',2716,'{"id":2716,"title":"A Couple","director":"Frederick Wiseman","year":2022,"tmdb_id":1004657,"imdb_id":"tt21374862","original_title":"Un Couple","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2717','movie',2717,'{"id":2717,"title":"Our Ties","director":"Roschdy Zem","year":2022,"tmdb_id":971594,"imdb_id":"tt21372086","original_title":"Les Miens","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2718','movie',2718,'{"id":2718,"title":"Other People''s Children","director":"Rebecca Zlotowski","year":2022,"tmdb_id":803694,"imdb_id":"tt15403712","original_title":"Les Enfants des autres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2719','movie',2719,'{"id":2719,"title":"Victim","director":"Michal Blaško","year":2022,"tmdb_id":1004895,"imdb_id":"tt10687052","original_title":"Obeť","original_language":"sk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2720','movie',2720,'{"id":2720,"title":"On the Fringe","director":"Juan Diego Botto","year":2022,"tmdb_id":714339,"imdb_id":"tt12306964","original_title":"En los márgenes","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2721','movie',2721,'{"id":2721,"title":"Trenque Lauquen","director":"Laura Citarella","year":2022,"tmdb_id":715742,"imdb_id":"tt21378968","original_title":"Trenque Lauquen","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2722','movie',2722,'{"id":2722,"title":"Vera","director":"Rainer Frimmel, Tizza Covi","year":2022,"tmdb_id":1005279,"imdb_id":"tt21377368","original_title":"Vera","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2723','movie',2723,'{"id":2723,"title":"Innocence","director":"Guy Davidi","year":2022,"tmdb_id":1005290,"imdb_id":"tt21377522","original_title":"Innocence","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2724','movie',2724,'{"id":2724,"title":"Princess","director":"Roberto De Paolis","year":2022,"tmdb_id":936373,"imdb_id":"tt14362502","original_title":"Princess","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2725','movie',2725,'{"id":2725,"title":"Blanquita","director":"Fernando Guzzoni","year":2022,"tmdb_id":577921,"imdb_id":"tt21376206","original_title":"Blanquita","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2726','movie',2726,'{"id":2726,"title":"For My Country","director":"Rachid Hami","year":2022,"tmdb_id":958219,"imdb_id":"tt19891500","original_title":"Pour la France","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2727','movie',2727,'{"id":2727,"title":"A Man","director":"Kei Ishikawa","year":2022,"tmdb_id":869886,"imdb_id":"tt20251822","original_title":"ある男","original_language":"ja","alternate_titles":["Aru otoko"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2728','movie',2728,'{"id":2728,"title":"Bread and Salt","director":"Damian Kocur","year":2022,"tmdb_id":999119,"imdb_id":"tt15062756","original_title":"Chleb i sól","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2729','movie',2729,'{"id":2729,"title":"Luxembourg, Luxembourg","director":"Antonio Lukich","year":2022,"tmdb_id":1005141,"imdb_id":"tt19783714","original_title":"Люксембург, Люксембург","original_language":"uk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2730','movie',2730,'{"id":2730,"title":"Burning Hearts","director":"Pippo Mezzapesa","year":2022,"tmdb_id":870724,"imdb_id":"tt14091854","original_title":"Ti mangio il cuore","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2731','movie',2731,'{"id":2731,"title":"To the North","director":"Mihai Mincan","year":2022,"tmdb_id":1000618,"imdb_id":"tt21378332","original_title":"Spre nord","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2732','movie',2732,'{"id":2732,"title":"Autobiography","director":"Makbul Mubarak","year":2022,"tmdb_id":859981,"imdb_id":"tt21372280","original_title":"Autobiography","original_language":"id","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2733','movie',2733,'{"id":2733,"title":"La Syndicaliste","director":"Jean-Paul Salomé","year":2022,"tmdb_id":925714,"imdb_id":"tt16987062","original_title":"La Syndicaliste","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2734','movie',2734,'{"id":2734,"title":"World War III","director":"Houman Seyyedi","year":2022,"tmdb_id":1005299,"imdb_id":"tt21378744","original_title":"جنگ جهانی سوم","original_language":"fa","alternate_titles":["Jang-e jahani sevom"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2735','movie',2735,'{"id":2735,"title":"The Happiest Man in the World","director":"Teona Strugar Mitevska","year":2022,"tmdb_id":936363,"imdb_id":"tt21138322","original_title":"Најсреќниот човек на светот","original_language":"bs","alternate_titles":["NajsreЌniot čovek na svetot / Najsretniji čovjek"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2736','movie',2736,'{"id":2736,"title":"The Bride","director":"Sérgio Tréfaut","year":2022,"tmdb_id":1005309,"imdb_id":"tt16449354","original_title":"A Noiva","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2737','movie',2737,'{"id":2737,"title":"Dogman","director":"Luc Besson","year":2023,"tmdb_id":944401,"imdb_id":"tt17009348","original_title":"Dogman","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2738','movie',2738,'{"id":2738,"title":"Out of Season","director":"Stéphane Brizé","year":2023,"tmdb_id":1044741,"imdb_id":"tt27704325","original_title":"Hors-Saison","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2739','movie',2739,'{"id":2739,"title":"Enea","director":"Pietro Castellitto","year":2023,"tmdb_id":1057999,"imdb_id":"tt27219440","original_title":"Enea","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2740','movie',2740,'{"id":2740,"title":"Finally Dawn","director":"Saverio Costanzo","year":2023,"tmdb_id":1013869,"imdb_id":"tt21824548","original_title":"Finalmente l''alba","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2741','movie',2741,'{"id":2741,"title":"The Commander","director":"Edoardo De Angelis","year":2023,"tmdb_id":1047016,"imdb_id":"tt23573936","original_title":"Comandante","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2742','movie',2742,'{"id":2742,"title":"Lubo","director":"Giorgio Diritti","year":2023,"tmdb_id":1023962,"imdb_id":"tt4707780","original_title":"Lubo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2743','movie',2743,'{"id":2743,"title":"Origin","director":"Ava DuVernay","year":2023,"tmdb_id":753336,"imdb_id":"tt13321244","original_title":"Origin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2744','movie',2744,'{"id":2744,"title":"The Killer","director":"David Fincher","year":2023,"tmdb_id":800158,"imdb_id":"tt1136617","original_title":"The Killer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2745','movie',2745,'{"id":2745,"title":"The Universal Theory","director":"Timm Kröger","year":2023,"tmdb_id":932801,"imdb_id":"tt18453866","original_title":"Die Theorie von Allem","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2746','movie',2746,'{"id":2746,"title":"El Conde","director":"Pablo Larraín","year":2023,"tmdb_id":991708,"imdb_id":"tt21113540","original_title":"El conde","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2747','movie',2747,'{"id":2747,"title":"Ferrari","director":"Michael Mann","year":2023,"tmdb_id":365620,"imdb_id":"tt3758542","original_title":"Ferrari","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2748','movie',2748,'{"id":2748,"title":"Adagio","director":"Stefano Sollima","year":2023,"tmdb_id":1021803,"imdb_id":"tt22001304","original_title":"Adagio","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2749','movie',2749,'{"id":2749,"title":"Woman of...","director":"Małgorzata Szumowska, Michał Englert","year":2023,"tmdb_id":1156130,"imdb_id":"tt26746630","original_title":"Kobieta z...","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2750','movie',2750,'{"id":2750,"title":"Holly","director":"Fien Troch","year":2023,"tmdb_id":989496,"imdb_id":"tt13866832","original_title":"Holly","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2751','movie',2751,'{"id":2751,"title":"Upon Open Sky","director":"Mariana Arriaga, Santiago Arriaga","year":2023,"tmdb_id":1156151,"imdb_id":"tt28494884","original_title":"A cielo abierto","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2752','movie',2752,'{"id":2752,"title":"Almost Paradise","director":"Enrico Maria Artale","year":2023,"tmdb_id":1070997,"imdb_id":"tt21905608","original_title":"El Paraíso","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2753','movie',2753,'{"id":2753,"title":"Behind the Mountains","director":"Mohamed Ben Attia","year":2023,"tmdb_id":1090097,"imdb_id":"tt26771225","original_title":"وراء الجبل","original_language":"ar","alternate_titles":["Oura el jbel"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2754','movie',2754,'{"id":2754,"title":"The Red Suitcase","director":"Fidel Devkota","year":2023,"tmdb_id":1156166,"imdb_id":"tt28495418","original_title":"The Red Suitcase","original_language":"ne","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2755','movie',2755,'{"id":2755,"title":"Paradise Is Burning","director":"Mika Gustafson","year":2023,"tmdb_id":872508,"imdb_id":"tt21874690","original_title":"Paradiset brinner","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2756','movie',2756,'{"id":2756,"title":"The Featherweight","director":"Robert Kolodny","year":2023,"tmdb_id":900376,"imdb_id":"tt2352396","original_title":"The Featherweight","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2757','movie',2757,'{"id":2757,"title":"Nowhere","director":"Simone Massi","year":2023,"tmdb_id":1000092,"imdb_id":"tt28254574","original_title":"Invelle","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2758','movie',2758,'{"id":2758,"title":"Hesitation Wound","director":"Selman Nacar","year":2023,"tmdb_id":1025377,"imdb_id":"tt21482312","original_title":"Tereddüt Çizgisi","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2759','movie',2759,'{"id":2759,"title":"Tatami","director":"Guy Nattiv, Zar Amir Ebrahimi","year":2023,"tmdb_id":1084066,"imdb_id":"tt26674818","original_title":"Tatami","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2760','movie',2760,'{"id":2760,"title":"Heartless","director":"Tião, Nara Normande","year":2023,"tmdb_id":603531,"imdb_id":"tt26245778","original_title":"Sem Coração","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2761','movie',2761,'{"id":2761,"title":"An Endless Sunday","director":"Alain Parroni","year":2023,"tmdb_id":1156219,"imdb_id":"tt28497330","original_title":"Una sterminata domenica","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2762','movie',2762,'{"id":2762,"title":"City of Wind","director":"Lkhagvadulam Purev-Ochir","year":2023,"tmdb_id":730256,"imdb_id":"tt27816866","original_title":"Сэр сэр салхи","original_language":"mn","alternate_titles":["Sèr sèr salhi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2763','movie',2763,'{"id":2763,"title":"Explanation for Everything","director":"Gábor Reisz","year":2023,"tmdb_id":1075989,"imdb_id":"tt27788968","original_title":"Magyarázat mindenre","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2764','movie',2764,'{"id":2764,"title":"Gasoline Rainbow","director":"Bill Ross, Turner Ross","year":2023,"tmdb_id":1156110,"imdb_id":"tt28494031","original_title":"Gasoline Rainbow","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2765','movie',2765,'{"id":2765,"title":"For Night Will Come","director":"Céline Rouzet","year":2023,"tmdb_id":1158416,"imdb_id":"tt22986716","original_title":"En attendant la nuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2766','movie',2766,'{"id":2766,"title":"Shadow of Fire","director":"Shinya Tsukamoto","year":2023,"tmdb_id":1077877,"imdb_id":"tt28497692","original_title":"ほかげ","original_language":"ja","alternate_titles":["Hokage"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2767','movie',2767,'{"id":2767,"title":"Dormitory","director":"Nehir Tuna","year":2023,"tmdb_id":1156208,"imdb_id":"tt20236042","original_title":"Yurt","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2768','movie',2768,'{"id":2768,"title":"Battlefield","director":"Gianni Amelio","year":2024,"tmdb_id":1174246,"imdb_id":"tt31322960","original_title":"Campo di battaglia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2769','movie',2769,'{"id":2769,"title":"Sicilian Letters","director":"Fabio Grassadonia, Antonio Piazza","year":2024,"tmdb_id":1148663,"imdb_id":"tt28297850","original_title":"Iddu - L''ultimo padrino","original_language":"it","alternate_titles":["Iddu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2770','movie',2770,'{"id":2770,"title":"Love","director":"Dag Johan Haugerud","year":2024,"tmdb_id":1228685,"imdb_id":"tt30810792","original_title":"Kjærlighet","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2771','movie',2771,'{"id":2771,"title":"Kill the Jockey","director":"Luis Ortega","year":2024,"tmdb_id":1104937,"imdb_id":"tt28231777","original_title":"El jockey","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2772','movie',2772,'{"id":2772,"title":"Diva Futura","director":"Giulia Louise Steigerwalt","year":2024,"tmdb_id":1141163,"imdb_id":"tt31105878","original_title":"Diva Futura","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2773','movie',2773,'{"id":2773,"title":"Harvest","director":"Athina Rachel Tsangari","year":2024,"tmdb_id":936946,"imdb_id":"tt13610344","original_title":"Harvest","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2774','movie',2774,'{"id":2774,"title":"Youth (Homecoming)","director":"Wang Bing","year":2024,"tmdb_id":1319196,"imdb_id":"tt33029375","original_title":"青春（归）","original_language":"zh","alternate_titles":["Qing Chun: Gui"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2775','movie',2775,'{"id":2775,"title":"Stranger Eyes","director":"Yeo Siew Hua","year":2024,"tmdb_id":948184,"imdb_id":"tt28419037","original_title":"默視錄","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2776','movie',2776,'{"id":2776,"title":"My Everything","director":"Anne-Sophie Bailly","year":2024,"tmdb_id":1032765,"imdb_id":"tt21993128","original_title":"Mon Inséparable","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2777','movie',2777,'{"id":2777,"title":"Aicha","director":"Mehdi M. Barsaoui","year":2024,"tmdb_id":1108795,"imdb_id":"tt27907962","original_title":"عايشة","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2778','movie',2778,'{"id":2778,"title":"Happy Holidays","director":"Scandar Copti","year":2024,"tmdb_id":1195108,"imdb_id":"tt28522171","original_title":"ينعاد عليكو","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2779','movie',2779,'{"id":2779,"title":"Familia","director":"Francesco Costabile","year":2024,"tmdb_id":1313006,"imdb_id":"tt31710037","original_title":"Familia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2780','movie',2780,'{"id":2780,"title":"One of Those Days When Hemme Dies","director":"Murat Fıratoğlu","year":2024,"tmdb_id":1320279,"imdb_id":"tt33030347","original_title":"Hemme’nin Öldüğü Günlerden Biri","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2781','movie',2781,'{"id":2781,"title":"Familiar Touch","director":"Sarah Friedland","year":2024,"tmdb_id":1265717,"imdb_id":"tt32928666","original_title":"Familiar Touch","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2782','movie',2782,'{"id":2782,"title":"Carissa","director":"Jason Jacobs, Devon Delmar","year":2024,"tmdb_id":1195113,"imdb_id":"tt28522108","original_title":"Carissa","original_language":"af","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2783','movie',2783,'{"id":2783,"title":"Wishing on a Star","director":"Peter Kerekeš","year":2024,"tmdb_id":1315541,"imdb_id":"tt33030357","original_title":"Wishing on a Star","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2784','movie',2784,'{"id":2784,"title":"Mistress Dispeller","director":"Elizabeth Lo","year":2024,"tmdb_id":951055,"imdb_id":"tt22060498","original_title":"Mistress Dispeller","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2785','movie',2785,'{"id":2785,"title":"Feeling Better","director":"Valerio Mastandrea","year":2024,"tmdb_id":1319473,"imdb_id":"tt29429122","original_title":"Nonostante","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2786','movie',2786,'{"id":2786,"title":"Of Dogs and Men","director":"Dani Rosenberg","year":2024,"tmdb_id":1299351,"imdb_id":"tt32432999","original_title":"על כלבים ואנשים","original_language":"he","alternate_titles":["Al klavim veanashim"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2787','movie',2787,'{"id":2787,"title":"Pavements","director":"Alex Ross Perry","year":2024,"tmdb_id":1063307,"imdb_id":"tt30253514","original_title":"Pavements","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2788','movie',2788,'{"id":2788,"title":"The Ties That Bind Us","director":"Carine Tardieu","year":2024,"tmdb_id":1096642,"imdb_id":"tt33030403","original_title":"L''Attachement","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2789','movie',2789,'{"id":2789,"title":"Nineteen","director":"Giovanni Tortorici","year":2024,"tmdb_id":1118770,"imdb_id":"tt27706317","original_title":"Diciannove","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2790','movie',2790,'{"id":2790,"title":"Divine Comedy","director":"Ali Asgari","year":2025,"tmdb_id":1517062,"imdb_id":"tt37660493","original_title":"کمدی الهی","original_language":"fa","alternate_titles":["Komedie elahi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2791','movie',2791,'{"id":2791,"title":"The Ivy","director":"Ana Cristina Barragán","year":2025,"tmdb_id":794228,"imdb_id":"tt38045572","original_title":"Hiedra","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2792','movie',2792,'{"id":2792,"title":"The Kidnapping of Arabella","director":"Carolina Cavalli","year":2025,"tmdb_id":1339666,"imdb_id":"tt33292601","original_title":"Il rapimento di Arabella","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2793','movie',2793,'{"id":2793,"title":"Strange River","director":"Jaume Claret Muxart","year":2025,"tmdb_id":1025389,"imdb_id":"tt33023305","original_title":"Estrany riu","original_language":"ca","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2794','movie',2794,'{"id":2794,"title":"Lost Land","director":"Akio Fujimoto","year":2025,"tmdb_id":1517120,"imdb_id":"tt37660506","original_title":"Harà Watan","original_language":"bn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2795','movie',2795,'{"id":2795,"title":"The Site","director":"Akihiro Hata","year":2025,"tmdb_id":1000879,"imdb_id":"tt15435004","original_title":"Grand Ciel","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2796','movie',2796,'{"id":2796,"title":"Late Fame","director":"Kent Jones","year":2025,"tmdb_id":1285895,"imdb_id":"tt32298494","original_title":"Late Fame","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2797','movie',2797,'{"id":2797,"title":"Milk Teeth","director":"Mihai Mincan","year":2025,"tmdb_id":1517125,"imdb_id":"tt28084384","original_title":"Dinți de lapte","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2798','movie',2798,'{"id":2798,"title":"Pin de Fartie","director":"Alejo Moguillansky","year":2025,"tmdb_id":1517070,"imdb_id":"tt37660507","original_title":"Pin de Fartie","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2799','movie',2799,'{"id":2799,"title":"Father","director":"Tereza Nvotová","year":2025,"tmdb_id":1516518,"imdb_id":"tt28876088","original_title":"Otec","original_language":"sk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2800','movie',2800,'{"id":2800,"title":"Songs of Forgotten Trees","director":"Anuparna Roy","year":2025,"tmdb_id":1517129,"imdb_id":"tt37660512","original_title":"Songs of Forgotten Trees","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2801','movie',2801,'{"id":2801,"title":"A Year of School","director":"Laura Samani","year":2025,"tmdb_id":1442922,"imdb_id":"tt31778123","original_title":"Un anno di scuola","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2802','movie',2802,'{"id":2802,"title":"The Souffleur","director":"Gastón Solnicki","year":2025,"tmdb_id":1418361,"imdb_id":"tt33305621","original_title":"The Souffleur","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2803','movie',2803,'{"id":2803,"title":"Barrio Triste","director":"STILLZ","year":2025,"tmdb_id":1310573,"imdb_id":"tt37660515","original_title":"Barrio Triste","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2804','movie',2804,'{"id":2804,"title":"Human Resource","director":"Nawapol Thamrongrattanarit","year":2025,"tmdb_id":1319520,"imdb_id":"tt36948837","original_title":"พนักงานใหม่ (โปรดรับไว้พิจารณา)","original_language":"th","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2805','movie',2805,'{"id":2805,"title":"Funeral Casino Blues","director":"Roderick Warich","year":2025,"tmdb_id":1517064,"imdb_id":"tt37660518","original_title":"Funeral Casino Blues","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:522526','movie:2673') on conflict do nothing;
insert into public.media_provider_links values('movie:664506','movie:2674') on conflict do nothing;
insert into public.media_provider_links values('movie:807185','movie:2675') on conflict do nothing;
insert into public.media_provider_links values('movie:668640','movie:2676') on conflict do nothing;
insert into public.media_provider_links values('movie:660708','movie:2677') on conflict do nothing;
insert into public.media_provider_links values('movie:854359','movie:2678') on conflict do nothing;
insert into public.media_provider_links values('movie:660000','movie:2679') on conflict do nothing;
insert into public.media_provider_links values('movie:571468','movie:2680') on conflict do nothing;
insert into public.media_provider_links values('movie:668408','movie:2681') on conflict do nothing;
insert into public.media_provider_links values('movie:800368','movie:2682') on conflict do nothing;
insert into public.media_provider_links values('movie:788931','movie:2683') on conflict do nothing;
insert into public.media_provider_links values('movie:818621','movie:2684') on conflict do nothing;
insert into public.media_provider_links values('movie:643532','movie:2685') on conflict do nothing;
insert into public.media_provider_links values('movie:828920','movie:2686') on conflict do nothing;
insert into public.media_provider_links values('movie:617246','movie:2687') on conflict do nothing;
insert into public.media_provider_links values('movie:854317','movie:2688') on conflict do nothing;
insert into public.media_provider_links values('movie:854323','movie:2689') on conflict do nothing;
insert into public.media_provider_links values('movie:854550','movie:2690') on conflict do nothing;
insert into public.media_provider_links values('movie:832284','movie:2691') on conflict do nothing;
insert into public.media_provider_links values('movie:852355','movie:2692') on conflict do nothing;
insert into public.media_provider_links values('movie:854554','movie:2693') on conflict do nothing;
insert into public.media_provider_links values('movie:796162','movie:2694') on conflict do nothing;
insert into public.media_provider_links values('movie:833417','movie:2695') on conflict do nothing;
insert into public.media_provider_links values('movie:854567','movie:2696') on conflict do nothing;
insert into public.media_provider_links values('movie:854569','movie:2697') on conflict do nothing;
insert into public.media_provider_links values('movie:786918','movie:2698') on conflict do nothing;
insert into public.media_provider_links values('movie:796157','movie:2699') on conflict do nothing;
insert into public.media_provider_links values('movie:796150','movie:2700') on conflict do nothing;
insert into public.media_provider_links values('movie:772437','movie:2701') on conflict do nothing;
insert into public.media_provider_links values('movie:854572','movie:2702') on conflict do nothing;
insert into public.media_provider_links values('movie:720035','movie:2703') on conflict do nothing;
insert into public.media_provider_links values('movie:807888','movie:2704') on conflict do nothing;
insert into public.media_provider_links values('movie:682533','movie:2705') on conflict do nothing;
insert into public.media_provider_links values('movie:840098','movie:2706') on conflict do nothing;
insert into public.media_provider_links values('movie:770724','movie:2707') on conflict do nothing;
insert into public.media_provider_links values('movie:925943','movie:2708') on conflict do nothing;
insert into public.media_provider_links values('movie:927594','movie:2709') on conflict do nothing;
insert into public.media_provider_links values('movie:852046','movie:2710') on conflict do nothing;
insert into public.media_provider_links values('movie:790867','movie:2711') on conflict do nothing;
insert into public.media_provider_links values('movie:1004664','movie:2712') on conflict do nothing;
insert into public.media_provider_links values('movie:910782','movie:2713') on conflict do nothing;
insert into public.media_provider_links values('movie:540549','movie:2714') on conflict do nothing;
insert into public.media_provider_links values('movie:974521','movie:2715') on conflict do nothing;
insert into public.media_provider_links values('movie:1004657','movie:2716') on conflict do nothing;
insert into public.media_provider_links values('movie:971594','movie:2717') on conflict do nothing;
insert into public.media_provider_links values('movie:803694','movie:2718') on conflict do nothing;
insert into public.media_provider_links values('movie:1004895','movie:2719') on conflict do nothing;
insert into public.media_provider_links values('movie:714339','movie:2720') on conflict do nothing;
insert into public.media_provider_links values('movie:715742','movie:2721') on conflict do nothing;
insert into public.media_provider_links values('movie:1005279','movie:2722') on conflict do nothing;
insert into public.media_provider_links values('movie:1005290','movie:2723') on conflict do nothing;
insert into public.media_provider_links values('movie:936373','movie:2724') on conflict do nothing;
insert into public.media_provider_links values('movie:577921','movie:2725') on conflict do nothing;
insert into public.media_provider_links values('movie:958219','movie:2726') on conflict do nothing;
insert into public.media_provider_links values('movie:869886','movie:2727') on conflict do nothing;
insert into public.media_provider_links values('movie:999119','movie:2728') on conflict do nothing;
insert into public.media_provider_links values('movie:1005141','movie:2729') on conflict do nothing;
insert into public.media_provider_links values('movie:870724','movie:2730') on conflict do nothing;
insert into public.media_provider_links values('movie:1000618','movie:2731') on conflict do nothing;
insert into public.media_provider_links values('movie:859981','movie:2732') on conflict do nothing;
insert into public.media_provider_links values('movie:925714','movie:2733') on conflict do nothing;
insert into public.media_provider_links values('movie:1005299','movie:2734') on conflict do nothing;
insert into public.media_provider_links values('movie:936363','movie:2735') on conflict do nothing;
insert into public.media_provider_links values('movie:1005309','movie:2736') on conflict do nothing;
insert into public.media_provider_links values('movie:944401','movie:2737') on conflict do nothing;
insert into public.media_provider_links values('movie:1044741','movie:2738') on conflict do nothing;
insert into public.media_provider_links values('movie:1057999','movie:2739') on conflict do nothing;
insert into public.media_provider_links values('movie:1013869','movie:2740') on conflict do nothing;
insert into public.media_provider_links values('movie:1047016','movie:2741') on conflict do nothing;
insert into public.media_provider_links values('movie:1023962','movie:2742') on conflict do nothing;
insert into public.media_provider_links values('movie:753336','movie:2743') on conflict do nothing;
insert into public.media_provider_links values('movie:800158','movie:2744') on conflict do nothing;
insert into public.media_provider_links values('movie:932801','movie:2745') on conflict do nothing;
insert into public.media_provider_links values('movie:991708','movie:2746') on conflict do nothing;
insert into public.media_provider_links values('movie:365620','movie:2747') on conflict do nothing;
insert into public.media_provider_links values('movie:1021803','movie:2748') on conflict do nothing;
insert into public.media_provider_links values('movie:1156130','movie:2749') on conflict do nothing;
insert into public.media_provider_links values('movie:989496','movie:2750') on conflict do nothing;
insert into public.media_provider_links values('movie:1156151','movie:2751') on conflict do nothing;
insert into public.media_provider_links values('movie:1070997','movie:2752') on conflict do nothing;
insert into public.media_provider_links values('movie:1090097','movie:2753') on conflict do nothing;
insert into public.media_provider_links values('movie:1156166','movie:2754') on conflict do nothing;
insert into public.media_provider_links values('movie:872508','movie:2755') on conflict do nothing;
insert into public.media_provider_links values('movie:900376','movie:2756') on conflict do nothing;
insert into public.media_provider_links values('movie:1000092','movie:2757') on conflict do nothing;
insert into public.media_provider_links values('movie:1025377','movie:2758') on conflict do nothing;
insert into public.media_provider_links values('movie:1084066','movie:2759') on conflict do nothing;
insert into public.media_provider_links values('movie:603531','movie:2760') on conflict do nothing;
insert into public.media_provider_links values('movie:1156219','movie:2761') on conflict do nothing;
insert into public.media_provider_links values('movie:730256','movie:2762') on conflict do nothing;
insert into public.media_provider_links values('movie:1075989','movie:2763') on conflict do nothing;
insert into public.media_provider_links values('movie:1156110','movie:2764') on conflict do nothing;
insert into public.media_provider_links values('movie:1158416','movie:2765') on conflict do nothing;
insert into public.media_provider_links values('movie:1077877','movie:2766') on conflict do nothing;
insert into public.media_provider_links values('movie:1156208','movie:2767') on conflict do nothing;
insert into public.media_provider_links values('movie:1174246','movie:2768') on conflict do nothing;
insert into public.media_provider_links values('movie:1148663','movie:2769') on conflict do nothing;
insert into public.media_provider_links values('movie:1228685','movie:2770') on conflict do nothing;
insert into public.media_provider_links values('movie:1104937','movie:2771') on conflict do nothing;
insert into public.media_provider_links values('movie:1141163','movie:2772') on conflict do nothing;
insert into public.media_provider_links values('movie:936946','movie:2773') on conflict do nothing;
insert into public.media_provider_links values('movie:1319196','movie:2774') on conflict do nothing;
insert into public.media_provider_links values('movie:948184','movie:2775') on conflict do nothing;
insert into public.media_provider_links values('movie:1032765','movie:2776') on conflict do nothing;
insert into public.media_provider_links values('movie:1108795','movie:2777') on conflict do nothing;
insert into public.media_provider_links values('movie:1195108','movie:2778') on conflict do nothing;
insert into public.media_provider_links values('movie:1313006','movie:2779') on conflict do nothing;
insert into public.media_provider_links values('movie:1320279','movie:2780') on conflict do nothing;
insert into public.media_provider_links values('movie:1265717','movie:2781') on conflict do nothing;
insert into public.media_provider_links values('movie:1195113','movie:2782') on conflict do nothing;
insert into public.media_provider_links values('movie:1315541','movie:2783') on conflict do nothing;
insert into public.media_provider_links values('movie:951055','movie:2784') on conflict do nothing;
insert into public.media_provider_links values('movie:1319473','movie:2785') on conflict do nothing;
insert into public.media_provider_links values('movie:1299351','movie:2786') on conflict do nothing;
insert into public.media_provider_links values('movie:1063307','movie:2787') on conflict do nothing;
insert into public.media_provider_links values('movie:1096642','movie:2788') on conflict do nothing;
insert into public.media_provider_links values('movie:1118770','movie:2789') on conflict do nothing;
insert into public.media_provider_links values('movie:1517062','movie:2790') on conflict do nothing;
insert into public.media_provider_links values('movie:794228','movie:2791') on conflict do nothing;
insert into public.media_provider_links values('movie:1339666','movie:2792') on conflict do nothing;
insert into public.media_provider_links values('movie:1025389','movie:2793') on conflict do nothing;
insert into public.media_provider_links values('movie:1517120','movie:2794') on conflict do nothing;
insert into public.media_provider_links values('movie:1000879','movie:2795') on conflict do nothing;
insert into public.media_provider_links values('movie:1285895','movie:2796') on conflict do nothing;
insert into public.media_provider_links values('movie:1517125','movie:2797') on conflict do nothing;
insert into public.media_provider_links values('movie:1517070','movie:2798') on conflict do nothing;
insert into public.media_provider_links values('movie:1516518','movie:2799') on conflict do nothing;
insert into public.media_provider_links values('movie:1517129','movie:2800') on conflict do nothing;
insert into public.media_provider_links values('movie:1442922','movie:2801') on conflict do nothing;
insert into public.media_provider_links values('movie:1418361','movie:2802') on conflict do nothing;
insert into public.media_provider_links values('movie:1310573','movie:2803') on conflict do nothing;
insert into public.media_provider_links values('movie:1319520','movie:2804') on conflict do nothing;
insert into public.media_provider_links values('movie:1517064','movie:2805') on conflict do nothing;
commit;

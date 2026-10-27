-- Cannes 2021–2025: 128 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:574078','movie:2545',574078),
('movie:454527','movie:2546',454527),
('movie:477044','movie:2547',477044),
('movie:662712','movie:2548',662712),
('movie:602334','movie:2549',602334),
('movie:662029','movie:2550',662029),
('movie:575764','movie:2551',575764),
('movie:764686','movie:2552',764686),
('movie:788942','movie:2553',788942),
('movie:820693','movie:2554',820693),
('movie:511819','movie:2555',511819),
('movie:797457','movie:2556',797457),
('movie:609490','movie:2557',609490),
('movie:763329','movie:2558',763329),
('movie:735726','movie:2559',735726),
('movie:608980','movie:2560',608980),
('movie:585378','movie:2561',585378),
('movie:835963','movie:2562',835963),
('movie:644089','movie:2563',644089),
('movie:820711','movie:2564',820711),
('movie:768058','movie:2565',768058),
('movie:836489','movie:2566',836489),
('movie:836491','movie:2567',836491),
('movie:835975','movie:2568',835975),
('movie:833393','movie:2569',833393),
('movie:788929','movie:2570',788929),
('movie:838885','movie:2571',838885),
('movie:676819','movie:2572',676819),
('movie:670981','movie:2573',670981),
('movie:695089','movie:2574',695089),
('movie:583198','movie:2575',583198),
('movie:836490','movie:2576',836490),
('movie:660942','movie:2577',660942),
('movie:785209','movie:2578',785209),
('movie:504600','movie:2579',504600),
('movie:833419','movie:2580',833419),
('movie:615952','movie:2581',615952),
('movie:736732','movie:2582',736732),
('movie:819876','movie:2583',819876),
('movie:836202','movie:2584',836202),
('movie:889699','movie:2585',889699),
('movie:803700','movie:2586',803700),
('movie:962558','movie:2587',962558),
('movie:848958','movie:2588',848958),
('movie:541724','movie:2589',541724),
('movie:691214','movie:2590',691214),
('movie:919570','movie:2591',919570),
('movie:790416','movie:2592',790416),
('movie:603204','movie:2593',603204),
('movie:914203','movie:2594',914203),
('movie:926889','movie:2595',926889),
('movie:788977','movie:2596',788977),
('movie:901358','movie:2597',901358),
('movie:962568','movie:2598',962568),
('movie:962565','movie:2599',962565),
('movie:849242','movie:2600',849242),
('movie:962571','movie:2601',962571),
('movie:682152','movie:2602',682152),
('movie:958279','movie:2603',958279),
('movie:962543','movie:2604',962543),
('movie:958291','movie:2605',958291),
('movie:962562','movie:2606',962562),
('movie:958487','movie:2607',958487),
('movie:843093','movie:2608',843093),
('movie:952701','movie:2609',952701),
('movie:936378','movie:2610',936378),
('movie:788734','movie:2611',788734),
('movie:812025','movie:2612',812025),
('movie:848791','movie:2613',848791),
('movie:967874','movie:2614',967874),
('movie:960206','movie:2615',960206),
('movie:962566','movie:2616',962566),
('movie:995806','movie:2617',995806),
('movie:628922','movie:2618',628922),
('movie:938250','movie:2619',938250),
('movie:848439','movie:2620',848439),
('movie:925263','movie:2621',925263),
('movie:1050035','movie:2622',1050035),
('movie:812037','movie:2623',812037),
('movie:1000058','movie:2624',1000058),
('movie:493514','movie:2625',493514),
('movie:801112','movie:2626',801112),
('movie:889818','movie:2627',889818),
('movie:1112545','movie:2628',1112545),
('movie:1112543','movie:2629',1112543),
('movie:1115379','movie:2630',1115379),
('movie:1028684','movie:2631',1028684),
('movie:986855','movie:2632',986855),
('movie:1112527','movie:2633',1112527),
('movie:943134','movie:2634',943134),
('movie:1000130','movie:2635',1000130),
('movie:989589','movie:2636',989589),
('movie:966488','movie:2637',966488),
('movie:995746','movie:2638',995746),
('movie:1001377','movie:2639',1001377),
('movie:912520','movie:2640',912520),
('movie:923150','movie:2641',923150),
('movie:937161','movie:2642',937161),
('movie:1000409','movie:2643',1000409),
('movie:1108336','movie:2644',1108336),
('movie:959604','movie:2645',959604),
('movie:495278','movie:2646',495278),
('movie:1145608','movie:2647',1145608),
('movie:1161879','movie:2648',1161879),
('movie:1113583','movie:2649',1113583),
('movie:1278338','movie:2650',1278338),
('movie:1144681','movie:2651',1144681),
('movie:1056648','movie:2652',1056648),
('movie:1079311','movie:2653',1079311),
('movie:1267822','movie:2654',1267822),
('movie:1001684','movie:2655',1001684),
('movie:1213982','movie:2656',1213982),
('movie:1212337','movie:2657',1212337),
('movie:1059010','movie:2658',1059010),
('movie:1257409','movie:2659',1257409),
('movie:1012241','movie:2660',1012241),
('movie:846586','movie:2661',846586),
('movie:1337148','movie:2662',1337148),
('movie:1212271','movie:2663',1212271),
('movie:1227739','movie:2664',1227739),
('movie:1461539','movie:2665',1461539),
('movie:1290424','movie:2666',1290424),
('movie:1462322','movie:2667',1462322),
('movie:1290450','movie:2668',1290450),
('movie:1262773','movie:2669',1262773),
('movie:1218412','movie:2670',1218412),
('movie:1078822','movie:2671',1078822),
('movie:1337985','movie:2672',1337985)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2545','movie',2545,'{"id":2545,"title":"The Story of My Wife","director":"Ildikó Enyedi","year":2021,"tmdb_id":574078,"imdb_id":"tt8205028","original_title":"A feleségem története","original_language":"hu","alternate_titles":["A FELESÉGEM TÖRTÉNETE/THE STORY OF MY WIFE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2546','movie',2546,'{"id":2546,"title":"Benedetta","director":"Paul Verhoeven","year":2021,"tmdb_id":454527,"imdb_id":"tt6823148","original_title":"Benedetta","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2547','movie',2547,'{"id":2547,"title":"Bergman Island","director":"Mia Hansen-Løve","year":2021,"tmdb_id":477044,"imdb_id":"tt6910282","original_title":"Bergman Island","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2548','movie',2548,'{"id":2548,"title":"Flag Day","director":"Sean Penn","year":2021,"tmdb_id":662712,"imdb_id":"tt2304637","original_title":"Flag Day","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2549','movie',2549,'{"id":2549,"title":"France","director":"Bruno Dumont","year":2021,"tmdb_id":602334,"imdb_id":"tt9714030","original_title":"France","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2550','movie',2550,'{"id":2550,"title":"Ahed''s Knee","director":"Nadav Lapid","year":2021,"tmdb_id":662029,"imdb_id":"tt12494638","original_title":"הברך","original_language":"he","alternate_titles":["HA’BERECH"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2551','movie',2551,'{"id":2551,"title":"Casablanca Beats","director":"Nabil Ayouch","year":2021,"tmdb_id":575764,"imdb_id":"tt14773800","original_title":"Haut et fort","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2552','movie',2552,'{"id":2552,"title":"The Divide","director":"Catherine Corsini","year":2021,"tmdb_id":764686,"imdb_id":"tt13321730","original_title":"La Fracture","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2553','movie',2553,'{"id":2553,"title":"The Restless","director":"Joachim Lafosse","year":2021,"tmdb_id":788942,"imdb_id":"tt11611486","original_title":"Les Intranquilles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2554','movie',2554,'{"id":2554,"title":"Lingui, the Sacred Bonds","director":"Mahamat-Saleh Haroun","year":2021,"tmdb_id":820693,"imdb_id":"tt13846546","original_title":"Lingui : les liens sacrés","original_language":"fr","alternate_titles":["LINGUI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2555','movie',2555,'{"id":2555,"title":"Memoria","director":"Apichatpong Weerasethakul","year":2021,"tmdb_id":511819,"imdb_id":"tt8399288","original_title":"Memoria","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2556','movie',2556,'{"id":2556,"title":"Nitram","director":"Justin Kurzel","year":2021,"tmdb_id":797457,"imdb_id":"tt13694628","original_title":"Nitram","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2557','movie',2557,'{"id":2557,"title":"Petrov''s Flu","director":"Kirill Serebrennikov","year":2021,"tmdb_id":609490,"imdb_id":"tt10380900","original_title":"Петровы в гриппе","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2558','movie',2558,'{"id":2558,"title":"Red Rocket","director":"Sean Baker","year":2021,"tmdb_id":763329,"imdb_id":"tt13453006","original_title":"Red Rocket","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2559','movie',2559,'{"id":2559,"title":"Everything Went Fine","director":"François Ozon","year":2021,"tmdb_id":735726,"imdb_id":"tt12847812","original_title":"Tout s’est bien passé","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2560','movie',2560,'{"id":2560,"title":"Three Floors","director":"Nanni Moretti","year":2021,"tmdb_id":608980,"imdb_id":"tt9110904","original_title":"Tre Piani","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2561','movie',2561,'{"id":2561,"title":"After Yang","director":"Kogonada","year":2022,"tmdb_id":585378,"imdb_id":"tt8633464","original_title":"After Yang","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2562','movie',2562,'{"id":2562,"title":"Commitment Hasan","director":"Semih Kaplanoğlu","year":2021,"tmdb_id":835963,"imdb_id":"tt13649034","original_title":"Bağlılık Hasan","original_language":"tr","alternate_titles":["BAGLILIK HASAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2563','movie',2563,'{"id":2563,"title":"Blue Bayou","director":"Justin Chon","year":2021,"tmdb_id":644089,"imdb_id":"tt11121664","original_title":"Blue Bayou","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2564','movie',2564,'{"id":2564,"title":"Good Mother","director":"Hafsia Herzi","year":2021,"tmdb_id":820711,"imdb_id":"tt13006574","original_title":"Bonne mère","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2565','movie',2565,'{"id":2565,"title":"House Arrest","director":"Aleksei German Jr.","year":2021,"tmdb_id":768058,"imdb_id":"tt14323258","original_title":"Дело","original_language":"ru","alternate_titles":["DELO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2566','movie',2566,'{"id":2566,"title":"Freda","director":"Gessica Généus","year":2021,"tmdb_id":836489,"imdb_id":"tt14775496","original_title":"Freda","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2567','movie',2567,'{"id":2567,"title":"Streetwise","director":"Na Jiazuo","year":2021,"tmdb_id":836491,"imdb_id":"tt14773880","original_title":"街娃儿","original_language":"zh","alternate_titles":["GAEY WA’R"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2568','movie',2568,'{"id":2568,"title":"Great Freedom","director":"Sebastian Meise","year":2021,"tmdb_id":835975,"imdb_id":"tt14775784","original_title":"Große Freiheit","original_language":"de","alternate_titles":["GROSSE FREIHEIT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2569','movie',2569,'{"id":2569,"title":"La Civil","director":"Teodora Ana Mihai","year":2021,"tmdb_id":833393,"imdb_id":"tt13827606","original_title":"La Civil","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2570','movie',2570,'{"id":2570,"title":"Lamb","director":"Valdimar Jóhannsson","year":2021,"tmdb_id":788929,"imdb_id":"tt9812474","original_title":"Dýrið","original_language":"is","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2571','movie',2571,'{"id":2571,"title":"My Brothers and I","director":"Yohan Manca","year":2022,"tmdb_id":838885,"imdb_id":"tt13582752","original_title":"Mes frères et moi","original_language":"fr","alternate_titles":["LA TRAVIATA, MY BROTHERS AND I"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2572','movie',2572,'{"id":2572,"title":"Moneyboys","director":"C.B. Yi","year":2021,"tmdb_id":676819,"imdb_id":"tt11783988","original_title":"金錢男孩","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2573','movie',2573,'{"id":2573,"title":"Prayers for the Stolen","director":"Tatiana Huezo","year":2021,"tmdb_id":670981,"imdb_id":"tt10366574","original_title":"Noche de fuego","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2574','movie',2574,'{"id":2574,"title":"Onoda: 10,000 Nights in the Jungle","director":"Arthur Harari","year":2021,"tmdb_id":695089,"imdb_id":"tt9844938","original_title":"Onoda, 10 000 nuits dans la jungle","original_language":"fr","alternate_titles":["ONODA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2575','movie',2575,'{"id":2575,"title":"Unclenching the Fists","director":"Kira Kovalenko","year":2021,"tmdb_id":583198,"imdb_id":"tt14775666","original_title":"Разжимая кулаки","original_language":"os","alternate_titles":["RAZZHIMAYA KULAKI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2576','movie',2576,'{"id":2576,"title":"Rehana Maryam Noor","director":"Abdullah Mohammad Saad","year":2021,"tmdb_id":836490,"imdb_id":"tt14775748","original_title":"রেহানা মরিয়ম নূর","original_language":"bn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2577','movie',2577,'{"id":2577,"title":"The Innocents","director":"Eskil Vogt","year":2021,"tmdb_id":660942,"imdb_id":"tt4028464","original_title":"De uskyldige","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2578','movie',2578,'{"id":2578,"title":"Playground","director":"Laura Wandel","year":2021,"tmdb_id":785209,"imdb_id":"tt11087960","original_title":"Un monde","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2579','movie',2579,'{"id":2579,"title":"Let It Be Morning","director":"Eran Kolirin","year":2021,"tmdb_id":504600,"imdb_id":"tt14775586","original_title":"Vayehi Boker","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2580','movie',2580,'{"id":2580,"title":"Women Do Cry","director":"Vesela Kazakova, Mina Mileva","year":2022,"tmdb_id":833419,"imdb_id":"tt11873754","original_title":"Жените наистина плачат","original_language":"bg","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2581','movie',2581,'{"id":2581,"title":"Armageddon Time","director":"James Gray","year":2022,"tmdb_id":615952,"imdb_id":"tt10343028","original_title":"Armageddon Time","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2582','movie',2582,'{"id":2582,"title":"Broker","director":"Hirokazu Kore-eda","year":2022,"tmdb_id":736732,"imdb_id":"tt13056052","original_title":"브로커","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2583','movie',2583,'{"id":2583,"title":"Crimes of the Future","director":"David Cronenberg","year":2022,"tmdb_id":819876,"imdb_id":"tt14549466","original_title":"Crimes of the Future","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2584','movie',2584,'{"id":2584,"title":"Brother and Sister","director":"Arnaud Desplechin","year":2022,"tmdb_id":836202,"imdb_id":"tt14622802","original_title":"Frère et Sœur","original_language":"fr","alternate_titles":["FRÈRE ET SOEUR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2585','movie',2585,'{"id":2585,"title":"Holy Spider","director":"Ali Abbasi","year":2022,"tmdb_id":889699,"imdb_id":"tt18550140","original_title":"عنکبوت مقدس","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2586','movie',2586,'{"id":2586,"title":"The Eight Mountains","director":"Felix van Groeningen, Charlotte Vandermeersch","year":2022,"tmdb_id":803700,"imdb_id":"tt14641542","original_title":"Le otto montagne","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2587','movie',2587,'{"id":2587,"title":"Leila''s Brothers","director":"Saeed Roustaee","year":2022,"tmdb_id":962558,"imdb_id":"tt19653180","original_title":"برادران لیلا","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2588','movie',2588,'{"id":2588,"title":"Forever Young","director":"Valeria Bruni Tedeschi","year":2022,"tmdb_id":848958,"imdb_id":"tt14976386","original_title":"Les Amandiers","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2589','movie',2589,'{"id":2589,"title":"Nostalgia","director":"Mario Martone","year":2022,"tmdb_id":541724,"imdb_id":"tt14034614","original_title":"Nostalgia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2590','movie',2590,'{"id":2590,"title":"Pacifiction","director":"Albert Serra","year":2022,"tmdb_id":691214,"imdb_id":"tt13702796","original_title":"Pacifiction - Tourment sur les îles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2591','movie',2591,'{"id":2591,"title":"R.M.N.","director":"Cristian Mungiu","year":2022,"tmdb_id":919570,"imdb_id":"tt18550182","original_title":"R.M.N.","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2592','movie',2592,'{"id":2592,"title":"Showing Up","director":"Kelly Reichardt","year":2023,"tmdb_id":790416,"imdb_id":"tt13923216","original_title":"Showing Up","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2593','movie',2593,'{"id":2593,"title":"Stars at Noon","director":"Claire Denis","year":2022,"tmdb_id":603204,"imdb_id":"tt10354106","original_title":"Stars at Noon","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2594','movie',2594,'{"id":2594,"title":"Tori and Lokita","director":"Jean-Pierre Dardenne, Luc Dardenne","year":2022,"tmdb_id":914203,"imdb_id":"tt18317064","original_title":"Tori et Lokita","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2595','movie',2595,'{"id":2595,"title":"Mother and Son","director":"Léonor Serraille","year":2022,"tmdb_id":926889,"imdb_id":"tt17014214","original_title":"Un petit frère","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2596','movie',2596,'{"id":2596,"title":"Cairo Conspiracy","director":"Tarik Saleh","year":2022,"tmdb_id":788977,"imdb_id":"tt15452062","original_title":"La Conspiration du Caire","original_language":"fr","alternate_titles":["WALAD MIN AL JANNA","BOY FROM HEAVEN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2597','movie',2597,'{"id":2597,"title":"Tchaikovsky''s Wife","director":"Kirill Serebrennikov","year":2022,"tmdb_id":901358,"imdb_id":"tt17538510","original_title":"Жена Чайковского","original_language":"ru","alternate_titles":["ZHENA CHAIKOVSKOGO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2598','movie',2598,'{"id":2598,"title":"Butterfly Vision","director":"Maksym Nakonechnyi","year":2022,"tmdb_id":962568,"imdb_id":"tt14867294","original_title":"Бачення метелика","original_language":"uk","alternate_titles":["BACHENNYA METELYKA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2599','movie',2599,'{"id":2599,"title":"Domingo and the Mist","director":"Ariel Escalante","year":2022,"tmdb_id":962565,"imdb_id":"tt19719864","original_title":"Domingo y la niebla","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2600','movie',2600,'{"id":2600,"title":"Harka","director":"Lotfy Nathan","year":2022,"tmdb_id":849242,"imdb_id":"tt9317274","original_title":"Harka","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2601','movie',2601,'{"id":2601,"title":"Joyland","director":"Saim Sadiq","year":2022,"tmdb_id":962571,"imdb_id":"tt19719976","original_title":"جوائے لینڈ","original_language":"ur","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2602','movie',2602,'{"id":2602,"title":"Burning Days","director":"Emin Alper","year":2022,"tmdb_id":682152,"imdb_id":"tt14859416","original_title":"Kurak Günler","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2603','movie',2603,'{"id":2603,"title":"The Blue Caftan","director":"Maryam Touzani","year":2023,"tmdb_id":958279,"imdb_id":"tt17679584","original_title":"أزرق القفطان","original_language":"ar","alternate_titles":["LE BLEU DU CAFTAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2604','movie',2604,'{"id":2604,"title":"The Worst Ones","director":"Lise Akoka, Romane Gueret","year":2022,"tmdb_id":962543,"imdb_id":"tt19719862","original_title":"Les Pires","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2605','movie',2605,'{"id":2605,"title":"Mediterranean Fever","director":"Maha Haj","year":2022,"tmdb_id":958291,"imdb_id":"tt19785426","original_title":"حمى البحر المتوسط","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2606','movie',2606,'{"id":2606,"title":"Metronom","director":"Alexandru Belc","year":2022,"tmdb_id":962562,"imdb_id":"tt12253164","original_title":"Metronom","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2607','movie',2607,'{"id":2607,"title":"Plan 75","director":"Chie Hayakawa","year":2022,"tmdb_id":958487,"imdb_id":"tt19719904","original_title":"PLAN 75","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2608','movie',2608,'{"id":2608,"title":"More Than Ever","director":"Emily Atef","year":2022,"tmdb_id":843093,"imdb_id":"tt14275050","original_title":"Plus que jamais","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2609','movie',2609,'{"id":2609,"title":"Return to Seoul","director":"Davy Chou","year":2022,"tmdb_id":952701,"imdb_id":"tt19719836","original_title":"Retour à Séoul","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2610','movie',2610,'{"id":2610,"title":"Rodeo","director":"Lola Quivoron","year":2022,"tmdb_id":936378,"imdb_id":"tt19719940","original_title":"Rodéo","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2611','movie',2611,'{"id":2611,"title":"Sick of Myself","director":"Kristoffer Borgli","year":2022,"tmdb_id":788734,"imdb_id":"tt18816518","original_title":"Syk pike","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2612','movie',2612,'{"id":2612,"title":"The Silent Twins","director":"Agnieszka Smoczyńska","year":2022,"tmdb_id":812025,"imdb_id":"tt11052678","original_title":"The Silent Twins","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2613','movie',2613,'{"id":2613,"title":"The Stranger","director":"Thomas M. Wright","year":2022,"tmdb_id":848791,"imdb_id":"tt11897478","original_title":"The Stranger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2614','movie',2614,'{"id":2614,"title":"Father & Soldier","director":"Mathieu Vadepied","year":2023,"tmdb_id":967874,"imdb_id":"tt14860210","original_title":"Tirailleurs","original_language":"fr","alternate_titles":["FATHER AND SOLDIER"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2615','movie',2615,'{"id":2615,"title":"Godland","director":"Hlynur Pálmason","year":2022,"tmdb_id":960206,"imdb_id":"tt19623228","original_title":"Vanskabte land","original_language":"da","alternate_titles":["VANSKABTE LAND / VOLAÐA LAND"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2616','movie',2616,'{"id":2616,"title":"War Pony","director":"Gina Gammell, Riley Keough","year":2023,"tmdb_id":962566,"imdb_id":"tt16227002","original_title":"War Pony","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2617','movie',2617,'{"id":2617,"title":"Banel & Adama","director":"Ramata-Toulaye Sy","year":2023,"tmdb_id":995806,"imdb_id":"tt26256406","original_title":"Banel e Adama","original_language":"ff","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2618','movie',2618,'{"id":2618,"title":"Asphalt City","director":"Jean-Stéphane Sauvaire","year":2024,"tmdb_id":628922,"imdb_id":"tt9663896","original_title":"Asphalt City","original_language":"en","alternate_titles":["BLACK FLIES"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2619','movie',2619,'{"id":2619,"title":"Club Zero","director":"Jessica Hausner","year":2023,"tmdb_id":938250,"imdb_id":"tt18235146","original_title":"Club Zero","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2620','movie',2620,'{"id":2620,"title":"Firebrand","director":"Karim Aïnouz","year":2024,"tmdb_id":848439,"imdb_id":"tt15000156","original_title":"Firebrand","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2621','movie',2621,'{"id":2621,"title":"A Brighter Tomorrow","director":"Nanni Moretti","year":2023,"tmdb_id":925263,"imdb_id":"tt16731908","original_title":"Il sol dell''avvenire","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2622','movie',2622,'{"id":2622,"title":"Monster","director":"Hirokazu Kore-eda","year":2023,"tmdb_id":1050035,"imdb_id":"tt23736044","original_title":"怪物","original_language":"ja","alternate_titles":["KAIBUTSU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2623','movie',2623,'{"id":2623,"title":"Last Summer","director":"Catherine Breillat","year":2023,"tmdb_id":812037,"imdb_id":"tt14550346","original_title":"L''Été dernier","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2624','movie',2624,'{"id":2624,"title":"Homecoming","director":"Catherine Corsini","year":2023,"tmdb_id":1000058,"imdb_id":"tt22463404","original_title":"Le retour","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2625','movie',2625,'{"id":2625,"title":"Youth (Spring)","director":"Wang Bing","year":2023,"tmdb_id":493514,"imdb_id":"tt8469104","original_title":"青春（春）","original_language":"zh","alternate_titles":["QING CHUN (CHUN)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2626','movie',2626,'{"id":2626,"title":"Kidnapped","director":"Marco Bellocchio","year":2023,"tmdb_id":801112,"imdb_id":"tt14137416","original_title":"Rapito","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2627','movie',2627,'{"id":2627,"title":"Omen","director":"Baloji Tshiani","year":2023,"tmdb_id":889818,"imdb_id":"tt21086802","original_title":"Augure","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2628','movie',2628,'{"id":2628,"title":"Terrestrial Verses","director":"Ali Asgari, Alireza Khatami","year":2023,"tmdb_id":1112545,"imdb_id":"tt27502360","original_title":"آیه های زمینی","original_language":"fa","alternate_titles":["AYEH HAYE ZAMINI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2629','movie',2629,'{"id":2629,"title":"The Buriti Flower","director":"João Salaviza, Renée Nader Messora","year":2024,"tmdb_id":1112543,"imdb_id":"tt27502245","original_title":"Crowrã","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2630','movie',2630,'{"id":2630,"title":"Only the River Flows","director":"Wei Shujun","year":2023,"tmdb_id":1115379,"imdb_id":"tt27590147","original_title":"河边的错误","original_language":"zh","alternate_titles":["HE BIAN DE CUO WU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2631','movie',2631,'{"id":2631,"title":"Hopeless","director":"Kim Chang-hoon","year":2023,"tmdb_id":1028684,"imdb_id":"tt27502351","original_title":"화란","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2632','movie',2632,'{"id":2632,"title":"If Only I Could Hibernate","director":"Zoljargal Purevdash","year":2024,"tmdb_id":986855,"imdb_id":"tt21605226","original_title":"Баавгай болохсон","original_language":"mn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2633','movie',2633,'{"id":2633,"title":"The Mother of All Lies","director":"Asmae El Moudir","year":2024,"tmdb_id":1112527,"imdb_id":"tt15307068","original_title":"كذب أبيض","original_language":"ar","alternate_titles":["KADIB ABYAD"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2634','movie',2634,'{"id":2634,"title":"The Animal Kingdom","director":"Thomas Cailley","year":2023,"tmdb_id":943134,"imdb_id":"tt16606592","original_title":"Le Règne animal","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2635','movie',2635,'{"id":2635,"title":"Hounds","director":"Kamal Lazraq","year":2023,"tmdb_id":1000130,"imdb_id":"tt25750836","original_title":"Les Meutes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2636','movie',2636,'{"id":2636,"title":"The Settlers","director":"Felipe Gálvez","year":2023,"tmdb_id":989589,"imdb_id":"tt10370812","original_title":"Los colonos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2637','movie',2637,'{"id":2637,"title":"All to Play For","director":"Delphine Deloget","year":2023,"tmdb_id":966488,"imdb_id":"tt14748950","original_title":"Rien à perdre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2638','movie',2638,'{"id":2638,"title":"Rosalie","director":"Stéphanie Di Giusto","year":2024,"tmdb_id":995746,"imdb_id":"tt26342863","original_title":"Rosalie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2639','movie',2639,'{"id":2639,"title":"Salem","director":"Jean-Bernard Marlin","year":2024,"tmdb_id":1001377,"imdb_id":"tt24797140","original_title":"Salem","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2640','movie',2640,'{"id":2640,"title":"The Nature of Love","director":"Monia Chokri","year":2023,"tmdb_id":912520,"imdb_id":"tt22487338","original_title":"Simple comme Sylvain","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2641','movie',2641,'{"id":2641,"title":"The Breaking Ice","director":"Anthony Chen","year":2023,"tmdb_id":923150,"imdb_id":"tt17052842","original_title":"燃冬","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2642','movie',2642,'{"id":2642,"title":"The New Boy","director":"Warwick Thornton","year":2023,"tmdb_id":937161,"imdb_id":"tt18180926","original_title":"The New Boy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2643','movie',2643,'{"id":2643,"title":"Strangers by Night","director":"Alex Lutz","year":2023,"tmdb_id":1000409,"imdb_id":"tt21230186","original_title":"Une nuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2644','movie',2644,'{"id":2644,"title":"Wild Diamond","director":"Agathe Riedinger","year":2024,"tmdb_id":1108336,"imdb_id":"tt28319139","original_title":"Diamant brut","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2645','movie',2645,'{"id":2645,"title":"Beating Hearts","director":"Gilles Lellouche","year":2024,"tmdb_id":959604,"imdb_id":"tt27490099","original_title":"L''Amour ouf","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2646','movie',2646,'{"id":2646,"title":"Limonov: The Ballad","director":"Kirill Serebrennikov","year":2024,"tmdb_id":495278,"imdb_id":"tt2963262","original_title":"Limonov: The Ballad","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2647','movie',2647,'{"id":2647,"title":"Marcello Mio","director":"Christophe Honoré","year":2024,"tmdb_id":1145608,"imdb_id":"tt32086069","original_title":"Marcello Mio","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2648','movie',2648,'{"id":2648,"title":"Motel Destino","director":"Karim Aïnouz","year":2024,"tmdb_id":1161879,"imdb_id":"tt28608358","original_title":"Motel Destino","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2649','movie',2649,'{"id":2649,"title":"Oh, Canada","director":"Paul Schrader","year":2024,"tmdb_id":1113583,"imdb_id":"tt29994753","original_title":"Oh, Canada","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2650','movie',2650,'{"id":2650,"title":"Three Kilometres to the End of the World","director":"Emanuel Pârvu","year":2024,"tmdb_id":1278338,"imdb_id":"tt32186523","original_title":"Trei kilometri până la capătul lumii","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2651','movie',2651,'{"id":2651,"title":"Armand","director":"Halfdan Ullmann Tøndel","year":2024,"tmdb_id":1144681,"imdb_id":"tt26745321","original_title":"Armand","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2652','movie',2652,'{"id":2652,"title":"Dog on Trial","director":"Laetitia Dosch","year":2024,"tmdb_id":1056648,"imdb_id":"tt27198573","original_title":"Le Procès du Chien","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2653','movie',2653,'{"id":2653,"title":"The Kingdom","director":"Julien Colonna","year":2024,"tmdb_id":1079311,"imdb_id":"tt32086032","original_title":"Le Royaume","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2654','movie',2654,'{"id":2654,"title":"My Sunshine","director":"Hiroshi Okuyama","year":2024,"tmdb_id":1267822,"imdb_id":"tt22694908","original_title":"ぼくのお日さま","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2655','movie',2655,'{"id":2655,"title":"Niki","director":"Céline Sallette","year":2024,"tmdb_id":1001684,"imdb_id":"tt26656556","original_title":"Niki","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2656','movie',2656,'{"id":2656,"title":"Norah","director":"Tawfik Alzaidi","year":2024,"tmdb_id":1213982,"imdb_id":"tt9376490","original_title":"نورة","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2657','movie',2657,'{"id":2657,"title":"September Says","director":"Ariane Labed","year":2025,"tmdb_id":1212337,"imdb_id":"tt29315015","original_title":"September Says","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2658','movie',2658,'{"id":2658,"title":"The Damned","director":"Roberto Minervini","year":2024,"tmdb_id":1059010,"imdb_id":"tt29296048","original_title":"I dannati","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2659','movie',2659,'{"id":2659,"title":"The Shameless","director":"Konstantin Bojanov","year":2025,"tmdb_id":1257409,"imdb_id":"tt15437986","original_title":"निर्लज्ज","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2660','movie',2660,'{"id":2660,"title":"The Village Next to Paradise","director":"Mo Harawe","year":2024,"tmdb_id":1012241,"imdb_id":"tt32046117","original_title":"The Village Next to Paradise","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2661','movie',2661,'{"id":2661,"title":"Việt and Nam","director":"Trương Minh Quý","year":2024,"tmdb_id":846586,"imdb_id":"tt32086052","original_title":"Trong lòng đất","original_language":"vi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2662','movie',2662,'{"id":2662,"title":"Aisha Can''t Fly Away","director":"Morad Mostafa","year":2025,"tmdb_id":1337148,"imdb_id":"tt27907966","original_title":"عائشة لا تستطيع الطيران","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2663','movie',2663,'{"id":2663,"title":"Eleanor the Great","director":"Scarlett Johansson","year":2025,"tmdb_id":1212271,"imdb_id":"tt30268321","original_title":"Eleanor the Great","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2664','movie',2664,'{"id":2664,"title":"Homebound","director":"Neeraj Ghaywan","year":2025,"tmdb_id":1227739,"imdb_id":"tt26733325","original_title":"Homebound","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2665','movie',2665,'{"id":2665,"title":"Caravan","director":"Zuzana Kirchnerová","year":2025,"tmdb_id":1461539,"imdb_id":"tt29271671","original_title":"Karavan","original_language":"cs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2666','movie',2666,'{"id":2666,"title":"The Great Arch","director":"Stéphane Demoustier","year":2025,"tmdb_id":1290424,"imdb_id":"tt32398150","original_title":"L''Inconnu de la Grande Arche","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2667','movie',2667,'{"id":2667,"title":"The Last One for the Road","director":"Francesco Sossai","year":2025,"tmdb_id":1462322,"imdb_id":"tt36491632","original_title":"Le città di pianura","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2668','movie',2668,'{"id":2668,"title":"Love Me Tender","director":"Anna Cazenave Cambet","year":2025,"tmdb_id":1290450,"imdb_id":"tt35354686","original_title":"Love Me Tender","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2669','movie',2669,'{"id":2669,"title":"Meteors","director":"Hubert Charuel","year":2025,"tmdb_id":1262773,"imdb_id":"tt33772384","original_title":"Météors","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2670','movie',2670,'{"id":2670,"title":"Promised Sky","director":"Erige Sehiri","year":2026,"tmdb_id":1218412,"imdb_id":"tt33311007","original_title":"Promis le ciel","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2671','movie',2671,'{"id":2671,"title":"Heads or Tails?","director":"Matteo Zoppis, Alessio Rigo de Righi","year":2025,"tmdb_id":1078822,"imdb_id":"tt32448429","original_title":"Testa o croce?","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2672','movie',2672,'{"id":2672,"title":"A Pale View of Hills","director":"Kei Ishikawa","year":2025,"tmdb_id":1337985,"imdb_id":"tt33253688","original_title":"遠い山なみの光","original_language":"ja","alternate_titles":["TÔI YAMANAMINO HIKARI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:574078','movie:2545') on conflict do nothing;
insert into public.media_provider_links values('movie:454527','movie:2546') on conflict do nothing;
insert into public.media_provider_links values('movie:477044','movie:2547') on conflict do nothing;
insert into public.media_provider_links values('movie:662712','movie:2548') on conflict do nothing;
insert into public.media_provider_links values('movie:602334','movie:2549') on conflict do nothing;
insert into public.media_provider_links values('movie:662029','movie:2550') on conflict do nothing;
insert into public.media_provider_links values('movie:575764','movie:2551') on conflict do nothing;
insert into public.media_provider_links values('movie:764686','movie:2552') on conflict do nothing;
insert into public.media_provider_links values('movie:788942','movie:2553') on conflict do nothing;
insert into public.media_provider_links values('movie:820693','movie:2554') on conflict do nothing;
insert into public.media_provider_links values('movie:511819','movie:2555') on conflict do nothing;
insert into public.media_provider_links values('movie:797457','movie:2556') on conflict do nothing;
insert into public.media_provider_links values('movie:609490','movie:2557') on conflict do nothing;
insert into public.media_provider_links values('movie:763329','movie:2558') on conflict do nothing;
insert into public.media_provider_links values('movie:735726','movie:2559') on conflict do nothing;
insert into public.media_provider_links values('movie:608980','movie:2560') on conflict do nothing;
insert into public.media_provider_links values('movie:585378','movie:2561') on conflict do nothing;
insert into public.media_provider_links values('movie:835963','movie:2562') on conflict do nothing;
insert into public.media_provider_links values('movie:644089','movie:2563') on conflict do nothing;
insert into public.media_provider_links values('movie:820711','movie:2564') on conflict do nothing;
insert into public.media_provider_links values('movie:768058','movie:2565') on conflict do nothing;
insert into public.media_provider_links values('movie:836489','movie:2566') on conflict do nothing;
insert into public.media_provider_links values('movie:836491','movie:2567') on conflict do nothing;
insert into public.media_provider_links values('movie:835975','movie:2568') on conflict do nothing;
insert into public.media_provider_links values('movie:833393','movie:2569') on conflict do nothing;
insert into public.media_provider_links values('movie:788929','movie:2570') on conflict do nothing;
insert into public.media_provider_links values('movie:838885','movie:2571') on conflict do nothing;
insert into public.media_provider_links values('movie:676819','movie:2572') on conflict do nothing;
insert into public.media_provider_links values('movie:670981','movie:2573') on conflict do nothing;
insert into public.media_provider_links values('movie:695089','movie:2574') on conflict do nothing;
insert into public.media_provider_links values('movie:583198','movie:2575') on conflict do nothing;
insert into public.media_provider_links values('movie:836490','movie:2576') on conflict do nothing;
insert into public.media_provider_links values('movie:660942','movie:2577') on conflict do nothing;
insert into public.media_provider_links values('movie:785209','movie:2578') on conflict do nothing;
insert into public.media_provider_links values('movie:504600','movie:2579') on conflict do nothing;
insert into public.media_provider_links values('movie:833419','movie:2580') on conflict do nothing;
insert into public.media_provider_links values('movie:615952','movie:2581') on conflict do nothing;
insert into public.media_provider_links values('movie:736732','movie:2582') on conflict do nothing;
insert into public.media_provider_links values('movie:819876','movie:2583') on conflict do nothing;
insert into public.media_provider_links values('movie:836202','movie:2584') on conflict do nothing;
insert into public.media_provider_links values('movie:889699','movie:2585') on conflict do nothing;
insert into public.media_provider_links values('movie:803700','movie:2586') on conflict do nothing;
insert into public.media_provider_links values('movie:962558','movie:2587') on conflict do nothing;
insert into public.media_provider_links values('movie:848958','movie:2588') on conflict do nothing;
insert into public.media_provider_links values('movie:541724','movie:2589') on conflict do nothing;
insert into public.media_provider_links values('movie:691214','movie:2590') on conflict do nothing;
insert into public.media_provider_links values('movie:919570','movie:2591') on conflict do nothing;
insert into public.media_provider_links values('movie:790416','movie:2592') on conflict do nothing;
insert into public.media_provider_links values('movie:603204','movie:2593') on conflict do nothing;
insert into public.media_provider_links values('movie:914203','movie:2594') on conflict do nothing;
insert into public.media_provider_links values('movie:926889','movie:2595') on conflict do nothing;
insert into public.media_provider_links values('movie:788977','movie:2596') on conflict do nothing;
insert into public.media_provider_links values('movie:901358','movie:2597') on conflict do nothing;
insert into public.media_provider_links values('movie:962568','movie:2598') on conflict do nothing;
insert into public.media_provider_links values('movie:962565','movie:2599') on conflict do nothing;
insert into public.media_provider_links values('movie:849242','movie:2600') on conflict do nothing;
insert into public.media_provider_links values('movie:962571','movie:2601') on conflict do nothing;
insert into public.media_provider_links values('movie:682152','movie:2602') on conflict do nothing;
insert into public.media_provider_links values('movie:958279','movie:2603') on conflict do nothing;
insert into public.media_provider_links values('movie:962543','movie:2604') on conflict do nothing;
insert into public.media_provider_links values('movie:958291','movie:2605') on conflict do nothing;
insert into public.media_provider_links values('movie:962562','movie:2606') on conflict do nothing;
insert into public.media_provider_links values('movie:958487','movie:2607') on conflict do nothing;
insert into public.media_provider_links values('movie:843093','movie:2608') on conflict do nothing;
insert into public.media_provider_links values('movie:952701','movie:2609') on conflict do nothing;
insert into public.media_provider_links values('movie:936378','movie:2610') on conflict do nothing;
insert into public.media_provider_links values('movie:788734','movie:2611') on conflict do nothing;
insert into public.media_provider_links values('movie:812025','movie:2612') on conflict do nothing;
insert into public.media_provider_links values('movie:848791','movie:2613') on conflict do nothing;
insert into public.media_provider_links values('movie:967874','movie:2614') on conflict do nothing;
insert into public.media_provider_links values('movie:960206','movie:2615') on conflict do nothing;
insert into public.media_provider_links values('movie:962566','movie:2616') on conflict do nothing;
insert into public.media_provider_links values('movie:995806','movie:2617') on conflict do nothing;
insert into public.media_provider_links values('movie:628922','movie:2618') on conflict do nothing;
insert into public.media_provider_links values('movie:938250','movie:2619') on conflict do nothing;
insert into public.media_provider_links values('movie:848439','movie:2620') on conflict do nothing;
insert into public.media_provider_links values('movie:925263','movie:2621') on conflict do nothing;
insert into public.media_provider_links values('movie:1050035','movie:2622') on conflict do nothing;
insert into public.media_provider_links values('movie:812037','movie:2623') on conflict do nothing;
insert into public.media_provider_links values('movie:1000058','movie:2624') on conflict do nothing;
insert into public.media_provider_links values('movie:493514','movie:2625') on conflict do nothing;
insert into public.media_provider_links values('movie:801112','movie:2626') on conflict do nothing;
insert into public.media_provider_links values('movie:889818','movie:2627') on conflict do nothing;
insert into public.media_provider_links values('movie:1112545','movie:2628') on conflict do nothing;
insert into public.media_provider_links values('movie:1112543','movie:2629') on conflict do nothing;
insert into public.media_provider_links values('movie:1115379','movie:2630') on conflict do nothing;
insert into public.media_provider_links values('movie:1028684','movie:2631') on conflict do nothing;
insert into public.media_provider_links values('movie:986855','movie:2632') on conflict do nothing;
insert into public.media_provider_links values('movie:1112527','movie:2633') on conflict do nothing;
insert into public.media_provider_links values('movie:943134','movie:2634') on conflict do nothing;
insert into public.media_provider_links values('movie:1000130','movie:2635') on conflict do nothing;
insert into public.media_provider_links values('movie:989589','movie:2636') on conflict do nothing;
insert into public.media_provider_links values('movie:966488','movie:2637') on conflict do nothing;
insert into public.media_provider_links values('movie:995746','movie:2638') on conflict do nothing;
insert into public.media_provider_links values('movie:1001377','movie:2639') on conflict do nothing;
insert into public.media_provider_links values('movie:912520','movie:2640') on conflict do nothing;
insert into public.media_provider_links values('movie:923150','movie:2641') on conflict do nothing;
insert into public.media_provider_links values('movie:937161','movie:2642') on conflict do nothing;
insert into public.media_provider_links values('movie:1000409','movie:2643') on conflict do nothing;
insert into public.media_provider_links values('movie:1108336','movie:2644') on conflict do nothing;
insert into public.media_provider_links values('movie:959604','movie:2645') on conflict do nothing;
insert into public.media_provider_links values('movie:495278','movie:2646') on conflict do nothing;
insert into public.media_provider_links values('movie:1145608','movie:2647') on conflict do nothing;
insert into public.media_provider_links values('movie:1161879','movie:2648') on conflict do nothing;
insert into public.media_provider_links values('movie:1113583','movie:2649') on conflict do nothing;
insert into public.media_provider_links values('movie:1278338','movie:2650') on conflict do nothing;
insert into public.media_provider_links values('movie:1144681','movie:2651') on conflict do nothing;
insert into public.media_provider_links values('movie:1056648','movie:2652') on conflict do nothing;
insert into public.media_provider_links values('movie:1079311','movie:2653') on conflict do nothing;
insert into public.media_provider_links values('movie:1267822','movie:2654') on conflict do nothing;
insert into public.media_provider_links values('movie:1001684','movie:2655') on conflict do nothing;
insert into public.media_provider_links values('movie:1213982','movie:2656') on conflict do nothing;
insert into public.media_provider_links values('movie:1212337','movie:2657') on conflict do nothing;
insert into public.media_provider_links values('movie:1059010','movie:2658') on conflict do nothing;
insert into public.media_provider_links values('movie:1257409','movie:2659') on conflict do nothing;
insert into public.media_provider_links values('movie:1012241','movie:2660') on conflict do nothing;
insert into public.media_provider_links values('movie:846586','movie:2661') on conflict do nothing;
insert into public.media_provider_links values('movie:1337148','movie:2662') on conflict do nothing;
insert into public.media_provider_links values('movie:1212271','movie:2663') on conflict do nothing;
insert into public.media_provider_links values('movie:1227739','movie:2664') on conflict do nothing;
insert into public.media_provider_links values('movie:1461539','movie:2665') on conflict do nothing;
insert into public.media_provider_links values('movie:1290424','movie:2666') on conflict do nothing;
insert into public.media_provider_links values('movie:1462322','movie:2667') on conflict do nothing;
insert into public.media_provider_links values('movie:1290450','movie:2668') on conflict do nothing;
insert into public.media_provider_links values('movie:1262773','movie:2669') on conflict do nothing;
insert into public.media_provider_links values('movie:1218412','movie:2670') on conflict do nothing;
insert into public.media_provider_links values('movie:1078822','movie:2671') on conflict do nothing;
insert into public.media_provider_links values('movie:1337985','movie:2672') on conflict do nothing;
commit;

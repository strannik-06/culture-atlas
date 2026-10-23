-- 2026 awards: 126 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:911430','movie:2254',911430),
('movie:1371185','movie:2255',1371185),
('movie:1272149','movie:2256',1272149),
('movie:1243006','movie:2257',1243006),
('movie:1242454','movie:2258',1242454),
('movie:1320400','movie:2259',1320400),
('movie:1311031','movie:2260',1311031),
('movie:997113','movie:2261',997113),
('movie:1230368','movie:2262',1230368),
('movie:967941','movie:2263',967941),
('movie:1088548','movie:2264',1088548),
('movie:1258181','movie:2265',1258181),
('movie:1422041','movie:2266',1422041),
('movie:1437981','movie:2267',1437981),
('movie:1157869','movie:2268',1157869),
('movie:1381273','movie:2269',1381273),
('movie:1013822','movie:2270',1013822),
('movie:1476614','movie:2271',1476614),
('movie:1507877','movie:2272',1507877),
('movie:1058424','movie:2273',1058424),
('movie:1448971','movie:2274',1448971),
('movie:1473148','movie:2275',1473148),
('movie:1318864','movie:2276',1318864),
('movie:1401459','movie:2277',1401459),
('movie:1191818','movie:2278',1191818),
('movie:1437925','movie:2279',1437925),
('movie:1437696','movie:2280',1437696),
('movie:1458914','movie:2281',1458914),
('movie:1074074','movie:2282',1074074),
('movie:1733908','movie:2283',1733908),
('movie:1736490','movie:2284',1736490),
('movie:1597199','movie:2285',1597199),
('movie:1532610','movie:2286',1532610),
('movie:1430815','movie:2287',1430815),
('movie:1632188','movie:2288',1632188),
('movie:1511780','movie:2289',1511780),
('movie:1429713','movie:2290',1429713),
('movie:1429602','movie:2291',1429602),
('movie:1734147','movie:2292',1734147),
('movie:1483525','movie:2293',1483525),
('movie:891621','movie:2294',891621),
('movie:1499546','movie:2295',1499546),
('movie:1576934','movie:2296',1576934),
('movie:1480672','movie:2297',1480672),
('movie:1412795','movie:2298',1412795),
('movie:1497946','movie:2299',1497946),
('movie:1473784','movie:2300',1473784),
('movie:1279865','movie:2301',1279865),
('movie:1279548','movie:2302',1279548),
('movie:1119547','movie:2303',1119547),
('movie:1135582','movie:2304',1135582),
('movie:1001375','movie:2305',1001375),
('movie:1299061','movie:2306',1299061),
('movie:1378791','movie:2307',1378791),
('movie:1315657','movie:2308',1315657),
('movie:1299329','movie:2309',1299329),
('movie:1401106','movie:2310',1401106),
('movie:1152312','movie:2311',1152312),
('movie:1437703','movie:2312',1437703),
('movie:1527449','movie:2313',1527449),
('movie:1021848','movie:2314',1021848),
('movie:1176962','movie:2315',1176962),
('movie:1130948','movie:2316',1130948),
('movie:1376457','movie:2317',1376457),
('movie:1426957','movie:2318',1426957),
('movie:1476362','movie:2319',1476362),
('movie:884692','movie:2320',884692),
('movie:1619820','movie:2321',1619820),
('movie:964849','movie:2322',964849),
('movie:1400793','movie:2323',1400793),
('movie:1182935','movie:2324',1182935),
('movie:1553969','movie:2325',1553969),
('movie:1591675','movie:2326',1591675),
('movie:1375441','movie:2327',1375441),
('movie:1240889','movie:2328',1240889),
('movie:1661926','movie:2329',1661926),
('movie:947493','movie:2330',947493),
('movie:1405200','movie:2331',1405200),
('movie:1666683','movie:2332',1666683),
('movie:1585239','movie:2333',1585239),
('movie:1514891','movie:2334',1514891),
('movie:1490241','movie:2335',1490241),
('movie:1000843','movie:2336',1000843),
('movie:1404582','movie:2337',1404582),
('movie:1210268','movie:2338',1210268),
('movie:1661932','movie:2339',1661932),
('movie:1529849','movie:2340',1529849),
('movie:1441105','movie:2341',1441105),
('movie:1544163','movie:2342',1544163),
('movie:1655419','movie:2343',1655419),
('movie:1379486','movie:2344',1379486),
('movie:1560309','movie:2345',1560309),
('movie:1383287','movie:2346',1383287),
('movie:1730542','movie:2347',1730542),
('movie:1736461','movie:2348',1736461),
('movie:1597196','movie:2349',1597196),
('movie:1632103','movie:2350',1632103),
('movie:1736499','movie:2351',1736499),
('movie:1593299','movie:2352',1593299),
('movie:1554129','movie:2353',1554129),
('movie:1510542','movie:2354',1510542),
('movie:1470034','movie:2355',1470034),
('movie:1531947','movie:2356',1531947),
('movie:1544437','movie:2357',1544437),
('movie:1736501','movie:2358',1736501),
('movie:1699532','movie:2359',1699532),
('movie:1404588','movie:2360',1404588),
('movie:1736503','movie:2361',1736503),
('movie:1724831','movie:2362',1724831),
('movie:1619815','movie:2363',1619815),
('movie:1425784','movie:2364',1425784),
('movie:1400378','movie:2365',1400378),
('movie:1574074','movie:2366',1574074),
('movie:1417935','movie:2367',1417935),
('movie:1414395','movie:2368',1414395),
('movie:1563588','movie:2369',1563588),
('movie:1476466','movie:2370',1476466),
('movie:1399253','movie:2371',1399253),
('movie:1241046','movie:2372',1241046),
('movie:1569461','movie:2373',1569461),
('movie:1281195','movie:2374',1281195),
('movie:1619818','movie:2375',1619818),
('movie:1601885','movie:2376',1601885),
('movie:1736497','movie:2377',1736497),
('movie:1404592','movie:2378',1404592),
('movie:1562901','movie:2379',1562901)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2254','movie',2254,'{"id":2254,"title":"F1","director":"Joseph Kosinski","year":2025,"tmdb_id":911430,"imdb_id":"tt16311594","original_title":"F1","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2255','movie',2255,'{"id":2255,"title":"Song Sung Blue","director":"Craig Brewer","year":2025,"tmdb_id":1371185,"imdb_id":"tt30343021","original_title":"Song Sung Blue","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2256','movie',2256,'{"id":2256,"title":"Bridget Jones: Mad About the Boy","director":"Michael Morris","year":2025,"tmdb_id":1272149,"imdb_id":"tt32063050","original_title":"Bridget Jones: Mad About the Boy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2257','movie',2257,'{"id":2257,"title":"H Is for Hawk","director":"Philippa Lowthorpe","year":2025,"tmdb_id":1243006,"imdb_id":"tt10329560","original_title":"H Is for Hawk","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2258','movie',2258,'{"id":2258,"title":"Mr. Burton","director":"Marc Evans","year":2025,"tmdb_id":1242454,"imdb_id":"tt5171016","original_title":"Mr. Burton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2259','movie',2259,'{"id":2259,"title":"Apocalypse in the Tropics","director":"Petra Costa","year":2025,"tmdb_id":1320400,"imdb_id":"tt30012657","original_title":"Apocalipse nos Trópicos","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2260','movie',2260,'{"id":2260,"title":"Demon Slayer: Kimetsu no Yaiba Infinity Castle","director":"Haruo Sotozaki","year":2025,"tmdb_id":1311031,"imdb_id":"tt32820897","original_title":"劇場版「鬼滅の刃」無限城編 第一章 猗窩座再来","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2261','movie',2261,'{"id":2261,"title":"Hedda","director":"Nia DaCosta","year":2025,"tmdb_id":997113,"imdb_id":"tt27953589","original_title":"Hedda","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2262','movie',2262,'{"id":2262,"title":"Springsteen: Deliver Me from Nowhere","director":"Scott Cooper","year":2025,"tmdb_id":1230368,"imdb_id":"tt31923069","original_title":"Springsteen: Deliver Me from Nowhere","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2263','movie',2263,'{"id":2263,"title":"Wicked: For Good","director":"Jon M. Chu","year":2025,"tmdb_id":967941,"imdb_id":"tt19847976","original_title":"Wicked: For Good","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2264','movie',2264,'{"id":2264,"title":"Bitter Christmas","director":"Pedro Almodóvar","year":2026,"tmdb_id":1088548,"imdb_id":"tt28088049","original_title":"Amarga Navidad","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2265','movie',2265,'{"id":2265,"title":"A Woman''s Life","director":"Charline Bourgeois-Tacquet","year":2026,"tmdb_id":1258181,"imdb_id":"tt39299437","original_title":"La vie d''une femme","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2266','movie',2266,'{"id":2266,"title":"La bola negra","director":"Javier Ambrossi, Javier Calvo","year":2026,"tmdb_id":1422041,"imdb_id":"tt35511966","original_title":"La bola negra","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2267','movie',2267,'{"id":2267,"title":"Coward","director":"Lukas Dhont","year":2026,"tmdb_id":1437981,"imdb_id":"tt39328391","original_title":"Coward","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2268','movie',2268,'{"id":2268,"title":"Parallel Tales","director":"Asghar Farhadi","year":2026,"tmdb_id":1157869,"imdb_id":"tt36646880","original_title":"Histoires parallèles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2269','movie',2269,'{"id":2269,"title":"Paper Tiger","director":"James Gray","year":2026,"tmdb_id":1381273,"imdb_id":"tt34385689","original_title":"Paper Tiger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2270','movie',2270,'{"id":2270,"title":"The Dreamed Adventure","director":"Valeska Grisebach","year":2026,"tmdb_id":1013822,"imdb_id":"tt21188986","original_title":"Das geträumte Abenteuer","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2271','movie',2271,'{"id":2271,"title":"All of a Sudden","director":"Ryusuke Hamaguchi","year":2026,"tmdb_id":1476614,"imdb_id":"tt36834996","original_title":"急に具合が悪くなる","original_language":"ja","alternate_titles":["Soudain"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2272','movie',2272,'{"id":2272,"title":"Another Day","director":"Jeanne Herry","year":2026,"tmdb_id":1507877,"imdb_id":"tt38584405","original_title":"Garance","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2273','movie',2273,'{"id":2273,"title":"Hope","director":"Na Hong-jin","year":2026,"tmdb_id":1058424,"imdb_id":"tt27369017","original_title":"호프","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2274','movie',2274,'{"id":2274,"title":"Nagi Notes","director":"Koji Fukada","year":2026,"tmdb_id":1448971,"imdb_id":"tt28551050","original_title":"ナギダイアリー","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2275','movie',2275,'{"id":2275,"title":"Gentle Monster","director":"Marie Kreutzer","year":2026,"tmdb_id":1473148,"imdb_id":"tt37020296","original_title":"Gentle Monster","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2276','movie',2276,'{"id":2276,"title":"A Man of His Time","director":"Emmanuel Marre","year":2026,"tmdb_id":1318864,"imdb_id":"tt41593304","original_title":"Notre salut","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2277','movie',2277,'{"id":2277,"title":"Fjord","director":"Cristian Mungiu","year":2026,"tmdb_id":1401459,"imdb_id":"tt35410859","original_title":"Fjord","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2278','movie',2278,'{"id":2278,"title":"The Birthday Party","director":"Léa Mysius","year":2026,"tmdb_id":1191818,"imdb_id":"tt30495381","original_title":"Histoires de la nuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2279','movie',2279,'{"id":2279,"title":"Moulin","director":"László Nemes","year":2026,"tmdb_id":1437925,"imdb_id":"tt36899180","original_title":"Moulin","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2280','movie',2280,'{"id":2280,"title":"Fatherland","director":"Paweł Pawlikowski","year":2026,"tmdb_id":1437696,"imdb_id":"tt37304295","original_title":"Ojczyzna","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2281','movie',2281,'{"id":2281,"title":"The Man I Love","director":"Ira Sachs","year":2027,"tmdb_id":1458914,"imdb_id":"tt37522972","original_title":"The Man I Love","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2282','movie',2282,'{"id":2282,"title":"The Beloved","director":"Rodrigo Sorogoyen","year":2026,"tmdb_id":1074074,"imdb_id":"tt33451014","original_title":"El ser querido","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2283','movie',2283,'{"id":2283,"title":"Company","director":"Casey Affleck","year":2026,"tmdb_id":1733908,"imdb_id":"tt0772163","original_title":"Company","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2284','movie',2284,'{"id":2284,"title":"A Bit of Light","director":"Ali Asgari","year":2026,"tmdb_id":1736490,"imdb_id":"tt43704846","original_title":"کمی نور","original_language":"fa","alternate_titles":["Kami nour (A bit of light)","Kami nour"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2285','movie',2285,'{"id":2285,"title":"Back to Buenos Aires","director":"Marco Bechis","year":2026,"tmdb_id":1597199,"imdb_id":"tt39239726","original_title":"Ritorno a Buenos Aires","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2286','movie',2286,'{"id":2286,"title":"Ink","director":"Danny Boyle","year":2026,"tmdb_id":1532610,"imdb_id":"tt37967547","original_title":"Ink","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2287','movie',2287,'{"id":2287,"title":"A Good Little Soldier","director":"Stéphane Brizé","year":2026,"tmdb_id":1430815,"imdb_id":"tt41802342","original_title":"Un bon petit soldat","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2288','movie',2288,'{"id":2288,"title":"The Fire Within You","director":"Edoardo De Angelis","year":2026,"tmdb_id":1632188,"imdb_id":"tt34621251","original_title":"Il fuoco che ti porti dentro","original_language":"it","alternate_titles":["Il fuoco che ti porti dentro (The Fire Within You)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2289','movie',2289,'{"id":2289,"title":"Woman Unknown","director":"May el-Toukhy","year":2027,"tmdb_id":1511780,"imdb_id":"tt34888026","original_title":"Kvinde ukendt","original_language":"da","alternate_titles":["Kvinde Ukendt (Woman Unknown)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2290','movie',2290,'{"id":2290,"title":"Bucking Fastard","director":"Werner Herzog","year":2026,"tmdb_id":1429713,"imdb_id":"tt35670577","original_title":"Bucking Fastard","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2291','movie',2291,'{"id":2291,"title":"A Place to Heal","director":"Cédric Kahn","year":2026,"tmdb_id":1429602,"imdb_id":"tt42826707","original_title":"15/18","original_language":"fr","alternate_titles":["15/18 (A Place To Heal)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2292','movie',2292,'{"id":2292,"title":"DAU","director":"Ilya Khrzhanovsky","year":2026,"tmdb_id":1734147,"imdb_id":"tt43702526","original_title":"DAU","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2293','movie',2293,'{"id":2293,"title":"Possible Love","director":"Lee Chang-dong","year":2026,"tmdb_id":1483525,"imdb_id":"tt37803364","original_title":"가능한 사랑","original_language":"ko","alternate_titles":["Ga-neung-han sa-rang (Possible love)","Ga-neung-han sa-rang"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2294','movie',2294,'{"id":2294,"title":"Wild Horse Nine","director":"Martin McDonagh","year":2026,"tmdb_id":891621,"imdb_id":"tt15799564","original_title":"Wild Horse Nine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2295','movie',2295,'{"id":2295,"title":"It Will Happen Tonight","director":"Nanni Moretti","year":2026,"tmdb_id":1499546,"imdb_id":"tt37341481","original_title":"Succederà questa notte","original_language":"it","alternate_titles":["Succederà questa notte (It will happen tonight)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2296','movie',2296,'{"id":2296,"title":"The Echo Chamber","director":"Andrea Pallaoro","year":2026,"tmdb_id":1576934,"imdb_id":"tt9395802","original_title":"The Echo Chamber","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2297','movie',2297,'{"id":2297,"title":"One Minute to Midnight","director":"Nicolas Pariser","year":2026,"tmdb_id":1480672,"imdb_id":"tt38807757","original_title":"Un peu avant minuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2298','movie',2298,'{"id":2298,"title":"The Spiral","director":"Paolo Strippoli","year":2026,"tmdb_id":1412795,"imdb_id":"tt23411728","original_title":"L''estranea","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2299','movie',2299,'{"id":2299,"title":"Mr. Nelson, Did You Kill People?","director":"Shinya Tsukamoto","year":2026,"tmdb_id":1497946,"imdb_id":"tt41240964","original_title":"ネルソンさん、あなたは人を殺しましたか？","original_language":"ja","alternate_titles":["Nelson san, anata wa hito wo koroshimashitaka? (Mr. Nelson, Did You Kill People?)","Nelson san, anata wa hito wo koroshimashitaka?"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2300','movie',2300,'{"id":2300,"title":"Bunker","director":"Florian Zeller","year":2026,"tmdb_id":1473784,"imdb_id":"tt36770512","original_title":"Bunker","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2301','movie',2301,'{"id":2301,"title":"A New Dawn","director":"Yoshitoshi Shinomiya","year":2026,"tmdb_id":1279865,"imdb_id":"tt32192760","original_title":"花緑青が明ける日に","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2302','movie',2302,'{"id":2302,"title":"At the Sea","director":"Kornél Mundruczó","year":2026,"tmdb_id":1279548,"imdb_id":"tt32203967","original_title":"At the Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2303','movie',2303,'{"id":2303,"title":"In a Whisper","director":"Leyla Bouzid","year":2026,"tmdb_id":1119547,"imdb_id":"tt33515714","original_title":"À voix basse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2304','movie',2304,'{"id":2304,"title":"Dao","director":"Alain Gomis","year":2026,"tmdb_id":1135582,"imdb_id":"tt32358921","original_title":"Dao","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2305','movie',2305,'{"id":2305,"title":"Dust","director":"Anke Blondé","year":2026,"tmdb_id":1001375,"imdb_id":"tt8977670","original_title":"Dust","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2306','movie',2306,'{"id":2306,"title":"Home Stories","director":"Eva Trobisch","year":2026,"tmdb_id":1299061,"imdb_id":"tt39382755","original_title":"Etwas ganz Besonderes","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2307','movie',2307,'{"id":2307,"title":"Everybody Digs Bill Evans","director":"Grant Gee","year":2026,"tmdb_id":1378791,"imdb_id":"tt34347792","original_title":"Everybody Digs Bill Evans","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2308','movie',2308,'{"id":2308,"title":"Yellow Letters","director":"İlker Çatak","year":2026,"tmdb_id":1315657,"imdb_id":"tt32888226","original_title":"Gelbe Briefe","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2309','movie',2309,'{"id":2309,"title":"Josephine","director":"Beth de Araújo","year":2026,"tmdb_id":1299329,"imdb_id":"tt32321285","original_title":"Josephine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2310','movie',2310,'{"id":2310,"title":"Salvation","director":"Emin Alper","year":2026,"tmdb_id":1401106,"imdb_id":"tt36472181","original_title":"Kurtuluş","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2311','movie',2311,'{"id":2311,"title":"My Wife Cries","director":"Angela Schanelec","year":2026,"tmdb_id":1152312,"imdb_id":"tt34934816","original_title":"Meine Frau weint","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2312','movie',2312,'{"id":2312,"title":"Flies","director":"Fernando Eimbcke","year":2026,"tmdb_id":1437703,"imdb_id":"tt35854741","original_title":"Moscas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2313','movie',2313,'{"id":2313,"title":"Nina Roza","director":"Geneviève Dulude-De Celles","year":2026,"tmdb_id":1527449,"imdb_id":"tt29271639","original_title":"Nina Roza","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2314','movie',2314,'{"id":2314,"title":"Queen at Sea","director":"Lance Hammer","year":2026,"tmdb_id":1021848,"imdb_id":"tt27541205","original_title":"Queen at Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2315','movie',2315,'{"id":2315,"title":"Rose","director":"Markus Schleinzer","year":2026,"tmdb_id":1176962,"imdb_id":"tt25399154","original_title":"Rose","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2316','movie',2316,'{"id":2316,"title":"Rosebush Pruning","director":"Karim Aïnouz","year":2026,"tmdb_id":1130948,"imdb_id":"tt27844906","original_title":"Rosebush Pruning","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2317','movie',2317,'{"id":2317,"title":"Soumsoum, the Night of the Stars","director":"Mahamat-Saleh Haroun","year":2026,"tmdb_id":1376457,"imdb_id":"tt39075020","original_title":"Soumsoum, la nuit des astres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2318','movie',2318,'{"id":2318,"title":"The Loneliest Man in Town","director":"Tizza Covi, Rainer Frimmel","year":2026,"tmdb_id":1426957,"imdb_id":"tt39382808","original_title":"The Loneliest Man in Town","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2319','movie',2319,'{"id":2319,"title":"Wolfram","director":"Warwick Thornton","year":2026,"tmdb_id":1476362,"imdb_id":"tt36826227","original_title":"Wolfram","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2320','movie',2320,'{"id":2320,"title":"We Are All Strangers","director":"Anthony Chen","year":2026,"tmdb_id":884692,"imdb_id":"tt13848364","original_title":"我们不是陌生人","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2321','movie',2321,'{"id":2321,"title":"Yo (Love Is a Rebellious Bird)","director":"Anna Fitch, Banker White","year":2026,"tmdb_id":1619820,"imdb_id":"tt39382829","original_title":"Yo (Love Is a Rebellious Bird)","original_language":"en","alternate_titles":["Yo","Love is a Rebellious Bird"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2322','movie',2322,'{"id":2322,"title":"Nightborn","director":"Hanna Bergholm","year":2026,"tmdb_id":964849,"imdb_id":"tt34383465","original_title":"Yön lapsi","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2323','movie',2323,'{"id":2323,"title":"Cutting Through Rocks","director":"Sara Khaki, Mohammad Reza Eyni","year":2025,"tmdb_id":1400793,"imdb_id":"tt10196414","original_title":"Cutting Through Rocks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2324','movie',2324,'{"id":2324,"title":"The Unknown","director":"Arthur Harari","year":2026,"tmdb_id":1182935,"imdb_id":"tt32359586","original_title":"L’inconnue","original_language":"fr","alternate_titles":["The Unknown Woman"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2325','movie',2325,'{"id":2325,"title":"Sheep in the Box","director":"Hirokazu Kore-eda","year":2026,"tmdb_id":1553969,"imdb_id":"tt38551209","original_title":"箱の中の羊","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2326','movie',2326,'{"id":2326,"title":"Look Back","director":"Hirokazu Kore-eda","year":2026,"tmdb_id":1591675,"imdb_id":"tt39094466","original_title":"ルックバック","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2327','movie',2327,'{"id":2327,"title":"Primetime","director":"Lance Oppenheim","year":2026,"tmdb_id":1375441,"imdb_id":"tt34206385","original_title":"Primetime","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2328','movie',2328,'{"id":2328,"title":"Teenage Sex and Death at Camp Miasma","director":"Jane Schoenbrun","year":2026,"tmdb_id":1240889,"imdb_id":"tt35298123","original_title":"Teenage Sex and Death at Camp Miasma","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2329','movie',2329,'{"id":2329,"title":"Elephants in the Fog","director":"Abinash Bikram Shah","year":2026,"tmdb_id":1661926,"imdb_id":"tt29279937","original_title":"तिनीहरू","original_language":"ne","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2330','movie',2330,'{"id":2330,"title":"Iron Boy","director":"Louis Clichy","year":2026,"tmdb_id":947493,"imdb_id":"tt36639956","original_title":"Le corset","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2331','movie',2331,'{"id":2331,"title":"Ben''Imana","director":"Marie-Clémentine Dusabejambo","year":2027,"tmdb_id":1405200,"imdb_id":"tt38820979","original_title":"Ben''Imana","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2332','movie',2332,'{"id":2332,"title":"Congo Boy","director":"Rafiki Fariala","year":2026,"tmdb_id":1666683,"imdb_id":"tt41592086","original_title":"Congo Boy","original_language":"sg","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2333','movie',2333,'{"id":2333,"title":"Club Kid","director":"Jordan Firstman","year":2026,"tmdb_id":1585239,"imdb_id":"tt38058097","original_title":"Club Kid","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2334','movie',2334,'{"id":2334,"title":"A Girl’s Story","director":"Judith Godrèche","year":2026,"tmdb_id":1514891,"imdb_id":"tt39088978","original_title":"Mémoire de fille","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2335','movie',2335,'{"id":2335,"title":"Ulya","director":"Viesturs Kairišs","year":2026,"tmdb_id":1490241,"imdb_id":"tt26751523","original_title":"Uļa","original_language":"lv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2336','movie',2336,'{"id":2336,"title":"Titanic Ocean","director":"Konstantina Kotzamani","year":2026,"tmdb_id":1000843,"imdb_id":"tt15437998","original_title":"Titanic Ocean","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2337','movie',2337,'{"id":2337,"title":"Strawberries","director":"Laïla Marrakchi","year":2027,"tmdb_id":1404582,"imdb_id":"tt36629723","original_title":"La más dulce","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2338','movie',2338,'{"id":2338,"title":"The Meltdown","director":"Manuela Martelli","year":2026,"tmdb_id":1210268,"imdb_id":"tt39571626","original_title":"El deshielo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2339','movie',2339,'{"id":2339,"title":"Forever Your Maternal Animal","director":"Valentina Maurel","year":2026,"tmdb_id":1661932,"imdb_id":"tt41592077","original_title":"Siempre soy tu animal materno","original_language":"es","alternate_titles":["Always Your Maternal Animal"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2340','movie',2340,'{"id":2340,"title":"Yesterday the Eye Didn''t Sleep","director":"Rakan Mayasi","year":2026,"tmdb_id":1529849,"imdb_id":"tt37775830","original_title":"البارح العين ما نامت","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2341','movie',2341,'{"id":2341,"title":"I''ll Be Gone in June","director":"Katharina Rivilis","year":2026,"tmdb_id":1441105,"imdb_id":"tt23143606","original_title":"I''ll Be Gone in June","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2342','movie',2342,'{"id":2342,"title":"Words of Love","director":"Rudi Rosenberg","year":2026,"tmdb_id":1544163,"imdb_id":"tt39969491","original_title":"Quelques mots d''amour","original_language":"fr","alternate_titles":["Of Love"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2343','movie',2343,'{"id":2343,"title":"Everytime","director":"Sandra Wollner","year":2026,"tmdb_id":1655419,"imdb_id":"tt41592057","original_title":"Everytime","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2344','movie',2344,'{"id":2344,"title":"Victorian Psycho","director":"Zachary Wigon","year":2026,"tmdb_id":1379486,"imdb_id":"tt34374553","original_title":"Victorian Psycho","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2345','movie',2345,'{"id":2345,"title":"All the Lovers in the Night","director":"Yukiko Sode","year":2026,"tmdb_id":1560309,"imdb_id":"tt41592995","original_title":"すべて真夜中の恋人たち","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2346','movie',2346,'{"id":2346,"title":"Ulysse","director":"Laetitia Masson","year":2026,"tmdb_id":1383287,"imdb_id":"tt42007282","original_title":"Ulysse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2347','movie',2347,'{"id":2347,"title":"The Burning Giants","director":"Phuttiphong Aroonpheng","year":2026,"tmdb_id":1730542,"imdb_id":"tt29495221","original_title":"ยักษ์ไหม้","original_language":"th","alternate_titles":["Yak Mai"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2348','movie',2348,'{"id":2348,"title":"What Belongs to Others","director":"Grzegorz Dębowski","year":2026,"tmdb_id":1736461,"imdb_id":"tt43704165","original_title":"Cudze rzeczy","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2349','movie',2349,'{"id":2349,"title":"A Common Story","director":"Anna Foglietta","year":2026,"tmdb_id":1597196,"imdb_id":"tt39307632","original_title":"Una storia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2350','movie',2350,'{"id":2350,"title":"The City of the Living","director":"Edoardo Gabbriellini","year":2026,"tmdb_id":1632103,"imdb_id":"tt40071725","original_title":"La città dei vivi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2351','movie',2351,'{"id":2351,"title":"Too Much Sugar","director":"Robert Greene","year":2026,"tmdb_id":1736499,"imdb_id":"tt43704169","original_title":"Too Much Sugar","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2352','movie',2352,'{"id":2352,"title":"The Difficult Bride","director":"Rubaiyat Hossain","year":2026,"tmdb_id":1593299,"imdb_id":"tt42827406","original_title":"The Difficult Bride","original_language":"bn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2353','movie',2353,'{"id":2353,"title":"Children of the Monkey","director":"Tommaso Landucci","year":2026,"tmdb_id":1554129,"imdb_id":"tt39390583","original_title":"I figli della scimmia","original_language":"it","alternate_titles":["The Children of the Monkey"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2354','movie',2354,'{"id":2354,"title":"A Day in the Life of Jo: Chapter Phaedra","director":"Jacqueline Lentzou","year":2026,"tmdb_id":1510542,"imdb_id":"tt43704171","original_title":"Mia mera sti zoi tis Tzo: Kefalaio Faidra","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2355','movie',2355,'{"id":2355,"title":"Oasis","director":"Jannis Lenz","year":2027,"tmdb_id":1470034,"imdb_id":"tt43704174","original_title":"Oase","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2356','movie',2356,'{"id":2356,"title":"Until the Day Ends","director":"Jelena Maksimović","year":2026,"tmdb_id":1531947,"imdb_id":"tt37919722","original_title":"Do kraja dana","original_language":"sr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2357','movie',2357,'{"id":2357,"title":"The Girl with the Leica","director":"Alina Marazzi","year":2026,"tmdb_id":1544437,"imdb_id":"tt38024578","original_title":"La ragazza con la Leica","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2358','movie',2358,'{"id":2358,"title":"La Moula","director":"Jérôme Pierrat","year":2026,"tmdb_id":1736501,"imdb_id":"tt43704178","original_title":"La Moula","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2359','movie',2359,'{"id":2359,"title":"Lovers in the Blue Night","director":"Anuparna Roy","year":2026,"tmdb_id":1699532,"imdb_id":"tt42824418","original_title":"लवर्स इन द ब्लू नाइट","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2360','movie',2360,'{"id":2360,"title":"Diane In The Loop","director":"Ann Sirot, Raphaël Balboni","year":2027,"tmdb_id":1404588,"imdb_id":"tt38693221","original_title":"Un détour par Diane","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2361','movie',2361,'{"id":2361,"title":"The Color of the Sun","director":"Xavier Tera","year":2026,"tmdb_id":1736503,"imdb_id":"tt37537532","original_title":"太陽ぬ色","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2362','movie',2362,'{"id":2362,"title":"Eklipse","director":"Manuel Wetscher","year":2026,"tmdb_id":1724831,"imdb_id":"tt43635409","original_title":"Eklipse","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2363','movie',2363,'{"id":2363,"title":"17","director":"Kosara Mitić","year":2026,"tmdb_id":1619815,"imdb_id":"tt37775862","original_title":"17","original_language":"mk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2364','movie',2364,'{"id":2364,"title":"Animol","director":"Ashley Walters","year":2026,"tmdb_id":1425784,"imdb_id":"tt33995791","original_title":"Animol","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2365','movie',2365,'{"id":2365,"title":"Chronicles from the Siege","director":"Abdallah Al-Khatib","year":2026,"tmdb_id":1400378,"imdb_id":"tt34734549","original_title":"Chroniques des années de siège","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2366','movie',2366,'{"id":2366,"title":"The River Train","director":"Lorenzo Ferro, Lucas A. Vignale","year":2026,"tmdb_id":1574074,"imdb_id":"tt39381628","original_title":"El Tren Fluvial","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2367','movie',2367,'{"id":2367,"title":"Filipiñana","director":"Rafael Manuel","year":2026,"tmdb_id":1417935,"imdb_id":"tt29512008","original_title":"Filipiñana","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2368','movie',2368,'{"id":2368,"title":"Forest High","director":"Manon Coubia","year":2026,"tmdb_id":1414395,"imdb_id":"tt39381659","original_title":"Forêt Ivre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2369','movie',2369,'{"id":2369,"title":"The Red Hangar","director":"Juan Pablo Sallato","year":2026,"tmdb_id":1563588,"imdb_id":"tt37664358","original_title":"Hangar Rojo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2370','movie',2370,'{"id":2370,"title":"Trial of Hein","director":"Kai Stänicke","year":2026,"tmdb_id":1476466,"imdb_id":"tt33522697","original_title":"Der Heimatlose","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2371','movie',2371,'{"id":2371,"title":"Our Secret","director":"Grace Passô","year":2026,"tmdb_id":1399253,"imdb_id":"tt39382724","original_title":"Nosso Segredo","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2372','movie',2372,'{"id":2372,"title":"A Prayer for the Dying","director":"Dara Van Dusen","year":2026,"tmdb_id":1241046,"imdb_id":"tt31183803","original_title":"A Prayer for the Dying","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2373','movie',2373,'{"id":2373,"title":"Take Me Home","director":"Liz Sargent","year":2026,"tmdb_id":1569461,"imdb_id":"tt37263549","original_title":"Take Me Home","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2374','movie',2374,'{"id":2374,"title":"Truly Naked","director":"Muriel d''Ansembourg","year":2026,"tmdb_id":1281195,"imdb_id":"tt8760666","original_title":"Truly Naked","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2375','movie',2375,'{"id":2375,"title":"Where To?","director":"Assaf Machnes","year":2026,"tmdb_id":1619818,"imdb_id":"tt35253781","original_title":"לאן / لوين","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2376','movie',2376,'{"id":2376,"title":"Light Pillar","director":"Zao Xu","year":2026,"tmdb_id":1601885,"imdb_id":"tt32409947","original_title":"寒夜灯柱","original_language":"zh","alternate_titles":["Han ye deng zhu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2377','movie',2377,'{"id":2377,"title":"Falling House","director":"Mohsen Gharaie","year":2026,"tmdb_id":1736497,"imdb_id":"tt43704167","original_title":"مراقب","original_language":"fa","alternate_titles":["Moragheb"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2378','movie',2378,'{"id":2378,"title":"House of the Wind","director":"Auguste Kouemo Yanghu","year":2026,"tmdb_id":1404592,"imdb_id":"tt20244858","original_title":"La Maison du vent","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2379','movie',2379,'{"id":2379,"title":"Big Little Things","director":"Michelle Tong Zhou","year":2026,"tmdb_id":1562901,"imdb_id":"tt37301443","original_title":"謊言生活","original_language":"cn","alternate_titles":["Huangyan shenghuo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:911430','movie:2254') on conflict do nothing;
insert into public.media_provider_links values('movie:1371185','movie:2255') on conflict do nothing;
insert into public.media_provider_links values('movie:1272149','movie:2256') on conflict do nothing;
insert into public.media_provider_links values('movie:1243006','movie:2257') on conflict do nothing;
insert into public.media_provider_links values('movie:1242454','movie:2258') on conflict do nothing;
insert into public.media_provider_links values('movie:1320400','movie:2259') on conflict do nothing;
insert into public.media_provider_links values('movie:1311031','movie:2260') on conflict do nothing;
insert into public.media_provider_links values('movie:997113','movie:2261') on conflict do nothing;
insert into public.media_provider_links values('movie:1230368','movie:2262') on conflict do nothing;
insert into public.media_provider_links values('movie:967941','movie:2263') on conflict do nothing;
insert into public.media_provider_links values('movie:1088548','movie:2264') on conflict do nothing;
insert into public.media_provider_links values('movie:1258181','movie:2265') on conflict do nothing;
insert into public.media_provider_links values('movie:1422041','movie:2266') on conflict do nothing;
insert into public.media_provider_links values('movie:1437981','movie:2267') on conflict do nothing;
insert into public.media_provider_links values('movie:1157869','movie:2268') on conflict do nothing;
insert into public.media_provider_links values('movie:1381273','movie:2269') on conflict do nothing;
insert into public.media_provider_links values('movie:1013822','movie:2270') on conflict do nothing;
insert into public.media_provider_links values('movie:1476614','movie:2271') on conflict do nothing;
insert into public.media_provider_links values('movie:1507877','movie:2272') on conflict do nothing;
insert into public.media_provider_links values('movie:1058424','movie:2273') on conflict do nothing;
insert into public.media_provider_links values('movie:1448971','movie:2274') on conflict do nothing;
insert into public.media_provider_links values('movie:1473148','movie:2275') on conflict do nothing;
insert into public.media_provider_links values('movie:1318864','movie:2276') on conflict do nothing;
insert into public.media_provider_links values('movie:1401459','movie:2277') on conflict do nothing;
insert into public.media_provider_links values('movie:1191818','movie:2278') on conflict do nothing;
insert into public.media_provider_links values('movie:1437925','movie:2279') on conflict do nothing;
insert into public.media_provider_links values('movie:1437696','movie:2280') on conflict do nothing;
insert into public.media_provider_links values('movie:1458914','movie:2281') on conflict do nothing;
insert into public.media_provider_links values('movie:1074074','movie:2282') on conflict do nothing;
insert into public.media_provider_links values('movie:1733908','movie:2283') on conflict do nothing;
insert into public.media_provider_links values('movie:1736490','movie:2284') on conflict do nothing;
insert into public.media_provider_links values('movie:1597199','movie:2285') on conflict do nothing;
insert into public.media_provider_links values('movie:1532610','movie:2286') on conflict do nothing;
insert into public.media_provider_links values('movie:1430815','movie:2287') on conflict do nothing;
insert into public.media_provider_links values('movie:1632188','movie:2288') on conflict do nothing;
insert into public.media_provider_links values('movie:1511780','movie:2289') on conflict do nothing;
insert into public.media_provider_links values('movie:1429713','movie:2290') on conflict do nothing;
insert into public.media_provider_links values('movie:1429602','movie:2291') on conflict do nothing;
insert into public.media_provider_links values('movie:1734147','movie:2292') on conflict do nothing;
insert into public.media_provider_links values('movie:1483525','movie:2293') on conflict do nothing;
insert into public.media_provider_links values('movie:891621','movie:2294') on conflict do nothing;
insert into public.media_provider_links values('movie:1499546','movie:2295') on conflict do nothing;
insert into public.media_provider_links values('movie:1576934','movie:2296') on conflict do nothing;
insert into public.media_provider_links values('movie:1480672','movie:2297') on conflict do nothing;
insert into public.media_provider_links values('movie:1412795','movie:2298') on conflict do nothing;
insert into public.media_provider_links values('movie:1497946','movie:2299') on conflict do nothing;
insert into public.media_provider_links values('movie:1473784','movie:2300') on conflict do nothing;
insert into public.media_provider_links values('movie:1279865','movie:2301') on conflict do nothing;
insert into public.media_provider_links values('movie:1279548','movie:2302') on conflict do nothing;
insert into public.media_provider_links values('movie:1119547','movie:2303') on conflict do nothing;
insert into public.media_provider_links values('movie:1135582','movie:2304') on conflict do nothing;
insert into public.media_provider_links values('movie:1001375','movie:2305') on conflict do nothing;
insert into public.media_provider_links values('movie:1299061','movie:2306') on conflict do nothing;
insert into public.media_provider_links values('movie:1378791','movie:2307') on conflict do nothing;
insert into public.media_provider_links values('movie:1315657','movie:2308') on conflict do nothing;
insert into public.media_provider_links values('movie:1299329','movie:2309') on conflict do nothing;
insert into public.media_provider_links values('movie:1401106','movie:2310') on conflict do nothing;
insert into public.media_provider_links values('movie:1152312','movie:2311') on conflict do nothing;
insert into public.media_provider_links values('movie:1437703','movie:2312') on conflict do nothing;
insert into public.media_provider_links values('movie:1527449','movie:2313') on conflict do nothing;
insert into public.media_provider_links values('movie:1021848','movie:2314') on conflict do nothing;
insert into public.media_provider_links values('movie:1176962','movie:2315') on conflict do nothing;
insert into public.media_provider_links values('movie:1130948','movie:2316') on conflict do nothing;
insert into public.media_provider_links values('movie:1376457','movie:2317') on conflict do nothing;
insert into public.media_provider_links values('movie:1426957','movie:2318') on conflict do nothing;
insert into public.media_provider_links values('movie:1476362','movie:2319') on conflict do nothing;
insert into public.media_provider_links values('movie:884692','movie:2320') on conflict do nothing;
insert into public.media_provider_links values('movie:1619820','movie:2321') on conflict do nothing;
insert into public.media_provider_links values('movie:964849','movie:2322') on conflict do nothing;
insert into public.media_provider_links values('movie:1400793','movie:2323') on conflict do nothing;
insert into public.media_provider_links values('movie:1182935','movie:2324') on conflict do nothing;
insert into public.media_provider_links values('movie:1553969','movie:2325') on conflict do nothing;
insert into public.media_provider_links values('movie:1591675','movie:2326') on conflict do nothing;
insert into public.media_provider_links values('movie:1375441','movie:2327') on conflict do nothing;
insert into public.media_provider_links values('movie:1240889','movie:2328') on conflict do nothing;
insert into public.media_provider_links values('movie:1661926','movie:2329') on conflict do nothing;
insert into public.media_provider_links values('movie:947493','movie:2330') on conflict do nothing;
insert into public.media_provider_links values('movie:1405200','movie:2331') on conflict do nothing;
insert into public.media_provider_links values('movie:1666683','movie:2332') on conflict do nothing;
insert into public.media_provider_links values('movie:1585239','movie:2333') on conflict do nothing;
insert into public.media_provider_links values('movie:1514891','movie:2334') on conflict do nothing;
insert into public.media_provider_links values('movie:1490241','movie:2335') on conflict do nothing;
insert into public.media_provider_links values('movie:1000843','movie:2336') on conflict do nothing;
insert into public.media_provider_links values('movie:1404582','movie:2337') on conflict do nothing;
insert into public.media_provider_links values('movie:1210268','movie:2338') on conflict do nothing;
insert into public.media_provider_links values('movie:1661932','movie:2339') on conflict do nothing;
insert into public.media_provider_links values('movie:1529849','movie:2340') on conflict do nothing;
insert into public.media_provider_links values('movie:1441105','movie:2341') on conflict do nothing;
insert into public.media_provider_links values('movie:1544163','movie:2342') on conflict do nothing;
insert into public.media_provider_links values('movie:1655419','movie:2343') on conflict do nothing;
insert into public.media_provider_links values('movie:1379486','movie:2344') on conflict do nothing;
insert into public.media_provider_links values('movie:1560309','movie:2345') on conflict do nothing;
insert into public.media_provider_links values('movie:1383287','movie:2346') on conflict do nothing;
insert into public.media_provider_links values('movie:1730542','movie:2347') on conflict do nothing;
insert into public.media_provider_links values('movie:1736461','movie:2348') on conflict do nothing;
insert into public.media_provider_links values('movie:1597196','movie:2349') on conflict do nothing;
insert into public.media_provider_links values('movie:1632103','movie:2350') on conflict do nothing;
insert into public.media_provider_links values('movie:1736499','movie:2351') on conflict do nothing;
insert into public.media_provider_links values('movie:1593299','movie:2352') on conflict do nothing;
insert into public.media_provider_links values('movie:1554129','movie:2353') on conflict do nothing;
insert into public.media_provider_links values('movie:1510542','movie:2354') on conflict do nothing;
insert into public.media_provider_links values('movie:1470034','movie:2355') on conflict do nothing;
insert into public.media_provider_links values('movie:1531947','movie:2356') on conflict do nothing;
insert into public.media_provider_links values('movie:1544437','movie:2357') on conflict do nothing;
insert into public.media_provider_links values('movie:1736501','movie:2358') on conflict do nothing;
insert into public.media_provider_links values('movie:1699532','movie:2359') on conflict do nothing;
insert into public.media_provider_links values('movie:1404588','movie:2360') on conflict do nothing;
insert into public.media_provider_links values('movie:1736503','movie:2361') on conflict do nothing;
insert into public.media_provider_links values('movie:1724831','movie:2362') on conflict do nothing;
insert into public.media_provider_links values('movie:1619815','movie:2363') on conflict do nothing;
insert into public.media_provider_links values('movie:1425784','movie:2364') on conflict do nothing;
insert into public.media_provider_links values('movie:1400378','movie:2365') on conflict do nothing;
insert into public.media_provider_links values('movie:1574074','movie:2366') on conflict do nothing;
insert into public.media_provider_links values('movie:1417935','movie:2367') on conflict do nothing;
insert into public.media_provider_links values('movie:1414395','movie:2368') on conflict do nothing;
insert into public.media_provider_links values('movie:1563588','movie:2369') on conflict do nothing;
insert into public.media_provider_links values('movie:1476466','movie:2370') on conflict do nothing;
insert into public.media_provider_links values('movie:1399253','movie:2371') on conflict do nothing;
insert into public.media_provider_links values('movie:1241046','movie:2372') on conflict do nothing;
insert into public.media_provider_links values('movie:1569461','movie:2373') on conflict do nothing;
insert into public.media_provider_links values('movie:1281195','movie:2374') on conflict do nothing;
insert into public.media_provider_links values('movie:1619818','movie:2375') on conflict do nothing;
insert into public.media_provider_links values('movie:1601885','movie:2376') on conflict do nothing;
insert into public.media_provider_links values('movie:1736497','movie:2377') on conflict do nothing;
insert into public.media_provider_links values('movie:1404592','movie:2378') on conflict do nothing;
insert into public.media_provider_links values('movie:1562901','movie:2379') on conflict do nothing;
commit;

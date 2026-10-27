-- Berlinale 2021–2025: 132 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:661591','movie:2806',661591),
('movie:620498','movie:2807',620498),
('movie:669401','movie:2808',669401),
('movie:795811','movie:2809',795811),
('movie:795812','movie:2810',795812),
('movie:795813','movie:2811',795813),
('movie:795797','movie:2812',795797),
('movie:633949','movie:2813',633949),
('movie:681349','movie:2814',681349),
('movie:795815','movie:2815',795815),
('movie:795818','movie:2816',795818),
('movie:669661','movie:2817',669661),
('movie:701524','movie:2818',701524),
('movie:795763','movie:2819',795763),
('movie:659954','movie:2820',659954),
('movie:633811','movie:2821',633811),
('movie:517815','movie:2822',517815),
('movie:795587','movie:2823',795587),
('movie:795761','movie:2824',795761),
('movie:660946','movie:2825',660946),
('movie:795760','movie:2826',795760),
('movie:794691','movie:2827',794691),
('movie:749645','movie:2828',749645),
('movie:723377','movie:2829',723377),
('movie:795757','movie:2830',795757),
('movie:928709','movie:2831',928709),
('movie:804251','movie:2832',804251),
('movie:768757','movie:2833',768757),
('movie:579496','movie:2834',579496),
('movie:728499','movie:2835',728499),
('movie:928715','movie:2836',928715),
('movie:926332','movie:2837',926332),
('movie:822177','movie:2838',822177),
('movie:895659','movie:2839',895659),
('movie:859933','movie:2840',859933),
('movie:807862','movie:2841',807862),
('movie:915960','movie:2842',915960),
('movie:505570','movie:2843',505570),
('movie:928718','movie:2844',928718),
('movie:928713','movie:2845',928713),
('movie:769466','movie:2846',769466),
('movie:925181','movie:2847',925181),
('movie:928720','movie:2848',928720),
('movie:928723','movie:2849',928723),
('movie:928206','movie:2850',928206),
('movie:928725','movie:2851',928725),
('movie:619165','movie:2852',619165),
('movie:920772','movie:2853',920772),
('movie:928727','movie:2854',928727),
('movie:848818','movie:2855',848818),
('movie:928728','movie:2856',928728),
('movie:928729','movie:2857',928729),
('movie:928730','movie:2858',928730),
('movie:928731','movie:2859',928731),
('movie:928733','movie:2860',928733),
('movie:928735','movie:2861',928735),
('movie:749136','movie:2862',749136),
('movie:928737','movie:2863',928737),
('movie:1053600','movie:2864',1053600),
('movie:954905','movie:2865',954905),
('movie:1075840','movie:2866',1075840),
('movie:1069164','movie:2867',1069164),
('movie:1016084','movie:2868',1016084),
('movie:922830','movie:2869',922830),
('movie:978580','movie:2870',978580),
('movie:1045205','movie:2871',1045205),
('movie:920767','movie:2872',920767),
('movie:1077670','movie:2873',1077670),
('movie:1648274','movie:2874',1648274),
('movie:843942','movie:2875',843942),
('movie:666942','movie:2876',666942),
('movie:1070449','movie:2877',1070449),
('movie:1024707','movie:2878',1024707),
('movie:958186','movie:2879',958186),
('movie:1077675','movie:2880',1077675),
('movie:1062526','movie:2881',1062526),
('movie:1077676','movie:2882',1077676),
('movie:1077678','movie:2883',1077678),
('movie:1077680','movie:2884',1077680),
('movie:1077748','movie:2885',1077748),
('movie:587384','movie:2886',587384),
('movie:1077647','movie:2887',1077647),
('movie:925920','movie:2888',925920),
('movie:1077683','movie:2889',1077683),
('movie:1077684','movie:2890',1077684),
('movie:1077685','movie:2891',1077685),
('movie:1077661','movie:2892',1077661),
('movie:1077686','movie:2893',1077686),
('movie:1065879','movie:2894',1065879),
('movie:1087593','movie:2895',1087593),
('movie:1234597','movie:2896',1234597),
('movie:662402','movie:2897',662402),
('movie:1231035','movie:2898',1231035),
('movie:1119625','movie:2899',1119625),
('movie:1070319','movie:2900',1070319),
('movie:1234591','movie:2901',1234591),
('movie:966238','movie:2902',966238),
('movie:803690','movie:2903',803690),
('movie:794090','movie:2904',794090),
('movie:1172241','movie:2905',1172241),
('movie:1234593','movie:2906',1234593),
('movie:1232781','movie:2907',1232781),
('movie:1113120','movie:2908',1113120),
('movie:1146410','movie:2909',1146410),
('movie:889820','movie:2910',889820),
('movie:749116','movie:2911',749116),
('movie:1234590','movie:2912',1234590),
('movie:1234601','movie:2913',1234601),
('movie:1234602','movie:2914',1234602),
('movie:940770','movie:2915',940770),
('movie:1234586','movie:2916',1234586),
('movie:1234607','movie:2917',1234607),
('movie:1081918','movie:2918',1081918),
('movie:1234619','movie:2919',1234619),
('movie:887180','movie:2920',887180),
('movie:1234603','movie:2921',1234603),
('movie:1234620','movie:2922',1234620),
('movie:1200753','movie:2923',1200753),
('movie:1201056','movie:2924',1201056),
('movie:1421142','movie:2925',1421142),
('movie:1421128','movie:2926',1421128),
('movie:931942','movie:2927',931942),
('movie:1421132','movie:2928',1421132),
('movie:1421136','movie:2929',1421136),
('movie:1338552','movie:2930',1338552),
('movie:1269315','movie:2931',1269315),
('movie:1373976','movie:2932',1373976),
('movie:1294706','movie:2933',1294706),
('movie:1400756','movie:2934',1400756),
('movie:1054283','movie:2935',1054283),
('movie:1338472','movie:2936',1338472),
('movie:1091196','movie:2937',1091196)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2806','movie',2806,'{"id":2806,"title":"Drift Away","director":"Xavier Beauvois","year":2020,"tmdb_id":661591,"imdb_id":"tt11781806","original_title":"Albatros","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2807','movie',2807,'{"id":2807,"title":"Fabian: Going to the Dogs","director":"Dominik Graf","year":2021,"tmdb_id":620498,"imdb_id":"tt13846414","original_title":"Fabian oder der Gang vor die Hunde","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2808','movie',2808,'{"id":2808,"title":"Ballad of a White Cow","director":"Behtash Sanaeeha, Maryam Moghaddam","year":2020,"tmdb_id":669401,"imdb_id":"tt11773484","original_title":"قصیده گاو سفید","original_language":"fa","alternate_titles":["Ghasideyeh gave sefid"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2809','movie',2809,'{"id":2809,"title":"Wheel of Fortune and Fantasy","director":"Ryusuke Hamaguchi","year":2021,"tmdb_id":795811,"imdb_id":"tt14034966","original_title":"偶然と想像","original_language":"ja","alternate_titles":["Guzen to sozo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2810','movie',2810,'{"id":2810,"title":"Mr. Bachmann and His Class","director":"Maria Speth","year":2021,"tmdb_id":795812,"imdb_id":"tt14035048","original_title":"Herr Bachmann und seine Klasse","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2811','movie',2811,'{"id":2811,"title":"I''m Your Man","director":"Maria Schrader","year":2021,"tmdb_id":795813,"imdb_id":"tt13087796","original_title":"Ich bin dein Mensch","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2812','movie',2812,'{"id":2812,"title":"Introduction","director":"Hong Sang-soo","year":2020,"tmdb_id":795797,"imdb_id":"tt14035108","original_title":"인트로덕션","original_language":"ko","alternate_titles":["Inteurodeoksyeon"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2813','movie',2813,'{"id":2813,"title":"Memory Box","director":"Joana Hadjithomas, Khalil Joreige","year":2021,"tmdb_id":633949,"imdb_id":"tt7265490","original_title":"Memory Box","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2814','movie',2814,'{"id":2814,"title":"Next Door","director":"Daniel Brühl","year":2021,"tmdb_id":681349,"imdb_id":"tt11080676","original_title":"Nebenan","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2815','movie',2815,'{"id":2815,"title":"What Do We See When We Look at the Sky?","director":"Alexandre Koberidze","year":2021,"tmdb_id":795815,"imdb_id":"tt14035154","original_title":"რას ვხედავთ, როდესაც ცას ვუყურებთ?","original_language":"ka","alternate_titles":["Ras vkhedavt, rodesac cas vukurebt?","Was sehen wir, wenn wir zum Himmel schauen?"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2816','movie',2816,'{"id":2816,"title":"Forest: I See You Everywhere","director":"Benedek Fliegauf","year":2020,"tmdb_id":795818,"imdb_id":"tt14033416","original_title":"Rengeteg - mindenhol látlak","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2817','movie',2817,'{"id":2817,"title":"Natural Light","director":"Dénes Nagy","year":2020,"tmdb_id":669661,"imdb_id":"tt11681056","original_title":"Természetes fény","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2818','movie',2818,'{"id":2818,"title":"A Cop Movie","director":"Alonso Ruizpalacios","year":2021,"tmdb_id":701524,"imdb_id":"tt14035242","original_title":"Una película de policías","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2819','movie',2819,'{"id":2819,"title":"As I Want","director":"Samaher Alqadi","year":2021,"tmdb_id":795763,"imdb_id":"tt14122260","original_title":"كما أريد","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2820','movie',2820,'{"id":2820,"title":"Azor","director":"Andreas Fontana","year":2021,"tmdb_id":659954,"imdb_id":"tt11136276","original_title":"Azor","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2821','movie',2821,'{"id":2821,"title":"Bloodsuckers","director":"Julian Radlmaier","year":2021,"tmdb_id":633811,"imdb_id":"tt11261296","original_title":"Blutsauger","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2822','movie',2822,'{"id":2822,"title":"The Girl and the Spider","director":"Ramon Zürcher, Silvan Zürcher","year":2021,"tmdb_id":517815,"imdb_id":"tt11967484","original_title":"Das Mädchen und die Spinne","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2823','movie',2823,'{"id":2823,"title":"Social Hygiene","director":"Denis Côté","year":2021,"tmdb_id":795587,"imdb_id":"tt14038552","original_title":"Hygiène sociale","original_language":"fr","alternate_titles":["Sozialhygiene"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2824','movie',2824,'{"id":2824,"title":"District Terminal","director":"Ehsan Mirhosseini, Bardia Yadegari","year":2021,"tmdb_id":795761,"imdb_id":"tt14038568","original_title":"Mantagheye payani","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2825','movie',2825,'{"id":2825,"title":"Moon, 66 Questions","director":"Jacqueline Lentzou","year":2021,"tmdb_id":660946,"imdb_id":"tt10783504","original_title":"Σελήνη, 66 Ερωτήσεις","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2826','movie',2826,'{"id":2826,"title":"We","director":"Alice Diop","year":2020,"tmdb_id":795760,"imdb_id":"tt14038600","original_title":"Nous","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2827','movie',2827,'{"id":2827,"title":"Rock Bottom Riser","director":"Fern Silva","year":2021,"tmdb_id":794691,"imdb_id":"tt14122284","original_title":"Rock Bottom Riser","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2828','movie',2828,'{"id":2828,"title":"The Beta Test","director":"PJ McCabe, Jim Cummings","year":2021,"tmdb_id":749645,"imdb_id":"tt11738830","original_title":"The Beta Test","original_language":"en","alternate_titles":["Der Betatest"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2829','movie',2829,'{"id":2829,"title":"The Scary of Sixty-First","director":"Dasha Nekrasova","year":2020,"tmdb_id":723377,"imdb_id":"tt12226872","original_title":"The Scary of Sixty-First","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2830','movie',2830,'{"id":2830,"title":"Taste","director":"Lê Bảo","year":2021,"tmdb_id":795757,"imdb_id":"tt6551842","original_title":"Vị","original_language":"vi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2831','movie',2831,'{"id":2831,"title":"A E I O U – A Quick Alphabet of Love","director":"Nicolette Krebitz","year":2022,"tmdb_id":928709,"imdb_id":"tt17154094","original_title":"A E I O U – Das schnelle Alphabet der Liebe","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2832','movie',2832,'{"id":2832,"title":"Alcarràs","director":"Carla Simón","year":2022,"tmdb_id":804251,"imdb_id":"tt11930126","original_title":"Alcarràs","original_language":"ca","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2833','movie',2833,'{"id":2833,"title":"Both Sides of the Blade","director":"Claire Denis","year":2021,"tmdb_id":768757,"imdb_id":"tt13535920","original_title":"Avec amour et acharnement","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2834','movie',2834,'{"id":2834,"title":"Call Jane","director":"Phyllis Nagy","year":2022,"tmdb_id":579496,"imdb_id":"tt7461272","original_title":"Call Jane","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2835','movie',2835,'{"id":2835,"title":"A Piece of Sky","director":"Michael Koch","year":2022,"tmdb_id":728499,"imdb_id":"tt14783042","original_title":"Drii Winter","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2836','movie',2836,'{"id":2836,"title":"Everything Will Be OK","director":"Rithy Panh","year":2021,"tmdb_id":928715,"imdb_id":"tt15386518","original_title":"Everything Will Be OK","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2837','movie',2837,'{"id":2837,"title":"The Line","director":"Ursula Meier","year":2022,"tmdb_id":926332,"imdb_id":"tt13086492","original_title":"La ligne","original_language":"fr","alternate_titles":["Die Linie"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2838','movie',2838,'{"id":2838,"title":"Leonora addio","director":"Paolo Taviani","year":2021,"tmdb_id":822177,"imdb_id":"tt13107800","original_title":"Leonora addio","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2839','movie',2839,'{"id":2839,"title":"The Passengers of the Night","director":"Mikhaël Hers","year":2022,"tmdb_id":895659,"imdb_id":"tt13846402","original_title":"Les Passagers de la nuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2840','movie',2840,'{"id":2840,"title":"Before, Now & Then","director":"Kamila Andini","year":2022,"tmdb_id":859933,"imdb_id":"tt15215918","original_title":"Nana","original_language":"su","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2841','movie',2841,'{"id":2841,"title":"Peter von Kant","director":"François Ozon","year":2021,"tmdb_id":807862,"imdb_id":"tt14336174","original_title":"Peter von Kant","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2842','movie',2842,'{"id":2842,"title":"Rabiye Kurnaz vs. George W. Bush","director":"Andreas Dresen","year":2022,"tmdb_id":915960,"imdb_id":"tt13471738","original_title":"Rabiye Kurnaz gegen George W. Bush","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2843','movie',2843,'{"id":2843,"title":"Rimini","director":"Ulrich Seidl","year":2022,"tmdb_id":505570,"imdb_id":"tt8956284","original_title":"Rimini","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2844','movie',2844,'{"id":2844,"title":"Robe of Gems","director":"Natalia López","year":2022,"tmdb_id":928718,"imdb_id":"tt17280362","original_title":"Manto de gemas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2845','movie',2845,'{"id":2845,"title":"The Novelist''s Film","director":"Hong Sang-soo","year":2021,"tmdb_id":928713,"imdb_id":"tt17146978","original_title":"소설가의 영화","original_language":"ko","alternate_titles":["So-seol-ga-ui yeong-hwa"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2846','movie',2846,'{"id":2846,"title":"One Year, One Night","director":"Isaki Lacuesta","year":2021,"tmdb_id":769466,"imdb_id":"tt14104600","original_title":"Un año, una noche","original_language":"es","alternate_titles":["Ein Jahr, eine Nacht"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2847','movie',2847,'{"id":2847,"title":"That Kind of Summer","director":"Denis Côté","year":2022,"tmdb_id":925181,"imdb_id":"tt16944826","original_title":"Un été comme ça","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2848','movie',2848,'{"id":2848,"title":"Return to Dust","director":"Li Ruijun","year":2022,"tmdb_id":928720,"imdb_id":"tt17097088","original_title":"隐入尘烟","original_language":"zh","alternate_titles":["Yin Ru Chen Yan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2849','movie',2849,'{"id":2849,"title":"A Little Love Package","director":"Gastón Solnicki","year":2022,"tmdb_id":928723,"imdb_id":"tt17305656","original_title":"A Little Love Package","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2850','movie',2850,'{"id":2850,"title":"See You Friday, Robinson","director":"Mitra Farahani","year":2022,"tmdb_id":928206,"imdb_id":"tt8841562","original_title":"À vendredi, Robinson","original_language":"fr","alternate_titles":["Bis Freitag, Robinson"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2851','movie',2851,'{"id":2851,"title":"Axiom","director":"Jöns Jönsson","year":2022,"tmdb_id":928725,"imdb_id":"tt14581084","original_title":"Axiom","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2852','movie',2852,'{"id":2852,"title":"Brother in Every Inch","director":"Alexander Zolotukhin","year":2022,"tmdb_id":619165,"imdb_id":"tt17307420","original_title":"Брат во всëм","original_language":"ru","alternate_titles":["Brat vo vsyom"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2853','movie',2853,'{"id":2853,"title":"Coma","director":"Bertrand Bonello","year":2022,"tmdb_id":920772,"imdb_id":"tt17308130","original_title":"Coma","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2854','movie',2854,'{"id":2854,"title":"Father''s Day","director":"Kivu Ruhorahoza","year":2022,"tmdb_id":928727,"imdb_id":"tt17308496","original_title":"Father''s Day","original_language":"rw","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2855','movie',2855,'{"id":2855,"title":"Flux Gourmet","director":"Peter Strickland","year":2022,"tmdb_id":848818,"imdb_id":"tt15010292","original_title":"Flux Gourmet","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2856','movie',2856,'{"id":2856,"title":"The City and the City","director":"Hristos Passalis, Syllas Tzoumerkas","year":2022,"tmdb_id":928728,"imdb_id":"tt14210824","original_title":"Η Πόλη Και Η Πόλη","original_language":"el","alternate_titles":["I Poli ke i Poli"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2857','movie',2857,'{"id":2857,"title":"American Journal","director":"Arnaud des Pallières","year":2022,"tmdb_id":928729,"imdb_id":"tt17309428","original_title":"Journal d''Amérique","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2858','movie',2858,'{"id":2858,"title":"Small, Slow But Steady","director":"Sho Miyake","year":2022,"tmdb_id":928730,"imdb_id":"tt17309864","original_title":"ケイコ 目を澄ませて","original_language":"ja","alternate_titles":["Keiko, me wo sumasete"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2859','movie',2859,'{"id":2859,"title":"Mutzenbacher","director":"Ruth Beckermann","year":2022,"tmdb_id":928731,"imdb_id":"tt17309916","original_title":"Mutzenbacher","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2860','movie',2860,'{"id":2860,"title":"Queens of the Qing Dynasty","director":"Ashley McKenzie","year":2022,"tmdb_id":928733,"imdb_id":"tt13368192","original_title":"Queens of the Qing Dynasty","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2861','movie',2861,'{"id":2861,"title":"Sun","director":"Kurdwin Ayub","year":2022,"tmdb_id":928735,"imdb_id":"tt15429106","original_title":"Sonne","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2862','movie',2862,'{"id":2862,"title":"Unrest","director":"Cyril Schäublin","year":2022,"tmdb_id":749136,"imdb_id":"tt11409736","original_title":"Unrueh","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2863','movie',2863,'{"id":2863,"title":"The Death of My Mother","director":"Jessica Krummacher","year":2022,"tmdb_id":928737,"imdb_id":"tt17009236","original_title":"Zum Tod meiner Mutter","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2864','movie',2864,'{"id":2864,"title":"20,000 Species of Bees","director":"Estibaliz Urresola Solaguren","year":2023,"tmdb_id":1053600,"imdb_id":"tt21113962","original_title":"20.000 especies de abejas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2865','movie',2865,'{"id":2865,"title":"Art College 1994","director":"Liu Jian","year":2023,"tmdb_id":954905,"imdb_id":"tt1872160","original_title":"艺术学院1994","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2866','movie',2866,'{"id":2866,"title":"The Shadowless Tower","director":"Zhang Lu","year":2022,"tmdb_id":1075840,"imdb_id":"tt26441793","original_title":"白塔之光","original_language":"zh","alternate_titles":["Bai Ta Zhi Guang","Der schattenlose Turm"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2867','movie',2867,'{"id":2867,"title":"Till the End of the Night","director":"Christoph Hochhäusler","year":2023,"tmdb_id":1069164,"imdb_id":"tt23283892","original_title":"Bis ans Ende der Nacht","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2868','movie',2868,'{"id":2868,"title":"BlackBerry","director":"Matt Johnson","year":2023,"tmdb_id":1016084,"imdb_id":"tt21867434","original_title":"BlackBerry","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2869','movie',2869,'{"id":2869,"title":"Disco Boy","director":"Giacomo Abbruzzese","year":2023,"tmdb_id":922830,"imdb_id":"tt22180518","original_title":"Disco Boy","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2870','movie',2870,'{"id":2870,"title":"Ingeborg Bachmann – Journey into the Desert","director":"Margarethe von Trotta","year":2023,"tmdb_id":978580,"imdb_id":"tt16103266","original_title":"Ingeborg Bachmann - Reise in die Wüste","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2871','movie',2871,'{"id":2871,"title":"Someday We''ll Tell Each Other Everything","director":"Emily Atef","year":2023,"tmdb_id":1045205,"imdb_id":"tt21654390","original_title":"Irgendwann werden wir uns alles erzählen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2872','movie',2872,'{"id":2872,"title":"The Plough","director":"Philippe Garrel","year":2022,"tmdb_id":920767,"imdb_id":"tt15531718","original_title":"Le Grand Chariot","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2873','movie',2873,'{"id":2873,"title":"Limbo","director":"Ivan Sen","year":2023,"tmdb_id":1077670,"imdb_id":"tt21833834","original_title":"Limbo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2874','movie',2874,'{"id":2874,"title":"Bad Living","director":"João Canijo","year":2023,"tmdb_id":1648274,"imdb_id":"tt14007288","original_title":"Mal Viver","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2875','movie',2875,'{"id":2875,"title":"Manodrome","director":"John Trengove","year":2023,"tmdb_id":843942,"imdb_id":"tt14813150","original_title":"Manodrome","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2876','movie',2876,'{"id":2876,"title":"Music","director":"Angela Schanelec","year":2023,"tmdb_id":666942,"imdb_id":"tt15547924","original_title":"Music","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2877','movie',2877,'{"id":2877,"title":"On the Adamant","director":"Nicolas Philibert","year":2022,"tmdb_id":1070449,"imdb_id":"tt26448811","original_title":"Sur l''Adamant","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2878','movie',2878,'{"id":2878,"title":"The Survival of Kindness","director":"Rolf de Heer","year":2022,"tmdb_id":1024707,"imdb_id":"tt15831022","original_title":"The Survival of Kindness","original_language":"en","alternate_titles":["Das Überleben der Freundlichkeit"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2879','movie',2879,'{"id":2879,"title":"Tótem","director":"Lila Avilés","year":2023,"tmdb_id":958186,"imdb_id":"tt26315142","original_title":"Tótem","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2880','movie',2880,'{"id":2880,"title":"The Klezmer Project","director":"Paloma Schachmann, Leandro Koch","year":2023,"tmdb_id":1077675,"imdb_id":"tt26448952","original_title":"Adentro mío estoy bailando","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2881','movie',2881,'{"id":2881,"title":"The Echo","director":"Tatiana Huezo","year":2023,"tmdb_id":1062526,"imdb_id":"tt26448953","original_title":"El eco","original_language":"es","alternate_titles":["Das Echo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2882','movie',2882,'{"id":2882,"title":"In the Blind Spot","director":"Ayşe Polat","year":2023,"tmdb_id":1077676,"imdb_id":"tt26448958","original_title":"Im toten Winkel","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2883','movie',2883,'{"id":2883,"title":"The Cage is Looking for a Bird","director":"Malika Musaeva","year":2023,"tmdb_id":1077678,"imdb_id":"tt26441515","original_title":"Клетка ищет птицу","original_language":"ce","alternate_titles":["Kletka ishet ptitsu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2884','movie',2884,'{"id":2884,"title":"The Walls of Bergamo","director":"Stefano Savona","year":2023,"tmdb_id":1077680,"imdb_id":"tt26448975","original_title":"Le mura di Bergamo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2885','movie',2885,'{"id":2885,"title":"My Worst Enemy","director":"Mehran Tamadon","year":2023,"tmdb_id":1077748,"imdb_id":"tt26448963","original_title":"Mon pire ennemi","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2886','movie',2886,'{"id":2886,"title":"White Plastic Sky","director":"Sarolta Szabó, Tibor Bánóczki","year":2023,"tmdb_id":587384,"imdb_id":"tt8096846","original_title":"Műanyag égbolt","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2887','movie',2887,'{"id":2887,"title":"In Water","director":"Hong Sang-soo","year":2023,"tmdb_id":1077647,"imdb_id":"tt26448971","original_title":"물안에서","original_language":"ko","alternate_titles":["mul-an-e-seo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2888','movie',2888,'{"id":2888,"title":"Family Time","director":"Tia Kouvo","year":2023,"tmdb_id":925920,"imdb_id":"tt26448972","original_title":"Mummola","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2889','movie',2889,'{"id":2889,"title":"Orlando, My Political Biography","director":"Paul B. Preciado","year":2023,"tmdb_id":1077683,"imdb_id":"tt26448981","original_title":"Orlando, ma biographie politique","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2890','movie',2890,'{"id":2890,"title":"Samsara","director":"Lois Patiño","year":2023,"tmdb_id":1077684,"imdb_id":"tt21909682","original_title":"Samsara","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2891','movie',2891,'{"id":2891,"title":"Eastern Front","director":"Vitaly Mansky, Yevhen Titarenko","year":2023,"tmdb_id":1077685,"imdb_id":"tt26448984","original_title":"Східний фронт","original_language":"uk","alternate_titles":["Shidniy front"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2892','movie',2892,'{"id":2892,"title":"The Adults","director":"Dustin Guy Defa","year":2023,"tmdb_id":1077661,"imdb_id":"tt26443107","original_title":"The Adults","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2893','movie',2893,'{"id":2893,"title":"Living Bad","director":"João Canijo","year":2023,"tmdb_id":1077686,"imdb_id":"tt26440896","original_title":"Viver Mal","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2894','movie',2894,'{"id":2894,"title":"Absence","director":"Wu Lang","year":2023,"tmdb_id":1065879,"imdb_id":"tt26441800","original_title":"雪云","original_language":"zh","alternate_titles":["Xue yun"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2895','movie',2895,'{"id":2895,"title":"Another End","director":"Piero Messina","year":2024,"tmdb_id":1087593,"imdb_id":"tt26749648","original_title":"Another End","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2896','movie',2896,'{"id":2896,"title":"Architecton","director":"Viktor Kossakovsky","year":2024,"tmdb_id":1234597,"imdb_id":"tt18346498","original_title":"Architecton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2897','movie',2897,'{"id":2897,"title":"Black Tea","director":"Abderrahmane Sissako","year":2024,"tmdb_id":662402,"imdb_id":"tt21994228","original_title":"Black Tea","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2898','movie',2898,'{"id":2898,"title":"Gloria!","director":"Margherita Vicario","year":2024,"tmdb_id":1231035,"imdb_id":"tt26757264","original_title":"Gloria!","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2899','movie',2899,'{"id":2899,"title":"Suspended Time","director":"Olivier Assayas","year":2024,"tmdb_id":1119625,"imdb_id":"tt31015247","original_title":"Hors du temps","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2900','movie',2900,'{"id":2900,"title":"From Hilde, with Love","director":"Andreas Dresen","year":2024,"tmdb_id":1070319,"imdb_id":"tt20420646","original_title":"In Liebe, eure Hilde","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2901','movie',2901,'{"id":2901,"title":"My Favourite Cake","director":"Behtash Sanaeeha, Maryam Moghaddam","year":2024,"tmdb_id":1234591,"imdb_id":"tt31015278","original_title":"کیک محبوب من","original_language":"fa","alternate_titles":["Keyke mahboobe man"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2902','movie',2902,'{"id":2902,"title":"La Cocina","director":"Alonso Ruizpalacios","year":2024,"tmdb_id":966238,"imdb_id":"tt19864832","original_title":"La cocina","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2903','movie',2903,'{"id":2903,"title":"Foreign Language","director":"Claire Burger","year":2024,"tmdb_id":803690,"imdb_id":"tt31015291","original_title":"Langue étrangère","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2904','movie',2904,'{"id":2904,"title":"Who Do I Belong To","director":"Meryam Joobeur","year":2024,"tmdb_id":794090,"imdb_id":"tt14680834","original_title":"ماء العين","original_language":"ar","alternate_titles":["Mé el Aïn"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2905','movie',2905,'{"id":2905,"title":"Pepe","director":"Nelson Carlos de los Santos Arias","year":2024,"tmdb_id":1172241,"imdb_id":"tt10781034","original_title":"Pepe","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2906','movie',2906,'{"id":2906,"title":"Shambhala","director":"Min Bahadur Bham","year":2024,"tmdb_id":1234593,"imdb_id":"tt30804400","original_title":"शम्भाला","original_language":"ne","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2907','movie',2907,'{"id":2907,"title":"Dying","director":"Matthias Glasner","year":2024,"tmdb_id":1232781,"imdb_id":"tt27165281","original_title":"Sterben","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2908','movie',2908,'{"id":2908,"title":"Sons","director":"Gustav Möller","year":2024,"tmdb_id":1113120,"imdb_id":"tt27496775","original_title":"Vogter","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2909','movie',2909,'{"id":2909,"title":"A Traveler''s Needs","director":"Hong Sang-soo","year":2024,"tmdb_id":1146410,"imdb_id":"tt31015344","original_title":"여행자의 필요","original_language":"ko","alternate_titles":["Yeohaengjaui pilyo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2910','movie',2910,'{"id":2910,"title":"Arcadia","director":"Yorgos Zois","year":2024,"tmdb_id":889820,"imdb_id":"tt31015391","original_title":"Arcadia","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2911','movie',2911,'{"id":2911,"title":"Cidade; Campo","director":"Juliana Rojas","year":2024,"tmdb_id":749116,"imdb_id":"tt30858110","original_title":"Cidade; Campo","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2912','movie',2912,'{"id":2912,"title":"Demba","director":"Mamadou Dia","year":2024,"tmdb_id":1234590,"imdb_id":"tt31015413","original_title":"Demba","original_language":"ff","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2913','movie',2913,'{"id":2913,"title":"Direct Action","director":"Guillaume Cailleau, Ben Russell","year":2024,"tmdb_id":1234601,"imdb_id":"tt31015444","original_title":"Direct Action","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2914','movie',2914,'{"id":2914,"title":"Sleep with Your Eyes Open","director":"Nele Wohlatz","year":2024,"tmdb_id":1234602,"imdb_id":"tt31015461","original_title":"Dormir de olhos abertos","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2915','movie',2915,'{"id":2915,"title":"Favoriten","director":"Ruth Beckermann","year":2024,"tmdb_id":940770,"imdb_id":"tt31015543","original_title":"Favoriten","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2916','movie',2916,'{"id":2916,"title":"Ivo","director":"Eva Trobisch","year":2024,"tmdb_id":1234586,"imdb_id":"tt31016613","original_title":"Ivo","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2917','movie',2917,'{"id":2917,"title":"The Great Yawn of History","director":"Aliyar Rasti","year":2024,"tmdb_id":1234607,"imdb_id":"tt31016912","original_title":"خمیازهٔ بزرگ","original_language":"fa","alternate_titles":["Khamyazeye bozorg"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2918','movie',2918,'{"id":2918,"title":"Some Rain Must Fall","director":"Qiu Yang","year":2024,"tmdb_id":1081918,"imdb_id":"tt26655205","original_title":"空房间里的女人","original_language":"zh","alternate_titles":["Kong fang jian li de nv ren"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2919','movie',2919,'{"id":2919,"title":"Hands in the Fire","director":"Margarida Gil","year":2024,"tmdb_id":1234619,"imdb_id":"tt31018048","original_title":"Mãos no fogo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2920','movie',2920,'{"id":2920,"title":"Matt and Mara","director":"Kazik Radwanski","year":2024,"tmdb_id":887180,"imdb_id":"tt13109862","original_title":"Matt and Mara","original_language":"en","alternate_titles":["Matt und Mara"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2921','movie',2921,'{"id":2921,"title":"The Fable","director":"Raam Reddy","year":2024,"tmdb_id":1234603,"imdb_id":"tt31015496","original_title":"जुगनूमा","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2922','movie',2922,'{"id":2922,"title":"Through the Graves the Wind Is Blowing","director":"Travis Wilkerson","year":2024,"tmdb_id":1234620,"imdb_id":"tt31018975","original_title":"Through the Graves the Wind Is Blowing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2923','movie',2923,'{"id":2923,"title":"You Burn Me","director":"Matías Piñeiro","year":2024,"tmdb_id":1200753,"imdb_id":"tt31018983","original_title":"Tú me abrasas","original_language":"es","alternate_titles":["Du verbrennst mich"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2924','movie',2924,'{"id":2924,"title":"A Family","director":"Christine Angot","year":2024,"tmdb_id":1201056,"imdb_id":"tt31015517","original_title":"Une famille","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2925','movie',2925,'{"id":2925,"title":"The Settlement","director":"Mohamed Rashad","year":2025,"tmdb_id":1421142,"imdb_id":"tt35341698","original_title":"المستعمرة","original_language":"ar","alternate_titles":["Al mosta''mera"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2926','movie',2926,'{"id":2926,"title":"Shadowbox","director":"Tanushree Das, Saumyananda Sahi","year":2025,"tmdb_id":1421128,"imdb_id":"tt35503482","original_title":"বাক্স বন্দি","original_language":"bn","alternate_titles":["Baksho Bondi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2927','movie',2927,'{"id":2927,"title":"BLKNWS: Terms & Conditions","director":"Kahlil Joseph","year":2025,"tmdb_id":931942,"imdb_id":"tt17497960","original_title":"BLKNWS: Terms & Conditions","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2928','movie',2928,'{"id":2928,"title":"Where the Night Stands Still","director":"Liryc Dela Cruz","year":2025,"tmdb_id":1421132,"imdb_id":"tt35503491","original_title":"Come la notte","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2929','movie',2929,'{"id":2929,"title":"Two Times João Liberada","director":"Paula Tomás Marques","year":2025,"tmdb_id":1421136,"imdb_id":"tt35504279","original_title":"Duas Vezes João Liberada","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2930','movie',2930,'{"id":2930,"title":"The Devil Smokes (and Saves the Burnt Matches in the Same Box)","director":"Ernesto Martínez Bucio","year":2025,"tmdb_id":1338552,"imdb_id":"tt35484319","original_title":"El diablo fuma (y guarda las cabezas de los cerillos quemados en la misma caja)","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2931','movie',2931,'{"id":2931,"title":"Eel","director":"Chu Chun-teng","year":2025,"tmdb_id":1269315,"imdb_id":"tt35504309","original_title":"河鰻","original_language":"zh","alternate_titles":["Hé mán"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2932','movie',2932,'{"id":2932,"title":"How to Be Normal and the Oddness of the Other World","director":"Florian Pochlatko","year":2025,"tmdb_id":1373976,"imdb_id":"tt31807192","original_title":"How to Be Normal and the Oddness of the Other World","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2933','movie',2933,'{"id":2933,"title":"That Summer in Paris","director":"Valentine Cadic","year":2025,"tmdb_id":1294706,"imdb_id":"tt35489613","original_title":"Le Rendez-vous de l''été","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2934','movie',2934,'{"id":2934,"title":"Mad Bills to Pay (or Destiny, dile que no soy malo)","director":"Joel Alfonso Vargas","year":2025,"tmdb_id":1400756,"imdb_id":"tt33562917","original_title":"Mad Bills to Pay (or Destiny, dile que no soy malo)","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2935','movie',2935,'{"id":2935,"title":"Growing Down","director":"Bálint Dániel Sós","year":2025,"tmdb_id":1054283,"imdb_id":"tt30142288","original_title":"Minden rendben","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2936','movie',2936,'{"id":2936,"title":"Punching the World","director":"Constanze Klaue","year":2025,"tmdb_id":1338472,"imdb_id":"tt26414209","original_title":"Mit der Faust in die Welt schlagen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2937','movie',2937,'{"id":2937,"title":"We Believe You","director":"Arnaud Dufeys, Charlotte Devillers","year":2025,"tmdb_id":1091196,"imdb_id":"tt35504398","original_title":"On vous croit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:661591','movie:2806') on conflict do nothing;
insert into public.media_provider_links values('movie:620498','movie:2807') on conflict do nothing;
insert into public.media_provider_links values('movie:669401','movie:2808') on conflict do nothing;
insert into public.media_provider_links values('movie:795811','movie:2809') on conflict do nothing;
insert into public.media_provider_links values('movie:795812','movie:2810') on conflict do nothing;
insert into public.media_provider_links values('movie:795813','movie:2811') on conflict do nothing;
insert into public.media_provider_links values('movie:795797','movie:2812') on conflict do nothing;
insert into public.media_provider_links values('movie:633949','movie:2813') on conflict do nothing;
insert into public.media_provider_links values('movie:681349','movie:2814') on conflict do nothing;
insert into public.media_provider_links values('movie:795815','movie:2815') on conflict do nothing;
insert into public.media_provider_links values('movie:795818','movie:2816') on conflict do nothing;
insert into public.media_provider_links values('movie:669661','movie:2817') on conflict do nothing;
insert into public.media_provider_links values('movie:701524','movie:2818') on conflict do nothing;
insert into public.media_provider_links values('movie:795763','movie:2819') on conflict do nothing;
insert into public.media_provider_links values('movie:659954','movie:2820') on conflict do nothing;
insert into public.media_provider_links values('movie:633811','movie:2821') on conflict do nothing;
insert into public.media_provider_links values('movie:517815','movie:2822') on conflict do nothing;
insert into public.media_provider_links values('movie:795587','movie:2823') on conflict do nothing;
insert into public.media_provider_links values('movie:795761','movie:2824') on conflict do nothing;
insert into public.media_provider_links values('movie:660946','movie:2825') on conflict do nothing;
insert into public.media_provider_links values('movie:795760','movie:2826') on conflict do nothing;
insert into public.media_provider_links values('movie:794691','movie:2827') on conflict do nothing;
insert into public.media_provider_links values('movie:749645','movie:2828') on conflict do nothing;
insert into public.media_provider_links values('movie:723377','movie:2829') on conflict do nothing;
insert into public.media_provider_links values('movie:795757','movie:2830') on conflict do nothing;
insert into public.media_provider_links values('movie:928709','movie:2831') on conflict do nothing;
insert into public.media_provider_links values('movie:804251','movie:2832') on conflict do nothing;
insert into public.media_provider_links values('movie:768757','movie:2833') on conflict do nothing;
insert into public.media_provider_links values('movie:579496','movie:2834') on conflict do nothing;
insert into public.media_provider_links values('movie:728499','movie:2835') on conflict do nothing;
insert into public.media_provider_links values('movie:928715','movie:2836') on conflict do nothing;
insert into public.media_provider_links values('movie:926332','movie:2837') on conflict do nothing;
insert into public.media_provider_links values('movie:822177','movie:2838') on conflict do nothing;
insert into public.media_provider_links values('movie:895659','movie:2839') on conflict do nothing;
insert into public.media_provider_links values('movie:859933','movie:2840') on conflict do nothing;
insert into public.media_provider_links values('movie:807862','movie:2841') on conflict do nothing;
insert into public.media_provider_links values('movie:915960','movie:2842') on conflict do nothing;
insert into public.media_provider_links values('movie:505570','movie:2843') on conflict do nothing;
insert into public.media_provider_links values('movie:928718','movie:2844') on conflict do nothing;
insert into public.media_provider_links values('movie:928713','movie:2845') on conflict do nothing;
insert into public.media_provider_links values('movie:769466','movie:2846') on conflict do nothing;
insert into public.media_provider_links values('movie:925181','movie:2847') on conflict do nothing;
insert into public.media_provider_links values('movie:928720','movie:2848') on conflict do nothing;
insert into public.media_provider_links values('movie:928723','movie:2849') on conflict do nothing;
insert into public.media_provider_links values('movie:928206','movie:2850') on conflict do nothing;
insert into public.media_provider_links values('movie:928725','movie:2851') on conflict do nothing;
insert into public.media_provider_links values('movie:619165','movie:2852') on conflict do nothing;
insert into public.media_provider_links values('movie:920772','movie:2853') on conflict do nothing;
insert into public.media_provider_links values('movie:928727','movie:2854') on conflict do nothing;
insert into public.media_provider_links values('movie:848818','movie:2855') on conflict do nothing;
insert into public.media_provider_links values('movie:928728','movie:2856') on conflict do nothing;
insert into public.media_provider_links values('movie:928729','movie:2857') on conflict do nothing;
insert into public.media_provider_links values('movie:928730','movie:2858') on conflict do nothing;
insert into public.media_provider_links values('movie:928731','movie:2859') on conflict do nothing;
insert into public.media_provider_links values('movie:928733','movie:2860') on conflict do nothing;
insert into public.media_provider_links values('movie:928735','movie:2861') on conflict do nothing;
insert into public.media_provider_links values('movie:749136','movie:2862') on conflict do nothing;
insert into public.media_provider_links values('movie:928737','movie:2863') on conflict do nothing;
insert into public.media_provider_links values('movie:1053600','movie:2864') on conflict do nothing;
insert into public.media_provider_links values('movie:954905','movie:2865') on conflict do nothing;
insert into public.media_provider_links values('movie:1075840','movie:2866') on conflict do nothing;
insert into public.media_provider_links values('movie:1069164','movie:2867') on conflict do nothing;
insert into public.media_provider_links values('movie:1016084','movie:2868') on conflict do nothing;
insert into public.media_provider_links values('movie:922830','movie:2869') on conflict do nothing;
insert into public.media_provider_links values('movie:978580','movie:2870') on conflict do nothing;
insert into public.media_provider_links values('movie:1045205','movie:2871') on conflict do nothing;
insert into public.media_provider_links values('movie:920767','movie:2872') on conflict do nothing;
insert into public.media_provider_links values('movie:1077670','movie:2873') on conflict do nothing;
insert into public.media_provider_links values('movie:1648274','movie:2874') on conflict do nothing;
insert into public.media_provider_links values('movie:843942','movie:2875') on conflict do nothing;
insert into public.media_provider_links values('movie:666942','movie:2876') on conflict do nothing;
insert into public.media_provider_links values('movie:1070449','movie:2877') on conflict do nothing;
insert into public.media_provider_links values('movie:1024707','movie:2878') on conflict do nothing;
insert into public.media_provider_links values('movie:958186','movie:2879') on conflict do nothing;
insert into public.media_provider_links values('movie:1077675','movie:2880') on conflict do nothing;
insert into public.media_provider_links values('movie:1062526','movie:2881') on conflict do nothing;
insert into public.media_provider_links values('movie:1077676','movie:2882') on conflict do nothing;
insert into public.media_provider_links values('movie:1077678','movie:2883') on conflict do nothing;
insert into public.media_provider_links values('movie:1077680','movie:2884') on conflict do nothing;
insert into public.media_provider_links values('movie:1077748','movie:2885') on conflict do nothing;
insert into public.media_provider_links values('movie:587384','movie:2886') on conflict do nothing;
insert into public.media_provider_links values('movie:1077647','movie:2887') on conflict do nothing;
insert into public.media_provider_links values('movie:925920','movie:2888') on conflict do nothing;
insert into public.media_provider_links values('movie:1077683','movie:2889') on conflict do nothing;
insert into public.media_provider_links values('movie:1077684','movie:2890') on conflict do nothing;
insert into public.media_provider_links values('movie:1077685','movie:2891') on conflict do nothing;
insert into public.media_provider_links values('movie:1077661','movie:2892') on conflict do nothing;
insert into public.media_provider_links values('movie:1077686','movie:2893') on conflict do nothing;
insert into public.media_provider_links values('movie:1065879','movie:2894') on conflict do nothing;
insert into public.media_provider_links values('movie:1087593','movie:2895') on conflict do nothing;
insert into public.media_provider_links values('movie:1234597','movie:2896') on conflict do nothing;
insert into public.media_provider_links values('movie:662402','movie:2897') on conflict do nothing;
insert into public.media_provider_links values('movie:1231035','movie:2898') on conflict do nothing;
insert into public.media_provider_links values('movie:1119625','movie:2899') on conflict do nothing;
insert into public.media_provider_links values('movie:1070319','movie:2900') on conflict do nothing;
insert into public.media_provider_links values('movie:1234591','movie:2901') on conflict do nothing;
insert into public.media_provider_links values('movie:966238','movie:2902') on conflict do nothing;
insert into public.media_provider_links values('movie:803690','movie:2903') on conflict do nothing;
insert into public.media_provider_links values('movie:794090','movie:2904') on conflict do nothing;
insert into public.media_provider_links values('movie:1172241','movie:2905') on conflict do nothing;
insert into public.media_provider_links values('movie:1234593','movie:2906') on conflict do nothing;
insert into public.media_provider_links values('movie:1232781','movie:2907') on conflict do nothing;
insert into public.media_provider_links values('movie:1113120','movie:2908') on conflict do nothing;
insert into public.media_provider_links values('movie:1146410','movie:2909') on conflict do nothing;
insert into public.media_provider_links values('movie:889820','movie:2910') on conflict do nothing;
insert into public.media_provider_links values('movie:749116','movie:2911') on conflict do nothing;
insert into public.media_provider_links values('movie:1234590','movie:2912') on conflict do nothing;
insert into public.media_provider_links values('movie:1234601','movie:2913') on conflict do nothing;
insert into public.media_provider_links values('movie:1234602','movie:2914') on conflict do nothing;
insert into public.media_provider_links values('movie:940770','movie:2915') on conflict do nothing;
insert into public.media_provider_links values('movie:1234586','movie:2916') on conflict do nothing;
insert into public.media_provider_links values('movie:1234607','movie:2917') on conflict do nothing;
insert into public.media_provider_links values('movie:1081918','movie:2918') on conflict do nothing;
insert into public.media_provider_links values('movie:1234619','movie:2919') on conflict do nothing;
insert into public.media_provider_links values('movie:887180','movie:2920') on conflict do nothing;
insert into public.media_provider_links values('movie:1234603','movie:2921') on conflict do nothing;
insert into public.media_provider_links values('movie:1234620','movie:2922') on conflict do nothing;
insert into public.media_provider_links values('movie:1200753','movie:2923') on conflict do nothing;
insert into public.media_provider_links values('movie:1201056','movie:2924') on conflict do nothing;
insert into public.media_provider_links values('movie:1421142','movie:2925') on conflict do nothing;
insert into public.media_provider_links values('movie:1421128','movie:2926') on conflict do nothing;
insert into public.media_provider_links values('movie:931942','movie:2927') on conflict do nothing;
insert into public.media_provider_links values('movie:1421132','movie:2928') on conflict do nothing;
insert into public.media_provider_links values('movie:1421136','movie:2929') on conflict do nothing;
insert into public.media_provider_links values('movie:1338552','movie:2930') on conflict do nothing;
insert into public.media_provider_links values('movie:1269315','movie:2931') on conflict do nothing;
insert into public.media_provider_links values('movie:1373976','movie:2932') on conflict do nothing;
insert into public.media_provider_links values('movie:1294706','movie:2933') on conflict do nothing;
insert into public.media_provider_links values('movie:1400756','movie:2934') on conflict do nothing;
insert into public.media_provider_links values('movie:1054283','movie:2935') on conflict do nothing;
insert into public.media_provider_links values('movie:1338472','movie:2936') on conflict do nothing;
insert into public.media_provider_links values('movie:1091196','movie:2937') on conflict do nothing;
commit;

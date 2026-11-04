-- Film awards 2016–2020: 551 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:318846','movie:2938',318846),
('movie:294016','movie:2939',294016),
('movie:321697','movie:2940',321697),
('movie:312221','movie:2941',312221),
('movie:336808','movie:2942',336808),
('movie:287628','movie:2943',287628),
('movie:348674','movie:2944',348674),
('movie:317952','movie:2945',317952),
('movie:318044','movie:2946',318044),
('movie:277216','movie:2947',277216),
('movie:267480','movie:2948',267480),
('movie:242828','movie:2949',242828),
('movie:263109','movie:2950',263109),
('movie:355020','movie:2951',355020),
('movie:324786','movie:2952',324786),
('movie:338766','movie:2953',338766),
('movie:393457','movie:2954',393457),
('movie:334543','movie:2955',334543),
('movie:339419','movie:2956',339419),
('movie:315664','movie:2957',315664),
('movie:376866','movie:2958',376866),
('movie:381284','movie:2959',381284),
('movie:335578','movie:2960',335578),
('movie:348678','movie:2961',348678),
('movie:359151','movie:2962',359151),
('movie:342737','movie:2963',342737),
('movie:377462','movie:2964',377462),
('movie:411019','movie:2965',411019),
('movie:377151','movie:2966',377151),
('movie:407806','movie:2967',407806),
('movie:376233','movie:2968',376233),
('movie:313297','movie:2969',313297),
('movie:399404','movie:2970',399404),
('movie:277834','movie:2971',277834),
('movie:393559','movie:2972',393559),
('movie:419430','movie:2973',419430),
('movie:394117','movie:2974',394117),
('movie:446791','movie:2975',446791),
('movie:414425','movie:2976',414425),
('movie:416477','movie:2977',416477),
('movie:371638','movie:2978',371638),
('movie:413362','movie:2979',413362),
('movie:263115','movie:2980',263115),
('movie:396371','movie:2981',396371),
('movie:429191','movie:2982',429191),
('movie:432976','movie:2983',432976),
('movie:411007','movie:2984',411007),
('movie:451995','movie:2985',451995),
('movie:433085','movie:2986',433085),
('movie:468284','movie:2987',468284),
('movie:428612','movie:2988',428612),
('movie:436343','movie:2989',436343),
('movie:295693','movie:2990',295693),
('movie:435129','movie:2991',435129),
('movie:364689','movie:2992',364689),
('movie:424694','movie:2993',424694),
('movie:491472','movie:2994',491472),
('movie:458737','movie:2995',458737),
('movie:537996','movie:2996',537996),
('movie:423612','movie:2997',423612),
('movie:340613','movie:2998',340613),
('movie:515042','movie:2999',515042),
('movie:490785','movie:3000',490785),
('movie:488740','movie:3001',488740),
('movie:465914','movie:3002',465914),
('movie:324857','movie:3003',324857),
('movie:489985','movie:3004',489985),
('movie:493099','movie:3005',493099),
('movie:404368','movie:3006',404368),
('movie:359724','movie:3007',359724),
('movie:331482','movie:3008',331482),
('movie:260513','movie:3009',260513),
('movie:475215','movie:3010',475215),
('movie:506528','movie:3011',506528),
('movie:491283','movie:3012',491283),
('movie:501907','movie:3013',501907),
('movie:525661','movie:3014',525661),
('movie:530915','movie:3015',530915),
('movie:292011','movie:3016',292011),
('movie:471707','movie:3017',471707),
('movie:566213','movie:3018',566213),
('movie:565716','movie:3019',565716),
('movie:566221','movie:3020',566221),
('movie:621729','movie:3021',621729),
('movie:576017','movie:3022',576017),
('movie:458253','movie:3023',458253),
('movie:586940','movie:3024',586940),
('movie:328589','movie:3025',328589),
('movie:265195','movie:3026',265195),
('movie:265228','movie:3027',265228),
('movie:166428','movie:3028',166428),
('movie:338928','movie:3029',338928),
('movie:319076','movie:3030',319076),
('movie:253450','movie:3031',253450),
('movie:340485','movie:3032',340485),
('movie:341366','movie:3033',341366),
('movie:378441','movie:3034',378441),
('movie:346685','movie:3035',346685),
('movie:265189','movie:3036',265189),
('movie:375012','movie:3037',375012),
('movie:376261','movie:3038',376261),
('movie:391698','movie:3039',391698),
('movie:376530','movie:3040',376530),
('movie:127380','movie:3041',127380),
('movie:428493','movie:3042',428493),
('movie:346648','movie:3043',346648),
('movie:290098','movie:3044',290098),
('movie:433247','movie:3045',433247),
('movie:410117','movie:3046',410117),
('movie:428501','movie:3047',428501),
('movie:470918','movie:3048',470918),
('movie:398174','movie:3049',398174),
('movie:394741','movie:3050',394741),
('movie:457136','movie:3051',457136),
('movie:489988','movie:3052',489988),
('movie:576069','movie:3053',576069),
('movie:451915','movie:3054',451915),
('movie:504608','movie:3055',504608),
('movie:482981','movie:3056',482981),
('movie:505600','movie:3057',505600),
('movie:522369','movie:3058',522369),
('movie:536841','movie:3059',536841),
('movie:549559','movie:3060',549559),
('movie:566222','movie:3061',566222),
('movie:227973','movie:3062',227973),
('movie:401469','movie:3063',401469),
('movie:330457','movie:3064',330457),
('movie:319995','movie:3065',319995),
('movie:322488','movie:3066',322488),
('movie:105864','movie:3067',105864),
('movie:321741','movie:3068',321741),
('movie:256924','movie:3069',256924),
('movie:244539','movie:3070',244539),
('movie:309304','movie:3071',309304),
('movie:369557','movie:3072',369557),
('movie:271714','movie:3073',271714),
('movie:393729','movie:3074',393729),
('movie:376290','movie:3075',376290),
('movie:283235','movie:3076',283235),
('movie:291328','movie:3077',291328),
('movie:308266','movie:3078',308266),
('movie:423899','movie:3079',423899),
('movie:376660','movie:3080',376660),
('movie:449749','movie:3081',449749),
('movie:369192','movie:3082',369192),
('movie:339403','movie:3083',339403),
('movie:301337','movie:3084',301337),
('movie:400650','movie:3085',400650),
('movie:515916','movie:3086',515916),
('movie:316029','movie:3087',316029),
('movie:455207','movie:3088',455207),
('movie:472451','movie:3089',472451),
('movie:489925','movie:3090',489925),
('movie:423646','movie:3091',423646),
('movie:400579','movie:3092',400579),
('movie:429203','movie:3093',429203),
('movie:565310','movie:3094',565310),
('movie:528888','movie:3095',528888),
('movie:475132','movie:3096',475132),
('movie:524348','movie:3097',524348),
('movie:523172','movie:3098',523172),
('movie:420818','movie:3099',420818),
('movie:471507','movie:3100',471507),
('movie:377273','movie:3101',377273),
('movie:405177','movie:3102',405177),
('movie:332872','movie:3103',332872),
('movie:338189','movie:3104',338189),
('movie:371865','movie:3105',371865),
('movie:340481','movie:3106',340481),
('movie:376166','movie:3107',376166),
('movie:340676','movie:3108',340676),
('movie:380622','movie:3109',380622),
('movie:374452','movie:3110',374452),
('movie:287904','movie:3111',287904),
('movie:540901','movie:3112',540901),
('movie:301365','movie:3113',301365),
('movie:391709','movie:3114',391709),
('movie:374458','movie:3115',374458),
('movie:392795','movie:3116',392795),
('movie:392794','movie:3117',392794),
('movie:392807','movie:3118',392807),
('movie:392812','movie:3119',392812),
('movie:392809','movie:3120',392809),
('movie:392804','movie:3121',392804),
('movie:392818','movie:3122',392818),
('movie:393184','movie:3123',393184),
('movie:392816','movie:3124',392816),
('movie:392796','movie:3125',392796),
('movie:392791','movie:3126',392791),
('movie:429200','movie:3127',429200),
('movie:392788','movie:3128',392788),
('movie:374671','movie:3129',374671),
('movie:444428','movie:3130',444428),
('movie:399031','movie:3131',399031),
('movie:444395','movie:3132',444395),
('movie:442947','movie:3133',442947),
('movie:451955','movie:3134',451955),
('movie:451945','movie:3135',451945),
('movie:416186','movie:3136',416186),
('movie:445768','movie:3137',445768),
('movie:396398','movie:3138',396398),
('movie:451957','movie:3139',451957),
('movie:452010','movie:3140',452010),
('movie:383709','movie:3141',383709),
('movie:449856','movie:3142',449856),
('movie:452018','movie:3143',452018),
('movie:451618','movie:3144',451618),
('movie:451996','movie:3145',451996),
('movie:451985','movie:3146',451985),
('movie:449754','movie:3147',449754),
('movie:452013','movie:3148',452013),
('movie:444397','movie:3149',444397),
('movie:452016','movie:3150',452016),
('movie:451988','movie:3151',451988),
('movie:440374','movie:3152',440374),
('movie:452000','movie:3153',452000),
('movie:455585','movie:3154',455585),
('movie:395834','movie:3155',395834),
('movie:517731','movie:3156',517731),
('movie:446164','movie:3157',446164),
('movie:418472','movie:3158',418472),
('movie:483184','movie:3159',483184),
('movie:485162','movie:3160',485162),
('movie:414030','movie:3161',414030),
('movie:491584','movie:3162',491584),
('movie:479520','movie:3163',479520),
('movie:441393','movie:3164',441393),
('movie:401545','movie:3165',401545),
('movie:396461','movie:3166',396461),
('movie:517982','movie:3167',517982),
('movie:475930','movie:3168',475930),
('movie:485189','movie:3169',485189),
('movie:519187','movie:3170',519187),
('movie:519241','movie:3171',519241),
('movie:517839','movie:3172',517839),
('movie:486898','movie:3173',486898),
('movie:489170','movie:3174',489170),
('movie:517940','movie:3175',517940),
('movie:488453','movie:3176',488453),
('movie:520273','movie:3177',520273),
('movie:484747','movie:3178',484747),
('movie:517975','movie:3179',517975),
('movie:515049','movie:3180',515049),
('movie:403300','movie:3181',403300),
('movie:517987','movie:3182',517987),
('movie:446159','movie:3183',446159),
('movie:505941','movie:3184',505941),
('movie:575452','movie:3185',575452),
('movie:517978','movie:3186',517978),
('movie:496967','movie:3187',496967),
('movie:539531','movie:3188',539531),
('movie:504585','movie:3189',504585),
('movie:504588','movie:3190',504588),
('movie:519238','movie:3191',519238),
('movie:575428','movie:3192',575428),
('movie:574097','movie:3193',574097),
('movie:559401','movie:3194',559401),
('movie:595940','movie:3195',595940),
('movie:595867','movie:3196',595867),
('movie:540111','movie:3197',540111),
('movie:537655','movie:3198',537655),
('movie:582881','movie:3199',582881),
('movie:592800','movie:3200',592800),
('movie:596041','movie:3201',596041),
('movie:595875','movie:3202',595875),
('movie:598474','movie:3203',598474),
('movie:595924','movie:3204',595924),
('movie:592807','movie:3205',592807),
('movie:572404','movie:3206',572404),
('movie:408542','movie:3207',408542),
('movie:595923','movie:3208',595923),
('movie:595931','movie:3209',595931),
('movie:408544','movie:3210',408544),
('movie:377263','movie:3211',377263),
('movie:324560','movie:3212',324560),
('movie:575561','movie:3213',575561),
('movie:387801','movie:3214',387801),
('movie:351414','movie:3215',351414),
('movie:255160','movie:3216',255160),
('movie:408545','movie:3217',408545),
('movie:316154','movie:3218',316154),
('movie:408537','movie:3219',408537),
('movie:283552','movie:3220',283552),
('movie:408543','movie:3221',408543),
('movie:86822','movie:3222',86822),
('movie:409164','movie:3223',409164),
('movie:408540','movie:3224',408540),
('movie:411037','movie:3225',411037),
('movie:408541','movie:3226',408541),
('movie:413580','movie:3227',413580),
('movie:412492','movie:3228',412492),
('movie:390357','movie:3229',390357),
('movie:412698','movie:3230',412698),
('movie:412369','movie:3231',412369),
('movie:412363','movie:3232',412363),
('movie:411675','movie:3233',411675),
('movie:412687','movie:3234',412687),
('movie:400509','movie:3235',400509),
('movie:412212','movie:3236',412212),
('movie:413686','movie:3237',413686),
('movie:468213','movie:3238',468213),
('movie:395458','movie:3239',395458),
('movie:412660','movie:3240',412660),
('movie:383807','movie:3241',383807),
('movie:407890','movie:3242',407890),
('movie:411638','movie:3243',411638),
('movie:468207','movie:3244',468207),
('movie:468287','movie:3245',468287),
('movie:451657','movie:3246',451657),
('movie:434775','movie:3247',434775),
('movie:468208','movie:3248',468208),
('movie:421452','movie:3249',421452),
('movie:468210','movie:3250',468210),
('movie:471998','movie:3251',471998),
('movie:474353','movie:3252',474353),
('movie:472648','movie:3253',472648),
('movie:446173','movie:3254',446173),
('movie:472641','movie:3255',472641),
('movie:468292','movie:3256',468292),
('movie:471878','movie:3257',471878),
('movie:473262','movie:3258',473262),
('movie:472645','movie:3259',472645),
('movie:471880','movie:3260',471880),
('movie:471879','movie:3261',471879),
('movie:473505','movie:3262',473505),
('movie:471856','movie:3263',471856),
('movie:468196','movie:3264',468196),
('movie:472640','movie:3265',472640),
('movie:429202','movie:3266',429202),
('movie:474354','movie:3267',474354),
('movie:361292','movie:3268',361292),
('movie:537880','movie:3269',537880),
('movie:468205','movie:3270',468205),
('movie:399440','movie:3271',399440),
('movie:399056','movie:3272',399056),
('movie:484901','movie:3273',484901),
('movie:400090','movie:3274',400090),
('movie:389218','movie:3275',389218),
('movie:519223','movie:3276',519223),
('movie:539036','movie:3277',539036),
('movie:503742','movie:3278',503742),
('movie:537488','movie:3279',537488),
('movie:531753','movie:3280',531753),
('movie:514575','movie:3281',514575),
('movie:539042','movie:3282',539042),
('movie:538362','movie:3283',538362),
('movie:538368','movie:3284',538368),
('movie:539033','movie:3285',539033),
('movie:471859','movie:3286',471859),
('movie:539050','movie:3287',539050),
('movie:539046','movie:3288',539046),
('movie:537847','movie:3289',537847),
('movie:485166','movie:3290',485166),
('movie:537875','movie:3291',537875),
('movie:539053','movie:3292',539053),
('movie:539056','movie:3293',539056),
('movie:618214','movie:3294',618214),
('movie:527256','movie:3295',527256),
('movie:451184','movie:3296',451184),
('movie:348672','movie:3297',348672),
('movie:617776','movie:3298',617776),
('movie:548170','movie:3299',548170),
('movie:505707','movie:3300',505707),
('movie:517468','movie:3301',517468),
('movie:572521','movie:3302',572521),
('movie:497834','movie:3303',497834),
('movie:419704','movie:3304',419704),
('movie:539039','movie:3305',539039),
('movie:540709','movie:3306',540709),
('movie:618215','movie:3307',618215),
('movie:477428','movie:3308',477428),
('movie:517909','movie:3309',517909),
('movie:399121','movie:3310',399121),
('movie:618222','movie:3311',618222),
('movie:582873','movie:3312',582873),
('movie:582911','movie:3313',582911),
('movie:618226','movie:3314',618226),
('movie:616020','movie:3315',616020),
('movie:608315','movie:3316',608315),
('movie:495332','movie:3317',495332),
('movie:618228','movie:3318',618228),
('movie:618239','movie:3319',618239),
('movie:618229','movie:3320',618229),
('movie:618225','movie:3321',618225),
('movie:618231','movie:3322',618231),
('movie:604458','movie:3323',604458),
('movie:582922','movie:3324',582922),
('movie:618237','movie:3325',618237),
('movie:618233','movie:3326',618233),
('movie:582907','movie:3327',582907),
('movie:618243','movie:3328',618243),
('movie:575446','movie:3329',575446),
('movie:728106','movie:3330',728106),
('movie:728107','movie:3331',728107),
('movie:594691','movie:3332',594691),
('movie:728113','movie:3333',728113),
('movie:594692','movie:3334',594692),
('movie:688301','movie:3335',688301),
('movie:670343','movie:3336',670343),
('movie:714099','movie:3337',714099),
('movie:669665','movie:3338',669665),
('movie:506281','movie:3339',506281),
('movie:728116','movie:3340',728116),
('movie:606865','movie:3341',606865),
('movie:539529','movie:3342',539529),
('movie:624484','movie:3343',624484),
('movie:557950','movie:3344',557950),
('movie:728132','movie:3345',728132),
('movie:728148','movie:3346',728148),
('movie:660958','movie:3347',660958),
('movie:728136','movie:3348',728136),
('movie:728146','movie:3349',728146),
('movie:618746','movie:3350',618746),
('movie:725561','movie:3351',725561),
('movie:728141','movie:3352',728141),
('movie:728133','movie:3353',728133),
('movie:728142','movie:3354',728142),
('movie:644171','movie:3355',644171),
('movie:664412','movie:3356',664412),
('movie:728145','movie:3357',728145),
('movie:334522','movie:3358',334522),
('movie:372985','movie:3359',372985),
('movie:378696','movie:3360',378696),
('movie:377148','movie:3361',377148),
('movie:378695','movie:3362',378695),
('movie:728143','movie:3363',728143),
('movie:267192','movie:3364',267192),
('movie:652156','movie:3365',652156),
('movie:377150','movie:3366',377150),
('movie:378697','movie:3367',378697),
('movie:377154','movie:3368',377154),
('movie:374465','movie:3369',374465),
('movie:377153','movie:3370',377153),
('movie:245703','movie:3371',245703),
('movie:308409','movie:3372',308409),
('movie:380808','movie:3373',380808),
('movie:377158','movie:3374',377158),
('movie:429732','movie:3375',429732),
('movie:377156','movie:3376',377156),
('movie:436336','movie:3377',436336),
('movie:436339','movie:3378',436339),
('movie:434773','movie:3379',434773),
('movie:436334','movie:3380',436334),
('movie:436345','movie:3381',436345),
('movie:436349','movie:3382',436349),
('movie:436350','movie:3383',436350),
('movie:436340','movie:3384',436340),
('movie:436352','movie:3385',436352),
('movie:378698','movie:3386',378698),
('movie:424634','movie:3387',424634),
('movie:437220','movie:3388',437220),
('movie:495271','movie:3389',495271),
('movie:401546','movie:3390',401546),
('movie:415401','movie:3391',415401),
('movie:429199','movie:3392',429199),
('movie:492344','movie:3393',492344),
('movie:493483','movie:3394',493483),
('movie:497626','movie:3395',497626),
('movie:499152','movie:3396',499152),
('movie:499153','movie:3397',499153),
('movie:431135','movie:3398',431135),
('movie:499155','movie:3399',499155),
('movie:497747','movie:3400',497747),
('movie:493656','movie:3401',493656),
('movie:444400','movie:3402',444400),
('movie:499086','movie:3403',499086),
('movie:477654','movie:3404',477654),
('movie:471853','movie:3405',471853),
('movie:505706','movie:3406',505706),
('movie:493899','movie:3407',493899),
('movie:568789','movie:3408',568789),
('movie:535356','movie:3409',535356),
('movie:574434','movie:3410',574434),
('movie:509364','movie:3411',509364),
('movie:539186','movie:3412',539186),
('movie:509598','movie:3413',509598),
('movie:574436','movie:3414',574436),
('movie:574067','movie:3415',574067),
('movie:568790','movie:3416',568790),
('movie:500895','movie:3417',500895),
('movie:567410','movie:3418',567410),
('movie:500006','movie:3419',500006),
('movie:501590','movie:3420',501590),
('movie:520390','movie:3421',520390),
('movie:659699','movie:3422',659699),
('movie:662401','movie:3423',662401),
('movie:575659','movie:3424',575659),
('movie:558582','movie:3425',558582),
('movie:512603','movie:3426',512603),
('movie:667936','movie:3427',667936),
('movie:595671','movie:3428',595671),
('movie:667757','movie:3429',667757),
('movie:659967','movie:3430',659967),
('movie:567714','movie:3431',567714),
('movie:446574','movie:3432',446574),
('movie:574094','movie:3433',574094),
('movie:615761','movie:3434',615761),
('movie:608317','movie:3435',608317),
('movie:655289','movie:3436',655289),
('movie:664573','movie:3437',664573),
('movie:664576','movie:3438',664576),
('movie:664572','movie:3439',664572),
('movie:575448','movie:3440',575448),
('movie:664577','movie:3441',664577),
('movie:664602','movie:3442',664602),
('movie:574080','movie:3443',574080),
('movie:547017','movie:3444',547017),
('movie:664589','movie:3445',664589),
('movie:584249','movie:3446',584249),
('movie:664591','movie:3447',664591),
('movie:664594','movie:3448',664594),
('movie:664596','movie:3449',664596),
('movie:664584','movie:3450',664584),
('movie:331781','movie:3451',331781),
('movie:402298','movie:3452',402298),
('movie:470819','movie:3453',470819),
('movie:432602','movie:3454',432602),
('movie:508003','movie:3455',508003),
('movie:335797','movie:3456',335797),
('movie:351454','movie:3457',351454),
('movie:392790','movie:3458',392790),
('movie:451990','movie:3459',451990),
('movie:517286','movie:3460',517286),
('movie:507505','movie:3461',507505),
('movie:517963','movie:3462',517963),
('movie:519141','movie:3463',519141),
('movie:595930','movie:3464',595930),
('movie:548544','movie:3465',548544),
('movie:412366','movie:3466',412366),
('movie:408539','movie:3467',408539),
('movie:460060','movie:3468',460060),
('movie:412692','movie:3469',412692),
('movie:474206','movie:3470',474206),
('movie:472647','movie:3471',472647),
('movie:468302','movie:3472',468302),
('movie:538102','movie:3473',538102),
('movie:446178','movie:3474',446178),
('movie:537878','movie:3475',537878),
('movie:618224','movie:3476',618224),
('movie:473637','movie:3477',473637),
('movie:583794','movie:3478',583794),
('movie:726151','movie:3479',726151),
('movie:618245','movie:3480',618245),
('movie:432799','movie:3481',432799),
('movie:414018','movie:3482',414018),
('movie:728135','movie:3483',728135),
('movie:662400','movie:3484',662400),
('movie:539048','movie:3485',539048),
('movie:667995','movie:3486',667995),
('movie:614292','movie:3487',614292),
('movie:223706','movie:3488',223706)
) as expected(provider_key,work_key,tmdb_id)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>'tmdb_id')::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2938','movie',2938,'{"id":2938,"title":"The Big Short","director":"Adam McKay","year":2015,"tmdb_id":318846,"imdb_id":"tt1596363","original_title":"The Big Short","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2939','movie',2939,'{"id":2939,"title":"Trumbo","director":"Jay Roach","year":2015,"tmdb_id":294016,"imdb_id":"tt3203606","original_title":"Trumbo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2940','movie',2940,'{"id":2940,"title":"Steve Jobs","director":"Danny Boyle","year":2015,"tmdb_id":321697,"imdb_id":"tt2080374","original_title":"Steve Jobs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2941','movie',2941,'{"id":2941,"title":"Creed","director":"Ryan Coogler","year":2015,"tmdb_id":312221,"imdb_id":"tt3076658","original_title":"Creed","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2942','movie',2942,'{"id":2942,"title":"Embrace of the Serpent","director":"Ciro Guerra","year":2015,"tmdb_id":336808,"imdb_id":"tt4285496","original_title":"El abrazo de la serpiente","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2943','movie',2943,'{"id":2943,"title":"Theeb","director":"Naji Abu Nowar","year":2014,"tmdb_id":287628,"imdb_id":"tt3170902","original_title":"ذيب","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2944','movie',2944,'{"id":2944,"title":"A War","director":"Tobias Lindholm","year":2015,"tmdb_id":348674,"imdb_id":"tt3830162","original_title":"Krigen","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2945','movie',2945,'{"id":2945,"title":"Cartel Land","director":"Matthew Heineman","year":2015,"tmdb_id":317952,"imdb_id":"tt4126304","original_title":"Cartel Land","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2946','movie',2946,'{"id":2946,"title":"What Happened, Miss Simone?","director":"Liz Garbus","year":2015,"tmdb_id":318044,"imdb_id":"tt4284010","original_title":"What Happened, Miss Simone?","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2947','movie',2947,'{"id":2947,"title":"Straight Outta Compton","director":"F. Gary Gray","year":2015,"tmdb_id":277216,"imdb_id":"tt1398426","original_title":"Straight Outta Compton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2948','movie',2948,'{"id":2948,"title":"The Look of Silence","director":"Joshua Oppenheimer","year":2014,"tmdb_id":267480,"imdb_id":"tt3521134","original_title":"The Look of Silence","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2949','movie',2949,'{"id":2949,"title":"When Marnie Was There","director":"Hiromasa Yonebayashi","year":2014,"tmdb_id":242828,"imdb_id":"tt3398268","original_title":"思い出のマーニー","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2950','movie',2950,'{"id":2950,"title":"Shaun the Sheep Movie","director":"Mark Burton, Richard Starzak","year":2015,"tmdb_id":263109,"imdb_id":"tt2872750","original_title":"Shaun the Sheep Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2951','movie',2951,'{"id":2951,"title":"Winter on Fire: Ukraine''s Fight for Freedom","director":"Evgeny Afineevsky","year":2015,"tmdb_id":355020,"imdb_id":"tt4908644","original_title":"Winter on Fire: Ukraine''s Fight for Freedom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2952','movie',2952,'{"id":2952,"title":"Hacksaw Ridge","director":"Mel Gibson","year":2016,"tmdb_id":324786,"imdb_id":"tt2119532","original_title":"Hacksaw Ridge","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2953','movie',2953,'{"id":2953,"title":"Hell or High Water","director":"David Mackenzie","year":2016,"tmdb_id":338766,"imdb_id":"tt2582782","original_title":"Hell or High Water","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2954','movie',2954,'{"id":2954,"title":"Fences","director":"Denzel Washington","year":2016,"tmdb_id":393457,"imdb_id":"tt2671706","original_title":"Fences","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2955','movie',2955,'{"id":2955,"title":"Lion","director":"Garth Davis","year":2016,"tmdb_id":334543,"imdb_id":"tt3741834","original_title":"Lion","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2956','movie',2956,'{"id":2956,"title":"Loving","director":"Jeff Nichols","year":2016,"tmdb_id":339419,"imdb_id":"tt4669986","original_title":"Loving","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2957','movie',2957,'{"id":2957,"title":"Florence Foster Jenkins","director":"Stephen Frears","year":2016,"tmdb_id":315664,"imdb_id":"tt4136084","original_title":"Florence Foster Jenkins","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2958','movie',2958,'{"id":2958,"title":"Jackie","director":"Pablo Larraín","year":2016,"tmdb_id":376866,"imdb_id":"tt1619029","original_title":"Jackie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2959','movie',2959,'{"id":2959,"title":"Hidden Figures","director":"Theodore Melfi","year":2016,"tmdb_id":381284,"imdb_id":"tt4846340","original_title":"Hidden Figures","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2960','movie',2960,'{"id":2960,"title":"Land of Mine","director":"Martin Zandvliet","year":2015,"tmdb_id":335578,"imdb_id":"tt3841424","original_title":"Under sandet","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2961','movie',2961,'{"id":2961,"title":"A Man Called Ove","director":"Hannes Holm","year":2015,"tmdb_id":348678,"imdb_id":"tt4080728","original_title":"En man som heter Ove","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2962','movie',2962,'{"id":2962,"title":"Tanna","director":"Bentley Dean, Martin Butler","year":2015,"tmdb_id":359151,"imdb_id":"tt4239726","original_title":"Tanna","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2963','movie',2963,'{"id":2963,"title":"20th Century Women","director":"Mike Mills","year":2016,"tmdb_id":342737,"imdb_id":"tt4385888","original_title":"20th Century Women","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2964','movie',2964,'{"id":2964,"title":"O.J.: Made in America","director":"Ezra Edelman","year":2016,"tmdb_id":377462,"imdb_id":"tt5275892","original_title":"O.J.: Made in America","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2965','movie',2965,'{"id":2965,"title":"I Am Not Your Negro","director":"Raoul Peck","year":2017,"tmdb_id":411019,"imdb_id":"tt5804038","original_title":"I Am Not Your Negro","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2966','movie',2966,'{"id":2966,"title":"Fire at Sea","director":"Gianfranco Rosi","year":2016,"tmdb_id":377151,"imdb_id":"tt3652526","original_title":"Fuocoammare","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2967','movie',2967,'{"id":2967,"title":"13th","director":"Ava DuVernay","year":2016,"tmdb_id":407806,"imdb_id":"tt5895028","original_title":"13th","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2968','movie',2968,'{"id":2968,"title":"Life, Animated","director":"Roger Ross Williams","year":2016,"tmdb_id":376233,"imdb_id":"tt3917210","original_title":"Life, Animated","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2969','movie',2969,'{"id":2969,"title":"Kubo and the Two Strings","director":"Travis Knight","year":2016,"tmdb_id":313297,"imdb_id":"tt4302938","original_title":"Kubo and the Two Strings","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2970','movie',2970,'{"id":2970,"title":"Darkest Hour","director":"Joe Wright","year":2017,"tmdb_id":399404,"imdb_id":"tt4555426","original_title":"Darkest Hour","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2971','movie',2971,'{"id":2971,"title":"Moana","director":"Ron Clements, John Musker","year":2016,"tmdb_id":277834,"imdb_id":"tt3521164","original_title":"Moana","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2972','movie',2972,'{"id":2972,"title":"My Life as a Zucchini","director":"Claude Barras","year":2016,"tmdb_id":393559,"imdb_id":"tt2321405","original_title":"Ma vie de courgette","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2973','movie',2973,'{"id":2973,"title":"Get Out","director":"Jordan Peele","year":2017,"tmdb_id":419430,"imdb_id":"tt5052448","original_title":"Get Out","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2974','movie',2974,'{"id":2974,"title":"The Florida Project","director":"Sean Baker","year":2017,"tmdb_id":394117,"imdb_id":"tt5649144","original_title":"The Florida Project","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2975','movie',2975,'{"id":2975,"title":"All the Money in the World","director":"Ridley Scott","year":2017,"tmdb_id":446791,"imdb_id":"tt5294550","original_title":"All the Money in the World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2976','movie',2976,'{"id":2976,"title":"Mudbound","director":"Dee Rees","year":2017,"tmdb_id":414425,"imdb_id":"tt2396589","original_title":"Mudbound","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2977','movie',2977,'{"id":2977,"title":"The Big Sick","director":"Michael Showalter","year":2017,"tmdb_id":416477,"imdb_id":"tt5462602","original_title":"The Big Sick","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2978','movie',2978,'{"id":2978,"title":"The Disaster Artist","director":"James Franco","year":2017,"tmdb_id":371638,"imdb_id":"tt3521126","original_title":"The Disaster Artist","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2979','movie',2979,'{"id":2979,"title":"Roman J. Israel, Esq.","director":"Dan Gilroy","year":2017,"tmdb_id":413362,"imdb_id":"tt6000478","original_title":"Roman J. Israel, Esq.","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2980','movie',2980,'{"id":2980,"title":"Logan","director":"James Mangold","year":2017,"tmdb_id":263115,"imdb_id":"tt3315342","original_title":"Logan","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2981','movie',2981,'{"id":2981,"title":"Molly''s Game","director":"Aaron Sorkin","year":2017,"tmdb_id":396371,"imdb_id":"tt4209788","original_title":"Molly''s Game","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2982','movie',2982,'{"id":2982,"title":"A Fantastic Woman","director":"Sebastián Lelio","year":2017,"tmdb_id":429191,"imdb_id":"tt5639354","original_title":"Una mujer fantástica","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2983','movie',2983,'{"id":2983,"title":"Icarus","director":"Bryan Fogel","year":2017,"tmdb_id":432976,"imdb_id":"tt6333060","original_title":"Icarus","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2984','movie',2984,'{"id":2984,"title":"Abacus: Small Enough to Jail","director":"Steve James","year":2017,"tmdb_id":411007,"imdb_id":"tt5952382","original_title":"Abacus: Small Enough to Jail","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2985','movie',2985,'{"id":2985,"title":"Faces Places","director":"Agnès Varda, JR","year":2017,"tmdb_id":451995,"imdb_id":"tt5598102","original_title":"Visages Villages","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2986','movie',2986,'{"id":2986,"title":"Last Men in Aleppo","director":"Steen Johannessen, Feras Fayyad","year":2017,"tmdb_id":433085,"imdb_id":"tt6333074","original_title":"De sidste mænd i Aleppo","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2987','movie',2987,'{"id":2987,"title":"The Insult","director":"Ziad Doueiri","year":2017,"tmdb_id":468284,"imdb_id":"tt7048622","original_title":"L''Insulte","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2988','movie',2988,'{"id":2988,"title":"Strong Island","director":"Yance Ford","year":2017,"tmdb_id":428612,"imdb_id":"tt5873150","original_title":"Strong Island","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2989','movie',2989,'{"id":2989,"title":"On Body and Soul","director":"Ildikó Enyedi","year":2017,"tmdb_id":436343,"imdb_id":"tt5607714","original_title":"Testről és lélekről","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2990','movie',2990,'{"id":2990,"title":"The Boss Baby","director":"Tom McGrath","year":2017,"tmdb_id":295693,"imdb_id":"tt3874544","original_title":"The Boss Baby","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2991','movie',2991,'{"id":2991,"title":"The Breadwinner","director":"Nora Twomey","year":2017,"tmdb_id":435129,"imdb_id":"tt3901826","original_title":"The Breadwinner","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2992','movie',2992,'{"id":2992,"title":"Ferdinand","director":"Carlos Saldanha","year":2017,"tmdb_id":364689,"imdb_id":"tt3411444","original_title":"Ferdinand","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2993','movie',2993,'{"id":2993,"title":"Bohemian Rhapsody","director":"Bryan Singer","year":2018,"tmdb_id":424694,"imdb_id":"tt1727824","original_title":"Bohemian Rhapsody","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2994','movie',2994,'{"id":2994,"title":"At Eternity''s Gate","director":"Julian Schnabel","year":2018,"tmdb_id":491472,"imdb_id":"tt6938828","original_title":"At Eternity''s Gate","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2995','movie',2995,'{"id":2995,"title":"First Reformed","director":"Paul Schrader","year":2018,"tmdb_id":458737,"imdb_id":"tt6053438","original_title":"First Reformed","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2996','movie',2996,'{"id":2996,"title":"The Ballad of Buster Scruggs","director":"Joel Coen, Ethan Coen","year":2018,"tmdb_id":537996,"imdb_id":"tt6412452","original_title":"The Ballad of Buster Scruggs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2997','movie',2997,'{"id":2997,"title":"Never Look Away","director":"Florian Henckel von Donnersmarck","year":2018,"tmdb_id":423612,"imdb_id":"tt5311542","original_title":"Werk ohne Autor","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2998','movie',2998,'{"id":2998,"title":"The Wife","director":"Björn Runge","year":2017,"tmdb_id":340613,"imdb_id":"tt3750872","original_title":"The Wife","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:2999','movie',2999,'{"id":2999,"title":"Free Solo","director":"Jimmy Chin, Elizabeth Chai Vasarhelyi","year":2018,"tmdb_id":515042,"imdb_id":"tt7775622","original_title":"Free Solo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3000','movie',3000,'{"id":3000,"title":"Hale County This Morning, This Evening","director":"RaMell Ross","year":2018,"tmdb_id":490785,"imdb_id":"tt6634646","original_title":"Hale County This Morning, This Evening","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3001','movie',3001,'{"id":3001,"title":"Of Fathers and Sons","director":"Talal Derki","year":2017,"tmdb_id":488740,"imdb_id":"tt7519174","original_title":"Of Fathers and Sons – Die Kinder des Kalifats","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3002','movie',3002,'{"id":3002,"title":"If Beale Street Could Talk","director":"Barry Jenkins","year":2018,"tmdb_id":465914,"imdb_id":"tt7125860","original_title":"If Beale Street Could Talk","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3003','movie',3003,'{"id":3003,"title":"Spider-Man: Into the Spider-Verse","director":"Bob Persichetti, Peter Ramsey, Rodney Rothman","year":2018,"tmdb_id":324857,"imdb_id":"tt4633694","original_title":"Spider-Man: Into the Spider-Verse","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3004','movie',3004,'{"id":3004,"title":"Minding the Gap","director":"Bing Liu","year":2018,"tmdb_id":489985,"imdb_id":"tt7476236","original_title":"Minding the Gap","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3005','movie',3005,'{"id":3005,"title":"RBG","director":"Betsy West, Julie Cohen","year":2018,"tmdb_id":493099,"imdb_id":"tt7689964","original_title":"RBG","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3006','movie',3006,'{"id":3006,"title":"Ralph Breaks the Internet","director":"Rich Moore, Phil Johnston","year":2018,"tmdb_id":404368,"imdb_id":"tt5848272","original_title":"Ralph Breaks the Internet","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3007','movie',3007,'{"id":3007,"title":"Ford v Ferrari","director":"James Mangold","year":2019,"tmdb_id":359724,"imdb_id":"tt1950186","original_title":"Ford v Ferrari","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3008','movie',3008,'{"id":3008,"title":"Little Women","director":"Greta Gerwig","year":2019,"tmdb_id":331482,"imdb_id":"tt3281548","original_title":"Little Women","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3009','movie',3009,'{"id":3009,"title":"Incredibles 2","director":"Brad Bird","year":2018,"tmdb_id":260513,"imdb_id":"tt3606756","original_title":"Incredibles 2","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3010','movie',3010,'{"id":3010,"title":"Mirai","director":"Mamoru Hosoda","year":2018,"tmdb_id":475215,"imdb_id":"tt6900448","original_title":"未来のミライ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3011','movie',3011,'{"id":3011,"title":"Harriet","director":"Kasi Lemmons","year":2019,"tmdb_id":506528,"imdb_id":"tt4648786","original_title":"Harriet","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3012','movie',3012,'{"id":3012,"title":"Judy","director":"Rupert Goold","year":2019,"tmdb_id":491283,"imdb_id":"tt7549996","original_title":"Judy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3013','movie',3013,'{"id":3013,"title":"A Beautiful Day in the Neighborhood","director":"Marielle Heller","year":2019,"tmdb_id":501907,"imdb_id":"tt3224458","original_title":"A Beautiful Day in the Neighborhood","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3014','movie',3014,'{"id":3014,"title":"Bombshell","director":"Jay Roach","year":2019,"tmdb_id":525661,"imdb_id":"tt6394270","original_title":"Bombshell","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3015','movie',3015,'{"id":3015,"title":"1917","director":"Sam Mendes","year":2019,"tmdb_id":530915,"imdb_id":"tt8579674","original_title":"1917","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3016','movie',3016,'{"id":3016,"title":"Richard Jewell","director":"Clint Eastwood","year":2019,"tmdb_id":292011,"imdb_id":"tt3513548","original_title":"Richard Jewell","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3017','movie',3017,'{"id":3017,"title":"Corpus Christi","director":"Jan Komasa","year":2019,"tmdb_id":471707,"imdb_id":"tt8649186","original_title":"Boże Ciało","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3018','movie',3018,'{"id":3018,"title":"Honeyland","director":"Ljubomir Stefanov, Tamara Kotevska","year":2019,"tmdb_id":566213,"imdb_id":"tt8991268","original_title":"Медена земја","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3019','movie',3019,'{"id":3019,"title":"American Factory","director":"Steven Bognar, Julia Reichert","year":2019,"tmdb_id":565716,"imdb_id":"tt9351980","original_title":"American Factory","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3020','movie',3020,'{"id":3020,"title":"The Edge of Democracy","director":"Petra Costa","year":2019,"tmdb_id":566221,"imdb_id":"tt6016744","original_title":"Democracia em Vertigem","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3021','movie',3021,'{"id":3021,"title":"The Cave","director":"Feras Fayyad","year":2019,"tmdb_id":621729,"imdb_id":"tt7178226","original_title":"The Cave","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3022','movie',3022,'{"id":3022,"title":"For Sama","director":"Edward Watts, Waad al-Kateab","year":2019,"tmdb_id":576017,"imdb_id":"tt9617456","original_title":"For Sama","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3023','movie',3023,'{"id":3023,"title":"Missing Link","director":"Chris Butler","year":2019,"tmdb_id":458253,"imdb_id":"tt6348138","original_title":"Missing Link","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3024','movie',3024,'{"id":3024,"title":"I Lost My Body","director":"Jérémy Clapin","year":2019,"tmdb_id":586940,"imdb_id":"tt9806192","original_title":"J''ai perdu mon corps","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3025','movie',3025,'{"id":3025,"title":"The Lady in the Van","director":"Nicholas Hytner","year":2015,"tmdb_id":328589,"imdb_id":"tt3722070","original_title":"The Lady in the Van","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3026','movie',3026,'{"id":3026,"title":"Wild Tales","director":"Damián Szifron","year":2014,"tmdb_id":265195,"imdb_id":"tt3011894","original_title":"Relatos salvajes","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3027','movie',3027,'{"id":3027,"title":"Timbuktu","director":"Abderrahmane Sissako","year":2014,"tmdb_id":265228,"imdb_id":"tt3409392","original_title":"Timbuktu","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3028','movie',3028,'{"id":3028,"title":"How to Train Your Dragon: The Hidden World","director":"Dean DeBlois","year":2019,"tmdb_id":166428,"imdb_id":"tt2386490","original_title":"How to Train Your Dragon: The Hidden World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3029','movie',3029,'{"id":3029,"title":"He Named Me Malala","director":"Davis Guggenheim","year":2015,"tmdb_id":338928,"imdb_id":"tt3065132","original_title":"He Named Me Malala","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3030','movie',3030,'{"id":3030,"title":"Listen to Me Marlon","director":"Stevan Riley","year":2015,"tmdb_id":319076,"imdb_id":"tt4145178","original_title":"Listen to Me Marlon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3031','movie',3031,'{"id":3031,"title":"The Assassin","director":"Hou Hsiao-hsien","year":2015,"tmdb_id":253450,"imdb_id":"tt3508840","original_title":"刺客聶隱娘","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3032','movie',3032,'{"id":3032,"title":"American Honey","director":"Andrea Arnold","year":2016,"tmdb_id":340485,"imdb_id":"tt3721936","original_title":"American Honey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3033','movie',3033,'{"id":3033,"title":"Sherpa","director":"Jennifer Peedom","year":2015,"tmdb_id":341366,"imdb_id":"tt3746250","original_title":"Sherpa","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3034','movie',3034,'{"id":3034,"title":"Notes on Blindness","director":"James Spinney, Pete Middleton","year":2016,"tmdb_id":378441,"imdb_id":"tt5117222","original_title":"Notes on Blindness","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3035','movie',3035,'{"id":3035,"title":"The Girl on the Train","director":"Tate Taylor","year":2016,"tmdb_id":346685,"imdb_id":"tt3631112","original_title":"The Girl on the Train","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3036','movie',3036,'{"id":3036,"title":"Force Majeure","director":"Ruben Östlund","year":2014,"tmdb_id":265189,"imdb_id":"tt2121382","original_title":"Turist","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3037','movie',3037,'{"id":3037,"title":"Under the Shadow","director":"Babak Anvari","year":2016,"tmdb_id":375012,"imdb_id":"tt4273292","original_title":"زیر سایه","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3038','movie',3038,'{"id":3038,"title":"Weiner","director":"Josh Kriegman, Elyse Steinberg","year":2016,"tmdb_id":376261,"imdb_id":"tt5278596","original_title":"Weiner","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3039','movie',3039,'{"id":3039,"title":"The Beatles: Eight Days a Week - The Touring Years","director":"Ron Howard","year":2016,"tmdb_id":391698,"imdb_id":"tt2531318","original_title":"The Beatles: Eight Days a Week - The Touring Years","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3040','movie',3040,'{"id":3040,"title":"The Eagle Huntress","director":"Otto Bell","year":2016,"tmdb_id":376530,"imdb_id":"tt3882074","original_title":"The Eagle Huntress","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3041','movie',3041,'{"id":3041,"title":"Finding Dory","director":"Andrew Stanton","year":2016,"tmdb_id":127380,"imdb_id":"tt2277860","original_title":"Finding Dory","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3042','movie',3042,'{"id":3042,"title":"God''s Own Country","director":"Francis Lee","year":2017,"tmdb_id":428493,"imdb_id":"tt5635086","original_title":"God''s Own Country","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3043','movie',3043,'{"id":3043,"title":"Paddington 2","director":"Paul King","year":2017,"tmdb_id":346648,"imdb_id":"tt4468740","original_title":"Paddington 2","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3044','movie',3044,'{"id":3044,"title":"The Handmaiden","director":"Park Chan-wook","year":2016,"tmdb_id":290098,"imdb_id":"tt4016934","original_title":"아가씨","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3045','movie',3045,'{"id":3045,"title":"First They Killed My Father","director":"Angelina Jolie","year":2017,"tmdb_id":433247,"imdb_id":"tt4882376","original_title":"First They Killed My Father","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3046','movie',3046,'{"id":3046,"title":"Lady Macbeth","director":"William Oldroyd","year":2016,"tmdb_id":410117,"imdb_id":"tt4291600","original_title":"Lady Macbeth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3047','movie',3047,'{"id":3047,"title":"City of Ghosts","director":"Matthew Heineman","year":2017,"tmdb_id":428501,"imdb_id":"tt6333056","original_title":"City of Ghosts","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3048','movie',3048,'{"id":3048,"title":"Beast","director":"Michael Pearce","year":2018,"tmdb_id":470918,"imdb_id":"tt5628302","original_title":"Beast","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3049','movie',3049,'{"id":3049,"title":"Film Stars Don''t Die in Liverpool","director":"Paul McGuigan","year":2017,"tmdb_id":398174,"imdb_id":"tt5711148","original_title":"Film Stars Don''t Die in Liverpool","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3050','movie',3050,'{"id":3050,"title":"Stan & Ollie","director":"Jon S. Baird","year":2018,"tmdb_id":394741,"imdb_id":"tt3385524","original_title":"Stan & Ollie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3051','movie',3051,'{"id":3051,"title":"Mary Queen of Scots","director":"Josie Rourke","year":2018,"tmdb_id":457136,"imdb_id":"tt2328900","original_title":"Mary Queen of Scots","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3052','movie',3052,'{"id":3052,"title":"Three Identical Strangers","director":"Tim Wardle","year":2018,"tmdb_id":489988,"imdb_id":"tt7664504","original_title":"Three Identical Strangers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3053','movie',3053,'{"id":3053,"title":"Bait","director":"Mark Jenkin","year":2019,"tmdb_id":576069,"imdb_id":"tt9652782","original_title":"Bait","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3054','movie',3054,'{"id":3054,"title":"Beautiful Boy","director":"Felix van Groeningen","year":2018,"tmdb_id":451915,"imdb_id":"tt1226837","original_title":"Beautiful Boy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3055','movie',3055,'{"id":3055,"title":"Rocketman","director":"Dexter Fletcher","year":2019,"tmdb_id":504608,"imdb_id":"tt2066051","original_title":"Rocketman","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3056','movie',3056,'{"id":3056,"title":"Wild Rose","director":"Tom Harper","year":2019,"tmdb_id":482981,"imdb_id":"tt5117428","original_title":"Wild Rose","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3057','movie',3057,'{"id":3057,"title":"Booksmart","director":"Olivia Wilde","year":2019,"tmdb_id":505600,"imdb_id":"tt1489887","original_title":"Booksmart","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3058','movie',3058,'{"id":3058,"title":"Sorry We Missed You","director":"Ken Loach","year":2019,"tmdb_id":522369,"imdb_id":"tt8359816","original_title":"Sorry We Missed You","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3059','movie',3059,'{"id":3059,"title":"Diego Maradona","director":"Asif Kapadia","year":2019,"tmdb_id":536841,"imdb_id":"tt5433114","original_title":"Diego Maradona","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3060','movie',3060,'{"id":3060,"title":"Apollo 11","director":"Todd Douglas Miller","year":2019,"tmdb_id":549559,"imdb_id":"tt8760684","original_title":"Apollo 11","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3061','movie',3061,'{"id":3061,"title":"The Great Hack","director":"Karim Amer, Jehane Noujaim","year":2019,"tmdb_id":566222,"imdb_id":"tt4736550","original_title":"The Great Hack","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3062','movie',3062,'{"id":3062,"title":"The Peanuts Movie","director":"Steve Martino","year":2015,"tmdb_id":227973,"imdb_id":"tt2452042","original_title":"The Peanuts Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3063','movie',3063,'{"id":3063,"title":"Widows","director":"Steve McQueen","year":2018,"tmdb_id":401469,"imdb_id":"tt4218572","original_title":"Widows","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3064','movie',3064,'{"id":3064,"title":"Frozen II","director":"Jennifer Lee, Chris Buck","year":2019,"tmdb_id":330457,"imdb_id":"tt4520988","original_title":"Frozen II","original_language":"en","alternate_titles":["Frozen 2"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3065','movie',3065,'{"id":3065,"title":"The Club","director":"Pablo Larraín","year":2015,"tmdb_id":319995,"imdb_id":"tt4375438","original_title":"El club","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3066','movie',3066,'{"id":3066,"title":"The Fencer","director":"Klaus Härö","year":2015,"tmdb_id":322488,"imdb_id":"tt2534634","original_title":"Vehkleja","original_language":"et","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3067','movie',3067,'{"id":3067,"title":"The Good Dinosaur","director":"Peter Sohn","year":2015,"tmdb_id":105864,"imdb_id":"tt1979388","original_title":"The Good Dinosaur","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3068','movie',3068,'{"id":3068,"title":"Concussion","director":"Peter Landesman","year":2015,"tmdb_id":321741,"imdb_id":"tt3322364","original_title":"Concussion","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3069','movie',3069,'{"id":3069,"title":"Danny Collins","director":"Dan Fogelman","year":2015,"tmdb_id":256924,"imdb_id":"tt1772288","original_title":"Danny Collins","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3070','movie',3070,'{"id":3070,"title":"Infinitely Polar Bear","director":"Maya Forbes","year":2014,"tmdb_id":244539,"imdb_id":"tt1969062","original_title":"Infinitely Polar Bear","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3071','movie',3071,'{"id":3071,"title":"Grandma","director":"Paul Weitz","year":2015,"tmdb_id":309304,"imdb_id":"tt4270516","original_title":"Grandma","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3072','movie',3072,'{"id":3072,"title":"Sing Street","director":"John Carney","year":2016,"tmdb_id":369557,"imdb_id":"tt3544112","original_title":"Sing Street","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3073','movie',3073,'{"id":3073,"title":"Love & Mercy","director":"Bill Pohlad","year":2015,"tmdb_id":271714,"imdb_id":"tt0903657","original_title":"Love & Mercy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3074','movie',3074,'{"id":3074,"title":"Divines","director":"Houda Benyamina","year":2016,"tmdb_id":393729,"imdb_id":"tt4730986","original_title":"Divines","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3075','movie',3075,'{"id":3075,"title":"Miss Sloane","director":"John Madden","year":2016,"tmdb_id":376290,"imdb_id":"tt4540710","original_title":"Miss Sloane","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3076','movie',3076,'{"id":3076,"title":"99 Homes","director":"Ramin Bahrani","year":2015,"tmdb_id":283235,"imdb_id":"tt2891174","original_title":"99 Homes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3077','movie',3077,'{"id":3077,"title":"Rules Don''t Apply","director":"Warren Beatty","year":2016,"tmdb_id":291328,"imdb_id":"tt1974420","original_title":"Rules Don''t Apply","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3078','movie',3078,'{"id":3078,"title":"War Dogs","director":"Todd Phillips","year":2016,"tmdb_id":308266,"imdb_id":"tt2005151","original_title":"War Dogs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3079','movie',3079,'{"id":3079,"title":"Victoria & Abdul","director":"Stephen Frears","year":2017,"tmdb_id":423899,"imdb_id":"tt5816682","original_title":"Victoria & Abdul","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3080','movie',3080,'{"id":3080,"title":"The Edge of Seventeen","director":"Kelly Fremon Craig","year":2016,"tmdb_id":376660,"imdb_id":"tt1878870","original_title":"The Edge of Seventeen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3081','movie',3081,'{"id":3081,"title":"The Leisure Seeker","director":"Paolo Virzì","year":2018,"tmdb_id":449749,"imdb_id":"tt3741632","original_title":"The Leisure Seeker","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3082','movie',3082,'{"id":3082,"title":"Battle of the Sexes","director":"Valerie Faris, Jonathan Dayton","year":2017,"tmdb_id":369192,"imdb_id":"tt4622512","original_title":"Battle of the Sexes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3083','movie',3083,'{"id":3083,"title":"Baby Driver","director":"Edgar Wright","year":2017,"tmdb_id":339403,"imdb_id":"tt3890160","original_title":"Baby Driver","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3084','movie',3084,'{"id":3084,"title":"Downsizing","director":"Alexander Payne","year":2017,"tmdb_id":301337,"imdb_id":"tt1389072","original_title":"Downsizing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3085','movie',3085,'{"id":3085,"title":"Mary Poppins Returns","director":"Rob Marshall","year":2018,"tmdb_id":400650,"imdb_id":"tt5028340","original_title":"Mary Poppins Returns","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3086','movie',3086,'{"id":3086,"title":"Girl","director":"Lukas Dhont","year":2018,"tmdb_id":515916,"imdb_id":"tt8254556","original_title":"Girl","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3087','movie',3087,'{"id":3087,"title":"The Greatest Showman","director":"Michael Gracey","year":2017,"tmdb_id":316029,"imdb_id":"tt1485796","original_title":"The Greatest Showman","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3088','movie',3088,'{"id":3088,"title":"Crazy Rich Asians","director":"Jon M. Chu","year":2018,"tmdb_id":455207,"imdb_id":"tt3104988","original_title":"Crazy Rich Asians","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3089','movie',3089,'{"id":3089,"title":"Boy Erased","director":"Joel Edgerton","year":2018,"tmdb_id":472451,"imdb_id":"tt7008872","original_title":"Boy Erased","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3090','movie',3090,'{"id":3090,"title":"Eighth Grade","director":"Bo Burnham","year":2018,"tmdb_id":489925,"imdb_id":"tt7014006","original_title":"Eighth Grade","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3091','movie',3091,'{"id":3091,"title":"In the Fade","director":"Fatih Akin","year":2017,"tmdb_id":423646,"imdb_id":"tt5723272","original_title":"Aus dem Nichts","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3092','movie',3092,'{"id":3092,"title":"Tully","director":"Jason Reitman","year":2018,"tmdb_id":400579,"imdb_id":"tt5610554","original_title":"Tully","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3093','movie',3093,'{"id":3093,"title":"The Old Man & the Gun","director":"David Lowery","year":2018,"tmdb_id":429203,"imdb_id":"tt2837574","original_title":"The Old Man & the Gun","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3094','movie',3094,'{"id":3094,"title":"The Farewell","director":"Lulu Wang","year":2019,"tmdb_id":565310,"imdb_id":"tt8637428","original_title":"The Farewell","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3095','movie',3095,'{"id":3095,"title":"Dolemite Is My Name","director":"Craig Brewer","year":2019,"tmdb_id":528888,"imdb_id":"tt8526872","original_title":"Dolemite Is My Name","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3096','movie',3096,'{"id":3096,"title":"A Private War","director":"Matthew Heineman","year":2018,"tmdb_id":475132,"imdb_id":"tt2368254","original_title":"A Private War","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3097','movie',3097,'{"id":3097,"title":"The Report","director":"Scott Z. Burns","year":2019,"tmdb_id":524348,"imdb_id":"tt8236336","original_title":"The Report","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3098','movie',3098,'{"id":3098,"title":"Late Night","director":"Nisha Ganatra","year":2019,"tmdb_id":523172,"imdb_id":"tt6107548","original_title":"Late Night","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3099','movie',3099,'{"id":3099,"title":"The Lion King","director":"Jon Favreau","year":2019,"tmdb_id":420818,"imdb_id":"tt6105098","original_title":"The Lion King","original_language":"en","alternate_titles":["The Lion King (2019)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3100','movie',3100,'{"id":3100,"title":"Destroyer","director":"Karyn Kusama","year":2018,"tmdb_id":471507,"imdb_id":"tt7137380","original_title":"Destroyer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3101','movie',3101,'{"id":3101,"title":"Aquarius","director":"Kleber Mendonça Filho","year":2016,"tmdb_id":377273,"imdb_id":"tt5221584","original_title":"Aquarius","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3102','movie',3102,'{"id":3102,"title":"Where''d You Go, Bernadette","director":"Richard Linklater","year":2019,"tmdb_id":405177,"imdb_id":"tt2365580","original_title":"Where''d You Go, Bernadette","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3103','movie',3103,'{"id":3103,"title":"Julieta","director":"Pedro Almodóvar","year":2016,"tmdb_id":332872,"imdb_id":"tt4326444","original_title":"Julieta","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3104','movie',3104,'{"id":3104,"title":"It''s Only the End of the World","director":"Xavier Dolan","year":2016,"tmdb_id":338189,"imdb_id":"tt4645368","original_title":"Juste la fin du monde","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3105','movie',3105,'{"id":3105,"title":"Slack Bay","director":"Bruno Dumont","year":2016,"tmdb_id":371865,"imdb_id":"tt4726636","original_title":"Ma Loute","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3106','movie',3106,'{"id":3106,"title":"The Unknown Girl","director":"Jean-Pierre Dardenne, Luc Dardenne","year":2016,"tmdb_id":340481,"imdb_id":"tt4630550","original_title":"La Fille inconnue","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3107','movie',3107,'{"id":3107,"title":"From the Land of the Moon","director":"Nicole Garcia","year":2016,"tmdb_id":376166,"imdb_id":"tt3794028","original_title":"Mal de pierres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3108','movie',3108,'{"id":3108,"title":"Personal Shopper","director":"Olivier Assayas","year":2016,"tmdb_id":340676,"imdb_id":"tt4714782","original_title":"Personal Shopper","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3109','movie',3109,'{"id":3109,"title":"Staying Vertical","director":"Alain Guiraudie","year":2016,"tmdb_id":380622,"imdb_id":"tt5231812","original_title":"Rester vertical","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3110','movie',3110,'{"id":3110,"title":"Sieranevada","director":"Cristi Puiu","year":2016,"tmdb_id":374452,"imdb_id":"tt4466490","original_title":"Sieranevada","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3111','movie',3111,'{"id":3111,"title":"The Last Face","director":"Sean Penn","year":2016,"tmdb_id":287904,"imdb_id":"tt3286560","original_title":"The Last Face","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3112','movie',3112,'{"id":3112,"title":"Hustlers","director":"Lorene Scafaria","year":2019,"tmdb_id":540901,"imdb_id":"tt5503686","original_title":"Hustlers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3113','movie',3113,'{"id":3113,"title":"The Neon Demon","director":"Nicolas Winding Refn","year":2016,"tmdb_id":301365,"imdb_id":"tt1974419","original_title":"The Neon Demon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3114','movie',3114,'{"id":3114,"title":"Apprentice","director":"Boo Junfeng","year":2016,"tmdb_id":391709,"imdb_id":"tt4660736","original_title":"Apprentice","original_language":"ms","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3115','movie',3115,'{"id":3115,"title":"Graduation","director":"Cristian Mungiu","year":2016,"tmdb_id":374458,"imdb_id":"tt4936450","original_title":"Bacalaureat","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3116','movie',3116,'{"id":3116,"title":"Harmonium","director":"Koji Fukada","year":2016,"tmdb_id":392795,"imdb_id":"tt5182856","original_title":"淵に立つ","original_language":"ja","alternate_titles":["FUCHI NI TATSU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3117','movie',3117,'{"id":3117,"title":"The Dancer","director":"Stéphanie Di Giusto","year":2016,"tmdb_id":392794,"imdb_id":"tt4632440","original_title":"La Danseuse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3118','movie',3118,'{"id":3118,"title":"The Happiest Day in the Life of Olli Mäki","director":"Juho Kuosmanen","year":2016,"tmdb_id":392807,"imdb_id":"tt4771932","original_title":"Hymyilevä mies","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3119','movie',3119,'{"id":3119,"title":"Dogs","director":"Bogdan Mirică","year":2016,"tmdb_id":392812,"imdb_id":"tt5088794","original_title":"Câini","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3120','movie',3120,'{"id":3120,"title":"The Long Night of Francisco Sanctis","director":"Francisco Márquez, Andrea Testa","year":2016,"tmdb_id":392809,"imdb_id":"tt5623224","original_title":"La larga noche de Francisco Sanctis","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3121','movie',3121,'{"id":3121,"title":"Beyond the Mountains and Hills","director":"Eran Kolirin","year":2016,"tmdb_id":392804,"imdb_id":"tt5695672","original_title":"מעבר להרים ולגבעות","original_language":"he","alternate_titles":["ME’EVER LAHARIM VEHAGVAOT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3122','movie',3122,'{"id":3122,"title":"The Transfiguration","director":"Michael O''Shea","year":2016,"tmdb_id":392818,"imdb_id":"tt5039088","original_title":"The Transfiguration","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3123','movie',3123,'{"id":3123,"title":"Clash","director":"Mohamed Diab","year":2016,"tmdb_id":393184,"imdb_id":"tt5599692","original_title":"إشتباك","original_language":"ar","alternate_titles":["ESHTEBAK"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3124','movie',3124,'{"id":3124,"title":"Pericle","director":"Stefano Mordini","year":2016,"tmdb_id":392816,"imdb_id":"tt4017052","original_title":"Pericle il nero","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3125','movie',3125,'{"id":3125,"title":"Personal Affairs","director":"Maha Haj","year":2016,"tmdb_id":392796,"imdb_id":"tt5695668","original_title":"עניינים אישיים","original_language":"he","alternate_titles":["OMOR SHAKHSIYA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3126','movie',3126,'{"id":3126,"title":"Inversion","director":"Behnam Behzadi","year":2016,"tmdb_id":392791,"imdb_id":"tt5695764","original_title":"وارونگی","original_language":"fa","alternate_titles":["VAROONEGI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3127','movie',3127,'{"id":3127,"title":"Good Time","director":"Josh Safdie, Benny Safdie","year":2017,"tmdb_id":429200,"imdb_id":"tt4846232","original_title":"Good Time","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3128','movie',3128,'{"id":3128,"title":"The Stopover","director":"Muriel Coulin, Delphine Coulin","year":2016,"tmdb_id":392788,"imdb_id":"tt4699444","original_title":"Voir du pays","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3129','movie',3129,'{"id":3129,"title":"After the Storm","director":"Hirokazu Kore-eda","year":2016,"tmdb_id":374671,"imdb_id":"tt5294966","original_title":"海よりもまだ深く","original_language":"ja","alternate_titles":["UMI YORIMO MADA FUKAKU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3130','movie',3130,'{"id":3130,"title":"Radiance","director":"Naomi Kawase","year":2017,"tmdb_id":444428,"imdb_id":"tt6165792","original_title":"光","original_language":"ja","alternate_titles":["HIKARI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3131','movie',3131,'{"id":3131,"title":"Happy End","director":"Michael Haneke","year":2017,"tmdb_id":399031,"imdb_id":"tt5304464","original_title":"Happy End","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3132','movie',3132,'{"id":3132,"title":"Jupiter''s Moon","director":"Kornél Mundruczó","year":2017,"tmdb_id":444395,"imdb_id":"tt5842890","original_title":"Jupiter holdja","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3133','movie',3133,'{"id":3133,"title":"A Gentle Creature","director":"Sergei Loznitsa","year":2017,"tmdb_id":442947,"imdb_id":"tt5618752","original_title":"Кроткая","original_language":"ru","alternate_titles":["KROTKAYA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3134','movie',3134,'{"id":3134,"title":"Double Lover","director":"François Ozon","year":2017,"tmdb_id":451955,"imdb_id":"tt6367558","original_title":"L''Amant double","original_language":"fr","alternate_titles":[" (AMANT DOUBLE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3135','movie',3135,'{"id":3135,"title":"BPM (Beats per Minute)","director":"Robin Campillo","year":2017,"tmdb_id":451945,"imdb_id":"tt6135348","original_title":"120 battements par minute","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3136','movie',3136,'{"id":3136,"title":"Godard Mon Amour","director":"Michel Hazanavicius","year":2017,"tmdb_id":416186,"imdb_id":"tt5687334","original_title":"Le Redoutable","original_language":"fr","alternate_titles":[" (REDOUBTABLE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3137','movie',3137,'{"id":3137,"title":"Rodin","director":"Jacques Doillon","year":2017,"tmdb_id":445768,"imdb_id":"tt5771710","original_title":"Rodin","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3138','movie',3138,'{"id":3138,"title":"The Meyerowitz Stories (New and Selected)","director":"Noah Baumbach","year":2017,"tmdb_id":396398,"imdb_id":"tt5536736","original_title":"The Meyerowitz Stories (New and Selected)","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3139','movie',3139,'{"id":3139,"title":"The Day After","director":"Hong Sang-soo","year":2017,"tmdb_id":451957,"imdb_id":"tt6462506","original_title":"그 후","original_language":"ko","alternate_titles":["GEU-HU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3140','movie',3140,'{"id":3140,"title":"Beauty and the Dogs","director":"Kaouther Ben Hania","year":2017,"tmdb_id":452010,"imdb_id":"tt6776572","original_title":"على كف عفريت","original_language":"ar","alternate_titles":["AALA KAF IFRIT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3141','movie',3141,'{"id":3141,"title":"Wonderstruck","director":"Todd Haynes","year":2017,"tmdb_id":383709,"imdb_id":"tt5208216","original_title":"Wonderstruck","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3142','movie',3142,'{"id":3142,"title":"Lucky","director":"Sergio Castellitto","year":2017,"tmdb_id":449856,"imdb_id":"tt6306400","original_title":"Fortunata","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3143','movie',3143,'{"id":3143,"title":"After the War","director":"Annarita Zambrano","year":2017,"tmdb_id":452018,"imdb_id":"tt6155960","original_title":"Dopo la guerra","original_language":"it","alternate_titles":["DOPO LA GUERRA (APRÈS LA GUERRE)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3144','movie',3144,'{"id":3144,"title":"Barbara","director":"Mathieu Amalric","year":2017,"tmdb_id":451618,"imdb_id":"tt6411984","original_title":"Barbara","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3145','movie',3145,'{"id":3145,"title":"Until The Birds Return","director":"Karim Moussaoui","year":2017,"tmdb_id":451996,"imdb_id":"tt6226610","original_title":"En Attendant Les Hirondelles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3146','movie',3146,'{"id":3146,"title":"The Desert Bride","director":"Cecilia Atán, Valeria Pivato","year":2017,"tmdb_id":451985,"imdb_id":"tt6147512","original_title":"La novia del desierto","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3147','movie',3147,'{"id":3147,"title":"April''s Daughters","director":"Michel Franco","year":2017,"tmdb_id":449754,"imdb_id":"tt6397762","original_title":"Las hijas de Abril","original_language":"es","alternate_titles":[" (APRIL´S DAUGHTER"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3148','movie',3148,'{"id":3148,"title":"A Man of Integrity","director":"Mohammad Rasoulof","year":2017,"tmdb_id":452013,"imdb_id":"tt6776462","original_title":"لرد","original_language":"fa","alternate_titles":["LERD"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3149','movie',3149,'{"id":3149,"title":"The Workshop","director":"Laurent Cantet","year":2017,"tmdb_id":444397,"imdb_id":"tt6444838","original_title":"L''Atelier","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3150','movie',3150,'{"id":3150,"title":"Jeune Femme","director":"Léonor Serraille","year":2017,"tmdb_id":452016,"imdb_id":"tt5598160","original_title":"Jeune femme","original_language":"fr","alternate_titles":[" (MONTPARNASSE BIENVENUE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3151','movie',3151,'{"id":3151,"title":"Directions","director":"Stephan Komandarev","year":2017,"tmdb_id":451988,"imdb_id":"tt6467968","original_title":"Посоки","original_language":"bg","alternate_titles":["POSOKI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3152','movie',3152,'{"id":3152,"title":"The Summit","director":"Santiago Mitre","year":2017,"tmdb_id":440374,"imdb_id":"tt6047298","original_title":"La cordillera","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3153','movie',3153,'{"id":3153,"title":"Western","director":"Valeska Grisebach","year":2017,"tmdb_id":452000,"imdb_id":"tt5157326","original_title":"Western","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3154','movie',3154,'{"id":3154,"title":"Walking Past the Future","director":"Li Ruijun","year":2017,"tmdb_id":455585,"imdb_id":"tt6838570","original_title":"路過未來","original_language":"zh","alternate_titles":["LU GUO WEI LAI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3155','movie',3155,'{"id":3155,"title":"Wind River","director":"Taylor Sheridan","year":2017,"tmdb_id":395834,"imdb_id":"tt5362988","original_title":"Wind River","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3156','movie',3156,'{"id":3156,"title":"3 Faces","director":"Jafar Panahi","year":2018,"tmdb_id":517731,"imdb_id":"tt8269552","original_title":"سه رخ","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3157','movie',3157,'{"id":3157,"title":"Before We Vanish","director":"Kiyoshi Kurosawa","year":2017,"tmdb_id":446164,"imdb_id":"tt5999530","original_title":"散歩する侵略者","original_language":"ja","alternate_titles":["SANPO SURU SHINRYAKUSHA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3158','movie',3158,'{"id":3158,"title":"The Wild Pear Tree","director":"Nuri Bilge Ceylan","year":2018,"tmdb_id":418472,"imdb_id":"tt6628102","original_title":"Ahlat Ağacı","original_language":"tr","alternate_titles":["AHLAT AGACI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3159','movie',3159,'{"id":3159,"title":"Dogman","director":"Matteo Garrone","year":2018,"tmdb_id":483184,"imdb_id":"tt6768578","original_title":"Dogman","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3160','movie',3160,'{"id":3160,"title":"At War","director":"Stéphane Brizé","year":2018,"tmdb_id":485162,"imdb_id":"tt7555774","original_title":"En guerre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3161','movie',3161,'{"id":3161,"title":"The Image Book","director":"Jean-Luc Godard","year":2018,"tmdb_id":414030,"imdb_id":"tt5749596","original_title":"Le Livre d''image","original_language":"fr","alternate_titles":[" (IMAGE BOOK"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3162','movie',3162,'{"id":3162,"title":"Burning","director":"Lee Chang-dong","year":2018,"tmdb_id":491584,"imdb_id":"tt7282468","original_title":"버닝","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3163','movie',3163,'{"id":3163,"title":"Girls of the Sun","director":"Eva Husson","year":2018,"tmdb_id":479520,"imdb_id":"tt6704880","original_title":"Les Filles du soleil","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3164','movie',3164,'{"id":3164,"title":"Ash Is Purest White","director":"Jia Zhangke","year":2018,"tmdb_id":441393,"imdb_id":"tt7298400","original_title":"江湖儿女","original_language":"zh","alternate_titles":["JIANG HU ER NV"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3165','movie',3165,'{"id":3165,"title":"Everybody Knows","director":"Asghar Farhadi","year":2018,"tmdb_id":401545,"imdb_id":"tt4964788","original_title":"Todos lo saben","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3166','movie',3166,'{"id":3166,"title":"Under the Silver Lake","director":"David Robert Mitchell","year":2018,"tmdb_id":396461,"imdb_id":"tt5691670","original_title":"Under the Silver Lake","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3167','movie',3167,'{"id":3167,"title":"Sextape","director":"Antoine Desrosières","year":2018,"tmdb_id":517982,"imdb_id":"tt6386684","original_title":"À genoux les gars","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3168','movie',3168,'{"id":3168,"title":"Knife+Heart","director":"Yann Gonzalez","year":2018,"tmdb_id":475930,"imdb_id":"tt6426028","original_title":"Un couteau dans le cœur","original_language":"fr","alternate_titles":["UN COUTEAU DANS LE COEUR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3169','movie',3169,'{"id":3169,"title":"Sorry Angel","director":"Christophe Honoré","year":2018,"tmdb_id":485189,"imdb_id":"tt7534054","original_title":"Plaire, aimer et courir vite","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3170','movie',3170,'{"id":3170,"title":"Donbass","director":"Sergei Loznitsa","year":2018,"tmdb_id":519187,"imdb_id":"tt8282042","original_title":"Донбас","original_language":"uk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3171','movie',3171,'{"id":3171,"title":"The Dead and the Others","director":"Renée Nader Messora, João Salaviza","year":2018,"tmdb_id":519241,"imdb_id":"tt8423962","original_title":"Chuva É Cantoria na Aldeia dos Mortos","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3172','movie',3172,'{"id":3172,"title":"Border","director":"Ali Abbasi","year":2018,"tmdb_id":517839,"imdb_id":"tt5501104","original_title":"Gräns","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3173','movie',3173,'{"id":3173,"title":"Long Day''s Journey Into Night","director":"Bi Gan","year":2018,"tmdb_id":486898,"imdb_id":"tt8185182","original_title":"地球最后的夜晚","original_language":"zh","alternate_titles":["DI QIU ZUI HOU DE YE WAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3174','movie',3174,'{"id":3174,"title":"Angel Face","director":"Vanessa Filho","year":2018,"tmdb_id":489170,"imdb_id":"tt7534096","original_title":"Gueule d''ange","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3175','movie',3175,'{"id":3175,"title":"Euphoria","director":"Valeria Golino","year":2018,"tmdb_id":517940,"imdb_id":"tt7779590","original_title":"Euforia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3176','movie',3176,'{"id":3176,"title":"In My Room","director":"Ulrich Köhler","year":2018,"tmdb_id":488453,"imdb_id":"tt6268812","original_title":"In My Room","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3177','movie',3177,'{"id":3177,"title":"The Gentle Indifference of the World","director":"Adilkhan Yerzhanov","year":2018,"tmdb_id":520273,"imdb_id":"tt8269378","original_title":"Әлемнің ерке енжарлығы","original_language":"kk","alternate_titles":["LASKOVOE BEZRAZLICHIE MIRA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3178','movie',3178,'{"id":3178,"title":"Little Tickles","director":"Eric Métayer, Andréa Bescond","year":2018,"tmdb_id":484747,"imdb_id":"tt7502234","original_title":"Les Chatouilles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3179','movie',3179,'{"id":3179,"title":"Manto","director":"Nandita Das","year":2018,"tmdb_id":517975,"imdb_id":"tt6923462","original_title":"मंटो","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3180','movie',3180,'{"id":3180,"title":"My Favourite Fabric","director":"Gaya Jiji","year":2018,"tmdb_id":515049,"imdb_id":"tt6992946","original_title":"Mon tissu préféré","original_language":"fr","alternate_titles":[" (MY FAVORITE FABRIC"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3181','movie',3181,'{"id":3181,"title":"A Hidden Life","director":"Terrence Malick","year":2019,"tmdb_id":403300,"imdb_id":"tt5827916","original_title":"A Hidden Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3182','movie',3182,'{"id":3182,"title":"Rafiki","director":"Wanuri Kahiu","year":2018,"tmdb_id":517987,"imdb_id":"tt8286894","original_title":"Rafiki","original_language":"sw","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3183','movie',3183,'{"id":3183,"title":"Bacurau","director":"Juliano Dornelles, Kleber Mendonça Filho","year":2019,"tmdb_id":446159,"imdb_id":"tt2762506","original_title":"Bacurau","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3184','movie',3184,'{"id":3184,"title":"Frankie","director":"Ira Sachs","year":2019,"tmdb_id":505941,"imdb_id":"tt8019694","original_title":"Frankie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3185','movie',3185,'{"id":3185,"title":"The Traitor","director":"Marco Bellocchio","year":2019,"tmdb_id":575452,"imdb_id":"tt7736478","original_title":"Il traditore","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3186','movie',3186,'{"id":3186,"title":"The Harvesters","director":"Etienne Kallos","year":2018,"tmdb_id":517978,"imdb_id":"tt8144850","original_title":"Die Stropers","original_language":"af","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3187','movie',3187,'{"id":3187,"title":"Atlantics","director":"Mati Diop","year":2019,"tmdb_id":496967,"imdb_id":"tt10199586","original_title":"Atlantique","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3188','movie',3188,'{"id":3188,"title":"It Must Be Heaven","director":"Elia Suleiman","year":2019,"tmdb_id":539531,"imdb_id":"tt8359842","original_title":"إن شئت كما في السماء","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3189','movie',3189,'{"id":3189,"title":"Little Joe","director":"Jessica Hausner","year":2019,"tmdb_id":504585,"imdb_id":"tt9204204","original_title":"Little Joe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3190','movie',3190,'{"id":3190,"title":"Mektoub, My Love: Intermezzo","director":"Abdellatif Kechiche","year":2019,"tmdb_id":504588,"imdb_id":"tt8253606","original_title":"Mektoub, My Love: Intermezzo","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3191','movie',3191,'{"id":3191,"title":"Murder Me, Monster","director":"Alejandro Fadel","year":2018,"tmdb_id":519238,"imdb_id":"tt8311792","original_title":"Muere, monstruo, muere","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3192','movie',3192,'{"id":3192,"title":"The Wild Goose Lake","director":"Diao Yinan","year":2019,"tmdb_id":575428,"imdb_id":"tt9647768","original_title":"南方车站的聚会","original_language":"zh","alternate_titles":["NAN FANG CHE ZHAN DE JU HUI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3193','movie',3193,'{"id":3193,"title":"Oh Mercy","director":"Arnaud Desplechin","year":2019,"tmdb_id":574097,"imdb_id":"tt8359840","original_title":"Roubaix, une lumière","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3194','movie',3194,'{"id":3194,"title":"Sibyl","director":"Justine Triet","year":2019,"tmdb_id":559401,"imdb_id":"tt9173264","original_title":"Sibyl","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3195','movie',3195,'{"id":3195,"title":"Bull","director":"Annie Silverstein","year":2019,"tmdb_id":595940,"imdb_id":"tt10008784","original_title":"Bull","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3196','movie',3196,'{"id":3196,"title":"On a Magical Night","director":"Christophe Honoré","year":2019,"tmdb_id":595867,"imdb_id":"tt10115562","original_title":"Chambre 212","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3197','movie',3197,'{"id":3197,"title":"Joan of Arc","director":"Bruno Dumont","year":2019,"tmdb_id":540111,"imdb_id":"tt8669356","original_title":"Jeanne","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3198','movie',3198,'{"id":3198,"title":"The Bears'' Famous Invasion of Sicily","director":"Lorenzo Mattotti","year":2019,"tmdb_id":537655,"imdb_id":"tt6284064","original_title":"La Fameuse Invasion des ours en Sicile","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3199','movie',3199,'{"id":3199,"title":"The Swallows of Kabul","director":"Zabou Breitman, Eléa Gobbé-Mévellec","year":2019,"tmdb_id":582881,"imdb_id":"tt7534102","original_title":"Les Hirondelles de Kaboul","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3200','movie',3200,'{"id":3200,"title":"A Brother’s Love","director":"Monia Chokri","year":2019,"tmdb_id":592800,"imdb_id":"tt10155342","original_title":"La femme de mon frère","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3201','movie',3201,'{"id":3201,"title":"Summer of Changsha","director":"Zu Feng","year":2019,"tmdb_id":596041,"imdb_id":"tt10199668","original_title":"六欲天","original_language":"zh","alternate_titles":["LIU YU TIAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3202','movie',3202,'{"id":3202,"title":"Adam","director":"Maryam Touzani","year":2019,"tmdb_id":595875,"imdb_id":"tt10199664","original_title":"آدم","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3203','movie',3203,'{"id":3203,"title":"Once in Trubchevsk","director":"Larisa Sadilova","year":2019,"tmdb_id":598474,"imdb_id":"tt10287616","original_title":"Однажды в Трубчевске","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3204','movie',3204,'{"id":3204,"title":"Liberté","director":"Albert Serra","year":2019,"tmdb_id":595924,"imdb_id":"tt10199670","original_title":"Liberté","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3205','movie',3205,'{"id":3205,"title":"Papicha","director":"Mounia Meddour","year":2019,"tmdb_id":592807,"imdb_id":"tt9522080","original_title":"Papicha","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3206','movie',3206,'{"id":3206,"title":"Port Authority","director":"Danielle Lessovitz","year":2019,"tmdb_id":572404,"imdb_id":"tt7587282","original_title":"Port Authority","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3207','movie',3207,'{"id":3207,"title":"The Woman Who Left","director":"Lav Diaz","year":2016,"tmdb_id":408542,"imdb_id":"tt5843990","original_title":"Ang Babaeng Humayo","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3208','movie',3208,'{"id":3208,"title":"Nina Wu","director":"Midi Z","year":2019,"tmdb_id":595923,"imdb_id":"tt9404442","original_title":"灼人秘密","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3209','movie',3209,'{"id":3209,"title":"The Climb","director":"Michael Angelo Covino","year":2019,"tmdb_id":595931,"imdb_id":"tt8637440","original_title":"The Climb","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3210','movie',3210,'{"id":3210,"title":"The Blind Christ","director":"Christopher Murray","year":2016,"tmdb_id":408544,"imdb_id":"tt4778424","original_title":"El Cristo ciego","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3211','movie',3211,'{"id":3211,"title":"Frantz","director":"François Ozon","year":2016,"tmdb_id":377263,"imdb_id":"tt5029608","original_title":"Frantz","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3212','movie',3212,'{"id":3212,"title":"Brimstone","director":"Martin Koolhoven","year":2016,"tmdb_id":324560,"imdb_id":"tt1895315","original_title":"Brimstone","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3213','movie',3213,'{"id":3213,"title":"Fire Will Come","director":"Óliver Laxe","year":2019,"tmdb_id":575561,"imdb_id":"tt8212958","original_title":"O que arde","original_language":"gl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3214','movie',3214,'{"id":3214,"title":"The Untamed","director":"Amat Escalante","year":2016,"tmdb_id":387801,"imdb_id":"tt5265960","original_title":"La región salvaje","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3215','movie',3215,'{"id":3215,"title":"The Beautiful Days of Aranjuez","director":"Wim Wenders","year":2016,"tmdb_id":351414,"imdb_id":"tt4715652","original_title":"Les beaux jours d’Aranjuez","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3216','movie',3216,'{"id":3216,"title":"On the Milky Road","director":"Emir Kusturica","year":2016,"tmdb_id":255160,"imdb_id":"tt2800340","original_title":"Na mlečnom putu","original_language":"sr","alternate_titles":["Na Mlijecnom putu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3217','movie',3217,'{"id":3217,"title":"Miraculous Spiral","director":"Massimo D''Anolfi, Martina Parenti","year":2016,"tmdb_id":408545,"imdb_id":"tt5917932","original_title":"Spira Mirabilis","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3218','movie',3218,'{"id":3218,"title":"The Bad Batch","director":"Ana Lily Amirpour","year":2016,"tmdb_id":316154,"imdb_id":"tt4334266","original_title":"The Bad Batch","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3219','movie',3219,'{"id":3219,"title":"The Distinguished Citizen","director":"Gastón Duprat, Mariano Cohn","year":2016,"tmdb_id":408537,"imdb_id":"tt4562518","original_title":"El ciudadano ilustre","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3220','movie',3220,'{"id":3220,"title":"The Light Between Oceans","director":"Derek Cianfrance","year":2016,"tmdb_id":283552,"imdb_id":"tt2547584","original_title":"The Light Between Oceans","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3221','movie',3221,'{"id":3221,"title":"A Woman''s Life","director":"Stéphane Brizé","year":2016,"tmdb_id":408543,"imdb_id":"tt5078134","original_title":"Une vie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3222','movie',3222,'{"id":3222,"title":"Voyage of Time: Life''s Journey","director":"Terrence Malick","year":2016,"tmdb_id":86822,"imdb_id":"tt1945228","original_title":"Voyage of Time: Life''s Journey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3223','movie',3223,'{"id":3223,"title":"Boys in the Trees","director":"Nicholas Verso","year":2016,"tmdb_id":409164,"imdb_id":"tt3445580","original_title":"Boys in the Trees","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3224','movie',3224,'{"id":3224,"title":"Feather","director":"Roan Johnson","year":2016,"tmdb_id":408540,"imdb_id":"tt5247192","original_title":"Piuma","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3225','movie',3225,'{"id":3225,"title":"Home","director":"Fien Troch","year":2016,"tmdb_id":411037,"imdb_id":"tt4047846","original_title":"Home","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3226','movie',3226,'{"id":3226,"title":"These Days","director":"Giuseppe Piccioni","year":2016,"tmdb_id":408541,"imdb_id":"tt5784568","original_title":"Questi giorni","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3227','movie',3227,'{"id":3227,"title":"Dawson City: Frozen Time","director":"Bill Morrison","year":2016,"tmdb_id":413580,"imdb_id":"tt5215486","original_title":"Dawson City: Frozen Time","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3228','movie',3228,'{"id":3228,"title":"I Was a Dreamer","director":"Michele Vannucci","year":2016,"tmdb_id":412492,"imdb_id":"tt6034028","original_title":"Il Più Grande Sogno","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3229','movie',3229,'{"id":3229,"title":"King of the Belgians","director":"Peter Brosens, Jessica Hope Woodworth","year":2016,"tmdb_id":390357,"imdb_id":"tt4818804","original_title":"King of the Belgians","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3230','movie',3230,'{"id":3230,"title":"Deliver Me","director":"Federica di Giacomo","year":2016,"tmdb_id":412698,"imdb_id":"tt4728946","original_title":"Liberami","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3231','movie',3231,'{"id":3231,"title":"Big Big World","director":"Reha Erdem","year":2016,"tmdb_id":412369,"imdb_id":"tt6034940","original_title":"Koca Dünya","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3232','movie',3232,'{"id":3232,"title":"The Wedding Plan","director":"Rama Burshtein","year":2016,"tmdb_id":412363,"imdb_id":"tt5991206","original_title":"לעבור את הקיר","original_language":"he","alternate_titles":["Laavor et Hakir","Through the Wall"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3233','movie',3233,'{"id":3233,"title":"Kékszakállú","director":"Gastón Solnicki","year":2016,"tmdb_id":411675,"imdb_id":"tt6069442","original_title":"Kékszakállú","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3234','movie',3234,'{"id":3234,"title":"Shambles","director":"Karl Lemieux","year":2016,"tmdb_id":412687,"imdb_id":"tt5672952","original_title":"Maudite Poutine","original_language":"fr","alternate_titles":["Damned Poutine"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3235','movie',3235,'{"id":3235,"title":"Malaria","director":"Parviz Shahbazi","year":2016,"tmdb_id":400509,"imdb_id":"tt6047852","original_title":"مالاریا","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3236','movie',3236,'{"id":3236,"title":"White Sun","director":"Deepak Rauniyar","year":2016,"tmdb_id":412212,"imdb_id":"tt3638644","original_title":"सेतो सूर्य","original_language":"ne","alternate_titles":["Seto Surya"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3237','movie',3237,'{"id":3237,"title":"The Eremites","director":"Ronny Trocker","year":2016,"tmdb_id":413686,"imdb_id":"tt5061582","original_title":"Die Einsiedler","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3238','movie',3238,'{"id":3238,"title":"Human Flow","director":"Ai Weiwei","year":2017,"tmdb_id":468213,"imdb_id":"tt6573444","original_title":"Human Flow","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3239','movie',3239,'{"id":3239,"title":"Suburbicon","director":"George Clooney","year":2017,"tmdb_id":395458,"imdb_id":"tt0491175","original_title":"Suburbicon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3240','movie',3240,'{"id":3240,"title":"Saint George","director":"Marco Martins","year":2016,"tmdb_id":412660,"imdb_id":"tt4895668","original_title":"São Jorge","original_language":"pt","alternate_titles":["Saint Jorge"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3241','movie',3241,'{"id":3241,"title":"Heal the Living","director":"Katell Quillévéré","year":2016,"tmdb_id":383807,"imdb_id":"tt5096536","original_title":"Réparer les vivants","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3242','movie',3242,'{"id":3242,"title":"Lean on Pete","director":"Andrew Haigh","year":2017,"tmdb_id":407890,"imdb_id":"tt5340300","original_title":"Lean on Pete","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3243','movie',3243,'{"id":3243,"title":"The Fury of a Patient Man","director":"Raúl Arévalo","year":2016,"tmdb_id":411638,"imdb_id":"tt4771896","original_title":"Tarde para la ira","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3244','movie',3244,'{"id":3244,"title":"The House by the Sea","director":"Robert Guédiguian","year":2017,"tmdb_id":468207,"imdb_id":"tt7219324","original_title":"La Villa","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3245','movie',3245,'{"id":3245,"title":"Hannah","director":"Andrea Pallaoro","year":2017,"tmdb_id":468287,"imdb_id":"tt4432006","original_title":"Hannah","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3246','movie',3246,'{"id":3246,"title":"Custody","director":"Xavier Legrand","year":2017,"tmdb_id":451657,"imdb_id":"tt6002232","original_title":"Jusqu''à la garde","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3247','movie',3247,'{"id":3247,"title":"The Third Murder","director":"Hirokazu Kore-eda","year":2017,"tmdb_id":434775,"imdb_id":"tt6410564","original_title":"三度目の殺人","original_language":"ja","alternate_titles":["SANDOME NO SATSUJIN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3248','movie',3248,'{"id":3248,"title":"Angels Wear White","director":"Vivian Qu","year":2017,"tmdb_id":468208,"imdb_id":"tt7205208","original_title":"嘉年华","original_language":"zh","alternate_titles":["JIA NIAN HUA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3249','movie',3249,'{"id":3249,"title":"Endangered Species","director":"Gilles Bourdos","year":2017,"tmdb_id":421452,"imdb_id":"tt5539466","original_title":"Espèces menacées","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3250','movie',3250,'{"id":3250,"title":"Sweet Country","director":"Warwick Thornton","year":2017,"tmdb_id":468210,"imdb_id":"tt6958212","original_title":"Sweet Country","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3251','movie',3251,'{"id":3251,"title":"Caniba","director":"Lucien Castaing-Taylor, Véréna Paravel","year":2017,"tmdb_id":471998,"imdb_id":"tt7225942","original_title":"Caniba","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3252','movie',3252,'{"id":3252,"title":"The Blessed","director":"Sofia Djama","year":2017,"tmdb_id":474353,"imdb_id":"tt7336842","original_title":"Les Bienheureux","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3253','movie',3253,'{"id":3253,"title":"The Rape of Recy Taylor","director":"Nancy Buirski","year":2017,"tmdb_id":472648,"imdb_id":"tt6116682","original_title":"The Rape of Recy Taylor","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3254','movie',3254,'{"id":3254,"title":"Ex Libris: The New York Public Library","director":"Frederick Wiseman","year":2017,"tmdb_id":446173,"imdb_id":"tt6209282","original_title":"Ex Libris: The New York Public Library","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3255','movie',3255,'{"id":3255,"title":"Disappearance","director":"Ali Asgari","year":2017,"tmdb_id":472641,"imdb_id":"tt7164066","original_title":"ناپدید شدن","original_language":"fa","alternate_titles":["NAPADID SHODAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3256','movie',3256,'{"id":3256,"title":"Ugly Nasty People","director":"Cosimo Gomez","year":2017,"tmdb_id":468292,"imdb_id":"tt5450524","original_title":"Brutti e cattivi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3257','movie',3257,'{"id":3257,"title":"Oblivion Verses","director":"Alireza Khatami","year":2017,"tmdb_id":471878,"imdb_id":"tt7224496","original_title":"Los versos del olvido","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3258','movie',3258,'{"id":3258,"title":"Nico, 1988","director":"Susanna Nicchiarelli","year":2017,"tmdb_id":473262,"imdb_id":"tt7186092","original_title":"Nico, 1988","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3259','movie',3259,'{"id":3259,"title":"West of Sunshine","director":"Jason Raftopoulos","year":2017,"tmdb_id":472645,"imdb_id":"tt6567012","original_title":"West of Sunshine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3260','movie',3260,'{"id":3260,"title":"Cinderella the Cat","director":"Ivan Cappiello, Marino Guarnieri, Alessandro Rak, Dario Sansone","year":2017,"tmdb_id":471880,"imdb_id":"tt5432712","original_title":"Gatta Cenerentola","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3261','movie',3261,'{"id":3261,"title":"The Cousin","director":"Tzahi Grad","year":2017,"tmdb_id":471879,"imdb_id":"tt7157668","original_title":"הבן-דוד","original_language":"he","alternate_titles":["HA BEN DOD"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3262','movie',3262,'{"id":3262,"title":"The Ark of Disperata","director":"Edoardo Winspeare","year":2017,"tmdb_id":473505,"imdb_id":"tt7279296","original_title":"La Vita In Comune","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3263','movie',3263,'{"id":3263,"title":"Non-Fiction","director":"Olivier Assayas","year":2018,"tmdb_id":471856,"imdb_id":"tt7250056","original_title":"Doubles vies","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3264','movie',3264,'{"id":3264,"title":"The Testament","director":"Amichai Greenberg","year":2017,"tmdb_id":468196,"imdb_id":"tt6856132","original_title":"העדות","original_language":"he","alternate_titles":["HA EDUT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3265','movie',3265,'{"id":3265,"title":"Under the Tree","director":"Hafsteinn Gunnar Sigurðsson","year":2017,"tmdb_id":472640,"imdb_id":"tt6223806","original_title":"Undir trénu","original_language":"is","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3266','movie',3266,'{"id":3266,"title":"Vox Lux","director":"Brady Corbet","year":2018,"tmdb_id":429202,"imdb_id":"tt5960374","original_title":"Vox Lux","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3267','movie',3267,'{"id":3267,"title":"22 July","director":"Paul Greengrass","year":2018,"tmdb_id":474354,"imdb_id":"tt7280898","original_title":"22 July","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3268','movie',3268,'{"id":3268,"title":"Suspiria","director":"Luca Guadagnino","year":2018,"tmdb_id":361292,"imdb_id":"tt1034415","original_title":"Suspiria","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3269','movie',3269,'{"id":3269,"title":"Capri-Revolution","director":"Mario Martone","year":2018,"tmdb_id":537880,"imdb_id":"tt7188002","original_title":"Capri-Revolution","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3270','movie',3270,'{"id":3270,"title":"No Date, No Signature","director":"Vahid Jalilvand","year":2017,"tmdb_id":468205,"imdb_id":"tt6207878","original_title":"بدون تاریخ بدون امضا","original_language":"fa","alternate_titles":["BEDOUNE TARIKH, BEDOUNE EMZA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3271','movie',3271,'{"id":3271,"title":"Peterloo","director":"Mike Leigh","year":2018,"tmdb_id":399440,"imdb_id":"tt4614612","original_title":"Peterloo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3272','movie',3272,'{"id":3272,"title":"Sunset","director":"László Nemes","year":2018,"tmdb_id":399056,"imdb_id":"tt5855772","original_title":"Napszállta","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3273','movie',3273,'{"id":3273,"title":"Close Enemies","director":"David Oelhoffen","year":2018,"tmdb_id":484901,"imdb_id":"tt6527586","original_title":"Frères ennemis","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3274','movie',3274,'{"id":3274,"title":"The Nightingale","director":"Jennifer Kent","year":2018,"tmdb_id":400090,"imdb_id":"tt4068576","original_title":"The Nightingale","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3275','movie',3275,'{"id":3275,"title":"Our Time","director":"Carlos Reygadas","year":2018,"tmdb_id":389218,"imdb_id":"tt5265964","original_title":"Nuestro tiempo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3276','movie',3276,'{"id":3276,"title":"The Accused","director":"Gonzalo Tobal","year":2018,"tmdb_id":519223,"imdb_id":"tt7952000","original_title":"Acusada","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3277','movie',3277,'{"id":3277,"title":"Soni","director":"Ivan Ayr","year":2018,"tmdb_id":539036,"imdb_id":"tt6078866","original_title":"सोनी","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3278','movie',3278,'{"id":3278,"title":"The Mountain","director":"Rick Alverson","year":2018,"tmdb_id":503742,"imdb_id":"tt7950334","original_title":"The Mountain","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3279','movie',3279,'{"id":3279,"title":"What You Gonna Do When the World''s on Fire?","director":"Roberto Minervini","year":2018,"tmdb_id":537488,"imdb_id":"tt8747596","original_title":"What You Gonna Do When the World''s on Fire?","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3280','movie',3280,'{"id":3280,"title":"Killing","director":"Shinya Tsukamoto","year":2018,"tmdb_id":531753,"imdb_id":"tt7117352","original_title":"斬、","original_language":"ja","alternate_titles":["Zan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3281','movie',3281,'{"id":3281,"title":"A Twelve-Year Night","director":"Álvaro Brechner","year":2018,"tmdb_id":514575,"imdb_id":"tt6792282","original_title":"La noche de 12 años","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3282','movie',3282,'{"id":3282,"title":"Unremember","director":"Flávia Castro","year":2018,"tmdb_id":539042,"imdb_id":"tt8900098","original_title":"Deslembro","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3283','movie',3283,'{"id":3283,"title":"On My Skin","director":"Alessio Cremonini","year":2018,"tmdb_id":538362,"imdb_id":"tt7121252","original_title":"Sulla mia pelle","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3284','movie',3284,'{"id":3284,"title":"If Life Gives You Lemons","director":"Ciro D''Emilio","year":2018,"tmdb_id":538368,"imdb_id":"tt8589792","original_title":"Un Giorno all''improvviso","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3285','movie',3285,'{"id":3285,"title":"Manta Ray","director":"Phuttiphong Aroonpheng","year":2018,"tmdb_id":539033,"imdb_id":"tt8837018","original_title":"กระเบนราหู","original_language":"th","alternate_titles":["Kraben Rahu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3286','movie',3286,'{"id":3286,"title":"Charlie Says","director":"Mary Harron","year":2018,"tmdb_id":471859,"imdb_id":"tt1759744","original_title":"Charlie Says","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3287','movie',3287,'{"id":3287,"title":"Memories of My Body","director":"Garin Nugroho","year":2018,"tmdb_id":539050,"imdb_id":"tt8900302","original_title":"Kucumbu Tubuh Indahku","original_language":"id","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3288','movie',3288,'{"id":3288,"title":"The Day I Lost My Shadow","director":"Soudade Kaadan","year":2018,"tmdb_id":539046,"imdb_id":"tt8900142","original_title":"يوم أضعت ظلي","original_language":"ar","alternate_titles":["Yom Adaatou Zouli"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3289','movie',3289,'{"id":3289,"title":"The Armadillo''s Prophecy","director":"Emanuele Scaringi","year":2018,"tmdb_id":537847,"imdb_id":"tt7660450","original_title":"La profezia dell''armadillo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3290','movie',3290,'{"id":3290,"title":"Amanda","director":"Mikhaël Hers","year":2018,"tmdb_id":485166,"imdb_id":"tt7491144","original_title":"Amanda","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3291','movie',3291,'{"id":3291,"title":"Jinpa","director":"Pema Tseden","year":2018,"tmdb_id":537875,"imdb_id":"tt8836292","original_title":"ལག་དམར།","original_language":"bo","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3292','movie',3292,'{"id":3292,"title":"As I Lay Dying","director":"Mostafa Sayari","year":2018,"tmdb_id":539053,"imdb_id":"tt8473532","original_title":"همچنان که میمردم","original_language":"fa","alternate_titles":["Hamchenan ke mimordam"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3293','movie',3293,'{"id":3293,"title":"Tel Aviv on Fire","director":"Sameh Zoabi","year":2018,"tmdb_id":539056,"imdb_id":"tt5791098","original_title":"תל אביב על האש","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3294','movie',3294,'{"id":3294,"title":"The Perfect Candidate","director":"Haifaa al-Mansour","year":2019,"tmdb_id":618214,"imdb_id":"tt6971114","original_title":"المرشحة المثالية","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3295','movie',3295,'{"id":3295,"title":"Stripped","director":"Yaron Shani","year":2018,"tmdb_id":527256,"imdb_id":"tt5368322","original_title":"עירום","original_language":"he","alternate_titles":["Erom"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3296','movie',3296,'{"id":3296,"title":"Wasp Network","director":"Olivier Assayas","year":2019,"tmdb_id":451184,"imdb_id":"tt6760876","original_title":"Wasp Network","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3297','movie',3297,'{"id":3297,"title":"About Endlessness","director":"Roy Andersson","year":2019,"tmdb_id":348672,"imdb_id":"tt6817944","original_title":"Om det oändliga","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3298','movie',3298,'{"id":3298,"title":"The Domain","director":"Tiago Guedes","year":2019,"tmdb_id":617776,"imdb_id":"tt8439860","original_title":"A Herdade","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3299','movie',3299,'{"id":3299,"title":"Guest of Honour","director":"Atom Egoyan","year":2019,"tmdb_id":548170,"imdb_id":"tt9143636","original_title":"Guest of Honour","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3300','movie',3300,'{"id":3300,"title":"Waiting for the Barbarians","director":"Ciro Guerra","year":2019,"tmdb_id":505707,"imdb_id":"tt6149154","original_title":"Waiting for the Barbarians","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3301','movie',3301,'{"id":3301,"title":"The Truth","director":"Hirokazu Kore-eda","year":2019,"tmdb_id":517468,"imdb_id":"tt8323120","original_title":"La Vérité","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3302','movie',3302,'{"id":3302,"title":"Gloria Mundi","director":"Robert Guédiguian","year":2019,"tmdb_id":572521,"imdb_id":"tt9584814","original_title":"Gloria Mundi","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3303','movie',3303,'{"id":3303,"title":"Saturday Fiction","director":"Lou Ye","year":2019,"tmdb_id":497834,"imdb_id":"tt8499638","original_title":"兰心大剧院","original_language":"zh","alternate_titles":["Lan xin da ju yuan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3304','movie',3304,'{"id":3304,"title":"Ad Astra","director":"James Gray","year":2019,"tmdb_id":419704,"imdb_id":"tt2935510","original_title":"Ad Astra","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3305','movie',3305,'{"id":3305,"title":"The River","director":"Emir Baigazin","year":2018,"tmdb_id":539039,"imdb_id":"tt7111818","original_title":"Өзен","original_language":"kk","alternate_titles":["Ozen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3306','movie',3306,'{"id":3306,"title":"Ema","director":"Pablo Larraín","year":2019,"tmdb_id":540709,"imdb_id":"tt8800266","original_title":"Ema","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3307','movie',3307,'{"id":3307,"title":"Mafia Is Not What It Used to Be","director":"Franco Maresco","year":2019,"tmdb_id":618215,"imdb_id":"tt10673846","original_title":"La Mafia non è più quella di una volta","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3308','movie',3308,'{"id":3308,"title":"The Painted Bird","director":"Václav Marhoul","year":2019,"tmdb_id":477428,"imdb_id":"tt1667354","original_title":"Nabarvené ptáče","original_language":"cs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3309','movie',3309,'{"id":3309,"title":"The Laundromat","director":"Steven Soderbergh","year":2019,"tmdb_id":517909,"imdb_id":"tt5865326","original_title":"The Laundromat","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3310','movie',3310,'{"id":3310,"title":"An Officer and a Spy","director":"Roman Polanski","year":2019,"tmdb_id":399121,"imdb_id":"tt2398149","original_title":"J''accuse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3311','movie',3311,'{"id":3311,"title":"Zumiriki","director":"Oskar Alegria","year":2019,"tmdb_id":618222,"imdb_id":"tt10749710","original_title":"Zumiriki","original_language":"eu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3312','movie',3312,'{"id":3312,"title":"Martin Eden","director":"Pietro Marcello","year":2019,"tmdb_id":582873,"imdb_id":"tt4516162","original_title":"Martin Eden","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3313','movie',3313,'{"id":3313,"title":"My Days of Glory","director":"Antoine de Bary","year":2019,"tmdb_id":582911,"imdb_id":"tt9625632","original_title":"Mes jours de gloire","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3314','movie',3314,'{"id":3314,"title":"Nevia","director":"Nunzia De Stefano","year":2019,"tmdb_id":618226,"imdb_id":"tt9625240","original_title":"Nevia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3315','movie',3315,'{"id":3315,"title":"No. 7 Cherry Lane","director":"Yonfan","year":2019,"tmdb_id":616020,"imdb_id":"tt10687168","original_title":"繼園臺七號","original_language":"zh","alternate_titles":["Ji Yuan Tai Qi Hao"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3316','movie',3316,'{"id":3316,"title":"The Mayor of Rione Sanità","director":"Mario Martone","year":2019,"tmdb_id":608315,"imdb_id":"tt9778888","original_title":"Il sindaco del rione Sanità","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3317','movie',3317,'{"id":3317,"title":"Pelican Blood","director":"Katrin Gebbe","year":2019,"tmdb_id":495332,"imdb_id":"tt8074340","original_title":"Pelikanblut","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3318','movie',3318,'{"id":3318,"title":"Moffie","director":"Oliver Hermanus","year":2019,"tmdb_id":618228,"imdb_id":"tt10699362","original_title":"Moffie","original_language":"af","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3319','movie',3319,'{"id":3319,"title":"Hava, Maryam, Ayesha","director":"Sahraa Karimi","year":2019,"tmdb_id":618239,"imdb_id":"tt10713448","original_title":"حوا، مریم، عایشه","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3320','movie',3320,'{"id":3320,"title":"Rialto","director":"Peter Mackie Burns","year":2019,"tmdb_id":618229,"imdb_id":"tt8818842","original_title":"Rialto","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3321','movie',3321,'{"id":3321,"title":"White on White","director":"Théo Court","year":2019,"tmdb_id":618225,"imdb_id":"tt9028522","original_title":"Blanco en blanco","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3322','movie',3322,'{"id":3322,"title":"Giants Being Lonely","director":"Grear Patterson","year":2019,"tmdb_id":618231,"imdb_id":"tt10713402","original_title":"Giants Being Lonely","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3323','movie',3323,'{"id":3323,"title":"The Criminal Man","director":"Dmitry Mamuliya","year":2019,"tmdb_id":604458,"imdb_id":"tt9081512","original_title":"Преступный человек","original_language":"ru","alternate_titles":["Borotmokmedi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3324','movie',3324,'{"id":3324,"title":"Back Home","director":"Jessica Palud","year":2019,"tmdb_id":582922,"imdb_id":"tt9411900","original_title":"Revenir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3325','movie',3325,'{"id":3325,"title":"Chola","director":"Sanal Kumar Sasidharan","year":2019,"tmdb_id":618237,"imdb_id":"tt8517272","original_title":"ചോല","original_language":"ml","alternate_titles":["Shadow of Water"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3326','movie',3326,'{"id":3326,"title":"Verdict","director":"Raymund Ribay Gutierrez","year":2019,"tmdb_id":618233,"imdb_id":"tt10417642","original_title":"Verdict","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3327','movie',3327,'{"id":3327,"title":"Sole","director":"Carlo Sironi","year":2019,"tmdb_id":582907,"imdb_id":"tt9648994","original_title":"Sole","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3328','movie',3328,'{"id":3328,"title":"Balloon","director":"Pema Tseden","year":2019,"tmdb_id":618243,"imdb_id":"tt10703752","original_title":"དབུགས་ལྒང་།","original_language":"bo","alternate_titles":["Qiqiu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3329','movie',3329,'{"id":3329,"title":"New Order","director":"Michel Franco","year":2020,"tmdb_id":575446,"imdb_id":"tt12474056","original_title":"Nuevo orden","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3330','movie',3330,'{"id":3330,"title":"In Between Dying","director":"Hilal Baydarov","year":2020,"tmdb_id":728106,"imdb_id":"tt11268864","original_title":"Səpələnmiş Ölümlər Arasında","original_language":"az","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3331','movie',3331,'{"id":3331,"title":"Laila in Haifa","director":"Amos Gitai","year":2020,"tmdb_id":728107,"imdb_id":"tt12716170","original_title":"לילה בחיפה","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3332','movie',3332,'{"id":3332,"title":"Lovers","director":"Nicole Garcia","year":2020,"tmdb_id":594691,"imdb_id":"tt9800670","original_title":"Amants","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3333','movie',3333,'{"id":3333,"title":"And Tomorrow the Entire World","director":"Julia von Heinz","year":2020,"tmdb_id":728113,"imdb_id":"tt7716120","original_title":"Und morgen die ganze Welt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3334','movie',3334,'{"id":3334,"title":"Mother","director":"Rodrigo Sorogoyen","year":2019,"tmdb_id":594692,"imdb_id":"tt9234450","original_title":"Madre","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3335','movie',3335,'{"id":3335,"title":"Wife of a Spy","director":"Kiyoshi Kurosawa","year":2020,"tmdb_id":688301,"imdb_id":"tt11917942","original_title":"スパイの妻","original_language":"ja","alternate_titles":["Spy no Tsuma"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3336','movie',3336,'{"id":3336,"title":"Sun Children","director":"Majid Majidi","year":2020,"tmdb_id":670343,"imdb_id":"tt11767722","original_title":"خورشید","original_language":"fa","alternate_titles":["Khorshid"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3337','movie',3337,'{"id":3337,"title":"Miss Marx","director":"Susanna Nicchiarelli","year":2020,"tmdb_id":714099,"imdb_id":"tt11009666","original_title":"Miss Marx","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3338','movie',3338,'{"id":3338,"title":"Our Father","director":"Claudio Noce","year":2020,"tmdb_id":669665,"imdb_id":"tt10798072","original_title":"Padrenostro","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3339','movie',3339,'{"id":3339,"title":"The World to Come","director":"Mona Fastvold","year":2020,"tmdb_id":506281,"imdb_id":"tt9738716","original_title":"The World to Come","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3340','movie',3340,'{"id":3340,"title":"The Disciple","director":"Chaitanya Tamhane","year":2020,"tmdb_id":728116,"imdb_id":"tt11423784","original_title":"The Disciple","original_language":"mr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3341','movie',3341,'{"id":3341,"title":"The Macaluso Sisters","director":"Emma Dante","year":2020,"tmdb_id":606865,"imdb_id":"tt12789110","original_title":"Le sorelle Macaluso","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3342','movie',3342,'{"id":3342,"title":"Notturno","director":"Gianfranco Rosi","year":2020,"tmdb_id":539529,"imdb_id":"tt7945450","original_title":"Notturno","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3343','movie',3343,'{"id":3343,"title":"The Predators","director":"Pietro Castellitto","year":2020,"tmdb_id":624484,"imdb_id":"tt10948820","original_title":"I predatori","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3344','movie',3344,'{"id":3344,"title":"Mainstream","director":"Gia Coppola","year":2020,"tmdb_id":557950,"imdb_id":"tt9224288","original_title":"Mainstream","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3345','movie',3345,'{"id":3345,"title":"The Third War","director":"Giovanni Aloi","year":2020,"tmdb_id":728132,"imdb_id":"tt12792532","original_title":"La Troisième Guerre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3346','movie',3346,'{"id":3346,"title":"Genus Pan","director":"Lav Diaz","year":2020,"tmdb_id":728148,"imdb_id":"tt12792586","original_title":"Lahi, Hayop","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3347','movie',3347,'{"id":3347,"title":"Night of the Kings","director":"Philippe Lacôte","year":2020,"tmdb_id":660958,"imdb_id":"tt8132778","original_title":"La Nuit des rois","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3348','movie',3348,'{"id":3348,"title":"The Furnace","director":"Roderick MacKay","year":2020,"tmdb_id":728136,"imdb_id":"tt10964530","original_title":"The Furnace","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3349','movie',3349,'{"id":3349,"title":"The Wasteland","director":"Ahmad Bahrami","year":2020,"tmdb_id":728146,"imdb_id":"tt12792588","original_title":"دشت خاموش","original_language":"fa","alternate_titles":["Dashte Khamoush"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3350','movie',3350,'{"id":3350,"title":"Tragic Jungle","director":"Yulene Olaizola","year":2020,"tmdb_id":618746,"imdb_id":"tt12792598","original_title":"Selva Trágica","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3351','movie',3351,'{"id":3351,"title":"Gaza Mon Amour","director":"Arab Nasser, Tarzan Nasser","year":2020,"tmdb_id":725561,"imdb_id":"tt11692148","original_title":"غزة مُونامور","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3352','movie',3352,'{"id":3352,"title":"War and Peace","director":"Martina Parenti, Massimo D''Anolfi","year":2020,"tmdb_id":728141,"imdb_id":"tt12792584","original_title":"Guerra e pace","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3353','movie',3353,'{"id":3353,"title":"Milestone","director":"Ivan Ayr","year":2020,"tmdb_id":728133,"imdb_id":"tt12779208","original_title":"मील पत्थर","original_language":"hi","alternate_titles":["Meel Patthar"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3354','movie',3354,'{"id":3354,"title":"Nowhere Special","director":"Uberto Pasolini","year":2020,"tmdb_id":728142,"imdb_id":"tt11286640","original_title":"Nowhere Special","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3355','movie',3355,'{"id":3355,"title":"Careless Crime","director":"Shahram Mokri","year":2020,"tmdb_id":644171,"imdb_id":"tt12792594","original_title":"جنایت بی‌دقت","original_language":"fa","alternate_titles":["Jenayat-e bi deghat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3356','movie',3356,'{"id":3356,"title":"The Best is Yet to Come","director":"Wang Jing","year":2020,"tmdb_id":664412,"imdb_id":"tt11564218","original_title":"不止不休","original_language":"zh","alternate_titles":["Bu zhi bu xiu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3357','movie',3357,'{"id":3357,"title":"Yellow Cat","director":"Adilkhan Yerzhanov","year":2020,"tmdb_id":728145,"imdb_id":"tt12792608","original_title":"Сары мысық","original_language":"kk","alternate_titles":["Zheltaya koshka"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3358','movie',3358,'{"id":3358,"title":"Alone in Berlin","director":"Vincent Perez","year":2016,"tmdb_id":334522,"imdb_id":"tt3026488","original_title":"Alone in Berlin","original_language":"en","alternate_titles":["Jeder stirbt für sich allein"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3359','movie',3359,'{"id":3359,"title":"Boris Without Beatrice","director":"Denis Côté","year":2016,"tmdb_id":372985,"imdb_id":"tt4780842","original_title":"Boris sans Béatrice","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3360','movie',3360,'{"id":3360,"title":"Crosscurrent","director":"Yang Chao","year":2015,"tmdb_id":378696,"imdb_id":"tt5470448","original_title":"长江图","original_language":"zh","alternate_titles":["Chang Jiang Tu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3361','movie',3361,'{"id":3361,"title":"Letters from War","director":"Ivo M. Ferreira","year":2016,"tmdb_id":377148,"imdb_id":"tt4704422","original_title":"Cartas da Guerra","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3362','movie',3362,'{"id":3362,"title":"24 Weeks","director":"Anne Zohra Berrached","year":2016,"tmdb_id":378695,"imdb_id":"tt5369484","original_title":"24 Wochen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3363','movie',3363,'{"id":3363,"title":"Listen","director":"Ana Rocha de Sousa","year":2020,"tmdb_id":728143,"imdb_id":"tt6627168","original_title":"Listen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3364','movie',3364,'{"id":3364,"title":"Genius","director":"Michael Grandage","year":2016,"tmdb_id":267192,"imdb_id":"tt1703957","original_title":"Genius","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3365','movie',3365,'{"id":3365,"title":"Apples","director":"Christos Nikou","year":2020,"tmdb_id":652156,"imdb_id":"tt10110614","original_title":"Μήλα","original_language":"el","alternate_titles":["Mila"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3366','movie',3366,'{"id":3366,"title":"A Dragon Arrives!","director":"Mani Haghighi","year":2016,"tmdb_id":377150,"imdb_id":"tt5463378","original_title":"اژدها وارد می‌شود!","original_language":"fa","alternate_titles":["Ejhdeha Vared Mishavad!"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3367','movie',3367,'{"id":3367,"title":"Hedi","director":"Mohamed Ben Attia","year":2016,"tmdb_id":378697,"imdb_id":"tt5011242","original_title":"نحبك هادي","original_language":"ar","alternate_titles":["Inhebbek Hedi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3368','movie',3368,'{"id":3368,"title":"Being 17","director":"André Téchiné","year":2016,"tmdb_id":377154,"imdb_id":"tt4331970","original_title":"Quand on a 17 ans","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3369','movie',3369,'{"id":3369,"title":"Things to Come","director":"Mia Hansen-Løve","year":2016,"tmdb_id":374465,"imdb_id":"tt4120176","original_title":"L''Avenir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3370','movie',3370,'{"id":3370,"title":"A Lullaby to the Sorrowful Mystery","director":"Lav Diaz","year":2016,"tmdb_id":377153,"imdb_id":"tt4842296","original_title":"Hele sa Hiwagang Hapis","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3371','movie',3371,'{"id":3371,"title":"Midnight Special","director":"Jeff Nichols","year":2015,"tmdb_id":245703,"imdb_id":"tt2649554","original_title":"Midnight Special","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3372','movie',3372,'{"id":3372,"title":"The Commune","director":"Thomas Vinterberg","year":2015,"tmdb_id":308409,"imdb_id":"tt3082854","original_title":"Kollektivet","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3373','movie',3373,'{"id":3373,"title":"Zero Days","director":"Alex Gibney","year":2016,"tmdb_id":380808,"imdb_id":"tt5446858","original_title":"Zero Days","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3374','movie',3374,'{"id":3374,"title":"United States of Love","director":"Tomasz Wasilewski","year":2016,"tmdb_id":377158,"imdb_id":"tt5333110","original_title":"Zjednoczone stany miłości","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3375','movie',3375,'{"id":3375,"title":"Ana, My Love","director":"Călin Peter Netzer","year":2016,"tmdb_id":429732,"imdb_id":"tt6125690","original_title":"Ana, mon amour","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3376','movie',3376,'{"id":3376,"title":"Death in Sarajevo","director":"Danis Tanović","year":2016,"tmdb_id":377156,"imdb_id":"tt4466648","original_title":"Smrt u Sarajevu","original_language":"bs","alternate_titles":["Smrt u Sarajevu / Mort à Sarajevo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3377','movie',3377,'{"id":3377,"title":"Beuys","director":"Andres Veiel","year":2017,"tmdb_id":436336,"imdb_id":"tt6340090","original_title":"Beuys","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3378','movie',3378,'{"id":3378,"title":"Colo","director":"Teresa Villaverde","year":2017,"tmdb_id":436339,"imdb_id":"tt5446444","original_title":"Colo","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3379','movie',3379,'{"id":3379,"title":"On the Beach at Night Alone","director":"Hong Sang-soo","year":2017,"tmdb_id":434773,"imdb_id":"tt6412864","original_title":"밤의 해변에서 혼자","original_language":"ko","alternate_titles":["Bamui haebyun-eoseo honja"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3380','movie',3380,'{"id":3380,"title":"Django","director":"Étienne Comar","year":2017,"tmdb_id":436334,"imdb_id":"tt6247936","original_title":"Django","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3381','movie',3381,'{"id":3381,"title":"Bright Nights","director":"Thomas Arslan","year":2017,"tmdb_id":436345,"imdb_id":"tt6425734","original_title":"Helle Nächte","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3382','movie',3382,'{"id":3382,"title":"Joaquim","director":"Marcelo Gomes","year":2017,"tmdb_id":436349,"imdb_id":"tt4895628","original_title":"Joaquim","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3383','movie',3383,'{"id":3383,"title":"Mr. Long","director":"Sabu","year":2017,"tmdb_id":436350,"imdb_id":"tt6509862","original_title":"ミスター・ロン","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3384','movie',3384,'{"id":3384,"title":"Félicité","director":"Alain Gomis","year":2017,"tmdb_id":436340,"imdb_id":"tt5980798","original_title":"Félicité","original_language":"ln","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3385','movie',3385,'{"id":3385,"title":"Return to Montauk","director":"Volker Schlöndorff","year":2017,"tmdb_id":436352,"imdb_id":"tt5247776","original_title":"Rückkehr nach Montauk","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3386','movie',3386,'{"id":3386,"title":"Soy Nero","director":"Rafi Pitts","year":2016,"tmdb_id":378698,"imdb_id":"tt2249039","original_title":"Soy Nero","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3387','movie',3387,'{"id":3387,"title":"Wild Mouse","director":"Josef Hader","year":2017,"tmdb_id":424634,"imdb_id":"tt5376196","original_title":"Wilde Maus","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3388','movie',3388,'{"id":3388,"title":"Have a Nice Day","director":"Liu Jian","year":2017,"tmdb_id":437220,"imdb_id":"tt6451304","original_title":"大世界","original_language":"zh","alternate_titles":["Hao ji le","Einen schönen Tag noch"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3389','movie',3389,'{"id":3389,"title":"3 Days in Quiberon","director":"Emily Atef","year":2018,"tmdb_id":495271,"imdb_id":"tt6463494","original_title":"3 Tage in Quiberon","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3390','movie',3390,'{"id":3390,"title":"The Dinner","director":"Oren Moverman","year":2016,"tmdb_id":401546,"imdb_id":"tt3203620","original_title":"The Dinner","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3391','movie',3391,'{"id":3391,"title":"The Party","director":"Sally Potter","year":2017,"tmdb_id":415401,"imdb_id":"tt5814592","original_title":"The Party","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3392','movie',3392,'{"id":3392,"title":"The Other Side of Hope","director":"Aki Kaurismäki","year":2017,"tmdb_id":429199,"imdb_id":"tt5222918","original_title":"Toivon tuolla puolen","original_language":"fi","alternate_titles":["Die andere Seite der Hoffnung"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3393','movie',3393,'{"id":3393,"title":"Daughter of Mine","director":"Laura Bispuri","year":2018,"tmdb_id":492344,"imdb_id":"tt7765120","original_title":"Figlia mia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3394','movie',3394,'{"id":3394,"title":"In the Aisles","director":"Thomas Stuber","year":2018,"tmdb_id":493483,"imdb_id":"tt6263618","original_title":"In den Gängen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3395','movie',3395,'{"id":3395,"title":"Season of the Devil","director":"Lav Diaz","year":2018,"tmdb_id":497626,"imdb_id":"tt7200370","original_title":"Ang Panahon ng Halimaw","original_language":"tl","alternate_titles":["In Zeiten des Teufels"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3396','movie',3396,'{"id":3396,"title":"The Heiresses","director":"Marcelo Martinessi","year":2018,"tmdb_id":499152,"imdb_id":"tt7875464","original_title":"Las herederas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3397','movie',3397,'{"id":3397,"title":"Pig","director":"Mani Haghighi","year":2018,"tmdb_id":499153,"imdb_id":"tt7429708","original_title":"خوک","original_language":"fa","alternate_titles":["Khook","Schwein"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3398','movie',3398,'{"id":3398,"title":"Eva","director":"Benoît Jacquot","year":2017,"tmdb_id":431135,"imdb_id":"tt6414890","original_title":"Eva","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3399','movie',3399,'{"id":3399,"title":"Touch Me Not","director":"Adina Pintilie","year":2018,"tmdb_id":499155,"imdb_id":"tt4949112","original_title":"Touch Me Not","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3400','movie',3400,'{"id":3400,"title":"The Real Estate","director":"Måns Månsson, Axel Petersén","year":2018,"tmdb_id":497747,"imdb_id":"tt6258766","original_title":"Toppen av ingenting","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3401','movie',3401,'{"id":3401,"title":"My Brother’s Name Is Robert and He Is an Idiot","director":"Philip Gröning","year":2018,"tmdb_id":493656,"imdb_id":"tt3552348","original_title":"Mein Bruder heisst Robert und ist ein Idiot","original_language":"de","alternate_titles":["Mein Bruder heißt Robert und ist ein Idiot"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3402','movie',3402,'{"id":3402,"title":"Mug","director":"Małgorzata Szumowska","year":2018,"tmdb_id":444400,"imdb_id":"tt6415416","original_title":"Twarz","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3403','movie',3403,'{"id":3403,"title":"The Prayer","director":"Cédric Kahn","year":2018,"tmdb_id":499086,"imdb_id":"tt7839456","original_title":"La Prière","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3404','movie',3404,'{"id":3404,"title":"Museo","director":"Alonso Ruizpalacios","year":2018,"tmdb_id":477654,"imdb_id":"tt4958448","original_title":"Museo","original_language":"es","alternate_titles":["Museum"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3405','movie',3405,'{"id":3405,"title":"Transit","director":"Christian Petzold","year":2018,"tmdb_id":471853,"imdb_id":"tt6675244","original_title":"Transit","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3406','movie',3406,'{"id":3406,"title":"The Golden Glove","director":"Fatih Akin","year":2019,"tmdb_id":505706,"imdb_id":"tt7670212","original_title":"Der Goldene Handschuh","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3407','movie',3407,'{"id":3407,"title":"So Long, My Son","director":"Wang Xiaoshuai","year":2019,"tmdb_id":493899,"imdb_id":"tt9581076","original_title":"地久天长","original_language":"zh","alternate_titles":["Di jiu tian chang"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3408','movie',3408,'{"id":3408,"title":"The Ground Beneath My Feet","director":"Marie Kreutzer","year":2019,"tmdb_id":568789,"imdb_id":"tt7902124","original_title":"Der Boden unter den Füßen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3409','movie',3409,'{"id":3409,"title":"Elisa & Marcela","director":"Isabel Coixet","year":2018,"tmdb_id":535356,"imdb_id":"tt6704898","original_title":"Elisa y Marcela","original_language":"es","alternate_titles":["Elisa und Marcela"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3410','movie',3410,'{"id":3410,"title":"God Exists, Her Name Is Petrunya","director":"Teona Strugar Mitevska","year":2019,"tmdb_id":574434,"imdb_id":"tt8054608","original_title":"Господ постои, името ѝ е Петрунија","original_language":"mk","alternate_titles":["Gospod postoi, imeto i’ e Petrunija"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3411','movie',3411,'{"id":3411,"title":"By the Grace of God","director":"François Ozon","year":2019,"tmdb_id":509364,"imdb_id":"tt8095860","original_title":"Grâce à Dieu","original_language":"fr","alternate_titles":["Gelobt sei Gott"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3412','movie',3412,'{"id":3412,"title":"A Tale of Three Sisters","director":"Emin Alper","year":2019,"tmdb_id":539186,"imdb_id":"tt9418878","original_title":"Kız Kardeşler","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3413','movie',3413,'{"id":3413,"title":"Mr. Jones","director":"Agnieszka Holland","year":2019,"tmdb_id":509598,"imdb_id":"tt6828390","original_title":"Mr. Jones","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3414','movie',3414,'{"id":3414,"title":"Piranhas","director":"Claudio Giovannesi","year":2018,"tmdb_id":574436,"imdb_id":"tt8740778","original_title":"La paranza dei bambini","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3415','movie',3415,'{"id":3415,"title":"Egg","director":"Wang Quan''an","year":2019,"tmdb_id":574067,"imdb_id":"tt9581172","original_title":"Öndög","original_language":"mn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3416','movie',3416,'{"id":3416,"title":"Ghost Town Anthology","director":"Denis Côté","year":2018,"tmdb_id":568790,"imdb_id":"tt9068100","original_title":"Répertoire des villes disparues","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3417','movie',3417,'{"id":3417,"title":"I Was at Home, But...","director":"Angela Schanelec","year":2019,"tmdb_id":500895,"imdb_id":"tt7760890","original_title":"Ich war zuhause, aber","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3418','movie',3418,'{"id":3418,"title":"System Crasher","director":"Nora Fingscheidt","year":2019,"tmdb_id":567410,"imdb_id":"tt8535968","original_title":"Systemsprenger","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3419','movie',3419,'{"id":3419,"title":"Utøya: July 22","director":"Erik Poppe","year":2018,"tmdb_id":500006,"imdb_id":"tt7959216","original_title":"Utøya 22. juli","original_language":"no","alternate_titles":["U – July 22"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3420','movie',3420,'{"id":3420,"title":"Synonyms","director":"Nadav Lapid","year":2019,"tmdb_id":501590,"imdb_id":"tt7016254","original_title":"Synonymes","original_language":"fr","alternate_titles":["Synonyme"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3421','movie',3421,'{"id":3421,"title":"The Kindness of Strangers","director":"Lone Scherfig","year":2019,"tmdb_id":520390,"imdb_id":"tt6515910","original_title":"The Kindness of Strangers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3422','movie',3422,'{"id":3422,"title":"Delete History","director":"Gustave Kervern, Benoît Delépine","year":2019,"tmdb_id":659699,"imdb_id":"tt10627352","original_title":"Effacer l''historique","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3423','movie',3423,'{"id":3423,"title":"The Woman Who Ran","director":"Hong Sang-soo","year":2019,"tmdb_id":662401,"imdb_id":"tt11697690","original_title":"도망친 여자","original_language":"ko","alternate_titles":["Domangchin yeoja","Die Frau, die rannte"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3424','movie',3424,'{"id":3424,"title":"Berlin Alexanderplatz","director":"Burhan Qurbani","year":2020,"tmdb_id":575659,"imdb_id":"tt6470924","original_title":"Berlin Alexanderplatz","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3425','movie',3425,'{"id":3425,"title":"First Cow","director":"Kelly Reichardt","year":2019,"tmdb_id":558582,"imdb_id":"tt9231040","original_title":"First Cow","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3426','movie',3426,'{"id":3426,"title":"Out Stealing Horses","director":"Hans Petter Moland","year":2019,"tmdb_id":512603,"imdb_id":"tt7319496","original_title":"Ut og stjæle hester","original_language":"no","alternate_titles":["Pferde stehlen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3427','movie',3427,'{"id":3427,"title":"Irradiated","director":"Rithy Panh","year":2020,"tmdb_id":667936,"imdb_id":"tt11697794","original_title":"Irradiés","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3428','movie',3428,'{"id":3428,"title":"Never Rarely Sometimes Always","director":"Eliza Hittman","year":2020,"tmdb_id":595671,"imdb_id":"tt7772582","original_title":"Never Rarely Sometimes Always","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3429','movie',3429,'{"id":3429,"title":"The Intruder","director":"Natalia Meta","year":2020,"tmdb_id":667757,"imdb_id":"tt11417886","original_title":"El prófugo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3430','movie',3430,'{"id":3430,"title":"My Little Sister","director":"Véronique Reymond, Stéphanie Chuat","year":2020,"tmdb_id":659967,"imdb_id":"tt10117768","original_title":"Schwesterlein","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3431','movie',3431,'{"id":3431,"title":"The Roads Not Taken","director":"Sally Potter","year":2020,"tmdb_id":567714,"imdb_id":"tt9411866","original_title":"The Roads Not Taken","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3432','movie',3432,'{"id":3432,"title":"Siberia","director":"Abel Ferrara","year":2020,"tmdb_id":446574,"imdb_id":"tt4687856","original_title":"Siberia","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3433','movie',3433,'{"id":3433,"title":"The Salt of Tears","director":"Philippe Garrel","year":2019,"tmdb_id":574094,"imdb_id":"tt10132976","original_title":"Le Sel des larmes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3434','movie',3434,'{"id":3434,"title":"Undine","director":"Christian Petzold","year":2020,"tmdb_id":615761,"imdb_id":"tt11617052","original_title":"Undine","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3435','movie',3435,'{"id":3435,"title":"Hidden Away","director":"Giorgio Diritti","year":2019,"tmdb_id":608317,"imdb_id":"tt8478554","original_title":"Volevo nascondermi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3436','movie',3436,'{"id":3436,"title":"All the Dead Ones","director":"Marco Dutra, Caetano Gotardo","year":2020,"tmdb_id":655289,"imdb_id":"tt8845322","original_title":"Todos os Mortos","original_language":"pt","alternate_titles":["All die Toten"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3437','movie',3437,'{"id":3437,"title":"The Last City","director":"Heinz Emigholz","year":2020,"tmdb_id":664573,"imdb_id":"tt11638970","original_title":"Die letzte Stadt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3438','movie',3438,'{"id":3438,"title":"The Metamorphosis of Birds","director":"Catarina Vasconcelos","year":2020,"tmdb_id":664576,"imdb_id":"tt11625100","original_title":"A Metamorfose dos Pássaros","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3439','movie',3439,'{"id":3439,"title":"Los Conductos","director":"Camilo Restrepo","year":2020,"tmdb_id":664572,"imdb_id":"tt11652808","original_title":"Los conductos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3440','movie',3440,'{"id":3440,"title":"Malmkrog","director":"Cristi Puiu","year":2020,"tmdb_id":575448,"imdb_id":"tt10213380","original_title":"Malmkrog","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3441','movie',3441,'{"id":3441,"title":"Naked Animals","director":"Melanie Waelde","year":2020,"tmdb_id":664577,"imdb_id":"tt11162826","original_title":"Nackte Tiere","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3442','movie',3442,'{"id":3442,"title":"The Shepherdess and the Seven Songs","director":"Pushpendra Singh","year":2020,"tmdb_id":664602,"imdb_id":"tt8976992","original_title":"Laila aur satt geet","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3443','movie',3443,'{"id":3443,"title":"Isabella","director":"Matías Piñeiro","year":2020,"tmdb_id":574080,"imdb_id":"tt11638956","original_title":"Isabella","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3444','movie',3444,'{"id":3444,"title":"Shirley","director":"Josephine Decker","year":2020,"tmdb_id":547017,"imdb_id":"tt8430598","original_title":"Shirley","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3445','movie',3445,'{"id":3445,"title":"The Trouble with Being Born","director":"Sandra Wollner","year":2020,"tmdb_id":664589,"imdb_id":"tt9220966","original_title":"The Trouble with Being Born","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3446','movie',3446,'{"id":3446,"title":"Servants","director":"Ivan Ostrochovský","year":2020,"tmdb_id":584249,"imdb_id":"tt8462814","original_title":"Služobníci","original_language":"sk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3447','movie',3447,'{"id":3447,"title":"The Works and Days (of Tayoko Shiojiri in the Shiotani Basin)","director":"C.W. Winter, Anders Edström","year":2020,"tmdb_id":664591,"imdb_id":"tt6434210","original_title":"仕事と日（塩谷の谷間で)","original_language":"ja","alternate_titles":["Werke und Tage (der Tayoko Shiojiri im Shiotanibecken)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3448','movie',3448,'{"id":3448,"title":"Kill It and Leave This Town","director":"Mariusz Wilczyński","year":2019,"tmdb_id":664594,"imdb_id":"tt8387918","original_title":"Zabij to i wyjedź z tego miasta","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3449','movie',3449,'{"id":3449,"title":"Funny Face","director":"Tim Sutton","year":2019,"tmdb_id":664596,"imdb_id":"tt11638942","original_title":"Funny Face","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3450','movie',3450,'{"id":3450,"title":"Orphea","director":"Alexander Kluge, Khavn","year":2020,"tmdb_id":664584,"imdb_id":"tt11771882","original_title":"Orphea","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3451','movie',3451,'{"id":3451,"title":"Amy","director":"Asif Kapadia","year":2015,"tmdb_id":331781,"imdb_id":"tt2870648","original_title":"Amy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3452','movie',3452,'{"id":3452,"title":"Denial","director":"Mick Jackson","year":2016,"tmdb_id":402298,"imdb_id":"tt4645330","original_title":"Denial","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3453','movie',3453,'{"id":3453,"title":"Jane","director":"Brett Morgen","year":2017,"tmdb_id":470819,"imdb_id":"tt7207238","original_title":"Jane","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3454','movie',3454,'{"id":3454,"title":"An Inconvenient Sequel: Truth to Power","director":"Bonni Cohen, Jon Shenk","year":2017,"tmdb_id":432602,"imdb_id":"tt6322922","original_title":"An Inconvenient Sequel: Truth to Power","original_language":"en","alternate_titles":["An Inconvenient Sequel"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3455','movie',3455,'{"id":3455,"title":"McQueen","director":"Ian Bonhôte, Peter Ettedgui","year":2018,"tmdb_id":508003,"imdb_id":"tt6510332","original_title":"McQueen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3456','movie',3456,'{"id":3456,"title":"Sing","director":"Garth Jennings","year":2016,"tmdb_id":335797,"imdb_id":"tt3470600","original_title":"Sing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3457','movie',3457,'{"id":3457,"title":"Neruda","director":"Pablo Larraín","year":2016,"tmdb_id":351454,"imdb_id":"tt4698584","original_title":"Neruda","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3458','movie',3458,'{"id":3458,"title":"Ma'' Rosa","director":"Brillante Ma Mendoza","year":2016,"tmdb_id":392790,"imdb_id":"tt5638094","original_title":"Ma'' Rosa","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3459','movie',3459,'{"id":3459,"title":"Out","director":"György Kristóf","year":2017,"tmdb_id":451990,"imdb_id":"tt4415410","original_title":"Out","original_language":"sk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3460','movie',3460,'{"id":3460,"title":"Yomeddine","director":"Abu Bakr Shawky","year":2018,"tmdb_id":517286,"imdb_id":"tt6846432","original_title":"يوم الدين","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3461','movie',3461,'{"id":3461,"title":"El Angel","director":"Luis Ortega","year":2018,"tmdb_id":507505,"imdb_id":"tt7204348","original_title":"El Ángel","original_language":"es","alternate_titles":["L’ANGE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3462','movie',3462,'{"id":3462,"title":"Sofia","director":"Meryem Benm''Barek-Aloïsi","year":2018,"tmdb_id":517963,"imdb_id":"tt8296592","original_title":"Sofia","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3463','movie',3463,'{"id":3463,"title":"Matthias & Maxime","director":"Xavier Dolan","year":2019,"tmdb_id":519141,"imdb_id":"tt8767908","original_title":"Matthias & Maxime","original_language":"fr","alternate_titles":["MATTHIAS ET MAXIME","MATTHIAS AND MAXIME","Matthias and Maxime"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3464','movie',3464,'{"id":3464,"title":"Homeward","director":"Nariman Aliev","year":2019,"tmdb_id":595930,"imdb_id":"tt9431740","original_title":"Evge","original_language":"uk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3465','movie',3465,'{"id":3465,"title":"Invisible Life","director":"Karim Aïnouz","year":2019,"tmdb_id":548544,"imdb_id":"tt6390668","original_title":"A Vida Invisível","original_language":"pt","alternate_titles":["A VIDA INVISÍVEL DE EURÍDICE GUSMÃO","THE INVISIBLE LIFE OF EURÍDICE GUSMÃO","The Invisible Life of Eurídice Gusmão"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3466','movie',3466,'{"id":3466,"title":"Bitter Money","director":"Wang Bing","year":2016,"tmdb_id":412366,"imdb_id":"tt6028412","original_title":"苦钱","original_language":"zh","alternate_titles":["Ku Qian"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3467','movie',3467,'{"id":3467,"title":"Paradise","director":"Andrei Konchalovsky","year":2016,"tmdb_id":408539,"imdb_id":"tt4551318","original_title":"Рай","original_language":"ru","alternate_titles":["Ray"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3468','movie',3468,'{"id":3468,"title":"A Family","director":"Levi Riso","year":2017,"tmdb_id":460060,"imdb_id":"tt6256056","original_title":"Una Famiglia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3469','movie',3469,'{"id":3469,"title":"Traces of Sin","director":"Kei Ishikawa","year":2016,"tmdb_id":412692,"imdb_id":"tt5560592","original_title":"愚行録","original_language":"ja","alternate_titles":["Gukôroku - Traces of Sin","Gukoroku","Gukoroku - Traces of Sin"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3470','movie',3470,'{"id":3470,"title":"The Night I Swam","director":"Igarashi Kohei, Damien Manivel","year":2017,"tmdb_id":474206,"imdb_id":"tt7336012","original_title":"泳ぎすぎた夜","original_language":"ja","alternate_titles":["LA NUIT OÙ J’AI NAGÉ - OYOGISUGITA YORU","La nuit où j’ai nagé","Oyogisugita yoru"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3471','movie',3471,'{"id":3471,"title":"Fremder Feind","director":"Rick Ostermann","year":2017,"tmdb_id":472647,"imdb_id":"tt7217962","original_title":"Fremder Feind","original_language":"de","alternate_titles":["KRIEG"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3472','movie',3472,'{"id":3472,"title":"Love and Bullets","director":"Antonio Manetti, Marco Manetti","year":2017,"tmdb_id":468302,"imdb_id":"tt7204006","original_title":"Ammore e malavita","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3473','movie',3473,'{"id":3473,"title":"The Announcement","director":"Mahmut Fazıl Coşkun","year":2018,"tmdb_id":538102,"imdb_id":"tt8751804","original_title":"Anons","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3474','movie',3474,'{"id":3474,"title":"Reinventing Marvin","director":"Anne Fontaine","year":2017,"tmdb_id":446178,"imdb_id":"tt5989394","original_title":"Marvin ou la belle éducation","original_language":"fr","alternate_titles":["MARVIN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3475','movie',3475,'{"id":3475,"title":"The Man Who Surprised Everyone","director":"Natalya Merkulova, Alexey Chupov","year":2018,"tmdb_id":537878,"imdb_id":"tt8900172","original_title":"Человек, который удивил всех","original_language":"ru","alternate_titles":["Tchelovek kotorij udivil vseh"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3476','movie',3476,'{"id":3476,"title":"A Son","director":"Mehdi M. Barsaoui","year":2019,"tmdb_id":618224,"imdb_id":"tt10749760","original_title":"بيك نعيش","original_language":"ar","alternate_titles":["Bik eneich - Un fils","Un fils","Bik Eneich: Un fils"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3477','movie',3477,'{"id":3477,"title":"Invisible","director":"Pablo Giorgelli","year":2017,"tmdb_id":473637,"imdb_id":"tt6596630","original_title":"Invisible","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3478','movie',3478,'{"id":3478,"title":"Law of Tehran","director":"Saeed Roustaee","year":2019,"tmdb_id":583794,"imdb_id":"tt9817070","original_title":"متری شش و نیم","original_language":"fa","alternate_titles":["Metri Shesho Nim","Just 6.5","Metri Shesh Va Nim"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3479','movie',3479,'{"id":3479,"title":"Never Gonna Snow Again","director":"Małgorzata Szumowska, Michał Englert","year":2020,"tmdb_id":726151,"imdb_id":"tt9526784","original_title":"Śniegu już nigdy nie będzie","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3480','movie',3480,'{"id":3480,"title":"Atlantis","director":"Valentyn Vasyanovych","year":2019,"tmdb_id":618245,"imdb_id":"tt10749786","original_title":"Атлантида","original_language":"uk","alternate_titles":["Atlantyda"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3481','movie',3481,'{"id":3481,"title":"Spoor","director":"Agnieszka Holland, Kasia Adamik","year":2017,"tmdb_id":432799,"imdb_id":"tt5328350","original_title":"Pokot","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3482','movie',3482,'{"id":3482,"title":"Damsel","director":"David Zellner, Nathan Zellner","year":2017,"tmdb_id":414018,"imdb_id":"tt5881528","original_title":"Damsel","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3483','movie',3483,'{"id":3483,"title":"Burning Casablanca","director":"Ismaël el Iraki","year":2020,"tmdb_id":728135,"imdb_id":"tt12668892","original_title":"الزنقة كونتاكت","original_language":"ar","alternate_titles":["Zanka Contact","Burning Casablanca (Zanka Contact)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3484','movie',3484,'{"id":3484,"title":"Days","director":"Tsai Ming-liang","year":2019,"tmdb_id":662400,"imdb_id":"tt11697820","original_title":"日子","original_language":"zh","alternate_titles":["Rizi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3485','movie',3485,'{"id":3485,"title":"The Truk","director":"Sarah Marx","year":2018,"tmdb_id":539048,"imdb_id":"tt8847018","original_title":"K contraire","original_language":"fr","alternate_titles":["L’Enkas","L''Enkas"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3486','movie',3486,'{"id":3486,"title":"DAU. Natasha","director":"Ilya Khrzhanovsky, Jekaterina Oertel","year":2020,"tmdb_id":667995,"imdb_id":"tt11697832","original_title":"DAU. Natasha","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3487','movie',3487,'{"id":3487,"title":"Bad Tales","director":"Fabio D''Innocenzo, Damiano D''Innocenzo","year":2020,"tmdb_id":614292,"imdb_id":"tt8526370","original_title":"Favolacce","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3488','movie',3488,'{"id":3488,"title":"Boy & the World","director":"Alê Abreu","year":2014,"tmdb_id":223706,"imdb_id":"tt3183630","original_title":"O Menino e o Mundo","original_language":"pt","alternate_titles":["Boy and the World","The Boy and the World"]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:318846','movie:2938') on conflict do nothing;
insert into public.media_provider_links values('movie:294016','movie:2939') on conflict do nothing;
insert into public.media_provider_links values('movie:321697','movie:2940') on conflict do nothing;
insert into public.media_provider_links values('movie:312221','movie:2941') on conflict do nothing;
insert into public.media_provider_links values('movie:336808','movie:2942') on conflict do nothing;
insert into public.media_provider_links values('movie:287628','movie:2943') on conflict do nothing;
insert into public.media_provider_links values('movie:348674','movie:2944') on conflict do nothing;
insert into public.media_provider_links values('movie:317952','movie:2945') on conflict do nothing;
insert into public.media_provider_links values('movie:318044','movie:2946') on conflict do nothing;
insert into public.media_provider_links values('movie:277216','movie:2947') on conflict do nothing;
insert into public.media_provider_links values('movie:267480','movie:2948') on conflict do nothing;
insert into public.media_provider_links values('movie:242828','movie:2949') on conflict do nothing;
insert into public.media_provider_links values('movie:263109','movie:2950') on conflict do nothing;
insert into public.media_provider_links values('movie:355020','movie:2951') on conflict do nothing;
insert into public.media_provider_links values('movie:324786','movie:2952') on conflict do nothing;
insert into public.media_provider_links values('movie:338766','movie:2953') on conflict do nothing;
insert into public.media_provider_links values('movie:393457','movie:2954') on conflict do nothing;
insert into public.media_provider_links values('movie:334543','movie:2955') on conflict do nothing;
insert into public.media_provider_links values('movie:339419','movie:2956') on conflict do nothing;
insert into public.media_provider_links values('movie:315664','movie:2957') on conflict do nothing;
insert into public.media_provider_links values('movie:376866','movie:2958') on conflict do nothing;
insert into public.media_provider_links values('movie:381284','movie:2959') on conflict do nothing;
insert into public.media_provider_links values('movie:335578','movie:2960') on conflict do nothing;
insert into public.media_provider_links values('movie:348678','movie:2961') on conflict do nothing;
insert into public.media_provider_links values('movie:359151','movie:2962') on conflict do nothing;
insert into public.media_provider_links values('movie:342737','movie:2963') on conflict do nothing;
insert into public.media_provider_links values('movie:377462','movie:2964') on conflict do nothing;
insert into public.media_provider_links values('movie:411019','movie:2965') on conflict do nothing;
insert into public.media_provider_links values('movie:377151','movie:2966') on conflict do nothing;
insert into public.media_provider_links values('movie:407806','movie:2967') on conflict do nothing;
insert into public.media_provider_links values('movie:376233','movie:2968') on conflict do nothing;
insert into public.media_provider_links values('movie:313297','movie:2969') on conflict do nothing;
insert into public.media_provider_links values('movie:399404','movie:2970') on conflict do nothing;
insert into public.media_provider_links values('movie:277834','movie:2971') on conflict do nothing;
insert into public.media_provider_links values('movie:393559','movie:2972') on conflict do nothing;
insert into public.media_provider_links values('movie:419430','movie:2973') on conflict do nothing;
insert into public.media_provider_links values('movie:394117','movie:2974') on conflict do nothing;
insert into public.media_provider_links values('movie:446791','movie:2975') on conflict do nothing;
insert into public.media_provider_links values('movie:414425','movie:2976') on conflict do nothing;
insert into public.media_provider_links values('movie:416477','movie:2977') on conflict do nothing;
insert into public.media_provider_links values('movie:371638','movie:2978') on conflict do nothing;
insert into public.media_provider_links values('movie:413362','movie:2979') on conflict do nothing;
insert into public.media_provider_links values('movie:263115','movie:2980') on conflict do nothing;
insert into public.media_provider_links values('movie:396371','movie:2981') on conflict do nothing;
insert into public.media_provider_links values('movie:429191','movie:2982') on conflict do nothing;
insert into public.media_provider_links values('movie:432976','movie:2983') on conflict do nothing;
insert into public.media_provider_links values('movie:411007','movie:2984') on conflict do nothing;
insert into public.media_provider_links values('movie:451995','movie:2985') on conflict do nothing;
insert into public.media_provider_links values('movie:433085','movie:2986') on conflict do nothing;
insert into public.media_provider_links values('movie:468284','movie:2987') on conflict do nothing;
insert into public.media_provider_links values('movie:428612','movie:2988') on conflict do nothing;
insert into public.media_provider_links values('movie:436343','movie:2989') on conflict do nothing;
insert into public.media_provider_links values('movie:295693','movie:2990') on conflict do nothing;
insert into public.media_provider_links values('movie:435129','movie:2991') on conflict do nothing;
insert into public.media_provider_links values('movie:364689','movie:2992') on conflict do nothing;
insert into public.media_provider_links values('movie:424694','movie:2993') on conflict do nothing;
insert into public.media_provider_links values('movie:491472','movie:2994') on conflict do nothing;
insert into public.media_provider_links values('movie:458737','movie:2995') on conflict do nothing;
insert into public.media_provider_links values('movie:537996','movie:2996') on conflict do nothing;
insert into public.media_provider_links values('movie:423612','movie:2997') on conflict do nothing;
insert into public.media_provider_links values('movie:340613','movie:2998') on conflict do nothing;
insert into public.media_provider_links values('movie:515042','movie:2999') on conflict do nothing;
insert into public.media_provider_links values('movie:490785','movie:3000') on conflict do nothing;
insert into public.media_provider_links values('movie:488740','movie:3001') on conflict do nothing;
insert into public.media_provider_links values('movie:465914','movie:3002') on conflict do nothing;
insert into public.media_provider_links values('movie:324857','movie:3003') on conflict do nothing;
insert into public.media_provider_links values('movie:489985','movie:3004') on conflict do nothing;
insert into public.media_provider_links values('movie:493099','movie:3005') on conflict do nothing;
insert into public.media_provider_links values('movie:404368','movie:3006') on conflict do nothing;
insert into public.media_provider_links values('movie:359724','movie:3007') on conflict do nothing;
insert into public.media_provider_links values('movie:331482','movie:3008') on conflict do nothing;
insert into public.media_provider_links values('movie:260513','movie:3009') on conflict do nothing;
insert into public.media_provider_links values('movie:475215','movie:3010') on conflict do nothing;
insert into public.media_provider_links values('movie:506528','movie:3011') on conflict do nothing;
insert into public.media_provider_links values('movie:491283','movie:3012') on conflict do nothing;
insert into public.media_provider_links values('movie:501907','movie:3013') on conflict do nothing;
insert into public.media_provider_links values('movie:525661','movie:3014') on conflict do nothing;
insert into public.media_provider_links values('movie:530915','movie:3015') on conflict do nothing;
insert into public.media_provider_links values('movie:292011','movie:3016') on conflict do nothing;
insert into public.media_provider_links values('movie:471707','movie:3017') on conflict do nothing;
insert into public.media_provider_links values('movie:566213','movie:3018') on conflict do nothing;
insert into public.media_provider_links values('movie:565716','movie:3019') on conflict do nothing;
insert into public.media_provider_links values('movie:566221','movie:3020') on conflict do nothing;
insert into public.media_provider_links values('movie:621729','movie:3021') on conflict do nothing;
insert into public.media_provider_links values('movie:576017','movie:3022') on conflict do nothing;
insert into public.media_provider_links values('movie:458253','movie:3023') on conflict do nothing;
insert into public.media_provider_links values('movie:586940','movie:3024') on conflict do nothing;
insert into public.media_provider_links values('movie:328589','movie:3025') on conflict do nothing;
insert into public.media_provider_links values('movie:265195','movie:3026') on conflict do nothing;
insert into public.media_provider_links values('movie:265228','movie:3027') on conflict do nothing;
insert into public.media_provider_links values('movie:166428','movie:3028') on conflict do nothing;
insert into public.media_provider_links values('movie:338928','movie:3029') on conflict do nothing;
insert into public.media_provider_links values('movie:319076','movie:3030') on conflict do nothing;
insert into public.media_provider_links values('movie:253450','movie:3031') on conflict do nothing;
insert into public.media_provider_links values('movie:340485','movie:3032') on conflict do nothing;
insert into public.media_provider_links values('movie:341366','movie:3033') on conflict do nothing;
insert into public.media_provider_links values('movie:378441','movie:3034') on conflict do nothing;
insert into public.media_provider_links values('movie:346685','movie:3035') on conflict do nothing;
insert into public.media_provider_links values('movie:265189','movie:3036') on conflict do nothing;
insert into public.media_provider_links values('movie:375012','movie:3037') on conflict do nothing;
insert into public.media_provider_links values('movie:376261','movie:3038') on conflict do nothing;
insert into public.media_provider_links values('movie:391698','movie:3039') on conflict do nothing;
insert into public.media_provider_links values('movie:376530','movie:3040') on conflict do nothing;
insert into public.media_provider_links values('movie:127380','movie:3041') on conflict do nothing;
insert into public.media_provider_links values('movie:428493','movie:3042') on conflict do nothing;
insert into public.media_provider_links values('movie:346648','movie:3043') on conflict do nothing;
insert into public.media_provider_links values('movie:290098','movie:3044') on conflict do nothing;
insert into public.media_provider_links values('movie:433247','movie:3045') on conflict do nothing;
insert into public.media_provider_links values('movie:410117','movie:3046') on conflict do nothing;
insert into public.media_provider_links values('movie:428501','movie:3047') on conflict do nothing;
insert into public.media_provider_links values('movie:470918','movie:3048') on conflict do nothing;
insert into public.media_provider_links values('movie:398174','movie:3049') on conflict do nothing;
insert into public.media_provider_links values('movie:394741','movie:3050') on conflict do nothing;
insert into public.media_provider_links values('movie:457136','movie:3051') on conflict do nothing;
insert into public.media_provider_links values('movie:489988','movie:3052') on conflict do nothing;
insert into public.media_provider_links values('movie:576069','movie:3053') on conflict do nothing;
insert into public.media_provider_links values('movie:451915','movie:3054') on conflict do nothing;
insert into public.media_provider_links values('movie:504608','movie:3055') on conflict do nothing;
insert into public.media_provider_links values('movie:482981','movie:3056') on conflict do nothing;
insert into public.media_provider_links values('movie:505600','movie:3057') on conflict do nothing;
insert into public.media_provider_links values('movie:522369','movie:3058') on conflict do nothing;
insert into public.media_provider_links values('movie:536841','movie:3059') on conflict do nothing;
insert into public.media_provider_links values('movie:549559','movie:3060') on conflict do nothing;
insert into public.media_provider_links values('movie:566222','movie:3061') on conflict do nothing;
insert into public.media_provider_links values('movie:227973','movie:3062') on conflict do nothing;
insert into public.media_provider_links values('movie:401469','movie:3063') on conflict do nothing;
insert into public.media_provider_links values('movie:330457','movie:3064') on conflict do nothing;
insert into public.media_provider_links values('movie:319995','movie:3065') on conflict do nothing;
insert into public.media_provider_links values('movie:322488','movie:3066') on conflict do nothing;
insert into public.media_provider_links values('movie:105864','movie:3067') on conflict do nothing;
insert into public.media_provider_links values('movie:321741','movie:3068') on conflict do nothing;
insert into public.media_provider_links values('movie:256924','movie:3069') on conflict do nothing;
insert into public.media_provider_links values('movie:244539','movie:3070') on conflict do nothing;
insert into public.media_provider_links values('movie:309304','movie:3071') on conflict do nothing;
insert into public.media_provider_links values('movie:369557','movie:3072') on conflict do nothing;
insert into public.media_provider_links values('movie:271714','movie:3073') on conflict do nothing;
insert into public.media_provider_links values('movie:393729','movie:3074') on conflict do nothing;
insert into public.media_provider_links values('movie:376290','movie:3075') on conflict do nothing;
insert into public.media_provider_links values('movie:283235','movie:3076') on conflict do nothing;
insert into public.media_provider_links values('movie:291328','movie:3077') on conflict do nothing;
insert into public.media_provider_links values('movie:308266','movie:3078') on conflict do nothing;
insert into public.media_provider_links values('movie:423899','movie:3079') on conflict do nothing;
insert into public.media_provider_links values('movie:376660','movie:3080') on conflict do nothing;
insert into public.media_provider_links values('movie:449749','movie:3081') on conflict do nothing;
insert into public.media_provider_links values('movie:369192','movie:3082') on conflict do nothing;
insert into public.media_provider_links values('movie:339403','movie:3083') on conflict do nothing;
insert into public.media_provider_links values('movie:301337','movie:3084') on conflict do nothing;
insert into public.media_provider_links values('movie:400650','movie:3085') on conflict do nothing;
insert into public.media_provider_links values('movie:515916','movie:3086') on conflict do nothing;
insert into public.media_provider_links values('movie:316029','movie:3087') on conflict do nothing;
insert into public.media_provider_links values('movie:455207','movie:3088') on conflict do nothing;
insert into public.media_provider_links values('movie:472451','movie:3089') on conflict do nothing;
insert into public.media_provider_links values('movie:489925','movie:3090') on conflict do nothing;
insert into public.media_provider_links values('movie:423646','movie:3091') on conflict do nothing;
insert into public.media_provider_links values('movie:400579','movie:3092') on conflict do nothing;
insert into public.media_provider_links values('movie:429203','movie:3093') on conflict do nothing;
insert into public.media_provider_links values('movie:565310','movie:3094') on conflict do nothing;
insert into public.media_provider_links values('movie:528888','movie:3095') on conflict do nothing;
insert into public.media_provider_links values('movie:475132','movie:3096') on conflict do nothing;
insert into public.media_provider_links values('movie:524348','movie:3097') on conflict do nothing;
insert into public.media_provider_links values('movie:523172','movie:3098') on conflict do nothing;
insert into public.media_provider_links values('movie:420818','movie:3099') on conflict do nothing;
insert into public.media_provider_links values('movie:471507','movie:3100') on conflict do nothing;
insert into public.media_provider_links values('movie:377273','movie:3101') on conflict do nothing;
insert into public.media_provider_links values('movie:405177','movie:3102') on conflict do nothing;
insert into public.media_provider_links values('movie:332872','movie:3103') on conflict do nothing;
insert into public.media_provider_links values('movie:338189','movie:3104') on conflict do nothing;
insert into public.media_provider_links values('movie:371865','movie:3105') on conflict do nothing;
insert into public.media_provider_links values('movie:340481','movie:3106') on conflict do nothing;
insert into public.media_provider_links values('movie:376166','movie:3107') on conflict do nothing;
insert into public.media_provider_links values('movie:340676','movie:3108') on conflict do nothing;
insert into public.media_provider_links values('movie:380622','movie:3109') on conflict do nothing;
insert into public.media_provider_links values('movie:374452','movie:3110') on conflict do nothing;
insert into public.media_provider_links values('movie:287904','movie:3111') on conflict do nothing;
insert into public.media_provider_links values('movie:540901','movie:3112') on conflict do nothing;
insert into public.media_provider_links values('movie:301365','movie:3113') on conflict do nothing;
insert into public.media_provider_links values('movie:391709','movie:3114') on conflict do nothing;
insert into public.media_provider_links values('movie:374458','movie:3115') on conflict do nothing;
insert into public.media_provider_links values('movie:392795','movie:3116') on conflict do nothing;
insert into public.media_provider_links values('movie:392794','movie:3117') on conflict do nothing;
insert into public.media_provider_links values('movie:392807','movie:3118') on conflict do nothing;
insert into public.media_provider_links values('movie:392812','movie:3119') on conflict do nothing;
insert into public.media_provider_links values('movie:392809','movie:3120') on conflict do nothing;
insert into public.media_provider_links values('movie:392804','movie:3121') on conflict do nothing;
insert into public.media_provider_links values('movie:392818','movie:3122') on conflict do nothing;
insert into public.media_provider_links values('movie:393184','movie:3123') on conflict do nothing;
insert into public.media_provider_links values('movie:392816','movie:3124') on conflict do nothing;
insert into public.media_provider_links values('movie:392796','movie:3125') on conflict do nothing;
insert into public.media_provider_links values('movie:392791','movie:3126') on conflict do nothing;
insert into public.media_provider_links values('movie:429200','movie:3127') on conflict do nothing;
insert into public.media_provider_links values('movie:392788','movie:3128') on conflict do nothing;
insert into public.media_provider_links values('movie:374671','movie:3129') on conflict do nothing;
insert into public.media_provider_links values('movie:444428','movie:3130') on conflict do nothing;
insert into public.media_provider_links values('movie:399031','movie:3131') on conflict do nothing;
insert into public.media_provider_links values('movie:444395','movie:3132') on conflict do nothing;
insert into public.media_provider_links values('movie:442947','movie:3133') on conflict do nothing;
insert into public.media_provider_links values('movie:451955','movie:3134') on conflict do nothing;
insert into public.media_provider_links values('movie:451945','movie:3135') on conflict do nothing;
insert into public.media_provider_links values('movie:416186','movie:3136') on conflict do nothing;
insert into public.media_provider_links values('movie:445768','movie:3137') on conflict do nothing;
insert into public.media_provider_links values('movie:396398','movie:3138') on conflict do nothing;
insert into public.media_provider_links values('movie:451957','movie:3139') on conflict do nothing;
insert into public.media_provider_links values('movie:452010','movie:3140') on conflict do nothing;
insert into public.media_provider_links values('movie:383709','movie:3141') on conflict do nothing;
insert into public.media_provider_links values('movie:449856','movie:3142') on conflict do nothing;
insert into public.media_provider_links values('movie:452018','movie:3143') on conflict do nothing;
insert into public.media_provider_links values('movie:451618','movie:3144') on conflict do nothing;
insert into public.media_provider_links values('movie:451996','movie:3145') on conflict do nothing;
insert into public.media_provider_links values('movie:451985','movie:3146') on conflict do nothing;
insert into public.media_provider_links values('movie:449754','movie:3147') on conflict do nothing;
insert into public.media_provider_links values('movie:452013','movie:3148') on conflict do nothing;
insert into public.media_provider_links values('movie:444397','movie:3149') on conflict do nothing;
insert into public.media_provider_links values('movie:452016','movie:3150') on conflict do nothing;
insert into public.media_provider_links values('movie:451988','movie:3151') on conflict do nothing;
insert into public.media_provider_links values('movie:440374','movie:3152') on conflict do nothing;
insert into public.media_provider_links values('movie:452000','movie:3153') on conflict do nothing;
insert into public.media_provider_links values('movie:455585','movie:3154') on conflict do nothing;
insert into public.media_provider_links values('movie:395834','movie:3155') on conflict do nothing;
insert into public.media_provider_links values('movie:517731','movie:3156') on conflict do nothing;
insert into public.media_provider_links values('movie:446164','movie:3157') on conflict do nothing;
insert into public.media_provider_links values('movie:418472','movie:3158') on conflict do nothing;
insert into public.media_provider_links values('movie:483184','movie:3159') on conflict do nothing;
insert into public.media_provider_links values('movie:485162','movie:3160') on conflict do nothing;
insert into public.media_provider_links values('movie:414030','movie:3161') on conflict do nothing;
insert into public.media_provider_links values('movie:491584','movie:3162') on conflict do nothing;
insert into public.media_provider_links values('movie:479520','movie:3163') on conflict do nothing;
insert into public.media_provider_links values('movie:441393','movie:3164') on conflict do nothing;
insert into public.media_provider_links values('movie:401545','movie:3165') on conflict do nothing;
insert into public.media_provider_links values('movie:396461','movie:3166') on conflict do nothing;
insert into public.media_provider_links values('movie:517982','movie:3167') on conflict do nothing;
insert into public.media_provider_links values('movie:475930','movie:3168') on conflict do nothing;
insert into public.media_provider_links values('movie:485189','movie:3169') on conflict do nothing;
insert into public.media_provider_links values('movie:519187','movie:3170') on conflict do nothing;
insert into public.media_provider_links values('movie:519241','movie:3171') on conflict do nothing;
insert into public.media_provider_links values('movie:517839','movie:3172') on conflict do nothing;
insert into public.media_provider_links values('movie:486898','movie:3173') on conflict do nothing;
insert into public.media_provider_links values('movie:489170','movie:3174') on conflict do nothing;
insert into public.media_provider_links values('movie:517940','movie:3175') on conflict do nothing;
insert into public.media_provider_links values('movie:488453','movie:3176') on conflict do nothing;
insert into public.media_provider_links values('movie:520273','movie:3177') on conflict do nothing;
insert into public.media_provider_links values('movie:484747','movie:3178') on conflict do nothing;
insert into public.media_provider_links values('movie:517975','movie:3179') on conflict do nothing;
insert into public.media_provider_links values('movie:515049','movie:3180') on conflict do nothing;
insert into public.media_provider_links values('movie:403300','movie:3181') on conflict do nothing;
insert into public.media_provider_links values('movie:517987','movie:3182') on conflict do nothing;
insert into public.media_provider_links values('movie:446159','movie:3183') on conflict do nothing;
insert into public.media_provider_links values('movie:505941','movie:3184') on conflict do nothing;
insert into public.media_provider_links values('movie:575452','movie:3185') on conflict do nothing;
insert into public.media_provider_links values('movie:517978','movie:3186') on conflict do nothing;
insert into public.media_provider_links values('movie:496967','movie:3187') on conflict do nothing;
insert into public.media_provider_links values('movie:539531','movie:3188') on conflict do nothing;
insert into public.media_provider_links values('movie:504585','movie:3189') on conflict do nothing;
insert into public.media_provider_links values('movie:504588','movie:3190') on conflict do nothing;
insert into public.media_provider_links values('movie:519238','movie:3191') on conflict do nothing;
insert into public.media_provider_links values('movie:575428','movie:3192') on conflict do nothing;
insert into public.media_provider_links values('movie:574097','movie:3193') on conflict do nothing;
insert into public.media_provider_links values('movie:559401','movie:3194') on conflict do nothing;
insert into public.media_provider_links values('movie:595940','movie:3195') on conflict do nothing;
insert into public.media_provider_links values('movie:595867','movie:3196') on conflict do nothing;
insert into public.media_provider_links values('movie:540111','movie:3197') on conflict do nothing;
insert into public.media_provider_links values('movie:537655','movie:3198') on conflict do nothing;
insert into public.media_provider_links values('movie:582881','movie:3199') on conflict do nothing;
insert into public.media_provider_links values('movie:592800','movie:3200') on conflict do nothing;
insert into public.media_provider_links values('movie:596041','movie:3201') on conflict do nothing;
insert into public.media_provider_links values('movie:595875','movie:3202') on conflict do nothing;
insert into public.media_provider_links values('movie:598474','movie:3203') on conflict do nothing;
insert into public.media_provider_links values('movie:595924','movie:3204') on conflict do nothing;
insert into public.media_provider_links values('movie:592807','movie:3205') on conflict do nothing;
insert into public.media_provider_links values('movie:572404','movie:3206') on conflict do nothing;
insert into public.media_provider_links values('movie:408542','movie:3207') on conflict do nothing;
insert into public.media_provider_links values('movie:595923','movie:3208') on conflict do nothing;
insert into public.media_provider_links values('movie:595931','movie:3209') on conflict do nothing;
insert into public.media_provider_links values('movie:408544','movie:3210') on conflict do nothing;
insert into public.media_provider_links values('movie:377263','movie:3211') on conflict do nothing;
insert into public.media_provider_links values('movie:324560','movie:3212') on conflict do nothing;
insert into public.media_provider_links values('movie:575561','movie:3213') on conflict do nothing;
insert into public.media_provider_links values('movie:387801','movie:3214') on conflict do nothing;
insert into public.media_provider_links values('movie:351414','movie:3215') on conflict do nothing;
insert into public.media_provider_links values('movie:255160','movie:3216') on conflict do nothing;
insert into public.media_provider_links values('movie:408545','movie:3217') on conflict do nothing;
insert into public.media_provider_links values('movie:316154','movie:3218') on conflict do nothing;
insert into public.media_provider_links values('movie:408537','movie:3219') on conflict do nothing;
insert into public.media_provider_links values('movie:283552','movie:3220') on conflict do nothing;
insert into public.media_provider_links values('movie:408543','movie:3221') on conflict do nothing;
insert into public.media_provider_links values('movie:86822','movie:3222') on conflict do nothing;
insert into public.media_provider_links values('movie:409164','movie:3223') on conflict do nothing;
insert into public.media_provider_links values('movie:408540','movie:3224') on conflict do nothing;
insert into public.media_provider_links values('movie:411037','movie:3225') on conflict do nothing;
insert into public.media_provider_links values('movie:408541','movie:3226') on conflict do nothing;
insert into public.media_provider_links values('movie:413580','movie:3227') on conflict do nothing;
insert into public.media_provider_links values('movie:412492','movie:3228') on conflict do nothing;
insert into public.media_provider_links values('movie:390357','movie:3229') on conflict do nothing;
insert into public.media_provider_links values('movie:412698','movie:3230') on conflict do nothing;
insert into public.media_provider_links values('movie:412369','movie:3231') on conflict do nothing;
insert into public.media_provider_links values('movie:412363','movie:3232') on conflict do nothing;
insert into public.media_provider_links values('movie:411675','movie:3233') on conflict do nothing;
insert into public.media_provider_links values('movie:412687','movie:3234') on conflict do nothing;
insert into public.media_provider_links values('movie:400509','movie:3235') on conflict do nothing;
insert into public.media_provider_links values('movie:412212','movie:3236') on conflict do nothing;
insert into public.media_provider_links values('movie:413686','movie:3237') on conflict do nothing;
insert into public.media_provider_links values('movie:468213','movie:3238') on conflict do nothing;
insert into public.media_provider_links values('movie:395458','movie:3239') on conflict do nothing;
insert into public.media_provider_links values('movie:412660','movie:3240') on conflict do nothing;
insert into public.media_provider_links values('movie:383807','movie:3241') on conflict do nothing;
insert into public.media_provider_links values('movie:407890','movie:3242') on conflict do nothing;
insert into public.media_provider_links values('movie:411638','movie:3243') on conflict do nothing;
insert into public.media_provider_links values('movie:468207','movie:3244') on conflict do nothing;
insert into public.media_provider_links values('movie:468287','movie:3245') on conflict do nothing;
insert into public.media_provider_links values('movie:451657','movie:3246') on conflict do nothing;
insert into public.media_provider_links values('movie:434775','movie:3247') on conflict do nothing;
insert into public.media_provider_links values('movie:468208','movie:3248') on conflict do nothing;
insert into public.media_provider_links values('movie:421452','movie:3249') on conflict do nothing;
insert into public.media_provider_links values('movie:468210','movie:3250') on conflict do nothing;
insert into public.media_provider_links values('movie:471998','movie:3251') on conflict do nothing;
insert into public.media_provider_links values('movie:474353','movie:3252') on conflict do nothing;
insert into public.media_provider_links values('movie:472648','movie:3253') on conflict do nothing;
insert into public.media_provider_links values('movie:446173','movie:3254') on conflict do nothing;
insert into public.media_provider_links values('movie:472641','movie:3255') on conflict do nothing;
insert into public.media_provider_links values('movie:468292','movie:3256') on conflict do nothing;
insert into public.media_provider_links values('movie:471878','movie:3257') on conflict do nothing;
insert into public.media_provider_links values('movie:473262','movie:3258') on conflict do nothing;
insert into public.media_provider_links values('movie:472645','movie:3259') on conflict do nothing;
insert into public.media_provider_links values('movie:471880','movie:3260') on conflict do nothing;
insert into public.media_provider_links values('movie:471879','movie:3261') on conflict do nothing;
insert into public.media_provider_links values('movie:473505','movie:3262') on conflict do nothing;
insert into public.media_provider_links values('movie:471856','movie:3263') on conflict do nothing;
insert into public.media_provider_links values('movie:468196','movie:3264') on conflict do nothing;
insert into public.media_provider_links values('movie:472640','movie:3265') on conflict do nothing;
insert into public.media_provider_links values('movie:429202','movie:3266') on conflict do nothing;
insert into public.media_provider_links values('movie:474354','movie:3267') on conflict do nothing;
insert into public.media_provider_links values('movie:361292','movie:3268') on conflict do nothing;
insert into public.media_provider_links values('movie:537880','movie:3269') on conflict do nothing;
insert into public.media_provider_links values('movie:468205','movie:3270') on conflict do nothing;
insert into public.media_provider_links values('movie:399440','movie:3271') on conflict do nothing;
insert into public.media_provider_links values('movie:399056','movie:3272') on conflict do nothing;
insert into public.media_provider_links values('movie:484901','movie:3273') on conflict do nothing;
insert into public.media_provider_links values('movie:400090','movie:3274') on conflict do nothing;
insert into public.media_provider_links values('movie:389218','movie:3275') on conflict do nothing;
insert into public.media_provider_links values('movie:519223','movie:3276') on conflict do nothing;
insert into public.media_provider_links values('movie:539036','movie:3277') on conflict do nothing;
insert into public.media_provider_links values('movie:503742','movie:3278') on conflict do nothing;
insert into public.media_provider_links values('movie:537488','movie:3279') on conflict do nothing;
insert into public.media_provider_links values('movie:531753','movie:3280') on conflict do nothing;
insert into public.media_provider_links values('movie:514575','movie:3281') on conflict do nothing;
insert into public.media_provider_links values('movie:539042','movie:3282') on conflict do nothing;
insert into public.media_provider_links values('movie:538362','movie:3283') on conflict do nothing;
insert into public.media_provider_links values('movie:538368','movie:3284') on conflict do nothing;
insert into public.media_provider_links values('movie:539033','movie:3285') on conflict do nothing;
insert into public.media_provider_links values('movie:471859','movie:3286') on conflict do nothing;
insert into public.media_provider_links values('movie:539050','movie:3287') on conflict do nothing;
insert into public.media_provider_links values('movie:539046','movie:3288') on conflict do nothing;
insert into public.media_provider_links values('movie:537847','movie:3289') on conflict do nothing;
insert into public.media_provider_links values('movie:485166','movie:3290') on conflict do nothing;
insert into public.media_provider_links values('movie:537875','movie:3291') on conflict do nothing;
insert into public.media_provider_links values('movie:539053','movie:3292') on conflict do nothing;
insert into public.media_provider_links values('movie:539056','movie:3293') on conflict do nothing;
insert into public.media_provider_links values('movie:618214','movie:3294') on conflict do nothing;
insert into public.media_provider_links values('movie:527256','movie:3295') on conflict do nothing;
insert into public.media_provider_links values('movie:451184','movie:3296') on conflict do nothing;
insert into public.media_provider_links values('movie:348672','movie:3297') on conflict do nothing;
insert into public.media_provider_links values('movie:617776','movie:3298') on conflict do nothing;
insert into public.media_provider_links values('movie:548170','movie:3299') on conflict do nothing;
insert into public.media_provider_links values('movie:505707','movie:3300') on conflict do nothing;
insert into public.media_provider_links values('movie:517468','movie:3301') on conflict do nothing;
insert into public.media_provider_links values('movie:572521','movie:3302') on conflict do nothing;
insert into public.media_provider_links values('movie:497834','movie:3303') on conflict do nothing;
insert into public.media_provider_links values('movie:419704','movie:3304') on conflict do nothing;
insert into public.media_provider_links values('movie:539039','movie:3305') on conflict do nothing;
insert into public.media_provider_links values('movie:540709','movie:3306') on conflict do nothing;
insert into public.media_provider_links values('movie:618215','movie:3307') on conflict do nothing;
insert into public.media_provider_links values('movie:477428','movie:3308') on conflict do nothing;
insert into public.media_provider_links values('movie:517909','movie:3309') on conflict do nothing;
insert into public.media_provider_links values('movie:399121','movie:3310') on conflict do nothing;
insert into public.media_provider_links values('movie:618222','movie:3311') on conflict do nothing;
insert into public.media_provider_links values('movie:582873','movie:3312') on conflict do nothing;
insert into public.media_provider_links values('movie:582911','movie:3313') on conflict do nothing;
insert into public.media_provider_links values('movie:618226','movie:3314') on conflict do nothing;
insert into public.media_provider_links values('movie:616020','movie:3315') on conflict do nothing;
insert into public.media_provider_links values('movie:608315','movie:3316') on conflict do nothing;
insert into public.media_provider_links values('movie:495332','movie:3317') on conflict do nothing;
insert into public.media_provider_links values('movie:618228','movie:3318') on conflict do nothing;
insert into public.media_provider_links values('movie:618239','movie:3319') on conflict do nothing;
insert into public.media_provider_links values('movie:618229','movie:3320') on conflict do nothing;
insert into public.media_provider_links values('movie:618225','movie:3321') on conflict do nothing;
insert into public.media_provider_links values('movie:618231','movie:3322') on conflict do nothing;
insert into public.media_provider_links values('movie:604458','movie:3323') on conflict do nothing;
insert into public.media_provider_links values('movie:582922','movie:3324') on conflict do nothing;
insert into public.media_provider_links values('movie:618237','movie:3325') on conflict do nothing;
insert into public.media_provider_links values('movie:618233','movie:3326') on conflict do nothing;
insert into public.media_provider_links values('movie:582907','movie:3327') on conflict do nothing;
insert into public.media_provider_links values('movie:618243','movie:3328') on conflict do nothing;
insert into public.media_provider_links values('movie:575446','movie:3329') on conflict do nothing;
insert into public.media_provider_links values('movie:728106','movie:3330') on conflict do nothing;
insert into public.media_provider_links values('movie:728107','movie:3331') on conflict do nothing;
insert into public.media_provider_links values('movie:594691','movie:3332') on conflict do nothing;
insert into public.media_provider_links values('movie:728113','movie:3333') on conflict do nothing;
insert into public.media_provider_links values('movie:594692','movie:3334') on conflict do nothing;
insert into public.media_provider_links values('movie:688301','movie:3335') on conflict do nothing;
insert into public.media_provider_links values('movie:670343','movie:3336') on conflict do nothing;
insert into public.media_provider_links values('movie:714099','movie:3337') on conflict do nothing;
insert into public.media_provider_links values('movie:669665','movie:3338') on conflict do nothing;
insert into public.media_provider_links values('movie:506281','movie:3339') on conflict do nothing;
insert into public.media_provider_links values('movie:728116','movie:3340') on conflict do nothing;
insert into public.media_provider_links values('movie:606865','movie:3341') on conflict do nothing;
insert into public.media_provider_links values('movie:539529','movie:3342') on conflict do nothing;
insert into public.media_provider_links values('movie:624484','movie:3343') on conflict do nothing;
insert into public.media_provider_links values('movie:557950','movie:3344') on conflict do nothing;
insert into public.media_provider_links values('movie:728132','movie:3345') on conflict do nothing;
insert into public.media_provider_links values('movie:728148','movie:3346') on conflict do nothing;
insert into public.media_provider_links values('movie:660958','movie:3347') on conflict do nothing;
insert into public.media_provider_links values('movie:728136','movie:3348') on conflict do nothing;
insert into public.media_provider_links values('movie:728146','movie:3349') on conflict do nothing;
insert into public.media_provider_links values('movie:618746','movie:3350') on conflict do nothing;
insert into public.media_provider_links values('movie:725561','movie:3351') on conflict do nothing;
insert into public.media_provider_links values('movie:728141','movie:3352') on conflict do nothing;
insert into public.media_provider_links values('movie:728133','movie:3353') on conflict do nothing;
insert into public.media_provider_links values('movie:728142','movie:3354') on conflict do nothing;
insert into public.media_provider_links values('movie:644171','movie:3355') on conflict do nothing;
insert into public.media_provider_links values('movie:664412','movie:3356') on conflict do nothing;
insert into public.media_provider_links values('movie:728145','movie:3357') on conflict do nothing;
insert into public.media_provider_links values('movie:334522','movie:3358') on conflict do nothing;
insert into public.media_provider_links values('movie:372985','movie:3359') on conflict do nothing;
insert into public.media_provider_links values('movie:378696','movie:3360') on conflict do nothing;
insert into public.media_provider_links values('movie:377148','movie:3361') on conflict do nothing;
insert into public.media_provider_links values('movie:378695','movie:3362') on conflict do nothing;
insert into public.media_provider_links values('movie:728143','movie:3363') on conflict do nothing;
insert into public.media_provider_links values('movie:267192','movie:3364') on conflict do nothing;
insert into public.media_provider_links values('movie:652156','movie:3365') on conflict do nothing;
insert into public.media_provider_links values('movie:377150','movie:3366') on conflict do nothing;
insert into public.media_provider_links values('movie:378697','movie:3367') on conflict do nothing;
insert into public.media_provider_links values('movie:377154','movie:3368') on conflict do nothing;
insert into public.media_provider_links values('movie:374465','movie:3369') on conflict do nothing;
insert into public.media_provider_links values('movie:377153','movie:3370') on conflict do nothing;
insert into public.media_provider_links values('movie:245703','movie:3371') on conflict do nothing;
insert into public.media_provider_links values('movie:308409','movie:3372') on conflict do nothing;
insert into public.media_provider_links values('movie:380808','movie:3373') on conflict do nothing;
insert into public.media_provider_links values('movie:377158','movie:3374') on conflict do nothing;
insert into public.media_provider_links values('movie:429732','movie:3375') on conflict do nothing;
insert into public.media_provider_links values('movie:377156','movie:3376') on conflict do nothing;
insert into public.media_provider_links values('movie:436336','movie:3377') on conflict do nothing;
insert into public.media_provider_links values('movie:436339','movie:3378') on conflict do nothing;
insert into public.media_provider_links values('movie:434773','movie:3379') on conflict do nothing;
insert into public.media_provider_links values('movie:436334','movie:3380') on conflict do nothing;
insert into public.media_provider_links values('movie:436345','movie:3381') on conflict do nothing;
insert into public.media_provider_links values('movie:436349','movie:3382') on conflict do nothing;
insert into public.media_provider_links values('movie:436350','movie:3383') on conflict do nothing;
insert into public.media_provider_links values('movie:436340','movie:3384') on conflict do nothing;
insert into public.media_provider_links values('movie:436352','movie:3385') on conflict do nothing;
insert into public.media_provider_links values('movie:378698','movie:3386') on conflict do nothing;
insert into public.media_provider_links values('movie:424634','movie:3387') on conflict do nothing;
insert into public.media_provider_links values('movie:437220','movie:3388') on conflict do nothing;
insert into public.media_provider_links values('movie:495271','movie:3389') on conflict do nothing;
insert into public.media_provider_links values('movie:401546','movie:3390') on conflict do nothing;
insert into public.media_provider_links values('movie:415401','movie:3391') on conflict do nothing;
insert into public.media_provider_links values('movie:429199','movie:3392') on conflict do nothing;
insert into public.media_provider_links values('movie:492344','movie:3393') on conflict do nothing;
insert into public.media_provider_links values('movie:493483','movie:3394') on conflict do nothing;
insert into public.media_provider_links values('movie:497626','movie:3395') on conflict do nothing;
insert into public.media_provider_links values('movie:499152','movie:3396') on conflict do nothing;
insert into public.media_provider_links values('movie:499153','movie:3397') on conflict do nothing;
insert into public.media_provider_links values('movie:431135','movie:3398') on conflict do nothing;
insert into public.media_provider_links values('movie:499155','movie:3399') on conflict do nothing;
insert into public.media_provider_links values('movie:497747','movie:3400') on conflict do nothing;
insert into public.media_provider_links values('movie:493656','movie:3401') on conflict do nothing;
insert into public.media_provider_links values('movie:444400','movie:3402') on conflict do nothing;
insert into public.media_provider_links values('movie:499086','movie:3403') on conflict do nothing;
insert into public.media_provider_links values('movie:477654','movie:3404') on conflict do nothing;
insert into public.media_provider_links values('movie:471853','movie:3405') on conflict do nothing;
insert into public.media_provider_links values('movie:505706','movie:3406') on conflict do nothing;
insert into public.media_provider_links values('movie:493899','movie:3407') on conflict do nothing;
insert into public.media_provider_links values('movie:568789','movie:3408') on conflict do nothing;
insert into public.media_provider_links values('movie:535356','movie:3409') on conflict do nothing;
insert into public.media_provider_links values('movie:574434','movie:3410') on conflict do nothing;
insert into public.media_provider_links values('movie:509364','movie:3411') on conflict do nothing;
insert into public.media_provider_links values('movie:539186','movie:3412') on conflict do nothing;
insert into public.media_provider_links values('movie:509598','movie:3413') on conflict do nothing;
insert into public.media_provider_links values('movie:574436','movie:3414') on conflict do nothing;
insert into public.media_provider_links values('movie:574067','movie:3415') on conflict do nothing;
insert into public.media_provider_links values('movie:568790','movie:3416') on conflict do nothing;
insert into public.media_provider_links values('movie:500895','movie:3417') on conflict do nothing;
insert into public.media_provider_links values('movie:567410','movie:3418') on conflict do nothing;
insert into public.media_provider_links values('movie:500006','movie:3419') on conflict do nothing;
insert into public.media_provider_links values('movie:501590','movie:3420') on conflict do nothing;
insert into public.media_provider_links values('movie:520390','movie:3421') on conflict do nothing;
insert into public.media_provider_links values('movie:659699','movie:3422') on conflict do nothing;
insert into public.media_provider_links values('movie:662401','movie:3423') on conflict do nothing;
insert into public.media_provider_links values('movie:575659','movie:3424') on conflict do nothing;
insert into public.media_provider_links values('movie:558582','movie:3425') on conflict do nothing;
insert into public.media_provider_links values('movie:512603','movie:3426') on conflict do nothing;
insert into public.media_provider_links values('movie:667936','movie:3427') on conflict do nothing;
insert into public.media_provider_links values('movie:595671','movie:3428') on conflict do nothing;
insert into public.media_provider_links values('movie:667757','movie:3429') on conflict do nothing;
insert into public.media_provider_links values('movie:659967','movie:3430') on conflict do nothing;
insert into public.media_provider_links values('movie:567714','movie:3431') on conflict do nothing;
insert into public.media_provider_links values('movie:446574','movie:3432') on conflict do nothing;
insert into public.media_provider_links values('movie:574094','movie:3433') on conflict do nothing;
insert into public.media_provider_links values('movie:615761','movie:3434') on conflict do nothing;
insert into public.media_provider_links values('movie:608317','movie:3435') on conflict do nothing;
insert into public.media_provider_links values('movie:655289','movie:3436') on conflict do nothing;
insert into public.media_provider_links values('movie:664573','movie:3437') on conflict do nothing;
insert into public.media_provider_links values('movie:664576','movie:3438') on conflict do nothing;
insert into public.media_provider_links values('movie:664572','movie:3439') on conflict do nothing;
insert into public.media_provider_links values('movie:575448','movie:3440') on conflict do nothing;
insert into public.media_provider_links values('movie:664577','movie:3441') on conflict do nothing;
insert into public.media_provider_links values('movie:664602','movie:3442') on conflict do nothing;
insert into public.media_provider_links values('movie:574080','movie:3443') on conflict do nothing;
insert into public.media_provider_links values('movie:547017','movie:3444') on conflict do nothing;
insert into public.media_provider_links values('movie:664589','movie:3445') on conflict do nothing;
insert into public.media_provider_links values('movie:584249','movie:3446') on conflict do nothing;
insert into public.media_provider_links values('movie:664591','movie:3447') on conflict do nothing;
insert into public.media_provider_links values('movie:664594','movie:3448') on conflict do nothing;
insert into public.media_provider_links values('movie:664596','movie:3449') on conflict do nothing;
insert into public.media_provider_links values('movie:664584','movie:3450') on conflict do nothing;
insert into public.media_provider_links values('movie:331781','movie:3451') on conflict do nothing;
insert into public.media_provider_links values('movie:402298','movie:3452') on conflict do nothing;
insert into public.media_provider_links values('movie:470819','movie:3453') on conflict do nothing;
insert into public.media_provider_links values('movie:432602','movie:3454') on conflict do nothing;
insert into public.media_provider_links values('movie:508003','movie:3455') on conflict do nothing;
insert into public.media_provider_links values('movie:335797','movie:3456') on conflict do nothing;
insert into public.media_provider_links values('movie:351454','movie:3457') on conflict do nothing;
insert into public.media_provider_links values('movie:392790','movie:3458') on conflict do nothing;
insert into public.media_provider_links values('movie:451990','movie:3459') on conflict do nothing;
insert into public.media_provider_links values('movie:517286','movie:3460') on conflict do nothing;
insert into public.media_provider_links values('movie:507505','movie:3461') on conflict do nothing;
insert into public.media_provider_links values('movie:517963','movie:3462') on conflict do nothing;
insert into public.media_provider_links values('movie:519141','movie:3463') on conflict do nothing;
insert into public.media_provider_links values('movie:595930','movie:3464') on conflict do nothing;
insert into public.media_provider_links values('movie:548544','movie:3465') on conflict do nothing;
insert into public.media_provider_links values('movie:412366','movie:3466') on conflict do nothing;
insert into public.media_provider_links values('movie:408539','movie:3467') on conflict do nothing;
insert into public.media_provider_links values('movie:460060','movie:3468') on conflict do nothing;
insert into public.media_provider_links values('movie:412692','movie:3469') on conflict do nothing;
insert into public.media_provider_links values('movie:474206','movie:3470') on conflict do nothing;
insert into public.media_provider_links values('movie:472647','movie:3471') on conflict do nothing;
insert into public.media_provider_links values('movie:468302','movie:3472') on conflict do nothing;
insert into public.media_provider_links values('movie:538102','movie:3473') on conflict do nothing;
insert into public.media_provider_links values('movie:446178','movie:3474') on conflict do nothing;
insert into public.media_provider_links values('movie:537878','movie:3475') on conflict do nothing;
insert into public.media_provider_links values('movie:618224','movie:3476') on conflict do nothing;
insert into public.media_provider_links values('movie:473637','movie:3477') on conflict do nothing;
insert into public.media_provider_links values('movie:583794','movie:3478') on conflict do nothing;
insert into public.media_provider_links values('movie:726151','movie:3479') on conflict do nothing;
insert into public.media_provider_links values('movie:618245','movie:3480') on conflict do nothing;
insert into public.media_provider_links values('movie:432799','movie:3481') on conflict do nothing;
insert into public.media_provider_links values('movie:414018','movie:3482') on conflict do nothing;
insert into public.media_provider_links values('movie:728135','movie:3483') on conflict do nothing;
insert into public.media_provider_links values('movie:662400','movie:3484') on conflict do nothing;
insert into public.media_provider_links values('movie:539048','movie:3485') on conflict do nothing;
insert into public.media_provider_links values('movie:667995','movie:3486') on conflict do nothing;
insert into public.media_provider_links values('movie:614292','movie:3487') on conflict do nothing;
insert into public.media_provider_links values('movie:223706','movie:3488') on conflict do nothing;
commit;

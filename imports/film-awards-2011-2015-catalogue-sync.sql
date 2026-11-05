-- Film awards 2011-2015: 556 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:39781','movie:3489',39781,'tmdb_id'),
('movie:44115','movie:3490',44115,'tmdb_id'),
('movie:46705','movie:3491',46705,'tmdb_id'),
('movie:27585','movie:3492',27585,'tmdb_id'),
('movie:44629','movie:3493',44629,'tmdb_id'),
('movie:44009','movie:3494',44009,'tmdb_id'),
('movie:44716','movie:3495',44716,'tmdb_id'),
('movie:46738','movie:3496',46738,'tmdb_id'),
('movie:44639','movie:3497',44639,'tmdb_id'),
('movie:39452','movie:3498',39452,'tmdb_id'),
('movie:40663','movie:3499',40663,'tmdb_id'),
('movie:39312','movie:3500',39312,'tmdb_id'),
('movie:46689','movie:3501',46689,'tmdb_id'),
('movie:65057','movie:3502',65057,'tmdb_id'),
('movie:41201','movie:3503',41201,'tmdb_id'),
('movie:57212','movie:3504',57212,'tmdb_id'),
('movie:71688','movie:3505',71688,'tmdb_id'),
('movie:23168','movie:3506',23168,'tmdb_id'),
('movie:75900','movie:3507',75900,'tmdb_id'),
('movie:55347','movie:3508',55347,'tmdb_id'),
('movie:55720','movie:3509',55720,'tmdb_id'),
('movie:50839','movie:3510',50839,'tmdb_id'),
('movie:10316','movie:3511',10316,'tmdb_id'),
('movie:73873','movie:3512',73873,'tmdb_id'),
('movie:82620','movie:3513',82620,'tmdb_id'),
('movie:74310','movie:3514',74310,'tmdb_id'),
('movie:79042','movie:3515',79042,'tmdb_id'),
('movie:83660','movie:3516',83660,'tmdb_id'),
('movie:63310','movie:3517',63310,'tmdb_id'),
('movie:57276','movie:3518',57276,'tmdb_id'),
('movie:52264','movie:3519',52264,'tmdb_id'),
('movie:78480','movie:3520',78480,'tmdb_id'),
('movie:63498','movie:3521',63498,'tmdb_id'),
('movie:72551','movie:3522',72551,'tmdb_id'),
('movie:72976','movie:3523',72976,'tmdb_id'),
('movie:97630','movie:3524',97630,'tmdb_id'),
('movie:82695','movie:3525',82695,'tmdb_id'),
('movie:84175','movie:3526',84175,'tmdb_id'),
('movie:87502','movie:3527',87502,'tmdb_id'),
('movie:80278','movie:3528',80278,'tmdb_id'),
('movie:70667','movie:3529',70667,'tmdb_id'),
('movie:49444','movie:3530',49444,'tmdb_id'),
('movie:88273','movie:3531',88273,'tmdb_id'),
('movie:98205','movie:3532',98205,'tmdb_id'),
('movie:84334','movie:3533',84334,'tmdb_id'),
('movie:113947','movie:3534',113947,'tmdb_id'),
('movie:127918','movie:3535',127918,'tmdb_id'),
('movie:84286','movie:3536',84286,'tmdb_id'),
('movie:84288','movie:3537',84288,'tmdb_id'),
('movie:77174','movie:3538',77174,'tmdb_id'),
('movie:62214','movie:3539',62214,'tmdb_id'),
('movie:152737','movie:3540',152737,'tmdb_id'),
('movie:82690','movie:3541',82690,'tmdb_id'),
('movie:159014','movie:3542',159014,'tmdb_id'),
('movie:109424','movie:3543',109424,'tmdb_id'),
('movie:123678','movie:3544',123678,'tmdb_id'),
('movie:159002','movie:3545',159002,'tmdb_id'),
('movie:159004','movie:3546',159004,'tmdb_id'),
('movie:159037','movie:3547',159037,'tmdb_id'),
('movie:137182','movie:3548',137182,'tmdb_id'),
('movie:273895','movie:3549',273895,'tmdb_id'),
('movie:244786','movie:3550',244786,'tmdb_id'),
('movie:284293','movie:3551',284293,'tmdb_id'),
('movie:186997','movie:3552',186997,'tmdb_id'),
('movie:242582','movie:3553',242582,'tmdb_id'),
('movie:293310','movie:3554',293310,'tmdb_id'),
('movie:169607','movie:3555',169607,'tmdb_id'),
('movie:250761','movie:3556',250761,'tmdb_id'),
('movie:265297','movie:3557',265297,'tmdb_id'),
('movie:263614','movie:3558',263614,'tmdb_id'),
('movie:224141','movie:3559',224141,'tmdb_id'),
('movie:37495','movie:3560',37495,'tmdb_id'),
('movie:46138','movie:3561',46138,'tmdb_id'),
('movie:170687','movie:3562',170687,'tmdb_id'),
('movie:25376','movie:3563',25376,'tmdb_id'),
('movie:41110','movie:3564',41110,'tmdb_id'),
('movie:110416','movie:3565',110416,'tmdb_id'),
('movie:71859','movie:3566',71859,'tmdb_id'),
('movie:46332','movie:3567',46332,'tmdb_id'),
('movie:58496','movie:3568',58496,'tmdb_id'),
('movie:76025','movie:3569',76025,'tmdb_id'),
('movie:63311','movie:3570',63311,'tmdb_id'),
('movie:51447','movie:3571',51447,'tmdb_id'),
('movie:63579','movie:3572',63579,'tmdb_id'),
('movie:74534','movie:3573',74534,'tmdb_id'),
('movie:51052','movie:3574',51052,'tmdb_id'),
('movie:97365','movie:3575',97365,'tmdb_id'),
('movie:112336','movie:3576',112336,'tmdb_id'),
('movie:90125','movie:3577',90125,'tmdb_id'),
('movie:84351','movie:3578',84351,'tmdb_id'),
('movie:151044','movie:3579',151044,'tmdb_id'),
('movie:84287','movie:3580',84287,'tmdb_id'),
('movie:194101','movie:3581',194101,'tmdb_id'),
('movie:119675','movie:3582',119675,'tmdb_id'),
('movie:192136','movie:3583',192136,'tmdb_id'),
('movie:132363','movie:3584',132363,'tmdb_id'),
('movie:129112','movie:3585',129112,'tmdb_id'),
('movie:158091','movie:3586',158091,'tmdb_id'),
('movie:159154','movie:3587',159154,'tmdb_id'),
('movie:158999','movie:3588',158999,'tmdb_id'),
('movie:212063','movie:3589',212063,'tmdb_id'),
('movie:214083','movie:3590',214083,'tmdb_id'),
('movie:116149','movie:3591',116149,'tmdb_id'),
('movie:252178','movie:3592',252178,'tmdb_id'),
('movie:234200','movie:3593',234200,'tmdb_id'),
('movie:97370','movie:3594',97370,'tmdb_id'),
('movie:191714','movie:3595',191714,'tmdb_id'),
('movie:140823','movie:3596',140823,'tmdb_id'),
('movie:137106','movie:3597',137106,'tmdb_id'),
('movie:246400','movie:3598',246400,'tmdb_id'),
('movie:206563','movie:3599',206563,'tmdb_id'),
('movie:42297','movie:3600',42297,'tmdb_id'),
('movie:39514','movie:3601',39514,'tmdb_id'),
('movie:55061','movie:3602',55061,'tmdb_id'),
('movie:25205','movie:3603',25205,'tmdb_id'),
('movie:33909','movie:3604',33909,'tmdb_id'),
('movie:40807','movie:3605',40807,'tmdb_id'),
('movie:17578','movie:3606',17578,'tmdb_id'),
('movie:79777','movie:3607',79777,'tmdb_id'),
('movie:63831','movie:3608',63831,'tmdb_id'),
('movie:46829','movie:3609',46829,'tmdb_id'),
('movie:88794','movie:3610',88794,'tmdb_id'),
('movie:81025','movie:3611',81025,'tmdb_id'),
('movie:48231','movie:3612',48231,'tmdb_id'),
('movie:57157','movie:3613',57157,'tmdb_id'),
('movie:76492','movie:3614',76492,'tmdb_id'),
('movie:81188','movie:3615',81188,'tmdb_id'),
('movie:45324','movie:3616',45324,'tmdb_id'),
('movie:51994','movie:3617',51994,'tmdb_id'),
('movie:60599','movie:3618',60599,'tmdb_id'),
('movie:121826','movie:3619',121826,'tmdb_id'),
('movie:82696','movie:3620',82696,'tmdb_id'),
('movie:87504','movie:3621',87504,'tmdb_id'),
('movie:92591','movie:3622',92591,'tmdb_id'),
('movie:152747','movie:3623',152747,'tmdb_id'),
('movie:130150','movie:3624',130150,'tmdb_id'),
('movie:121986','movie:3625',121986,'tmdb_id'),
('movie:209263','movie:3626',209263,'tmdb_id'),
('movie:239563','movie:3627',239563,'tmdb_id'),
('movie:228326','movie:3628',228326,'tmdb_id'),
('movie:152780','movie:3629',152780,'tmdb_id'),
('movie:270403','movie:3630',270403,'tmdb_id'),
('movie:82390','movie:3631',82390,'tmdb_id'),
('movie:284276','movie:3632',284276,'tmdb_id'),
('movie:241239','movie:3633',241239,'tmdb_id'),
('movie:228194','movie:3634',228194,'tmdb_id'),
('movie:61667','movie:3635',61667,'tmdb_id'),
('movie:157851','movie:3636',157851,'tmdb_id'),
('movie:96811','movie:3637',96811,'tmdb_id'),
('movie:85836','movie:3638',85836,'tmdb_id'),
('movie:84427','movie:3639',84427,'tmdb_id'),
('movie:196867','movie:3640',196867,'tmdb_id'),
('movie:78604','movie:3641',78604,'tmdb_id'),
('movie:78162','movie:3642',78162,'tmdb_id'),
('movie:73532','movie:3643',73532,'tmdb_id'),
('movie:71157','movie:3644',71157,'tmdb_id'),
('movie:64586','movie:3645',64586,'tmdb_id'),
('movie:104858','movie:3646',104858,'tmdb_id'),
('movie:85543','movie:3647',85543,'tmdb_id'),
('movie:77461','movie:3648',77461,'tmdb_id'),
('movie:78182','movie:3649',78182,'tmdb_id'),
('movie:78313','movie:3650',78313,'tmdb_id'),
('movie:53487','movie:3651',53487,'tmdb_id'),
('movie:89456','movie:3652',89456,'tmdb_id'),
('movie:56418','movie:3653',56418,'tmdb_id'),
('movie:84851','movie:3654',84851,'tmdb_id'),
('movie:50837','movie:3655',50837,'tmdb_id'),
('movie:77635','movie:3656',77635,'tmdb_id'),
('movie:75233','movie:3657',75233,'tmdb_id'),
('movie:95448','movie:3658',95448,'tmdb_id'),
('movie:47760','movie:3659',47760,'tmdb_id'),
('movie:85525','movie:3660',85525,'tmdb_id'),
('movie:96551','movie:3661',96551,'tmdb_id'),
('movie:91690','movie:3662',91690,'tmdb_id'),
('movie:83114','movie:3663',83114,'tmdb_id'),
('movie:87408','movie:3664',87408,'tmdb_id'),
('movie:103739','movie:3665',103739,'tmdb_id'),
('movie:49014','movie:3666',49014,'tmdb_id'),
('movie:103753','movie:3667',103753,'tmdb_id'),
('movie:57361','movie:3668',57361,'tmdb_id'),
('movie:78715','movie:3669',78715,'tmdb_id'),
('movie:64689','movie:3670',64689,'tmdb_id'),
('movie:102001','movie:3671',102001,'tmdb_id'),
('movie:82633','movie:3672',82633,'tmdb_id'),
('movie:96001','movie:3673',96001,'tmdb_id'),
('movie:103750','movie:3674',103750,'tmdb_id'),
('movie:103731','movie:3675',103731,'tmdb_id'),
('movie:103689','movie:3676',103689,'tmdb_id'),
('movie:83770','movie:3677',83770,'tmdb_id'),
('movie:103742','movie:3678',103742,'tmdb_id'),
('movie:103747','movie:3679',103747,'tmdb_id'),
('movie:125490','movie:3680',125490,'tmdb_id'),
('movie:103686','movie:3681',103686,'tmdb_id'),
('movie:94904','movie:3682',94904,'tmdb_id'),
('movie:103717','movie:3683',103717,'tmdb_id'),
('movie:58559','movie:3684',58559,'tmdb_id'),
('movie:126315','movie:3685',126315,'tmdb_id'),
('movie:111728','movie:3686',111728,'tmdb_id'),
('movie:97607','movie:3687',97607,'tmdb_id'),
('movie:103758','movie:3688',103758,'tmdb_id'),
('movie:110393','movie:3689',110393,'tmdb_id'),
('movie:126328','movie:3690',126328,'tmdb_id'),
('movie:70793','movie:3691',70793,'tmdb_id'),
('movie:134908','movie:3692',134908,'tmdb_id'),
('movie:126318','movie:3693',126318,'tmdb_id'),
('movie:134673','movie:3694',134673,'tmdb_id'),
('movie:121210','movie:3695',121210,'tmdb_id'),
('movie:126321','movie:3696',126321,'tmdb_id'),
('movie:186929','movie:3697',186929,'tmdb_id'),
('movie:110160','movie:3698',110160,'tmdb_id'),
('movie:160768','movie:3699',160768,'tmdb_id'),
('movie:186970','movie:3700',186970,'tmdb_id'),
('movie:186935','movie:3701',186935,'tmdb_id'),
('movie:184314','movie:3702',184314,'tmdb_id'),
('movie:186971','movie:3703',186971,'tmdb_id'),
('movie:77987','movie:3704',77987,'tmdb_id'),
('movie:152599','movie:3705',152599,'tmdb_id'),
('movie:187022','movie:3706',187022,'tmdb_id'),
('movie:152745','movie:3707',152745,'tmdb_id'),
('movie:177945','movie:3708',177945,'tmdb_id'),
('movie:230152','movie:3709',230152,'tmdb_id'),
('movie:191731','movie:3710',191731,'tmdb_id'),
('movie:186998','movie:3711',186998,'tmdb_id'),
('movie:180900','movie:3712',180900,'tmdb_id'),
('movie:157354','movie:3713',157354,'tmdb_id'),
('movie:186991','movie:3714',186991,'tmdb_id'),
('movie:186992','movie:3715',186992,'tmdb_id'),
('movie:188765','movie:3716',188765,'tmdb_id'),
('movie:186988','movie:3717',186988,'tmdb_id'),
('movie:186976','movie:3718',186976,'tmdb_id'),
('movie:186975','movie:3719',186975,'tmdb_id'),
('movie:186974','movie:3720',186974,'tmdb_id'),
('movie:188761','movie:3721',188761,'tmdb_id'),
('movie:188758','movie:3722',188758,'tmdb_id'),
('movie:197089','movie:3723',197089,'tmdb_id'),
('movie:244761','movie:3724',244761,'tmdb_id'),
('movie:265193','movie:3725',265193,'tmdb_id'),
('movie:265226','movie:3726',265226,'tmdb_id'),
('movie:245700','movie:3727',245700,'tmdb_id'),
('movie:179109','movie:3728',179109,'tmdb_id'),
('movie:246860','movie:3729',246860,'tmdb_id'),
('movie:264656','movie:3730',264656,'tmdb_id'),
('movie:245692','movie:3731',245692,'tmdb_id'),
('movie:266040','movie:3732',266040,'tmdb_id'),
('movie:265349','movie:3733',265349,'tmdb_id'),
('movie:221667','movie:3734',221667,'tmdb_id'),
('movie:266058','movie:3735',266058,'tmdb_id'),
('movie:266044','movie:3736',266044,'tmdb_id'),
('movie:265177','movie:3737',265177,'tmdb_id'),
('movie:266065','movie:3738',266065,'tmdb_id'),
('movie:266031','movie:3739',266031,'tmdb_id'),
('movie:266036','movie:3740',266036,'tmdb_id'),
('movie:266069','movie:3741',266069,'tmdb_id'),
('movie:167810','movie:3742',167810,'tmdb_id'),
('movie:266034','movie:3743',266034,'tmdb_id'),
('movie:270014','movie:3744',270014,'tmdb_id'),
('movie:266038','movie:3745',266038,'tmdb_id'),
('movie:266030','movie:3746',266030,'tmdb_id'),
('movie:266061','movie:3747',266061,'tmdb_id'),
('movie:337104','movie:3748',337104,'tmdb_id'),
('movie:266047','movie:3749',266047,'tmdb_id'),
('movie:267999','movie:3750',267999,'tmdb_id'),
('movie:157827','movie:3751',157827,'tmdb_id'),
('movie:330294','movie:3752',330294,'tmdb_id'),
('movie:329712','movie:3753',329712,'tmdb_id'),
('movie:225728','movie:3754',225728,'tmdb_id'),
('movie:314388','movie:3755',314388,'tmdb_id'),
('movie:291351','movie:3756',291351,'tmdb_id'),
('movie:337107','movie:3757',337107,'tmdb_id'),
('movie:315846','movie:3758',315846,'tmdb_id'),
('movie:319373','movie:3759',319373,'tmdb_id'),
('movie:329805','movie:3760',329805,'tmdb_id'),
('movie:336204','movie:3761',336204,'tmdb_id'),
('movie:334924','movie:3762',334924,'tmdb_id'),
('movie:336222','movie:3763',336222,'tmdb_id'),
('movie:336207','movie:3764',336207,'tmdb_id'),
('movie:334991','movie:3765',334991,'tmdb_id'),
('movie:337114','movie:3766',337114,'tmdb_id'),
('movie:336054','movie:3767',336054,'tmdb_id'),
('movie:336212','movie:3768',336212,'tmdb_id'),
('movie:336201','movie:3769',336201,'tmdb_id'),
('movie:329815','movie:3770',329815,'tmdb_id'),
('movie:336216','movie:3771',336216,'tmdb_id'),
('movie:336203','movie:3772',336203,'tmdb_id'),
('movie:336206','movie:3773',336206,'tmdb_id'),
('movie:336053','movie:3774',336053,'tmdb_id'),
('movie:83384','movie:3775',83384,'tmdb_id'),
('movie:90147','movie:3776',90147,'tmdb_id'),
('movie:336220','movie:3777',336220,'tmdb_id'),
('movie:73567','movie:3778',73567,'tmdb_id'),
('movie:86820','movie:3779',86820,'tmdb_id'),
('movie:78206','movie:3780',78206,'tmdb_id'),
('movie:73869','movie:3781',73869,'tmdb_id'),
('movie:99393','movie:3782',99393,'tmdb_id'),
('movie:102869','movie:3783',102869,'tmdb_id'),
('movie:77952','movie:3784',77952,'tmdb_id'),
('movie:73872','movie:3785',73872,'tmdb_id'),
('movie:72477','movie:3786',72477,'tmdb_id'),
('movie:80440','movie:3787',80440,'tmdb_id'),
('movie:127925','movie:3788',127925,'tmdb_id'),
('movie:267891','movie:3789',267891,'tmdb_id'),
('movie:98344','movie:3790',98344,'tmdb_id'),
('movie:541427','movie:3791',541427,'tmdb_id'),
('movie:92643','movie:3792',92643,'tmdb_id'),
('movie:92642','movie:3793',92642,'tmdb_id'),
('movie:85032','movie:3794',85032,'tmdb_id'),
('movie:202872','movie:3795',202872,'tmdb_id'),
('movie:99513','movie:3796',99513,'tmdb_id'),
('movie:120820','movie:3797',120820,'tmdb_id'),
('movie:120272','movie:3798',120272,'tmdb_id'),
('movie:141522','movie:3799',141522,'tmdb_id'),
('movie:77322','movie:3800',77322,'tmdb_id'),
('movie:111103','movie:3801',111103,'tmdb_id'),
('movie:9364','movie:3802',9364,'tmdb_id'),
('movie:84479','movie:3803',84479,'tmdb_id'),
('movie:111114','movie:3804',111114,'tmdb_id'),
('movie:97762','movie:3805',97762,'tmdb_id'),
('movie:85533','movie:3806',85533,'tmdb_id'),
('movie:111106','movie:3807',111106,'tmdb_id'),
('movie:122089','movie:3808',122089,'tmdb_id'),
('movie:136017','movie:3809',136017,'tmdb_id'),
('movie:121789','movie:3810',121789,'tmdb_id'),
('movie:120460','movie:3811',120460,'tmdb_id'),
('movie:110447','movie:3812',110447,'tmdb_id'),
('movie:807071','movie:3813',807071,'tmdb_id'),
('movie:123366','movie:3814',123366,'tmdb_id'),
('movie:121828','movie:3815',121828,'tmdb_id'),
('movie:123380','movie:3816',123380,'tmdb_id'),
('movie:129734','movie:3817',129734,'tmdb_id'),
('movie:122088','movie:3818',122088,'tmdb_id'),
('movie:109099','movie:3819',109099,'tmdb_id'),
('movie:123377','movie:3820',123377,'tmdb_id'),
('movie:122081','movie:3821',122081,'tmdb_id'),
('movie:122083','movie:3822',122083,'tmdb_id'),
('movie:60281','movie:3823',60281,'tmdb_id'),
('movie:129119','movie:3824',129119,'tmdb_id'),
('movie:220493','movie:3825',220493,'tmdb_id'),
('movie:128508','movie:3826',128508,'tmdb_id'),
('movie:127242','movie:3827',127242,'tmdb_id'),
('movie:123375','movie:3828',123375,'tmdb_id'),
('movie:122198','movie:3829',122198,'tmdb_id'),
('movie:127907','movie:3830',127907,'tmdb_id'),
('movie:137079','movie:3831',137079,'tmdb_id'),
('movie:127846','movie:3832',127846,'tmdb_id'),
('movie:129115','movie:3833',129115,'tmdb_id'),
('movie:141810','movie:3834',141810,'tmdb_id'),
('movie:129113','movie:3835',129113,'tmdb_id'),
('movie:129116','movie:3836',129116,'tmdb_id'),
('movie:128106','movie:3837',128106,'tmdb_id'),
('movie:144752','movie:3838',144752,'tmdb_id'),
('movie:127236','movie:3839',127236,'tmdb_id'),
('movie:129121','movie:3840',129121,'tmdb_id'),
('movie:216789','movie:3841',216789,'tmdb_id'),
('movie:210228','movie:3842',210228,'tmdb_id'),
('movie:216783','movie:3843',216783,'tmdb_id'),
('movie:157847','movie:3844',157847,'tmdb_id'),
('movie:129117','movie:3845',129117,'tmdb_id'),
('movie:216457','movie:3846',216457,'tmdb_id'),
('movie:121998','movie:3847',121998,'tmdb_id'),
('movie:152736','movie:3848',152736,'tmdb_id'),
('movie:209262','movie:3849',209262,'tmdb_id'),
('movie:209413','movie:3850',209413,'tmdb_id'),
('movie:209840','movie:3851',209840,'tmdb_id'),
('movie:209799','movie:3852',209799,'tmdb_id'),
('movie:216790','movie:3853',216790,'tmdb_id'),
('movie:184352','movie:3854',184352,'tmdb_id'),
('movie:211052','movie:3855',211052,'tmdb_id'),
('movie:216788','movie:3856',216788,'tmdb_id'),
('movie:238925','movie:3857',238925,'tmdb_id'),
('movie:210054','movie:3858',210054,'tmdb_id'),
('movie:219055','movie:3859',219055,'tmdb_id'),
('movie:157823','movie:3860',157823,'tmdb_id'),
('movie:217479','movie:3861',217479,'tmdb_id'),
('movie:217475','movie:3862',217475,'tmdb_id'),
('movie:217471','movie:3863',217471,'tmdb_id'),
('movie:192132','movie:3864',192132,'tmdb_id'),
('movie:217464','movie:3865',217464,'tmdb_id'),
('movie:211067','movie:3866',211067,'tmdb_id'),
('movie:214210','movie:3867',214210,'tmdb_id'),
('movie:191294','movie:3868',191294,'tmdb_id'),
('movie:210052','movie:3869',210052,'tmdb_id'),
('movie:283701','movie:3870',283701,'tmdb_id'),
('movie:216156','movie:3871',216156,'tmdb_id'),
('movie:283707','movie:3872',283707,'tmdb_id'),
('movie:283711','movie:3873',283711,'tmdb_id'),
('movie:253626','movie:3874',253626,'tmdb_id'),
('movie:283607','movie:3875',283607,'tmdb_id'),
('movie:283698','movie:3876',283698,'tmdb_id'),
('movie:283704','movie:3877',283704,'tmdb_id'),
('movie:217474','movie:3878',217474,'tmdb_id'),
('movie:263118','movie:3879',263118,'tmdb_id'),
('movie:254905','movie:3880',254905,'tmdb_id'),
('movie:283700','movie:3881',283700,'tmdb_id'),
('movie:283710','movie:3882',283710,'tmdb_id'),
('movie:283699','movie:3883',283699,'tmdb_id'),
('movie:283706','movie:3884',283706,'tmdb_id'),
('movie:290643','movie:3885',290643,'tmdb_id'),
('movie:290815','movie:3886',290815,'tmdb_id'),
('movie:240745','movie:3887',240745,'tmdb_id'),
('movie:284303','movie:3888',284303,'tmdb_id'),
('movie:289891','movie:3889',289891,'tmdb_id'),
('movie:234197','movie:3890',234197,'tmdb_id'),
('movie:250230','movie:3891',250230,'tmdb_id'),
('movie:291878','movie:3892',291878,'tmdb_id'),
('movie:283708','movie:3893',283708,'tmdb_id'),
('movie:289223','movie:3894',289223,'tmdb_id'),
('movie:286306','movie:3895',286306,'tmdb_id'),
('movie:289483','movie:3896',289483,'tmdb_id'),
('movie:284135','movie:3897',284135,'tmdb_id'),
('movie:289174','movie:3898',289174,'tmdb_id'),
('movie:324807','movie:3899',324807,'tmdb_id'),
('movie:314371','movie:3900',314371,'tmdb_id'),
('movie:179150','movie:3901',179150,'tmdb_id'),
('movie:352196','movie:3902',352196,'tmdb_id'),
('movie:296449','movie:3903',296449,'tmdb_id'),
('movie:352197','movie:3904',352197,'tmdb_id'),
('movie:352161','movie:3905',352161,'tmdb_id'),
('movie:301875','movie:3906',301875,'tmdb_id'),
('movie:329809','movie:3907',329809,'tmdb_id'),
('movie:352157','movie:3908',352157,'tmdb_id'),
('movie:352200','movie:3909',352200,'tmdb_id'),
('movie:330348','movie:3910',330348,'tmdb_id'),
('movie:302528','movie:3911',302528,'tmdb_id'),
('movie:352162','movie:3912',352162,'tmdb_id'),
('movie:358909','movie:3913',358909,'tmdb_id'),
('movie:352202','movie:3914',352202,'tmdb_id'),
('movie:359666','movie:3915',359666,'tmdb_id'),
('movie:352159','movie:3916',352159,'tmdb_id'),
('movie:358983','movie:3917',358983,'tmdb_id'),
('movie:359257','movie:3918',359257,'tmdb_id'),
('movie:359545','movie:3919',359545,'tmdb_id'),
('movie:358759','movie:3920',358759,'tmdb_id'),
('movie:296523','movie:3921',296523,'tmdb_id'),
('movie:359429','movie:3922',359429,'tmdb_id'),
('movie:314029','movie:3923',314029,'tmdb_id'),
('movie:359256','movie:3924',359256,'tmdb_id'),
('movie:358403','movie:3925',358403,'tmdb_id'),
('movie:314400','movie:3926',314400,'tmdb_id'),
('movie:359770','movie:3927',359770,'tmdb_id'),
('movie:330982','movie:3928',330982,'tmdb_id'),
('movie:358808','movie:3929',358808,'tmdb_id'),
('movie:101173','movie:3930',101173,'tmdb_id'),
('movie:296865','movie:3931',296865,'tmdb_id'),
('movie:79000','movie:3932',79000,'tmdb_id'),
('movie:81401','movie:3933',81401,'tmdb_id'),
('movie:128593','movie:3934',128593,'tmdb_id'),
('movie:70768','movie:3935',70768,'tmdb_id'),
('movie:82624','movie:3936',82624,'tmdb_id'),
('movie:65847','movie:3937',65847,'tmdb_id'),
('movie:69352','movie:3938',69352,'tmdb_id'),
('movie:54662','movie:3939',54662,'tmdb_id'),
('movie:73132','movie:3940',73132,'tmdb_id'),
('movie:155382','movie:3941',155382,'tmdb_id'),
('movie:150065','movie:3942',150065,'tmdb_id'),
('movie:359373','movie:3943',359373,'tmdb_id'),
('movie:139162','movie:3944',139162,'tmdb_id'),
('movie:88284','movie:3945',88284,'tmdb_id'),
('movie:139159','movie:3946',139159,'tmdb_id'),
('movie:110381','movie:3947',110381,'tmdb_id'),
('movie:94671','movie:3948',94671,'tmdb_id'),
('movie:120194','movie:3949',120194,'tmdb_id'),
('movie:102000','movie:3950',102000,'tmdb_id'),
('movie:99579','movie:3951',99579,'tmdb_id'),
('movie:107073','movie:3952',107073,'tmdb_id'),
('movie:137179','movie:3953',137179,'tmdb_id'),
('movie:138254','movie:3954',138254,'tmdb_id'),
('movie:88249','movie:3955',88249,'tmdb_id'),
('movie:93858','movie:3956',93858,'tmdb_id'),
('movie:110428','movie:3957',110428,'tmdb_id'),
('movie:124529','movie:3958',124529,'tmdb_id'),
('movie:159942','movie:3959',159942,'tmdb_id'),
('movie:160068','movie:3960',160068,'tmdb_id'),
('movie:159344','movie:3961',159344,'tmdb_id'),
('movie:160124','movie:3962',160124,'tmdb_id'),
('movie:160045','movie:3963',160045,'tmdb_id'),
('movie:159967','movie:3964',159967,'tmdb_id'),
('movie:113148','movie:3965',113148,'tmdb_id'),
('movie:133694','movie:3966',133694,'tmdb_id'),
('movie:109421','movie:3967',109421,'tmdb_id'),
('movie:150897','movie:3968',150897,'tmdb_id'),
('movie:160156','movie:3969',160156,'tmdb_id'),
('movie:160160','movie:3970',160160,'tmdb_id'),
('movie:157690','movie:3971',157690,'tmdb_id'),
('movie:255824','movie:3972',255824,'tmdb_id'),
('movie:251321','movie:3973',251321,'tmdb_id'),
('movie:248934','movie:3974',248934,'tmdb_id'),
('movie:254323','movie:3975',254323,'tmdb_id'),
('movie:254679','movie:3976',254679,'tmdb_id'),
('movie:252822','movie:3977',252822,'tmdb_id'),
('movie:160118','movie:3978',160118,'tmdb_id'),
('movie:255482','movie:3979',255482,'tmdb_id'),
('movie:254772','movie:3980',254772,'tmdb_id'),
('movie:160075','movie:3981',160075,'tmdb_id'),
('movie:254719','movie:3982',254719,'tmdb_id'),
('movie:256021','movie:3983',256021,'tmdb_id'),
('movie:227975','movie:3984',227975,'tmdb_id'),
('movie:256108','movie:3985',256108,'tmdb_id'),
('movie:319993','movie:3986',319993,'tmdb_id'),
('movie:311301','movie:3987',311301,'tmdb_id'),
('movie:320000','movie:3988',320000,'tmdb_id'),
('movie:254166','movie:3989',254166,'tmdb_id'),
('movie:238811','movie:3990',238811,'tmdb_id'),
('movie:256106','movie:3991',256106,'tmdb_id'),
('movie:320003','movie:3992',320003,'tmdb_id'),
('movie:320004','movie:3993',320004,'tmdb_id'),
('movie:157843','movie:3994',157843,'tmdb_id'),
('movie:319994','movie:3995',319994,'tmdb_id'),
('movie:121869','movie:3996',121869,'tmdb_id'),
('movie:312408','movie:3997',312408,'tmdb_id'),
('movie:320001','movie:3998',320001,'tmdb_id'),
('movie:319996','movie:3999',319996,'tmdb_id'),
('movie:319998','movie:4000',319998,'tmdb_id'),
('movie:73686','movie:4001',73686,'tmdb_id'),
('movie:47904','movie:4002',47904,'tmdb_id'),
('movie:110398','movie:4003',110398,'tmdb_id'),
('movie:84170','movie:4004',84170,'tmdb_id'),
('movie:187028','movie:4005',187028,'tmdb_id'),
('movie:96724','movie:4006',96724,'tmdb_id'),
('movie:47557','movie:4007',47557,'tmdb_id'),
('movie:103870','movie:4008',103870,'tmdb_id'),
('movie:133878','movie:4009',133878,'tmdb_id'),
('movie:103875','movie:4010',103875,'tmdb_id'),
('movie:266062','movie:4011',266062,'tmdb_id'),
('movie:337115','movie:4012',337115,'tmdb_id'),
('movie:162980','movie:4013',162980,'tmdb_id'),
('movie:157829','movie:4014',157829,'tmdb_id'),
('movie:334876','movie:4015',334876,'tmdb_id'),
('movie:81857','movie:4016',81857,'tmdb_id'),
('movie:98631','movie:4017',98631,'tmdb_id'),
('movie:172489','movie:4018',172489,'tmdb_id'),
('movie:120822','movie:4019',120822,'tmdb_id'),
('movie:298721','movie:4020',298721,'tmdb_id'),
('movie:182829','movie:4021',182829,'tmdb_id'),
('movie:217478','movie:4022',217478,'tmdb_id'),
('movie:134350','movie:4023',134350,'tmdb_id'),
('movie:128230','movie:4024',128230,'tmdb_id'),
('movie:243884','movie:4025',243884,'tmdb_id'),
('movie:203819','movie:4026',203819,'tmdb_id'),
('movie:285024','movie:4027',285024,'tmdb_id'),
('movie:290158','movie:4028',290158,'tmdb_id'),
('movie:292359','movie:4029',292359,'tmdb_id'),
('movie:352156','movie:4030',352156,'tmdb_id'),
('movie:352199','movie:4031',352199,'tmdb_id'),
('movie:372226','movie:4032',372226,'tmdb_id'),
('movie:358899','movie:4033',358899,'tmdb_id'),
('movie:64744','movie:4034',64744,'tmdb_id'),
('movie:98203','movie:4035',98203,'tmdb_id'),
('movie:110383','movie:4036',110383,'tmdb_id'),
('movie:160171','movie:4037',160171,'tmdb_id'),
('movie:160165','movie:4038',160165,'tmdb_id'),
('movie:41602','movie:4039',41602,'tmdb_id'),
('movie:124103','movie:4040',124103,'tmdb_id'),
('movie:319999','movie:4041',319999,'tmdb_id'),
('movie:91186','movie:4042',91186,'tmdb_id'),
('movie:122080','movie:4043',122080,'tmdb_id'),
('tv:43107','movie:4044',43107,'tmdb_tv_id')
) as expected(provider_key,work_key,tmdb_id,metadata_field)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>expected.metadata_field)::bigint is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3489','movie',3489,'{"id":3489,"title":"The Kids Are All Right","director":"Lisa Cholodenko","year":2010,"tmdb_id":39781,"imdb_id":"tt0842926","original_title":"The Kids Are All Right","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3490','movie',3490,'{"id":3490,"title":"127 Hours","director":"Danny Boyle","year":2010,"tmdb_id":44115,"imdb_id":"tt1542344","original_title":"127 Hours","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3491','movie',3491,'{"id":3491,"title":"Blue Valentine","director":"Derek Cianfrance","year":2010,"tmdb_id":46705,"imdb_id":"tt1120985","original_title":"Blue Valentine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3492','movie',3492,'{"id":3492,"title":"Rabbit Hole","director":"John Cameron Mitchell","year":2010,"tmdb_id":27585,"imdb_id":"tt0935075","original_title":"Rabbit Hole","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3493','movie',3493,'{"id":3493,"title":"Animal Kingdom","director":"David Michôd","year":2010,"tmdb_id":44629,"imdb_id":"tt1313092","original_title":"Animal Kingdom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3494','movie',3494,'{"id":3494,"title":"Another Year","director":"Mike Leigh","year":2010,"tmdb_id":44009,"imdb_id":"tt1431181","original_title":"Another Year","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3495','movie',3495,'{"id":3495,"title":"In a Better World","director":"Susanne Bier","year":2010,"tmdb_id":44716,"imdb_id":"tt1340107","original_title":"Hævnen","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3496','movie',3496,'{"id":3496,"title":"Incendies","director":"Denis Villeneuve","year":2010,"tmdb_id":46738,"imdb_id":"tt1255953","original_title":"Incendies","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3497','movie',3497,'{"id":3497,"title":"Inside Job","director":"Charles Ferguson","year":2010,"tmdb_id":44639,"imdb_id":"tt1645089","original_title":"Inside Job","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3498','movie',3498,'{"id":3498,"title":"Exit Through the Gift Shop","director":"Banksy","year":2010,"tmdb_id":39452,"imdb_id":"tt1587707","original_title":"Exit Through the Gift Shop","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3499','movie',3499,'{"id":3499,"title":"Gasland","director":"Josh Fox","year":2010,"tmdb_id":40663,"imdb_id":"tt1558250","original_title":"Gasland","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3500','movie',3500,'{"id":3500,"title":"Restrepo","director":"Tim Hetherington, Sebastian Junger","year":2010,"tmdb_id":39312,"imdb_id":"tt1559549","original_title":"Restrepo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3501','movie',3501,'{"id":3501,"title":"Waste Land","director":"Lucy Walker","year":2010,"tmdb_id":46689,"imdb_id":"tt1268204","original_title":"Waste Land","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3502','movie',3502,'{"id":3502,"title":"The Descendants","director":"Alexander Payne","year":2011,"tmdb_id":65057,"imdb_id":"tt1033575","original_title":"The Descendants","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3503','movie',3503,'{"id":3503,"title":"The Illusionist","director":"Sylvain Chomet","year":2010,"tmdb_id":41201,"imdb_id":"tt0775489","original_title":"L''Illusionniste","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3504','movie',3504,'{"id":3504,"title":"War Horse","director":"Steven Spielberg","year":2011,"tmdb_id":57212,"imdb_id":"tt1568911","original_title":"War Horse","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3505','movie',3505,'{"id":3505,"title":"The Iron Lady","director":"Phyllida Lloyd","year":2011,"tmdb_id":71688,"imdb_id":"tt1007029","original_title":"The Iron Lady","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3506','movie',3506,'{"id":3506,"title":"The Town","director":"Ben Affleck","year":2010,"tmdb_id":23168,"imdb_id":"tt0840361","original_title":"The Town","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3507','movie',3507,'{"id":3507,"title":"My Week with Marilyn","director":"Simon Curtis","year":2011,"tmdb_id":75900,"imdb_id":"tt1655420","original_title":"My Week with Marilyn","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3508','movie',3508,'{"id":3508,"title":"Beginners","director":"Mike Mills","year":2011,"tmdb_id":55347,"imdb_id":"tt1532503","original_title":"Beginners","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3509','movie',3509,'{"id":3509,"title":"A Better Life","director":"Chris Weitz","year":2011,"tmdb_id":55720,"imdb_id":"tt1554091","original_title":"A Better Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3510','movie',3510,'{"id":3510,"title":"Margin Call","director":"J.C. Chandor","year":2011,"tmdb_id":50839,"imdb_id":"tt1615147","original_title":"Margin Call","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3511','movie',3511,'{"id":3511,"title":"The Ides of March","director":"George Clooney","year":2011,"tmdb_id":10316,"imdb_id":"tt1124035","original_title":"The Ides of March","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3512','movie',3512,'{"id":3512,"title":"Albert Nobbs","director":"Rodrigo García","year":2011,"tmdb_id":73873,"imdb_id":"tt1602098","original_title":"Albert Nobbs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3513','movie',3513,'{"id":3513,"title":"Undefeated","director":"Daniel Lindsay, T.J. Martin","year":2011,"tmdb_id":82620,"imdb_id":"tt1860355","original_title":"Undefeated","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3514','movie',3514,'{"id":3514,"title":"Hell and Back Again","director":"Danfung Dennis","year":2011,"tmdb_id":74310,"imdb_id":"tt1748043","original_title":"Hell and Back Again","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3515','movie',3515,'{"id":3515,"title":"If a Tree Falls: A Story of the Earth Liberation Front","director":"Marshall Curry, Sam Cullman","year":2011,"tmdb_id":79042,"imdb_id":"tt1787725","original_title":"If a Tree Falls: A Story of the Earth Liberation Front","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3516','movie',3516,'{"id":3516,"title":"Paradise Lost 3: Purgatory","director":"Joe Berlinger, Bruce Sinofsky","year":2012,"tmdb_id":83660,"imdb_id":"tt2028530","original_title":"Paradise Lost 3: Purgatory","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3517','movie',3517,'{"id":3517,"title":"Bullhead","director":"Michaël R. Roskam","year":2011,"tmdb_id":63310,"imdb_id":"tt1821593","original_title":"Rundskop","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3518','movie',3518,'{"id":3518,"title":"Pina","director":"Wim Wenders","year":2011,"tmdb_id":57276,"imdb_id":"tt1440266","original_title":"Pina","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3519','movie',3519,'{"id":3519,"title":"A Cat in Paris","director":"Jean-Loup Felicioli, Alain Gagnol","year":2010,"tmdb_id":52264,"imdb_id":"tt1673702","original_title":"Une vie de chat","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3520','movie',3520,'{"id":3520,"title":"Monsieur Lazhar","director":"Philippe Falardeau","year":2011,"tmdb_id":78480,"imdb_id":"tt2011971","original_title":"Monsieur Lazhar","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3521','movie',3521,'{"id":3521,"title":"Chico & Rita","director":"Fernando Trueba, Tono Errando, Javier Mariscal","year":2010,"tmdb_id":63498,"imdb_id":"tt1235830","original_title":"Chico & Rita","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3522','movie',3522,'{"id":3522,"title":"Footnote","director":"Joseph Cedar","year":2011,"tmdb_id":72551,"imdb_id":"tt1445520","original_title":"הערת שוליים","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3523','movie',3523,'{"id":3523,"title":"Lincoln","director":"Steven Spielberg","year":2012,"tmdb_id":72976,"imdb_id":"tt0443272","original_title":"Lincoln","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3524','movie',3524,'{"id":3524,"title":"Zero Dark Thirty","director":"Kathryn Bigelow","year":2012,"tmdb_id":97630,"imdb_id":"tt1790885","original_title":"Zero Dark Thirty","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3525','movie',3525,'{"id":3525,"title":"Les Misérables","director":"Tom Hooper","year":2012,"tmdb_id":82695,"imdb_id":"tt1707386","original_title":"Les Misérables","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3526','movie',3526,'{"id":3526,"title":"Beasts of the Southern Wild","director":"Benh Zeitlin","year":2012,"tmdb_id":84175,"imdb_id":"tt2125435","original_title":"Beasts of the Southern Wild","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3527','movie',3527,'{"id":3527,"title":"Flight","director":"Robert Zemeckis","year":2012,"tmdb_id":87502,"imdb_id":"tt1907668","original_title":"Flight","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3528','movie',3528,'{"id":3528,"title":"The Impossible","director":"J. A. Bayona","year":2012,"tmdb_id":80278,"imdb_id":"tt1649419","original_title":"The Impossible","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3529','movie',3529,'{"id":3529,"title":"Kon-Tiki","director":"Joachim Rønning, Espen Sandberg","year":2012,"tmdb_id":70667,"imdb_id":"tt1613750","original_title":"Kon-Tiki","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3530','movie',3530,'{"id":3530,"title":"Kung Fu Panda 2","director":"Jennifer Yuh Nelson","year":2011,"tmdb_id":49444,"imdb_id":"tt1302011","original_title":"Kung Fu Panda 2","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3531','movie',3531,'{"id":3531,"title":"A Royal Affair","director":"Nikolaj Arcel","year":2012,"tmdb_id":88273,"imdb_id":"tt1276419","original_title":"En kongelig affære","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3532','movie',3532,'{"id":3532,"title":"War Witch","director":"Kim Nguyen","year":2012,"tmdb_id":98205,"imdb_id":"tt1820488","original_title":"Rebelle","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3533','movie',3533,'{"id":3533,"title":"Searching for Sugar Man","director":"Malik Bendjelloul","year":2012,"tmdb_id":84334,"imdb_id":"tt2125608","original_title":"Searching for Sugar Man","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3534','movie',3534,'{"id":3534,"title":"The Sessions","director":"Ben Lewin","year":2012,"tmdb_id":113947,"imdb_id":"tt1866249","original_title":"The Sessions","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3535','movie',3535,'{"id":3535,"title":"The Gatekeepers","director":"Dror Moreh","year":2012,"tmdb_id":127918,"imdb_id":"tt2309788","original_title":"שומרי הסף","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3536','movie',3536,'{"id":3536,"title":"How to Survive a Plague","director":"David France","year":2012,"tmdb_id":84286,"imdb_id":"tt2124803","original_title":"How to Survive a Plague","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3537','movie',3537,'{"id":3537,"title":"The Invisible War","director":"Kirby Dick","year":2012,"tmdb_id":84288,"imdb_id":"tt2120152","original_title":"The Invisible War","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3538','movie',3538,'{"id":3538,"title":"ParaNorman","director":"Sam Fell, Chris Butler","year":2012,"tmdb_id":77174,"imdb_id":"tt1623288","original_title":"ParaNorman","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3539','movie',3539,'{"id":3539,"title":"Frankenweenie","director":"Tim Burton","year":2012,"tmdb_id":62214,"imdb_id":"tt1142977","original_title":"Frankenweenie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3540','movie',3540,'{"id":3540,"title":"August: Osage County","director":"John Wells","year":2013,"tmdb_id":152737,"imdb_id":"tt1322269","original_title":"August: Osage County","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3541','movie',3541,'{"id":3541,"title":"Wreck-It Ralph","director":"Rich Moore","year":2012,"tmdb_id":82690,"imdb_id":"tt1772341","original_title":"Wreck-It Ralph","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3542','movie',3542,'{"id":3542,"title":"20 Feet from Stardom","director":"Morgan Neville","year":2013,"tmdb_id":159014,"imdb_id":"tt2396566","original_title":"20 Feet from Stardom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3543','movie',3543,'{"id":3543,"title":"Captain Phillips","director":"Paul Greengrass","year":2013,"tmdb_id":109424,"imdb_id":"tt1535109","original_title":"Captain Phillips","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3544','movie',3544,'{"id":3544,"title":"The Act of Killing","director":"Joshua Oppenheimer","year":2012,"tmdb_id":123678,"imdb_id":"tt2375605","original_title":"The Act of Killing","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3545','movie',3545,'{"id":3545,"title":"Cutie and the Boxer","director":"Zachary Heinzerling","year":2013,"tmdb_id":159002,"imdb_id":"tt2355540","original_title":"Cutie and the Boxer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3546','movie',3546,'{"id":3546,"title":"Dirty Wars","director":"Rick Rowley","year":2013,"tmdb_id":159004,"imdb_id":"tt2532528","original_title":"Dirty Wars","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3547','movie',3547,'{"id":3547,"title":"The Square","director":"Jehane Noujaim","year":2013,"tmdb_id":159037,"imdb_id":"tt2486682","original_title":"The Square","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3548','movie',3548,'{"id":3548,"title":"The Broken Circle Breakdown","director":"Felix van Groeningen","year":2012,"tmdb_id":137182,"imdb_id":"tt2024519","original_title":"The Broken Circle Breakdown","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3549','movie',3549,'{"id":3549,"title":"Selma","director":"Ava DuVernay","year":2014,"tmdb_id":273895,"imdb_id":"tt1020072","original_title":"Selma","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3550','movie',3550,'{"id":3550,"title":"Whiplash","director":"Damien Chazelle","year":2014,"tmdb_id":244786,"imdb_id":"tt2582802","original_title":"Whiplash","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3551','movie',3551,'{"id":3551,"title":"Still Alice","director":"Richard Glatzer, Wash Westmoreland","year":2014,"tmdb_id":284293,"imdb_id":"tt3316960","original_title":"Still Alice","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3552','movie',3552,'{"id":3552,"title":"The Missing Picture","director":"Rithy Panh","year":2013,"tmdb_id":186997,"imdb_id":"tt2852470","original_title":"L''image manquante","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3553','movie',3553,'{"id":3553,"title":"Nightcrawler","director":"Dan Gilroy","year":2014,"tmdb_id":242582,"imdb_id":"tt2872718","original_title":"Nightcrawler","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3554','movie',3554,'{"id":3554,"title":"Citizenfour","director":"Laura Poitras","year":2014,"tmdb_id":293310,"imdb_id":"tt4044364","original_title":"Citizenfour","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3555','movie',3555,'{"id":3555,"title":"Finding Vivian Maier","director":"John Maloof, Charlie Siskel","year":2014,"tmdb_id":169607,"imdb_id":"tt2714900","original_title":"Finding Vivian Maier","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3556','movie',3556,'{"id":3556,"title":"Last Days in Vietnam","director":"Rory Kennedy","year":2014,"tmdb_id":250761,"imdb_id":"tt3279124","original_title":"Last Days in Vietnam","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3557','movie',3557,'{"id":3557,"title":"The Salt of the Earth","director":"Juliano Ribeiro Salgado, Wim Wenders","year":2014,"tmdb_id":265297,"imdb_id":"tt3674140","original_title":"Le sel de la terre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3558','movie',3558,'{"id":3558,"title":"Virunga","director":"Orlando von Einsiedel","year":2014,"tmdb_id":263614,"imdb_id":"tt3455224","original_title":"Virunga","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3559','movie',3559,'{"id":3559,"title":"Into the Woods","director":"Rob Marshall","year":2014,"tmdb_id":224141,"imdb_id":"tt2180411","original_title":"Into the Woods","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3560','movie',3560,'{"id":3560,"title":"Four Lions","director":"Chris Morris","year":2010,"tmdb_id":37495,"imdb_id":"tt1341167","original_title":"Four Lions","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3561','movie',3561,'{"id":3561,"title":"Made in Dagenham","director":"Nigel Cole","year":2010,"tmdb_id":46138,"imdb_id":"tt1371155","original_title":"Made in Dagenham","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3562','movie',3562,'{"id":3562,"title":"The Boxtrolls","director":"Graham Annable, Anthony Stacchi","year":2014,"tmdb_id":170687,"imdb_id":"tt0787474","original_title":"The Boxtrolls","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3563','movie',3563,'{"id":3563,"title":"The Secret in Their Eyes","director":"Juan José Campanella","year":2009,"tmdb_id":25376,"imdb_id":"tt1305806","original_title":"El secreto de sus ojos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3564','movie',3564,'{"id":3564,"title":"I Am Love","director":"Luca Guadagnino","year":2010,"tmdb_id":41110,"imdb_id":"tt1226236","original_title":"Io sono l''amore","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3565','movie',3565,'{"id":3565,"title":"Song of the Sea","director":"Tomm Moore","year":2014,"tmdb_id":110416,"imdb_id":"tt1865505","original_title":"Song of the Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3566','movie',3566,'{"id":3566,"title":"We Need to Talk About Kevin","director":"Lynne Ramsay","year":2011,"tmdb_id":71859,"imdb_id":"tt1242460","original_title":"We Need to Talk About Kevin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3567','movie',3567,'{"id":3567,"title":"Of Gods and Men","director":"Xavier Beauvois","year":2010,"tmdb_id":46332,"imdb_id":"tt1588337","original_title":"Des hommes et des dieux","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3568','movie',3568,'{"id":3568,"title":"Senna","director":"Asif Kapadia","year":2010,"tmdb_id":58496,"imdb_id":"tt1424432","original_title":"Senna","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3569','movie',3569,'{"id":3569,"title":"Shame","director":"Steve McQueen","year":2011,"tmdb_id":76025,"imdb_id":"tt1723811","original_title":"Shame","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3570','movie',3570,'{"id":3570,"title":"The Skin I Live In","director":"Pedro Almodóvar","year":2011,"tmdb_id":63311,"imdb_id":"tt1189073","original_title":"La piel que habito","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3571','movie',3571,'{"id":3571,"title":"Trophy Wife","director":"François Ozon","year":2010,"tmdb_id":51447,"imdb_id":"tt1521848","original_title":"Potiche","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3572','movie',3572,'{"id":3572,"title":"Project Nim","director":"James Marsh","year":2011,"tmdb_id":63579,"imdb_id":"tt1814836","original_title":"Project Nim","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3573','movie',3573,'{"id":3573,"title":"The Best Exotic Marigold Hotel","director":"John Madden","year":2012,"tmdb_id":74534,"imdb_id":"tt1412386","original_title":"The Best Exotic Marigold Hotel","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3574','movie',3574,'{"id":3574,"title":"Arthur Christmas","director":"Sarah Smith","year":2011,"tmdb_id":51052,"imdb_id":"tt1430607","original_title":"Arthur Christmas","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3575','movie',3575,'{"id":3575,"title":"Rust and Bone","director":"Jacques Audiard","year":2012,"tmdb_id":97365,"imdb_id":"tt2053425","original_title":"De rouille et d''os","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3576','movie',3576,'{"id":3576,"title":"Hitchcock","director":"Sacha Gervasi","year":2012,"tmdb_id":112336,"imdb_id":"tt0975645","original_title":"Hitchcock","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3577','movie',3577,'{"id":3577,"title":"Marley","director":"Kevin Macdonald","year":2012,"tmdb_id":90125,"imdb_id":"tt1183919","original_title":"Marley","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3578','movie',3578,'{"id":3578,"title":"West of Memphis","director":"Amy J. Berg","year":2012,"tmdb_id":84351,"imdb_id":"tt2130321","original_title":"West of Memphis","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3579','movie',3579,'{"id":3579,"title":"McCullin","director":"Jacqui Morris, David Morris","year":2012,"tmdb_id":151044,"imdb_id":"tt2354205","original_title":"McCullin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3580','movie',3580,'{"id":3580,"title":"The Imposter","director":"Bart Layton","year":2012,"tmdb_id":84287,"imdb_id":"tt1966604","original_title":"The Imposter","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3581','movie',3581,'{"id":3581,"title":"The Selfish Giant","director":"Clio Barnard","year":2013,"tmdb_id":194101,"imdb_id":"tt2304426","original_title":"The Selfish Giant","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3582','movie',3582,'{"id":3582,"title":"Behind the Candelabra","director":"Steven Soderbergh","year":2013,"tmdb_id":119675,"imdb_id":"tt1291580","original_title":"Behind the Candelabra","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3583','movie',3583,'{"id":3583,"title":"Mandela: Long Walk to Freedom","director":"Justin Chadwick","year":2013,"tmdb_id":192136,"imdb_id":"tt2304771","original_title":"Mandela: Long Walk to Freedom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3584','movie',3584,'{"id":3584,"title":"The Butler","director":"Lee Daniels","year":2013,"tmdb_id":132363,"imdb_id":"tt1327773","original_title":"The Butler","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3585','movie',3585,'{"id":3585,"title":"Wadjda","director":"Haifaa al-Mansour","year":2012,"tmdb_id":129112,"imdb_id":"tt2258858","original_title":"Das Mädchen Wadjda","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3586','movie',3586,'{"id":3586,"title":"Metro Manila","director":"Sean Ellis","year":2013,"tmdb_id":158091,"imdb_id":"tt1845838","original_title":"Metro Manila","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3587','movie',3587,'{"id":3587,"title":"We Steal Secrets: The Story of WikiLeaks","director":"Alex Gibney","year":2013,"tmdb_id":159154,"imdb_id":"tt1824254","original_title":"We Steal Secrets: The Story of WikiLeaks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3588','movie',3588,'{"id":3588,"title":"Blackfish","director":"Gabriela Cowperthwaite","year":2013,"tmdb_id":158999,"imdb_id":"tt2545118","original_title":"Blackfish","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3589','movie',3589,'{"id":3589,"title":"Tim''s Vermeer","director":"Teller","year":2013,"tmdb_id":212063,"imdb_id":"tt3089388","original_title":"Tim''s Vermeer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3590','movie',3590,'{"id":3590,"title":"The Armstrong Lie","director":"Alex Gibney","year":2013,"tmdb_id":214083,"imdb_id":"tt1638364","original_title":"The Armstrong Lie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3591','movie',3591,'{"id":3591,"title":"Paddington","director":"Paul King","year":2014,"tmdb_id":116149,"imdb_id":"tt1109624","original_title":"Paddington","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3592','movie',3592,'{"id":3592,"title":"''71","director":"Yann Demange","year":2014,"tmdb_id":252178,"imdb_id":"tt2614684","original_title":"''71","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3593','movie',3593,'{"id":3593,"title":"Pride","director":"Matthew Warchus","year":2014,"tmdb_id":234200,"imdb_id":"tt3169706","original_title":"Pride","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3594','movie',3594,'{"id":3594,"title":"Under the Skin","director":"Jonathan Glazer","year":2014,"tmdb_id":97370,"imdb_id":"tt1441395","original_title":"Under the Skin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3595','movie',3595,'{"id":3595,"title":"The Lunchbox","director":"Ritesh Batra","year":2013,"tmdb_id":191714,"imdb_id":"tt2350496","original_title":"The Lunchbox","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3596','movie',3596,'{"id":3596,"title":"Saving Mr. Banks","director":"John Lee Hancock","year":2013,"tmdb_id":140823,"imdb_id":"tt2140373","original_title":"Saving Mr. Banks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3597','movie',3597,'{"id":3597,"title":"The Lego Movie","director":"Phil Lord, Christopher Miller","year":2014,"tmdb_id":137106,"imdb_id":"tt1490017","original_title":"The Lego Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3598','movie',3598,'{"id":3598,"title":"20,000 Days on Earth","director":"Iain Forsyth, Jane Pollard","year":2014,"tmdb_id":246400,"imdb_id":"tt2920540","original_title":"20,000 Days on Earth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3599','movie',3599,'{"id":3599,"title":"Trash","director":"Stephen Daldry","year":2014,"tmdb_id":206563,"imdb_id":"tt1921149","original_title":"Trash","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3600','movie',3600,'{"id":3600,"title":"Burlesque","director":"Steve Antin","year":2010,"tmdb_id":42297,"imdb_id":"tt1126591","original_title":"Burlesque","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3601','movie',3601,'{"id":3601,"title":"RED","director":"Robert Schwentke","year":2010,"tmdb_id":39514,"imdb_id":"tt1245526","original_title":"RED","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3602','movie',3602,'{"id":3602,"title":"Frankie & Alice","director":"Geoffrey Sax","year":2010,"tmdb_id":55061,"imdb_id":"tt1221208","original_title":"Frankie & Alice","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3603','movie',3603,'{"id":3603,"title":"The Concert","director":"Radu Mihăileanu","year":2009,"tmdb_id":25205,"imdb_id":"tt1320082","original_title":"Le Concert","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3604','movie',3604,'{"id":3604,"title":"Wall Street: Money Never Sleeps","director":"Oliver Stone","year":2010,"tmdb_id":33909,"imdb_id":"tt1027718","original_title":"Wall Street: Money Never Sleeps","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3605','movie',3605,'{"id":3605,"title":"50/50","director":"Jonathan Levine","year":2011,"tmdb_id":40807,"imdb_id":"tt1306980","original_title":"50/50","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3606','movie',3606,'{"id":3606,"title":"The Adventures of Tintin","director":"Steven Spielberg","year":2011,"tmdb_id":17578,"imdb_id":"tt0983193","original_title":"The Adventures of Tintin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3607','movie',3607,'{"id":3607,"title":"In the Land of Blood and Honey","director":"Angelina Jolie","year":2011,"tmdb_id":79777,"imdb_id":"tt1714209","original_title":"In the Land of Blood and Honey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3608','movie',3608,'{"id":3608,"title":"The Kid with a Bike","director":"Luc Dardenne, Jean-Pierre Dardenne","year":2011,"tmdb_id":63831,"imdb_id":"tt1827512","original_title":"Le Gamin au vélo","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3609','movie',3609,'{"id":3609,"title":"Barney''s Version","director":"Richard J. Lewis","year":2010,"tmdb_id":46829,"imdb_id":"tt1423894","original_title":"Barney''s Version","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3610','movie',3610,'{"id":3610,"title":"J. Edgar","director":"Clint Eastwood","year":2011,"tmdb_id":88794,"imdb_id":"tt1616195","original_title":"J. Edgar","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3611','movie',3611,'{"id":3611,"title":"Salmon Fishing in the Yemen","director":"Lasse Hallström","year":2012,"tmdb_id":81025,"imdb_id":"tt1441952","original_title":"Salmon Fishing in the Yemen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3612','movie',3612,'{"id":3612,"title":"A Dangerous Method","director":"David Cronenberg","year":2011,"tmdb_id":48231,"imdb_id":"tt1571222","original_title":"A Dangerous Method","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3613','movie',3613,'{"id":3613,"title":"Young Adult","director":"Jason Reitman","year":2011,"tmdb_id":57157,"imdb_id":"tt1625346","original_title":"Young Adult","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3614','movie',3614,'{"id":3614,"title":"Hotel Transylvania","director":"Genndy Tartakovsky","year":2012,"tmdb_id":76492,"imdb_id":"tt0837562","original_title":"Hotel Transylvania","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3615','movie',3615,'{"id":3615,"title":"Rise of the Guardians","director":"Peter Ramsey","year":2012,"tmdb_id":81188,"imdb_id":"tt1446192","original_title":"Rise of the Guardians","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3616','movie',3616,'{"id":3616,"title":"Casino Jack","director":"George Hickenlooper","year":2010,"tmdb_id":45324,"imdb_id":"tt1194417","original_title":"Casino Jack","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3617','movie',3617,'{"id":3617,"title":"The Deep Blue Sea","director":"Terence Davies","year":2011,"tmdb_id":51994,"imdb_id":"tt1700844","original_title":"The Deep Blue Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3618','movie',3618,'{"id":3618,"title":"Arbitrage","director":"Nicholas Jarecki","year":2012,"tmdb_id":60599,"imdb_id":"tt1764183","original_title":"Arbitrage","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3619','movie',3619,'{"id":3619,"title":"Quartet","director":"Dustin Hoffman","year":2012,"tmdb_id":121826,"imdb_id":"tt1441951","original_title":"Quartet","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3620','movie',3620,'{"id":3620,"title":"Hope Springs","director":"David Frankel","year":2012,"tmdb_id":82696,"imdb_id":"tt1535438","original_title":"Hope Springs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3621','movie',3621,'{"id":3621,"title":"Hyde Park on Hudson","director":"Roger Michell","year":2012,"tmdb_id":87504,"imdb_id":"tt1477855","original_title":"Hyde Park on Hudson","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3622','movie',3622,'{"id":3622,"title":"Bernie","director":"Richard Linklater","year":2012,"tmdb_id":92591,"imdb_id":"tt1704573","original_title":"Bernie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3623','movie',3623,'{"id":3623,"title":"All Is Lost","director":"J.C. Chandor","year":2013,"tmdb_id":152747,"imdb_id":"tt2017038","original_title":"All Is Lost","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3624','movie',3624,'{"id":3624,"title":"Labor Day","director":"Jason Reitman","year":2013,"tmdb_id":130150,"imdb_id":"tt1967545","original_title":"Labor Day","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3625','movie',3625,'{"id":3625,"title":"Frances Ha","director":"Noah Baumbach","year":2013,"tmdb_id":121986,"imdb_id":"tt2347569","original_title":"Frances Ha","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3626','movie',3626,'{"id":3626,"title":"Enough Said","director":"Nicole Holofcener","year":2013,"tmdb_id":209263,"imdb_id":"tt2390361","original_title":"Enough Said","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3627','movie',3627,'{"id":3627,"title":"St. Vincent","director":"Theodore Melfi","year":2014,"tmdb_id":239563,"imdb_id":"tt2170593","original_title":"St. Vincent","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3628','movie',3628,'{"id":3628,"title":"The Book of Life","director":"Jorge R. Gutierrez","year":2014,"tmdb_id":228326,"imdb_id":"tt2262227","original_title":"The Book of Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3629','movie',3629,'{"id":3629,"title":"The Past","director":"Asghar Farhadi","year":2013,"tmdb_id":152780,"imdb_id":"tt2404461","original_title":"Le passé","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3630','movie',3630,'{"id":3630,"title":"Gett: The Trial of Viviane Amsalem","director":"Ronit Elkabetz, Shlomi Elkabetz","year":2014,"tmdb_id":270403,"imdb_id":"tt3062880","original_title":"גט: המשפט של ויויאן אמסלם","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3631','movie',3631,'{"id":3631,"title":"The Paperboy","director":"Lee Daniels","year":2012,"tmdb_id":82390,"imdb_id":"tt1496422","original_title":"The Paperboy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3632','movie',3632,'{"id":3632,"title":"Cake","director":"Daniel Barnz","year":2014,"tmdb_id":284276,"imdb_id":"tt3442006","original_title":"Cake","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3633','movie',3633,'{"id":3633,"title":"A Most Violent Year","director":"J.C. Chandor","year":2014,"tmdb_id":241239,"imdb_id":"tt2937898","original_title":"A Most Violent Year","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3634','movie',3634,'{"id":3634,"title":"The Hundred-Foot Journey","director":"Lasse Hallström","year":2014,"tmdb_id":228194,"imdb_id":"tt2980648","original_title":"The Hundred-Foot Journey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3635','movie',3635,'{"id":3635,"title":"We Have a Pope","director":"Nanni Moretti","year":2011,"tmdb_id":61667,"imdb_id":"tt1456472","original_title":"Habemus Papam","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3636','movie',3636,'{"id":3636,"title":"Maps to the Stars","director":"David Cronenberg","year":2014,"tmdb_id":157851,"imdb_id":"tt2172584","original_title":"Maps to the Stars","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3637','movie',3637,'{"id":3637,"title":"Hanezu","director":"Naomi Kawase","year":2011,"tmdb_id":96811,"imdb_id":"tt1896753","original_title":"朱花の月","original_language":"ja","alternate_titles":["HANEZU NO TSUKI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3638','movie',3638,'{"id":3638,"title":"Hara-Kiri: Death of a Samurai","director":"Takashi Miike","year":2011,"tmdb_id":85836,"imdb_id":"tt1728196","original_title":"一命","original_language":"ja","alternate_titles":["ICHIMEI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3639','movie',3639,'{"id":3639,"title":"House of Pleasures","director":"Bertrand Bonello","year":2011,"tmdb_id":84427,"imdb_id":"tt1660379","original_title":"L''Apollonide, souvenirs de la maison close","original_language":"fr","alternate_titles":["HOUSE OF TOLERANCE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3640','movie',3640,'{"id":3640,"title":"Annie","director":"Will Gluck","year":2014,"tmdb_id":196867,"imdb_id":"tt1823664","original_title":"Annie","original_language":"en","alternate_titles":["Annie (2014)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3641','movie',3641,'{"id":3641,"title":"Michael","director":"Markus Schleinzer","year":2011,"tmdb_id":78604,"imdb_id":"tt1906426","original_title":"Michael","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3642','movie',3642,'{"id":3642,"title":"Pater","director":"Alain Cavalier","year":2011,"tmdb_id":78162,"imdb_id":"tt1906446","original_title":"Pater","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3643','movie',3643,'{"id":3643,"title":"Le Havre","director":"Aki Kaurismäki","year":2011,"tmdb_id":73532,"imdb_id":"tt1508675","original_title":"Le Havre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3644','movie',3644,'{"id":3644,"title":"Polisse","director":"Maïwenn","year":2011,"tmdb_id":71157,"imdb_id":"tt1661420","original_title":"Polisse","original_language":"fr","alternate_titles":["POLISS"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3645','movie',3645,'{"id":3645,"title":"Sleeping Beauty","director":"Julia Leigh","year":2011,"tmdb_id":64586,"imdb_id":"tt1588398","original_title":"Sleeping Beauty","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3646','movie',3646,'{"id":3646,"title":"Arirang","director":"Kim Ki-duk","year":2011,"tmdb_id":104858,"imdb_id":"tt1922551","original_title":"아리랑","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3647','movie',3647,'{"id":3647,"title":"Bonsai","director":"Cristián Jiménez","year":2011,"tmdb_id":85543,"imdb_id":"tt1913002","original_title":"Bonsái","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3648','movie',3648,'{"id":3648,"title":"Where Do We Go Now?","director":"Nadine Labaki","year":2011,"tmdb_id":77461,"imdb_id":"tt1772424","original_title":"وهلأ لوين؟‎","original_language":"ar","alternate_titles":["ET MAINTENANT ON VA OU ?"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3649','movie',3649,'{"id":3649,"title":"Elena","director":"Andrey Zvyagintsev","year":2011,"tmdb_id":78182,"imdb_id":"tt1925421","original_title":"Елена","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3650','movie',3650,'{"id":3650,"title":"Stopped on Track","director":"Andreas Dresen","year":2011,"tmdb_id":78313,"imdb_id":"tt1780856","original_title":"Halt auf freier Strecke","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3651','movie',3651,'{"id":3651,"title":"This Must Be the Place","director":"Paolo Sorrentino","year":2011,"tmdb_id":53487,"imdb_id":"tt1440345","original_title":"This Must Be the Place","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3652','movie',3652,'{"id":3652,"title":"Outside Satan","director":"Bruno Dumont","year":2011,"tmdb_id":89456,"imdb_id":"tt1666168","original_title":"Hors Satan","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3653','movie',3653,'{"id":3653,"title":"The Source","director":"Radu Mihăileanu","year":2011,"tmdb_id":56418,"imdb_id":"tt1686067","original_title":"La Source des femmes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3654','movie',3654,'{"id":3654,"title":"Loverboy","director":"Cătălin Mitulescu","year":2011,"tmdb_id":84851,"imdb_id":"tt1895466","original_title":"Loverboy","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3655','movie',3655,'{"id":3655,"title":"Martha Marcy May Marlene","director":"Sean Durkin","year":2011,"tmdb_id":50837,"imdb_id":"tt1441326","original_title":"Martha Marcy May Marlene","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3656','movie',3656,'{"id":3656,"title":"Miss Bala","director":"Gerardo Naranjo","year":2011,"tmdb_id":77635,"imdb_id":"tt1911600","original_title":"Miss Bala","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3657','movie',3657,'{"id":3657,"title":"Oslo, August 31st","director":"Joachim Trier","year":2011,"tmdb_id":75233,"imdb_id":"tt1736633","original_title":"Oslo, 31. august","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3658','movie',3658,'{"id":3658,"title":"The Minister","director":"Pierre Schoeller","year":2011,"tmdb_id":95448,"imdb_id":"tt1781843","original_title":"L''Exercice de l''État","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3659','movie',3659,'{"id":3659,"title":"Restless","director":"Gus Van Sant","year":2011,"tmdb_id":47760,"imdb_id":"tt1498569","original_title":"Restless","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3660','movie',3660,'{"id":3660,"title":"The Day He Arrives","director":"Hong Sang-soo","year":2011,"tmdb_id":85525,"imdb_id":"tt1922561","original_title":"북촌방향","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3661','movie',3661,'{"id":3661,"title":"Beauty","director":"Oliver Hermanus","year":2011,"tmdb_id":96551,"imdb_id":"tt1922721","original_title":"Skoonheid","original_language":"af","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3662','movie',3662,'{"id":3662,"title":"The Snows of Kilimanjaro","director":"Robert Guédiguian","year":2011,"tmdb_id":91690,"imdb_id":"tt1852006","original_title":"Les Neiges du Kilimandjaro","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3663','movie',3663,'{"id":3663,"title":"Tatsumi","director":"Eric Khoo","year":2011,"tmdb_id":83114,"imdb_id":"tt1922736","original_title":"Tatsumi","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3664','movie',3664,'{"id":3664,"title":"Goodbye","director":"Mohammad Rasoulof","year":2011,"tmdb_id":87408,"imdb_id":"tt1926992","original_title":"به امید دیدار","original_language":"fa","alternate_titles":["BÉ OMID É DIDAR","Au Revoir"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3665','movie',3665,'{"id":3665,"title":"After the Battle","director":"Yousry Nasrallah","year":2012,"tmdb_id":103739,"imdb_id":"tt2368599","original_title":"بعد الموقعة‎‎","original_language":"ar","alternate_titles":["BAAD EL MAWKEAA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3666','movie',3666,'{"id":3666,"title":"Cosmopolis","director":"David Cronenberg","year":2012,"tmdb_id":49014,"imdb_id":"tt1480656","original_title":"Cosmopolis","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3667','movie',3667,'{"id":3667,"title":"In Another Country","director":"Hong Sang-soo","year":2012,"tmdb_id":103753,"imdb_id":"tt1989712","original_title":"다른 나라에서","original_language":"ko","alternate_titles":["DA-REUN NA-RA-E-SUH"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3668','movie',3668,'{"id":3668,"title":"The Yellow Sea","director":"Na Hong-jin","year":2011,"tmdb_id":57361,"imdb_id":"tt1230385","original_title":"황해","original_language":"ko","alternate_titles":["THE MURDERER (THE YELLOW SEA)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3669','movie',3669,'{"id":3669,"title":"Toomelah","director":"Ivan Sen","year":2011,"tmdb_id":78715,"imdb_id":"tt1905071","original_title":"Toomelah","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3670','movie',3670,'{"id":3670,"title":"Killing Them Softly","director":"Andrew Dominik","year":2012,"tmdb_id":64689,"imdb_id":"tt1764234","original_title":"Killing Them Softly","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3671','movie',3671,'{"id":3671,"title":"Like Someone in Love","director":"Abbas Kiarostami","year":2012,"tmdb_id":102001,"imdb_id":"tt1843287","original_title":"Like Someone in Love","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3672','movie',3672,'{"id":3672,"title":"Lawless","director":"John Hillcoat","year":2012,"tmdb_id":82633,"imdb_id":"tt1212450","original_title":"Lawless","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3673','movie',3673,'{"id":3673,"title":"Hard Labor","director":"Marco Dutra, Juliana Rojas","year":2011,"tmdb_id":96001,"imdb_id":"tt1686328","original_title":"Trabalhar Cansa","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3674','movie',3674,'{"id":3674,"title":"The Taste of Money","director":"Im Sang-soo","year":2012,"tmdb_id":103750,"imdb_id":"tt2106670","original_title":"돈의 맛","original_language":"ko","alternate_titles":["DO-NUI MAT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3675','movie',3675,'{"id":3675,"title":"Mud","director":"Jeff Nichols","year":2012,"tmdb_id":103731,"imdb_id":"tt1935179","original_title":"Mud","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3676','movie',3676,'{"id":3676,"title":"Post Tenebras Lux","director":"Carlos Reygadas","year":2012,"tmdb_id":103689,"imdb_id":"tt1754367","original_title":"Post Tenebras Lux","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3677','movie',3677,'{"id":3677,"title":"On the Road","director":"Walter Salles","year":2012,"tmdb_id":83770,"imdb_id":"tt0337692","original_title":"On the Road","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3678','movie',3678,'{"id":3678,"title":"In the Fog","director":"Sergei Loznitsa","year":2012,"tmdb_id":103742,"imdb_id":"tt2325741","original_title":"В тумане","original_language":"ru","alternate_titles":["V TUMANE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3679','movie',3679,'{"id":3679,"title":"The Angels'' Share","director":"Ken Loach","year":2012,"tmdb_id":103747,"imdb_id":"tt1924394","original_title":"The Angels'' Share","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3680','movie',3680,'{"id":3680,"title":"Antiviral","director":"Brandon Cronenberg","year":2012,"tmdb_id":125490,"imdb_id":"tt2099556","original_title":"Antiviral","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3681','movie',3681,'{"id":3681,"title":"Paradise: Love","director":"Ulrich Seidl","year":2012,"tmdb_id":103686,"imdb_id":"tt1403214","original_title":"Paradies: Liebe","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3682','movie',3682,'{"id":3682,"title":"7 Days in Havana","director":"Laurent Cantet, Benicio del Toro, Julio Medem, Gaspar Noé, Elia Suleiman, Juan Carlos Tabío, Pablo Trapero","year":2012,"tmdb_id":94904,"imdb_id":"tt1797348","original_title":"7 días en La Habana","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3683','movie',3683,'{"id":3683,"title":"You Ain''t Seen Nothin'' Yet","director":"Alain Resnais","year":2012,"tmdb_id":103717,"imdb_id":"tt1690389","original_title":"Vous n''avez encore rien vu","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3684','movie',3684,'{"id":3684,"title":"Confession of a Child of the Century","director":"Sylvie Verheyde","year":2012,"tmdb_id":58559,"imdb_id":"tt1865335","original_title":"Confession of a Child of the Century","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3685','movie',3685,'{"id":3685,"title":"After Lucia","director":"Michel Franco","year":2012,"tmdb_id":126315,"imdb_id":"tt2368749","original_title":"Después de Lucía","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3686','movie',3686,'{"id":3686,"title":"Children of Sarajevo","director":"Aida Begić","year":2012,"tmdb_id":111728,"imdb_id":"tt2123230","original_title":"Djeca","original_language":"bs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3687','movie',3687,'{"id":3687,"title":"Gimme the Loot","director":"Adam Leon","year":2012,"tmdb_id":97607,"imdb_id":"tt2139919","original_title":"Gimme the Loot","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3688','movie',3688,'{"id":3688,"title":"Reality","director":"Matteo Garrone","year":2012,"tmdb_id":103758,"imdb_id":"tt1846487","original_title":"Reality","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3689','movie',3689,'{"id":3689,"title":"White Elephant","director":"Pablo Trapero","year":2012,"tmdb_id":110393,"imdb_id":"tt2132324","original_title":"Elefante blanco","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3690','movie',3690,'{"id":3690,"title":"The Pirogue","director":"Moussa Touré","year":2012,"tmdb_id":126328,"imdb_id":"tt2369023","original_title":"La Pirogue","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3691','movie',3691,'{"id":3691,"title":"The Big Night","director":"Benoît Delépine, Gustave Kervern","year":2012,"tmdb_id":70793,"imdb_id":"tt2008562","original_title":"Le Grand Soir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3692','movie',3692,'{"id":3692,"title":"Horses of God","director":"Nabil Ayouch","year":2012,"tmdb_id":134908,"imdb_id":"tt2369047","original_title":"Les Chevaux de Dieu","original_language":"fr","alternate_titles":["GOD''S HORSES"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3693','movie',3693,'{"id":3693,"title":"Miss Lovely","director":"Ashim Ahluwalia","year":2012,"tmdb_id":126318,"imdb_id":"tt1629715","original_title":"Miss Lovely","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3694','movie',3694,'{"id":3694,"title":"Renoir","director":"Gilles Bourdos","year":2012,"tmdb_id":134673,"imdb_id":"tt2150332","original_title":"Renoir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3695','movie',3695,'{"id":3695,"title":"Our Children","director":"Joachim Lafosse","year":2012,"tmdb_id":121210,"imdb_id":"tt1660302","original_title":"À perdre la raison","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3696','movie',3696,'{"id":3696,"title":"Three Worlds","director":"Catherine Corsini","year":2012,"tmdb_id":126321,"imdb_id":"tt2369497","original_title":"Trois mondes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3697','movie',3697,'{"id":3697,"title":"Borgman","director":"Alex van Warmerdam","year":2013,"tmdb_id":186929,"imdb_id":"tt1954315","original_title":"Borgman","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3698','movie',3698,'{"id":3698,"title":"Laurence Anyways","director":"Xavier Dolan","year":2012,"tmdb_id":110160,"imdb_id":"tt1650048","original_title":"Laurence Anyways","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3699','movie',3699,'{"id":3699,"title":"Jimmy P.","director":"Arnaud Desplechin","year":2013,"tmdb_id":160768,"imdb_id":"tt2210834","original_title":"Jimmy P.","original_language":"en","alternate_titles":["JIMMY P. (PSYCHOTHERAPY OF A PLAINS INDIAN)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3700','movie',3700,'{"id":3700,"title":"Grigris","director":"Mahamat-Saleh Haroun","year":2013,"tmdb_id":186970,"imdb_id":"tt2852394","original_title":"Grigris","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3701','movie',3701,'{"id":3701,"title":"Heli","director":"Amat Escalante","year":2013,"tmdb_id":186935,"imdb_id":"tt2852376","original_title":"Heli","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3702','movie',3702,'{"id":3702,"title":"Young & Beautiful","director":"François Ozon","year":2013,"tmdb_id":184314,"imdb_id":"tt2752200","original_title":"Jeune & Jolie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3703','movie',3703,'{"id":3703,"title":"Age of Uprising: The Legend of Michael Kohlhaas","director":"Arnaud des Pallières","year":2013,"tmdb_id":186971,"imdb_id":"tt2054790","original_title":"Michael Kohlhaas","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3704','movie',3704,'{"id":3704,"title":"Only God Forgives","director":"Nicolas Winding Refn","year":2013,"tmdb_id":77987,"imdb_id":"tt1602613","original_title":"Only God Forgives","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3705','movie',3705,'{"id":3705,"title":"The Immigrant","director":"James Gray","year":2013,"tmdb_id":152599,"imdb_id":"tt1951181","original_title":"The Immigrant","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3706','movie',3706,'{"id":3706,"title":"A Touch of Sin","director":"Jia Zhangke","year":2013,"tmdb_id":187022,"imdb_id":"tt2852400","original_title":"天注定","original_language":"zh","alternate_titles":["TIAN ZHU DING"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3707','movie',3707,'{"id":3707,"title":"As I Lay Dying","director":"James Franco","year":2013,"tmdb_id":152745,"imdb_id":"tt1807944","original_title":"As I Lay Dying","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3708','movie',3708,'{"id":3708,"title":"Like Father, Like Son","director":"Hirokazu Kore-eda","year":2013,"tmdb_id":177945,"imdb_id":"tt2331143","original_title":"そして父になる","original_language":"ja","alternate_titles":["SOSHITE CHICHI NI NARU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3709','movie',3709,'{"id":3709,"title":"Bends","director":"Flora Lau","year":2013,"tmdb_id":230152,"imdb_id":"tt2852460","original_title":"過界","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3710','movie',3710,'{"id":3710,"title":"Manuscripts Don''t Burn","director":"Mohammad Rasoulof","year":2013,"tmdb_id":191731,"imdb_id":"tt2912144","original_title":"دست‌نویس‌ها نمی‌سوزند","original_language":"fa","alternate_titles":["DAST-NEVESHTEHAA NEMISOOZAND"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3711','movie',3711,'{"id":3711,"title":"Death March","director":"Adolfo Alix Jr.","year":2013,"tmdb_id":186998,"imdb_id":"tt2852446","original_title":"Death March","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3712','movie',3712,'{"id":3712,"title":"Shield of Straw","director":"Takashi Miike","year":2013,"tmdb_id":180900,"imdb_id":"tt2347144","original_title":"藁の楯 わらのたて","original_language":"ja","alternate_titles":["WARA NO TATE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3713','movie',3713,'{"id":3713,"title":"Fruitvale Station","director":"Ryan Coogler","year":2013,"tmdb_id":157354,"imdb_id":"tt2334649","original_title":"Fruitvale Station","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3714','movie',3714,'{"id":3714,"title":"Grand Central","director":"Rebecca Zlotowski","year":2013,"tmdb_id":186991,"imdb_id":"tt2835548","original_title":"Grand Central","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3715','movie',3715,'{"id":3715,"title":"Stranger by the Lake","director":"Alain Guiraudie","year":2013,"tmdb_id":186992,"imdb_id":"tt2852458","original_title":"L''Inconnu du lac","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3716','movie',3716,'{"id":3716,"title":"My Sweet Pepper Land","director":"Hiner Saleem","year":2013,"tmdb_id":188765,"imdb_id":"tt2875926","original_title":"My Sweet Pepper Land","original_language":"ku","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3717','movie',3717,'{"id":3717,"title":"Honey","director":"Valeria Golino","year":2013,"tmdb_id":186988,"imdb_id":"tt2357461","original_title":"Miele","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3718','movie',3718,'{"id":3718,"title":"The Golden Dream","director":"Diego Quemada-Díez","year":2013,"tmdb_id":186976,"imdb_id":"tt2042583","original_title":"La jaula de oro","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3719','movie',3719,'{"id":3719,"title":"Norte, the End of History","director":"Lav Diaz","year":2013,"tmdb_id":186975,"imdb_id":"tt2852432","original_title":"Norte, Hangganan ng Kasaysayan","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3720','movie',3720,'{"id":3720,"title":"Sarah Prefers to Run","director":"Chloé Robichaud","year":2013,"tmdb_id":186974,"imdb_id":"tt2384328","original_title":"Sarah préfère la course","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3721','movie',3721,'{"id":3721,"title":"The German Doctor","director":"Lucía Puenzo","year":2013,"tmdb_id":188761,"imdb_id":"tt1847746","original_title":"Wakolda","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3722','movie',3722,'{"id":3722,"title":"Nothing Bad Can Happen","director":"Katrin Gebbe","year":2013,"tmdb_id":188758,"imdb_id":"tt2822400","original_title":"Tore tanzt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3723','movie',3723,'{"id":3723,"title":"A Castle in Italy","director":"Valeria Bruni Tedeschi","year":2013,"tmdb_id":197089,"imdb_id":"tt2234543","original_title":"Un château en Italie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3724','movie',3724,'{"id":3724,"title":"The Captive","director":"Atom Egoyan","year":2014,"tmdb_id":244761,"imdb_id":"tt2326612","original_title":"The Captive","original_language":"en","alternate_titles":["CAPTIVES"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3725','movie',3725,'{"id":3725,"title":"Still the Water","director":"Naomi Kawase","year":2014,"tmdb_id":265193,"imdb_id":"tt3230162","original_title":"2つ目の窓","original_language":"ja","alternate_titles":["FUTATSUME NO MADO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3726','movie',3726,'{"id":3726,"title":"The Wonders","director":"Alice Rohrwacher","year":2014,"tmdb_id":265226,"imdb_id":"tt3044244","original_title":"Le meraviglie","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3727','movie',3727,'{"id":3727,"title":"Mr. Turner","director":"Mike Leigh","year":2014,"tmdb_id":245700,"imdb_id":"tt2473794","original_title":"Mr. Turner","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3728','movie',3728,'{"id":3728,"title":"Bastards","director":"Claire Denis","year":2013,"tmdb_id":179109,"imdb_id":"tt2821088","original_title":"Les Salauds","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3729','movie',3729,'{"id":3729,"title":"Clouds of Sils Maria","director":"Olivier Assayas","year":2014,"tmdb_id":246860,"imdb_id":"tt2452254","original_title":"Clouds of Sils Maria","original_language":"en","alternate_titles":["SILS MARIA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3730','movie',3730,'{"id":3730,"title":"The Homesman","director":"Tommy Lee Jones","year":2014,"tmdb_id":264656,"imdb_id":"tt2398231","original_title":"The Homesman","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3731','movie',3731,'{"id":3731,"title":"The Search","director":"Michel Hazanavicius","year":2014,"tmdb_id":245692,"imdb_id":"tt2177827","original_title":"The Search","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3732','movie',3732,'{"id":3732,"title":"Bird People","director":"Pascale Ferran","year":2014,"tmdb_id":266040,"imdb_id":"tt2368635","original_title":"Bird People","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3733','movie',3733,'{"id":3733,"title":"Charlie''s Country","director":"Rolf de Heer","year":2014,"tmdb_id":265349,"imdb_id":"tt3244512","original_title":"Charlie''s Country","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3734','movie',3734,'{"id":3734,"title":"Saint Laurent","director":"Bertrand Bonello","year":2014,"tmdb_id":221667,"imdb_id":"tt2707848","original_title":"Saint Laurent","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3735','movie',3735,'{"id":3735,"title":"A Girl at My Door","director":"July Jung","year":2014,"tmdb_id":266058,"imdb_id":"tt3661798","original_title":"도희야","original_language":"ko","alternate_titles":["DOHEE-YA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3736','movie',3736,'{"id":3736,"title":"Amour Fou","director":"Jessica Hausner","year":2014,"tmdb_id":266044,"imdb_id":"tt3003800","original_title":"Amour fou","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3737','movie',3737,'{"id":3737,"title":"Mommy","director":"Xavier Dolan","year":2014,"tmdb_id":265177,"imdb_id":"tt3612616","original_title":"Mommy","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3738','movie',3738,'{"id":3738,"title":"Beautiful Youth","director":"Jaime Rosales","year":2014,"tmdb_id":266065,"imdb_id":"tt3314376","original_title":"Hermosa juventud","original_language":"es","alternate_titles":["BEAUTIFULL YOUTH"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3739','movie',3739,'{"id":3739,"title":"Jauja","director":"Lisandro Alonso","year":2014,"tmdb_id":266031,"imdb_id":"tt2514338","original_title":"Jauja","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3740','movie',3740,'{"id":3740,"title":"Misunderstood","director":"Asia Argento","year":2014,"tmdb_id":266036,"imdb_id":"tt3510452","original_title":"Incompresa","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3741','movie',3741,'{"id":3741,"title":"Fantasia","director":"Wang Chao","year":2014,"tmdb_id":266069,"imdb_id":"tt3591950","original_title":"幻想曲","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3742','movie',3742,'{"id":3742,"title":"Lost River","director":"Ryan Gosling","year":2014,"tmdb_id":167810,"imdb_id":"tt2366608","original_title":"Lost River","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3743','movie',3743,'{"id":3743,"title":"The Blue Room","director":"Mathieu Amalric","year":2014,"tmdb_id":266034,"imdb_id":"tt3230082","original_title":"La chambre bleue","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3744','movie',3744,'{"id":3744,"title":"That Lovely Girl","director":"Keren Yedaya","year":2014,"tmdb_id":270014,"imdb_id":"tt3675236","original_title":"הרחק מהיעדרו","original_language":"he","alternate_titles":["LOIN DE MON PÈRE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3745','movie',3745,'{"id":3745,"title":"Titli","director":"Kanu Behl","year":2014,"tmdb_id":266038,"imdb_id":"tt3019620","original_title":"तितली","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3746','movie',3746,'{"id":3746,"title":"Party Girl","director":"Marie Amachoukeli, Claire Burger, Samuel Theis","year":2014,"tmdb_id":266030,"imdb_id":"tt3660370","original_title":"Party Girl","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3747','movie',3747,'{"id":3747,"title":"Xenia","director":"Panos H. Koutras","year":2014,"tmdb_id":266061,"imdb_id":"tt3186946","original_title":"Xenia","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3748','movie',3748,'{"id":3748,"title":"Chronic","director":"Michel Franco","year":2015,"tmdb_id":337104,"imdb_id":"tt3850496","original_title":"Chronic","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3749','movie',3749,'{"id":3749,"title":"Snow in Paradise","director":"Andrew Hulme","year":2014,"tmdb_id":266047,"imdb_id":"tt2147521","original_title":"Snow in Paradise","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3750','movie',3750,'{"id":3750,"title":"White God","director":"Kornél Mundruczó","year":2014,"tmdb_id":267999,"imdb_id":"tt2844798","original_title":"Fehér Isten","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3751','movie',3751,'{"id":3751,"title":"Louder Than Bombs","director":"Joachim Trier","year":2015,"tmdb_id":157827,"imdb_id":"tt2217859","original_title":"Louder Than Bombs","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3752','movie',3752,'{"id":3752,"title":"Marguerite & Julien","director":"Valérie Donzelli","year":2015,"tmdb_id":330294,"imdb_id":"tt4428800","original_title":"Marguerite et Julien","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3753','movie',3753,'{"id":3753,"title":"The Measure of a Man","director":"Stéphane Brizé","year":2015,"tmdb_id":329712,"imdb_id":"tt4428814","original_title":"La Loi du marché","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3754','movie',3754,'{"id":3754,"title":"Macbeth","director":"Justin Kurzel","year":2015,"tmdb_id":225728,"imdb_id":"tt2884018","original_title":"Macbeth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3755','movie',3755,'{"id":3755,"title":"Mountains May Depart","director":"Jia Zhangke","year":2015,"tmdb_id":314388,"imdb_id":"tt3740778","original_title":"山河故人","original_language":"zh","alternate_titles":["SHAN HE GU REN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3756','movie',3756,'{"id":3756,"title":"The Sea of Trees","director":"Gus Van Sant","year":2015,"tmdb_id":291351,"imdb_id":"tt3450900","original_title":"The Sea of Trees","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3757','movie',3757,'{"id":3757,"title":"Valley of Love","director":"Guillaume Nicloux","year":2015,"tmdb_id":337107,"imdb_id":"tt4120210","original_title":"Valley of Love","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3758','movie',3758,'{"id":3758,"title":"Our Little Sister","director":"Hirokazu Kore-eda","year":2015,"tmdb_id":315846,"imdb_id":"tt3756788","original_title":"海街diary","original_language":"ja","alternate_titles":["UMIMACHI DIARY"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3759','movie',3759,'{"id":3759,"title":"Sweet Bean","director":"Naomi Kawase","year":2015,"tmdb_id":319373,"imdb_id":"tt4298958","original_title":"あん","original_language":"ja","alternate_titles":["AN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3760','movie',3760,'{"id":3760,"title":"My King","director":"Maïwenn","year":2015,"tmdb_id":329805,"imdb_id":"tt3478962","original_title":"Mon roi","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3761','movie',3761,'{"id":3761,"title":"The Fourth Direction","director":"Gurvinder Singh","year":2015,"tmdb_id":336204,"imdb_id":"tt4636068","original_title":"Chauthi Koot","original_language":"pa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3762','movie',3762,'{"id":3762,"title":"The Treasure","director":"Corneliu Porumboiu","year":2015,"tmdb_id":334924,"imdb_id":"tt4515684","original_title":"Comoara","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3763','movie',3763,'{"id":3763,"title":"Rams","director":"Grímur Hákonarson","year":2015,"tmdb_id":336222,"imdb_id":"tt3296658","original_title":"Hrútar","original_language":"is","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3764','movie',3764,'{"id":3764,"title":"I Am a Soldier","director":"Laurent Larivière","year":2015,"tmdb_id":336207,"imdb_id":"tt4485178","original_title":"Je suis un soldat","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3765','movie',3765,'{"id":3765,"title":"Journey to the Shore","director":"Kiyoshi Kurosawa","year":2015,"tmdb_id":334991,"imdb_id":"tt4173478","original_title":"岸辺の旅","original_language":"ja","alternate_titles":["KISHIBE NO TABI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3766','movie',3766,'{"id":3766,"title":"Lamb","director":"Yared Zeleke","year":2015,"tmdb_id":337114,"imdb_id":"tt4130944","original_title":"Lamb","original_language":"am","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3767','movie',3767,'{"id":3767,"title":"Madonna","director":"Shin Su-won","year":2015,"tmdb_id":336054,"imdb_id":"tt4636074","original_title":"마돈나","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3768','movie',3768,'{"id":3768,"title":"Nahid","director":"Ida Panahandeh","year":2015,"tmdb_id":336212,"imdb_id":"tt4636046","original_title":"ناهید","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3769','movie',3769,'{"id":3769,"title":"The Chosen Ones","director":"David Pablos","year":2015,"tmdb_id":336201,"imdb_id":"tt4636042","original_title":"Las elegidas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3770','movie',3770,'{"id":3770,"title":"Disorder","director":"Alice Winocour","year":2015,"tmdb_id":329815,"imdb_id":"tt4085084","original_title":"Maryland","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3771','movie',3771,'{"id":3771,"title":"One Floor Below","director":"Radu Muntean","year":2015,"tmdb_id":336216,"imdb_id":"tt4620316","original_title":"Un etaj mai jos","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3772','movie',3772,'{"id":3772,"title":"Masaan","director":"Neeraj Ghaywan","year":2015,"tmdb_id":336203,"imdb_id":"tt4635372","original_title":"मसान","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3773','movie',3773,'{"id":3773,"title":"The High Sun","director":"Dalibor Matanić","year":2015,"tmdb_id":336206,"imdb_id":"tt4593108","original_title":"Zvizdan","original_language":"hr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3774','movie',3774,'{"id":3774,"title":"The Shameless","director":"Oh Seung-uk","year":2015,"tmdb_id":336053,"imdb_id":"tt4636022","original_title":"무뢰한","original_language":"ko","alternate_titles":["MU-ROE-HAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3775','movie',3775,'{"id":3775,"title":"Dark Horse","director":"Todd Solondz","year":2011,"tmdb_id":83384,"imdb_id":"tt1690455","original_title":"Dark Horse","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3776','movie',3776,'{"id":3776,"title":"Life Without Principle","director":"Johnnie To","year":2011,"tmdb_id":90147,"imdb_id":"tt1371585","original_title":"奪命金","original_language":"cn","alternate_titles":["Dyut meng gam","Duo Mingjin"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3777','movie',3777,'{"id":3777,"title":"The Other Side","director":"Roberto Minervini","year":2015,"tmdb_id":336220,"imdb_id":"tt4610244","original_title":"The Other Side","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3778','movie',3778,'{"id":3778,"title":"Killer Joe","director":"William Friedkin","year":2011,"tmdb_id":73567,"imdb_id":"tt1726669","original_title":"Killer Joe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3779','movie',3779,'{"id":3779,"title":"4:44 Last Day on Earth","director":"Abel Ferrara","year":2011,"tmdb_id":86820,"imdb_id":"tt1707391","original_title":"4:44 Last Day on Earth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3780','movie',3780,'{"id":3780,"title":"Chicken with Plums","director":"Marjane Satrapi, Vincent Paronnaud","year":2011,"tmdb_id":78206,"imdb_id":"tt1663321","original_title":"Poulet aux Prunes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3781','movie',3781,'{"id":3781,"title":"The Last Man on Earth","director":"Gian Alfonso Pacinotti","year":2011,"tmdb_id":73869,"imdb_id":"tt2006781","original_title":"L''ultimo terrestre","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3782','movie',3782,'{"id":3782,"title":"The Exchange","director":"Eran Kolirin","year":2011,"tmdb_id":99393,"imdb_id":"tt1441368","original_title":"ההתחלפות","original_language":"he","alternate_titles":["Hahithalfut"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3783','movie',3783,'{"id":3783,"title":"People Mountain People Sea","director":"Cai Shangjun","year":2011,"tmdb_id":102869,"imdb_id":"tt2050604","original_title":"人山人海","original_language":"zh","alternate_titles":["Ren shan ren hai"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3784','movie',3784,'{"id":3784,"title":"When the Night","director":"Cristina Comencini","year":2011,"tmdb_id":77952,"imdb_id":"tt1680139","original_title":"Quando la notte","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3785','movie',3785,'{"id":3785,"title":"Terraferma","director":"Emanuele Crialese","year":2011,"tmdb_id":73872,"imdb_id":"tt1641410","original_title":"Terraferma","original_language":"it","alternate_titles":["Mainland"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3786','movie',3786,'{"id":3786,"title":"Texas Killing Fields","director":"Ami Canaan Mann","year":2011,"tmdb_id":72477,"imdb_id":"tt1389127","original_title":"Texas Killing Fields","original_language":"en","alternate_titles":["The Fields"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3787','movie',3787,'{"id":3787,"title":"A Burning Hot Summer","director":"Philippe Garrel","year":2011,"tmdb_id":80440,"imdb_id":"tt1740053","original_title":"Un été brûlant","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3788','movie',3788,'{"id":3788,"title":"Anhey Ghorhey Da Daan","director":"Gurvinder Singh","year":2011,"tmdb_id":127925,"imdb_id":"tt2085746","original_title":"ਅੰਨ੍ਹੇ ਘੋੜੇ ਦਾ ਦਾਨ","original_language":"pa","alternate_titles":["Alms of the Blind Horse"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3789','movie',3789,'{"id":3789,"title":"Cisne","director":"Teresa Villaverde","year":2011,"tmdb_id":267891,"imdb_id":"tt1753593","original_title":"Cisne","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3790','movie',3790,'{"id":3790,"title":"Warriors of the Rainbow: Seediq Bale - Part 1: The Sun Flag","director":"Wei Te-sheng","year":2011,"tmdb_id":98344,"imdb_id":"tt2007993","original_title":"賽德克‧巴萊：太陽旗","original_language":"zh","alternate_titles":["Saideke Balai","Warriors of the Rainbow: Seediq Bale I"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3791','movie',3791,'{"id":3791,"title":"The Flock of the Lord","director":"Romuald Karmakar","year":2011,"tmdb_id":541427,"imdb_id":"tt6711276","original_title":"Die Herde des Herrn","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3792','movie',3792,'{"id":3792,"title":"Swirl","director":"Clarissa Campolina, Helvécio Marins Jr.","year":2011,"tmdb_id":92643,"imdb_id":"tt2044009","original_title":"Girimunho","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3793','movie',3793,'{"id":3793,"title":"Hail","director":"Amiel Courtin-Wilson","year":2011,"tmdb_id":92642,"imdb_id":"tt1782453","original_title":"Hail","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3794','movie',3794,'{"id":3794,"title":"Kotoko","director":"Shinya Tsukamoto","year":2011,"tmdb_id":85032,"imdb_id":"tt1842532","original_title":"KOTOKO","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3795','movie',3795,'{"id":3795,"title":"Love Flesh","director":"Pippo Delbono","year":2011,"tmdb_id":202872,"imdb_id":"tt2339357","original_title":"Amore carne","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3796','movie',3796,'{"id":3796,"title":"Stateless Things","director":"Kim Kyung-mook","year":2011,"tmdb_id":99513,"imdb_id":"tt2109208","original_title":"줄탁동시","original_language":"ko","alternate_titles":["Jool-tak-dong-si","Jultak dongshi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3797','movie',3797,'{"id":3797,"title":"Hop-o''-My-Thumb","director":"Marina de Van","year":2011,"tmdb_id":120820,"imdb_id":"tt1764442","original_title":"Le Petit Poucet","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3798','movie',3798,'{"id":3798,"title":"Lung Neaw Visits His Neighbours","director":"Rirkrit Tiravanija","year":2011,"tmdb_id":120272,"imdb_id":"tt2083255","original_title":"Lung Neaw Visits His Neighbours","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3799','movie',3799,'{"id":3799,"title":"The Bird","director":"Yves Caumon","year":2011,"tmdb_id":141522,"imdb_id":"tt1964853","original_title":"L''Oiseau","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3800','movie',3800,'{"id":3800,"title":"The Orator","director":"Tusi Tamasese","year":2011,"tmdb_id":77322,"imdb_id":"tt1846783","original_title":"O le tulafale","original_language":"sm","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3801','movie',3801,'{"id":3801,"title":"Photographic Memory","director":"Ross McElwee","year":2011,"tmdb_id":111103,"imdb_id":"tt2055711","original_title":"Photographic Memory","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3802','movie',3802,'{"id":3802,"title":"Wuthering Heights","director":"Andrea Arnold","year":2011,"tmdb_id":9364,"imdb_id":"tt1181614","original_title":"Wuthering Heights","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3803','movie',3803,'{"id":3803,"title":"The Invader","director":"Nicolas Provost","year":2011,"tmdb_id":84479,"imdb_id":"tt1772947","original_title":"L''Envahisseur","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3804','movie',3804,'{"id":3804,"title":"Shock Head Soul","director":"Simon Pummell","year":2011,"tmdb_id":111114,"imdb_id":"tt2120832","original_title":"Shock Head Soul","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3805','movie',3805,'{"id":3805,"title":"Two Years at Sea","director":"Ben Rivers","year":2011,"tmdb_id":97762,"imdb_id":"tt2359417","original_title":"Two Years at Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3806','movie',3806,'{"id":3806,"title":"Whores'' Glory","director":"Michael Glawogger","year":2011,"tmdb_id":85533,"imdb_id":"tt1327628","original_title":"Whores'' Glory","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3807','movie',3807,'{"id":3807,"title":"Verano","director":"José Luis Torres Leiva","year":2011,"tmdb_id":111106,"imdb_id":"tt1950447","original_title":"Verano","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3808','movie',3808,'{"id":3808,"title":"Something in the Air","director":"Olivier Assayas","year":2012,"tmdb_id":122089,"imdb_id":"tt1846472","original_title":"Après Mai","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3809','movie',3809,'{"id":3809,"title":"Would You Have Sex With an Arab?","director":"Yolande Zauberman","year":2011,"tmdb_id":136017,"imdb_id":"tt1995494","original_title":"Would You Have Sex With an Arab?","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3810','movie',3810,'{"id":3810,"title":"At Any Price","director":"Ramin Bahrani","year":2012,"tmdb_id":121789,"imdb_id":"tt1937449","original_title":"At Any Price","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3811','movie',3811,'{"id":3811,"title":"The Sword Identity","director":"Xu Haofeng","year":2011,"tmdb_id":120460,"imdb_id":"tt2044077","original_title":"倭寇的踪迹","original_language":"zh","alternate_titles":["Wo kou de zong ji","Wokou de zongji"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3812','movie',3812,'{"id":3812,"title":"Dormant Beauty","director":"Marco Bellocchio","year":2012,"tmdb_id":110447,"imdb_id":"tt2184227","original_title":"Bella addormentata","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3813','movie',3813,'{"id":3813,"title":"Nocturnos","director":"Edgardo Cozarinsky","year":2011,"tmdb_id":807071,"imdb_id":"tt2338135","original_title":"Nocturnos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3814','movie',3814,'{"id":3814,"title":"The Fifth Season","director":"Peter Brosens, Jessica Hope Woodworth","year":2012,"tmdb_id":123366,"imdb_id":"tt2298820","original_title":"La cinquième saison","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3815','movie',3815,'{"id":3815,"title":"Beyond Outrage","director":"Takeshi Kitano","year":2012,"tmdb_id":121828,"imdb_id":"tt1724962","original_title":"アウトレイジ ビヨンド","original_language":"ja","alternate_titles":["Outrage Beyond"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3816','movie',3816,'{"id":3816,"title":"Betrayal","director":"Kirill Serebrennikov","year":2012,"tmdb_id":123380,"imdb_id":"tt2299954","original_title":"Измена","original_language":"ru","alternate_titles":["Izmena"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3817','movie',3817,'{"id":3817,"title":"Paradise: Faith","director":"Ulrich Seidl","year":2012,"tmdb_id":129734,"imdb_id":"tt2371824","original_title":"Paradies: Glaube","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3818','movie',3818,'{"id":3818,"title":"Fill the Void","director":"Rama Burshtein","year":2012,"tmdb_id":122088,"imdb_id":"tt2219514","original_title":"למלא את החלל","original_language":"he","alternate_titles":["Lemale et Ha''Chalal"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3819','movie',3819,'{"id":3819,"title":"Passion","director":"Brian De Palma","year":2012,"tmdb_id":109099,"imdb_id":"tt1829012","original_title":"Passion","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3820','movie',3820,'{"id":3820,"title":"Pieta","director":"Kim Ki-duk","year":2012,"tmdb_id":123377,"imdb_id":"tt2299842","original_title":"피에타","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3821','movie',3821,'{"id":3821,"title":"Spring Breakers","director":"Harmony Korine","year":2012,"tmdb_id":122081,"imdb_id":"tt2101441","original_title":"Spring Breakers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3822','movie',3822,'{"id":3822,"title":"Superstar","director":"Xavier Giannoli","year":2012,"tmdb_id":122083,"imdb_id":"tt1849111","original_title":"Superstar","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3823','movie',3823,'{"id":3823,"title":"To the Wonder","director":"Terrence Malick","year":2012,"tmdb_id":60281,"imdb_id":"tt1595656","original_title":"To the Wonder","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3824','movie',3824,'{"id":3824,"title":"Araf/Somewhere in Between","director":"Yeşim Ustaoğlu","year":2012,"tmdb_id":129119,"imdb_id":"tt2249712","original_title":"Araf","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3825','movie',3825,'{"id":3825,"title":"Sal","director":"James Franco","year":2011,"tmdb_id":220493,"imdb_id":"tt1794943","original_title":"Sal","original_language":"en","alternate_titles":["Sal Mineo: A Biography"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3826','movie',3826,'{"id":3826,"title":"Pretty Butterflies","director":"Salvatore Mereu","year":2012,"tmdb_id":128508,"imdb_id":"tt2384642","original_title":"Bellas Mariposas","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3827','movie',3827,'{"id":3827,"title":"Boxing Day","director":"Bernard Rose","year":2012,"tmdb_id":127242,"imdb_id":"tt1964570","original_title":"Boxing Day","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3828','movie',3828,'{"id":3828,"title":"A Special Day","director":"Francesca Comencini","year":2012,"tmdb_id":123375,"imdb_id":"tt2299792","original_title":"Un giorno speciale","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3829','movie',3829,'{"id":3829,"title":"Lines of Wellington","director":"Valeria Sarmiento","year":2012,"tmdb_id":122198,"imdb_id":"tt1928329","original_title":"Linhas de Wellington","original_language":"pt","alternate_titles":["The Lines of Wellington"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3830','movie',3830,'{"id":3830,"title":"Fly With the Crane","director":"Li Ruijun","year":2012,"tmdb_id":127907,"imdb_id":"tt2300438","original_title":"告訴他們","original_language":"zh","alternate_titles":["Gaosu tamen, wo cheng baihe qu le"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3831','movie',3831,'{"id":3831,"title":"Winter of Discontent","director":"Ibrahim El Batout","year":2012,"tmdb_id":137079,"imdb_id":"tt2380594","original_title":"الشتا اللي فات","original_language":"ar","alternate_titles":["El sheita elli fat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3832','movie',3832,'{"id":3832,"title":"A Hijacking","director":"Tobias Lindholm","year":2012,"tmdb_id":127846,"imdb_id":"tt2216240","original_title":"Kapringen","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3833','movie',3833,'{"id":3833,"title":"Lions","director":"Jazmín López","year":2012,"tmdb_id":129115,"imdb_id":"tt2186883","original_title":"Leones","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3834','movie',3834,'{"id":3834,"title":"Balancing Act","director":"Ivano De Matteo","year":2012,"tmdb_id":141810,"imdb_id":"tt2370096","original_title":"Gli equilibristi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3835','movie',3835,'{"id":3835,"title":"The Cutoff Man","director":"Idan Hubel","year":2012,"tmdb_id":129113,"imdb_id":"tt2219708","original_title":"מנתק המים","original_language":"he","alternate_titles":["Menatek Ha-maim"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3836','movie',3836,'{"id":3836,"title":"Low Tide","director":"Roberto Minervini","year":2012,"tmdb_id":129116,"imdb_id":"tt2221490","original_title":"Low Tide","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3837','movie',3837,'{"id":3837,"title":"The Interval","director":"Leonardo Di Costanzo","year":2012,"tmdb_id":128106,"imdb_id":"tt2290934","original_title":"L''intervallo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3838','movie',3838,'{"id":3838,"title":"Tango Libre","director":"Frédéric Fonteyne","year":2012,"tmdb_id":144752,"imdb_id":"tt2370034","original_title":"Tango Libre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3839','movie',3839,'{"id":3839,"title":"Me Too","director":"Aleksei Balabanov","year":2012,"tmdb_id":127236,"imdb_id":"tt2456536","original_title":"Я тоже хочу","original_language":"ru","alternate_titles":["Ja tozhe hochu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3840','movie',3840,'{"id":3840,"title":"The Millennial Rapture","director":"Kōji Wakamatsu","year":2012,"tmdb_id":129121,"imdb_id":"tt2095764","original_title":"千年の愉楽","original_language":"ja","alternate_titles":["Sennen no yuraku"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3841','movie',3841,'{"id":3841,"title":"Ana Arabia","director":"Amos Gitai","year":2013,"tmdb_id":216789,"imdb_id":"tt3092086","original_title":"אנה ערביה","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3842','movie',3842,'{"id":3842,"title":"The Policeman''s Wife","director":"Philip Gröning","year":2013,"tmdb_id":210228,"imdb_id":"tt1734429","original_title":"Die Frau des Polizisten","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3843','movie',3843,'{"id":3843,"title":"The Rooftops","director":"Merzak Allouache","year":2013,"tmdb_id":216783,"imdb_id":"tt3177612","original_title":"Es-Stouh","original_language":"ar","alternate_titles":["Es-stouh (les terrasses)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3844','movie',3844,'{"id":3844,"title":"Joe","director":"David Gordon Green","year":2013,"tmdb_id":157847,"imdb_id":"tt2382396","original_title":"Joe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3845','movie',3845,'{"id":3845,"title":"Yema","director":"Djamila Sahraoui","year":2012,"tmdb_id":129117,"imdb_id":"tt1842435","original_title":"Yema","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3846','movie',3846,'{"id":3846,"title":"Jealousy","director":"Philippe Garrel","year":2013,"tmdb_id":216457,"imdb_id":"tt2511670","original_title":"La Jalousie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3847','movie',3847,'{"id":3847,"title":"It Was the Son","director":"Daniele Ciprì","year":2012,"tmdb_id":121998,"imdb_id":"tt1891788","original_title":"È stato il figlio","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3848','movie',3848,'{"id":3848,"title":"Child of God","director":"James Franco","year":2013,"tmdb_id":152736,"imdb_id":"tt1951095","original_title":"Child of God","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3849','movie',3849,'{"id":3849,"title":"Parkland","director":"Peter Landesman","year":2013,"tmdb_id":209262,"imdb_id":"tt2345112","original_title":"Parkland","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3850','movie',3850,'{"id":3850,"title":"Intrepido: A Lonely Hero","director":"Gianni Amelio","year":2013,"tmdb_id":209413,"imdb_id":"tt3074784","original_title":"L''intrepido","original_language":"it","alternate_titles":["The Intrepid"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3851','movie',3851,'{"id":3851,"title":"Stray Dogs","director":"Tsai Ming-liang","year":2013,"tmdb_id":209840,"imdb_id":"tt3119416","original_title":"郊遊","original_language":"zh","alternate_titles":["Jiaoyou"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3852','movie',3852,'{"id":3852,"title":"The Unknown Known","director":"Errol Morris","year":2013,"tmdb_id":209799,"imdb_id":"tt2390962","original_title":"The Unknown Known","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3853','movie',3853,'{"id":3853,"title":"Sacro GRA","director":"Gianfranco Rosi","year":2013,"tmdb_id":216790,"imdb_id":"tt3172520","original_title":"Sacro GRA","original_language":"it","alternate_titles":["Holy GRA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3854','movie',3854,'{"id":3854,"title":"Tom at the Farm","director":"Xavier Dolan","year":2013,"tmdb_id":184352,"imdb_id":"tt2427892","original_title":"Tom à la ferme","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3855','movie',3855,'{"id":3855,"title":"Miss Violence","director":"Alexandros Avranas","year":2013,"tmdb_id":211052,"imdb_id":"tt3078242","original_title":"Miss Violence","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3856','movie',3856,'{"id":3856,"title":"A Street in Palermo","director":"Emma Dante","year":2013,"tmdb_id":216788,"imdb_id":"tt1966637","original_title":"Via Castellana Bandiera","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3857','movie',3857,'{"id":3857,"title":"Il terzo tempo","director":"Enrico Maria Artale","year":2013,"tmdb_id":238925,"imdb_id":"tt2759292","original_title":"Il terzo tempo","original_language":"it","alternate_titles":["The Third Half"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3858','movie',3858,'{"id":3858,"title":"Some Girls","director":"Santiago Palavecino","year":2013,"tmdb_id":210054,"imdb_id":"tt2972058","original_title":"Algunas chicas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3859','movie',3859,'{"id":3859,"title":"My Name Is Hmmm...","director":"Agnès B.","year":2013,"tmdb_id":219055,"imdb_id":"tt2325761","original_title":"Je m''appelle Hmmm...","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3860','movie',3860,'{"id":3860,"title":"Night Moves","director":"Kelly Reichardt","year":2013,"tmdb_id":157823,"imdb_id":"tt2043933","original_title":"Night Moves","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3861','movie',3861,'{"id":3861,"title":"La prima neve","director":"Andrea Segre","year":2013,"tmdb_id":217479,"imdb_id":"tt3081374","original_title":"La prima neve","original_language":"it","alternate_titles":["First Snowfall"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3862','movie',3862,'{"id":3862,"title":"The Life After","director":"David Pablos","year":2013,"tmdb_id":217475,"imdb_id":"tt3174768","original_title":"La vida después","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3863','movie',3863,'{"id":3863,"title":"Medeas","director":"Andrea Pallaoro","year":2013,"tmdb_id":217471,"imdb_id":"tt2390630","original_title":"Medeas","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3864','movie',3864,'{"id":3864,"title":"Palo Alto","director":"Gia Coppola","year":2013,"tmdb_id":192132,"imdb_id":"tt2479800","original_title":"Palo Alto","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3865','movie',3865,'{"id":3865,"title":"Small Homeland","director":"Alessandro Rossetto","year":2013,"tmdb_id":217464,"imdb_id":"tt2622542","original_title":"Piccola patria","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3866','movie',3866,'{"id":3866,"title":"The Sacrament","director":"Ti West","year":2013,"tmdb_id":211067,"imdb_id":"tt2383068","original_title":"The Sacrament","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3867','movie',3867,'{"id":3867,"title":"Eastern Boys","director":"Robin Campillo","year":2013,"tmdb_id":214210,"imdb_id":"tt2991092","original_title":"Eastern Boys","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3868','movie',3868,'{"id":3868,"title":"We Are the Best!","director":"Lukas Moodysson","year":2013,"tmdb_id":191294,"imdb_id":"tt2364975","original_title":"Vi är bäst!","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3869','movie',3869,'{"id":3869,"title":"Wolf Children","director":"Rick Ostermann","year":2013,"tmdb_id":210052,"imdb_id":"tt2582320","original_title":"Wolfskinder","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3870','movie',3870,'{"id":3870,"title":"3 Hearts","director":"Benoît Jacquot","year":2014,"tmdb_id":283701,"imdb_id":"tt2822742","original_title":"3 cœurs","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3871','movie',3871,'{"id":3871,"title":"Still Life","director":"Uberto Pasolini","year":2013,"tmdb_id":216156,"imdb_id":"tt2395417","original_title":"Still Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3872','movie',3872,'{"id":3872,"title":"Black Souls","director":"Francesco Munzi","year":2014,"tmdb_id":283707,"imdb_id":"tt3894190","original_title":"Anime Nere","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3873','movie',3873,'{"id":3873,"title":"Red Amnesia","director":"Wang Xiaoshuai","year":2014,"tmdb_id":283711,"imdb_id":"tt3890278","original_title":"闯入者","original_language":"zh","alternate_titles":["Chuang ru zhe","Chuangru zhe"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3874','movie',3874,'{"id":3874,"title":"Good Kill","director":"Andrew Niccol","year":2014,"tmdb_id":253626,"imdb_id":"tt3297330","original_title":"Good Kill","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3875','movie',3875,'{"id":3875,"title":"Tales","director":"Rakhshan Banietemad","year":2014,"tmdb_id":283607,"imdb_id":"tt3526482","original_title":"قصه ها","original_language":"fa","alternate_titles":["Ghesse-ha","Ghesseha"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3876','movie',3876,'{"id":3876,"title":"Hungry Hearts","director":"Saverio Costanzo","year":2014,"tmdb_id":283698,"imdb_id":"tt3344922","original_title":"Hungry Hearts","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3877','movie',3877,'{"id":3877,"title":"Leopardi","director":"Mario Martone","year":2014,"tmdb_id":283704,"imdb_id":"tt3152602","original_title":"Il giovane favoloso","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3878','movie',3878,'{"id":3878,"title":"Ruin","director":"Amiel Courtin-Wilson, Michael Cody","year":2013,"tmdb_id":217474,"imdb_id":"tt3136252","original_title":"Ruin","original_language":"km","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3879','movie',3879,'{"id":3879,"title":"The Price of Fame","director":"Xavier Beauvois","year":2014,"tmdb_id":263118,"imdb_id":"tt3194410","original_title":"La Rançon de la gloire","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3880','movie',3880,'{"id":3880,"title":"Manglehorn","director":"David Gordon Green","year":2014,"tmdb_id":254905,"imdb_id":"tt2893490","original_title":"Manglehorn","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3881','movie',3881,'{"id":3881,"title":"Pasolini","director":"Abel Ferrara","year":2014,"tmdb_id":283700,"imdb_id":"tt3125652","original_title":"Pasolini","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3882','movie',3882,'{"id":3882,"title":"Fires on the Plain","director":"Shinya Tsukamoto","year":2014,"tmdb_id":283710,"imdb_id":"tt3893038","original_title":"野火","original_language":"ja","alternate_titles":["Nobi (Fires on the Plain)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3883','movie',3883,'{"id":3883,"title":"The Last Hammer Blow","director":"Alix Delaporte","year":2014,"tmdb_id":283699,"imdb_id":"tt3227712","original_title":"Le Dernier coup de marteau","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3884','movie',3884,'{"id":3884,"title":"Sivas","director":"Kaan Müjdeci","year":2014,"tmdb_id":283706,"imdb_id":"tt3894344","original_title":"Sivas","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3885','movie',3885,'{"id":3885,"title":"Belluscone: A Sicilian Story","director":"Franco Maresco","year":2014,"tmdb_id":290643,"imdb_id":"tt3922200","original_title":"Belluscone - Una storia siciliana","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3886','movie',3886,'{"id":3886,"title":"Court","director":"Chaitanya Tamhane","year":2014,"tmdb_id":290815,"imdb_id":"tt3717068","original_title":"Court","original_language":"mr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3887','movie',3887,'{"id":3887,"title":"Cymbeline","director":"Michael Almereyda","year":2014,"tmdb_id":240745,"imdb_id":"tt3093522","original_title":"Cymbeline","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3888','movie',3888,'{"id":3888,"title":"Goodnight Mommy","director":"Severin Fiala, Veronika Franz","year":2014,"tmdb_id":284303,"imdb_id":"tt3086442","original_title":"Ich seh, Ich seh","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3889','movie',3889,'{"id":3889,"title":"Jackie & Ryan","director":"Ami Canaan Mann","year":2014,"tmdb_id":289891,"imdb_id":"tt3270108","original_title":"Jackie & Ryan","original_language":"en","alternate_titles":["Love Me Like You Do"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3890','movie',3890,'{"id":3890,"title":"Bypass","director":"Duane Hopkins","year":2014,"tmdb_id":234197,"imdb_id":"tt2990816","original_title":"Bypass","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3891','movie',3891,'{"id":3891,"title":"The Cut","director":"Fatih Akin","year":2014,"tmdb_id":250230,"imdb_id":"tt2245171","original_title":"The Cut","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3892','movie',3892,'{"id":3892,"title":"Line of Credit","director":"Salomé Alexi","year":2014,"tmdb_id":291878,"imdb_id":"tt3893542","original_title":"კრედიტის ლიმიტი","original_language":"ka","alternate_titles":["Kreditis limiti"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3893','movie',3893,'{"id":3893,"title":"Far from Men","director":"David Oelhoffen","year":2014,"tmdb_id":283708,"imdb_id":"tt2936180","original_title":"Loin des hommes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3894','movie',3894,'{"id":3894,"title":"La vita oscena","director":"Renato De Maria","year":2014,"tmdb_id":289223,"imdb_id":"tt3438720","original_title":"La vita oscena","original_language":"it","alternate_titles":["An Obscene Life"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3895','movie',3895,'{"id":3895,"title":"Senza nessuna pietà","director":"Michele Alhaique","year":2014,"tmdb_id":286306,"imdb_id":"tt3890914","original_title":"Senza nessuna pietà","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3896','movie',3896,'{"id":3896,"title":"These Are the Rules","director":"Ognjen Sviličić","year":2014,"tmdb_id":289483,"imdb_id":"tt1905003","original_title":"Takva su pravila","original_language":"hr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3897','movie',3897,'{"id":3897,"title":"Hill of Freedom","director":"Hong Sang-soo","year":2014,"tmdb_id":284135,"imdb_id":"tt3732252","original_title":"자유의 언덕","original_language":"ko","alternate_titles":["Jayuui Eondeok","Jayuui Onduk"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3898','movie',3898,'{"id":3898,"title":"The President","director":"Mohsen Makhmalbaf","year":2014,"tmdb_id":289174,"imdb_id":"tt3966942","original_title":"The President","original_language":"ka","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3899','movie',3899,'{"id":3899,"title":"A Bigger Splash","director":"Luca Guadagnino","year":2015,"tmdb_id":324807,"imdb_id":"tt2056771","original_title":"A Bigger Splash","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3900','movie',3900,'{"id":3900,"title":"11 Minutes","director":"Jerzy Skolimowski","year":2015,"tmdb_id":314371,"imdb_id":"tt3865478","original_title":"11 minut","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3901','movie',3901,'{"id":3901,"title":"Reality","director":"Quentin Dupieux","year":2014,"tmdb_id":179150,"imdb_id":"tt2392672","original_title":"Réalité","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3902','movie',3902,'{"id":3902,"title":"Frenzy","director":"Emin Alper","year":2015,"tmdb_id":352196,"imdb_id":"tt4895740","original_title":"Abluka","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3903','movie',3903,'{"id":3903,"title":"Francofonia","director":"Aleksandr Sokurov","year":2015,"tmdb_id":296449,"imdb_id":"tt3451720","original_title":"Francofonia","original_language":"fr","alternate_titles":["Francofonia: An Elegy for Europe"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3904','movie',3904,'{"id":3904,"title":"Heart of a Dog","director":"Laurie Anderson","year":2015,"tmdb_id":352197,"imdb_id":"tt4935446","original_title":"Heart of a Dog","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3905','movie',3905,'{"id":3905,"title":"The Clan","director":"Pablo Trapero","year":2015,"tmdb_id":352161,"imdb_id":"tt4411504","original_title":"El clan","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3906','movie',3906,'{"id":3906,"title":"Equals","director":"Drake Doremus","year":2015,"tmdb_id":301875,"imdb_id":"tt3289728","original_title":"Equals","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3907','movie',3907,'{"id":3907,"title":"Courted","director":"Christian Vincent","year":2015,"tmdb_id":329809,"imdb_id":"tt4216908","original_title":"L''Hermine","original_language":"fr","alternate_titles":["The Stoat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3908','movie',3908,'{"id":3908,"title":"Marguerite","director":"Xavier Giannoli","year":2015,"tmdb_id":352157,"imdb_id":"tt4428788","original_title":"Marguerite","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3909','movie',3909,'{"id":3909,"title":"Rabin, the Last Day","director":"Amos Gitai","year":2015,"tmdb_id":352200,"imdb_id":"tt4935282","original_title":"רבין: היום האחרון","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3910','movie',3910,'{"id":3910,"title":"The Wait","director":"Piero Messina","year":2015,"tmdb_id":330348,"imdb_id":"tt3715122","original_title":"L''attesa","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3911','movie',3911,'{"id":3911,"title":"Remember","director":"Atom Egoyan","year":2015,"tmdb_id":302528,"imdb_id":"tt3704050","original_title":"Remember","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3912','movie',3912,'{"id":3912,"title":"From Afar","director":"Lorenzo Vigas","year":2015,"tmdb_id":352162,"imdb_id":"tt4721400","original_title":"Desde allá","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3913','movie',3913,'{"id":3913,"title":"A Copy of My Mind","director":"Joko Anwar","year":2015,"tmdb_id":358909,"imdb_id":"tt4911656","original_title":"A Copy of My Mind","original_language":"id","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3914','movie',3914,'{"id":3914,"title":"Behemoth","director":"Zhao Liang","year":2015,"tmdb_id":352202,"imdb_id":"tt4901304","original_title":"悲兮魔兽","original_language":"zh","alternate_titles":["Beixi Moshuo","Beixi Moshuo (Behemoth)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3915','movie',3915,'{"id":3915,"title":"Free in Deed","director":"Jake Mahaffy","year":2015,"tmdb_id":359666,"imdb_id":"tt3510304","original_title":"Free in Deed","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3916','movie',3916,'{"id":3916,"title":"The Endless River","director":"Oliver Hermanus","year":2015,"tmdb_id":352159,"imdb_id":"tt4467154","original_title":"The Endless River","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3917','movie',3917,'{"id":3917,"title":"Italian Gangsters","director":"Renato De Maria","year":2015,"tmdb_id":358983,"imdb_id":"tt4986288","original_title":"Italian Gangsters","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3918','movie',3918,'{"id":3918,"title":"Wednesday, May 9","director":"Vahid Jalilvand","year":2015,"tmdb_id":359257,"imdb_id":"tt4944924","original_title":"چهارشنبه ۱۹ اردیبهشت","original_language":"fa","alternate_titles":["Chaharshanbeh, 19 Ordibehesht"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3919','movie',3919,'{"id":3919,"title":"Why Hast Thou Forsaken Me","director":"Hadar Morag","year":2015,"tmdb_id":359545,"imdb_id":"tt4991396","original_title":"Lama Azavtani","original_language":"he","alternate_titles":["Lama Azavtani (Why hast thou forsaken me)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3920','movie',3920,'{"id":3920,"title":"Madame Courage","director":"Merzak Allouache","year":2015,"tmdb_id":358759,"imdb_id":"tt4076766","original_title":"مدام كوراج","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3921','movie',3921,'{"id":3921,"title":"Man Down","director":"Dito Montiel","year":2015,"tmdb_id":296523,"imdb_id":"tt2461520","original_title":"Man Down","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3922','movie',3922,'{"id":3922,"title":"Kill Me Please","director":"Anita Rocha da Silveira","year":2015,"tmdb_id":359429,"imdb_id":"tt3583538","original_title":"Mate-me Por Favor","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3923','movie',3923,'{"id":3923,"title":"Neon Bull","director":"Gabriel Mascaro","year":2015,"tmdb_id":314029,"imdb_id":"tt4899406","original_title":"Boi Neon","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3924','movie',3924,'{"id":3924,"title":"Burning Love","director":"Alberto Caviglia","year":2015,"tmdb_id":359256,"imdb_id":"tt4944906","original_title":"Pecore in erba","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3925','movie',3925,'{"id":3925,"title":"Taj Mahal","director":"Nicolas Saada","year":2015,"tmdb_id":358403,"imdb_id":"tt4213764","original_title":"Taj Mahal","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3926','movie',3926,'{"id":3926,"title":"Blood of My Blood","director":"Marco Bellocchio","year":2015,"tmdb_id":314400,"imdb_id":"tt2922590","original_title":"Sangue del mio sangue","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3927','movie',3927,'{"id":3927,"title":"Land Legs","director":"Samuel Collardey","year":2015,"tmdb_id":359770,"imdb_id":"tt3757648","original_title":"Tempête","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3928','movie',3928,'{"id":3928,"title":"The Childhood of a Leader","director":"Brady Corbet","year":2015,"tmdb_id":330982,"imdb_id":"tt2815902","original_title":"The Childhood of a Leader","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3929','movie',3929,'{"id":3929,"title":"Tharlo","director":"Pema Tseden","year":2015,"tmdb_id":358808,"imdb_id":"tt4923042","original_title":"ཐར་ལོ།","original_language":"bo","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3930','movie',3930,'{"id":3930,"title":"Coriolanus","director":"Ralph Fiennes","year":2010,"tmdb_id":101173,"imdb_id":"tt1372686","original_title":"Coriolanus","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3931','movie',3931,'{"id":3931,"title":"A Monster with a Thousand Heads","director":"Rodrigo Plá","year":2015,"tmdb_id":296865,"imdb_id":"tt4569240","original_title":"Un monstruo de mil cabezas","original_language":"es","alternate_titles":["A Monster with Thousand Heads"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3932','movie',3932,'{"id":3932,"title":"Tales of the Night","director":"Michel Ocelot","year":2011,"tmdb_id":79000,"imdb_id":"tt1828229","original_title":"Les Contes de la nuit","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3933','movie',3933,'{"id":3933,"title":"The Turin Horse","director":"Béla Tarr","year":2010,"tmdb_id":81401,"imdb_id":"tt1316540","original_title":"A torinói ló","original_language":"hu","alternate_titles":["Das Turiner Pferd"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3934','movie',3934,'{"id":3934,"title":"Lipstikka","director":"Jonathan Sagall","year":2010,"tmdb_id":128593,"imdb_id":"tt1374988","original_title":"אודם","original_language":"he","alternate_titles":["Odem"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3935','movie',3935,'{"id":3935,"title":"Sleeping Sickness","director":"Ulrich Köhler","year":2011,"tmdb_id":70768,"imdb_id":"tt1822304","original_title":"Schlafkrankheit","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3936','movie',3936,'{"id":3936,"title":"The Forgiveness of Blood","director":"Joshua Marston","year":2010,"tmdb_id":82624,"imdb_id":"tt1787127","original_title":"The Forgiveness of Blood","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3937','movie',3937,'{"id":3937,"title":"Come Rain, Come Shine","director":"Lee Yoon-ki","year":2011,"tmdb_id":65847,"imdb_id":"tt1832453","original_title":"사랑한다, 사랑하지 않는다","original_language":"ko","alternate_titles":["Saranghanda, Saranghaji Anneunda","Kommt Regen, kommt Sonnenschein"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3938','movie',3938,'{"id":3938,"title":"Our Grand Despair","director":"Seyfi Teoman","year":2010,"tmdb_id":69352,"imdb_id":"tt1309178","original_title":"Bizim Büyük Çaresizliğimiz","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3939','movie',3939,'{"id":3939,"title":"The Future","director":"Miranda July","year":2011,"tmdb_id":54662,"imdb_id":"tt1235170","original_title":"The Future","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3940','movie',3940,'{"id":3940,"title":"If Not Us, Who?","director":"Andres Veiel","year":2011,"tmdb_id":73132,"imdb_id":"tt1671496","original_title":"Wer wenn nicht wir","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3941','movie',3941,'{"id":3941,"title":"A Mysterious World","director":"Rodrigo Moreno","year":2011,"tmdb_id":155382,"imdb_id":"tt1235855","original_title":"Un mundo misterioso","original_language":"es","alternate_titles":["Rätselhafte Welt"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3942','movie',3942,'{"id":3942,"title":"Yelling To The Sky","director":"Victoria Mahoney","year":2010,"tmdb_id":150065,"imdb_id":"tt1504508","original_title":"Yelling To The Sky","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3943','movie',3943,'{"id":3943,"title":"Interruption","director":"Yorgos Zois","year":2015,"tmdb_id":359373,"imdb_id":"tt4991590","original_title":"Interruption","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3944','movie',3944,'{"id":3944,"title":"White Deer Plain","director":"Wang Quan''an","year":2011,"tmdb_id":139162,"imdb_id":"tt1727396","original_title":"白鹿原","original_language":"zh","alternate_titles":["Bai lu yuan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3945','movie',3945,'{"id":3945,"title":"Barbara","director":"Christian Petzold","year":2012,"tmdb_id":88284,"imdb_id":"tt2178941","original_title":"Barbara","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3946','movie',3946,'{"id":3946,"title":"Coming Home","director":"Frédéric Videau","year":2011,"tmdb_id":139159,"imdb_id":"tt2194497","original_title":"À moi seule","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3947','movie',3947,'{"id":3947,"title":"Today","director":"Alain Gomis","year":2011,"tmdb_id":110381,"imdb_id":"tt2178935","original_title":"Aujourd''hui","original_language":"fr","alternate_titles":["Tey"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3948','movie',3948,'{"id":3948,"title":"Jayne Mansfield''s Car","director":"Billy Bob Thornton","year":2011,"tmdb_id":94671,"imdb_id":"tt1781840","original_title":"Jayne Mansfield''s Car","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3949','movie',3949,'{"id":3949,"title":"Childish Games","director":"Antonio Chavarrías","year":2011,"tmdb_id":120194,"imdb_id":"tt1734428","original_title":"Dictado","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3950','movie',3950,'{"id":3950,"title":"Sister","director":"Ursula Meier","year":2012,"tmdb_id":102000,"imdb_id":"tt2062969","original_title":"L''enfant d''en haut","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3951','movie',3951,'{"id":3951,"title":"Farewell, My Queen","director":"Benoît Jacquot","year":2011,"tmdb_id":99579,"imdb_id":"tt1753813","original_title":"Les Adieux à la reine","original_language":"fr","alternate_titles":["Leb wohl, meine Königin!"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3952','movie',3952,'{"id":3952,"title":"The Prize","director":"Paula Markovitch","year":2010,"tmdb_id":107073,"imdb_id":"tt1525346","original_title":"El premio","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3953','movie',3953,'{"id":3953,"title":"Metéora","director":"Spiros Stathoulopoulos","year":2012,"tmdb_id":137179,"imdb_id":"tt2180473","original_title":"Μετέωρα","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3954','movie',3954,'{"id":3954,"title":"Postcards from the Zoo","director":"Edwin","year":2012,"tmdb_id":138254,"imdb_id":"tt2073058","original_title":"Kebun Binatang","original_language":"id","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3955','movie',3955,'{"id":3955,"title":"Home for the Weekend","director":"Hans-Christian Schmid","year":2012,"tmdb_id":88249,"imdb_id":"tt2180587","original_title":"Was bleibt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3956','movie',3956,'{"id":3956,"title":"Tabu","director":"Miguel Gomes","year":2012,"tmdb_id":93858,"imdb_id":"tt2153963","original_title":"Tabu","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3957','movie',3957,'{"id":3957,"title":"Camille Claudel 1915","director":"Bruno Dumont","year":2012,"tmdb_id":110428,"imdb_id":"tt2018086","original_title":"Camille Claudel 1915","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3958','movie',3958,'{"id":3958,"title":"Mercy","director":"Matthias Glasner","year":2012,"tmdb_id":124529,"imdb_id":"tt2179055","original_title":"Gnade","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3959','movie',3959,'{"id":3959,"title":"An Episode in the Life of an Iron Picker","director":"Danis Tanović","year":2013,"tmdb_id":159942,"imdb_id":"tt2507592","original_title":"Epizoda u životu berača željeza","original_language":"bs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3960','movie',3960,'{"id":3960,"title":"Gloria","director":"Sebastián Lelio","year":2012,"tmdb_id":160068,"imdb_id":"tt2425486","original_title":"Gloria","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3961','movie',3961,'{"id":3961,"title":"Gold","director":"Thomas Arslan","year":2013,"tmdb_id":159344,"imdb_id":"tt2338846","original_title":"Gold","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3962','movie',3962,'{"id":3962,"title":"A Long and Happy Life","director":"Boris Khlebnikov","year":2013,"tmdb_id":160124,"imdb_id":"tt2650954","original_title":"Долгая счастливая жизнь","original_language":"ru","alternate_titles":["Dolgaya schastlivaya zhizn"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3963','movie',3963,'{"id":3963,"title":"Layla Fourie","director":"Pia Marais","year":2013,"tmdb_id":160045,"imdb_id":"tt2296835","original_title":"Layla Fourie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3964','movie',3964,'{"id":3964,"title":"The Nun","director":"Guillaume Nicloux","year":2012,"tmdb_id":159967,"imdb_id":"tt2215221","original_title":"La Religieuse","original_language":"fr","alternate_titles":["Die Nonne"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3965','movie',3965,'{"id":3965,"title":"Prince Avalanche","director":"David Gordon Green","year":2013,"tmdb_id":113148,"imdb_id":"tt2195548","original_title":"Prince Avalanche","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3966','movie',3966,'{"id":3966,"title":"Promised Land","director":"Gus Van Sant","year":2012,"tmdb_id":133694,"imdb_id":"tt2091473","original_title":"Promised Land","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3967','movie',3967,'{"id":3967,"title":"Side Effects","director":"Steven Soderbergh","year":2013,"tmdb_id":109421,"imdb_id":"tt2053463","original_title":"Side Effects","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3968','movie',3968,'{"id":3968,"title":"Paradise: Hope","director":"Ulrich Seidl","year":2013,"tmdb_id":150897,"imdb_id":"tt2371834","original_title":"Paradies: Hoffnung","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3969','movie',3969,'{"id":3969,"title":"Harmony Lessons","director":"Emir Baigazin","year":2013,"tmdb_id":160156,"imdb_id":"tt2385101","original_title":"Уроки гармонии","original_language":"kk","alternate_titles":["Uroki Garmonii"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3970','movie',3970,'{"id":3970,"title":"Vic + Flo Saw a Bear","director":"Denis Côté","year":2013,"tmdb_id":160160,"imdb_id":"tt2385882","original_title":"Vic + Flo ont vu un ours","original_language":"fr","alternate_titles":["Vic+Flo haben einen Bären gesehen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3971','movie',3971,'{"id":3971,"title":"On My Way","director":"Emmanuelle Bercot","year":2013,"tmdb_id":157690,"imdb_id":"tt2289538","original_title":"Elle s''en va","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3972','movie',3972,'{"id":3972,"title":"Life of Riley","director":"Alain Resnais","year":2013,"tmdb_id":255824,"imdb_id":"tt2751390","original_title":"Aimer, boire et chanter","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3973','movie',3973,'{"id":3973,"title":"Aloft","director":"Claudia Llosa","year":2013,"tmdb_id":251321,"imdb_id":"tt2494384","original_title":"Aloft","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3974','movie',3974,'{"id":3974,"title":"Beloved Sisters","director":"Dominik Graf","year":2014,"tmdb_id":248934,"imdb_id":"tt2790236","original_title":"Die geliebten Schwestern","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3975','movie',3975,'{"id":3975,"title":"Jack","director":"Edward Berger","year":2014,"tmdb_id":254323,"imdb_id":"tt3469918","original_title":"Jack","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3976','movie',3976,'{"id":3976,"title":"The Little House","director":"Yoji Yamada","year":2014,"tmdb_id":254679,"imdb_id":"tt2530392","original_title":"小さいおうち","original_language":"ja","alternate_titles":["Chiisai Ouchi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3977','movie',3977,'{"id":3977,"title":"In Order of Disappearance","director":"Hans Petter Moland","year":2013,"tmdb_id":252822,"imdb_id":"tt2675914","original_title":"Kraftidioten","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3978','movie',3978,'{"id":3978,"title":"Child''s Pose","director":"Călin Peter Netzer","year":2012,"tmdb_id":160118,"imdb_id":"tt2187115","original_title":"Poziţia copilului","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3979','movie',3979,'{"id":3979,"title":"The Third Side of the River","director":"Celina Murga","year":2014,"tmdb_id":255482,"imdb_id":"tt1964860","original_title":"La tercera orilla","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3980','movie',3980,'{"id":3980,"title":"Two Men in Town","director":"Rachid Bouchareb","year":2013,"tmdb_id":254772,"imdb_id":"tt2258285","original_title":"La Voie de l‘ennemi","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3981','movie',3981,'{"id":3981,"title":"Nobody''s Daughter Haewon","director":"Hong Sang-soo","year":2013,"tmdb_id":160075,"imdb_id":"tt2576522","original_title":"누구의 딸도 아닌 해원","original_language":"ko","alternate_titles":["Nugu-ui Ttal-do Anin Haewon"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3982','movie',3982,'{"id":3982,"title":"History of Fear","director":"Benjamín Naishtat","year":2014,"tmdb_id":254719,"imdb_id":"tt2690718","original_title":"Historia del miedo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3983','movie',3983,'{"id":3983,"title":"Macondo","director":"Sudabeh Mortezai","year":2013,"tmdb_id":256021,"imdb_id":"tt3469960","original_title":"Macondo","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3984','movie',3984,'{"id":3984,"title":"Futuro Beach","director":"Karim Aïnouz","year":2013,"tmdb_id":227975,"imdb_id":"tt2199543","original_title":"Praia do Futuro","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3985','movie',3985,'{"id":3985,"title":"Inbetween Worlds","director":"Feo Aladag","year":2014,"tmdb_id":256108,"imdb_id":"tt3032028","original_title":"Zwischen Welten","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3986','movie',3986,'{"id":3986,"title":"Aferim!","director":"Radu Jude","year":2015,"tmdb_id":319993,"imdb_id":"tt4374460","original_title":"Aferim!","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3987','movie',3987,'{"id":3987,"title":"As We Were Dreaming","director":"Andreas Dresen","year":2015,"tmdb_id":311301,"imdb_id":"tt3306858","original_title":"Als wir träumten","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3988','movie',3988,'{"id":3988,"title":"Big Father, Small Father and Other Stories","director":"Phan Đăng Di","year":2014,"tmdb_id":320000,"imdb_id":"tt3867606","original_title":"Cha và con và…","original_language":"vi","alternate_titles":["Unsere sonnigen Tage"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3989','movie',3989,'{"id":3989,"title":"Stratos","director":"Yannis Economides","year":2014,"tmdb_id":254166,"imdb_id":"tt3259474","original_title":"Το Μικρό Ψάρι","original_language":"el","alternate_titles":["To mikro psari"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3990','movie',3990,'{"id":3990,"title":"No Man''s Land","director":"Ning Hao","year":2013,"tmdb_id":238811,"imdb_id":"tt1456660","original_title":"无人区","original_language":"zh","alternate_titles":["Wu Ren Qu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3991','movie',3991,'{"id":3991,"title":"Blind Massage","director":"Lou Ye","year":2014,"tmdb_id":256106,"imdb_id":"tt3469964","original_title":"推拿","original_language":"zh","alternate_titles":["Tui Na"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3992','movie',3992,'{"id":3992,"title":"Diary of a Chambermaid","director":"Benoît Jacquot","year":2015,"tmdb_id":320003,"imdb_id":"tt2711898","original_title":"Journal d''une femme de chambre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3993','movie',3993,'{"id":3993,"title":"Endless Night","director":"Isabel Coixet","year":2014,"tmdb_id":320004,"imdb_id":"tt2735996","original_title":"Nadie quiere la noche","original_language":"en","alternate_titles":["Nobody Wants the Night"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3994','movie',3994,'{"id":3994,"title":"Queen of the Desert","director":"Werner Herzog","year":2014,"tmdb_id":157843,"imdb_id":"tt1837636","original_title":"Queen of the Desert","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3995','movie',3995,'{"id":3995,"title":"The Pearl Button","director":"Patricio Guzmán","year":2015,"tmdb_id":319994,"imdb_id":"tt4377864","original_title":"El botón de nácar","original_language":"es","alternate_titles":["Der Perlmuttknopf"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3996','movie',3996,'{"id":3996,"title":"Eisenstein in Guanajuato","director":"Peter Greenaway","year":2014,"tmdb_id":121869,"imdb_id":"tt1702429","original_title":"Eisenstein in Guanajuato","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3997','movie',3997,'{"id":3997,"title":"Gone with the Bullets","director":"Jiang Wen","year":2014,"tmdb_id":312408,"imdb_id":"tt2168000","original_title":"一步之遥","original_language":"zh","alternate_titles":["Yi bu zhi yao"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3998','movie',3998,'{"id":3998,"title":"Ixcanul","director":"Jayro Bustamante","year":2015,"tmdb_id":320001,"imdb_id":"tt4135844","original_title":"Ixcanul","original_language":"es","alternate_titles":["Ixcanul Volcano"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:3999','movie',3999,'{"id":3999,"title":"Chasuke''s Journey","director":"Sabu","year":2014,"tmdb_id":319996,"imdb_id":"tt3560464","original_title":"天の茶助","original_language":"ja","alternate_titles":["Ten no chasuke"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4000','movie',4000,'{"id":4000,"title":"Sworn Virgin","director":"Laura Bispuri","year":2015,"tmdb_id":319998,"imdb_id":"tt3646344","original_title":"Vergine giurata","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4001','movie',4001,'{"id":4001,"title":"In Darkness","director":"Agnieszka Holland","year":2011,"tmdb_id":73686,"imdb_id":"tt1417075","original_title":"W ciemności","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4002','movie',4002,'{"id":4002,"title":"Outside the Law","director":"Rachid Bouchareb","year":2010,"tmdb_id":47904,"imdb_id":"tt1229381","original_title":"Hors-la-loi","original_language":"fr","alternate_titles":["Outside the Law (Hors-la-loi)","Outside of the Law"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4003','movie',4003,'{"id":4003,"title":"No","director":"Pablo Larraín","year":2012,"tmdb_id":110398,"imdb_id":"tt2059255","original_title":"No","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4004','movie',4004,'{"id":4004,"title":"Five Broken Cameras","director":"Guy Davidi, Emad Burnat","year":2011,"tmdb_id":84170,"imdb_id":"tt2125423","original_title":"Five Broken Cameras","original_language":"en","alternate_titles":["5 Broken Cameras"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4005','movie',4005,'{"id":4005,"title":"Omar","director":"Hany Abu-Assad","year":2013,"tmdb_id":187028,"imdb_id":"tt2852406","original_title":"عمر","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4006','movie',4006,'{"id":4006,"title":"Anna Karenina","director":"Joe Wright","year":2012,"tmdb_id":96724,"imdb_id":"tt1781769","original_title":"Anna Karenina","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4007','movie',4007,'{"id":4007,"title":"The Edge","director":"Alexey Uchitel","year":2010,"tmdb_id":47557,"imdb_id":"tt1706414","original_title":"Край","original_language":"ru","alternate_titles":["Kray","Edge of War"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4008','movie',4008,'{"id":4008,"title":"11.25 The Day He Chose His Own Fate","director":"Kōji Wakamatsu","year":2012,"tmdb_id":103870,"imdb_id":"tt1728686","original_title":"11・25自決の日　三島由紀夫と若者たち","original_language":"ja","alternate_titles":["11.25 JIKETSU NO HI, MISHIMA YUKIO TO WAKAMONOTACHI","11/25 THE DAY MISHIMA CHOSE HIS OWN FATE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4009','movie',4009,'{"id":4009,"title":"La playa DC","director":"Juan Andrés Arango Garcia","year":2012,"tmdb_id":133878,"imdb_id":"tt2369025","original_title":"La playa DC","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4010','movie',4010,'{"id":4010,"title":"Mystery","director":"Lou Ye","year":2012,"tmdb_id":103875,"imdb_id":"tt2369127","original_title":"浮城谜事","original_language":"zh","alternate_titles":["Fu cheng mi shi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4011','movie',4011,'{"id":4011,"title":"Run","director":"Philippe Lacôte","year":2014,"tmdb_id":266062,"imdb_id":"tt2375473","original_title":"Run","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4012','movie',4012,'{"id":4012,"title":"Alias Maria","director":"José Luis Rugeles","year":2015,"tmdb_id":337115,"imdb_id":"tt3685554","original_title":"Alias María","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4013','movie',4013,'{"id":4013,"title":"The Hunter","director":"Bakur Bakuradze","year":2011,"tmdb_id":162980,"imdb_id":"tt1922675","original_title":"Охотник","original_language":"ru","alternate_titles":["OKHOTNIK"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4014','movie',4014,'{"id":4014,"title":"The Disappearance of Eleanor Rigby: Them","director":"Ned Benson","year":2014,"tmdb_id":157829,"imdb_id":"tt3729920","original_title":"The Disappearance of Eleanor Rigby: Them","original_language":"en","alternate_titles":["THE DISAPPEARANCE OF ELEANOR RIGBY"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4015','movie',4015,'{"id":4015,"title":"Taklub","director":"Brillante Ma Mendoza","year":2015,"tmdb_id":334876,"imdb_id":"tt4636000","original_title":"Taklub","original_language":"tl","alternate_titles":["Trap"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4016','movie',4016,'{"id":4016,"title":"Alps","director":"Yorgos Lanthimos","year":2011,"tmdb_id":81857,"imdb_id":"tt1859446","original_title":"Άλπεις","original_language":"el","alternate_titles":["Alpeis","Alpis"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4017','movie',4017,'{"id":4017,"title":"Himizu","director":"Sion Sono","year":2011,"tmdb_id":98631,"imdb_id":"tt1900893","original_title":"ヒミズ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4018','movie',4018,'{"id":4018,"title":"Cut","director":"Amir Naderi","year":2011,"tmdb_id":172489,"imdb_id":"tt1720905","original_title":"Cut","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4019','movie',4019,'{"id":4019,"title":"I''m Carolyn Parker","director":"Jonathan Demme","year":2011,"tmdb_id":120822,"imdb_id":"tt1872083","original_title":"I''m Carolyn Parker","original_language":"en","alternate_titles":["I''m Carolyn Parker: the good, the mad and the beautiful","I''m Carolyn Parker: The Good, the Mad, and the Beautiful"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4020','movie',4020,'{"id":4020,"title":"Cemetery of Splendor","director":"Apichatpong Weerasethakul","year":2015,"tmdb_id":298721,"imdb_id":"tt2818654","original_title":"รักที่ขอนแก่น","original_language":"th","alternate_titles":["RAK TI KHON KAEN","CEMETERY OF SPLENDOUR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4021','movie',4021,'{"id":4021,"title":"The Paternal House","director":"Kianush Ayyari","year":2012,"tmdb_id":182829,"imdb_id":"tt2420018","original_title":"خانه پدری","original_language":"fa","alternate_titles":["Khaneh Pedari"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4022','movie',4022,'{"id":4022,"title":"Little Brother","director":"Serik Aprimov","year":2013,"tmdb_id":217478,"imdb_id":"tt2902176","original_title":"Bauyr","original_language":"kk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4023','movie',4023,'{"id":4023,"title":"Why Don''t You Play in Hell?","director":"Sion Sono","year":2013,"tmdb_id":134350,"imdb_id":"tt2409302","original_title":"地獄でなぜ悪い","original_language":"ja","alternate_titles":["Jigoku de naze warui"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4024','movie',4024,'{"id":4024,"title":"Three Sisters","director":"Wang Bing","year":2012,"tmdb_id":128230,"imdb_id":"tt2361042","original_title":"三姊妹","original_language":"zh","alternate_titles":["San Zi Mei","San zimei"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4025','movie',4025,'{"id":4025,"title":"Fish & Cat","director":"Shahram Mokri","year":2013,"tmdb_id":243884,"imdb_id":"tt3257072","original_title":"ماهی و گربه","original_language":"fa","alternate_titles":["Mahi va gorbeh","Fish and cat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4026','movie',4026,'{"id":4026,"title":"Tracks","director":"John Curran","year":2013,"tmdb_id":203819,"imdb_id":"tt2167266","original_title":"Tracks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4027','movie',4027,'{"id":4027,"title":"Heaven Knows What","director":"Josh Safdie, Benny Safdie","year":2014,"tmdb_id":285024,"imdb_id":"tt3687186","original_title":"Heaven Knows What","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4028','movie',4028,'{"id":4028,"title":"Near Death Experience","director":"Benoît Delépine, Gustave Kervern","year":2014,"tmdb_id":290158,"imdb_id":"tt3800012","original_title":"Near Death Experience","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4029','movie',4029,'{"id":4029,"title":"Nabat","director":"Elchin Guliyev","year":2014,"tmdb_id":292359,"imdb_id":"tt3977898","original_title":"Nabat","original_language":"az","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4030','movie',4030,'{"id":4030,"title":"Looking for Grace","director":"Sue Brooks","year":2015,"tmdb_id":352156,"imdb_id":"tt4000936","original_title":"Looking for Grace","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4031','movie',4031,'{"id":4031,"title":"For Your Love","director":"Giuseppe M. Gaudino","year":2015,"tmdb_id":352199,"imdb_id":"tt4898888","original_title":"Per amor vostro","original_language":"it","alternate_titles":["Anna"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4032','movie',4032,'{"id":4032,"title":"Visaranai","director":"Vetrimaaran","year":2015,"tmdb_id":372226,"imdb_id":"tt4991384","original_title":"விசாரணை","original_language":"ta","alternate_titles":["Visaaranai","Interrogation"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4033','movie',4033,'{"id":4033,"title":"Mountain","director":"Yaelle Kayam","year":2015,"tmdb_id":358899,"imdb_id":"tt4917622","original_title":"ההר","original_language":"he","alternate_titles":["Ha''har"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4034','movie',4034,'{"id":4034,"title":"Innocent Saturday","director":"Aleksandr Mindadze","year":2011,"tmdb_id":64744,"imdb_id":"tt1838560","original_title":"В субботу","original_language":"ru","alternate_titles":["V Subbotu","An einem Samstag"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4035','movie',4035,'{"id":4035,"title":"Captive","director":"Brillante Ma Mendoza","year":2011,"tmdb_id":98203,"imdb_id":"tt1699745","original_title":"Captive","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4036','movie',4036,'{"id":4036,"title":"Just the Wind","director":"Benedek Fliegauf","year":2012,"tmdb_id":110383,"imdb_id":"tt2180335","original_title":"Csak a szél","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4037','movie',4037,'{"id":4037,"title":"Closed Curtain","director":"Kambuzia Partovi, Jafar Panahi","year":2013,"tmdb_id":160171,"imdb_id":"tt2626926","original_title":"پرده","original_language":"fa","alternate_titles":["Pardé"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4038','movie',4038,'{"id":4038,"title":"In the Name of...","director":"Małgorzata Szumowska","year":2012,"tmdb_id":160165,"imdb_id":"tt2650642","original_title":"W imię...","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4039','movie',4039,'{"id":4039,"title":"Charlie Countryman","director":"Fredrik Bond","year":2013,"tmdb_id":41602,"imdb_id":"tt1196948","original_title":"Charlie Countryman","original_language":"en","alternate_titles":["The Necessary Death of Charlie Countryman"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4040','movie',4040,'{"id":4040,"title":"Student","director":"Darezhan Omirbayev","year":2012,"tmdb_id":124103,"imdb_id":"tt2369333","original_title":"Студент","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4041','movie',4041,'{"id":4041,"title":"Body","director":"Małgorzata Szumowska","year":2015,"tmdb_id":319999,"imdb_id":"tt4358230","original_title":"Body/Ciało","original_language":"pl","alternate_titles":["Ciało","Cialo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4042','movie',4042,'{"id":4042,"title":"A Simple Life","director":"Ann Hui","year":2011,"tmdb_id":91186,"imdb_id":"tt2008006","original_title":"桃姐","original_language":"cn","alternate_titles":["Taojie","Tou ze"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4043','movie',4043,'{"id":4043,"title":"Thy Womb","director":"Brillante Ma Mendoza","year":2012,"tmdb_id":122080,"imdb_id":"tt2395459","original_title":"Sinapupunan","original_language":"tl","alternate_titles":["Sinapupunan (Thy Womb)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4044','movie',4044,'{"id":4044,"title":"George Harrison: Living in the Material World","director":"Martin Scorsese","year":2011,"tmdb_id":null,"tmdb_tv_id":43107,"imdb_id":"tt1113829","identity_status":"reviewed_complete_film_tv_provider","identity_scope":"complete-film","identity_sources":["https://www.georgeharrison.com/london-premiere-of-george-documentary-on-sunday-2nd-october/","https://tv.apple.com/us/movie/george-harrison-living-in-the-material-world/umc.cmc.22gunbi1g7j5hpk3rolicxy6t"],"original_title":"George Harrison: Living in the Material World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:39781','movie:3489') on conflict do nothing;
insert into public.media_provider_links values('movie:44115','movie:3490') on conflict do nothing;
insert into public.media_provider_links values('movie:46705','movie:3491') on conflict do nothing;
insert into public.media_provider_links values('movie:27585','movie:3492') on conflict do nothing;
insert into public.media_provider_links values('movie:44629','movie:3493') on conflict do nothing;
insert into public.media_provider_links values('movie:44009','movie:3494') on conflict do nothing;
insert into public.media_provider_links values('movie:44716','movie:3495') on conflict do nothing;
insert into public.media_provider_links values('movie:46738','movie:3496') on conflict do nothing;
insert into public.media_provider_links values('movie:44639','movie:3497') on conflict do nothing;
insert into public.media_provider_links values('movie:39452','movie:3498') on conflict do nothing;
insert into public.media_provider_links values('movie:40663','movie:3499') on conflict do nothing;
insert into public.media_provider_links values('movie:39312','movie:3500') on conflict do nothing;
insert into public.media_provider_links values('movie:46689','movie:3501') on conflict do nothing;
insert into public.media_provider_links values('movie:65057','movie:3502') on conflict do nothing;
insert into public.media_provider_links values('movie:41201','movie:3503') on conflict do nothing;
insert into public.media_provider_links values('movie:57212','movie:3504') on conflict do nothing;
insert into public.media_provider_links values('movie:71688','movie:3505') on conflict do nothing;
insert into public.media_provider_links values('movie:23168','movie:3506') on conflict do nothing;
insert into public.media_provider_links values('movie:75900','movie:3507') on conflict do nothing;
insert into public.media_provider_links values('movie:55347','movie:3508') on conflict do nothing;
insert into public.media_provider_links values('movie:55720','movie:3509') on conflict do nothing;
insert into public.media_provider_links values('movie:50839','movie:3510') on conflict do nothing;
insert into public.media_provider_links values('movie:10316','movie:3511') on conflict do nothing;
insert into public.media_provider_links values('movie:73873','movie:3512') on conflict do nothing;
insert into public.media_provider_links values('movie:82620','movie:3513') on conflict do nothing;
insert into public.media_provider_links values('movie:74310','movie:3514') on conflict do nothing;
insert into public.media_provider_links values('movie:79042','movie:3515') on conflict do nothing;
insert into public.media_provider_links values('movie:83660','movie:3516') on conflict do nothing;
insert into public.media_provider_links values('movie:63310','movie:3517') on conflict do nothing;
insert into public.media_provider_links values('movie:57276','movie:3518') on conflict do nothing;
insert into public.media_provider_links values('movie:52264','movie:3519') on conflict do nothing;
insert into public.media_provider_links values('movie:78480','movie:3520') on conflict do nothing;
insert into public.media_provider_links values('movie:63498','movie:3521') on conflict do nothing;
insert into public.media_provider_links values('movie:72551','movie:3522') on conflict do nothing;
insert into public.media_provider_links values('movie:72976','movie:3523') on conflict do nothing;
insert into public.media_provider_links values('movie:97630','movie:3524') on conflict do nothing;
insert into public.media_provider_links values('movie:82695','movie:3525') on conflict do nothing;
insert into public.media_provider_links values('movie:84175','movie:3526') on conflict do nothing;
insert into public.media_provider_links values('movie:87502','movie:3527') on conflict do nothing;
insert into public.media_provider_links values('movie:80278','movie:3528') on conflict do nothing;
insert into public.media_provider_links values('movie:70667','movie:3529') on conflict do nothing;
insert into public.media_provider_links values('movie:49444','movie:3530') on conflict do nothing;
insert into public.media_provider_links values('movie:88273','movie:3531') on conflict do nothing;
insert into public.media_provider_links values('movie:98205','movie:3532') on conflict do nothing;
insert into public.media_provider_links values('movie:84334','movie:3533') on conflict do nothing;
insert into public.media_provider_links values('movie:113947','movie:3534') on conflict do nothing;
insert into public.media_provider_links values('movie:127918','movie:3535') on conflict do nothing;
insert into public.media_provider_links values('movie:84286','movie:3536') on conflict do nothing;
insert into public.media_provider_links values('movie:84288','movie:3537') on conflict do nothing;
insert into public.media_provider_links values('movie:77174','movie:3538') on conflict do nothing;
insert into public.media_provider_links values('movie:62214','movie:3539') on conflict do nothing;
insert into public.media_provider_links values('movie:152737','movie:3540') on conflict do nothing;
insert into public.media_provider_links values('movie:82690','movie:3541') on conflict do nothing;
insert into public.media_provider_links values('movie:159014','movie:3542') on conflict do nothing;
insert into public.media_provider_links values('movie:109424','movie:3543') on conflict do nothing;
insert into public.media_provider_links values('movie:123678','movie:3544') on conflict do nothing;
insert into public.media_provider_links values('movie:159002','movie:3545') on conflict do nothing;
insert into public.media_provider_links values('movie:159004','movie:3546') on conflict do nothing;
insert into public.media_provider_links values('movie:159037','movie:3547') on conflict do nothing;
insert into public.media_provider_links values('movie:137182','movie:3548') on conflict do nothing;
insert into public.media_provider_links values('movie:273895','movie:3549') on conflict do nothing;
insert into public.media_provider_links values('movie:244786','movie:3550') on conflict do nothing;
insert into public.media_provider_links values('movie:284293','movie:3551') on conflict do nothing;
insert into public.media_provider_links values('movie:186997','movie:3552') on conflict do nothing;
insert into public.media_provider_links values('movie:242582','movie:3553') on conflict do nothing;
insert into public.media_provider_links values('movie:293310','movie:3554') on conflict do nothing;
insert into public.media_provider_links values('movie:169607','movie:3555') on conflict do nothing;
insert into public.media_provider_links values('movie:250761','movie:3556') on conflict do nothing;
insert into public.media_provider_links values('movie:265297','movie:3557') on conflict do nothing;
insert into public.media_provider_links values('movie:263614','movie:3558') on conflict do nothing;
insert into public.media_provider_links values('movie:224141','movie:3559') on conflict do nothing;
insert into public.media_provider_links values('movie:37495','movie:3560') on conflict do nothing;
insert into public.media_provider_links values('movie:46138','movie:3561') on conflict do nothing;
insert into public.media_provider_links values('movie:170687','movie:3562') on conflict do nothing;
insert into public.media_provider_links values('movie:25376','movie:3563') on conflict do nothing;
insert into public.media_provider_links values('movie:41110','movie:3564') on conflict do nothing;
insert into public.media_provider_links values('movie:110416','movie:3565') on conflict do nothing;
insert into public.media_provider_links values('movie:71859','movie:3566') on conflict do nothing;
insert into public.media_provider_links values('movie:46332','movie:3567') on conflict do nothing;
insert into public.media_provider_links values('movie:58496','movie:3568') on conflict do nothing;
insert into public.media_provider_links values('movie:76025','movie:3569') on conflict do nothing;
insert into public.media_provider_links values('movie:63311','movie:3570') on conflict do nothing;
insert into public.media_provider_links values('movie:51447','movie:3571') on conflict do nothing;
insert into public.media_provider_links values('movie:63579','movie:3572') on conflict do nothing;
insert into public.media_provider_links values('movie:74534','movie:3573') on conflict do nothing;
insert into public.media_provider_links values('movie:51052','movie:3574') on conflict do nothing;
insert into public.media_provider_links values('movie:97365','movie:3575') on conflict do nothing;
insert into public.media_provider_links values('movie:112336','movie:3576') on conflict do nothing;
insert into public.media_provider_links values('movie:90125','movie:3577') on conflict do nothing;
insert into public.media_provider_links values('movie:84351','movie:3578') on conflict do nothing;
insert into public.media_provider_links values('movie:151044','movie:3579') on conflict do nothing;
insert into public.media_provider_links values('movie:84287','movie:3580') on conflict do nothing;
insert into public.media_provider_links values('movie:194101','movie:3581') on conflict do nothing;
insert into public.media_provider_links values('movie:119675','movie:3582') on conflict do nothing;
insert into public.media_provider_links values('movie:192136','movie:3583') on conflict do nothing;
insert into public.media_provider_links values('movie:132363','movie:3584') on conflict do nothing;
insert into public.media_provider_links values('movie:129112','movie:3585') on conflict do nothing;
insert into public.media_provider_links values('movie:158091','movie:3586') on conflict do nothing;
insert into public.media_provider_links values('movie:159154','movie:3587') on conflict do nothing;
insert into public.media_provider_links values('movie:158999','movie:3588') on conflict do nothing;
insert into public.media_provider_links values('movie:212063','movie:3589') on conflict do nothing;
insert into public.media_provider_links values('movie:214083','movie:3590') on conflict do nothing;
insert into public.media_provider_links values('movie:116149','movie:3591') on conflict do nothing;
insert into public.media_provider_links values('movie:252178','movie:3592') on conflict do nothing;
insert into public.media_provider_links values('movie:234200','movie:3593') on conflict do nothing;
insert into public.media_provider_links values('movie:97370','movie:3594') on conflict do nothing;
insert into public.media_provider_links values('movie:191714','movie:3595') on conflict do nothing;
insert into public.media_provider_links values('movie:140823','movie:3596') on conflict do nothing;
insert into public.media_provider_links values('movie:137106','movie:3597') on conflict do nothing;
insert into public.media_provider_links values('movie:246400','movie:3598') on conflict do nothing;
insert into public.media_provider_links values('movie:206563','movie:3599') on conflict do nothing;
insert into public.media_provider_links values('movie:42297','movie:3600') on conflict do nothing;
insert into public.media_provider_links values('movie:39514','movie:3601') on conflict do nothing;
insert into public.media_provider_links values('movie:55061','movie:3602') on conflict do nothing;
insert into public.media_provider_links values('movie:25205','movie:3603') on conflict do nothing;
insert into public.media_provider_links values('movie:33909','movie:3604') on conflict do nothing;
insert into public.media_provider_links values('movie:40807','movie:3605') on conflict do nothing;
insert into public.media_provider_links values('movie:17578','movie:3606') on conflict do nothing;
insert into public.media_provider_links values('movie:79777','movie:3607') on conflict do nothing;
insert into public.media_provider_links values('movie:63831','movie:3608') on conflict do nothing;
insert into public.media_provider_links values('movie:46829','movie:3609') on conflict do nothing;
insert into public.media_provider_links values('movie:88794','movie:3610') on conflict do nothing;
insert into public.media_provider_links values('movie:81025','movie:3611') on conflict do nothing;
insert into public.media_provider_links values('movie:48231','movie:3612') on conflict do nothing;
insert into public.media_provider_links values('movie:57157','movie:3613') on conflict do nothing;
insert into public.media_provider_links values('movie:76492','movie:3614') on conflict do nothing;
insert into public.media_provider_links values('movie:81188','movie:3615') on conflict do nothing;
insert into public.media_provider_links values('movie:45324','movie:3616') on conflict do nothing;
insert into public.media_provider_links values('movie:51994','movie:3617') on conflict do nothing;
insert into public.media_provider_links values('movie:60599','movie:3618') on conflict do nothing;
insert into public.media_provider_links values('movie:121826','movie:3619') on conflict do nothing;
insert into public.media_provider_links values('movie:82696','movie:3620') on conflict do nothing;
insert into public.media_provider_links values('movie:87504','movie:3621') on conflict do nothing;
insert into public.media_provider_links values('movie:92591','movie:3622') on conflict do nothing;
insert into public.media_provider_links values('movie:152747','movie:3623') on conflict do nothing;
insert into public.media_provider_links values('movie:130150','movie:3624') on conflict do nothing;
insert into public.media_provider_links values('movie:121986','movie:3625') on conflict do nothing;
insert into public.media_provider_links values('movie:209263','movie:3626') on conflict do nothing;
insert into public.media_provider_links values('movie:239563','movie:3627') on conflict do nothing;
insert into public.media_provider_links values('movie:228326','movie:3628') on conflict do nothing;
insert into public.media_provider_links values('movie:152780','movie:3629') on conflict do nothing;
insert into public.media_provider_links values('movie:270403','movie:3630') on conflict do nothing;
insert into public.media_provider_links values('movie:82390','movie:3631') on conflict do nothing;
insert into public.media_provider_links values('movie:284276','movie:3632') on conflict do nothing;
insert into public.media_provider_links values('movie:241239','movie:3633') on conflict do nothing;
insert into public.media_provider_links values('movie:228194','movie:3634') on conflict do nothing;
insert into public.media_provider_links values('movie:61667','movie:3635') on conflict do nothing;
insert into public.media_provider_links values('movie:157851','movie:3636') on conflict do nothing;
insert into public.media_provider_links values('movie:96811','movie:3637') on conflict do nothing;
insert into public.media_provider_links values('movie:85836','movie:3638') on conflict do nothing;
insert into public.media_provider_links values('movie:84427','movie:3639') on conflict do nothing;
insert into public.media_provider_links values('movie:196867','movie:3640') on conflict do nothing;
insert into public.media_provider_links values('movie:78604','movie:3641') on conflict do nothing;
insert into public.media_provider_links values('movie:78162','movie:3642') on conflict do nothing;
insert into public.media_provider_links values('movie:73532','movie:3643') on conflict do nothing;
insert into public.media_provider_links values('movie:71157','movie:3644') on conflict do nothing;
insert into public.media_provider_links values('movie:64586','movie:3645') on conflict do nothing;
insert into public.media_provider_links values('movie:104858','movie:3646') on conflict do nothing;
insert into public.media_provider_links values('movie:85543','movie:3647') on conflict do nothing;
insert into public.media_provider_links values('movie:77461','movie:3648') on conflict do nothing;
insert into public.media_provider_links values('movie:78182','movie:3649') on conflict do nothing;
insert into public.media_provider_links values('movie:78313','movie:3650') on conflict do nothing;
insert into public.media_provider_links values('movie:53487','movie:3651') on conflict do nothing;
insert into public.media_provider_links values('movie:89456','movie:3652') on conflict do nothing;
insert into public.media_provider_links values('movie:56418','movie:3653') on conflict do nothing;
insert into public.media_provider_links values('movie:84851','movie:3654') on conflict do nothing;
insert into public.media_provider_links values('movie:50837','movie:3655') on conflict do nothing;
insert into public.media_provider_links values('movie:77635','movie:3656') on conflict do nothing;
insert into public.media_provider_links values('movie:75233','movie:3657') on conflict do nothing;
insert into public.media_provider_links values('movie:95448','movie:3658') on conflict do nothing;
insert into public.media_provider_links values('movie:47760','movie:3659') on conflict do nothing;
insert into public.media_provider_links values('movie:85525','movie:3660') on conflict do nothing;
insert into public.media_provider_links values('movie:96551','movie:3661') on conflict do nothing;
insert into public.media_provider_links values('movie:91690','movie:3662') on conflict do nothing;
insert into public.media_provider_links values('movie:83114','movie:3663') on conflict do nothing;
insert into public.media_provider_links values('movie:87408','movie:3664') on conflict do nothing;
insert into public.media_provider_links values('movie:103739','movie:3665') on conflict do nothing;
insert into public.media_provider_links values('movie:49014','movie:3666') on conflict do nothing;
insert into public.media_provider_links values('movie:103753','movie:3667') on conflict do nothing;
insert into public.media_provider_links values('movie:57361','movie:3668') on conflict do nothing;
insert into public.media_provider_links values('movie:78715','movie:3669') on conflict do nothing;
insert into public.media_provider_links values('movie:64689','movie:3670') on conflict do nothing;
insert into public.media_provider_links values('movie:102001','movie:3671') on conflict do nothing;
insert into public.media_provider_links values('movie:82633','movie:3672') on conflict do nothing;
insert into public.media_provider_links values('movie:96001','movie:3673') on conflict do nothing;
insert into public.media_provider_links values('movie:103750','movie:3674') on conflict do nothing;
insert into public.media_provider_links values('movie:103731','movie:3675') on conflict do nothing;
insert into public.media_provider_links values('movie:103689','movie:3676') on conflict do nothing;
insert into public.media_provider_links values('movie:83770','movie:3677') on conflict do nothing;
insert into public.media_provider_links values('movie:103742','movie:3678') on conflict do nothing;
insert into public.media_provider_links values('movie:103747','movie:3679') on conflict do nothing;
insert into public.media_provider_links values('movie:125490','movie:3680') on conflict do nothing;
insert into public.media_provider_links values('movie:103686','movie:3681') on conflict do nothing;
insert into public.media_provider_links values('movie:94904','movie:3682') on conflict do nothing;
insert into public.media_provider_links values('movie:103717','movie:3683') on conflict do nothing;
insert into public.media_provider_links values('movie:58559','movie:3684') on conflict do nothing;
insert into public.media_provider_links values('movie:126315','movie:3685') on conflict do nothing;
insert into public.media_provider_links values('movie:111728','movie:3686') on conflict do nothing;
insert into public.media_provider_links values('movie:97607','movie:3687') on conflict do nothing;
insert into public.media_provider_links values('movie:103758','movie:3688') on conflict do nothing;
insert into public.media_provider_links values('movie:110393','movie:3689') on conflict do nothing;
insert into public.media_provider_links values('movie:126328','movie:3690') on conflict do nothing;
insert into public.media_provider_links values('movie:70793','movie:3691') on conflict do nothing;
insert into public.media_provider_links values('movie:134908','movie:3692') on conflict do nothing;
insert into public.media_provider_links values('movie:126318','movie:3693') on conflict do nothing;
insert into public.media_provider_links values('movie:134673','movie:3694') on conflict do nothing;
insert into public.media_provider_links values('movie:121210','movie:3695') on conflict do nothing;
insert into public.media_provider_links values('movie:126321','movie:3696') on conflict do nothing;
insert into public.media_provider_links values('movie:186929','movie:3697') on conflict do nothing;
insert into public.media_provider_links values('movie:110160','movie:3698') on conflict do nothing;
insert into public.media_provider_links values('movie:160768','movie:3699') on conflict do nothing;
insert into public.media_provider_links values('movie:186970','movie:3700') on conflict do nothing;
insert into public.media_provider_links values('movie:186935','movie:3701') on conflict do nothing;
insert into public.media_provider_links values('movie:184314','movie:3702') on conflict do nothing;
insert into public.media_provider_links values('movie:186971','movie:3703') on conflict do nothing;
insert into public.media_provider_links values('movie:77987','movie:3704') on conflict do nothing;
insert into public.media_provider_links values('movie:152599','movie:3705') on conflict do nothing;
insert into public.media_provider_links values('movie:187022','movie:3706') on conflict do nothing;
insert into public.media_provider_links values('movie:152745','movie:3707') on conflict do nothing;
insert into public.media_provider_links values('movie:177945','movie:3708') on conflict do nothing;
insert into public.media_provider_links values('movie:230152','movie:3709') on conflict do nothing;
insert into public.media_provider_links values('movie:191731','movie:3710') on conflict do nothing;
insert into public.media_provider_links values('movie:186998','movie:3711') on conflict do nothing;
insert into public.media_provider_links values('movie:180900','movie:3712') on conflict do nothing;
insert into public.media_provider_links values('movie:157354','movie:3713') on conflict do nothing;
insert into public.media_provider_links values('movie:186991','movie:3714') on conflict do nothing;
insert into public.media_provider_links values('movie:186992','movie:3715') on conflict do nothing;
insert into public.media_provider_links values('movie:188765','movie:3716') on conflict do nothing;
insert into public.media_provider_links values('movie:186988','movie:3717') on conflict do nothing;
insert into public.media_provider_links values('movie:186976','movie:3718') on conflict do nothing;
insert into public.media_provider_links values('movie:186975','movie:3719') on conflict do nothing;
insert into public.media_provider_links values('movie:186974','movie:3720') on conflict do nothing;
insert into public.media_provider_links values('movie:188761','movie:3721') on conflict do nothing;
insert into public.media_provider_links values('movie:188758','movie:3722') on conflict do nothing;
insert into public.media_provider_links values('movie:197089','movie:3723') on conflict do nothing;
insert into public.media_provider_links values('movie:244761','movie:3724') on conflict do nothing;
insert into public.media_provider_links values('movie:265193','movie:3725') on conflict do nothing;
insert into public.media_provider_links values('movie:265226','movie:3726') on conflict do nothing;
insert into public.media_provider_links values('movie:245700','movie:3727') on conflict do nothing;
insert into public.media_provider_links values('movie:179109','movie:3728') on conflict do nothing;
insert into public.media_provider_links values('movie:246860','movie:3729') on conflict do nothing;
insert into public.media_provider_links values('movie:264656','movie:3730') on conflict do nothing;
insert into public.media_provider_links values('movie:245692','movie:3731') on conflict do nothing;
insert into public.media_provider_links values('movie:266040','movie:3732') on conflict do nothing;
insert into public.media_provider_links values('movie:265349','movie:3733') on conflict do nothing;
insert into public.media_provider_links values('movie:221667','movie:3734') on conflict do nothing;
insert into public.media_provider_links values('movie:266058','movie:3735') on conflict do nothing;
insert into public.media_provider_links values('movie:266044','movie:3736') on conflict do nothing;
insert into public.media_provider_links values('movie:265177','movie:3737') on conflict do nothing;
insert into public.media_provider_links values('movie:266065','movie:3738') on conflict do nothing;
insert into public.media_provider_links values('movie:266031','movie:3739') on conflict do nothing;
insert into public.media_provider_links values('movie:266036','movie:3740') on conflict do nothing;
insert into public.media_provider_links values('movie:266069','movie:3741') on conflict do nothing;
insert into public.media_provider_links values('movie:167810','movie:3742') on conflict do nothing;
insert into public.media_provider_links values('movie:266034','movie:3743') on conflict do nothing;
insert into public.media_provider_links values('movie:270014','movie:3744') on conflict do nothing;
insert into public.media_provider_links values('movie:266038','movie:3745') on conflict do nothing;
insert into public.media_provider_links values('movie:266030','movie:3746') on conflict do nothing;
insert into public.media_provider_links values('movie:266061','movie:3747') on conflict do nothing;
insert into public.media_provider_links values('movie:337104','movie:3748') on conflict do nothing;
insert into public.media_provider_links values('movie:266047','movie:3749') on conflict do nothing;
insert into public.media_provider_links values('movie:267999','movie:3750') on conflict do nothing;
insert into public.media_provider_links values('movie:157827','movie:3751') on conflict do nothing;
insert into public.media_provider_links values('movie:330294','movie:3752') on conflict do nothing;
insert into public.media_provider_links values('movie:329712','movie:3753') on conflict do nothing;
insert into public.media_provider_links values('movie:225728','movie:3754') on conflict do nothing;
insert into public.media_provider_links values('movie:314388','movie:3755') on conflict do nothing;
insert into public.media_provider_links values('movie:291351','movie:3756') on conflict do nothing;
insert into public.media_provider_links values('movie:337107','movie:3757') on conflict do nothing;
insert into public.media_provider_links values('movie:315846','movie:3758') on conflict do nothing;
insert into public.media_provider_links values('movie:319373','movie:3759') on conflict do nothing;
insert into public.media_provider_links values('movie:329805','movie:3760') on conflict do nothing;
insert into public.media_provider_links values('movie:336204','movie:3761') on conflict do nothing;
insert into public.media_provider_links values('movie:334924','movie:3762') on conflict do nothing;
insert into public.media_provider_links values('movie:336222','movie:3763') on conflict do nothing;
insert into public.media_provider_links values('movie:336207','movie:3764') on conflict do nothing;
insert into public.media_provider_links values('movie:334991','movie:3765') on conflict do nothing;
insert into public.media_provider_links values('movie:337114','movie:3766') on conflict do nothing;
insert into public.media_provider_links values('movie:336054','movie:3767') on conflict do nothing;
insert into public.media_provider_links values('movie:336212','movie:3768') on conflict do nothing;
insert into public.media_provider_links values('movie:336201','movie:3769') on conflict do nothing;
insert into public.media_provider_links values('movie:329815','movie:3770') on conflict do nothing;
insert into public.media_provider_links values('movie:336216','movie:3771') on conflict do nothing;
insert into public.media_provider_links values('movie:336203','movie:3772') on conflict do nothing;
insert into public.media_provider_links values('movie:336206','movie:3773') on conflict do nothing;
insert into public.media_provider_links values('movie:336053','movie:3774') on conflict do nothing;
insert into public.media_provider_links values('movie:83384','movie:3775') on conflict do nothing;
insert into public.media_provider_links values('movie:90147','movie:3776') on conflict do nothing;
insert into public.media_provider_links values('movie:336220','movie:3777') on conflict do nothing;
insert into public.media_provider_links values('movie:73567','movie:3778') on conflict do nothing;
insert into public.media_provider_links values('movie:86820','movie:3779') on conflict do nothing;
insert into public.media_provider_links values('movie:78206','movie:3780') on conflict do nothing;
insert into public.media_provider_links values('movie:73869','movie:3781') on conflict do nothing;
insert into public.media_provider_links values('movie:99393','movie:3782') on conflict do nothing;
insert into public.media_provider_links values('movie:102869','movie:3783') on conflict do nothing;
insert into public.media_provider_links values('movie:77952','movie:3784') on conflict do nothing;
insert into public.media_provider_links values('movie:73872','movie:3785') on conflict do nothing;
insert into public.media_provider_links values('movie:72477','movie:3786') on conflict do nothing;
insert into public.media_provider_links values('movie:80440','movie:3787') on conflict do nothing;
insert into public.media_provider_links values('movie:127925','movie:3788') on conflict do nothing;
insert into public.media_provider_links values('movie:267891','movie:3789') on conflict do nothing;
insert into public.media_provider_links values('movie:98344','movie:3790') on conflict do nothing;
insert into public.media_provider_links values('movie:541427','movie:3791') on conflict do nothing;
insert into public.media_provider_links values('movie:92643','movie:3792') on conflict do nothing;
insert into public.media_provider_links values('movie:92642','movie:3793') on conflict do nothing;
insert into public.media_provider_links values('movie:85032','movie:3794') on conflict do nothing;
insert into public.media_provider_links values('movie:202872','movie:3795') on conflict do nothing;
insert into public.media_provider_links values('movie:99513','movie:3796') on conflict do nothing;
insert into public.media_provider_links values('movie:120820','movie:3797') on conflict do nothing;
insert into public.media_provider_links values('movie:120272','movie:3798') on conflict do nothing;
insert into public.media_provider_links values('movie:141522','movie:3799') on conflict do nothing;
insert into public.media_provider_links values('movie:77322','movie:3800') on conflict do nothing;
insert into public.media_provider_links values('movie:111103','movie:3801') on conflict do nothing;
insert into public.media_provider_links values('movie:9364','movie:3802') on conflict do nothing;
insert into public.media_provider_links values('movie:84479','movie:3803') on conflict do nothing;
insert into public.media_provider_links values('movie:111114','movie:3804') on conflict do nothing;
insert into public.media_provider_links values('movie:97762','movie:3805') on conflict do nothing;
insert into public.media_provider_links values('movie:85533','movie:3806') on conflict do nothing;
insert into public.media_provider_links values('movie:111106','movie:3807') on conflict do nothing;
insert into public.media_provider_links values('movie:122089','movie:3808') on conflict do nothing;
insert into public.media_provider_links values('movie:136017','movie:3809') on conflict do nothing;
insert into public.media_provider_links values('movie:121789','movie:3810') on conflict do nothing;
insert into public.media_provider_links values('movie:120460','movie:3811') on conflict do nothing;
insert into public.media_provider_links values('movie:110447','movie:3812') on conflict do nothing;
insert into public.media_provider_links values('movie:807071','movie:3813') on conflict do nothing;
insert into public.media_provider_links values('movie:123366','movie:3814') on conflict do nothing;
insert into public.media_provider_links values('movie:121828','movie:3815') on conflict do nothing;
insert into public.media_provider_links values('movie:123380','movie:3816') on conflict do nothing;
insert into public.media_provider_links values('movie:129734','movie:3817') on conflict do nothing;
insert into public.media_provider_links values('movie:122088','movie:3818') on conflict do nothing;
insert into public.media_provider_links values('movie:109099','movie:3819') on conflict do nothing;
insert into public.media_provider_links values('movie:123377','movie:3820') on conflict do nothing;
insert into public.media_provider_links values('movie:122081','movie:3821') on conflict do nothing;
insert into public.media_provider_links values('movie:122083','movie:3822') on conflict do nothing;
insert into public.media_provider_links values('movie:60281','movie:3823') on conflict do nothing;
insert into public.media_provider_links values('movie:129119','movie:3824') on conflict do nothing;
insert into public.media_provider_links values('movie:220493','movie:3825') on conflict do nothing;
insert into public.media_provider_links values('movie:128508','movie:3826') on conflict do nothing;
insert into public.media_provider_links values('movie:127242','movie:3827') on conflict do nothing;
insert into public.media_provider_links values('movie:123375','movie:3828') on conflict do nothing;
insert into public.media_provider_links values('movie:122198','movie:3829') on conflict do nothing;
insert into public.media_provider_links values('movie:127907','movie:3830') on conflict do nothing;
insert into public.media_provider_links values('movie:137079','movie:3831') on conflict do nothing;
insert into public.media_provider_links values('movie:127846','movie:3832') on conflict do nothing;
insert into public.media_provider_links values('movie:129115','movie:3833') on conflict do nothing;
insert into public.media_provider_links values('movie:141810','movie:3834') on conflict do nothing;
insert into public.media_provider_links values('movie:129113','movie:3835') on conflict do nothing;
insert into public.media_provider_links values('movie:129116','movie:3836') on conflict do nothing;
insert into public.media_provider_links values('movie:128106','movie:3837') on conflict do nothing;
insert into public.media_provider_links values('movie:144752','movie:3838') on conflict do nothing;
insert into public.media_provider_links values('movie:127236','movie:3839') on conflict do nothing;
insert into public.media_provider_links values('movie:129121','movie:3840') on conflict do nothing;
insert into public.media_provider_links values('movie:216789','movie:3841') on conflict do nothing;
insert into public.media_provider_links values('movie:210228','movie:3842') on conflict do nothing;
insert into public.media_provider_links values('movie:216783','movie:3843') on conflict do nothing;
insert into public.media_provider_links values('movie:157847','movie:3844') on conflict do nothing;
insert into public.media_provider_links values('movie:129117','movie:3845') on conflict do nothing;
insert into public.media_provider_links values('movie:216457','movie:3846') on conflict do nothing;
insert into public.media_provider_links values('movie:121998','movie:3847') on conflict do nothing;
insert into public.media_provider_links values('movie:152736','movie:3848') on conflict do nothing;
insert into public.media_provider_links values('movie:209262','movie:3849') on conflict do nothing;
insert into public.media_provider_links values('movie:209413','movie:3850') on conflict do nothing;
insert into public.media_provider_links values('movie:209840','movie:3851') on conflict do nothing;
insert into public.media_provider_links values('movie:209799','movie:3852') on conflict do nothing;
insert into public.media_provider_links values('movie:216790','movie:3853') on conflict do nothing;
insert into public.media_provider_links values('movie:184352','movie:3854') on conflict do nothing;
insert into public.media_provider_links values('movie:211052','movie:3855') on conflict do nothing;
insert into public.media_provider_links values('movie:216788','movie:3856') on conflict do nothing;
insert into public.media_provider_links values('movie:238925','movie:3857') on conflict do nothing;
insert into public.media_provider_links values('movie:210054','movie:3858') on conflict do nothing;
insert into public.media_provider_links values('movie:219055','movie:3859') on conflict do nothing;
insert into public.media_provider_links values('movie:157823','movie:3860') on conflict do nothing;
insert into public.media_provider_links values('movie:217479','movie:3861') on conflict do nothing;
insert into public.media_provider_links values('movie:217475','movie:3862') on conflict do nothing;
insert into public.media_provider_links values('movie:217471','movie:3863') on conflict do nothing;
insert into public.media_provider_links values('movie:192132','movie:3864') on conflict do nothing;
insert into public.media_provider_links values('movie:217464','movie:3865') on conflict do nothing;
insert into public.media_provider_links values('movie:211067','movie:3866') on conflict do nothing;
insert into public.media_provider_links values('movie:214210','movie:3867') on conflict do nothing;
insert into public.media_provider_links values('movie:191294','movie:3868') on conflict do nothing;
insert into public.media_provider_links values('movie:210052','movie:3869') on conflict do nothing;
insert into public.media_provider_links values('movie:283701','movie:3870') on conflict do nothing;
insert into public.media_provider_links values('movie:216156','movie:3871') on conflict do nothing;
insert into public.media_provider_links values('movie:283707','movie:3872') on conflict do nothing;
insert into public.media_provider_links values('movie:283711','movie:3873') on conflict do nothing;
insert into public.media_provider_links values('movie:253626','movie:3874') on conflict do nothing;
insert into public.media_provider_links values('movie:283607','movie:3875') on conflict do nothing;
insert into public.media_provider_links values('movie:283698','movie:3876') on conflict do nothing;
insert into public.media_provider_links values('movie:283704','movie:3877') on conflict do nothing;
insert into public.media_provider_links values('movie:217474','movie:3878') on conflict do nothing;
insert into public.media_provider_links values('movie:263118','movie:3879') on conflict do nothing;
insert into public.media_provider_links values('movie:254905','movie:3880') on conflict do nothing;
insert into public.media_provider_links values('movie:283700','movie:3881') on conflict do nothing;
insert into public.media_provider_links values('movie:283710','movie:3882') on conflict do nothing;
insert into public.media_provider_links values('movie:283699','movie:3883') on conflict do nothing;
insert into public.media_provider_links values('movie:283706','movie:3884') on conflict do nothing;
insert into public.media_provider_links values('movie:290643','movie:3885') on conflict do nothing;
insert into public.media_provider_links values('movie:290815','movie:3886') on conflict do nothing;
insert into public.media_provider_links values('movie:240745','movie:3887') on conflict do nothing;
insert into public.media_provider_links values('movie:284303','movie:3888') on conflict do nothing;
insert into public.media_provider_links values('movie:289891','movie:3889') on conflict do nothing;
insert into public.media_provider_links values('movie:234197','movie:3890') on conflict do nothing;
insert into public.media_provider_links values('movie:250230','movie:3891') on conflict do nothing;
insert into public.media_provider_links values('movie:291878','movie:3892') on conflict do nothing;
insert into public.media_provider_links values('movie:283708','movie:3893') on conflict do nothing;
insert into public.media_provider_links values('movie:289223','movie:3894') on conflict do nothing;
insert into public.media_provider_links values('movie:286306','movie:3895') on conflict do nothing;
insert into public.media_provider_links values('movie:289483','movie:3896') on conflict do nothing;
insert into public.media_provider_links values('movie:284135','movie:3897') on conflict do nothing;
insert into public.media_provider_links values('movie:289174','movie:3898') on conflict do nothing;
insert into public.media_provider_links values('movie:324807','movie:3899') on conflict do nothing;
insert into public.media_provider_links values('movie:314371','movie:3900') on conflict do nothing;
insert into public.media_provider_links values('movie:179150','movie:3901') on conflict do nothing;
insert into public.media_provider_links values('movie:352196','movie:3902') on conflict do nothing;
insert into public.media_provider_links values('movie:296449','movie:3903') on conflict do nothing;
insert into public.media_provider_links values('movie:352197','movie:3904') on conflict do nothing;
insert into public.media_provider_links values('movie:352161','movie:3905') on conflict do nothing;
insert into public.media_provider_links values('movie:301875','movie:3906') on conflict do nothing;
insert into public.media_provider_links values('movie:329809','movie:3907') on conflict do nothing;
insert into public.media_provider_links values('movie:352157','movie:3908') on conflict do nothing;
insert into public.media_provider_links values('movie:352200','movie:3909') on conflict do nothing;
insert into public.media_provider_links values('movie:330348','movie:3910') on conflict do nothing;
insert into public.media_provider_links values('movie:302528','movie:3911') on conflict do nothing;
insert into public.media_provider_links values('movie:352162','movie:3912') on conflict do nothing;
insert into public.media_provider_links values('movie:358909','movie:3913') on conflict do nothing;
insert into public.media_provider_links values('movie:352202','movie:3914') on conflict do nothing;
insert into public.media_provider_links values('movie:359666','movie:3915') on conflict do nothing;
insert into public.media_provider_links values('movie:352159','movie:3916') on conflict do nothing;
insert into public.media_provider_links values('movie:358983','movie:3917') on conflict do nothing;
insert into public.media_provider_links values('movie:359257','movie:3918') on conflict do nothing;
insert into public.media_provider_links values('movie:359545','movie:3919') on conflict do nothing;
insert into public.media_provider_links values('movie:358759','movie:3920') on conflict do nothing;
insert into public.media_provider_links values('movie:296523','movie:3921') on conflict do nothing;
insert into public.media_provider_links values('movie:359429','movie:3922') on conflict do nothing;
insert into public.media_provider_links values('movie:314029','movie:3923') on conflict do nothing;
insert into public.media_provider_links values('movie:359256','movie:3924') on conflict do nothing;
insert into public.media_provider_links values('movie:358403','movie:3925') on conflict do nothing;
insert into public.media_provider_links values('movie:314400','movie:3926') on conflict do nothing;
insert into public.media_provider_links values('movie:359770','movie:3927') on conflict do nothing;
insert into public.media_provider_links values('movie:330982','movie:3928') on conflict do nothing;
insert into public.media_provider_links values('movie:358808','movie:3929') on conflict do nothing;
insert into public.media_provider_links values('movie:101173','movie:3930') on conflict do nothing;
insert into public.media_provider_links values('movie:296865','movie:3931') on conflict do nothing;
insert into public.media_provider_links values('movie:79000','movie:3932') on conflict do nothing;
insert into public.media_provider_links values('movie:81401','movie:3933') on conflict do nothing;
insert into public.media_provider_links values('movie:128593','movie:3934') on conflict do nothing;
insert into public.media_provider_links values('movie:70768','movie:3935') on conflict do nothing;
insert into public.media_provider_links values('movie:82624','movie:3936') on conflict do nothing;
insert into public.media_provider_links values('movie:65847','movie:3937') on conflict do nothing;
insert into public.media_provider_links values('movie:69352','movie:3938') on conflict do nothing;
insert into public.media_provider_links values('movie:54662','movie:3939') on conflict do nothing;
insert into public.media_provider_links values('movie:73132','movie:3940') on conflict do nothing;
insert into public.media_provider_links values('movie:155382','movie:3941') on conflict do nothing;
insert into public.media_provider_links values('movie:150065','movie:3942') on conflict do nothing;
insert into public.media_provider_links values('movie:359373','movie:3943') on conflict do nothing;
insert into public.media_provider_links values('movie:139162','movie:3944') on conflict do nothing;
insert into public.media_provider_links values('movie:88284','movie:3945') on conflict do nothing;
insert into public.media_provider_links values('movie:139159','movie:3946') on conflict do nothing;
insert into public.media_provider_links values('movie:110381','movie:3947') on conflict do nothing;
insert into public.media_provider_links values('movie:94671','movie:3948') on conflict do nothing;
insert into public.media_provider_links values('movie:120194','movie:3949') on conflict do nothing;
insert into public.media_provider_links values('movie:102000','movie:3950') on conflict do nothing;
insert into public.media_provider_links values('movie:99579','movie:3951') on conflict do nothing;
insert into public.media_provider_links values('movie:107073','movie:3952') on conflict do nothing;
insert into public.media_provider_links values('movie:137179','movie:3953') on conflict do nothing;
insert into public.media_provider_links values('movie:138254','movie:3954') on conflict do nothing;
insert into public.media_provider_links values('movie:88249','movie:3955') on conflict do nothing;
insert into public.media_provider_links values('movie:93858','movie:3956') on conflict do nothing;
insert into public.media_provider_links values('movie:110428','movie:3957') on conflict do nothing;
insert into public.media_provider_links values('movie:124529','movie:3958') on conflict do nothing;
insert into public.media_provider_links values('movie:159942','movie:3959') on conflict do nothing;
insert into public.media_provider_links values('movie:160068','movie:3960') on conflict do nothing;
insert into public.media_provider_links values('movie:159344','movie:3961') on conflict do nothing;
insert into public.media_provider_links values('movie:160124','movie:3962') on conflict do nothing;
insert into public.media_provider_links values('movie:160045','movie:3963') on conflict do nothing;
insert into public.media_provider_links values('movie:159967','movie:3964') on conflict do nothing;
insert into public.media_provider_links values('movie:113148','movie:3965') on conflict do nothing;
insert into public.media_provider_links values('movie:133694','movie:3966') on conflict do nothing;
insert into public.media_provider_links values('movie:109421','movie:3967') on conflict do nothing;
insert into public.media_provider_links values('movie:150897','movie:3968') on conflict do nothing;
insert into public.media_provider_links values('movie:160156','movie:3969') on conflict do nothing;
insert into public.media_provider_links values('movie:160160','movie:3970') on conflict do nothing;
insert into public.media_provider_links values('movie:157690','movie:3971') on conflict do nothing;
insert into public.media_provider_links values('movie:255824','movie:3972') on conflict do nothing;
insert into public.media_provider_links values('movie:251321','movie:3973') on conflict do nothing;
insert into public.media_provider_links values('movie:248934','movie:3974') on conflict do nothing;
insert into public.media_provider_links values('movie:254323','movie:3975') on conflict do nothing;
insert into public.media_provider_links values('movie:254679','movie:3976') on conflict do nothing;
insert into public.media_provider_links values('movie:252822','movie:3977') on conflict do nothing;
insert into public.media_provider_links values('movie:160118','movie:3978') on conflict do nothing;
insert into public.media_provider_links values('movie:255482','movie:3979') on conflict do nothing;
insert into public.media_provider_links values('movie:254772','movie:3980') on conflict do nothing;
insert into public.media_provider_links values('movie:160075','movie:3981') on conflict do nothing;
insert into public.media_provider_links values('movie:254719','movie:3982') on conflict do nothing;
insert into public.media_provider_links values('movie:256021','movie:3983') on conflict do nothing;
insert into public.media_provider_links values('movie:227975','movie:3984') on conflict do nothing;
insert into public.media_provider_links values('movie:256108','movie:3985') on conflict do nothing;
insert into public.media_provider_links values('movie:319993','movie:3986') on conflict do nothing;
insert into public.media_provider_links values('movie:311301','movie:3987') on conflict do nothing;
insert into public.media_provider_links values('movie:320000','movie:3988') on conflict do nothing;
insert into public.media_provider_links values('movie:254166','movie:3989') on conflict do nothing;
insert into public.media_provider_links values('movie:238811','movie:3990') on conflict do nothing;
insert into public.media_provider_links values('movie:256106','movie:3991') on conflict do nothing;
insert into public.media_provider_links values('movie:320003','movie:3992') on conflict do nothing;
insert into public.media_provider_links values('movie:320004','movie:3993') on conflict do nothing;
insert into public.media_provider_links values('movie:157843','movie:3994') on conflict do nothing;
insert into public.media_provider_links values('movie:319994','movie:3995') on conflict do nothing;
insert into public.media_provider_links values('movie:121869','movie:3996') on conflict do nothing;
insert into public.media_provider_links values('movie:312408','movie:3997') on conflict do nothing;
insert into public.media_provider_links values('movie:320001','movie:3998') on conflict do nothing;
insert into public.media_provider_links values('movie:319996','movie:3999') on conflict do nothing;
insert into public.media_provider_links values('movie:319998','movie:4000') on conflict do nothing;
insert into public.media_provider_links values('movie:73686','movie:4001') on conflict do nothing;
insert into public.media_provider_links values('movie:47904','movie:4002') on conflict do nothing;
insert into public.media_provider_links values('movie:110398','movie:4003') on conflict do nothing;
insert into public.media_provider_links values('movie:84170','movie:4004') on conflict do nothing;
insert into public.media_provider_links values('movie:187028','movie:4005') on conflict do nothing;
insert into public.media_provider_links values('movie:96724','movie:4006') on conflict do nothing;
insert into public.media_provider_links values('movie:47557','movie:4007') on conflict do nothing;
insert into public.media_provider_links values('movie:103870','movie:4008') on conflict do nothing;
insert into public.media_provider_links values('movie:133878','movie:4009') on conflict do nothing;
insert into public.media_provider_links values('movie:103875','movie:4010') on conflict do nothing;
insert into public.media_provider_links values('movie:266062','movie:4011') on conflict do nothing;
insert into public.media_provider_links values('movie:337115','movie:4012') on conflict do nothing;
insert into public.media_provider_links values('movie:162980','movie:4013') on conflict do nothing;
insert into public.media_provider_links values('movie:157829','movie:4014') on conflict do nothing;
insert into public.media_provider_links values('movie:334876','movie:4015') on conflict do nothing;
insert into public.media_provider_links values('movie:81857','movie:4016') on conflict do nothing;
insert into public.media_provider_links values('movie:98631','movie:4017') on conflict do nothing;
insert into public.media_provider_links values('movie:172489','movie:4018') on conflict do nothing;
insert into public.media_provider_links values('movie:120822','movie:4019') on conflict do nothing;
insert into public.media_provider_links values('movie:298721','movie:4020') on conflict do nothing;
insert into public.media_provider_links values('movie:182829','movie:4021') on conflict do nothing;
insert into public.media_provider_links values('movie:217478','movie:4022') on conflict do nothing;
insert into public.media_provider_links values('movie:134350','movie:4023') on conflict do nothing;
insert into public.media_provider_links values('movie:128230','movie:4024') on conflict do nothing;
insert into public.media_provider_links values('movie:243884','movie:4025') on conflict do nothing;
insert into public.media_provider_links values('movie:203819','movie:4026') on conflict do nothing;
insert into public.media_provider_links values('movie:285024','movie:4027') on conflict do nothing;
insert into public.media_provider_links values('movie:290158','movie:4028') on conflict do nothing;
insert into public.media_provider_links values('movie:292359','movie:4029') on conflict do nothing;
insert into public.media_provider_links values('movie:352156','movie:4030') on conflict do nothing;
insert into public.media_provider_links values('movie:352199','movie:4031') on conflict do nothing;
insert into public.media_provider_links values('movie:372226','movie:4032') on conflict do nothing;
insert into public.media_provider_links values('movie:358899','movie:4033') on conflict do nothing;
insert into public.media_provider_links values('movie:64744','movie:4034') on conflict do nothing;
insert into public.media_provider_links values('movie:98203','movie:4035') on conflict do nothing;
insert into public.media_provider_links values('movie:110383','movie:4036') on conflict do nothing;
insert into public.media_provider_links values('movie:160171','movie:4037') on conflict do nothing;
insert into public.media_provider_links values('movie:160165','movie:4038') on conflict do nothing;
insert into public.media_provider_links values('movie:41602','movie:4039') on conflict do nothing;
insert into public.media_provider_links values('movie:124103','movie:4040') on conflict do nothing;
insert into public.media_provider_links values('movie:319999','movie:4041') on conflict do nothing;
insert into public.media_provider_links values('movie:91186','movie:4042') on conflict do nothing;
insert into public.media_provider_links values('movie:122080','movie:4043') on conflict do nothing;
insert into public.media_provider_links values('tv:43107','movie:4044') on conflict do nothing;
commit;

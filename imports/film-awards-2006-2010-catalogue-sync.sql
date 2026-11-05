-- Film awards 2006-2010: 638 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:398','movie:4045','398','tmdb_id'),
('movie:612','movie:4046','612','tmdb_id'),
('movie:3291','movie:4047','3291','tmdb_id'),
('movie:1640','movie:4048','1640','tmdb_id'),
('movie:69','movie:4049','69','tmdb_id'),
('movie:10476','movie:4050','10476','tmdb_id'),
('movie:546','movie:4051','546','tmdb_id'),
('movie:4348','movie:4052','4348','tmdb_id'),
('movie:231','movie:4053','231','tmdb_id'),
('movie:59','movie:4054','59','tmdb_id'),
('movie:10773','movie:4055','10773','tmdb_id'),
('movie:1444','movie:4056','1444','tmdb_id'),
('movie:10707','movie:4057','10707','tmdb_id'),
('movie:868','movie:4058','868','tmdb_id'),
('movie:1985','movie:4059','1985','tmdb_id'),
('movie:921','movie:4060','921','tmdb_id'),
('movie:1084642','movie:4061','1084642','tmdb_id'),
('movie:67','movie:4062','67','tmdb_id'),
('movie:11661','movie:4063','11661','tmdb_id'),
('movie:1667','movie:4064','1667','tmdb_id'),
('movie:9701','movie:4065','9701','tmdb_id'),
('movie:415253','movie:4066','415253','tmdb_id'),
('movie:2117','movie:4067','2117','tmdb_id'),
('movie:29044','movie:4068','29044','tmdb_id'),
('movie:3933','movie:4069','3933','tmdb_id'),
('movie:13020','movie:4070','13020','tmdb_id'),
('movie:14278','movie:4071','14278','tmdb_id'),
('movie:773','movie:4072','773','tmdb_id'),
('movie:1165','movie:4073','1165','tmdb_id'),
('movie:7859','movie:4074','7859','tmdb_id'),
('movie:9829','movie:4075','9829','tmdb_id'),
('movie:219','movie:4076','219','tmdb_id'),
('movie:1523','movie:4077','1523','tmdb_id'),
('movie:1259','movie:4078','1259','tmdb_id'),
('movie:1440','movie:4079','1440','tmdb_id'),
('movie:1125','movie:4080','1125','tmdb_id'),
('movie:1372','movie:4081','1372','tmdb_id'),
('movie:496','movie:4082','496','tmdb_id'),
('movie:9693','movie:4083','9693','tmdb_id'),
('movie:1417','movie:4084','1417','tmdb_id'),
('movie:582','movie:4085','582','tmdb_id'),
('movie:13771','movie:4086','13771','tmdb_id'),
('movie:1781','movie:4087','1781','tmdb_id'),
('movie:13364','movie:4088','13364','tmdb_id'),
('movie:3549','movie:4089','3549','tmdb_id'),
('movie:34389','movie:4090','34389','tmdb_id'),
('movie:50100','movie:4091','50100','tmdb_id'),
('movie:533','movie:4092','533','tmdb_id'),
('movie:1776','movie:4093','1776','tmdb_id'),
('movie:9297','movie:4094','9297','tmdb_id'),
('movie:4566','movie:4095','4566','tmdb_id'),
('movie:2013','movie:4096','2013','tmdb_id'),
('movie:4347','movie:4097','4347','tmdb_id'),
('movie:13885','movie:4098','13885','tmdb_id'),
('movie:6973','movie:4099','6973','tmdb_id'),
('movie:2252','movie:4100','2252','tmdb_id'),
('movie:1919','movie:4101','1919','tmdb_id'),
('movie:8272','movie:4102','8272','tmdb_id'),
('movie:5915','movie:4103','5915','tmdb_id'),
('movie:3902','movie:4104','3902','tmdb_id'),
('movie:4517','movie:4105','4517','tmdb_id'),
('movie:6615','movie:4106','6615','tmdb_id'),
('movie:4771','movie:4107','4771','tmdb_id'),
('movie:4512','movie:4108','4512','tmdb_id'),
('movie:7862','movie:4109','7862','tmdb_id'),
('movie:15048','movie:4110','15048','tmdb_id'),
('movie:13362','movie:4111','13362','tmdb_id'),
('movie:6538','movie:4112','6538','tmdb_id'),
('movie:13614','movie:4113','13614','tmdb_id'),
('movie:16666','movie:4114','16666','tmdb_id'),
('movie:12246','movie:4115','12246','tmdb_id'),
('movie:9408','movie:4116','9408','tmdb_id'),
('movie:34981','movie:4117','34981','tmdb_id'),
('movie:4922','movie:4118','4922','tmdb_id'),
('movie:11499','movie:4119','11499','tmdb_id'),
('movie:8055','movie:4120','8055','tmdb_id'),
('movie:12473','movie:4121','12473','tmdb_id'),
('movie:2359','movie:4122','2359','tmdb_id'),
('movie:12901','movie:4123','12901','tmdb_id'),
('movie:10183','movie:4124','10183','tmdb_id'),
('movie:10139','movie:4125','10139','tmdb_id'),
('movie:14976','movie:4126','14976','tmdb_id'),
('movie:14359','movie:4127','14359','tmdb_id'),
('movie:7446','movie:4128','7446','tmdb_id'),
('movie:10503','movie:4129','10503','tmdb_id'),
('movie:6968','movie:4130','6968','tmdb_id'),
('movie:16804','movie:4131','16804','tmdb_id'),
('movie:3580','movie:4132','3580','tmdb_id'),
('movie:14048','movie:4133','14048','tmdb_id'),
('movie:40215','movie:4134','40215','tmdb_id'),
('movie:8885','movie:4135','8885','tmdb_id'),
('movie:12172','movie:4136','12172','tmdb_id'),
('movie:15451','movie:4137','15451','tmdb_id'),
('movie:41331','movie:4138','41331','tmdb_id'),
('movie:13053','movie:4139','13053','tmdb_id'),
('movie:22319','movie:4140','22319','tmdb_id'),
('movie:9502','movie:4141','9502','tmdb_id'),
('movie:12162','movie:4142','12162','tmdb_id'),
('movie:17654','movie:4143','17654','tmdb_id'),
('movie:25793','movie:4144','25793','tmdb_id'),
('movie:25196','movie:4145','25196','tmdb_id'),
('movie:34653','movie:4146','34653','tmdb_id'),
('movie:24684','movie:4147','24684','tmdb_id'),
('movie:7980','movie:4148','7980','tmdb_id'),
('movie:36811','movie:4149','36811','tmdb_id'),
('movie:28089','movie:4150','28089','tmdb_id'),
('movie:22954','movie:4151','22954','tmdb_id'),
('movie:24424','movie:4152','24424','tmdb_id'),
('movie:28644','movie:4153','28644','tmdb_id'),
('movie:21575','movie:4154','21575','tmdb_id'),
('movie:23128','movie:4155','23128','tmdb_id'),
('movie:18570','movie:4156','18570','tmdb_id'),
('movie:14836','movie:4157','14836','tmdb_id'),
('movie:55204','movie:4158','55204','tmdb_id'),
('movie:8435','movie:4159','8435','tmdb_id'),
('movie:77517','movie:4160','77517','tmdb_id'),
('movie:1904','movie:4161','1904','tmdb_id'),
('movie:1553','movie:4162','1553','tmdb_id'),
('movie:19833','movie:4163','19833','tmdb_id'),
('movie:205','movie:4164','205','tmdb_id'),
('movie:26963','movie:4165','26963','tmdb_id'),
('movie:9470','movie:4166','9470','tmdb_id'),
('movie:8618','movie:4167','8618','tmdb_id'),
('movie:1579','movie:4168','1579','tmdb_id'),
('movie:44003','movie:4169','44003','tmdb_id'),
('movie:11798','movie:4170','11798','tmdb_id'),
('movie:7979','movie:4171','7979','tmdb_id'),
('movie:4588','movie:4172','4588','tmdb_id'),
('movie:810','movie:4173','810','tmdb_id'),
('movie:5708','movie:4174','5708','tmdb_id'),
('movie:8882','movie:4175','8882','tmdb_id'),
('movie:11631','movie:4176','11631','tmdb_id'),
('movie:24469','movie:4177','24469','tmdb_id'),
('movie:33511','movie:4178','33511','tmdb_id'),
('movie:17431','movie:4179','17431','tmdb_id'),
('movie:37234','movie:4180','37234','tmdb_id'),
('movie:22897','movie:4181','22897','tmdb_id'),
('movie:11156','movie:4182','11156','tmdb_id'),
('movie:13310','movie:4183','13310','tmdb_id'),
('movie:8088','movie:4184','8088','tmdb_id'),
('movie:12404','movie:4185','12404','tmdb_id'),
('movie:8276','movie:4186','8276','tmdb_id'),
('movie:9899','movie:4187','9899','tmdb_id'),
('movie:9777','movie:4188','9777','tmdb_id'),
('movie:9515','movie:4189','9515','tmdb_id'),
('movie:11931','movie:4190','11931','tmdb_id'),
('movie:9043','movie:4191','9043','tmdb_id'),
('movie:2008','movie:4192','2008','tmdb_id'),
('movie:254','movie:4193','254','tmdb_id'),
('movie:10741','movie:4194','10741','tmdb_id'),
('movie:13075','movie:4195','13075','tmdb_id'),
('movie:13967','movie:4196','13967','tmdb_id'),
('movie:7510','movie:4197','7510','tmdb_id'),
('movie:1249','movie:4198','1249','tmdb_id'),
('movie:1262','movie:4199','1262','tmdb_id'),
('movie:14047','movie:4200','14047','tmdb_id'),
('movie:16367','movie:4201','16367','tmdb_id'),
('movie:4688','movie:4202','4688','tmdb_id'),
('movie:2976','movie:4203','2976','tmdb_id'),
('movie:1420','movie:4204','1420','tmdb_id'),
('movie:1988','movie:4205','1988','tmdb_id'),
('movie:6575','movie:4206','6575','tmdb_id'),
('movie:5559','movie:4207','5559','tmdb_id'),
('movie:17077','movie:4208','17077','tmdb_id'),
('movie:16409','movie:4209','16409','tmdb_id'),
('movie:10189','movie:4210','10189','tmdb_id'),
('movie:12783','movie:4211','12783','tmdb_id'),
('movie:4413','movie:4212','4413','tmdb_id'),
('movie:19913','movie:4213','19913','tmdb_id'),
('movie:18320','movie:4214','18320','tmdb_id'),
('movie:27567','movie:4215','27567','tmdb_id'),
('movie:7445','movie:4216','7445','tmdb_id'),
('movie:16558','movie:4217','16558','tmdb_id'),
('movie:11323','movie:4218','11323','tmdb_id'),
('movie:25846','movie:4219','25846','tmdb_id'),
('movie:31289','movie:4220','31289','tmdb_id'),
('movie:2016','movie:4221','2016','tmdb_id'),
('movie:82404','movie:4222','82404','tmdb_id'),
('movie:53486','movie:4223','53486','tmdb_id'),
('movie:8324','movie:4224','8324','tmdb_id'),
('movie:71732','movie:4225','71732','tmdb_id'),
('movie:36143','movie:4226','36143','tmdb_id'),
('movie:1379','movie:4227','1379','tmdb_id'),
('movie:11705','movie:4228','11705','tmdb_id'),
('movie:4723','movie:4229','4723','tmdb_id'),
('movie:68944','movie:4230','68944','tmdb_id'),
('movie:17422','movie:4231','17422','tmdb_id'),
('movie:1887','movie:4232','1887','tmdb_id'),
('movie:3509','movie:4233','3509','tmdb_id'),
('movie:58296','movie:4234','58296','tmdb_id'),
('movie:68259','movie:4235','68259','tmdb_id'),
('movie:96010','movie:4236','96010','tmdb_id'),
('movie:129933','movie:4237','129933','tmdb_id'),
('movie:79034','movie:4238','79034','tmdb_id'),
('movie:8436','movie:4239','8436','tmdb_id'),
('movie:24185','movie:4240','24185','tmdb_id'),
('movie:31325','movie:4241','31325','tmdb_id'),
('movie:99739','movie:4242','99739','tmdb_id'),
('movie:126529','movie:4243','126529','tmdb_id'),
('movie:15742','movie:4244','15742','tmdb_id'),
('movie:182633','movie:4245','182633','tmdb_id'),
('movie:51244','movie:4246','51244','tmdb_id'),
('movie:37766','movie:4247','37766','tmdb_id'),
('movie:12681','movie:4248','12681','tmdb_id'),
('movie:48119','movie:4249','48119','tmdb_id'),
('movie:13943','movie:4250','13943','tmdb_id'),
('movie:352749','movie:4251','352749','tmdb_id'),
('movie:25142','movie:4252','25142','tmdb_id'),
('movie:2014','movie:4253','2014','tmdb_id'),
('movie:14448','movie:4254','14448','tmdb_id'),
('movie:1989','movie:4255','1989','tmdb_id'),
('movie:2010','movie:4256','2010','tmdb_id'),
('movie:1990','movie:4257','1990','tmdb_id'),
('movie:8269','movie:4258','8269','tmdb_id'),
('movie:2015','movie:4259','2015','tmdb_id'),
('movie:31262','movie:4260','31262','tmdb_id'),
('movie:4998','movie:4261','4998','tmdb_id'),
('movie:2001','movie:4262','2001','tmdb_id'),
('movie:126682','movie:4263','126682','tmdb_id'),
('movie:2002','movie:4264','2002','tmdb_id'),
('movie:2012','movie:4265','2012','tmdb_id'),
('movie:3397','movie:4266','3397','tmdb_id'),
('movie:6360','movie:4267','6360','tmdb_id'),
('movie:25647','movie:4268','25647','tmdb_id'),
('movie:19098','movie:4269','19098','tmdb_id'),
('movie:46914','movie:4270','46914','tmdb_id'),
('movie:49765','movie:4271','49765','tmdb_id'),
('movie:46930','movie:4272','46930','tmdb_id'),
('movie:5259','movie:4273','5259','tmdb_id'),
('movie:51520','movie:4274','51520','tmdb_id'),
('movie:9789','movie:4275','9789','tmdb_id'),
('movie:5817','movie:4276','5817','tmdb_id'),
('movie:57654','movie:4277','57654','tmdb_id'),
('movie:12198','movie:4278','12198','tmdb_id'),
('movie:39489','movie:4279','39489','tmdb_id'),
('movie:10818','movie:4280','10818','tmdb_id'),
('movie:126679','movie:4281','126679','tmdb_id'),
(null,'movie:4282','festival:cannes:2008:che','identity_key'),
('movie:16135','movie:4283','16135','tmdb_id'),
('movie:8895','movie:4284','8895','tmdb_id'),
('movie:8896','movie:4285','8896','tmdb_id'),
('movie:17342','movie:4286','17342','tmdb_id'),
('movie:8832','movie:4287','8832','tmdb_id'),
('movie:8338','movie:4288','8338','tmdb_id'),
('movie:8841','movie:4289','8841','tmdb_id'),
('movie:8897','movie:4290','8897','tmdb_id'),
('movie:8898','movie:4291','8898','tmdb_id'),
('movie:8899','movie:4292','8899','tmdb_id'),
('movie:8900','movie:4293','8900','tmdb_id'),
('movie:8902','movie:4294','8902','tmdb_id'),
('movie:4960','movie:4295','4960','tmdb_id'),
('movie:8886','movie:4296','8886','tmdb_id'),
('movie:8892','movie:4297','8892','tmdb_id'),
('movie:8925','movie:4298','8925','tmdb_id'),
('movie:8926','movie:4299','8926','tmdb_id'),
('movie:10360','movie:4300','10360','tmdb_id'),
('movie:8927','movie:4301','8927','tmdb_id'),
('movie:8931','movie:4302','8931','tmdb_id'),
('movie:8929','movie:4303','8929','tmdb_id'),
('movie:8932','movie:4304','8932','tmdb_id'),
('movie:8928','movie:4305','8928','tmdb_id'),
('movie:8933','movie:4306','8933','tmdb_id'),
('movie:8943','movie:4307','8943','tmdb_id'),
('movie:8934','movie:4308','8934','tmdb_id'),
('movie:8937','movie:4309','8937','tmdb_id'),
('movie:8938','movie:4310','8938','tmdb_id'),
('movie:8930','movie:4311','8930','tmdb_id'),
('movie:8941','movie:4312','8941','tmdb_id'),
('movie:8942','movie:4313','8942','tmdb_id'),
('movie:29963','movie:4314','29963','tmdb_id'),
('movie:22536','movie:4315','22536','tmdb_id'),
('movie:117646','movie:4316','117646','tmdb_id'),
('movie:34647','movie:4317','34647','tmdb_id'),
('movie:8940','movie:4318','8940','tmdb_id'),
('movie:18898','movie:4319','18898','tmdb_id'),
('movie:26320','movie:4320','26320','tmdb_id'),
('movie:44898','movie:4321','44898','tmdb_id'),
('movie:8906','movie:4322','8906','tmdb_id'),
('movie:18899','movie:4323','18899','tmdb_id'),
('movie:30239','movie:4324','30239','tmdb_id'),
('movie:53520','movie:4325','53520','tmdb_id'),
('movie:37842','movie:4326','37842','tmdb_id'),
('movie:46458','movie:4327','46458','tmdb_id'),
('movie:125344','movie:4328','125344','tmdb_id'),
('movie:35164','movie:4329','35164','tmdb_id'),
('movie:51413','movie:4330','51413','tmdb_id'),
('movie:37810','movie:4331','37810','tmdb_id'),
('movie:163899','movie:4332','163899','tmdb_id'),
('movie:39378','movie:4333','39378','tmdb_id'),
('movie:43614','movie:4334','43614','tmdb_id'),
('movie:25053','movie:4335','25053','tmdb_id'),
('movie:30018','movie:4336','30018','tmdb_id'),
('movie:95538','movie:4337','95538','tmdb_id'),
('movie:33913','movie:4338','33913','tmdb_id'),
('movie:32511','movie:4339','32511','tmdb_id'),
('movie:47075','movie:4340','47075','tmdb_id'),
('movie:50086','movie:4341','50086','tmdb_id'),
('movie:17772','movie:4342','17772','tmdb_id'),
('movie:48303','movie:4343','48303','tmdb_id'),
('movie:38363','movie:4344','38363','tmdb_id'),
('movie:172878','movie:4345','172878','tmdb_id'),
('movie:38368','movie:4346','38368','tmdb_id'),
('movie:45284','movie:4347','45284','tmdb_id'),
('movie:47909','movie:4348','47909','tmdb_id'),
('movie:59065','movie:4349','59065','tmdb_id'),
('movie:46920','movie:4350','46920','tmdb_id'),
('movie:57695','movie:4351','57695','tmdb_id'),
('movie:39641','movie:4352','39641','tmdb_id'),
('movie:63458','movie:4353','63458','tmdb_id'),
('movie:73311','movie:4354','73311','tmdb_id'),
('movie:57602','movie:4355','57602','tmdb_id'),
('movie:81527','movie:4356','81527','tmdb_id'),
('movie:60981','movie:4357','60981','tmdb_id'),
('movie:47261','movie:4358','47261','tmdb_id'),
('movie:48946','movie:4359','48946','tmdb_id'),
('movie:45202','movie:4360','45202','tmdb_id'),
('movie:54083','movie:4361','54083','tmdb_id'),
('movie:60098','movie:4362','60098','tmdb_id'),
('movie:45244','movie:4363','45244','tmdb_id'),
('movie:41273','movie:4364','41273','tmdb_id'),
('movie:163930','movie:4365','163930','tmdb_id'),
('movie:55151','movie:4366','55151','tmdb_id'),
('movie:53413','movie:4367','53413','tmdb_id'),
('movie:57395','movie:4368','57395','tmdb_id'),
('movie:73423','movie:4369','73423','tmdb_id'),
('movie:163942','movie:4370','163942','tmdb_id'),
('movie:123889','movie:4371','123889','tmdb_id'),
('movie:78400','movie:4372','78400','tmdb_id'),
('movie:24171','movie:4373','24171','tmdb_id'),
('movie:24170','movie:4374','24170','tmdb_id'),
('movie:51241','movie:4375','51241','tmdb_id'),
('movie:99215','movie:4376','99215','tmdb_id'),
('movie:12130','movie:4377','12130','tmdb_id'),
('movie:13807','movie:4378','13807','tmdb_id'),
('movie:59015','movie:4379','59015','tmdb_id'),
('movie:21959','movie:4380','21959','tmdb_id'),
('movie:12156','movie:4381','12156','tmdb_id'),
('movie:4977','movie:4382','4977','tmdb_id'),
('movie:1993','movie:4383','1993','tmdb_id'),
('movie:108772','movie:4384','108772','tmdb_id'),
('movie:45316','movie:4385','45316','tmdb_id'),
('movie:2346','movie:4386','2346','tmdb_id'),
('movie:41727','movie:4387','41727','tmdb_id'),
('movie:24189','movie:4388','24189','tmdb_id'),
('movie:101822','movie:4389','101822','tmdb_id'),
('movie:314114','movie:4390','314114','tmdb_id'),
('movie:95342','movie:4391','95342','tmdb_id'),
('movie:9672','movie:4392','9672','tmdb_id'),
('movie:63923','movie:4393','63923','tmdb_id'),
('movie:18586','movie:4394','18586','tmdb_id'),
('movie:14201','movie:4395','14201','tmdb_id'),
('movie:49577','movie:4396','49577','tmdb_id'),
('movie:185570','movie:4397','185570','tmdb_id'),
('movie:29568','movie:4398','29568','tmdb_id'),
('movie:3982','movie:4399','3982','tmdb_id'),
('movie:7992','movie:4400','7992','tmdb_id'),
('movie:82349','movie:4401','82349','tmdb_id'),
('movie:115320','movie:4402','115320','tmdb_id'),
('movie:4556','movie:4403','4556','tmdb_id'),
('movie:11600','movie:4404','11600','tmdb_id'),
('movie:4520','movie:4405','4520','tmdb_id'),
('movie:14016','movie:4406','14016','tmdb_id'),
('movie:45458','movie:4407','45458','tmdb_id'),
('movie:13637','movie:4408','13637','tmdb_id'),
('movie:72303','movie:4409','72303','tmdb_id'),
('movie:214944','movie:4410','214944','tmdb_id'),
('movie:163659','movie:4411','163659','tmdb_id'),
('movie:94509','movie:4412','94509','tmdb_id'),
('movie:55191','movie:4413','55191','tmdb_id'),
('movie:72286','movie:4414','72286','tmdb_id'),
('movie:360360','movie:4415','360360','tmdb_id'),
('movie:152335','movie:4416','152335','tmdb_id'),
('movie:127838','movie:4417','127838','tmdb_id'),
('movie:57297','movie:4418','57297','tmdb_id'),
('movie:78527','movie:4419','78527','tmdb_id'),
('movie:46847','movie:4420','46847','tmdb_id'),
('movie:352371','movie:4421','352371','tmdb_id'),
('movie:125556','movie:4422','125556','tmdb_id'),
('movie:12811','movie:4423','12811','tmdb_id'),
('movie:130442','movie:4424','130442','tmdb_id'),
('movie:121232','movie:4425','121232','tmdb_id'),
('movie:479413','movie:4426','479413','tmdb_id'),
('movie:12426','movie:4427','12426','tmdb_id'),
('movie:12424','movie:4428','12424','tmdb_id'),
('movie:12406','movie:4429','12406','tmdb_id'),
('movie:12161','movie:4430','12161','tmdb_id'),
('movie:12422','movie:4431','12422','tmdb_id'),
('movie:15877','movie:4432','15877','tmdb_id'),
('movie:12433','movie:4433','12433','tmdb_id'),
('movie:12471','movie:4434','12471','tmdb_id'),
('movie:12165','movie:4435','12165','tmdb_id'),
('movie:12429','movie:4436','12429','tmdb_id'),
('movie:12427','movie:4437','12427','tmdb_id'),
('movie:12430','movie:4438','12430','tmdb_id'),
('movie:12434','movie:4439','12434','tmdb_id'),
('movie:171061','movie:4440','171061','tmdb_id'),
('movie:52247','movie:4441','52247','tmdb_id'),
('movie:121688','movie:4442','121688','tmdb_id'),
('movie:69527','movie:4443','69527','tmdb_id'),
('movie:21371','movie:4444','21371','tmdb_id'),
('movie:271869','movie:4445','271869','tmdb_id'),
('movie:35647','movie:4446','35647','tmdb_id'),
('movie:200785','movie:4447','200785','tmdb_id'),
('movie:1357554','movie:4448','1357554','tmdb_id'),
('movie:117896','movie:4449','117896','tmdb_id'),
('movie:86440','movie:4450','86440','tmdb_id'),
('movie:37000','movie:4451','37000','tmdb_id'),
('movie:178478','movie:4452','178478','tmdb_id'),
('movie:247483','movie:4453','247483','tmdb_id'),
('movie:95585','movie:4454','95585','tmdb_id'),
('movie:113038','movie:4455','113038','tmdb_id'),
('movie:59947','movie:4456','59947','tmdb_id'),
('movie:203529','movie:4457','203529','tmdb_id'),
('movie:12432','movie:4458','12432','tmdb_id'),
('movie:11699','movie:4459','11699','tmdb_id'),
('movie:767592','movie:4460','767592','tmdb_id'),
('movie:203221','movie:4461','203221','tmdb_id'),
('movie:42571','movie:4462','42571','tmdb_id'),
('movie:22074','movie:4463','22074','tmdb_id'),
('movie:39800','movie:4464','39800','tmdb_id'),
('movie:203530','movie:4465','203530','tmdb_id'),
('movie:51477','movie:4466','51477','tmdb_id'),
('movie:32084','movie:4467','32084','tmdb_id'),
('movie:41123','movie:4468','41123','tmdb_id'),
('movie:56844','movie:4469','56844','tmdb_id'),
('movie:31175','movie:4470','31175','tmdb_id'),
('movie:44027','movie:4471','44027','tmdb_id'),
('movie:52034','movie:4472','52034','tmdb_id'),
('movie:29426','movie:4473','29426','tmdb_id'),
('movie:57534','movie:4474','57534','tmdb_id'),
('movie:20766','movie:4475','20766','tmdb_id'),
('movie:46207','movie:4476','46207','tmdb_id'),
('movie:78380','movie:4477','78380','tmdb_id'),
('movie:59992','movie:4478','59992','tmdb_id'),
('movie:34499','movie:4479','34499','tmdb_id'),
('movie:260649','movie:4480','260649','tmdb_id'),
('movie:108519','movie:4481','108519','tmdb_id'),
('movie:81076','movie:4482','81076','tmdb_id'),
('movie:237958','movie:4483','237958','tmdb_id'),
('movie:58586','movie:4484','58586','tmdb_id'),
('movie:323018','movie:4485','323018','tmdb_id'),
('movie:87199','movie:4486','87199','tmdb_id'),
('movie:435883','movie:4487','435883','tmdb_id'),
('movie:111396','movie:4488','111396','tmdb_id'),
('movie:198959','movie:4489','198959','tmdb_id'),
('movie:57802','movie:4490','57802','tmdb_id'),
('movie:56812','movie:4491','56812','tmdb_id'),
('movie:73202','movie:4492','73202','tmdb_id'),
('movie:62321','movie:4493','62321','tmdb_id'),
('movie:53256','movie:4494','53256','tmdb_id'),
('movie:59507','movie:4495','59507','tmdb_id'),
('movie:48243','movie:4496','48243','tmdb_id'),
('movie:58857','movie:4497','58857','tmdb_id'),
('movie:56799','movie:4498','56799','tmdb_id'),
('movie:53399','movie:4499','53399','tmdb_id'),
('movie:45595','movie:4500','45595','tmdb_id'),
('movie:57120','movie:4501','57120','tmdb_id'),
('movie:57703','movie:4502','57703','tmdb_id'),
('movie:56853','movie:4503','56853','tmdb_id'),
('movie:48492','movie:4504','48492','tmdb_id'),
('movie:56815','movie:4505','56815','tmdb_id'),
('movie:45950','movie:4506','45950','tmdb_id'),
('movie:51276','movie:4507','51276','tmdb_id'),
('movie:39210','movie:4508','39210','tmdb_id'),
('movie:56405','movie:4509','56405','tmdb_id'),
('movie:213087','movie:4510','213087','tmdb_id'),
('movie:42707','movie:4511','42707','tmdb_id'),
('movie:96589','movie:4512','96589','tmdb_id'),
('movie:123029','movie:4513','123029','tmdb_id'),
('movie:56519','movie:4514','56519','tmdb_id'),
('movie:178832','movie:4515','178832','tmdb_id'),
('movie:81634','movie:4516','81634','tmdb_id'),
('movie:81648','movie:4517','81648','tmdb_id'),
('movie:85924','movie:4518','85924','tmdb_id'),
('movie:86261','movie:4519','86261','tmdb_id'),
('movie:65016','movie:4520','65016','tmdb_id'),
('movie:69340','movie:4521','69340','tmdb_id'),
('movie:104988','movie:4522','104988','tmdb_id'),
('movie:105554','movie:4523','105554','tmdb_id'),
('movie:9526','movie:4524','9526','tmdb_id'),
('movie:4441','movie:4525','4441','tmdb_id'),
('movie:68341','movie:4526','68341','tmdb_id'),
('movie:9999','movie:4527','9999','tmdb_id'),
('movie:99495','movie:4528','99495','tmdb_id'),
('movie:317','movie:4529','317','tmdb_id'),
('movie:74651','movie:4530','74651','tmdb_id'),
('movie:99896','movie:4531','99896','tmdb_id'),
('movie:38025','movie:4532','38025','tmdb_id'),
('movie:12713','movie:4533','12713','tmdb_id'),
('movie:523','movie:4534','523','tmdb_id'),
('movie:15845','movie:4535','15845','tmdb_id'),
('movie:313','movie:4536','313','tmdb_id'),
('movie:13209','movie:4537','13209','tmdb_id'),
('movie:7872','movie:4538','7872','tmdb_id'),
('movie:14375','movie:4539','14375','tmdb_id'),
('movie:4630','movie:4540','4630','tmdb_id'),
('movie:4351','movie:4541','4351','tmdb_id'),
('movie:76853','movie:4542','76853','tmdb_id'),
('movie:1874','movie:4543','1874','tmdb_id'),
('movie:2239','movie:4544','2239','tmdb_id'),
('movie:78115','movie:4545','78115','tmdb_id'),
('movie:58099','movie:4546','58099','tmdb_id'),
('movie:351','movie:4547','351','tmdb_id'),
('movie:38282','movie:4548','38282','tmdb_id'),
('movie:1922','movie:4549','1922','tmdb_id'),
('movie:46335','movie:4550','46335','tmdb_id'),
('movie:37838','movie:4551','37838','tmdb_id'),
('movie:182','movie:4552','182','tmdb_id'),
('movie:5488','movie:4553','5488','tmdb_id'),
('movie:12555','movie:4554','12555','tmdb_id'),
('movie:1247','movie:4555','1247','tmdb_id'),
('movie:30112','movie:4556','30112','tmdb_id'),
('movie:24059','movie:4557','24059','tmdb_id'),
('movie:2694','movie:4558','2694','tmdb_id'),
('movie:14421','movie:4559','14421','tmdb_id'),
('movie:3037','movie:4560','3037','tmdb_id'),
('movie:25112','movie:4561','25112','tmdb_id'),
('movie:54254','movie:4562','54254','tmdb_id'),
('movie:52814','movie:4563','52814','tmdb_id'),
('movie:16867','movie:4564','16867','tmdb_id'),
('movie:7351','movie:4565','7351','tmdb_id'),
('movie:25746','movie:4566','25746','tmdb_id'),
('movie:22274','movie:4567','22274','tmdb_id'),
('movie:6461','movie:4568','6461','tmdb_id'),
('movie:78236','movie:4569','78236','tmdb_id'),
('movie:11671','movie:4570','11671','tmdb_id'),
('movie:65726','movie:4571','65726','tmdb_id'),
('movie:8847','movie:4572','8847','tmdb_id'),
('movie:25004','movie:4573','25004','tmdb_id'),
('movie:57859','movie:4574','57859','tmdb_id'),
('movie:33809','movie:4575','33809','tmdb_id'),
('movie:7346','movie:4576','7346','tmdb_id'),
('movie:22215','movie:4577','22215','tmdb_id'),
('movie:7347','movie:4578','7347','tmdb_id'),
('movie:39488','movie:4579','39488','tmdb_id'),
('movie:39072','movie:4580','39072','tmdb_id'),
('movie:13975','movie:4581','13975','tmdb_id'),
('movie:34208','movie:4582','34208','tmdb_id'),
('movie:31205','movie:4583','31205','tmdb_id'),
('movie:39358','movie:4584','39358','tmdb_id'),
('movie:33974','movie:4585','33974','tmdb_id'),
('movie:26738','movie:4586','26738','tmdb_id'),
('movie:26820','movie:4587','26820','tmdb_id'),
('movie:44837','movie:4588','44837','tmdb_id'),
('movie:22136','movie:4589','22136','tmdb_id'),
('movie:44160','movie:4590','44160','tmdb_id'),
('movie:46106','movie:4591','46106','tmdb_id'),
('movie:37181','movie:4592','37181','tmdb_id'),
('movie:54524','movie:4593','54524','tmdb_id'),
('movie:58483','movie:4594','58483','tmdb_id'),
('movie:51010','movie:4595','51010','tmdb_id'),
('movie:31035','movie:4596','31035','tmdb_id'),
('movie:16031','movie:4597','16031','tmdb_id'),
('movie:39840','movie:4598','39840','tmdb_id'),
('movie:38568','movie:4599','38568','tmdb_id'),
('movie:50817','movie:4600','50817','tmdb_id'),
('movie:41272','movie:4601','41272','tmdb_id'),
('movie:27583','movie:4602','27583','tmdb_id'),
('movie:44555','movie:4603','44555','tmdb_id'),
('movie:55530','movie:4604','55530','tmdb_id'),
('movie:52767','movie:4605','52767','tmdb_id'),
('movie:46789','movie:4606','46789','tmdb_id'),
('movie:129955','movie:4607','129955','tmdb_id'),
('movie:61623','movie:4608','61623','tmdb_id'),
('movie:37414','movie:4609','37414','tmdb_id'),
('movie:7509','movie:4610','7509','tmdb_id'),
('movie:10197','movie:4611','10197','tmdb_id'),
('movie:26763','movie:4612','26763','tmdb_id'),
('movie:34576','movie:4613','34576','tmdb_id'),
('movie:120393','movie:4614','120393','tmdb_id'),
('movie:25532','movie:4615','25532','tmdb_id'),
('movie:13402','movie:4616','13402','tmdb_id'),
('movie:14064','movie:4617','14064','tmdb_id'),
('movie:2168','movie:4618','2168','tmdb_id'),
('movie:8267','movie:4619','8267','tmdb_id'),
('movie:22521','movie:4620','22521','tmdb_id'),
('movie:29972','movie:4621','29972','tmdb_id'),
('movie:8903','movie:4622','8903','tmdb_id'),
('movie:8904','movie:4623','8904','tmdb_id'),
('movie:8939','movie:4624','8939','tmdb_id'),
('movie:8935','movie:4625','8935','tmdb_id'),
('movie:64450','movie:4626','64450','tmdb_id'),
('movie:41545','movie:4627','41545','tmdb_id'),
('movie:52322','movie:4628','52322','tmdb_id'),
('movie:1896','movie:4629','1896','tmdb_id'),
('movie:17479','movie:4630','17479','tmdb_id'),
('movie:72891','movie:4631','72891','tmdb_id'),
('movie:38318','movie:4632','38318','tmdb_id'),
('movie:27904','movie:4633','27904','tmdb_id'),
('movie:79072','movie:4634','79072','tmdb_id'),
('movie:553126','movie:4635','553126','tmdb_id'),
('movie:83267','movie:4636','83267','tmdb_id'),
('movie:97476','movie:4637','97476','tmdb_id'),
('movie:39267','movie:4638','39267','tmdb_id'),
('tv:16468','movie:4639','16468','tmdb_tv_id'),
('movie:102347','movie:4640','102347','tmdb_id'),
('movie:54326','movie:4641','54326','tmdb_id'),
('movie:106999','movie:4642','106999','tmdb_id'),
('movie:24220','movie:4643','24220','tmdb_id'),
('movie:644365','movie:4644','644365','tmdb_id'),
('movie:26859','movie:4645','26859','tmdb_id'),
('movie:167710','movie:4646','167710','tmdb_id'),
('movie:291135','movie:4647','291135','tmdb_id'),
('movie:12166','movie:4648','12166','tmdb_id'),
('movie:12425','movie:4649','12425','tmdb_id'),
('movie:8280','movie:4650','8280','tmdb_id'),
('movie:461640','movie:4651','461640','tmdb_id'),
('movie:72985','movie:4652','72985','tmdb_id'),
('movie:25474','movie:4653','25474','tmdb_id'),
('movie:44159','movie:4654','44159','tmdb_id'),
('movie:44714','movie:4655','44714','tmdb_id'),
('movie:79766','movie:4656','79766','tmdb_id'),
('movie:373574','movie:4657','373574','tmdb_id'),
('movie:163660','movie:4658','163660','tmdb_id'),
('movie:29956','movie:4659','29956','tmdb_id'),
('movie:462891','movie:4660','462891','tmdb_id'),
('movie:91067','movie:4661','91067','tmdb_id'),
('movie:51885','movie:4662','51885','tmdb_id'),
('movie:103443','movie:4663','103443','tmdb_id'),
('movie:41181','movie:4664','41181','tmdb_id'),
('movie:584944','movie:4665','584944','tmdb_id'),
('movie:40977','movie:4666','40977','tmdb_id'),
('movie:57322','movie:4667','57322','tmdb_id'),
('movie:16705','movie:4668','16705','tmdb_id'),
('movie:35619','movie:4669','35619','tmdb_id'),
('movie:38325','movie:4670','38325','tmdb_id'),
('movie:300576','movie:4671','300576','tmdb_id'),
('movie:11801','movie:4672','11801','tmdb_id'),
('movie:340365','movie:4673','340365','tmdb_id'),
('movie:70137','movie:4674','70137','tmdb_id'),
('movie:37832','movie:4675','37832','tmdb_id'),
('movie:299541','movie:4676','299541','tmdb_id'),
('movie:396142','movie:4677','396142','tmdb_id'),
('movie:329234','movie:4678','329234','tmdb_id'),
('movie:580589','movie:4679','580589','tmdb_id'),
('movie:502297','movie:4680','502297','tmdb_id'),
('movie:358252','movie:4681','358252','tmdb_id'),
('movie:634323','movie:4682','634323','tmdb_id')
) as expected(provider_key,work_key,tmdb_id,metadata_field)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>expected.metadata_field) is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4045','movie',4045,'{"id":4045,"title":"Capote","director":"Bennett Miller","year":2005,"tmdb_id":398,"imdb_id":"tt0379725","original_title":"Capote","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4046','movie',4046,'{"id":4046,"title":"Munich","director":"Steven Spielberg","year":2005,"tmdb_id":612,"imdb_id":"tt0408306","original_title":"Munich","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4047','movie',4047,'{"id":4047,"title":"Good Night, and Good Luck.","director":"George Clooney","year":2005,"tmdb_id":3291,"imdb_id":"tt0433383","original_title":"Good Night, and Good Luck.","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4048','movie',4048,'{"id":4048,"title":"Crash","director":"Paul Haggis","year":2005,"tmdb_id":1640,"imdb_id":"tt0375679","original_title":"Crash","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4049','movie',4049,'{"id":4049,"title":"Walk the Line","director":"James Mangold","year":2005,"tmdb_id":69,"imdb_id":"tt0358273","original_title":"Walk the Line","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4050','movie',4050,'{"id":4050,"title":"Hustle & Flow","director":"Craig Brewer","year":2005,"tmdb_id":10476,"imdb_id":"tt0410097","original_title":"Hustle & Flow","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4051','movie',4051,'{"id":4051,"title":"Transamerica","director":"Duncan Tucker","year":2005,"tmdb_id":546,"imdb_id":"tt0407265","original_title":"Transamerica","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4052','movie',4052,'{"id":4052,"title":"Pride & Prejudice","director":"Joe Wright","year":2005,"tmdb_id":4348,"imdb_id":"tt0414387","original_title":"Pride & Prejudice","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4053','movie',4053,'{"id":4053,"title":"Syriana","director":"Stephen Gaghan","year":2005,"tmdb_id":231,"imdb_id":"tt0365737","original_title":"Syriana","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4054','movie',4054,'{"id":4054,"title":"A History of Violence","director":"David Cronenberg","year":2005,"tmdb_id":59,"imdb_id":"tt0399146","original_title":"A History of Violence","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4055','movie',4055,'{"id":4055,"title":"Mrs. Henderson Presents","director":"Stephen Frears","year":2005,"tmdb_id":10773,"imdb_id":"tt0413015","original_title":"Mrs. Henderson Presents","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4056','movie',4056,'{"id":4056,"title":"Junebug","director":"Phil Morrison","year":2005,"tmdb_id":1444,"imdb_id":"tt0418773","original_title":"Junebug","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4057','movie',4057,'{"id":4057,"title":"The Squid and the Whale","director":"Noah Baumbach","year":2005,"tmdb_id":10707,"imdb_id":"tt0367089","original_title":"The Squid and the Whale","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4058','movie',4058,'{"id":4058,"title":"Tsotsi","director":"Gavin Hood","year":2005,"tmdb_id":868,"imdb_id":"tt0468565","original_title":"Tsotsi","original_language":"tn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4059','movie',4059,'{"id":4059,"title":"The Constant Gardener","director":"Fernando Meirelles","year":2005,"tmdb_id":1985,"imdb_id":"tt0387131","original_title":"The Constant Gardener","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4060','movie',4060,'{"id":4060,"title":"Cinderella Man","director":"Ron Howard","year":2005,"tmdb_id":921,"imdb_id":"tt0352248","original_title":"Cinderella Man","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4061','movie',4061,'{"id":4061,"title":"Don''t Tell","director":"Isaac H. Eaton","year":2005,"tmdb_id":1084642,"imdb_id":"tt0417077","original_title":"Don''t Tell","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4062','movie',4062,'{"id":4062,"title":"Paradise Now","director":"Hany Abu-Assad","year":2005,"tmdb_id":67,"imdb_id":"tt0445620","original_title":"Paradise Now","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4063','movie',4063,'{"id":4063,"title":"Joyeux Noel","director":"Christian Carion","year":2005,"tmdb_id":11661,"imdb_id":"tt0424205","original_title":"Joyeux Noël","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4064','movie',4064,'{"id":4064,"title":"March of the Penguins","director":"Luc Jacquet","year":2005,"tmdb_id":1667,"imdb_id":"tt0428803","original_title":"La Marche de l''empereur","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4065','movie',4065,'{"id":4065,"title":"North Country","director":"Niki Caro","year":2005,"tmdb_id":9701,"imdb_id":"tt0395972","original_title":"North Country","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4066','movie',4066,'{"id":4066,"title":"Darwin''s Nightmare","director":"Hubert Sauper","year":2005,"tmdb_id":415253,"imdb_id":"tt0424024","original_title":"Darwin''s Nightmare","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4067','movie',4067,'{"id":4067,"title":"Sophie Scholl: The Final Days","director":"Marc Rothemund","year":2005,"tmdb_id":2117,"imdb_id":"tt0426578","original_title":"Sophie Scholl – Die letzten Tage","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4068','movie',4068,'{"id":4068,"title":"Street Fight","director":"Marshall Curry","year":2005,"tmdb_id":29044,"imdb_id":"tt0457496","original_title":"Street Fight","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4069','movie',4069,'{"id":4069,"title":"Corpse Bride","director":"Mike Johnson, Tim Burton","year":2005,"tmdb_id":3933,"imdb_id":"tt0121164","original_title":"Corpse Bride","original_language":"en","alternate_titles":["Tim Burton''s Corpse Bride"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4070','movie',4070,'{"id":4070,"title":"Enron: The Smartest Guys in the Room","director":"Alex Gibney","year":2005,"tmdb_id":13020,"imdb_id":"tt1016268","original_title":"Enron: The Smartest Guys in the Room","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4071','movie',4071,'{"id":4071,"title":"Murderball","director":"Henry Alex Rubin, Dana Adam Shapiro","year":2005,"tmdb_id":14278,"imdb_id":"tt0436613","original_title":"Murderball","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4072','movie',4072,'{"id":4072,"title":"Little Miss Sunshine","director":"Valerie Faris, Jonathan Dayton","year":2006,"tmdb_id":773,"imdb_id":"tt0449059","original_title":"Little Miss Sunshine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4073','movie',4073,'{"id":4073,"title":"The Queen","director":"Stephen Frears","year":2006,"tmdb_id":1165,"imdb_id":"tt0436697","original_title":"The Queen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4074','movie',4074,'{"id":4074,"title":"Half Nelson","director":"Ryan Fleck","year":2006,"tmdb_id":7859,"imdb_id":"tt0468489","original_title":"Half Nelson","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4075','movie',4075,'{"id":4075,"title":"United 93","director":"Paul Greengrass","year":2006,"tmdb_id":9829,"imdb_id":"tt0475276","original_title":"United 93","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4076','movie',4076,'{"id":4076,"title":"Volver","director":"Pedro Almodóvar","year":2006,"tmdb_id":219,"imdb_id":"tt0441909","original_title":"Volver","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4077','movie',4077,'{"id":4077,"title":"The Last King of Scotland","director":"Kevin Macdonald","year":2006,"tmdb_id":1523,"imdb_id":"tt0455590","original_title":"The Last King of Scotland","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4078','movie',4078,'{"id":4078,"title":"Notes on a Scandal","director":"Richard Eyre","year":2006,"tmdb_id":1259,"imdb_id":"tt0465551","original_title":"Notes on a Scandal","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4079','movie',4079,'{"id":4079,"title":"Little Children","director":"Todd Field","year":2006,"tmdb_id":1440,"imdb_id":"tt0404203","original_title":"Little Children","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4080','movie',4080,'{"id":4080,"title":"Dreamgirls","director":"Bill Condon","year":2006,"tmdb_id":1125,"imdb_id":"tt0443489","original_title":"Dreamgirls","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4081','movie',4081,'{"id":4081,"title":"Blood Diamond","director":"Edward Zwick","year":2006,"tmdb_id":1372,"imdb_id":"tt0450259","original_title":"Blood Diamond","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4082','movie',4082,'{"id":4082,"title":"Borat: Cultural Learnings of America for Make Benefit Glorious Nation of Kazakhstan","director":"Larry Charles","year":2006,"tmdb_id":496,"imdb_id":"tt0443453","original_title":"Borat: Cultural Learnings of America for Make Benefit Glorious Nation of Kazakhstan","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4083','movie',4083,'{"id":4083,"title":"Children of Men","director":"Alfonso Cuarón","year":2006,"tmdb_id":9693,"imdb_id":"tt0206634","original_title":"Children of Men","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4084','movie',4084,'{"id":4084,"title":"Pan''s Labyrinth","director":"Guillermo del Toro","year":2006,"tmdb_id":1417,"imdb_id":"tt0457430","original_title":"El laberinto del fauno","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4085','movie',4085,'{"id":4085,"title":"The Lives of Others","director":"Florian Henckel von Donnersmarck","year":2006,"tmdb_id":582,"imdb_id":"tt0405094","original_title":"Das Leben der Anderen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4086','movie',4086,'{"id":4086,"title":"Venus","director":"Roger Michell","year":2006,"tmdb_id":13771,"imdb_id":"tt0489327","original_title":"Venus","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4087','movie',4087,'{"id":4087,"title":"An Inconvenient Truth","director":"Davis Guggenheim","year":2006,"tmdb_id":1781,"imdb_id":"tt0497116","original_title":"An Inconvenient Truth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4088','movie',4088,'{"id":4088,"title":"Deliver Us from Evil","director":"Amy J. Berg","year":2006,"tmdb_id":13364,"imdb_id":"tt0814075","original_title":"Deliver Us from Evil","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4089','movie',4089,'{"id":4089,"title":"After the Wedding","director":"Susanne Bier","year":2006,"tmdb_id":3549,"imdb_id":"tt0457655","original_title":"Efter brylluppet","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4090','movie',4090,'{"id":4090,"title":"Iraq in Fragments","director":"James Longley","year":2006,"tmdb_id":34389,"imdb_id":"tt0492466","original_title":"Iraq in Fragments","original_language":"ku","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4091','movie',4091,'{"id":4091,"title":"My Country, My Country","director":"Laura Poitras","year":2006,"tmdb_id":50100,"imdb_id":"tt4425258","original_title":"My Country, My Country","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4092','movie',4092,'{"id":4092,"title":"Wallace & Gromit: The Curse of the Were-Rabbit","director":"Steve Box, Nick Park","year":2005,"tmdb_id":533,"imdb_id":"tt0312004","original_title":"Wallace & Gromit: The Curse of the Were-Rabbit","original_language":"en","alternate_titles":["Wallace & Gromit in The Curse of the Were-Rabbit"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4093','movie',4093,'{"id":4093,"title":"Jesus Camp","director":"Heidi Ewing, Rachel Grady","year":2006,"tmdb_id":1776,"imdb_id":"tt0486358","original_title":"Jesus Camp","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4094','movie',4094,'{"id":4094,"title":"Monster House","director":"Gil Kenan","year":2006,"tmdb_id":9297,"imdb_id":"tt0385880","original_title":"Monster House","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4095','movie',4095,'{"id":4095,"title":"Michael Clayton","director":"Tony Gilroy","year":2007,"tmdb_id":4566,"imdb_id":"tt0465538","original_title":"Michael Clayton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4096','movie',4096,'{"id":4096,"title":"The Diving Bell and the Butterfly","director":"Julian Schnabel","year":2007,"tmdb_id":2013,"imdb_id":"tt0401383","original_title":"Le Scaphandre et le Papillon","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4097','movie',4097,'{"id":4097,"title":"Atonement","director":"Joe Wright","year":2007,"tmdb_id":4347,"imdb_id":"tt0783233","original_title":"Atonement","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4098','movie',4098,'{"id":4098,"title":"Sweeney Todd: The Demon Barber of Fleet Street","director":"Tim Burton","year":2007,"tmdb_id":13885,"imdb_id":"tt0408236","original_title":"Sweeney Todd: The Demon Barber of Fleet Street","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4099','movie',4099,'{"id":4099,"title":"In the Valley of Elah","director":"Paul Haggis","year":2007,"tmdb_id":6973,"imdb_id":"tt0478134","original_title":"In the Valley of Elah","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4100','movie',4100,'{"id":4100,"title":"Eastern Promises","director":"David Cronenberg","year":2007,"tmdb_id":2252,"imdb_id":"tt0765443","original_title":"Eastern Promises","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4101','movie',4101,'{"id":4101,"title":"Away from Her","director":"Sarah Polley","year":2007,"tmdb_id":1919,"imdb_id":"tt0491747","original_title":"Away from Her","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4102','movie',4102,'{"id":4102,"title":"The Savages","director":"Tamara Jenkins","year":2007,"tmdb_id":8272,"imdb_id":"tt0775529","original_title":"The Savages","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4103','movie',4103,'{"id":4103,"title":"Into the Wild","director":"Sean Penn","year":2007,"tmdb_id":5915,"imdb_id":"tt0758758","original_title":"Into the Wild","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4104','movie',4104,'{"id":4104,"title":"I''m Not There","director":"Todd Haynes","year":2007,"tmdb_id":3902,"imdb_id":"tt0368794","original_title":"I''m Not There","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4105','movie',4105,'{"id":4105,"title":"Elizabeth: The Golden Age","director":"Shekhar Kapur","year":2007,"tmdb_id":4517,"imdb_id":"tt0414055","original_title":"Elizabeth: The Golden Age","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4106','movie',4106,'{"id":4106,"title":"Lars and the Real Girl","director":"Craig Gillespie","year":2007,"tmdb_id":6615,"imdb_id":"tt0805564","original_title":"Lars and the Real Girl","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4107','movie',4107,'{"id":4107,"title":"Gone Baby Gone","director":"Ben Affleck","year":2007,"tmdb_id":4771,"imdb_id":"tt0452623","original_title":"Gone Baby Gone","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4108','movie',4108,'{"id":4108,"title":"The Assassination of Jesse James by the Coward Robert Ford","director":"Andrew Dominik","year":2007,"tmdb_id":4512,"imdb_id":"tt0443680","original_title":"The Assassination of Jesse James by the Coward Robert Ford","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4109','movie',4109,'{"id":4109,"title":"The Counterfeiters","director":"Stefan Ruzowitzky","year":2007,"tmdb_id":7862,"imdb_id":"tt0813547","original_title":"Die Fälscher","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4110','movie',4110,'{"id":4110,"title":"Beaufort","director":"Joseph Cedar","year":2007,"tmdb_id":15048,"imdb_id":"tt0758732","original_title":"בופור","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4111','movie',4111,'{"id":4111,"title":"Taxi to the Dark Side","director":"Alex Gibney","year":2008,"tmdb_id":13362,"imdb_id":"tt0854678","original_title":"Taxi to the Dark Side","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4112','movie',4112,'{"id":4112,"title":"Charlie Wilson''s War","director":"Mike Nichols","year":2007,"tmdb_id":6538,"imdb_id":"tt0472062","original_title":"Charlie Wilson''s War","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4113','movie',4113,'{"id":4113,"title":"Katyn","director":"Andrzej Wajda","year":2007,"tmdb_id":13614,"imdb_id":"tt0879843","original_title":"Katyń","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4114','movie',4114,'{"id":4114,"title":"War Dance","director":"Sean Fine, Andrea Nix Fine","year":2007,"tmdb_id":16666,"imdb_id":"tt0912599","original_title":"War Dance","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4115','movie',4115,'{"id":4115,"title":"Mongol: The Rise of Genghis Khan","director":"Sergei Bodrov","year":2007,"tmdb_id":12246,"imdb_id":"tt0416044","original_title":"Монгол","original_language":"ru","alternate_titles":["Mongol","Mongol: The Rise to Power of Genghis Khan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4116','movie',4116,'{"id":4116,"title":"Surf''s Up","director":"Chris Buck, Ash Brannon","year":2007,"tmdb_id":9408,"imdb_id":"tt0423294","original_title":"Surf''s Up","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4117','movie',4117,'{"id":4117,"title":"Operation Homecoming: Writing the Wartime Experience","director":"Richard Robbins","year":2007,"tmdb_id":34981,"imdb_id":"tt0970184","original_title":"Operation Homecoming: Writing the Wartime Experience","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4118','movie',4118,'{"id":4118,"title":"The Curious Case of Benjamin Button","director":"David Fincher","year":2008,"tmdb_id":4922,"imdb_id":"tt0421715","original_title":"The Curious Case of Benjamin Button","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4119','movie',4119,'{"id":4119,"title":"Frost/Nixon","director":"Ron Howard","year":2008,"tmdb_id":11499,"imdb_id":"tt0870111","original_title":"Frost/Nixon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4120','movie',4120,'{"id":4120,"title":"The Reader","director":"Stephen Daldry","year":2008,"tmdb_id":8055,"imdb_id":"tt0976051","original_title":"The Reader","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4121','movie',4121,'{"id":4121,"title":"The Visitor","director":"Tom McCarthy","year":2008,"tmdb_id":12473,"imdb_id":"tt0857191","original_title":"The Visitor","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4122','movie',4122,'{"id":4122,"title":"Sicko","director":"Michael Moore","year":2007,"tmdb_id":2359,"imdb_id":"tt0386032","original_title":"Sicko","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4123','movie',4123,'{"id":4123,"title":"No End in Sight","director":"Charles Ferguson","year":2007,"tmdb_id":12901,"imdb_id":"tt0912593","original_title":"No End in Sight","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4124','movie',4124,'{"id":4124,"title":"Frozen River","director":"Courtney Hunt","year":2008,"tmdb_id":10183,"imdb_id":"tt0978759","original_title":"Frozen River","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4125','movie',4125,'{"id":4125,"title":"Milk","director":"Gus Van Sant","year":2008,"tmdb_id":10139,"imdb_id":"tt1013753","original_title":"Milk","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4126','movie',4126,'{"id":4126,"title":"Rachel Getting Married","director":"Jonathan Demme","year":2008,"tmdb_id":14976,"imdb_id":"tt1084950","original_title":"Rachel Getting Married","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4127','movie',4127,'{"id":4127,"title":"Doubt","director":"John Patrick Shanley","year":2008,"tmdb_id":14359,"imdb_id":"tt0918927","original_title":"Doubt","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4128','movie',4128,'{"id":4128,"title":"Tropic Thunder","director":"Ben Stiller","year":2008,"tmdb_id":7446,"imdb_id":"tt0942385","original_title":"Tropic Thunder","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4129','movie',4129,'{"id":4129,"title":"Happy-Go-Lucky","director":"Mike Leigh","year":2008,"tmdb_id":10503,"imdb_id":"tt1045670","original_title":"Happy-Go-Lucky","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4130','movie',4130,'{"id":4130,"title":"The Baader Meinhof Complex","director":"Uli Edel","year":2008,"tmdb_id":6968,"imdb_id":"tt0765432","original_title":"Der Baader Meinhof Komplex","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4131','movie',4131,'{"id":4131,"title":"Departures","director":"Yojiro Takita","year":2008,"tmdb_id":16804,"imdb_id":"tt1069238","original_title":"おくりびと","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4132','movie',4132,'{"id":4132,"title":"Changeling","director":"Clint Eastwood","year":2008,"tmdb_id":3580,"imdb_id":"tt0824747","original_title":"Changeling","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4133','movie',4133,'{"id":4133,"title":"Man on Wire","director":"James Marsh","year":2008,"tmdb_id":14048,"imdb_id":"tt1155592","original_title":"Man on Wire","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4134','movie',4134,'{"id":4134,"title":"The Betrayal – Nerakhoon","director":"Ellen Kuras","year":2008,"tmdb_id":40215,"imdb_id":"tt1157685","original_title":"The Betrayal – Nerakhoon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4135','movie',4135,'{"id":4135,"title":"Waltz with Bashir","director":"Ari Folman","year":2008,"tmdb_id":8885,"imdb_id":"tt1185616","original_title":"ואלס עם באשיר","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4136','movie',4136,'{"id":4136,"title":"Encounters at the End of the World","director":"Werner Herzog","year":2008,"tmdb_id":12172,"imdb_id":"tt1093824","original_title":"Encounters at the End of the World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4137','movie',4137,'{"id":4137,"title":"Revanche","director":"Götz Spielmann","year":2008,"tmdb_id":15451,"imdb_id":"tt1173745","original_title":"Revanche","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4138','movie',4138,'{"id":4138,"title":"The Garden","director":"Scott Hamilton Kennedy","year":2008,"tmdb_id":41331,"imdb_id":"tt1252486","original_title":"The Garden","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4139','movie',4139,'{"id":4139,"title":"Bolt","director":"Chris Williams, Byron Howard","year":2008,"tmdb_id":13053,"imdb_id":"tt0397892","original_title":"Bolt","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4140','movie',4140,'{"id":4140,"title":"Trouble the Water","director":"Carl Deal, Tia Lessin","year":2008,"tmdb_id":22319,"imdb_id":"tt1149405","original_title":"Trouble the Water","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4141','movie',4141,'{"id":4141,"title":"Kung Fu Panda","director":"Mark Osborne, John Stevenson","year":2008,"tmdb_id":9502,"imdb_id":"tt0441773","original_title":"Kung Fu Panda","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4142','movie',4142,'{"id":4142,"title":"The Hurt Locker","director":"Kathryn Bigelow","year":2008,"tmdb_id":12162,"imdb_id":"tt0887912","original_title":"The Hurt Locker","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4143','movie',4143,'{"id":4143,"title":"District 9","director":"Neill Blomkamp","year":2009,"tmdb_id":17654,"imdb_id":"tt1136608","original_title":"District 9","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4144','movie',4144,'{"id":4144,"title":"Precious: Based on the Novel ''Push'' by Sapphire","director":"Lee Daniels","year":2009,"tmdb_id":25793,"imdb_id":"tt0929632","original_title":"Precious: Based on the Novel ''Push'' by Sapphire","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4145','movie',4145,'{"id":4145,"title":"Crazy Heart","director":"Scott Cooper","year":2009,"tmdb_id":25196,"imdb_id":"tt1263670","original_title":"Crazy Heart","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4146','movie',4146,'{"id":4146,"title":"A Single Man","director":"Tom Ford","year":2009,"tmdb_id":34653,"imdb_id":"tt1315981","original_title":"A Single Man","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4147','movie',4147,'{"id":4147,"title":"An Education","director":"Lone Scherfig","year":2009,"tmdb_id":24684,"imdb_id":"tt1174732","original_title":"An Education","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4148','movie',4148,'{"id":4148,"title":"The Lovely Bones","director":"Peter Jackson","year":2009,"tmdb_id":7980,"imdb_id":"tt0380510","original_title":"The Lovely Bones","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4149','movie',4149,'{"id":4149,"title":"The Last Station","director":"Michael Hoffman","year":2009,"tmdb_id":36811,"imdb_id":"tt0824758","original_title":"The Last Station","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4150','movie',4150,'{"id":4150,"title":"The Messenger","director":"Oren Moverman","year":2009,"tmdb_id":28089,"imdb_id":"tt0790712","original_title":"The Messenger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4151','movie',4151,'{"id":4151,"title":"Invictus","director":"Clint Eastwood","year":2009,"tmdb_id":22954,"imdb_id":"tt1057500","original_title":"Invictus","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4152','movie',4152,'{"id":4152,"title":"Ajami","director":"Scandar Copti, Yaron Shani","year":2009,"tmdb_id":24424,"imdb_id":"tt1077262","original_title":"עג''מי","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4153','movie',4153,'{"id":4153,"title":"The Milk of Sorrow","director":"Claudia Llosa","year":2009,"tmdb_id":28644,"imdb_id":"tt1206488","original_title":"La teta asustada","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4154','movie',4154,'{"id":4154,"title":"A Prophet","director":"Jacques Audiard","year":2009,"tmdb_id":21575,"imdb_id":"tt1235166","original_title":"Un prophète","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4155','movie',4155,'{"id":4155,"title":"The Cove","director":"Louie Psihoyos","year":2009,"tmdb_id":23128,"imdb_id":"tt1313104","original_title":"The Cove","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4156','movie',4156,'{"id":4156,"title":"Food, Inc.","director":"Robert Kenner","year":2008,"tmdb_id":18570,"imdb_id":"tt1286537","original_title":"Food, Inc.","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4157','movie',4157,'{"id":4157,"title":"Coraline","director":"Henry Selick","year":2009,"tmdb_id":14836,"imdb_id":"tt0327597","original_title":"Coraline","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4158','movie',4158,'{"id":4158,"title":"Which Way Home","director":"Rebecca Cammisa","year":2009,"tmdb_id":55204,"imdb_id":"tt0489342","original_title":"Which Way Home","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4159','movie',4159,'{"id":4159,"title":"A Cock and Bull Story","director":"Michael Winterbottom","year":2005,"tmdb_id":8435,"imdb_id":"tt0423409","original_title":"A Cock and Bull Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4160','movie',4160,'{"id":4160,"title":"Festival","director":"Annie Griffin","year":2005,"tmdb_id":77517,"imdb_id":"tt0468736","original_title":"Festival","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4161','movie',4161,'{"id":4161,"title":"Memoirs of a Geisha","director":"Rob Marshall","year":2005,"tmdb_id":1904,"imdb_id":"tt0397535","original_title":"Memoirs of a Geisha","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4162','movie',4162,'{"id":4162,"title":"The Beat That My Heart Skipped","director":"Jacques Audiard","year":2005,"tmdb_id":1553,"imdb_id":"tt0411270","original_title":"De battre mon cœur s''est arrêté","original_language":"fr","alternate_titles":["The Beat That My Heart Skipped (De Battre Mon Coeur S’Est Arrêté)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4163','movie',4163,'{"id":4163,"title":"In the Loop","director":"Armando Iannucci","year":2009,"tmdb_id":19833,"imdb_id":"tt1226774","original_title":"In the Loop","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4164','movie',4164,'{"id":4164,"title":"Hotel Rwanda","director":"Terry George","year":2004,"tmdb_id":205,"imdb_id":"tt0395169","original_title":"Hotel Rwanda","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4165','movie',4165,'{"id":4165,"title":"The Secret of Kells","director":"Tomm Moore","year":2009,"tmdb_id":26963,"imdb_id":"tt0485601","original_title":"The Secret of Kells","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4166','movie',4166,'{"id":4166,"title":"Kung Fu Hustle","director":"Stephen Chow","year":2004,"tmdb_id":9470,"imdb_id":"tt0373074","original_title":"功夫","original_language":"cn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4167','movie',4167,'{"id":4167,"title":"The History Boys","director":"Nicholas Hytner","year":2006,"tmdb_id":8618,"imdb_id":"tt0464049","original_title":"The History Boys","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4168','movie',4168,'{"id":4168,"title":"Apocalypto","director":"Mel Gibson","year":2006,"tmdb_id":1579,"imdb_id":"tt0472043","original_title":"Apocalypto","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4169','movie',4169,'{"id":4169,"title":"The Great Journey","director":"Ismaël Ferroukhi","year":2004,"tmdb_id":44003,"imdb_id":"tt0361670","original_title":"Le Grand Voyage","original_language":"fr","alternate_titles":["The Grand Voyage (Le Grand Voyage)","The Grand Voyage"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4170','movie',4170,'{"id":4170,"title":"This Is England","director":"Shane Meadows","year":2007,"tmdb_id":11798,"imdb_id":"tt0480025","original_title":"This Is England","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4171','movie',4171,'{"id":4171,"title":"The Kite Runner","director":"Marc Forster","year":2007,"tmdb_id":7979,"imdb_id":"tt0419887","original_title":"The Kite Runner","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4172','movie',4172,'{"id":4172,"title":"Lust, Caution","director":"Ang Lee","year":2007,"tmdb_id":4588,"imdb_id":"tt0808357","original_title":"色‧戒","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4173','movie',4173,'{"id":4173,"title":"Shrek the Third","director":"Chris Miller","year":2007,"tmdb_id":810,"imdb_id":"tt0413267","original_title":"Shrek the Third","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4174','movie',4174,'{"id":4174,"title":"Control","director":"Anton Corbijn","year":2007,"tmdb_id":5708,"imdb_id":"tt0421082","original_title":"Control","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4175','movie',4175,'{"id":4175,"title":"Gomorrah","director":"Matteo Garrone","year":2008,"tmdb_id":8882,"imdb_id":"tt0929425","original_title":"Gomorra","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4176','movie',4176,'{"id":4176,"title":"Mamma Mia!","director":"Phyllida Lloyd","year":2008,"tmdb_id":11631,"imdb_id":"tt0795421","original_title":"Mamma Mia!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4177','movie',4177,'{"id":4177,"title":"Fish Tank","director":"Andrea Arnold","year":2009,"tmdb_id":24469,"imdb_id":"tt1232776","original_title":"Fish Tank","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4178','movie',4178,'{"id":4178,"title":"Nowhere Boy","director":"Sam Taylor-Johnson","year":2009,"tmdb_id":33511,"imdb_id":"tt1266029","original_title":"Nowhere Boy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4179','movie',4179,'{"id":4179,"title":"Moon","director":"Duncan Jones","year":2009,"tmdb_id":17431,"imdb_id":"tt1182345","original_title":"Moon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4180','movie',4180,'{"id":4180,"title":"Sex & Drugs & Rock & Roll","director":"Mat Whitecross","year":2010,"tmdb_id":37234,"imdb_id":"tt1393020","original_title":"Sex & Drugs & Rock & Roll","original_language":"en","alternate_titles":["Sex And Drugs And Rock And Roll"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4181','movie',4181,'{"id":4181,"title":"It''s Complicated","director":"Nancy Meyers","year":2009,"tmdb_id":22897,"imdb_id":"tt1230414","original_title":"It''s Complicated","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4182','movie',4182,'{"id":4182,"title":"Coco Before Chanel","director":"Anne Fontaine","year":2009,"tmdb_id":11156,"imdb_id":"tt1035736","original_title":"Coco avant Chanel","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4183','movie',4183,'{"id":4183,"title":"Let the Right One In","director":"Tomas Alfredson","year":2008,"tmdb_id":13310,"imdb_id":"tt1139797","original_title":"Låt den rätte komma in","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4184','movie',4184,'{"id":4184,"title":"Broken Embraces","director":"Pedro Almodóvar","year":2009,"tmdb_id":8088,"imdb_id":"tt0913425","original_title":"Los abrazos rotos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4185','movie',4185,'{"id":4185,"title":"Me and Orson Welles","director":"Richard Linklater","year":2008,"tmdb_id":12404,"imdb_id":"tt1175506","original_title":"Me and Orson Welles","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4186','movie',4186,'{"id":4186,"title":"I''ve Loved You So Long","director":"Philippe Claudel","year":2008,"tmdb_id":8276,"imdb_id":"tt1068649","original_title":"Il y a longtemps que je t''aime","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4187','movie',4187,'{"id":4187,"title":"The Producers","director":"Susan Stroman","year":2005,"tmdb_id":9899,"imdb_id":"tt0395251","original_title":"The Producers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4188','movie',4188,'{"id":4188,"title":"Proof","director":"John Madden","year":2005,"tmdb_id":9777,"imdb_id":"tt0377107","original_title":"Proof","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4189','movie',4189,'{"id":4189,"title":"The Matador","director":"Richard Shepard","year":2005,"tmdb_id":9515,"imdb_id":"tt0365485","original_title":"The Matador","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4190','movie',4190,'{"id":4190,"title":"In Her Shoes","director":"Curtis Hanson","year":2005,"tmdb_id":11931,"imdb_id":"tt0388125","original_title":"In Her Shoes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4191','movie',4191,'{"id":4191,"title":"The Family Stone","director":"Thomas Bezucha","year":2005,"tmdb_id":9043,"imdb_id":"tt0356680","original_title":"The Family Stone","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4192','movie',4192,'{"id":4192,"title":"The Promise","director":"Chen Kaige","year":2005,"tmdb_id":2008,"imdb_id":"tt0417976","original_title":"无极","original_language":"zh","alternate_titles":["The Promise (Master of the Crimson Armor)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4193','movie',4193,'{"id":4193,"title":"King Kong","director":"Peter Jackson","year":2005,"tmdb_id":254,"imdb_id":"tt0360717","original_title":"King Kong","original_language":"en","alternate_titles":["King Kong (2005)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4194','movie',4194,'{"id":4194,"title":"Bobby","director":"Emilio Estevez","year":2006,"tmdb_id":10741,"imdb_id":"tt0308055","original_title":"Bobby","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4195','movie',4195,'{"id":4195,"title":"Sherrybaby","director":"Laurie Collyer","year":2006,"tmdb_id":13075,"imdb_id":"tt0423169","original_title":"Sherrybaby","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4196','movie',4196,'{"id":4196,"title":"Miss Potter","director":"Chris Noonan","year":2006,"tmdb_id":13967,"imdb_id":"tt0482546","original_title":"Miss Potter","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4197','movie',4197,'{"id":4197,"title":"Running with Scissors","director":"Ryan Murphy","year":2006,"tmdb_id":7510,"imdb_id":"tt0439289","original_title":"Running with Scissors","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4198','movie',4198,'{"id":4198,"title":"Hollywoodland","director":"Allen Coulter","year":2006,"tmdb_id":1249,"imdb_id":"tt0427969","original_title":"Hollywoodland","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4199','movie',4199,'{"id":4199,"title":"Stranger Than Fiction","director":"Marc Forster","year":2006,"tmdb_id":1262,"imdb_id":"tt0420223","original_title":"Stranger Than Fiction","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4200','movie',4200,'{"id":4200,"title":"The Great Debaters","director":"Denzel Washington","year":2007,"tmdb_id":14047,"imdb_id":"tt0427309","original_title":"The Great Debaters","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4201','movie',4201,'{"id":4201,"title":"Kinky Boots","director":"Julian Jarrold","year":2005,"tmdb_id":16367,"imdb_id":"tt0434124","original_title":"Kinky Boots","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4202','movie',4202,'{"id":4202,"title":"Across the Universe","director":"Julie Taymor","year":2007,"tmdb_id":4688,"imdb_id":"tt0445922","original_title":"Across the Universe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4203','movie',4203,'{"id":4203,"title":"Hairspray","director":"Adam Shankman","year":2007,"tmdb_id":2976,"imdb_id":"tt0427327","original_title":"Hairspray","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4204','movie',4204,'{"id":4204,"title":"Breakfast on Pluto","director":"Neil Jordan","year":2005,"tmdb_id":1420,"imdb_id":"tt0411195","original_title":"Breakfast on Pluto","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4205','movie',4205,'{"id":4205,"title":"A Mighty Heart","director":"Michael Winterbottom","year":2007,"tmdb_id":1988,"imdb_id":"tt0829459","original_title":"A Mighty Heart","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4206','movie',4206,'{"id":4206,"title":"Walk Hard: The Dewey Cox Story","director":"Jake Kasdan","year":2007,"tmdb_id":6575,"imdb_id":"tt0841046","original_title":"Walk Hard: The Dewey Cox Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4207','movie',4207,'{"id":4207,"title":"Bee Movie","director":"Simon J. Smith, Steve Hickner","year":2007,"tmdb_id":5559,"imdb_id":"tt0389790","original_title":"Bee Movie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4208','movie',4208,'{"id":4208,"title":"Everlasting Moments","director":"Jan Troell","year":2008,"tmdb_id":17077,"imdb_id":"tt0961066","original_title":"Maria Larssons eviga ögonblick","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4209','movie',4209,'{"id":4209,"title":"Last Chance Harvey","director":"Joel Hopkins","year":2008,"tmdb_id":16409,"imdb_id":"tt1046947","original_title":"Last Chance Harvey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4210','movie',4210,'{"id":4210,"title":"Pineapple Express","director":"David Gordon Green","year":2008,"tmdb_id":10189,"imdb_id":"tt0910936","original_title":"Pineapple Express","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4211','movie',4211,'{"id":4211,"title":"The Duchess","director":"Saul Dibb","year":2008,"tmdb_id":12783,"imdb_id":"tt0864761","original_title":"The Duchess","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4212','movie',4212,'{"id":4212,"title":"The Brave One","director":"Neil Jordan","year":2007,"tmdb_id":4413,"imdb_id":"tt0476964","original_title":"The Brave One","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4213','movie',4213,'{"id":4213,"title":"(500) Days of Summer","director":"Marc Webb","year":2009,"tmdb_id":19913,"imdb_id":"tt1022603","original_title":"(500) Days of Summer","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4214','movie',4214,'{"id":4214,"title":"The Young Victoria","director":"Jean-Marc Vallée","year":2009,"tmdb_id":18320,"imdb_id":"tt0962736","original_title":"The Young Victoria","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4215','movie',4215,'{"id":4215,"title":"The Maid","director":"Sebastián Silva","year":2009,"tmdb_id":27567,"imdb_id":"tt1187044","original_title":"La nana","original_language":"es","alternate_titles":["The Maid (La Nana)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4216','movie',4216,'{"id":4216,"title":"Brothers","director":"Jim Sheridan","year":2009,"tmdb_id":7445,"imdb_id":"tt0765010","original_title":"Brothers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4217','movie',4217,'{"id":4217,"title":"Duplicity","director":"Tony Gilroy","year":2009,"tmdb_id":16558,"imdb_id":"tt1135487","original_title":"Duplicity","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4218','movie',4218,'{"id":4218,"title":"The Informant!","director":"Steven Soderbergh","year":2009,"tmdb_id":11323,"imdb_id":"tt1130080","original_title":"The Informant!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4219','movie',4219,'{"id":4219,"title":"Baaria","director":"Giuseppe Tornatore","year":2009,"tmdb_id":25846,"imdb_id":"tt1081935","original_title":"Baarìa","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4220','movie',4220,'{"id":4220,"title":"The Caiman","director":"Nanni Moretti","year":2006,"tmdb_id":31289,"imdb_id":"tt0429727","original_title":"Il caimano","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4221','movie',4221,'{"id":4221,"title":"Days of Glory","director":"Rachid Bouchareb","year":2006,"tmdb_id":2016,"imdb_id":"tt0444182","original_title":"Indigènes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4222','movie',4222,'{"id":4222,"title":"Colossal Youth","director":"Pedro Costa","year":2006,"tmdb_id":82404,"imdb_id":"tt0460480","original_title":"Juventude Em Marcha","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4223','movie',4223,'{"id":4223,"title":"The Family Friend","director":"Paolo Sorrentino","year":2006,"tmdb_id":53486,"imdb_id":"tt0772105","original_title":"L''amico di famiglia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4224','movie',4224,'{"id":4224,"title":"Fast Food Nation","director":"Richard Linklater","year":2006,"tmdb_id":8324,"imdb_id":"tt0460792","original_title":"Fast Food Nation","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4225','movie',4225,'{"id":4225,"title":"The Right of the Weakest","director":"Lucas Belvaux","year":2006,"tmdb_id":71732,"imdb_id":"tt0454536","original_title":"La Raison du plus faible","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4226','movie',4226,'{"id":4226,"title":"Flanders","director":"Bruno Dumont","year":2006,"tmdb_id":36143,"imdb_id":"tt0450680","original_title":"Flandres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4227','movie',4227,'{"id":4227,"title":"Lights in the Dusk","director":"Aki Kaurismäki","year":2006,"tmdb_id":1379,"imdb_id":"tt0458242","original_title":"Laitakaupungin valot","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4228','movie',4228,'{"id":4228,"title":"Red Road","director":"Andrea Arnold","year":2006,"tmdb_id":11705,"imdb_id":"tt0471030","original_title":"Red Road","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4229','movie',4229,'{"id":4229,"title":"Southland Tales","director":"Richard Kelly","year":2006,"tmdb_id":4723,"imdb_id":"tt0405336","original_title":"Southland Tales","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4230','movie',4230,'{"id":4230,"title":"Charlie Says","director":"Nicole Garcia","year":2006,"tmdb_id":68944,"imdb_id":"tt0444418","original_title":"Selon Charlie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4231','movie',4231,'{"id":4231,"title":"Summer Palace","director":"Lou Ye","year":2006,"tmdb_id":17422,"imdb_id":"tt0794374","original_title":"颐和园","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4232','movie',4232,'{"id":4232,"title":"Marie Antoinette","director":"Sofia Coppola","year":2006,"tmdb_id":1887,"imdb_id":"tt0422720","original_title":"Marie Antoinette","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4233','movie',4233,'{"id":4233,"title":"A Scanner Darkly","director":"Richard Linklater","year":2006,"tmdb_id":3509,"imdb_id":"tt0405296","original_title":"A Scanner Darkly","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4234','movie',4234,'{"id":4234,"title":"977","director":"Nikolay Khomeriki","year":2006,"tmdb_id":58296,"imdb_id":"tt0808139","original_title":"Девять Семь Семь","original_language":"ru","alternate_titles":["977 (NINE SEVEN SEVEN)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4235','movie',4235,'{"id":4235,"title":"The Violin","director":"Francisco Vargas","year":2006,"tmdb_id":68259,"imdb_id":"tt0451966","original_title":"El violín","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4236','movie',4236,'{"id":4236,"title":"The Way I Spent the End of the World","director":"Cătălin Mitulescu","year":2006,"tmdb_id":96010,"imdb_id":"tt0799991","original_title":"Cum mi-am petrecut sfârșitul lumii","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4237','movie',4237,'{"id":4237,"title":"Paraguayan Hammock","director":"Paz Encina","year":2006,"tmdb_id":129933,"imdb_id":"tt0482987","original_title":"Hamaca paraguaya","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4238','movie',4238,'{"id":4238,"title":"La Californie","director":"Jacques Fieschi","year":2006,"tmdb_id":79034,"imdb_id":"tt0465160","original_title":"La Californie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4239','movie',4239,'{"id":4239,"title":"The Page Turner","director":"Denis Dercourt","year":2006,"tmdb_id":8436,"imdb_id":"tt0487503","original_title":"La Tourneuse de pages","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4240','movie',4240,'{"id":4240,"title":"The Wedding Director","director":"Marco Bellocchio","year":2006,"tmdb_id":24185,"imdb_id":"tt0433624","original_title":"Il regista di matrimoni","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4241','movie',4241,'{"id":4241,"title":"The Singer","director":"Xavier Giannoli","year":2006,"tmdb_id":31325,"imdb_id":"tt0464828","original_title":"Quand j''étais chanteur","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4242','movie',4242,'{"id":4242,"title":"Bled Number One","director":"Rabah Ameur-Zaïmeche","year":2006,"tmdb_id":99739,"imdb_id":"tt0795341","original_title":"Bled Number One","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4243','movie',4243,'{"id":4243,"title":"Luxury Car","director":"Wang Chao","year":2006,"tmdb_id":126529,"imdb_id":"tt0810954","original_title":"江城夏日","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4244','movie',4244,'{"id":4244,"title":"Taxidermia","director":"György Pálfi","year":2006,"tmdb_id":15742,"imdb_id":"tt0410730","original_title":"Taxidermia","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4245','movie',4245,'{"id":4245,"title":"The Unforgiven","director":"Yoon Jong-bin","year":2006,"tmdb_id":182633,"imdb_id":"tt0499274","original_title":"용서받지 못한 자","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4246','movie',4246,'{"id":4246,"title":"Murderers","director":"Patrick Grandperret","year":2006,"tmdb_id":51244,"imdb_id":"tt0118656","original_title":"Meurtrieres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4247','movie',4247,'{"id":4247,"title":"Uro","director":"Stefan Faldbakken","year":2006,"tmdb_id":37766,"imdb_id":"tt0497539","original_title":"Uro","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4248','movie',4248,'{"id":4248,"title":"You Am I","director":"Kristijonas Vildžiūnas","year":2006,"tmdb_id":12681,"imdb_id":"tt0811164","original_title":"Aš esi tu","original_language":"lt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4249','movie',4249,'{"id":4249,"title":"Retrieval","director":"Sławomir Fabicki","year":2006,"tmdb_id":48119,"imdb_id":"tt0800275","original_title":"Z odzysku","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4250','movie',4250,'{"id":4250,"title":"Suburban Mayhem","director":"Paul Goldman","year":2006,"tmdb_id":13943,"imdb_id":"tt0450506","original_title":"Suburban Mayhem","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4251','movie',4251,'{"id":4251,"title":"Serambi","director":"Lianto Luseno, Viva Westi, Tonny Trimarsanto, Garin Nugroho","year":2006,"tmdb_id":352749,"imdb_id":"tt3993394","original_title":"Serambi","original_language":"id","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4252','movie',4252,'{"id":4252,"title":"The Banishment","director":"Andrey Zvyagintsev","year":2007,"tmdb_id":25142,"imdb_id":"tt0488905","original_title":"Изгнание","original_language":"ru","alternate_titles":["IZGNANIE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4253','movie',4253,'{"id":4253,"title":"The Edge of Heaven","director":"Fatih Akin","year":2007,"tmdb_id":2014,"imdb_id":"tt0880502","original_title":"Auf der anderen Seite","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4254','movie',4254,'{"id":4254,"title":"Love Songs","director":"Christophe Honoré","year":2007,"tmdb_id":14448,"imdb_id":"tt0996605","original_title":"Les Chansons d''amour","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4255','movie',4255,'{"id":4255,"title":"My Blueberry Nights","director":"Wong Kar-wai","year":2007,"tmdb_id":1989,"imdb_id":"tt0765120","original_title":"My Blueberry Nights","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4256','movie',4256,'{"id":4256,"title":"The Mourning Forest","director":"Naomi Kawase","year":2007,"tmdb_id":2010,"imdb_id":"tt1016205","original_title":"殯の森","original_language":"ja","alternate_titles":["MOGARI NO MORI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4257','movie',4257,'{"id":4257,"title":"Paranoid Park","director":"Gus Van Sant","year":2007,"tmdb_id":1990,"imdb_id":"tt0842929","original_title":"Paranoid Park","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4258','movie',4258,'{"id":4258,"title":"Promise Me This","director":"Emir Kusturica","year":2007,"tmdb_id":8269,"imdb_id":"tt0479519","original_title":"Завет","original_language":"sr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4259','movie',4259,'{"id":4259,"title":"Secret Sunshine","director":"Lee Chang-dong","year":2007,"tmdb_id":2015,"imdb_id":"tt0817225","original_title":"밀양","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4260','movie',4260,'{"id":4260,"title":"The Man from London","director":"Béla Tarr","year":2007,"tmdb_id":31262,"imdb_id":"tt0415127","original_title":"A Londoni férfi","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4261','movie',4261,'{"id":4261,"title":"Import/Export","director":"Ulrich Seidl","year":2007,"tmdb_id":4998,"imdb_id":"tt0459102","original_title":"Import/Export","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4262','movie',4262,'{"id":4262,"title":"We Own the Night","director":"James Gray","year":2007,"tmdb_id":2001,"imdb_id":"tt0498399","original_title":"We Own the Night","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4263','movie',4263,'{"id":4263,"title":"Tehilim","director":"Raphaël Nadjari","year":2007,"tmdb_id":126682,"imdb_id":"tt0816672","original_title":"Tehilim","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4264','movie',4264,'{"id":4264,"title":"The Last Mistress","director":"Catherine Breillat","year":2007,"tmdb_id":2002,"imdb_id":"tt0437526","original_title":"Une vieille maîtresse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4265','movie',4265,'{"id":4265,"title":"Silent Light","director":"Carlos Reygadas","year":2007,"tmdb_id":2012,"imdb_id":"tt0841925","original_title":"Luz silenciosa","original_language":"es","alternate_titles":["STELLET LICHT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4266','movie',4266,'{"id":4266,"title":"And Along Come Tourists","director":"Robert Thalheim","year":2007,"tmdb_id":3397,"imdb_id":"tt0775417","original_title":"Am Ende kommen Touristen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4267','movie',4267,'{"id":4267,"title":"Actresses","director":"Valeria Bruni Tedeschi","year":2007,"tmdb_id":6360,"imdb_id":"tt0815092","original_title":"Actrices","original_language":"fr","alternate_titles":["ACTRESSES (DREAMS OF THE NIGHT BEFORE)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4268','movie',4268,'{"id":4268,"title":"Breath","director":"Kim Ki-duk","year":2007,"tmdb_id":25647,"imdb_id":"tt0901475","original_title":"숨","original_language":"ko","alternate_titles":["SOOM"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4269','movie',4269,'{"id":4269,"title":"Just About Love?","director":"Lola Doillon","year":2007,"tmdb_id":19098,"imdb_id":"tt0830545","original_title":"Et toi, t''es sur qui?","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4270','movie',4270,'{"id":4270,"title":"Pleasure Factory","director":"Ekachai Uekrongtham","year":2007,"tmdb_id":46914,"imdb_id":"tt1018902","original_title":"快乐工厂","original_language":"cn","alternate_titles":["KUAILE GONGCHANG"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4271','movie',4271,'{"id":4271,"title":"Calle Santa Fe","director":"Carmen Castillo","year":2007,"tmdb_id":49765,"imdb_id":"tt1038904","original_title":"Calle Santa Fe","original_language":"es","alternate_titles":["SANTA FE STREET"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4272','movie',4272,'{"id":4272,"title":"Magnus","director":"Kadri Kõusaar","year":2007,"tmdb_id":46930,"imdb_id":"tt0979917","original_title":"Magnus","original_language":"et","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4273','movie',4273,'{"id":4273,"title":"The Band''s Visit","director":"Eran Kolirin","year":2007,"tmdb_id":5259,"imdb_id":"tt1032856","original_title":"ביקור התזמורת","original_language":"he","alternate_titles":["BIKUR HATIZMORET"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4274','movie',4274,'{"id":4274,"title":"Blind Mountain","director":"Li Yang","year":2007,"tmdb_id":51520,"imdb_id":"tt1020972","original_title":"盲山","original_language":"zh","alternate_titles":["MANG SHAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4275','movie',4275,'{"id":4275,"title":"My Brother Is an Only Child","director":"Daniele Luchetti","year":2007,"tmdb_id":9789,"imdb_id":"tt0846040","original_title":"Mio fratello è figlio unico","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4276','movie',4276,'{"id":4276,"title":"You, the Living","director":"Roy Andersson","year":2007,"tmdb_id":5817,"imdb_id":"tt0445336","original_title":"Du levande","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4277','movie',4277,'{"id":4277,"title":"Munyurangabo","director":"Lee Isaac Chung","year":2007,"tmdb_id":57654,"imdb_id":"tt1031947","original_title":"Munyurangabo","original_language":"rw","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4278','movie',4278,'{"id":4278,"title":"Flight of the Red Balloon","director":"Hou Hsiao-hsien","year":2007,"tmdb_id":12198,"imdb_id":"tt0826711","original_title":"Le Voyage du ballon rouge","original_language":"fr","alternate_titles":["THE FLIGHT OF THE RED BALLOON"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4279','movie',4279,'{"id":4279,"title":"Solitary Fragments","director":"Jaime Rosales","year":2007,"tmdb_id":39489,"imdb_id":"tt0812377","original_title":"La soledad","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4280','movie',4280,'{"id":4280,"title":"Water Lilies","director":"Céline Sciamma","year":2007,"tmdb_id":10818,"imdb_id":"tt0869977","original_title":"Naissance des pieuvres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4281','movie',4281,'{"id":4281,"title":"A Stray Girlfriend","director":"Ana Katz","year":2007,"tmdb_id":126679,"imdb_id":"tt0813630","original_title":"Una novia errante","original_language":"es","alternate_titles":["A WANDERING BRIDE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4282','movie',4282,'{"id":4282,"title":"Che","director":"Steven Soderbergh","year":2008,"tmdb_id":null,"imdb_id":null,"identity_status":"reviewed_complete_film_official_source","identity_scope":"complete-film","identity_key":"festival:cannes:2008:che","identity_sources":["https://www.festival-cannes.com/en/f/che/","https://cdn-media.festival-cannes.com/film_film/0001/89/c31dc22f36be410e543e5955d0a2ba97c407b8e9.pdf","https://www.festival-cannes.com/en/2008/competition-che-by-steven-soderbergh/","https://www.criterion.com/films/20987-che"],"original_title":"Che","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4283','movie',4283,'{"id":4283,"title":"Mister Lonely","director":"Harmony Korine","year":2007,"tmdb_id":16135,"imdb_id":"tt0475984","original_title":"Mister Lonely","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4284','movie',4284,'{"id":4284,"title":"Adoration","director":"Atom Egoyan","year":2008,"tmdb_id":8895,"imdb_id":"tt1074929","original_title":"Adoration","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4285','movie',4285,'{"id":4285,"title":"Delta","director":"Kornél Mundruczó","year":2008,"tmdb_id":8896,"imdb_id":"tt0910860","original_title":"Delta","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4286','movie',4286,'{"id":4286,"title":"Night Train","director":"Diao Yinan","year":2007,"tmdb_id":17342,"imdb_id":"tt1032941","original_title":"夜车","original_language":"zh","alternate_titles":["YE CHE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4287','movie',4287,'{"id":4287,"title":"Il Divo","director":"Paolo Sorrentino","year":2008,"tmdb_id":8832,"imdb_id":"tt1023490","original_title":"Il Divo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4288','movie',4288,'{"id":4288,"title":"Blindness","director":"Fernando Meirelles","year":2008,"tmdb_id":8338,"imdb_id":"tt0861689","original_title":"Blindness","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4289','movie',4289,'{"id":4289,"title":"The Class","director":"Laurent Cantet","year":2008,"tmdb_id":8841,"imdb_id":"tt1068646","original_title":"Entre les murs","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4290','movie',4290,'{"id":4290,"title":"Frontier of Dawn","director":"Philippe Garrel","year":2008,"tmdb_id":8897,"imdb_id":"tt1073535","original_title":"La Frontière de l''aube","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4291','movie',4291,'{"id":4291,"title":"The Headless Woman","director":"Lucrecia Martel","year":2008,"tmdb_id":8898,"imdb_id":"tt1221141","original_title":"La mujer sin cabeza","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4292','movie',4292,'{"id":4292,"title":"Lorna''s Silence","director":"Jean-Pierre Dardenne, Luc Dardenne","year":2008,"tmdb_id":8899,"imdb_id":"tt1186369","original_title":"Le Silence de Lorna","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4293','movie',4293,'{"id":4293,"title":"Lion''s Den","director":"Pablo Trapero","year":2008,"tmdb_id":8900,"imdb_id":"tt1022606","original_title":"Leonera","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4294','movie',4294,'{"id":4294,"title":"Linha de Passe","director":"Daniela Thomas, Walter Salles","year":2008,"tmdb_id":8902,"imdb_id":"tt0803029","original_title":"Linha de Passe","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4295','movie',4295,'{"id":4295,"title":"Synecdoche, New York","director":"Charlie Kaufman","year":2008,"tmdb_id":4960,"imdb_id":"tt0383028","original_title":"Synecdoche, New York","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4296','movie',4296,'{"id":4296,"title":"Palermo Shooting","director":"Wim Wenders","year":2008,"tmdb_id":8886,"imdb_id":"tt1008017","original_title":"Palermo Shooting","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4297','movie',4297,'{"id":4297,"title":"A Christmas Tale","director":"Arnaud Desplechin","year":2008,"tmdb_id":8892,"imdb_id":"tt0993789","original_title":"Un conte de Noël","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4298','movie',4298,'{"id":4298,"title":"The Dead Girl''s Feast","director":"Matheus Nachtergaele","year":2008,"tmdb_id":8925,"imdb_id":"tt1136609","original_title":"A Festa da Menina Morta","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4299','movie',4299,'{"id":4299,"title":"Afterschool","director":"Antonio Campos","year":2008,"tmdb_id":8926,"imdb_id":"tt1224366","original_title":"Afterschool","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4300','movie',4300,'{"id":4300,"title":"Hunger","director":"Steve McQueen","year":2008,"tmdb_id":10360,"imdb_id":"tt0986233","original_title":"Hunger","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4301','movie',4301,'{"id":4301,"title":"Involuntary","director":"Ruben Östlund","year":2008,"tmdb_id":8927,"imdb_id":"tt1232826","original_title":"De ofrivilliga","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4302','movie',4302,'{"id":4302,"title":"The Bastards","director":"Amat Escalante","year":2008,"tmdb_id":8931,"imdb_id":"tt0841922","original_title":"Los Bastardos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4303','movie',4303,'{"id":4303,"title":"Johnny Mad Dog","director":"Jean-Stéphane Sauvaire","year":2008,"tmdb_id":8929,"imdb_id":"tt1042424","original_title":"Johnny Mad Dog","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4304','movie',4304,'{"id":4304,"title":"Salt of This Sea","director":"Annemarie Jacir","year":2008,"tmdb_id":8932,"imdb_id":"tt1090680","original_title":"ملح هذا البحر","original_language":"ar","alternate_titles":["MILH HADHA AL-BAHR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4305','movie',4305,'{"id":4305,"title":"I Want to See","director":"Joana Hadjithomas, Khalil Joreige","year":2008,"tmdb_id":8928,"imdb_id":"tt1068652","original_title":"Je veux voir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4306','movie',4306,'{"id":4306,"title":"O''Horten","director":"Bent Hamer","year":2008,"tmdb_id":8933,"imdb_id":"tt0962774","original_title":"O'' Horten","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4307','movie',4307,'{"id":4307,"title":"Ocean Flame","director":"Liu Fendou","year":2008,"tmdb_id":8943,"imdb_id":"tt1232825","original_title":"一半海水一半火焰","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4308','movie',4308,'{"id":4308,"title":"Soi Cowboy","director":"Thomas Clay","year":2008,"tmdb_id":8934,"imdb_id":"tt1224455","original_title":"ซอยคาวบอย","original_language":"th","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4309','movie',4309,'{"id":4309,"title":"Tokyo Sonata","director":"Kiyoshi Kurosawa","year":2008,"tmdb_id":8937,"imdb_id":"tt0938341","original_title":"トウキョウソナタ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4310','movie',4310,'{"id":4310,"title":"Tokyo!","director":"Bong Joon Ho, Leos Carax, Michel Gondry","year":2008,"tmdb_id":8938,"imdb_id":"tt0976060","original_title":"TOKYO!","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4311','movie',4311,'{"id":4311,"title":"Modern Life","director":"Raymond Depardon","year":2008,"tmdb_id":8930,"imdb_id":"tt0881310","original_title":"Profils paysans : La Vie moderne","original_language":"fr","alternate_titles":["LA VIE MODERNE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4312','movie',4312,'{"id":4312,"title":"Versailles","director":"Pierre Schoeller","year":2008,"tmdb_id":8941,"imdb_id":"tt1132607","original_title":"Versailles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4313','movie',4313,'{"id":4313,"title":"Wendy and Lucy","director":"Kelly Reichardt","year":2008,"tmdb_id":8942,"imdb_id":"tt1152850","original_title":"Wendy and Lucy","original_language":"en","alternate_titles":["WENDY ET LUCY"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4314','movie',4314,'{"id":4314,"title":"Bright Star","director":"Jane Campion","year":2009,"tmdb_id":29963,"imdb_id":"tt0810784","original_title":"Bright Star","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4315','movie',4315,'{"id":4315,"title":"Thirst","director":"Park Chan-wook","year":2009,"tmdb_id":22536,"imdb_id":"tt0762073","original_title":"박쥐","original_language":"ko","alternate_titles":["BAK-JWI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4316','movie',4316,'{"id":4316,"title":"Spring Fever","director":"Lou Ye","year":2009,"tmdb_id":117646,"imdb_id":"tt1422119","original_title":"春风沉醉的夜晚","original_language":"zh","alternate_titles":["CHUN FENG CHEN ZUI DE YE WAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4317','movie',4317,'{"id":4317,"title":"Enter the Void","director":"Gaspar Noé","year":2009,"tmdb_id":34647,"imdb_id":"tt1191111","original_title":"Enter the Void","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4318','movie',4318,'{"id":4318,"title":"Tyson","director":"James Toback","year":2008,"tmdb_id":8940,"imdb_id":"tt1032821","original_title":"Tyson","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4319','movie',4319,'{"id":4319,"title":"Looking for Eric","director":"Ken Loach","year":2009,"tmdb_id":18898,"imdb_id":"tt1242545","original_title":"Looking for Eric","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4320','movie',4320,'{"id":4320,"title":"Taking Woodstock","director":"Ang Lee","year":2009,"tmdb_id":26320,"imdb_id":"tt1127896","original_title":"Taking Woodstock","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4321','movie',4321,'{"id":4321,"title":"The Time That Remains","director":"Elia Suleiman","year":2009,"tmdb_id":44898,"imdb_id":"tt1037163","original_title":"الزمن الباقي","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4322','movie',4322,'{"id":4322,"title":"Cloud 9","director":"Andreas Dresen","year":2008,"tmdb_id":8906,"imdb_id":"tt1037228","original_title":"Wolke 9","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4323','movie',4323,'{"id":4323,"title":"Vengeance","director":"Johnnie To","year":2009,"tmdb_id":18899,"imdb_id":"tt1329454","original_title":"復仇","original_language":"cn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4324','movie',4324,'{"id":4324,"title":"Vincere","director":"Marco Bellocchio","year":2009,"tmdb_id":30239,"imdb_id":"tt1156173","original_title":"Vincere","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4325','movie',4325,'{"id":4325,"title":"Visage","director":"Tsai Ming-liang","year":2009,"tmdb_id":53520,"imdb_id":"tt1262420","original_title":"Visage","original_language":"fr","alternate_titles":["FACE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4326','movie',4326,'{"id":4326,"title":"Wild Grass","director":"Alain Resnais","year":2009,"tmdb_id":37842,"imdb_id":"tt1156143","original_title":"Les Herbes folles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4327','movie',4327,'{"id":4327,"title":"Map of the Sounds of Tokyo","director":"Isabel Coixet","year":2009,"tmdb_id":46458,"imdb_id":"tt1185376","original_title":"Map of the Sounds of Tokyo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4328','movie',4328,'{"id":4328,"title":"Independencia","director":"Raya Martin","year":2009,"tmdb_id":125344,"imdb_id":"tt1346973","original_title":"Independencia","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4329','movie',4329,'{"id":4329,"title":"In the Beginning","director":"Xavier Giannoli","year":2009,"tmdb_id":35164,"imdb_id":"tt1198385","original_title":"À l''origine","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4330','movie',4330,'{"id":4330,"title":"No One Knows About Persian Cats","director":"Bahman Ghobadi","year":2009,"tmdb_id":51413,"imdb_id":"tt1426378","original_title":"کسی از گربه‌های ایرانی خبر نداره","original_language":"fa","alternate_titles":["KASI AZ GORBEHAYE IRANI KHABAR NADAREH"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4331','movie',4331,'{"id":4331,"title":"Eyes Wide Open","director":"Haim Tabakman","year":2009,"tmdb_id":37810,"imdb_id":"tt1424327","original_title":"עיניים פקוחות","original_language":"he","alternate_titles":["EYES WIDE OPEN (EINAYM PKUHOT)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4332','movie',4332,'{"id":4332,"title":"Irene","director":"Alain Cavalier","year":2009,"tmdb_id":163899,"imdb_id":"tt1426368","original_title":"Irène","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4333','movie',4333,'{"id":4333,"title":"The Wind Journeys","director":"Ciro Guerra","year":2009,"tmdb_id":39378,"imdb_id":"tt1426374","original_title":"Los viajes del viento","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4334','movie',4334,'{"id":4334,"title":"Father of My Children","director":"Mia Hansen-Løve","year":2009,"tmdb_id":43614,"imdb_id":"tt1356928","original_title":"Le Père de mes enfants","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4335','movie',4335,'{"id":4335,"title":"Air Doll","director":"Hirokazu Kore-eda","year":2009,"tmdb_id":25053,"imdb_id":"tt1371630","original_title":"空気人形","original_language":"ja","alternate_titles":["KUKI NINGYO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4336','movie',4336,'{"id":4336,"title":"Mother","director":"Bong Joon Ho","year":2009,"tmdb_id":30018,"imdb_id":"tt1216496","original_title":"마더","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4337','movie',4337,'{"id":4337,"title":"To Die Like a Man","director":"João Pedro Rodrigues","year":2009,"tmdb_id":95538,"imdb_id":"tt1424361","original_title":"Morrer Como Um Homem","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4338','movie',4338,'{"id":4338,"title":"Tomorrow at Dawn","director":"Denis Dercourt","year":2009,"tmdb_id":33913,"imdb_id":"tt1291548","original_title":"Demain dès l''aube","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4339','movie',4339,'{"id":4339,"title":"Police, Adjective","director":"Corneliu Porumboiu","year":2009,"tmdb_id":32511,"imdb_id":"tt1337051","original_title":"Polițist, adjectiv","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4340','movie',4340,'{"id":4340,"title":"Samson and Delilah","director":"Warwick Thornton","year":2009,"tmdb_id":47075,"imdb_id":"tt1340123","original_title":"Samson and Delilah","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4341','movie',4341,'{"id":4341,"title":"Nymph","director":"Pen-Ek Ratanaruang","year":2009,"tmdb_id":50086,"imdb_id":"tt1424366","original_title":"นางไม้","original_language":"th","alternate_titles":["NANG MAI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4342','movie',4342,'{"id":4342,"title":"The Silent Army","director":"Jean van de Velde","year":2009,"tmdb_id":17772,"imdb_id":"tt1189008","original_title":"Wit Licht","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4343','movie',4343,'{"id":4343,"title":"Certified Copy","director":"Abbas Kiarostami","year":2010,"tmdb_id":48303,"imdb_id":"tt1020773","original_title":"Copie conforme","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4344','movie',4344,'{"id":4344,"title":"Fair Game","director":"Doug Liman","year":2010,"tmdb_id":38363,"imdb_id":"tt0977855","original_title":"Fair Game","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4345','movie',4345,'{"id":4345,"title":"Tale in the Darkness","director":"Nikolay Khomeriki","year":2009,"tmdb_id":172878,"imdb_id":"tt1426384","original_title":"Сказка про темноту","original_language":"ru","alternate_titles":["SKAZKA PRO TEMNOTU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4346','movie',4346,'{"id":4346,"title":"Uncle Boonmee Who Can Recall His Past Lives","director":"Apichatpong Weerasethakul","year":2010,"tmdb_id":38368,"imdb_id":"tt1588895","original_title":"ลุงบุญมีระลึกชาติ","original_language":"th","alternate_titles":["LUNG BOONMEE RALUEK CHAT"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4347','movie',4347,'{"id":4347,"title":"Outrage","director":"Takeshi Kitano","year":2010,"tmdb_id":45284,"imdb_id":"tt1462667","original_title":"アウトレイジ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4348','movie',4348,'{"id":4348,"title":"Poetry","director":"Lee Chang-dong","year":2010,"tmdb_id":47909,"imdb_id":"tt1287878","original_title":"시","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4349','movie',4349,'{"id":4349,"title":"Route Irish","director":"Ken Loach","year":2010,"tmdb_id":59065,"imdb_id":"tt1528312","original_title":"Route Irish","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4350','movie',4350,'{"id":4350,"title":"Our Life","director":"Daniele Luchetti","year":2010,"tmdb_id":46920,"imdb_id":"tt1509636","original_title":"La nostra vita","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4351','movie',4351,'{"id":4351,"title":"The Princess of Montpensier","director":"Bertrand Tavernier","year":2010,"tmdb_id":57695,"imdb_id":"tt1599975","original_title":"La Princesse de Montpensier","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4352','movie',4352,'{"id":4352,"title":"Adrift","director":"Heitor Dhalia","year":2009,"tmdb_id":39641,"imdb_id":"tt1016321","original_title":"À Deriva","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4353','movie',4353,'{"id":4353,"title":"Chongqing Blues","director":"Wang Xiaoshuai","year":2010,"tmdb_id":63458,"imdb_id":"tt1646123","original_title":"日照重庆","original_language":"zh","alternate_titles":["RIZHAO CHONGQING"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4354','movie',4354,'{"id":4354,"title":"Tender Son: The Frankenstein Project","director":"Kornél Mundruczó","year":2010,"tmdb_id":73311,"imdb_id":"tt1527049","original_title":"Szelíd teremtés - A Frankenstein-terv","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4355','movie',4355,'{"id":4355,"title":"A Screaming Man","director":"Mahamat-Saleh Haroun","year":2010,"tmdb_id":57602,"imdb_id":"tt1639901","original_title":"Un homme qui crie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4356','movie',4356,'{"id":4356,"title":"Aurora","director":"Cristi Puiu","year":2010,"tmdb_id":81527,"imdb_id":"tt1403047","original_title":"Aurora","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4357','movie',4357,'{"id":4357,"title":"My Joy","director":"Sergei Loznitsa","year":2010,"tmdb_id":60981,"imdb_id":"tt1646114","original_title":"Счастье моё","original_language":"ru","alternate_titles":["SCHASTYE MOE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4358','movie',4358,'{"id":4358,"title":"Carancho","director":"Pablo Trapero","year":2010,"tmdb_id":47261,"imdb_id":"tt1542852","original_title":"Carancho","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4359','movie',4359,'{"id":4359,"title":"Chatroom","director":"Hideo Nakata","year":2010,"tmdb_id":48946,"imdb_id":"tt1319704","original_title":"Chatroom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4360','movie',4360,'{"id":4360,"title":"The Housemaid","director":"Im Sang-soo","year":2010,"tmdb_id":45202,"imdb_id":"tt1314652","original_title":"하녀","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4361','movie',4361,'{"id":4361,"title":"Film Socialisme","director":"Jean-Luc Godard","year":2010,"tmdb_id":54083,"imdb_id":"tt1438535","original_title":"Film Socialisme","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4362','movie',4362,'{"id":4362,"title":"Ha Ha Ha","director":"Hong Sang-soo","year":2010,"tmdb_id":60098,"imdb_id":"tt1452626","original_title":"하하하","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4363','movie',4363,'{"id":4363,"title":"Life, Above All","director":"Oliver Schmitz","year":2010,"tmdb_id":45244,"imdb_id":"tt1646111","original_title":"Life, Above All","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4364','movie',4364,'{"id":4364,"title":"On Tour","director":"Mathieu Amalric","year":2010,"tmdb_id":41273,"imdb_id":"tt1451762","original_title":"Tournée","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4365','movie',4365,'{"id":4365,"title":"The Lips","director":"Santiago Loza, Iván Fund","year":2010,"tmdb_id":163930,"imdb_id":"tt1637694","original_title":"Los labios","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4366','movie',4366,'{"id":4366,"title":"Tuesday, After Christmas","director":"Radu Muntean","year":2010,"tmdb_id":55151,"imdb_id":"tt1470024","original_title":"Marți, după Crăciun","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4367','movie',4367,'{"id":4367,"title":"The Strange Case of Angelica","director":"Manoel de Oliveira","year":2010,"tmdb_id":53413,"imdb_id":"tt1282153","original_title":"O Estranho Caso de Angélica","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4368','movie',4368,'{"id":4368,"title":"I Wish I Knew","director":"Jia Zhangke","year":2010,"tmdb_id":57395,"imdb_id":"tt1646103","original_title":"海上传奇","original_language":"zh","alternate_titles":["HAI SHANG CHUAN QI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4369','movie',4369,'{"id":4369,"title":"R U There","director":"David Verbeek","year":2010,"tmdb_id":73423,"imdb_id":"tt1443518","original_title":"R U There","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4370','movie',4370,'{"id":4370,"title":"Adrienn Pál","director":"Ágnes Kocsis","year":2010,"tmdb_id":163942,"imdb_id":"tt0146592","original_title":"Pál Adrienn","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4371','movie',4371,'{"id":4371,"title":"Rebecca H. (Return to the Dogs)","director":"Lodge Kerrigan","year":2010,"tmdb_id":123889,"imdb_id":"tt1646121","original_title":"Rebecca H. (Return to the Dogs)","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4372','movie',4372,'{"id":4372,"title":"The City Below","director":"Christoph Hochhäusler","year":2010,"tmdb_id":78400,"imdb_id":"tt1616194","original_title":"Unter dir die Stadt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4373','movie',4373,'{"id":4373,"title":"Dry Season","director":"Mahamat-Saleh Haroun","year":2006,"tmdb_id":24171,"imdb_id":"tt0825241","original_title":"Daratt","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4374','movie',4374,'{"id":4374,"title":"Private Fears in Public Places","director":"Alain Resnais","year":2006,"tmdb_id":24170,"imdb_id":"tt0498120","original_title":"Cœurs","original_language":"fr","alternate_titles":["Hearts"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4375','movie',4375,'{"id":4375,"title":"Heartbeats","director":"Xavier Dolan","year":2010,"tmdb_id":51241,"imdb_id":"tt1600524","original_title":"Les amours imaginaires","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4376','movie',4376,'{"id":4376,"title":"The Untouchable","director":"Benoît Jacquot","year":2006,"tmdb_id":99215,"imdb_id":"tt0810077","original_title":"L''intouchable","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4377','movie',4377,'{"id":4377,"title":"I Don''t Want to Sleep Alone","director":"Tsai Ming-liang","year":2006,"tmdb_id":12130,"imdb_id":"tt0855824","original_title":"黑眼圈","original_language":"zh","alternate_titles":["Hei Yan Quan","Hei yanquan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4378','movie',4378,'{"id":4378,"title":"Exiled","director":"Johnnie To","year":2006,"tmdb_id":13807,"imdb_id":"tt0796212","original_title":"放‧逐","original_language":"cn","alternate_titles":["Fong juk","Fangzhu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4379','movie',4379,'{"id":4379,"title":"Lights Out","director":"Fabrice Gobert","year":2010,"tmdb_id":59015,"imdb_id":"tt1646127","original_title":"Simon Werner a disparu","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4380','movie',4380,'{"id":4380,"title":"Mushi-Shi: The Movie","director":"Katsuhiro Otomo","year":2006,"tmdb_id":21959,"imdb_id":"tt0862946","original_title":"蟲師","original_language":"ja","alternate_titles":["Mushishi","Bugmaster"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4381','movie',4381,'{"id":4381,"title":"Private Property","director":"Joachim Lafosse","year":2006,"tmdb_id":12156,"imdb_id":"tt0855895","original_title":"Nue propriété","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4382','movie',4382,'{"id":4382,"title":"Paprika","director":"Satoshi Kon","year":2006,"tmdb_id":4977,"imdb_id":"tt0851578","original_title":"パプリカ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4383','movie',4383,'{"id":4383,"title":"Golden Door","director":"Emanuele Crialese","year":2006,"tmdb_id":1993,"imdb_id":"tt0465188","original_title":"Nuovomondo","original_language":"it","alternate_titles":["Nuovomondo - Golden Door"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4384','movie',4384,'{"id":4384,"title":"These Encounters of Theirs","director":"Danièle Huillet, Jean-Marie Straub","year":2005,"tmdb_id":108772,"imdb_id":"tt0815227","original_title":"Quei loro incontri","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4385','movie',4385,'{"id":4385,"title":"Udaan","director":"Vikramaditya Motwane","year":2010,"tmdb_id":45316,"imdb_id":"tt1639426","original_title":"उड़ान","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4386','movie',4386,'{"id":4386,"title":"Still Life","director":"Jia Zhangke","year":2006,"tmdb_id":2346,"imdb_id":"tt0859765","original_title":"三峡好人","original_language":"zh","alternate_titles":["Sanxia haoren","Natura morta"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4387','movie',4387,'{"id":4387,"title":"Cobrador: In God We Trust","director":"Paul Leduc","year":2006,"tmdb_id":41727,"imdb_id":"tt0462230","original_title":"Cobrador","original_language":"es","alternate_titles":["El Cobrador, In God We Trust"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4388','movie',4388,'{"id":4388,"title":"The Missing Star","director":"Gianni Amelio","year":2006,"tmdb_id":24189,"imdb_id":"tt0448131","original_title":"La stella che non c''è","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4389','movie',4389,'{"id":4389,"title":"Dong","director":"Jia Zhangke","year":2006,"tmdb_id":101822,"imdb_id":"tt0855784","original_title":"东","original_language":"zh","alternate_titles":["East"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4390','movie',4390,'{"id":4390,"title":"Crickets","director":"Shinji Aoyama","year":2006,"tmdb_id":314114,"imdb_id":"tt0862943","original_title":"こおろぎ","original_language":"ja","alternate_titles":["Kôrogi","Koorogi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4391','movie',4391,'{"id":4391,"title":"Love for Sale","director":"Karim Aïnouz","year":2006,"tmdb_id":95342,"imdb_id":"tt0841175","original_title":"O Céu de Suely","original_language":"pt","alternate_titles":["Suely in the Sky"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4392','movie',4392,'{"id":4392,"title":"Infamous","director":"Douglas McGrath","year":2006,"tmdb_id":9672,"imdb_id":"tt0420609","original_title":"Infamous","original_language":"en","alternate_titles":["Every Word Is True"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4393','movie',4393,'{"id":4393,"title":"Requiem from Java","director":"Garin Nugroho","year":2005,"tmdb_id":63923,"imdb_id":"tt0844742","original_title":"Opera Jawa","original_language":"jv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4394','movie',4394,'{"id":4394,"title":"The Hottest State","director":"Ethan Hawke","year":2006,"tmdb_id":18586,"imdb_id":"tt0496319","original_title":"The Hottest State","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4395','movie',4395,'{"id":4395,"title":"The U.S. vs. John Lennon","director":"John Scheinfeld, David Leaf","year":2006,"tmdb_id":14201,"imdb_id":"tt0478049","original_title":"The U.S. vs. John Lennon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4396','movie',4396,'{"id":4396,"title":"Free Floating","director":"Boris Khlebnikov","year":2006,"tmdb_id":49577,"imdb_id":"tt0875122","original_title":"Свободное плавание","original_language":"ru","alternate_titles":["Svobodnoe plavanie"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4397','movie',4397,'{"id":4397,"title":"Rome Rather Than You","director":"Tariq Teguia","year":2006,"tmdb_id":185570,"imdb_id":"tt0963792","original_title":"Roma Wa La N''Touma","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4398','movie',4398,'{"id":4398,"title":"In the City of Sylvia","director":"José Luis Guerín","year":2007,"tmdb_id":29568,"imdb_id":"tt0809425","original_title":"En la ciudad de Sylvia","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4399','movie',4399,'{"id":4399,"title":"The Sweet and the Bitter","director":"Andrea Porporati","year":2007,"tmdb_id":3982,"imdb_id":"tt1071785","original_title":"Il dolce e l''amaro","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4400','movie',4400,'{"id":4400,"title":"It''s a Free World...","director":"Ken Loach","year":2007,"tmdb_id":7992,"imdb_id":"tt0807054","original_title":"It''s a Free World...","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4401','movie',4401,'{"id":4401,"title":"Fallen Heroes","director":"Paolo Franchi","year":2007,"tmdb_id":82349,"imdb_id":"tt1094267","original_title":"Nessuna qualità agli eroi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4402','movie',4402,'{"id":4402,"title":"The Trial Begins","director":"Vincenzo Marra","year":2007,"tmdb_id":115320,"imdb_id":"tt1086355","original_title":"L''ora di punta","original_language":"it","alternate_titles":["Rush Hour"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4403','movie',4403,'{"id":4403,"title":"Nightwatching","director":"Peter Greenaway","year":2007,"tmdb_id":4556,"imdb_id":"tt0446750","original_title":"Nightwatching","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4404','movie',4404,'{"id":4404,"title":"Redacted","director":"Brian De Palma","year":2007,"tmdb_id":11600,"imdb_id":"tt0937237","original_title":"Redacted","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4405','movie',4405,'{"id":4405,"title":"Sleuth","director":"Kenneth Branagh","year":2007,"tmdb_id":4520,"imdb_id":"tt0857265","original_title":"Sleuth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4406','movie',4406,'{"id":4406,"title":"Mad Detective","director":"Wai Ka-fai, Johnnie To","year":2007,"tmdb_id":14016,"imdb_id":"tt0969269","original_title":"神探","original_language":"zh","alternate_titles":["San taam","Shentan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4407','movie',4407,'{"id":4407,"title":"The Romance of Astrea and Celadon","director":"Éric Rohmer","year":2007,"tmdb_id":45458,"imdb_id":"tt0823240","original_title":"Les Amours d''Astrée et de Céladon","original_language":"fr","alternate_titles":["Les Amours d''Astrée et Céladon"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4408','movie',4408,'{"id":4408,"title":"Sukiyaki Western Django","director":"Takashi Miike","year":2007,"tmdb_id":13637,"imdb_id":"tt0906665","original_title":"Sukiyaki Western Django","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4409','movie',4409,'{"id":4409,"title":"Lou Reed''s Berlin","director":"Julian Schnabel","year":2007,"tmdb_id":72303,"imdb_id":"tt1093836","original_title":"Lou Reed''s Berlin","original_language":"en","alternate_titles":["Berlin"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4410','movie',4410,'{"id":4410,"title":"Drifter","director":"Cao Guimarães","year":2007,"tmdb_id":214944,"imdb_id":"tt2015288","original_title":"Andarilho","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4411','movie',4411,'{"id":4411,"title":"Cochochi","director":"Israel Cárdenas, Laura Amelia Guzmán","year":2007,"tmdb_id":163659,"imdb_id":"tt0841017","original_title":"Cochochi","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4412','movie',4412,'{"id":4412,"title":"The Silence Before Bach","director":"Pere Portabella","year":2007,"tmdb_id":94509,"imdb_id":"tt1079450","original_title":"Die Stille vor Bach","original_language":"ca","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4413','movie',4413,'{"id":4413,"title":"Exodus","director":"Penny Woolcock","year":2007,"tmdb_id":55191,"imdb_id":"tt0831316","original_title":"Exodus","original_language":"en","alternate_titles":["The Margate Exodus"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4414','movie',4414,'{"id":4414,"title":"The Story of Richard O","director":"Damien Odoul","year":2007,"tmdb_id":72286,"imdb_id":"tt1051905","original_title":"L''histoire de Richard O","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4415','movie',4415,'{"id":4415,"title":"Misbegotten","director":"João Canijo","year":2007,"tmdb_id":360360,"imdb_id":"tt1010420","original_title":"Mal Nascida","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4416','movie',4416,'{"id":4416,"title":"Medea Miracle","director":"Tonino De Bernardi","year":2007,"tmdb_id":152335,"imdb_id":"tt1094262","original_title":"Medée miracle","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4417','movie',4417,'{"id":4417,"title":"Sad Vacation","director":"Shinji Aoyama","year":2007,"tmdb_id":127838,"imdb_id":"tt0915749","original_title":"サッド ヴァケイション","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4418','movie',4418,'{"id":4418,"title":"Searchers 2.0","director":"Alex Cox","year":2007,"tmdb_id":57297,"imdb_id":"tt0943982","original_title":"Searchers 2.0","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4419','movie',4419,'{"id":4419,"title":"Jimmy Carter Man from Plains","director":"Jonathan Demme","year":2007,"tmdb_id":78527,"imdb_id":"tt0913958","original_title":"Jimmy Carter Man from Plains","original_language":"en","alternate_titles":["Man from Plains"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4420','movie',4420,'{"id":4420,"title":"Autumn Ball","director":"Veiko Õunpuu","year":2007,"tmdb_id":46847,"imdb_id":"tt0834170","original_title":"Sügisball","original_language":"et","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4421','movie',4421,'{"id":4421,"title":"Crossing the Line","director":"Pietro Marcello","year":2007,"tmdb_id":352371,"imdb_id":"tt1094270","original_title":"Il passaggio della linea","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4422','movie',4422,'{"id":4422,"title":"Useless","director":"Jia Zhangke","year":2007,"tmdb_id":125556,"imdb_id":"tt1094286","original_title":"无用","original_language":"zh","alternate_titles":["Wuyong"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4423','movie',4423,'{"id":4423,"title":"Birdwatchers","director":"Marco Bechis","year":2008,"tmdb_id":12811,"imdb_id":"tt1054674","original_title":"BirdWatchers - La terra degli uomini rossi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4424','movie',4424,'{"id":4424,"title":"The Beloved","director":"Arnaud Desplechin","year":2007,"tmdb_id":130442,"imdb_id":"tt1094621","original_title":"L''aimée","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4425','movie',4425,'{"id":4425,"title":"Dust","director":"Hartmut Bitomsky","year":2007,"tmdb_id":121232,"imdb_id":"tt1094277","original_title":"Staub","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4426','movie',4426,'{"id":4426,"title":"The Obscure","director":"Lü Yue","year":2007,"tmdb_id":479413,"imdb_id":"tt0989890","original_title":"小说","original_language":"zh","alternate_titles":["Xiao shuo","Xiaoshuo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4427','movie',4427,'{"id":4427,"title":"The Seed of Discord","director":"Pappi Corsicato","year":2008,"tmdb_id":12426,"imdb_id":"tt1275799","original_title":"Il Seme Della Discordia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4428','movie',4428,'{"id":4428,"title":"Giovanna''s Father","director":"Pupi Avati","year":2008,"tmdb_id":12424,"imdb_id":"tt1249306","original_title":"Il papà di Giovanna","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4429','movie',4429,'{"id":4429,"title":"Inju: The Beast in the Shadow","director":"Barbet Schroeder","year":2008,"tmdb_id":12406,"imdb_id":"tt0818110","original_title":"Inju : La Bête dans l''ombre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4430','movie',4430,'{"id":4430,"title":"Jerichow","director":"Christian Petzold","year":2008,"tmdb_id":12161,"imdb_id":"tt1224153","original_title":"Jerichow","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4431','movie',4431,'{"id":4431,"title":"This Night","director":"Werner Schroeter","year":2008,"tmdb_id":12422,"imdb_id":"tt1206485","original_title":"Nuit de chien","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4432','movie',4432,'{"id":4432,"title":"The Sky Crawlers","director":"Mamoru Oshii","year":2008,"tmdb_id":15877,"imdb_id":"tt1056437","original_title":"スカイ・クロラ","original_language":"ja","alternate_titles":["Sukai kurora"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4433','movie',4433,'{"id":4433,"title":"Inland","director":"Tariq Teguia","year":2008,"tmdb_id":12433,"imdb_id":"tt1284577","original_title":"Gabbla","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4434','movie',4434,'{"id":4434,"title":"Milk","director":"Semih Kaplanoğlu","year":2008,"tmdb_id":12471,"imdb_id":"tt1284591","original_title":"Süt","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4435','movie',4435,'{"id":4435,"title":"The Burning Plain","director":"Guillermo Arriaga","year":2008,"tmdb_id":12165,"imdb_id":"tt1068641","original_title":"The Burning Plain","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4436','movie',4436,'{"id":4436,"title":"Ponyo","director":"Hayao Miyazaki","year":2008,"tmdb_id":12429,"imdb_id":"tt0876563","original_title":"崖の上のポニョ","original_language":"ja","alternate_titles":["Gake no ue no Ponyo","Ponyo on Cliff by the Sea"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4437','movie',4437,'{"id":4437,"title":"Teza","director":"Haile Gerima","year":2008,"tmdb_id":12427,"imdb_id":"tt1284592","original_title":"Teza","original_language":"am","alternate_titles":["Morning Dew"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4438','movie',4438,'{"id":4438,"title":"Vegas: Based on a True Story","director":"Amir Naderi","year":2008,"tmdb_id":12430,"imdb_id":"tt1283971","original_title":"Vegas: Based on a True Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4439','movie',4439,'{"id":4439,"title":"Plastic City","director":"Nelson Yu Lik-wai","year":2008,"tmdb_id":12434,"imdb_id":"tt1054119","original_title":"荡寇","original_language":"ja","alternate_titles":["Dangkou","Dangkou (Plastic City)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4440','movie',4440,'{"id":4440,"title":"Below Sea Level","director":"Gianfranco Rosi","year":2008,"tmdb_id":171061,"imdb_id":"tt1270612","original_title":"Below Sea Level","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4441','movie',4441,'{"id":4441,"title":"The Herb of the Rat","director":"Júlio Bressane","year":2008,"tmdb_id":52247,"imdb_id":"tt1270631","original_title":"A Erva do Rato","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4442','movie',4442,'{"id":4442,"title":"Wild Field","director":"Mikheil Kalatozishvili","year":2008,"tmdb_id":121688,"imdb_id":"tt1252383","original_title":"Дикое поле","original_language":"ru","alternate_titles":["Dikoe Pole"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4443','movie',4443,'{"id":4443,"title":"The First Day of Winter","director":"Mirko Locatelli","year":2008,"tmdb_id":69527,"imdb_id":"tt1270678","original_title":"Il primo giorno d''inverno","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4444','movie',4444,'{"id":4444,"title":"Goodbye Solo","director":"Ramin Bahrani","year":2008,"tmdb_id":21371,"imdb_id":"tt1095442","original_title":"Goodbye Solo","original_language":"en","alternate_titles":["Solo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4445','movie',4445,'{"id":4445,"title":"Jay","director":"Francis Xavier Pasion","year":2008,"tmdb_id":271869,"imdb_id":"tt1244571","original_title":"Jay","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4446','movie',4446,'{"id":4446,"title":"Pa-ra-da","director":"Marco Pontecorvo","year":2008,"tmdb_id":35647,"imdb_id":"tt1099226","original_title":"Pa-ra-da","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4447','movie',4447,'{"id":4447,"title":"Melancholia","director":"Lav Diaz","year":2008,"tmdb_id":200785,"imdb_id":"tt1269566","original_title":"Mapanglaw","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4448','movie',4448,'{"id":4448,"title":"L''exil et le royaume","director":"Jonathan Le Fourn, Andreï Schtakleff","year":2008,"tmdb_id":1357554,"imdb_id":"tt1270473","original_title":"L''exil et le royaume","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4449','movie',4449,'{"id":4449,"title":"Parc","director":"Arnaud des Pallières","year":2008,"tmdb_id":117896,"imdb_id":"tt0814759","original_title":"Parc","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4450','movie',4450,'{"id":4450,"title":"I''m Gonna Explode","director":"Gerardo Naranjo","year":2008,"tmdb_id":86440,"imdb_id":"tt1080857","original_title":"Voy a explotar","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4451','movie',4451,'{"id":4451,"title":"A Lake","director":"Philippe Grandrieux","year":2008,"tmdb_id":37000,"imdb_id":"tt1270702","original_title":"Un Lac","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4452','movie',4452,'{"id":4452,"title":"The Inheritors","director":"Eugenio Polgovsky","year":2008,"tmdb_id":178478,"imdb_id":"tt1270647","original_title":"Los Herederos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4453','movie',4453,'{"id":4453,"title":"Perfect Life","director":"Emily Tang","year":2008,"tmdb_id":247483,"imdb_id":"tt1510857","original_title":"完美生活","original_language":"zh","alternate_titles":["Wanmei shenhuo","Wanmei shenhuo (Perfect Life)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4454','movie',4454,'{"id":4454,"title":"Z32","director":"Avi Mograbi","year":2008,"tmdb_id":95585,"imdb_id":"tt1270707","original_title":"Z32","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4455','movie',4455,'{"id":4455,"title":"Zero Bridge","director":"Tariq Tapa","year":2008,"tmdb_id":113038,"imdb_id":"tt1270494","original_title":"Zero Bridge","original_language":"ks","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4456','movie',4456,'{"id":4456,"title":"Around a Small Mountain","director":"Jacques Rivette","year":2009,"tmdb_id":59947,"imdb_id":"tt1239285","original_title":"36 Vues du pic Saint-Loup","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4457','movie',4457,'{"id":4457,"title":"The Traveller","director":"Ahmed Maher","year":2009,"tmdb_id":203529,"imdb_id":"tt1498709","original_title":"المسافر","original_language":"ar","alternate_titles":["Al Mosafer"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4458','movie',4458,'{"id":4458,"title":"A Perfect Day","director":"Ferzan Özpetek","year":2008,"tmdb_id":12432,"imdb_id":"tt1056067","original_title":"Un giorno perfetto","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4459','movie',4459,'{"id":4459,"title":"Bad Lieutenant: Port of Call New Orleans","director":"Werner Herzog","year":2009,"tmdb_id":11699,"imdb_id":"tt1095217","original_title":"Bad Lieutenant: Port of Call New Orleans","original_language":"en","alternate_titles":["Bad Lieutenant"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4460','movie',4460,'{"id":4460,"title":"We","director":"Wenhai Huang","year":2008,"tmdb_id":767592,"imdb_id":"tt1270706","original_title":"我们","original_language":"zh","alternate_titles":["Wo Men","Women"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4461','movie',4461,'{"id":4461,"title":"Between Two Worlds","director":"Vimukthi Jayasundara","year":2009,"tmdb_id":203221,"imdb_id":"tt1498708","original_title":"අහසින් වැටෙයි","original_language":"si","alternate_titles":["Ahasin Watai","Ahasin Wetei"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4462','movie',4462,'{"id":4462,"title":"The Double Hour","director":"Giuseppe Capotondi","year":2009,"tmdb_id":42571,"imdb_id":"tt1379222","original_title":"La doppia ora","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4463','movie',4463,'{"id":4463,"title":"Capitalism: A Love Story","director":"Michael Moore","year":2008,"tmdb_id":22074,"imdb_id":"tt1232207","original_title":"Capitalism: A Love Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4464','movie',4464,'{"id":4464,"title":"Life During Wartime","director":"Todd Solondz","year":2009,"tmdb_id":39800,"imdb_id":"tt0808526","original_title":"Life During Wartime","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4465','movie',4465,'{"id":4465,"title":"Prince of Tears","director":"Yonfan","year":2009,"tmdb_id":203530,"imdb_id":"tt1498834","original_title":"淚王子","original_language":"zh","alternate_titles":["Lei wangzi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4466','movie',4466,'{"id":4466,"title":"The Big Dream","director":"Michele Placido","year":2008,"tmdb_id":51477,"imdb_id":"tt1194231","original_title":"Il grande sogno","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4467','movie',4467,'{"id":4467,"title":"Lebanon","director":"Samuel Maoz","year":2009,"tmdb_id":32084,"imdb_id":"tt1483831","original_title":"לבנון","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4468','movie',4468,'{"id":4468,"title":"Lourdes","director":"Jessica Hausner","year":2009,"tmdb_id":41123,"imdb_id":"tt1405809","original_title":"Lourdes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4469','movie',4469,'{"id":4469,"title":"The White Space","director":"Francesca Comencini","year":2009,"tmdb_id":56844,"imdb_id":"tt1371700","original_title":"Lo spazio bianco","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4470','movie',4470,'{"id":4470,"title":"Soul Kitchen","director":"Fatih Akin","year":2009,"tmdb_id":31175,"imdb_id":"tt1244668","original_title":"Soul Kitchen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4471','movie',4471,'{"id":4471,"title":"My Son, My Son, What Have Ye Done","director":"Werner Herzog","year":2009,"tmdb_id":44027,"imdb_id":"tt1233219","original_title":"My Son, My Son, What Have Ye Done","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4472','movie',4472,'{"id":4472,"title":"Tetsuo: The Bullet Man","director":"Shinya Tsukamoto","year":2009,"tmdb_id":52034,"imdb_id":"tt1176416","original_title":"鉄男 THE BULLET MAN","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4473','movie',4473,'{"id":4473,"title":"Survival of the Dead","director":"George A. Romero","year":2009,"tmdb_id":29426,"imdb_id":"tt1134854","original_title":"Survival of the Dead","original_language":"en","alternate_titles":["George A. Romero''s Survival of the Dead","Untitled George A. Romero''s Diary of the Dead Sequel"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4474','movie',4474,'{"id":4474,"title":"Persecution","director":"Patrice Chéreau","year":2009,"tmdb_id":57534,"imdb_id":"tt1303230","original_title":"Persécution","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4475','movie',4475,'{"id":4475,"title":"The Road","director":"John Hillcoat","year":2009,"tmdb_id":20766,"imdb_id":"tt0898367","original_title":"The Road","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4476','movie',4476,'{"id":4476,"title":"White Material","director":"Claire Denis","year":2009,"tmdb_id":46207,"imdb_id":"tt1135952","original_title":"White Material","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4477','movie',4477,'{"id":4477,"title":"1428","director":"Du Haibin","year":2009,"tmdb_id":78380,"imdb_id":"tt1500679","original_title":"1428","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4478','movie',4478,'{"id":4478,"title":"Buried Secrets","director":"Raja Amari","year":2009,"tmdb_id":59992,"imdb_id":"tt1337140","original_title":"Anonymes","original_language":"ar","alternate_titles":["Dowaha"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4479','movie',4479,'{"id":4479,"title":"Francesca","director":"Bobby Păunescu","year":2009,"tmdb_id":34499,"imdb_id":"tt1353168","original_title":"Francesca","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4480','movie',4480,'{"id":4480,"title":"The Man''s Woman and Other Stories","director":"Amit Dutta","year":2009,"tmdb_id":260649,"imdb_id":"tt1500682","original_title":"आदमी की औरत और अन्य कहानियाँ","original_language":"hi","alternate_titles":["Aadmi Ki Aurat Aur Anya Kahaniya"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4481','movie',4481,'{"id":4481,"title":"Clash","director":"Pepe Diokno","year":2009,"tmdb_id":108519,"imdb_id":"tt1424053","original_title":"Engkwentro","original_language":"tl","alternate_titles":["Meeting"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4482','movie',4482,'{"id":4482,"title":"Sunstroke","director":"Felipe Hirsch, Daniela Thomas","year":2009,"tmdb_id":81076,"imdb_id":"tt1500720","original_title":"Insolação","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4483','movie',4483,'{"id":4483,"title":"Pepperminta","director":"Pipilotti Rist","year":2009,"tmdb_id":237958,"imdb_id":"tt1433911","original_title":"Pepperminta","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4484','movie',4484,'{"id":4484,"title":"Repo Chick","director":"Alex Cox","year":2009,"tmdb_id":58586,"imdb_id":"tt1379734","original_title":"Repo Chick","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4485','movie',4485,'{"id":4485,"title":"Paraiso","director":"Héctor Gálvez","year":2009,"tmdb_id":323018,"imdb_id":"tt1500741","original_title":"Paraíso","original_language":"es","alternate_titles":["Paradise"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4486','movie',4486,'{"id":4486,"title":"I Travel Because I Have to, I Come Back Because I Love You","director":"Karim Aïnouz, Marcelo Gomes","year":2009,"tmdb_id":87199,"imdb_id":"tt1500761","original_title":"Viajo Porque Preciso, Volto Porque Te Amo","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4487','movie',4487,'{"id":4487,"title":"Varese, the One All Alone","director":"Frank Scheffer","year":2009,"tmdb_id":435883,"imdb_id":"tt1417053","original_title":"Varese, the One All Alone","original_language":"en","alternate_titles":["The One All Alone"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4488','movie',4488,'{"id":4488,"title":"Adrift","director":"Bùi Thạc Chuyên","year":2009,"tmdb_id":111396,"imdb_id":"tt1499639","original_title":"Chơi vơi","original_language":"vi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4489','movie',4489,'{"id":4489,"title":"Woman on Fire Looks for Water","director":"Woo Ming Jin","year":2009,"tmdb_id":198959,"imdb_id":"tt1493296","original_title":"Woman on Fire Looks for Water","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4490','movie',4490,'{"id":4490,"title":"One-Zero","director":"Kamla Abu Zekry","year":2009,"tmdb_id":57802,"imdb_id":"tt1410252","original_title":"واحد صفر","original_language":"ar","alternate_titles":["Wahed-Sefr"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4491','movie',4491,'{"id":4491,"title":"The Last Circus","director":"Álex de la Iglesia","year":2010,"tmdb_id":56812,"imdb_id":"tt1572491","original_title":"Balada triste de trompeta","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4492','movie',4492,'{"id":4492,"title":"Zarte Parasiten","director":"Oliver Schwabe, Christian Becker","year":2009,"tmdb_id":73202,"imdb_id":"tt1305778","original_title":"Zarte Parasiten","original_language":"de","alternate_titles":["Tender Parasites"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4493','movie',4493,'{"id":4493,"title":"Attenberg","director":"Athina Rachel Tsangari","year":2010,"tmdb_id":62321,"imdb_id":"tt1691323","original_title":"Attenberg","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4494','movie',4494,'{"id":4494,"title":"Three","director":"Tom Tykwer","year":2010,"tmdb_id":53256,"imdb_id":"tt1517177","original_title":"Drei","original_language":"de","alternate_titles":["3"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4495','movie',4495,'{"id":4495,"title":"Four Lovers","director":"Antony Cordier","year":2010,"tmdb_id":59507,"imdb_id":"tt1528750","original_title":"Happy Few","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4496','movie',4496,'{"id":4496,"title":"Essential Killing","director":"Jerzy Skolimowski","year":2010,"tmdb_id":48243,"imdb_id":"tt1561768","original_title":"Essential Killing","original_language":"en","alternate_titles":["Essence"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4497','movie',4497,'{"id":4497,"title":"13 Assassins","director":"Takashi Miike","year":2010,"tmdb_id":58857,"imdb_id":"tt1436045","original_title":"十三人の刺客","original_language":"ja","alternate_titles":["Jûsan-nin no shikaku","Thirteen Assassins"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4498','movie',4498,'{"id":4498,"title":"The Black Sheep","director":"Ascanio Celestini","year":2010,"tmdb_id":56799,"imdb_id":"tt1680096","original_title":"La pecora nera","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4499','movie',4499,'{"id":4499,"title":"The Solitude of Prime Numbers","director":"Saverio Costanzo","year":2010,"tmdb_id":53399,"imdb_id":"tt1441373","original_title":"La solitudine dei numeri primi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4500','movie',4500,'{"id":4500,"title":"Miral","director":"Julian Schnabel","year":2010,"tmdb_id":45595,"imdb_id":"tt1366409","original_title":"Miral","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4501','movie',4501,'{"id":4501,"title":"Meek''s Cutoff","director":"Kelly Reichardt","year":2010,"tmdb_id":57120,"imdb_id":"tt1518812","original_title":"Meek''s Cutoff","original_language":"en","alternate_titles":["Meek''s Oregon 1845 Cutoff"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4502','movie',4502,'{"id":4502,"title":"Norwegian Wood","director":"Trần Anh Hùng","year":2010,"tmdb_id":57703,"imdb_id":"tt1270842","original_title":"ノルウェイの森","original_language":"ja","alternate_titles":["Noruwei no mori"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4503','movie',4503,'{"id":4503,"title":"We Believed","director":"Mario Martone","year":2010,"tmdb_id":56853,"imdb_id":"tt1365490","original_title":"Noi credevamo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4504','movie',4504,'{"id":4504,"title":"Detective Dee and the Mystery of the Phantom Flame","director":"Tsui Hark","year":2010,"tmdb_id":48492,"imdb_id":"tt1123373","original_title":"狄仁傑之通天帝國","original_language":"zh","alternate_titles":["Di renjie zhi tongtian diguo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4505','movie',4505,'{"id":4505,"title":"Post Mortem","director":"Pablo Larraín","year":2010,"tmdb_id":56815,"imdb_id":"tt1714886","original_title":"Post Mortem","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4506','movie',4506,'{"id":4506,"title":"La passione","director":"Carlo Mazzacurati","year":2010,"tmdb_id":45950,"imdb_id":"tt1523498","original_title":"La passione","original_language":"it","alternate_titles":["The Passion"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4507','movie',4507,'{"id":4507,"title":"Silent Souls","director":"Aleksey Fedorchenko","year":2010,"tmdb_id":51276,"imdb_id":"tt1693830","original_title":"Овсянки","original_language":"ru","alternate_titles":["Ovsyanki"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4508','movie',4508,'{"id":4508,"title":"Somewhere","director":"Sofia Coppola","year":2010,"tmdb_id":39210,"imdb_id":"tt1421051","original_title":"Somewhere","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4509','movie',4509,'{"id":4509,"title":"Black Venus","director":"Abdellatif Kechiche","year":2010,"tmdb_id":56405,"imdb_id":"tt1401643","original_title":"Vénus noire","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4510','movie',4510,'{"id":4510,"title":"The Sword and the Rose","director":"João Nicolau","year":2010,"tmdb_id":213087,"imdb_id":"tt1686635","original_title":"A Espada e a Rosa","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4511','movie',4511,'{"id":4511,"title":"Road to Nowhere","director":"Monte Hellman","year":2010,"tmdb_id":42707,"imdb_id":"tt1504319","original_title":"Road to Nowhere","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4512','movie',4512,'{"id":4512,"title":"Burnface","director":"Lluís Galter","year":2010,"tmdb_id":96589,"imdb_id":"tt1706675","original_title":"Caracremada","original_language":"ca","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4513','movie',4513,'{"id":4513,"title":"Promises Written in Water","director":"Vincent Gallo","year":2010,"tmdb_id":123029,"imdb_id":"tt1712563","original_title":"Promises Written in Water","original_language":"en","alternate_titles":["The Funeral Director"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4514','movie',4514,'{"id":4514,"title":"El Sicario, Room 164","director":"Gianfranco Rosi","year":2010,"tmdb_id":56519,"imdb_id":"tt1760956","original_title":"El Sicario, Room 164","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4515','movie',4515,'{"id":4515,"title":"Anti-Gas Skin","director":"Kim Gok, Kim Sun","year":2010,"tmdb_id":178832,"imdb_id":"tt1734068","original_title":"방독피","original_language":"ko","alternate_titles":["Bangdokpi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4516','movie',4516,'{"id":4516,"title":"Jean Gentil","director":"Laura Amelia Guzmán, Israel Cárdenas","year":2010,"tmdb_id":81634,"imdb_id":"tt1376422","original_title":"Jean Gentil","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4517','movie',4517,'{"id":4517,"title":"Nainsukh","director":"Amit Dutta","year":2010,"tmdb_id":81648,"imdb_id":"tt1783352","original_title":"नैनसुख","original_language":"ks","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4518','movie',4518,'{"id":4518,"title":"Guest","director":"José Luis Guerín","year":2010,"tmdb_id":85924,"imdb_id":"tt1692848","original_title":"Guest","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4519','movie',4519,'{"id":4519,"title":"Oki''s Movie","director":"Hong Sang-soo","year":2010,"tmdb_id":86261,"imdb_id":"tt1714878","original_title":"옥희의 영화","original_language":"ko","alternate_titles":["Ok-hui-ui yeonghwa"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4520','movie',4520,'{"id":4520,"title":"The Sleeping Beauty","director":"Catherine Breillat","year":2010,"tmdb_id":65016,"imdb_id":"tt1721683","original_title":"La belle endormie","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4521','movie',4521,'{"id":4521,"title":"Robinson in Ruins","director":"Patrick Keiller","year":2010,"tmdb_id":69340,"imdb_id":"tt1714893","original_title":"Robinson in Ruins","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4522','movie',4522,'{"id":4522,"title":"The Nine Muses","director":"John Akomfrah","year":2010,"tmdb_id":104988,"imdb_id":"tt1706701","original_title":"The Nine Muses","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4523','movie',4523,'{"id":4523,"title":"The Forgotten Space","director":"Allan Sekula, Noël Burch","year":2010,"tmdb_id":105554,"imdb_id":"tt1772382","original_title":"The Forgotten Space","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4524','movie',4524,'{"id":4524,"title":"A Prairie Home Companion","director":"Robert Altman","year":2005,"tmdb_id":9526,"imdb_id":"tt0420087","original_title":"A Prairie Home Companion","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4525','movie',4525,'{"id":4525,"title":"Candy","director":"Neil Armfield","year":2005,"tmdb_id":4441,"imdb_id":"tt0424880","original_title":"Candy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4526','movie',4526,'{"id":4526,"title":"Cold Fish","director":"Sion Sono","year":2010,"tmdb_id":68341,"imdb_id":"tt1632547","original_title":"冷たい熱帯魚","original_language":"ja","alternate_titles":["Tsumetai Nettaigyo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4527','movie',4527,'{"id":4527,"title":"The Free Will","director":"Matthias Glasner","year":2006,"tmdb_id":9999,"imdb_id":"tt0499101","original_title":"Der freie Wille","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4528','movie',4528,'{"id":4528,"title":"Summer of Goliath","director":"Nicolás Pereda","year":2010,"tmdb_id":99495,"imdb_id":"tt1714758","original_title":"Verano de Goliat","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4529','movie',4529,'{"id":4529,"title":"Grbavica: The Land of My Dreams","director":"Jasmila Žbanić","year":2005,"tmdb_id":317,"imdb_id":"tt0464029","original_title":"Grbavica","original_language":"bs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4530','movie',4530,'{"id":4530,"title":"The House by the Medlar Tree","director":"Pasquale Scimeca","year":2010,"tmdb_id":74651,"imdb_id":"tt1706441","original_title":"Malavoglia","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4531','movie',4531,'{"id":4531,"title":"The Custodian","director":"Rodrigo Moreno","year":2005,"tmdb_id":99896,"imdb_id":"tt0462242","original_title":"El custodio","original_language":"es","alternate_titles":["Der Schatten"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4532','movie',4532,'{"id":4532,"title":"Invisible Waves","director":"Pen-Ek Ratanaruang","year":2005,"tmdb_id":38025,"imdb_id":"tt0461970","original_title":"คําพิพากษาของมหาสมุทร","original_language":"th","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4533','movie',4533,'{"id":4533,"title":"Comedy of Power","director":"Claude Chabrol","year":2005,"tmdb_id":12713,"imdb_id":"tt0463486","original_title":"L''Ivresse du pouvoir","original_language":"fr","alternate_titles":["Geheime Staatsaffären"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4534','movie',4534,'{"id":4534,"title":"Requiem","director":"Hans-Christian Schmid","year":2006,"tmdb_id":523,"imdb_id":"tt0454931","original_title":"Requiem","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4535','movie',4535,'{"id":4535,"title":"A Soap","director":"Pernille Fischer Christensen","year":2005,"tmdb_id":15845,"imdb_id":"tt0419146","original_title":"En soap","original_language":"da","alternate_titles":["Eine Soap"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4536','movie',4536,'{"id":4536,"title":"Snow Cake","director":"Marc Evans","year":2006,"tmdb_id":313,"imdb_id":"tt0448124","original_title":"Snow Cake","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4537','movie',4537,'{"id":4537,"title":"Offside","director":"Jafar Panahi","year":2005,"tmdb_id":13209,"imdb_id":"tt0499537","original_title":"آفساید","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4538','movie',4538,'{"id":4538,"title":"The Road to Guantanamo","director":"Mat Whitecross, Michael Winterbottom","year":2006,"tmdb_id":7872,"imdb_id":"tt0468094","original_title":"The Road to Guantanamo","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4539','movie',4539,'{"id":4539,"title":"Crime Novel","director":"Michele Placido","year":2005,"tmdb_id":14375,"imdb_id":"tt0418110","original_title":"Romanzo criminale","original_language":"it","alternate_titles":["Kriminalroman"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4540','movie',4540,'{"id":4540,"title":"It''s Winter","director":"Rafi Pitts","year":2005,"tmdb_id":4630,"imdb_id":"tt0499166","original_title":"زمستان","original_language":"fa","alternate_titles":["Zemestan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4541','movie',4541,'{"id":4541,"title":"Bordertown","director":"Gregory Nava","year":2006,"tmdb_id":4351,"imdb_id":"tt0445935","original_title":"Bordertown","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4542','movie',4542,'{"id":4542,"title":"Slumming","director":"Michael Glawogger","year":2006,"tmdb_id":76853,"imdb_id":"tt0499157","original_title":"Slumming","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4543','movie',4543,'{"id":4543,"title":"Goodbye Bafana","director":"Bille August","year":2006,"tmdb_id":1874,"imdb_id":"tt0438859","original_title":"Goodbye Bafana","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4544','movie',4544,'{"id":4544,"title":"Hallam Foe","director":"David Mackenzie","year":2007,"tmdb_id":2239,"imdb_id":"tt0466816","original_title":"Hallam Foe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4545','movie',4545,'{"id":4545,"title":"The Other","director":"Ariel Rotter","year":2007,"tmdb_id":78115,"imdb_id":"tt0499540","original_title":"El otro","original_language":"es","alternate_titles":["Der Andere"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4546','movie',4546,'{"id":4546,"title":"In Memory of Me","director":"Saverio Costanzo","year":2007,"tmdb_id":58099,"imdb_id":"tt0851191","original_title":"In memoria di me","original_language":"it","alternate_titles":["In Memory Of Myself"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4547','movie',4547,'{"id":4547,"title":"Longing","director":"Valeska Grisebach","year":2005,"tmdb_id":351,"imdb_id":"tt0416213","original_title":"Sehnsucht","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4548','movie',4548,'{"id":4548,"title":"The Witnesses","director":"André Téchiné","year":2006,"tmdb_id":38282,"imdb_id":"tt0487273","original_title":"Les Témoins","original_language":"fr","alternate_titles":["Die Zeugen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4549','movie',4549,'{"id":4549,"title":"Irina Palm","director":"Sam Garbarski","year":2006,"tmdb_id":1922,"imdb_id":"tt0762110","original_title":"Irina Palm","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4550','movie',4550,'{"id":4550,"title":"The Duchess of Langeais","director":"Jacques Rivette","year":2006,"tmdb_id":46335,"imdb_id":"tt0781435","original_title":"Ne touchez pas la hache","original_language":"fr","alternate_titles":["Don''t Touch The Axe","Die Herzogin von Langeais"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4551','movie',4551,'{"id":4551,"title":"Desert Dream","director":"Zhang Lu","year":2007,"tmdb_id":37838,"imdb_id":"tt0969276","original_title":"경계","original_language":"ko","alternate_titles":["Hyazgar"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4552','movie',4552,'{"id":4552,"title":"The Good German","director":"Steven Soderbergh","year":2006,"tmdb_id":182,"imdb_id":"tt0452624","original_title":"The Good German","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4553','movie',4553,'{"id":4553,"title":"I''m a Cyborg, But That''s OK","director":"Park Chan-wook","year":2006,"tmdb_id":5488,"imdb_id":"tt0497137","original_title":"싸이보그지만 괜찮아","original_language":"ko","alternate_titles":["Sai bo gu ji man gwen chan a","Ich bin ein Cyborg, aber das macht nichts"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4554','movie',4554,'{"id":4554,"title":"I Served the King of England","director":"Jiří Menzel","year":2006,"tmdb_id":12555,"imdb_id":"tt0284363","original_title":"Obsluhoval jsem anglického krále","original_language":"cs","alternate_titles":["Ich habe den englischen König bedient"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4555','movie',4555,'{"id":4555,"title":"The Good Shepherd","director":"Robert De Niro","year":2006,"tmdb_id":1247,"imdb_id":"tt0343737","original_title":"The Good Shepherd","original_language":"en","alternate_titles":["Der gute Hirte"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4556','movie',4556,'{"id":4556,"title":"Lost in Beijing","director":"Li Yu","year":2007,"tmdb_id":30112,"imdb_id":"tt0949489","original_title":"苹果","original_language":"zh","alternate_titles":["Ping Guo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4557','movie',4557,'{"id":4557,"title":"When A Man Falls In The Forest","director":"Ryan Eslinger","year":2006,"tmdb_id":24059,"imdb_id":"tt0468965","original_title":"When A Man Falls In The Forest","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4558','movie',4558,'{"id":4558,"title":"Tuya''s Marriage","director":"Wang Quan''an","year":2006,"tmdb_id":2694,"imdb_id":"tt0949564","original_title":"图雅的婚事","original_language":"zh","alternate_titles":["Tu ya de hun shi","Tuyas Ehe"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4559','movie',4559,'{"id":4559,"title":"The Year My Parents Went on Vacation","director":"Cao Hamburger","year":2006,"tmdb_id":14421,"imdb_id":"tt0857355","original_title":"O Ano em que Meus Pais Saíram de Férias","original_language":"pt","alternate_titles":["Das Jahr als meine Eltern im Urlaub waren"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4560','movie',4560,'{"id":4560,"title":"Yella","director":"Christian Petzold","year":2007,"tmdb_id":3037,"imdb_id":"tt0806686","original_title":"Yella","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4561','movie',4561,'{"id":4561,"title":"Ballast","director":"Lance Hammer","year":2007,"tmdb_id":25112,"imdb_id":"tt1153690","original_title":"Ballast","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4562','movie',4562,'{"id":4562,"title":"The Song of Sparrows","director":"Majid Majidi","year":2008,"tmdb_id":54254,"imdb_id":"tt0997246","original_title":"آواز گنجشک‌ها","original_language":"fa","alternate_titles":["Avaze Gonjeshk-ha"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4563','movie',4563,'{"id":4563,"title":"Heart of Fire","director":"Luigi Falorni","year":2008,"tmdb_id":52814,"imdb_id":"tt1169272","original_title":"Feuerherz","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4564','movie',4564,'{"id":4564,"title":"Gardens of the Night","director":"Damian Harris","year":2007,"tmdb_id":16867,"imdb_id":"tt0833960","original_title":"Gardens of the Night","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4565','movie',4565,'{"id":4565,"title":"Julia","director":"Erick Zonca","year":2007,"tmdb_id":7351,"imdb_id":"tt0903627","original_title":"Julia","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4566','movie',4566,'{"id":4566,"title":"Kabei: Our Mother","director":"Yoji Yamada","year":2007,"tmdb_id":25746,"imdb_id":"tt0855852","original_title":"母べえ","original_language":"ja","alternate_titles":["KABEI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4567','movie',4567,'{"id":4567,"title":"Quiet Chaos","director":"Antonello Grimaldi","year":2008,"tmdb_id":22274,"imdb_id":"tt0929412","original_title":"Caos calmo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4568','movie',4568,'{"id":4568,"title":"Cherry Blossoms","director":"Doris Dörrie","year":2007,"tmdb_id":6461,"imdb_id":"tt0910559","original_title":"Kirschblüten - Hanami","original_language":"de","alternate_titles":["Cherry Blossoms - Hanami"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4569','movie',4569,'{"id":4569,"title":"Lady Jane","director":"Robert Guédiguian","year":2007,"tmdb_id":78236,"imdb_id":"tt0996956","original_title":"Lady Jane","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4570','movie',4570,'{"id":4570,"title":"Elegy","director":"Isabel Coixet","year":2007,"tmdb_id":11671,"imdb_id":"tt0974554","original_title":"Elegy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4571','movie',4571,'{"id":4571,"title":"Lake Tahoe","director":"Fernando Eimbcke","year":2008,"tmdb_id":65726,"imdb_id":"tt1101675","original_title":"Lake Tahoe","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4572','movie',4572,'{"id":4572,"title":"Standard Operating Procedure","director":"Errol Morris","year":2008,"tmdb_id":8847,"imdb_id":"tt0896866","original_title":"Standard Operating Procedure","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4573','movie',4573,'{"id":4573,"title":"Black Ice","director":"Petri Kotwica","year":2007,"tmdb_id":25004,"imdb_id":"tt0890883","original_title":"Musta jää","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4574','movie',4574,'{"id":4574,"title":"Night and Day","director":"Hong Sang-soo","year":2008,"tmdb_id":57859,"imdb_id":"tt1176096","original_title":"밤과 낮","original_language":"ko","alternate_titles":["Bam gua Nat","Nacht und Tag"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4575','movie',4575,'{"id":4575,"title":"Everyone Else","director":"Maren Ade","year":2009,"tmdb_id":33809,"imdb_id":"tt1204773","original_title":"Alle Anderen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4576','movie',4576,'{"id":4576,"title":"Sparrow","director":"Johnnie To","year":2007,"tmdb_id":7346,"imdb_id":"tt0491044","original_title":"文雀","original_language":"cn","alternate_titles":["Man Jeuk"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4577','movie',4577,'{"id":4577,"title":"Chéri","director":"Stephen Frears","year":2009,"tmdb_id":22215,"imdb_id":"tt1179258","original_title":"Chéri","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4578','movie',4578,'{"id":4578,"title":"Elite Squad","director":"José Padilha","year":2007,"tmdb_id":7347,"imdb_id":"tt0861739","original_title":"Tropa de Elite","original_language":"pt","alternate_titles":["The Elite Squad"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4579','movie',4579,'{"id":4579,"title":"Giant","director":"Adrián Biniez","year":2008,"tmdb_id":39488,"imdb_id":"tt1360866","original_title":"Gigante","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4580','movie',4580,'{"id":4580,"title":"Happy Tears","director":"Mitchell Lichtenstein","year":2009,"tmdb_id":39072,"imdb_id":"tt1219828","original_title":"Happy Tears","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4581','movie',4581,'{"id":4581,"title":"In the Electric Mist","director":"Bertrand Tavernier","year":2008,"tmdb_id":13975,"imdb_id":"tt0910905","original_title":"In the Electric Mist","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4582','movie',4582,'{"id":4582,"title":"Katalin Varga","director":"Peter Strickland","year":2008,"tmdb_id":34208,"imdb_id":"tt1360875","original_title":"Katalin Varga","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4583','movie',4583,'{"id":4583,"title":"In Love We Trust","director":"Wang Xiaoshuai","year":2007,"tmdb_id":31205,"imdb_id":"tt1018102","original_title":"左右","original_language":"zh","alternate_titles":["Zuo You"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4584','movie',4584,'{"id":4584,"title":"London River","director":"Rachid Bouchareb","year":2009,"tmdb_id":39358,"imdb_id":"tt1227787","original_title":"London River","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4585','movie',4585,'{"id":4585,"title":"Mammoth","director":"Lukas Moodysson","year":2009,"tmdb_id":33974,"imdb_id":"tt1038043","original_title":"Mammoth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4586','movie',4586,'{"id":4586,"title":"Rage","director":"Sally Potter","year":2008,"tmdb_id":26738,"imdb_id":"tt1234550","original_title":"Rage","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4587','movie',4587,'{"id":4587,"title":"My One and Only","director":"Richard Loncraine","year":2008,"tmdb_id":26820,"imdb_id":"tt1185431","original_title":"My One and Only","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4588','movie',4588,'{"id":4588,"title":"Forever Enthralled","director":"Chen Kaige","year":2009,"tmdb_id":44837,"imdb_id":"tt0851532","original_title":"梅蘭芳","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4589','movie',4589,'{"id":4589,"title":"Ricky","director":"François Ozon","year":2009,"tmdb_id":22136,"imdb_id":"tt1189076","original_title":"Ricky","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4590','movie',4590,'{"id":4590,"title":"Honey","director":"Semih Kaplanoğlu","year":2010,"tmdb_id":44160,"imdb_id":"tt1571724","original_title":"Bal","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4591','movie',4591,'{"id":4591,"title":"Caterpillar","director":"Kōji Wakamatsu","year":2010,"tmdb_id":46106,"imdb_id":"tt1508290","original_title":"キャタピラー","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4592','movie',4592,'{"id":4592,"title":"About Elly","director":"Asghar Farhadi","year":2009,"tmdb_id":37181,"imdb_id":"tt1360860","original_title":"درباره الی‎‎","original_language":"fa","alternate_titles":["Darbareye Elly","Alles über Elly"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4593','movie',4593,'{"id":4593,"title":"The Robber","director":"Benjamin Heisenberg","year":2009,"tmdb_id":54524,"imdb_id":"tt1339161","original_title":"Der Räuber","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4594','movie',4594,'{"id":4594,"title":"A Family","director":"Pernille Fischer Christensen","year":2010,"tmdb_id":58483,"imdb_id":"tt1568815","original_title":"En familie","original_language":"da","alternate_titles":["Eine Familie"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4595','movie',4595,'{"id":4595,"title":"Sweet Rush","director":"Andrzej Wajda","year":2008,"tmdb_id":51010,"imdb_id":"tt1360887","original_title":"Tatarak","original_language":"pl","alternate_titles":["Der Kalmus"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4596','movie',4596,'{"id":4596,"title":"A Somewhat Gentle Man","director":"Hans Petter Moland","year":2009,"tmdb_id":31035,"imdb_id":"tt1386683","original_title":"En ganske snill mann","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4597','movie',4597,'{"id":4597,"title":"Little Soldier","director":"Annette K. Olesen","year":2008,"tmdb_id":16031,"imdb_id":"tt1158889","original_title":"Lille soldat","original_language":"da","alternate_titles":["Kleiner Soldat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4598','movie',4598,'{"id":4598,"title":"If I Want to Whistle, I Whistle","director":"Florin Şerban","year":2009,"tmdb_id":39840,"imdb_id":"tt1590024","original_title":"Eu când vreau să fluier, fluier","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4599','movie',4599,'{"id":4599,"title":"Howl","director":"Rob Epstein, Jeffrey Friedman","year":2009,"tmdb_id":38568,"imdb_id":"tt1049402","original_title":"Howl","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4600','movie',4600,'{"id":4600,"title":"On the Path","director":"Jasmila Žbanić","year":2010,"tmdb_id":50817,"imdb_id":"tt1156531","original_title":"Na putu","original_language":"bs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4601','movie',4601,'{"id":4601,"title":"The Puzzle","director":"Natalia Smirnoff","year":2010,"tmdb_id":41272,"imdb_id":"tt1517238","original_title":"Rompecabezas","original_language":"es","alternate_titles":["Puzzle"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4602','movie',4602,'{"id":4602,"title":"Greenberg","director":"Noah Baumbach","year":2009,"tmdb_id":27583,"imdb_id":"tt1234654","original_title":"Greenberg","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4603','movie',4603,'{"id":4603,"title":"A Woman, a Gun and a Noodle Shop","director":"Zhang Yimou","year":2009,"tmdb_id":44555,"imdb_id":"tt1428556","original_title":"三枪拍案惊奇","original_language":"zh","alternate_titles":["San qiang pai an jing qi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4604','movie',4604,'{"id":4604,"title":"Faith","director":"Burhan Qurbani","year":2010,"tmdb_id":55530,"imdb_id":"tt1584729","original_title":"Shahada","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4605','movie',4605,'{"id":4605,"title":"The Hunter","director":"Rafi Pitts","year":2010,"tmdb_id":52767,"imdb_id":"tt1190072","original_title":"شکارچی","original_language":"fa","alternate_titles":["Shekarchi","Zeit des Zorns"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4606','movie',4606,'{"id":4606,"title":"Submarino","director":"Thomas Vinterberg","year":2010,"tmdb_id":46789,"imdb_id":"tt1322385","original_title":"Submarino","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4607','movie',4607,'{"id":4607,"title":"Apart Together","director":"Wang Quan''an","year":2009,"tmdb_id":129955,"imdb_id":"tt1587878","original_title":"团圆","original_language":"zh","alternate_titles":["Tuan Yuan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4608','movie',4608,'{"id":4608,"title":"Jew Suss: Rise and Fall","director":"Oskar Roehler","year":2010,"tmdb_id":61623,"imdb_id":"tt1399655","original_title":"Jud Süß - Film ohne Gewissen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4609','movie',4609,'{"id":4609,"title":"The Killer Inside Me","director":"Michael Winterbottom","year":2009,"tmdb_id":37414,"imdb_id":"tt0954947","original_title":"The Killer Inside Me","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4610','movie',4610,'{"id":4610,"title":"Water","director":"Deepa Mehta","year":2005,"tmdb_id":7509,"imdb_id":"tt0240200","original_title":"Water","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4611','movie',4611,'{"id":4611,"title":"Nine","director":"Rob Marshall","year":2009,"tmdb_id":10197,"imdb_id":"tt0875034","original_title":"Nine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4612','movie',4612,'{"id":4612,"title":"Burma VJ: Reporting from a Closed Country","director":"Anders Østergaard","year":2008,"tmdb_id":26763,"imdb_id":"tt1333634","original_title":"Burma VJ: Reporter i et lukket land","original_language":"en","alternate_titles":["Burma VJ"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4613','movie',4613,'{"id":4613,"title":"The Most Dangerous Man in America","director":"Judith Ehrlich, Rick Goldsmith","year":2009,"tmdb_id":34576,"imdb_id":"tt1319726","original_title":"The Most Dangerous Man in America","original_language":"en","alternate_titles":["The Most Dangerous Man in America: Daniel Ellsberg and the Pentagon Papers"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4614','movie',4614,'{"id":4614,"title":"To Get to Heaven First, You Have to Die","director":"Jamshed Usmonov","year":2006,"tmdb_id":120393,"imdb_id":"tt0792988","original_title":"Bihisht faqat baroi murdagon","original_language":"tg","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4615','movie',4615,'{"id":4615,"title":"Chronicle of an Escape","director":"Adrián Caetano","year":2006,"tmdb_id":25532,"imdb_id":"tt0479354","original_title":"Crónica de una fuga","original_language":"es","alternate_titles":["BUENOS AIRES, 1977 (CRÓNICA DE UNA FUGA)","Buenos Aires,1977"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4616','movie',4616,'{"id":4616,"title":"Re-cycle","director":"Oxide Pang Chun, Danny Pang Phat","year":2006,"tmdb_id":13402,"imdb_id":"tt0498311","original_title":"鬼域","original_language":"cn","alternate_titles":["GWAÏ WIK"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4617','movie',4617,'{"id":4617,"title":"Ten Canoes","director":"Rolf de Heer, Peter Djigirr","year":2006,"tmdb_id":14064,"imdb_id":"tt0466399","original_title":"Ten Canoes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4618','movie',4618,'{"id":4618,"title":"2:37","director":"Murali K. Thalluri","year":2006,"tmdb_id":2168,"imdb_id":"tt0472582","original_title":"2:37","original_language":"en","alternate_titles":["TWO THIRTY 7"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4619','movie',4619,'{"id":4619,"title":"The Pope''s Toilet","director":"César Charlone, Enrique Fernández","year":2007,"tmdb_id":8267,"imdb_id":"tt0482901","original_title":"El baño del Papa","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4620','movie',4620,'{"id":4620,"title":"Terror''s Advocate","director":"Barbet Schroeder","year":2007,"tmdb_id":22521,"imdb_id":"tt1032854","original_title":"L''avocat de la terreur","original_language":"fr","alternate_titles":["THE TERROR’S ADVOCATE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4621','movie',4621,'{"id":4621,"title":"24 City","director":"Jia Zhangke","year":2008,"tmdb_id":29972,"imdb_id":"tt1103963","original_title":"二十四城记","original_language":"zh","alternate_titles":["ER SHI SI CHENG JI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4622','movie',4622,'{"id":4622,"title":"My Magic","director":"Eric Khoo","year":2008,"tmdb_id":8903,"imdb_id":"tt1233329","original_title":"My Magic","original_language":"ta","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4623','movie',4623,'{"id":4623,"title":"Serbis","director":"Brillante Ma Mendoza","year":2008,"tmdb_id":8904,"imdb_id":"tt1225296","original_title":"Serbis","original_language":"tl","alternate_titles":["Service"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4624','movie',4624,'{"id":4624,"title":"Tulpan","director":"Sergei Dvortsevoy","year":2008,"tmdb_id":8939,"imdb_id":"tt0436854","original_title":"Тюльпан","original_language":"kk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4625','movie',4625,'{"id":4625,"title":"Parking","director":"Chung Mong-hong","year":2008,"tmdb_id":8935,"imdb_id":"tt1232827","original_title":"停車","original_language":"zh","alternate_titles":["TING CHE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4626','movie',4626,'{"id":4626,"title":"Butchered","director":"Brillante Ma Mendoza","year":2009,"tmdb_id":64450,"imdb_id":"tt1423592","original_title":"Kinatay","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4627','movie',4627,'{"id":4627,"title":"Tsar","director":"Pavel Lungin","year":2009,"tmdb_id":41545,"imdb_id":"tt1424431","original_title":"Царь","original_language":"ru","alternate_titles":["TZAR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4628','movie',4628,'{"id":4628,"title":"October","director":"Daniel Vega Vidal, Diego Vega Vidal","year":2010,"tmdb_id":52322,"imdb_id":"tt1646118","original_title":"Octubre","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4629','movie',4629,'{"id":4629,"title":"Salvador (Puig Antich)","director":"Manuel Huerga","year":2006,"tmdb_id":1896,"imdb_id":"tt0445691","original_title":"Salvador (Puig Antich)","original_language":"ca","alternate_titles":["SALVADOR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4630','movie',4630,'{"id":4630,"title":"Alexandra","director":"Aleksandr Sokurov","year":2007,"tmdb_id":17479,"imdb_id":"tt1034427","original_title":"Александра","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4631','movie',4631,'{"id":4631,"title":"Euphoria","director":"Ivan Vyrypaev","year":2005,"tmdb_id":72891,"imdb_id":"tt0847877","original_title":"Эйфория","original_language":"ru","alternate_titles":["Eyforiya","Ejforija"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4632','movie',4632,'{"id":4632,"title":"Burnt by the Sun 2: Exodus","director":"Nikita Mikhalkov","year":2010,"tmdb_id":38318,"imdb_id":"tt0403645","original_title":"Утомлённые солнцем 2: Предстояние","original_language":"ru","alternate_titles":["UTOMLYONNYE SOLNTSEM 2: PREDSTOYANIE","THE EXODUS - BURNT BY THE SUN 2","Burnt by the Sun 2","Utomlennye solntsem 2: Predstoyanie"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4633','movie',4633,'{"id":4633,"title":"Syndromes and a Century","director":"Apichatpong Weerasethakul","year":2006,"tmdb_id":27904,"imdb_id":"tt0477731","original_title":"แสงศตวรรษ","original_language":"th","alternate_titles":["Sang sattawat"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4634','movie',4634,'{"id":4634,"title":"Falling","director":"Barbara Albert","year":2006,"tmdb_id":79072,"imdb_id":"tt0832347","original_title":"Fallen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4635','movie',4635,'{"id":4635,"title":"Bellissime 2","director":"Giovanna Gagliardo","year":2006,"tmdb_id":553126,"imdb_id":"tt1549828","original_title":"Bellissime 2","original_language":"it","alternate_titles":["Bellissime seconda parte. Dal 1960 ad oggi dalla parte di \"lei\"","Simply Beautiful - Part Two. Since 1960 till Today on HER Side"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4636','movie',4636,'{"id":4636,"title":"Courthouse on Horseback","director":"Liu Jie","year":2006,"tmdb_id":83267,"imdb_id":"tt1064775","original_title":"马背上的法庭","original_language":"zh","alternate_titles":["Mabei shang de fating","Courthouse on the Horseback","Ma bei shang de fa ting"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4637','movie',4637,'{"id":4637,"title":"Quijote","director":"Mimmo Paladino","year":2006,"tmdb_id":97476,"imdb_id":"tt1018924","original_title":"Quijote","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4638','movie',4638,'{"id":4638,"title":"Tachigui: The Amazing Lives of the Fast Food Grifters","director":"Mamoru Oshii","year":2006,"tmdb_id":39267,"imdb_id":"tt0480586","original_title":"立喰師列伝","original_language":"ja","alternate_titles":["Tachiguishi retsuden","Tachiguishi","Tachiguishi-Retsuden"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4639','movie',4639,'{"id":4639,"title":"When the Levees Broke: A Requiem in Four Acts","director":"Spike Lee","year":2006,"tmdb_id":null,"tmdb_tv_id":16468,"imdb_id":"tt0783612","identity_status":"reviewed_complete_film_tv_provider","identity_scope":"complete-film","identity_sources":["https://asac.labiennale.org/attivita/cinema/11292","https://www.moma.org/calendar/events/10759","https://www.imdb.com/title/tt0783612/releaseinfo/","https://jephmann.com/movies/tv.php?id=16468"],"original_title":"When the Levees Broke: A Requiem in Four Acts","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4640','movie',4640,'{"id":4640,"title":"Rain Dogs","director":"Ho Yuhang","year":2006,"tmdb_id":102347,"imdb_id":"tt0851579","original_title":"太陽雨","original_language":"cn","alternate_titles":["Tai yang yue","Taiyang yu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4641','movie',4641,'{"id":4641,"title":"Help Me, Eros","director":"Lee Kang-sheng","year":2007,"tmdb_id":54326,"imdb_id":"tt1076251","original_title":"帮帮我,爱神","original_language":"zh","alternate_titles":["Bangbang wo aishen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4642','movie',4642,'{"id":4642,"title":"Don''t Make Any Plans for Tonight","director":"Gianluca Maria Tavarelli","year":2005,"tmdb_id":106999,"imdb_id":"tt0874959","original_title":"Non prendere impegni stasera","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4643','movie',4643,'{"id":4643,"title":"California Dreamin''","director":"Cristian Nemescu","year":2007,"tmdb_id":24220,"imdb_id":"tt0449573","original_title":"Nesfârșit","original_language":"ro","alternate_titles":["CALIFORNIA DREAMIN’ (NESFARSIT)","CALIFORNIA DREAMIN'' (ENDLESS)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4644','movie',4644,'{"id":4644,"title":"I Am the One Who Brings Flowers to Her Grave","director":"Hala Alabdalla, Ammar al-Beik","year":2006,"tmdb_id":644365,"imdb_id":"tt0921777","original_title":"أنا التي تحمل الزهور إلى قبرها","original_language":"ar","alternate_titles":["Ana alati tahmol azouhour ila qabriha","I Am the One Who Brings Flowers to Her own Grave","I Am the One Who Carries Flowers to Her Grave"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4645','movie',4645,'{"id":4645,"title":"With a Girl of Black Soil","director":"Jeon Soo-il","year":2007,"tmdb_id":26859,"imdb_id":"tt1094635","original_title":"검은 땅의 소녀와","original_language":"ko","alternate_titles":["Geomen tangyi sonyeo oi","With the Girl of Black Soil"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4646','movie',4646,'{"id":4646,"title":"Death in the Land of Encantos","director":"Lav Diaz","year":2007,"tmdb_id":167710,"imdb_id":"tt1094643","original_title":"Kagadanan sa Banwaan Ning mga Engkanto","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4647','movie',4647,'{"id":4647,"title":"Umbrella","director":"Du Haibin","year":2007,"tmdb_id":291135,"imdb_id":"tt1094655","original_title":"伞","original_language":"zh","alternate_titles":["San"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4648','movie',4648,'{"id":4648,"title":"Achilles and the Tortoise","director":"Takeshi Kitano","year":2008,"tmdb_id":12166,"imdb_id":"tt1217243","original_title":"アキレスと亀","original_language":"ja","alternate_titles":["Akires to kame","Akiresu to kame"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4649','movie',4649,'{"id":4649,"title":"The Other One","director":"Patrick Mario Bernard, Pierre Trividic","year":2008,"tmdb_id":12425,"imdb_id":"tt1171704","original_title":"L''Autre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4650','movie',4650,'{"id":4650,"title":"The Secret of the Grain","director":"Abdellatif Kechiche","year":2007,"tmdb_id":8280,"imdb_id":"tt0487419","original_title":"La Graine et le Mulet","original_language":"fr","alternate_titles":["Grain and Mullet","Couscous"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4651','movie',4651,'{"id":4651,"title":"Sex My Life","director":"Bahman Motamedian","year":2008,"tmdb_id":461640,"imdb_id":"tt1284579","original_title":"Khastegi","original_language":"fa","alternate_titles":["Khastegi (Tedium)","Tedium"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4652','movie',4652,'{"id":4652,"title":"Grandmother","director":"Brillante Ma Mendoza","year":2009,"tmdb_id":72985,"imdb_id":"tt1496792","original_title":"Lola","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4653','movie',4653,'{"id":4653,"title":"Accident","director":"Soi Cheang","year":2009,"tmdb_id":25474,"imdb_id":"tt1202514","original_title":"意外","original_language":"cn","alternate_titles":["Yi ngoi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4654','movie',4654,'{"id":4654,"title":"Women Without Men","director":"Shoja Azari, Shirin Neshat","year":2009,"tmdb_id":44159,"imdb_id":"tt1498887","original_title":"زنان بدون مردان","original_language":"fa","alternate_titles":["Zanan-e-bedun-e mardan","Zanan bedoone mardan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4655','movie',4655,'{"id":4655,"title":"Cow","director":"Guan Hu","year":2009,"tmdb_id":44714,"imdb_id":"tt1500703","original_title":"斗牛","original_language":"zh","alternate_titles":["Dou Niu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4656','movie',4656,'{"id":4656,"title":"Because We Were Born","director":"Jean-Pierre Duret, Andrea Santana","year":2008,"tmdb_id":79766,"imdb_id":"tt1270680","original_title":"Puisque nous sommes nés","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4657','movie',4657,'{"id":4657,"title":"Totò","director":"Peter Schreiner","year":2009,"tmdb_id":373574,"imdb_id":"tt1499697","original_title":"Totò","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4658','movie',4658,'{"id":4658,"title":"Chaos, This Is?","director":"Youssef Chahine, Khaled Youssef","year":2007,"tmdb_id":163660,"imdb_id":"tt1085799","original_title":"هي فوضى..؟","original_language":"ar","alternate_titles":["Heya fawda","Chaos"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4659','movie',4659,'{"id":4659,"title":"Villalobos","director":"Romuald Karmakar","year":null,"tmdb_id":29956,"imdb_id":"tt1500762","original_title":"Villalobos","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4660','movie',4660,'{"id":4660,"title":"Once Upon a Time Proletarian","director":"Xiaolu Guo","year":2009,"tmdb_id":462891,"imdb_id":"tt1485046","original_title":"曾经的无产者","original_language":"zh","alternate_titles":["Women ceng jing de wuchanzhe","Women Cengjing de Wuchanzhe","Once upon a time proletarian : 12 tales of a Country","Once Upon a Time Proletarian: 12 Tales of a Country"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4661','movie',4661,'{"id":4661,"title":"The Ditch","director":"Wang Bing","year":2010,"tmdb_id":91067,"imdb_id":"tt1723112","original_title":"夹边沟","original_language":"zh","alternate_titles":["Le Fossé"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4662','movie',4662,'{"id":4662,"title":"The Sun Also Rises","director":"Jiang Wen","year":2007,"tmdb_id":51885,"imdb_id":"tt0769507","original_title":"太阳照常升起","original_language":"zh","alternate_titles":["Tai yang zhao chang sheng qi","Taiyang zhao hang shengqi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4663','movie',4663,'{"id":4663,"title":"Dharma Guns","director":"F.J. Ossang","year":2010,"tmdb_id":103443,"imdb_id":"tt1847577","original_title":"Dharma Guns (La Succession Starkov)","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4664','movie',4664,'{"id":4664,"title":"Bets & Wedding Dresses","director":"Vincenzo Terracciano","year":2009,"tmdb_id":41181,"imdb_id":"tt1295083","original_title":"Tris di donne e abiti nuziali","original_language":"it","alternate_titles":["Tris di donne & abiti nuziali"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4665','movie',4665,'{"id":4665,"title":"We Were Communists","director":"Maher Abi Samra","year":2010,"tmdb_id":584944,"imdb_id":"tt1847690","original_title":"شيوعيين كنّا","original_language":"ar","alternate_titles":["Sheoeyin kenna","We Were Communist","When We Were Communists","Nous étions communistes"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4666','movie',4666,'{"id":4666,"title":"Isabella","director":"Edmond Pang Ho-cheung","year":2006,"tmdb_id":40977,"imdb_id":"tt0499141","original_title":"伊莎貝拉","original_language":"cn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4667','movie',4667,'{"id":4667,"title":"Judge","director":"Liu Jie","year":2009,"tmdb_id":57322,"imdb_id":"tt1499698","original_title":"透析","original_language":"zh","alternate_titles":["Touxi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4668','movie',4668,'{"id":4668,"title":"Restless","director":"Amos Kollek","year":2007,"tmdb_id":16705,"imdb_id":"tt1075644","original_title":"חסר מנוחה","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4669','movie',4669,'{"id":4669,"title":"Storm","director":"Hans-Christian Schmid","year":2009,"tmdb_id":35619,"imdb_id":"tt0768239","original_title":"Storm","original_language":"en","alternate_titles":["Sturm"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4670','movie',4670,'{"id":4670,"title":"How I Ended This Summer","director":"Alexey Popogrebsky","year":2010,"tmdb_id":38325,"imdb_id":"tt1588875","original_title":"Как я провёл этим летом","original_language":"ru","alternate_titles":["Kak ya provel etim letom"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4671','movie',4671,'{"id":4671,"title":"Zelal","director":"Mustapha Hasnaoui, Marianne Khoury","year":2010,"tmdb_id":300576,"imdb_id":"tt2754544","original_title":"ظلال","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4672','movie',4672,'{"id":4672,"title":"Angel","director":"François Ozon","year":2007,"tmdb_id":11801,"imdb_id":"tt0783767","original_title":"Angel","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4673','movie',4673,'{"id":4673,"title":"News from Nowhere","director":"Paul Morrissey","year":2010,"tmdb_id":340365,"imdb_id":"tt2354274","original_title":"News from Nowhere","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4674','movie',4674,'{"id":4674,"title":"Crush","director":"Kirill Serebrennikov, Pyotr Buslov, Boris Khlebnikov, Ivan Vyrypaev, Aleksei German Jr.","year":2009,"tmdb_id":70137,"imdb_id":"tt1437224","original_title":"Короткое замыкание","original_language":"ru","alternate_titles":["Korotkoye zamykanie","Korotkoe zamykanie","Short Circuit"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4675','movie',4675,'{"id":4675,"title":"Mammuth","director":"Gustave Kervern, Benoît Delépine","year":2010,"tmdb_id":37832,"imdb_id":"tt1473074","original_title":"Mammuth","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4676','movie',4676,'{"id":4676,"title":"Heimat Fragments: The Women","director":"Edgar Reitz","year":2006,"tmdb_id":299541,"imdb_id":"tt0810894","original_title":"Heimat-Fragmente: Die Frauen","original_language":"de","alternate_titles":["Heimat - Fragmente","Heimat - Fragments"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4677','movie',4677,'{"id":4677,"title":"In Paraguay","director":"Ross McElwee","year":2008,"tmdb_id":396142,"imdb_id":"tt1270651","original_title":"In Paraguay","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4678','movie',4678,'{"id":4678,"title":"Anabazys: O Terceiro Testamento de Glauber Rocha","director":"Joel Pizzini, Paloma Rocha","year":2007,"tmdb_id":329234,"imdb_id":"tt1094235","original_title":"Anabazys: O Terceiro Testamento de Glauber Rocha","original_language":"pt","alternate_titles":["Anabazys","Ascension"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4679','movie',4679,'{"id":4679,"title":"Il colore delle parole","director":"Marco S. Puccioni","year":2009,"tmdb_id":580589,"imdb_id":"tt1499662","original_title":"Il colore delle parole","original_language":"it","alternate_titles":["The Color of Words"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4680','movie',4680,'{"id":4680,"title":"Mothers","director":"Barbara Cupisti","year":2007,"tmdb_id":502297,"imdb_id":"tt1094648","original_title":"Madri","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4681','movie',4681,'{"id":4681,"title":"Per Questi Stretti Morire","director":"Giuseppe M. Gaudino, Isabella Sandri","year":2010,"tmdb_id":358252,"imdb_id":"tt1714884","original_title":"Per Questi Stretti Morire","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4682','movie',4682,'{"id":4682,"title":"Reconstructing Faith","director":"Wenhai Huang","year":2010,"tmdb_id":634323,"imdb_id":null,"identity_status":"reviewed_tmdb_without_imdb","identity_sources":["https://asac.labiennale.org/attivita/cinema/216599","https://chinaindiefilm.com/films/reconstructing-faith/","https://letterboxd.com/film/reconstructing-faith/","https://www.themoviedb.org/movie/634323/"],"original_title":"西方去此不遠","original_language":"zh","alternate_titles":["Xifang qu ci bu yuan","西方去此不远"]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:398','movie:4045') on conflict do nothing;
insert into public.media_provider_links values('movie:612','movie:4046') on conflict do nothing;
insert into public.media_provider_links values('movie:3291','movie:4047') on conflict do nothing;
insert into public.media_provider_links values('movie:1640','movie:4048') on conflict do nothing;
insert into public.media_provider_links values('movie:69','movie:4049') on conflict do nothing;
insert into public.media_provider_links values('movie:10476','movie:4050') on conflict do nothing;
insert into public.media_provider_links values('movie:546','movie:4051') on conflict do nothing;
insert into public.media_provider_links values('movie:4348','movie:4052') on conflict do nothing;
insert into public.media_provider_links values('movie:231','movie:4053') on conflict do nothing;
insert into public.media_provider_links values('movie:59','movie:4054') on conflict do nothing;
insert into public.media_provider_links values('movie:10773','movie:4055') on conflict do nothing;
insert into public.media_provider_links values('movie:1444','movie:4056') on conflict do nothing;
insert into public.media_provider_links values('movie:10707','movie:4057') on conflict do nothing;
insert into public.media_provider_links values('movie:868','movie:4058') on conflict do nothing;
insert into public.media_provider_links values('movie:1985','movie:4059') on conflict do nothing;
insert into public.media_provider_links values('movie:921','movie:4060') on conflict do nothing;
insert into public.media_provider_links values('movie:1084642','movie:4061') on conflict do nothing;
insert into public.media_provider_links values('movie:67','movie:4062') on conflict do nothing;
insert into public.media_provider_links values('movie:11661','movie:4063') on conflict do nothing;
insert into public.media_provider_links values('movie:1667','movie:4064') on conflict do nothing;
insert into public.media_provider_links values('movie:9701','movie:4065') on conflict do nothing;
insert into public.media_provider_links values('movie:415253','movie:4066') on conflict do nothing;
insert into public.media_provider_links values('movie:2117','movie:4067') on conflict do nothing;
insert into public.media_provider_links values('movie:29044','movie:4068') on conflict do nothing;
insert into public.media_provider_links values('movie:3933','movie:4069') on conflict do nothing;
insert into public.media_provider_links values('movie:13020','movie:4070') on conflict do nothing;
insert into public.media_provider_links values('movie:14278','movie:4071') on conflict do nothing;
insert into public.media_provider_links values('movie:773','movie:4072') on conflict do nothing;
insert into public.media_provider_links values('movie:1165','movie:4073') on conflict do nothing;
insert into public.media_provider_links values('movie:7859','movie:4074') on conflict do nothing;
insert into public.media_provider_links values('movie:9829','movie:4075') on conflict do nothing;
insert into public.media_provider_links values('movie:219','movie:4076') on conflict do nothing;
insert into public.media_provider_links values('movie:1523','movie:4077') on conflict do nothing;
insert into public.media_provider_links values('movie:1259','movie:4078') on conflict do nothing;
insert into public.media_provider_links values('movie:1440','movie:4079') on conflict do nothing;
insert into public.media_provider_links values('movie:1125','movie:4080') on conflict do nothing;
insert into public.media_provider_links values('movie:1372','movie:4081') on conflict do nothing;
insert into public.media_provider_links values('movie:496','movie:4082') on conflict do nothing;
insert into public.media_provider_links values('movie:9693','movie:4083') on conflict do nothing;
insert into public.media_provider_links values('movie:1417','movie:4084') on conflict do nothing;
insert into public.media_provider_links values('movie:582','movie:4085') on conflict do nothing;
insert into public.media_provider_links values('movie:13771','movie:4086') on conflict do nothing;
insert into public.media_provider_links values('movie:1781','movie:4087') on conflict do nothing;
insert into public.media_provider_links values('movie:13364','movie:4088') on conflict do nothing;
insert into public.media_provider_links values('movie:3549','movie:4089') on conflict do nothing;
insert into public.media_provider_links values('movie:34389','movie:4090') on conflict do nothing;
insert into public.media_provider_links values('movie:50100','movie:4091') on conflict do nothing;
insert into public.media_provider_links values('movie:533','movie:4092') on conflict do nothing;
insert into public.media_provider_links values('movie:1776','movie:4093') on conflict do nothing;
insert into public.media_provider_links values('movie:9297','movie:4094') on conflict do nothing;
insert into public.media_provider_links values('movie:4566','movie:4095') on conflict do nothing;
insert into public.media_provider_links values('movie:2013','movie:4096') on conflict do nothing;
insert into public.media_provider_links values('movie:4347','movie:4097') on conflict do nothing;
insert into public.media_provider_links values('movie:13885','movie:4098') on conflict do nothing;
insert into public.media_provider_links values('movie:6973','movie:4099') on conflict do nothing;
insert into public.media_provider_links values('movie:2252','movie:4100') on conflict do nothing;
insert into public.media_provider_links values('movie:1919','movie:4101') on conflict do nothing;
insert into public.media_provider_links values('movie:8272','movie:4102') on conflict do nothing;
insert into public.media_provider_links values('movie:5915','movie:4103') on conflict do nothing;
insert into public.media_provider_links values('movie:3902','movie:4104') on conflict do nothing;
insert into public.media_provider_links values('movie:4517','movie:4105') on conflict do nothing;
insert into public.media_provider_links values('movie:6615','movie:4106') on conflict do nothing;
insert into public.media_provider_links values('movie:4771','movie:4107') on conflict do nothing;
insert into public.media_provider_links values('movie:4512','movie:4108') on conflict do nothing;
insert into public.media_provider_links values('movie:7862','movie:4109') on conflict do nothing;
insert into public.media_provider_links values('movie:15048','movie:4110') on conflict do nothing;
insert into public.media_provider_links values('movie:13362','movie:4111') on conflict do nothing;
insert into public.media_provider_links values('movie:6538','movie:4112') on conflict do nothing;
insert into public.media_provider_links values('movie:13614','movie:4113') on conflict do nothing;
insert into public.media_provider_links values('movie:16666','movie:4114') on conflict do nothing;
insert into public.media_provider_links values('movie:12246','movie:4115') on conflict do nothing;
insert into public.media_provider_links values('movie:9408','movie:4116') on conflict do nothing;
insert into public.media_provider_links values('movie:34981','movie:4117') on conflict do nothing;
insert into public.media_provider_links values('movie:4922','movie:4118') on conflict do nothing;
insert into public.media_provider_links values('movie:11499','movie:4119') on conflict do nothing;
insert into public.media_provider_links values('movie:8055','movie:4120') on conflict do nothing;
insert into public.media_provider_links values('movie:12473','movie:4121') on conflict do nothing;
insert into public.media_provider_links values('movie:2359','movie:4122') on conflict do nothing;
insert into public.media_provider_links values('movie:12901','movie:4123') on conflict do nothing;
insert into public.media_provider_links values('movie:10183','movie:4124') on conflict do nothing;
insert into public.media_provider_links values('movie:10139','movie:4125') on conflict do nothing;
insert into public.media_provider_links values('movie:14976','movie:4126') on conflict do nothing;
insert into public.media_provider_links values('movie:14359','movie:4127') on conflict do nothing;
insert into public.media_provider_links values('movie:7446','movie:4128') on conflict do nothing;
insert into public.media_provider_links values('movie:10503','movie:4129') on conflict do nothing;
insert into public.media_provider_links values('movie:6968','movie:4130') on conflict do nothing;
insert into public.media_provider_links values('movie:16804','movie:4131') on conflict do nothing;
insert into public.media_provider_links values('movie:3580','movie:4132') on conflict do nothing;
insert into public.media_provider_links values('movie:14048','movie:4133') on conflict do nothing;
insert into public.media_provider_links values('movie:40215','movie:4134') on conflict do nothing;
insert into public.media_provider_links values('movie:8885','movie:4135') on conflict do nothing;
insert into public.media_provider_links values('movie:12172','movie:4136') on conflict do nothing;
insert into public.media_provider_links values('movie:15451','movie:4137') on conflict do nothing;
insert into public.media_provider_links values('movie:41331','movie:4138') on conflict do nothing;
insert into public.media_provider_links values('movie:13053','movie:4139') on conflict do nothing;
insert into public.media_provider_links values('movie:22319','movie:4140') on conflict do nothing;
insert into public.media_provider_links values('movie:9502','movie:4141') on conflict do nothing;
insert into public.media_provider_links values('movie:12162','movie:4142') on conflict do nothing;
insert into public.media_provider_links values('movie:17654','movie:4143') on conflict do nothing;
insert into public.media_provider_links values('movie:25793','movie:4144') on conflict do nothing;
insert into public.media_provider_links values('movie:25196','movie:4145') on conflict do nothing;
insert into public.media_provider_links values('movie:34653','movie:4146') on conflict do nothing;
insert into public.media_provider_links values('movie:24684','movie:4147') on conflict do nothing;
insert into public.media_provider_links values('movie:7980','movie:4148') on conflict do nothing;
insert into public.media_provider_links values('movie:36811','movie:4149') on conflict do nothing;
insert into public.media_provider_links values('movie:28089','movie:4150') on conflict do nothing;
insert into public.media_provider_links values('movie:22954','movie:4151') on conflict do nothing;
insert into public.media_provider_links values('movie:24424','movie:4152') on conflict do nothing;
insert into public.media_provider_links values('movie:28644','movie:4153') on conflict do nothing;
insert into public.media_provider_links values('movie:21575','movie:4154') on conflict do nothing;
insert into public.media_provider_links values('movie:23128','movie:4155') on conflict do nothing;
insert into public.media_provider_links values('movie:18570','movie:4156') on conflict do nothing;
insert into public.media_provider_links values('movie:14836','movie:4157') on conflict do nothing;
insert into public.media_provider_links values('movie:55204','movie:4158') on conflict do nothing;
insert into public.media_provider_links values('movie:8435','movie:4159') on conflict do nothing;
insert into public.media_provider_links values('movie:77517','movie:4160') on conflict do nothing;
insert into public.media_provider_links values('movie:1904','movie:4161') on conflict do nothing;
insert into public.media_provider_links values('movie:1553','movie:4162') on conflict do nothing;
insert into public.media_provider_links values('movie:19833','movie:4163') on conflict do nothing;
insert into public.media_provider_links values('movie:205','movie:4164') on conflict do nothing;
insert into public.media_provider_links values('movie:26963','movie:4165') on conflict do nothing;
insert into public.media_provider_links values('movie:9470','movie:4166') on conflict do nothing;
insert into public.media_provider_links values('movie:8618','movie:4167') on conflict do nothing;
insert into public.media_provider_links values('movie:1579','movie:4168') on conflict do nothing;
insert into public.media_provider_links values('movie:44003','movie:4169') on conflict do nothing;
insert into public.media_provider_links values('movie:11798','movie:4170') on conflict do nothing;
insert into public.media_provider_links values('movie:7979','movie:4171') on conflict do nothing;
insert into public.media_provider_links values('movie:4588','movie:4172') on conflict do nothing;
insert into public.media_provider_links values('movie:810','movie:4173') on conflict do nothing;
insert into public.media_provider_links values('movie:5708','movie:4174') on conflict do nothing;
insert into public.media_provider_links values('movie:8882','movie:4175') on conflict do nothing;
insert into public.media_provider_links values('movie:11631','movie:4176') on conflict do nothing;
insert into public.media_provider_links values('movie:24469','movie:4177') on conflict do nothing;
insert into public.media_provider_links values('movie:33511','movie:4178') on conflict do nothing;
insert into public.media_provider_links values('movie:17431','movie:4179') on conflict do nothing;
insert into public.media_provider_links values('movie:37234','movie:4180') on conflict do nothing;
insert into public.media_provider_links values('movie:22897','movie:4181') on conflict do nothing;
insert into public.media_provider_links values('movie:11156','movie:4182') on conflict do nothing;
insert into public.media_provider_links values('movie:13310','movie:4183') on conflict do nothing;
insert into public.media_provider_links values('movie:8088','movie:4184') on conflict do nothing;
insert into public.media_provider_links values('movie:12404','movie:4185') on conflict do nothing;
insert into public.media_provider_links values('movie:8276','movie:4186') on conflict do nothing;
insert into public.media_provider_links values('movie:9899','movie:4187') on conflict do nothing;
insert into public.media_provider_links values('movie:9777','movie:4188') on conflict do nothing;
insert into public.media_provider_links values('movie:9515','movie:4189') on conflict do nothing;
insert into public.media_provider_links values('movie:11931','movie:4190') on conflict do nothing;
insert into public.media_provider_links values('movie:9043','movie:4191') on conflict do nothing;
insert into public.media_provider_links values('movie:2008','movie:4192') on conflict do nothing;
insert into public.media_provider_links values('movie:254','movie:4193') on conflict do nothing;
insert into public.media_provider_links values('movie:10741','movie:4194') on conflict do nothing;
insert into public.media_provider_links values('movie:13075','movie:4195') on conflict do nothing;
insert into public.media_provider_links values('movie:13967','movie:4196') on conflict do nothing;
insert into public.media_provider_links values('movie:7510','movie:4197') on conflict do nothing;
insert into public.media_provider_links values('movie:1249','movie:4198') on conflict do nothing;
insert into public.media_provider_links values('movie:1262','movie:4199') on conflict do nothing;
insert into public.media_provider_links values('movie:14047','movie:4200') on conflict do nothing;
insert into public.media_provider_links values('movie:16367','movie:4201') on conflict do nothing;
insert into public.media_provider_links values('movie:4688','movie:4202') on conflict do nothing;
insert into public.media_provider_links values('movie:2976','movie:4203') on conflict do nothing;
insert into public.media_provider_links values('movie:1420','movie:4204') on conflict do nothing;
insert into public.media_provider_links values('movie:1988','movie:4205') on conflict do nothing;
insert into public.media_provider_links values('movie:6575','movie:4206') on conflict do nothing;
insert into public.media_provider_links values('movie:5559','movie:4207') on conflict do nothing;
insert into public.media_provider_links values('movie:17077','movie:4208') on conflict do nothing;
insert into public.media_provider_links values('movie:16409','movie:4209') on conflict do nothing;
insert into public.media_provider_links values('movie:10189','movie:4210') on conflict do nothing;
insert into public.media_provider_links values('movie:12783','movie:4211') on conflict do nothing;
insert into public.media_provider_links values('movie:4413','movie:4212') on conflict do nothing;
insert into public.media_provider_links values('movie:19913','movie:4213') on conflict do nothing;
insert into public.media_provider_links values('movie:18320','movie:4214') on conflict do nothing;
insert into public.media_provider_links values('movie:27567','movie:4215') on conflict do nothing;
insert into public.media_provider_links values('movie:7445','movie:4216') on conflict do nothing;
insert into public.media_provider_links values('movie:16558','movie:4217') on conflict do nothing;
insert into public.media_provider_links values('movie:11323','movie:4218') on conflict do nothing;
insert into public.media_provider_links values('movie:25846','movie:4219') on conflict do nothing;
insert into public.media_provider_links values('movie:31289','movie:4220') on conflict do nothing;
insert into public.media_provider_links values('movie:2016','movie:4221') on conflict do nothing;
insert into public.media_provider_links values('movie:82404','movie:4222') on conflict do nothing;
insert into public.media_provider_links values('movie:53486','movie:4223') on conflict do nothing;
insert into public.media_provider_links values('movie:8324','movie:4224') on conflict do nothing;
insert into public.media_provider_links values('movie:71732','movie:4225') on conflict do nothing;
insert into public.media_provider_links values('movie:36143','movie:4226') on conflict do nothing;
insert into public.media_provider_links values('movie:1379','movie:4227') on conflict do nothing;
insert into public.media_provider_links values('movie:11705','movie:4228') on conflict do nothing;
insert into public.media_provider_links values('movie:4723','movie:4229') on conflict do nothing;
insert into public.media_provider_links values('movie:68944','movie:4230') on conflict do nothing;
insert into public.media_provider_links values('movie:17422','movie:4231') on conflict do nothing;
insert into public.media_provider_links values('movie:1887','movie:4232') on conflict do nothing;
insert into public.media_provider_links values('movie:3509','movie:4233') on conflict do nothing;
insert into public.media_provider_links values('movie:58296','movie:4234') on conflict do nothing;
insert into public.media_provider_links values('movie:68259','movie:4235') on conflict do nothing;
insert into public.media_provider_links values('movie:96010','movie:4236') on conflict do nothing;
insert into public.media_provider_links values('movie:129933','movie:4237') on conflict do nothing;
insert into public.media_provider_links values('movie:79034','movie:4238') on conflict do nothing;
insert into public.media_provider_links values('movie:8436','movie:4239') on conflict do nothing;
insert into public.media_provider_links values('movie:24185','movie:4240') on conflict do nothing;
insert into public.media_provider_links values('movie:31325','movie:4241') on conflict do nothing;
insert into public.media_provider_links values('movie:99739','movie:4242') on conflict do nothing;
insert into public.media_provider_links values('movie:126529','movie:4243') on conflict do nothing;
insert into public.media_provider_links values('movie:15742','movie:4244') on conflict do nothing;
insert into public.media_provider_links values('movie:182633','movie:4245') on conflict do nothing;
insert into public.media_provider_links values('movie:51244','movie:4246') on conflict do nothing;
insert into public.media_provider_links values('movie:37766','movie:4247') on conflict do nothing;
insert into public.media_provider_links values('movie:12681','movie:4248') on conflict do nothing;
insert into public.media_provider_links values('movie:48119','movie:4249') on conflict do nothing;
insert into public.media_provider_links values('movie:13943','movie:4250') on conflict do nothing;
insert into public.media_provider_links values('movie:352749','movie:4251') on conflict do nothing;
insert into public.media_provider_links values('movie:25142','movie:4252') on conflict do nothing;
insert into public.media_provider_links values('movie:2014','movie:4253') on conflict do nothing;
insert into public.media_provider_links values('movie:14448','movie:4254') on conflict do nothing;
insert into public.media_provider_links values('movie:1989','movie:4255') on conflict do nothing;
insert into public.media_provider_links values('movie:2010','movie:4256') on conflict do nothing;
insert into public.media_provider_links values('movie:1990','movie:4257') on conflict do nothing;
insert into public.media_provider_links values('movie:8269','movie:4258') on conflict do nothing;
insert into public.media_provider_links values('movie:2015','movie:4259') on conflict do nothing;
insert into public.media_provider_links values('movie:31262','movie:4260') on conflict do nothing;
insert into public.media_provider_links values('movie:4998','movie:4261') on conflict do nothing;
insert into public.media_provider_links values('movie:2001','movie:4262') on conflict do nothing;
insert into public.media_provider_links values('movie:126682','movie:4263') on conflict do nothing;
insert into public.media_provider_links values('movie:2002','movie:4264') on conflict do nothing;
insert into public.media_provider_links values('movie:2012','movie:4265') on conflict do nothing;
insert into public.media_provider_links values('movie:3397','movie:4266') on conflict do nothing;
insert into public.media_provider_links values('movie:6360','movie:4267') on conflict do nothing;
insert into public.media_provider_links values('movie:25647','movie:4268') on conflict do nothing;
insert into public.media_provider_links values('movie:19098','movie:4269') on conflict do nothing;
insert into public.media_provider_links values('movie:46914','movie:4270') on conflict do nothing;
insert into public.media_provider_links values('movie:49765','movie:4271') on conflict do nothing;
insert into public.media_provider_links values('movie:46930','movie:4272') on conflict do nothing;
insert into public.media_provider_links values('movie:5259','movie:4273') on conflict do nothing;
insert into public.media_provider_links values('movie:51520','movie:4274') on conflict do nothing;
insert into public.media_provider_links values('movie:9789','movie:4275') on conflict do nothing;
insert into public.media_provider_links values('movie:5817','movie:4276') on conflict do nothing;
insert into public.media_provider_links values('movie:57654','movie:4277') on conflict do nothing;
insert into public.media_provider_links values('movie:12198','movie:4278') on conflict do nothing;
insert into public.media_provider_links values('movie:39489','movie:4279') on conflict do nothing;
insert into public.media_provider_links values('movie:10818','movie:4280') on conflict do nothing;
insert into public.media_provider_links values('movie:126679','movie:4281') on conflict do nothing;
insert into public.media_provider_links values('movie:16135','movie:4283') on conflict do nothing;
insert into public.media_provider_links values('movie:8895','movie:4284') on conflict do nothing;
insert into public.media_provider_links values('movie:8896','movie:4285') on conflict do nothing;
insert into public.media_provider_links values('movie:17342','movie:4286') on conflict do nothing;
insert into public.media_provider_links values('movie:8832','movie:4287') on conflict do nothing;
insert into public.media_provider_links values('movie:8338','movie:4288') on conflict do nothing;
insert into public.media_provider_links values('movie:8841','movie:4289') on conflict do nothing;
insert into public.media_provider_links values('movie:8897','movie:4290') on conflict do nothing;
insert into public.media_provider_links values('movie:8898','movie:4291') on conflict do nothing;
insert into public.media_provider_links values('movie:8899','movie:4292') on conflict do nothing;
insert into public.media_provider_links values('movie:8900','movie:4293') on conflict do nothing;
insert into public.media_provider_links values('movie:8902','movie:4294') on conflict do nothing;
insert into public.media_provider_links values('movie:4960','movie:4295') on conflict do nothing;
insert into public.media_provider_links values('movie:8886','movie:4296') on conflict do nothing;
insert into public.media_provider_links values('movie:8892','movie:4297') on conflict do nothing;
insert into public.media_provider_links values('movie:8925','movie:4298') on conflict do nothing;
insert into public.media_provider_links values('movie:8926','movie:4299') on conflict do nothing;
insert into public.media_provider_links values('movie:10360','movie:4300') on conflict do nothing;
insert into public.media_provider_links values('movie:8927','movie:4301') on conflict do nothing;
insert into public.media_provider_links values('movie:8931','movie:4302') on conflict do nothing;
insert into public.media_provider_links values('movie:8929','movie:4303') on conflict do nothing;
insert into public.media_provider_links values('movie:8932','movie:4304') on conflict do nothing;
insert into public.media_provider_links values('movie:8928','movie:4305') on conflict do nothing;
insert into public.media_provider_links values('movie:8933','movie:4306') on conflict do nothing;
insert into public.media_provider_links values('movie:8943','movie:4307') on conflict do nothing;
insert into public.media_provider_links values('movie:8934','movie:4308') on conflict do nothing;
insert into public.media_provider_links values('movie:8937','movie:4309') on conflict do nothing;
insert into public.media_provider_links values('movie:8938','movie:4310') on conflict do nothing;
insert into public.media_provider_links values('movie:8930','movie:4311') on conflict do nothing;
insert into public.media_provider_links values('movie:8941','movie:4312') on conflict do nothing;
insert into public.media_provider_links values('movie:8942','movie:4313') on conflict do nothing;
insert into public.media_provider_links values('movie:29963','movie:4314') on conflict do nothing;
insert into public.media_provider_links values('movie:22536','movie:4315') on conflict do nothing;
insert into public.media_provider_links values('movie:117646','movie:4316') on conflict do nothing;
insert into public.media_provider_links values('movie:34647','movie:4317') on conflict do nothing;
insert into public.media_provider_links values('movie:8940','movie:4318') on conflict do nothing;
insert into public.media_provider_links values('movie:18898','movie:4319') on conflict do nothing;
insert into public.media_provider_links values('movie:26320','movie:4320') on conflict do nothing;
insert into public.media_provider_links values('movie:44898','movie:4321') on conflict do nothing;
insert into public.media_provider_links values('movie:8906','movie:4322') on conflict do nothing;
insert into public.media_provider_links values('movie:18899','movie:4323') on conflict do nothing;
insert into public.media_provider_links values('movie:30239','movie:4324') on conflict do nothing;
insert into public.media_provider_links values('movie:53520','movie:4325') on conflict do nothing;
insert into public.media_provider_links values('movie:37842','movie:4326') on conflict do nothing;
insert into public.media_provider_links values('movie:46458','movie:4327') on conflict do nothing;
insert into public.media_provider_links values('movie:125344','movie:4328') on conflict do nothing;
insert into public.media_provider_links values('movie:35164','movie:4329') on conflict do nothing;
insert into public.media_provider_links values('movie:51413','movie:4330') on conflict do nothing;
insert into public.media_provider_links values('movie:37810','movie:4331') on conflict do nothing;
insert into public.media_provider_links values('movie:163899','movie:4332') on conflict do nothing;
insert into public.media_provider_links values('movie:39378','movie:4333') on conflict do nothing;
insert into public.media_provider_links values('movie:43614','movie:4334') on conflict do nothing;
insert into public.media_provider_links values('movie:25053','movie:4335') on conflict do nothing;
insert into public.media_provider_links values('movie:30018','movie:4336') on conflict do nothing;
insert into public.media_provider_links values('movie:95538','movie:4337') on conflict do nothing;
insert into public.media_provider_links values('movie:33913','movie:4338') on conflict do nothing;
insert into public.media_provider_links values('movie:32511','movie:4339') on conflict do nothing;
insert into public.media_provider_links values('movie:47075','movie:4340') on conflict do nothing;
insert into public.media_provider_links values('movie:50086','movie:4341') on conflict do nothing;
insert into public.media_provider_links values('movie:17772','movie:4342') on conflict do nothing;
insert into public.media_provider_links values('movie:48303','movie:4343') on conflict do nothing;
insert into public.media_provider_links values('movie:38363','movie:4344') on conflict do nothing;
insert into public.media_provider_links values('movie:172878','movie:4345') on conflict do nothing;
insert into public.media_provider_links values('movie:38368','movie:4346') on conflict do nothing;
insert into public.media_provider_links values('movie:45284','movie:4347') on conflict do nothing;
insert into public.media_provider_links values('movie:47909','movie:4348') on conflict do nothing;
insert into public.media_provider_links values('movie:59065','movie:4349') on conflict do nothing;
insert into public.media_provider_links values('movie:46920','movie:4350') on conflict do nothing;
insert into public.media_provider_links values('movie:57695','movie:4351') on conflict do nothing;
insert into public.media_provider_links values('movie:39641','movie:4352') on conflict do nothing;
insert into public.media_provider_links values('movie:63458','movie:4353') on conflict do nothing;
insert into public.media_provider_links values('movie:73311','movie:4354') on conflict do nothing;
insert into public.media_provider_links values('movie:57602','movie:4355') on conflict do nothing;
insert into public.media_provider_links values('movie:81527','movie:4356') on conflict do nothing;
insert into public.media_provider_links values('movie:60981','movie:4357') on conflict do nothing;
insert into public.media_provider_links values('movie:47261','movie:4358') on conflict do nothing;
insert into public.media_provider_links values('movie:48946','movie:4359') on conflict do nothing;
insert into public.media_provider_links values('movie:45202','movie:4360') on conflict do nothing;
insert into public.media_provider_links values('movie:54083','movie:4361') on conflict do nothing;
insert into public.media_provider_links values('movie:60098','movie:4362') on conflict do nothing;
insert into public.media_provider_links values('movie:45244','movie:4363') on conflict do nothing;
insert into public.media_provider_links values('movie:41273','movie:4364') on conflict do nothing;
insert into public.media_provider_links values('movie:163930','movie:4365') on conflict do nothing;
insert into public.media_provider_links values('movie:55151','movie:4366') on conflict do nothing;
insert into public.media_provider_links values('movie:53413','movie:4367') on conflict do nothing;
insert into public.media_provider_links values('movie:57395','movie:4368') on conflict do nothing;
insert into public.media_provider_links values('movie:73423','movie:4369') on conflict do nothing;
insert into public.media_provider_links values('movie:163942','movie:4370') on conflict do nothing;
insert into public.media_provider_links values('movie:123889','movie:4371') on conflict do nothing;
insert into public.media_provider_links values('movie:78400','movie:4372') on conflict do nothing;
insert into public.media_provider_links values('movie:24171','movie:4373') on conflict do nothing;
insert into public.media_provider_links values('movie:24170','movie:4374') on conflict do nothing;
insert into public.media_provider_links values('movie:51241','movie:4375') on conflict do nothing;
insert into public.media_provider_links values('movie:99215','movie:4376') on conflict do nothing;
insert into public.media_provider_links values('movie:12130','movie:4377') on conflict do nothing;
insert into public.media_provider_links values('movie:13807','movie:4378') on conflict do nothing;
insert into public.media_provider_links values('movie:59015','movie:4379') on conflict do nothing;
insert into public.media_provider_links values('movie:21959','movie:4380') on conflict do nothing;
insert into public.media_provider_links values('movie:12156','movie:4381') on conflict do nothing;
insert into public.media_provider_links values('movie:4977','movie:4382') on conflict do nothing;
insert into public.media_provider_links values('movie:1993','movie:4383') on conflict do nothing;
insert into public.media_provider_links values('movie:108772','movie:4384') on conflict do nothing;
insert into public.media_provider_links values('movie:45316','movie:4385') on conflict do nothing;
insert into public.media_provider_links values('movie:2346','movie:4386') on conflict do nothing;
insert into public.media_provider_links values('movie:41727','movie:4387') on conflict do nothing;
insert into public.media_provider_links values('movie:24189','movie:4388') on conflict do nothing;
insert into public.media_provider_links values('movie:101822','movie:4389') on conflict do nothing;
insert into public.media_provider_links values('movie:314114','movie:4390') on conflict do nothing;
insert into public.media_provider_links values('movie:95342','movie:4391') on conflict do nothing;
insert into public.media_provider_links values('movie:9672','movie:4392') on conflict do nothing;
insert into public.media_provider_links values('movie:63923','movie:4393') on conflict do nothing;
insert into public.media_provider_links values('movie:18586','movie:4394') on conflict do nothing;
insert into public.media_provider_links values('movie:14201','movie:4395') on conflict do nothing;
insert into public.media_provider_links values('movie:49577','movie:4396') on conflict do nothing;
insert into public.media_provider_links values('movie:185570','movie:4397') on conflict do nothing;
insert into public.media_provider_links values('movie:29568','movie:4398') on conflict do nothing;
insert into public.media_provider_links values('movie:3982','movie:4399') on conflict do nothing;
insert into public.media_provider_links values('movie:7992','movie:4400') on conflict do nothing;
insert into public.media_provider_links values('movie:82349','movie:4401') on conflict do nothing;
insert into public.media_provider_links values('movie:115320','movie:4402') on conflict do nothing;
insert into public.media_provider_links values('movie:4556','movie:4403') on conflict do nothing;
insert into public.media_provider_links values('movie:11600','movie:4404') on conflict do nothing;
insert into public.media_provider_links values('movie:4520','movie:4405') on conflict do nothing;
insert into public.media_provider_links values('movie:14016','movie:4406') on conflict do nothing;
insert into public.media_provider_links values('movie:45458','movie:4407') on conflict do nothing;
insert into public.media_provider_links values('movie:13637','movie:4408') on conflict do nothing;
insert into public.media_provider_links values('movie:72303','movie:4409') on conflict do nothing;
insert into public.media_provider_links values('movie:214944','movie:4410') on conflict do nothing;
insert into public.media_provider_links values('movie:163659','movie:4411') on conflict do nothing;
insert into public.media_provider_links values('movie:94509','movie:4412') on conflict do nothing;
insert into public.media_provider_links values('movie:55191','movie:4413') on conflict do nothing;
insert into public.media_provider_links values('movie:72286','movie:4414') on conflict do nothing;
insert into public.media_provider_links values('movie:360360','movie:4415') on conflict do nothing;
insert into public.media_provider_links values('movie:152335','movie:4416') on conflict do nothing;
insert into public.media_provider_links values('movie:127838','movie:4417') on conflict do nothing;
insert into public.media_provider_links values('movie:57297','movie:4418') on conflict do nothing;
insert into public.media_provider_links values('movie:78527','movie:4419') on conflict do nothing;
insert into public.media_provider_links values('movie:46847','movie:4420') on conflict do nothing;
insert into public.media_provider_links values('movie:352371','movie:4421') on conflict do nothing;
insert into public.media_provider_links values('movie:125556','movie:4422') on conflict do nothing;
insert into public.media_provider_links values('movie:12811','movie:4423') on conflict do nothing;
insert into public.media_provider_links values('movie:130442','movie:4424') on conflict do nothing;
insert into public.media_provider_links values('movie:121232','movie:4425') on conflict do nothing;
insert into public.media_provider_links values('movie:479413','movie:4426') on conflict do nothing;
insert into public.media_provider_links values('movie:12426','movie:4427') on conflict do nothing;
insert into public.media_provider_links values('movie:12424','movie:4428') on conflict do nothing;
insert into public.media_provider_links values('movie:12406','movie:4429') on conflict do nothing;
insert into public.media_provider_links values('movie:12161','movie:4430') on conflict do nothing;
insert into public.media_provider_links values('movie:12422','movie:4431') on conflict do nothing;
insert into public.media_provider_links values('movie:15877','movie:4432') on conflict do nothing;
insert into public.media_provider_links values('movie:12433','movie:4433') on conflict do nothing;
insert into public.media_provider_links values('movie:12471','movie:4434') on conflict do nothing;
insert into public.media_provider_links values('movie:12165','movie:4435') on conflict do nothing;
insert into public.media_provider_links values('movie:12429','movie:4436') on conflict do nothing;
insert into public.media_provider_links values('movie:12427','movie:4437') on conflict do nothing;
insert into public.media_provider_links values('movie:12430','movie:4438') on conflict do nothing;
insert into public.media_provider_links values('movie:12434','movie:4439') on conflict do nothing;
insert into public.media_provider_links values('movie:171061','movie:4440') on conflict do nothing;
insert into public.media_provider_links values('movie:52247','movie:4441') on conflict do nothing;
insert into public.media_provider_links values('movie:121688','movie:4442') on conflict do nothing;
insert into public.media_provider_links values('movie:69527','movie:4443') on conflict do nothing;
insert into public.media_provider_links values('movie:21371','movie:4444') on conflict do nothing;
insert into public.media_provider_links values('movie:271869','movie:4445') on conflict do nothing;
insert into public.media_provider_links values('movie:35647','movie:4446') on conflict do nothing;
insert into public.media_provider_links values('movie:200785','movie:4447') on conflict do nothing;
insert into public.media_provider_links values('movie:1357554','movie:4448') on conflict do nothing;
insert into public.media_provider_links values('movie:117896','movie:4449') on conflict do nothing;
insert into public.media_provider_links values('movie:86440','movie:4450') on conflict do nothing;
insert into public.media_provider_links values('movie:37000','movie:4451') on conflict do nothing;
insert into public.media_provider_links values('movie:178478','movie:4452') on conflict do nothing;
insert into public.media_provider_links values('movie:247483','movie:4453') on conflict do nothing;
insert into public.media_provider_links values('movie:95585','movie:4454') on conflict do nothing;
insert into public.media_provider_links values('movie:113038','movie:4455') on conflict do nothing;
insert into public.media_provider_links values('movie:59947','movie:4456') on conflict do nothing;
insert into public.media_provider_links values('movie:203529','movie:4457') on conflict do nothing;
insert into public.media_provider_links values('movie:12432','movie:4458') on conflict do nothing;
insert into public.media_provider_links values('movie:11699','movie:4459') on conflict do nothing;
insert into public.media_provider_links values('movie:767592','movie:4460') on conflict do nothing;
insert into public.media_provider_links values('movie:203221','movie:4461') on conflict do nothing;
insert into public.media_provider_links values('movie:42571','movie:4462') on conflict do nothing;
insert into public.media_provider_links values('movie:22074','movie:4463') on conflict do nothing;
insert into public.media_provider_links values('movie:39800','movie:4464') on conflict do nothing;
insert into public.media_provider_links values('movie:203530','movie:4465') on conflict do nothing;
insert into public.media_provider_links values('movie:51477','movie:4466') on conflict do nothing;
insert into public.media_provider_links values('movie:32084','movie:4467') on conflict do nothing;
insert into public.media_provider_links values('movie:41123','movie:4468') on conflict do nothing;
insert into public.media_provider_links values('movie:56844','movie:4469') on conflict do nothing;
insert into public.media_provider_links values('movie:31175','movie:4470') on conflict do nothing;
insert into public.media_provider_links values('movie:44027','movie:4471') on conflict do nothing;
insert into public.media_provider_links values('movie:52034','movie:4472') on conflict do nothing;
insert into public.media_provider_links values('movie:29426','movie:4473') on conflict do nothing;
insert into public.media_provider_links values('movie:57534','movie:4474') on conflict do nothing;
insert into public.media_provider_links values('movie:20766','movie:4475') on conflict do nothing;
insert into public.media_provider_links values('movie:46207','movie:4476') on conflict do nothing;
insert into public.media_provider_links values('movie:78380','movie:4477') on conflict do nothing;
insert into public.media_provider_links values('movie:59992','movie:4478') on conflict do nothing;
insert into public.media_provider_links values('movie:34499','movie:4479') on conflict do nothing;
insert into public.media_provider_links values('movie:260649','movie:4480') on conflict do nothing;
insert into public.media_provider_links values('movie:108519','movie:4481') on conflict do nothing;
insert into public.media_provider_links values('movie:81076','movie:4482') on conflict do nothing;
insert into public.media_provider_links values('movie:237958','movie:4483') on conflict do nothing;
insert into public.media_provider_links values('movie:58586','movie:4484') on conflict do nothing;
insert into public.media_provider_links values('movie:323018','movie:4485') on conflict do nothing;
insert into public.media_provider_links values('movie:87199','movie:4486') on conflict do nothing;
insert into public.media_provider_links values('movie:435883','movie:4487') on conflict do nothing;
insert into public.media_provider_links values('movie:111396','movie:4488') on conflict do nothing;
insert into public.media_provider_links values('movie:198959','movie:4489') on conflict do nothing;
insert into public.media_provider_links values('movie:57802','movie:4490') on conflict do nothing;
insert into public.media_provider_links values('movie:56812','movie:4491') on conflict do nothing;
insert into public.media_provider_links values('movie:73202','movie:4492') on conflict do nothing;
insert into public.media_provider_links values('movie:62321','movie:4493') on conflict do nothing;
insert into public.media_provider_links values('movie:53256','movie:4494') on conflict do nothing;
insert into public.media_provider_links values('movie:59507','movie:4495') on conflict do nothing;
insert into public.media_provider_links values('movie:48243','movie:4496') on conflict do nothing;
insert into public.media_provider_links values('movie:58857','movie:4497') on conflict do nothing;
insert into public.media_provider_links values('movie:56799','movie:4498') on conflict do nothing;
insert into public.media_provider_links values('movie:53399','movie:4499') on conflict do nothing;
insert into public.media_provider_links values('movie:45595','movie:4500') on conflict do nothing;
insert into public.media_provider_links values('movie:57120','movie:4501') on conflict do nothing;
insert into public.media_provider_links values('movie:57703','movie:4502') on conflict do nothing;
insert into public.media_provider_links values('movie:56853','movie:4503') on conflict do nothing;
insert into public.media_provider_links values('movie:48492','movie:4504') on conflict do nothing;
insert into public.media_provider_links values('movie:56815','movie:4505') on conflict do nothing;
insert into public.media_provider_links values('movie:45950','movie:4506') on conflict do nothing;
insert into public.media_provider_links values('movie:51276','movie:4507') on conflict do nothing;
insert into public.media_provider_links values('movie:39210','movie:4508') on conflict do nothing;
insert into public.media_provider_links values('movie:56405','movie:4509') on conflict do nothing;
insert into public.media_provider_links values('movie:213087','movie:4510') on conflict do nothing;
insert into public.media_provider_links values('movie:42707','movie:4511') on conflict do nothing;
insert into public.media_provider_links values('movie:96589','movie:4512') on conflict do nothing;
insert into public.media_provider_links values('movie:123029','movie:4513') on conflict do nothing;
insert into public.media_provider_links values('movie:56519','movie:4514') on conflict do nothing;
insert into public.media_provider_links values('movie:178832','movie:4515') on conflict do nothing;
insert into public.media_provider_links values('movie:81634','movie:4516') on conflict do nothing;
insert into public.media_provider_links values('movie:81648','movie:4517') on conflict do nothing;
insert into public.media_provider_links values('movie:85924','movie:4518') on conflict do nothing;
insert into public.media_provider_links values('movie:86261','movie:4519') on conflict do nothing;
insert into public.media_provider_links values('movie:65016','movie:4520') on conflict do nothing;
insert into public.media_provider_links values('movie:69340','movie:4521') on conflict do nothing;
insert into public.media_provider_links values('movie:104988','movie:4522') on conflict do nothing;
insert into public.media_provider_links values('movie:105554','movie:4523') on conflict do nothing;
insert into public.media_provider_links values('movie:9526','movie:4524') on conflict do nothing;
insert into public.media_provider_links values('movie:4441','movie:4525') on conflict do nothing;
insert into public.media_provider_links values('movie:68341','movie:4526') on conflict do nothing;
insert into public.media_provider_links values('movie:9999','movie:4527') on conflict do nothing;
insert into public.media_provider_links values('movie:99495','movie:4528') on conflict do nothing;
insert into public.media_provider_links values('movie:317','movie:4529') on conflict do nothing;
insert into public.media_provider_links values('movie:74651','movie:4530') on conflict do nothing;
insert into public.media_provider_links values('movie:99896','movie:4531') on conflict do nothing;
insert into public.media_provider_links values('movie:38025','movie:4532') on conflict do nothing;
insert into public.media_provider_links values('movie:12713','movie:4533') on conflict do nothing;
insert into public.media_provider_links values('movie:523','movie:4534') on conflict do nothing;
insert into public.media_provider_links values('movie:15845','movie:4535') on conflict do nothing;
insert into public.media_provider_links values('movie:313','movie:4536') on conflict do nothing;
insert into public.media_provider_links values('movie:13209','movie:4537') on conflict do nothing;
insert into public.media_provider_links values('movie:7872','movie:4538') on conflict do nothing;
insert into public.media_provider_links values('movie:14375','movie:4539') on conflict do nothing;
insert into public.media_provider_links values('movie:4630','movie:4540') on conflict do nothing;
insert into public.media_provider_links values('movie:4351','movie:4541') on conflict do nothing;
insert into public.media_provider_links values('movie:76853','movie:4542') on conflict do nothing;
insert into public.media_provider_links values('movie:1874','movie:4543') on conflict do nothing;
insert into public.media_provider_links values('movie:2239','movie:4544') on conflict do nothing;
insert into public.media_provider_links values('movie:78115','movie:4545') on conflict do nothing;
insert into public.media_provider_links values('movie:58099','movie:4546') on conflict do nothing;
insert into public.media_provider_links values('movie:351','movie:4547') on conflict do nothing;
insert into public.media_provider_links values('movie:38282','movie:4548') on conflict do nothing;
insert into public.media_provider_links values('movie:1922','movie:4549') on conflict do nothing;
insert into public.media_provider_links values('movie:46335','movie:4550') on conflict do nothing;
insert into public.media_provider_links values('movie:37838','movie:4551') on conflict do nothing;
insert into public.media_provider_links values('movie:182','movie:4552') on conflict do nothing;
insert into public.media_provider_links values('movie:5488','movie:4553') on conflict do nothing;
insert into public.media_provider_links values('movie:12555','movie:4554') on conflict do nothing;
insert into public.media_provider_links values('movie:1247','movie:4555') on conflict do nothing;
insert into public.media_provider_links values('movie:30112','movie:4556') on conflict do nothing;
insert into public.media_provider_links values('movie:24059','movie:4557') on conflict do nothing;
insert into public.media_provider_links values('movie:2694','movie:4558') on conflict do nothing;
insert into public.media_provider_links values('movie:14421','movie:4559') on conflict do nothing;
insert into public.media_provider_links values('movie:3037','movie:4560') on conflict do nothing;
insert into public.media_provider_links values('movie:25112','movie:4561') on conflict do nothing;
insert into public.media_provider_links values('movie:54254','movie:4562') on conflict do nothing;
insert into public.media_provider_links values('movie:52814','movie:4563') on conflict do nothing;
insert into public.media_provider_links values('movie:16867','movie:4564') on conflict do nothing;
insert into public.media_provider_links values('movie:7351','movie:4565') on conflict do nothing;
insert into public.media_provider_links values('movie:25746','movie:4566') on conflict do nothing;
insert into public.media_provider_links values('movie:22274','movie:4567') on conflict do nothing;
insert into public.media_provider_links values('movie:6461','movie:4568') on conflict do nothing;
insert into public.media_provider_links values('movie:78236','movie:4569') on conflict do nothing;
insert into public.media_provider_links values('movie:11671','movie:4570') on conflict do nothing;
insert into public.media_provider_links values('movie:65726','movie:4571') on conflict do nothing;
insert into public.media_provider_links values('movie:8847','movie:4572') on conflict do nothing;
insert into public.media_provider_links values('movie:25004','movie:4573') on conflict do nothing;
insert into public.media_provider_links values('movie:57859','movie:4574') on conflict do nothing;
insert into public.media_provider_links values('movie:33809','movie:4575') on conflict do nothing;
insert into public.media_provider_links values('movie:7346','movie:4576') on conflict do nothing;
insert into public.media_provider_links values('movie:22215','movie:4577') on conflict do nothing;
insert into public.media_provider_links values('movie:7347','movie:4578') on conflict do nothing;
insert into public.media_provider_links values('movie:39488','movie:4579') on conflict do nothing;
insert into public.media_provider_links values('movie:39072','movie:4580') on conflict do nothing;
insert into public.media_provider_links values('movie:13975','movie:4581') on conflict do nothing;
insert into public.media_provider_links values('movie:34208','movie:4582') on conflict do nothing;
insert into public.media_provider_links values('movie:31205','movie:4583') on conflict do nothing;
insert into public.media_provider_links values('movie:39358','movie:4584') on conflict do nothing;
insert into public.media_provider_links values('movie:33974','movie:4585') on conflict do nothing;
insert into public.media_provider_links values('movie:26738','movie:4586') on conflict do nothing;
insert into public.media_provider_links values('movie:26820','movie:4587') on conflict do nothing;
insert into public.media_provider_links values('movie:44837','movie:4588') on conflict do nothing;
insert into public.media_provider_links values('movie:22136','movie:4589') on conflict do nothing;
insert into public.media_provider_links values('movie:44160','movie:4590') on conflict do nothing;
insert into public.media_provider_links values('movie:46106','movie:4591') on conflict do nothing;
insert into public.media_provider_links values('movie:37181','movie:4592') on conflict do nothing;
insert into public.media_provider_links values('movie:54524','movie:4593') on conflict do nothing;
insert into public.media_provider_links values('movie:58483','movie:4594') on conflict do nothing;
insert into public.media_provider_links values('movie:51010','movie:4595') on conflict do nothing;
insert into public.media_provider_links values('movie:31035','movie:4596') on conflict do nothing;
insert into public.media_provider_links values('movie:16031','movie:4597') on conflict do nothing;
insert into public.media_provider_links values('movie:39840','movie:4598') on conflict do nothing;
insert into public.media_provider_links values('movie:38568','movie:4599') on conflict do nothing;
insert into public.media_provider_links values('movie:50817','movie:4600') on conflict do nothing;
insert into public.media_provider_links values('movie:41272','movie:4601') on conflict do nothing;
insert into public.media_provider_links values('movie:27583','movie:4602') on conflict do nothing;
insert into public.media_provider_links values('movie:44555','movie:4603') on conflict do nothing;
insert into public.media_provider_links values('movie:55530','movie:4604') on conflict do nothing;
insert into public.media_provider_links values('movie:52767','movie:4605') on conflict do nothing;
insert into public.media_provider_links values('movie:46789','movie:4606') on conflict do nothing;
insert into public.media_provider_links values('movie:129955','movie:4607') on conflict do nothing;
insert into public.media_provider_links values('movie:61623','movie:4608') on conflict do nothing;
insert into public.media_provider_links values('movie:37414','movie:4609') on conflict do nothing;
insert into public.media_provider_links values('movie:7509','movie:4610') on conflict do nothing;
insert into public.media_provider_links values('movie:10197','movie:4611') on conflict do nothing;
insert into public.media_provider_links values('movie:26763','movie:4612') on conflict do nothing;
insert into public.media_provider_links values('movie:34576','movie:4613') on conflict do nothing;
insert into public.media_provider_links values('movie:120393','movie:4614') on conflict do nothing;
insert into public.media_provider_links values('movie:25532','movie:4615') on conflict do nothing;
insert into public.media_provider_links values('movie:13402','movie:4616') on conflict do nothing;
insert into public.media_provider_links values('movie:14064','movie:4617') on conflict do nothing;
insert into public.media_provider_links values('movie:2168','movie:4618') on conflict do nothing;
insert into public.media_provider_links values('movie:8267','movie:4619') on conflict do nothing;
insert into public.media_provider_links values('movie:22521','movie:4620') on conflict do nothing;
insert into public.media_provider_links values('movie:29972','movie:4621') on conflict do nothing;
insert into public.media_provider_links values('movie:8903','movie:4622') on conflict do nothing;
insert into public.media_provider_links values('movie:8904','movie:4623') on conflict do nothing;
insert into public.media_provider_links values('movie:8939','movie:4624') on conflict do nothing;
insert into public.media_provider_links values('movie:8935','movie:4625') on conflict do nothing;
insert into public.media_provider_links values('movie:64450','movie:4626') on conflict do nothing;
insert into public.media_provider_links values('movie:41545','movie:4627') on conflict do nothing;
insert into public.media_provider_links values('movie:52322','movie:4628') on conflict do nothing;
insert into public.media_provider_links values('movie:1896','movie:4629') on conflict do nothing;
insert into public.media_provider_links values('movie:17479','movie:4630') on conflict do nothing;
insert into public.media_provider_links values('movie:72891','movie:4631') on conflict do nothing;
insert into public.media_provider_links values('movie:38318','movie:4632') on conflict do nothing;
insert into public.media_provider_links values('movie:27904','movie:4633') on conflict do nothing;
insert into public.media_provider_links values('movie:79072','movie:4634') on conflict do nothing;
insert into public.media_provider_links values('movie:553126','movie:4635') on conflict do nothing;
insert into public.media_provider_links values('movie:83267','movie:4636') on conflict do nothing;
insert into public.media_provider_links values('movie:97476','movie:4637') on conflict do nothing;
insert into public.media_provider_links values('movie:39267','movie:4638') on conflict do nothing;
insert into public.media_provider_links values('tv:16468','movie:4639') on conflict do nothing;
insert into public.media_provider_links values('movie:102347','movie:4640') on conflict do nothing;
insert into public.media_provider_links values('movie:54326','movie:4641') on conflict do nothing;
insert into public.media_provider_links values('movie:106999','movie:4642') on conflict do nothing;
insert into public.media_provider_links values('movie:24220','movie:4643') on conflict do nothing;
insert into public.media_provider_links values('movie:644365','movie:4644') on conflict do nothing;
insert into public.media_provider_links values('movie:26859','movie:4645') on conflict do nothing;
insert into public.media_provider_links values('movie:167710','movie:4646') on conflict do nothing;
insert into public.media_provider_links values('movie:291135','movie:4647') on conflict do nothing;
insert into public.media_provider_links values('movie:12166','movie:4648') on conflict do nothing;
insert into public.media_provider_links values('movie:12425','movie:4649') on conflict do nothing;
insert into public.media_provider_links values('movie:8280','movie:4650') on conflict do nothing;
insert into public.media_provider_links values('movie:461640','movie:4651') on conflict do nothing;
insert into public.media_provider_links values('movie:72985','movie:4652') on conflict do nothing;
insert into public.media_provider_links values('movie:25474','movie:4653') on conflict do nothing;
insert into public.media_provider_links values('movie:44159','movie:4654') on conflict do nothing;
insert into public.media_provider_links values('movie:44714','movie:4655') on conflict do nothing;
insert into public.media_provider_links values('movie:79766','movie:4656') on conflict do nothing;
insert into public.media_provider_links values('movie:373574','movie:4657') on conflict do nothing;
insert into public.media_provider_links values('movie:163660','movie:4658') on conflict do nothing;
insert into public.media_provider_links values('movie:29956','movie:4659') on conflict do nothing;
insert into public.media_provider_links values('movie:462891','movie:4660') on conflict do nothing;
insert into public.media_provider_links values('movie:91067','movie:4661') on conflict do nothing;
insert into public.media_provider_links values('movie:51885','movie:4662') on conflict do nothing;
insert into public.media_provider_links values('movie:103443','movie:4663') on conflict do nothing;
insert into public.media_provider_links values('movie:41181','movie:4664') on conflict do nothing;
insert into public.media_provider_links values('movie:584944','movie:4665') on conflict do nothing;
insert into public.media_provider_links values('movie:40977','movie:4666') on conflict do nothing;
insert into public.media_provider_links values('movie:57322','movie:4667') on conflict do nothing;
insert into public.media_provider_links values('movie:16705','movie:4668') on conflict do nothing;
insert into public.media_provider_links values('movie:35619','movie:4669') on conflict do nothing;
insert into public.media_provider_links values('movie:38325','movie:4670') on conflict do nothing;
insert into public.media_provider_links values('movie:300576','movie:4671') on conflict do nothing;
insert into public.media_provider_links values('movie:11801','movie:4672') on conflict do nothing;
insert into public.media_provider_links values('movie:340365','movie:4673') on conflict do nothing;
insert into public.media_provider_links values('movie:70137','movie:4674') on conflict do nothing;
insert into public.media_provider_links values('movie:37832','movie:4675') on conflict do nothing;
insert into public.media_provider_links values('movie:299541','movie:4676') on conflict do nothing;
insert into public.media_provider_links values('movie:396142','movie:4677') on conflict do nothing;
insert into public.media_provider_links values('movie:329234','movie:4678') on conflict do nothing;
insert into public.media_provider_links values('movie:580589','movie:4679') on conflict do nothing;
insert into public.media_provider_links values('movie:502297','movie:4680') on conflict do nothing;
insert into public.media_provider_links values('movie:358252','movie:4681') on conflict do nothing;
insert into public.media_provider_links values('movie:634323','movie:4682') on conflict do nothing;
commit;

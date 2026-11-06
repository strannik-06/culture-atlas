-- Film awards 2001-2005: 599 verified catalogue identities and provider links.
-- Apply after merging the catalogue PR. Existing rows are preserved.
begin;
do $$ begin
 if exists (
  select 1 from (values
('movie:146','movie:4683','146','tmdb_id'),
('movie:1900','movie:4684','1900','tmdb_id'),
('movie:5001','movie:4685','5001','tmdb_id'),
('movie:8358','movie:4686','8358','tmdb_id'),
('movie:12509','movie:4687','12509','tmdb_id'),
('movie:10876','movie:4688','10876','tmdb_id'),
('movie:6521','movie:4689','6521','tmdb_id'),
('movie:14295','movie:4690','14295','tmdb_id'),
('movie:11004','movie:4691','11004','tmdb_id'),
('movie:10873','movie:4692','10873','tmdb_id'),
('movie:10697','movie:4693','10697','tmdb_id'),
('movie:58062','movie:4694','58062','tmdb_id'),
('movie:95682','movie:4695','95682','tmdb_id'),
('movie:70564','movie:4696','70564','tmdb_id'),
('movie:62529','movie:4697','62529','tmdb_id'),
('movie:1999','movie:4698','1999','tmdb_id'),
('movie:29937','movie:4699','29937','tmdb_id'),
('movie:10950','movie:4700','10950','tmdb_id'),
('movie:8489','movie:4701','8489','tmdb_id'),
('movie:824','movie:4702','824','tmdb_id'),
('movie:1365','movie:4703','1365','tmdb_id'),
('movie:11889','movie:4704','11889','tmdb_id'),
('movie:11826','movie:4705','11826','tmdb_id'),
('movie:19460','movie:4706','19460','tmdb_id'),
('movie:51391','movie:4707','51391','tmdb_id'),
('movie:8342','movie:4708','8342','tmdb_id'),
('movie:51722','movie:4709','51722','tmdb_id'),
('movie:38880','movie:4710','38880','tmdb_id'),
('movie:112906','movie:4711','112906','tmdb_id'),
('movie:12722','movie:4712','12722','tmdb_id'),
('movie:12589','movie:4713','12589','tmdb_id'),
('movie:590','movie:4714','590','tmdb_id'),
('movie:64','movie:4715','64','tmdb_id'),
('movie:1574','movie:4716','1574','tmdb_id'),
('movie:8198','movie:4717','8198','tmdb_id'),
('movie:2755','movie:4718','2755','tmdb_id'),
('movie:6007','movie:4719','6007','tmdb_id'),
('movie:2251','movie:4720','2251','tmdb_id'),
('movie:10712','movie:4721','10712','tmdb_id'),
('movie:245','movie:4722','245','tmdb_id'),
('movie:1591','movie:4723','1591','tmdb_id'),
('movie:1391','movie:4724','1391','tmdb_id'),
('movie:542','movie:4725','542','tmdb_id'),
('movie:7294','movie:4726','7294','tmdb_id'),
('movie:16539','movie:4727','16539','tmdb_id'),
('movie:112902','movie:4728','112902','tmdb_id'),
('movie:67232','movie:4729','67232','tmdb_id'),
('movie:11516','movie:4730','11516','tmdb_id'),
('movie:1430','movie:4731','1430','tmdb_id'),
('movie:8619','movie:4732','8619','tmdb_id'),
('movie:598','movie:4733','598','tmdb_id'),
('movie:11093','movie:4734','11093','tmdb_id'),
('movie:2289','movie:4735','2289','tmdb_id'),
('movie:504','movie:4736','504','tmdb_id'),
('movie:1088','movie:4737','1088','tmdb_id'),
('movie:6964','movie:4738','6964','tmdb_id'),
('movie:16636','movie:4739','16636','tmdb_id'),
('movie:10511','movie:4740','10511','tmdb_id'),
('movie:11023','movie:4741','11023','tmdb_id'),
('movie:11042','movie:4742','11042','tmdb_id'),
('movie:3472','movie:4743','3472','tmdb_id'),
('movie:616','movie:4744','616','tmdb_id'),
('movie:2771','movie:4745','2771','tmdb_id'),
('movie:12496','movie:4746','12496','tmdb_id'),
('movie:16132','movie:4747','16132','tmdb_id'),
('movie:10744','movie:4748','10744','tmdb_id'),
('movie:19765','movie:4749','19765','tmdb_id'),
('movie:12698','movie:4750','12698','tmdb_id'),
('movie:27915','movie:4751','27915','tmdb_id'),
('movie:2260','movie:4752','2260','tmdb_id'),
('movie:1550','movie:4753','1550','tmdb_id'),
('movie:14108','movie:4754','14108','tmdb_id'),
('movie:10009','movie:4755','10009','tmdb_id'),
('movie:866','movie:4756','866','tmdb_id'),
('movie:9675','movie:4757','9675','tmdb_id'),
('movie:11109','movie:4758','11109','tmdb_id'),
('movie:9662','movie:4759','9662','tmdb_id'),
('movie:1677','movie:4760','1677','tmdb_id'),
('movie:11184','movie:4761','11184','tmdb_id'),
('movie:18701','movie:4762','18701','tmdb_id'),
('movie:1653','movie:4763','1653','tmdb_id'),
('movie:464','movie:4764','464','tmdb_id'),
('movie:1913','movie:4765','1913','tmdb_id'),
('movie:436','movie:4766','436','tmdb_id'),
('movie:613','movie:4767','613','tmdb_id'),
('movie:1114','movie:4768','1114','tmdb_id'),
('movie:1538','movie:4769','1538','tmdb_id'),
('movie:34581','movie:4770','34581','tmdb_id'),
('movie:9372','movie:4771','9372','tmdb_id'),
('movie:21525','movie:4772','21525','tmdb_id'),
('movie:25520','movie:4773','25520','tmdb_id'),
('movie:226','movie:4774','226','tmdb_id'),
('movie:243','movie:4775','243','tmdb_id'),
('movie:6440','movie:4776','6440','tmdb_id'),
('movie:26290','movie:4777','26290','tmdb_id'),
('movie:1791','movie:4778','1791','tmdb_id'),
('movie:480','movie:4779','480','tmdb_id'),
('movie:36093','movie:4780','36093','tmdb_id'),
('movie:8094','movie:4781','8094','tmdb_id'),
('movie:587','movie:4782','587','tmdb_id'),
('movie:11194','movie:4783','11194','tmdb_id'),
('movie:455','movie:4784','455','tmdb_id'),
('movie:59210','movie:4785','59210','tmdb_id'),
('movie:3635','movie:4786','3635','tmdb_id'),
('movie:36791','movie:4787','36791','tmdb_id'),
('movie:338','movie:4788','338','tmdb_id'),
('movie:9709','movie:4789','9709','tmdb_id'),
('movie:12877','movie:4790','12877','tmdb_id'),
('movie:5168','movie:4791','5168','tmdb_id'),
('movie:14462','movie:4792','14462','tmdb_id'),
('movie:17771','movie:4793','17771','tmdb_id'),
('movie:13785','movie:4794','13785','tmdb_id'),
('movie:29458','movie:4795','29458','tmdb_id'),
('movie:48217','movie:4796','48217','tmdb_id'),
('movie:10480','movie:4797','10480','tmdb_id'),
('movie:2360','movie:4798','2360','tmdb_id'),
('movie:24936','movie:4799','24936','tmdb_id'),
('movie:10569','movie:4800','10569','tmdb_id'),
('movie:3172','movie:4801','3172','tmdb_id'),
('movie:13403','movie:4802','13403','tmdb_id'),
('movie:11457','movie:4803','11457','tmdb_id'),
('movie:2111','movie:4804','2111','tmdb_id'),
('movie:29339','movie:4805','29339','tmdb_id'),
('movie:9685','movie:4806','9685','tmdb_id'),
('movie:9034','movie:4807','9034','tmdb_id'),
('movie:11013','movie:4808','11013','tmdb_id'),
('movie:14757','movie:4809','14757','tmdb_id'),
('movie:10629','movie:4810','10629','tmdb_id'),
('movie:10934','movie:4811','10934','tmdb_id'),
('movie:337','movie:4812','337','tmdb_id'),
('movie:8696','movie:4813','8696','tmdb_id'),
('movie:1584','movie:4814','1584','tmdb_id'),
('movie:13537','movie:4815','13537','tmdb_id'),
('movie:9550','movie:4816','9550','tmdb_id'),
('movie:2841','movie:4817','2841','tmdb_id'),
('movie:10740','movie:4818','10740','tmdb_id'),
('movie:9953','movie:4819','9953','tmdb_id'),
('movie:15237','movie:4820','15237','tmdb_id'),
('movie:9801','movie:4821','9801','tmdb_id'),
('movie:5528','movie:4822','5528','tmdb_id'),
('movie:6478','movie:4823','6478','tmdb_id'),
('movie:182134','movie:4824','182134','tmdb_id'),
('movie:25051','movie:4825','25051','tmdb_id'),
('movie:47254','movie:4826','47254','tmdb_id'),
('movie:11447','movie:4827','11447','tmdb_id'),
('movie:52717','movie:4828','52717','tmdb_id'),
('movie:11553','movie:4829','11553','tmdb_id'),
('movie:64481','movie:4830','64481','tmdb_id'),
('movie:163650','movie:4831','163650','tmdb_id'),
('movie:56798','movie:4832','56798','tmdb_id'),
('movie:5955','movie:4833','5955','tmdb_id'),
('movie:326622','movie:4834','326622','tmdb_id'),
('movie:82550','movie:4835','82550','tmdb_id'),
('movie:13245','movie:4836','13245','tmdb_id'),
('movie:47297','movie:4837','47297','tmdb_id'),
('movie:307358','movie:4838','307358','tmdb_id'),
('movie:217309','movie:4839','217309','tmdb_id'),
('movie:125815','movie:4840','125815','tmdb_id'),
('movie:2805','movie:4841','2805','tmdb_id'),
('movie:48601','movie:4842','48601','tmdb_id'),
('movie:29135','movie:4843','29135','tmdb_id'),
('movie:94649','movie:4844','94649','tmdb_id'),
('movie:121883','movie:4845','121883','tmdb_id'),
('movie:49110','movie:4846','49110','tmdb_id'),
('movie:125809','movie:4847','125809','tmdb_id'),
('movie:248624','movie:4848','248624','tmdb_id'),
('movie:26475','movie:4849','26475','tmdb_id'),
('movie:2750','movie:4850','2750','tmdb_id'),
('movie:16550','movie:4851','16550','tmdb_id'),
('movie:24488','movie:4852','24488','tmdb_id'),
('movie:979','movie:4853','979','tmdb_id'),
('movie:125945','movie:4854','125945','tmdb_id'),
('movie:52999','movie:4855','52999','tmdb_id'),
('movie:12513','movie:4856','12513','tmdb_id'),
('movie:18302','movie:4857','18302','tmdb_id'),
('movie:65045','movie:4858','65045','tmdb_id'),
('movie:103701','movie:4859','103701','tmdb_id'),
('movie:80243','movie:4860','80243','tmdb_id'),
('movie:9613','movie:4861','9613','tmdb_id'),
('movie:1376','movie:4862','1376','tmdb_id'),
('movie:12454','movie:4863','12454','tmdb_id'),
('movie:14633','movie:4864','14633','tmdb_id'),
('movie:44408','movie:4865','44408','tmdb_id'),
('movie:57100','movie:4866','57100','tmdb_id'),
('movie:83505','movie:4867','83505','tmdb_id'),
('movie:47226','movie:4868','47226','tmdb_id'),
('movie:125937','movie:4869','125937','tmdb_id'),
('movie:49475','movie:4870','49475','tmdb_id'),
('movie:46993','movie:4871','46993','tmdb_id'),
('movie:79084','movie:4872','79084','tmdb_id'),
('movie:47046','movie:4873','47046','tmdb_id'),
('movie:367852','movie:4874','367852','tmdb_id'),
('movie:263209','movie:4875','263209','tmdb_id'),
('movie:41187','movie:4876','41187','tmdb_id'),
('movie:50956','movie:4877','50956','tmdb_id'),
('movie:8440','movie:4878','8440','tmdb_id'),
('movie:1807','movie:4879','1807','tmdb_id'),
('movie:462725','movie:4880','462725','tmdb_id'),
('movie:26886','movie:4881','26886','tmdb_id'),
('movie:57424','movie:4882','57424','tmdb_id'),
('movie:51865','movie:4883','51865','tmdb_id'),
('movie:68970','movie:4884','68970','tmdb_id'),
('movie:34561','movie:4885','34561','tmdb_id'),
('movie:302','movie:4886','302','tmdb_id'),
('movie:67236','movie:4887','67236','tmdb_id'),
('movie:38018','movie:4888','38018','tmdb_id'),
('movie:260524','movie:4889','260524','tmdb_id'),
('movie:12703','movie:4890','12703','tmdb_id'),
('movie:255962','movie:4891','255962','tmdb_id'),
('movie:11659','movie:4892','11659','tmdb_id'),
('movie:216214','movie:4893','216214','tmdb_id'),
('movie:13433','movie:4894','13433','tmdb_id'),
('movie:58739','movie:4895','58739','tmdb_id'),
('movie:99698','movie:4896','99698','tmdb_id'),
('movie:102533','movie:4897','102533','tmdb_id'),
('movie:6000','movie:4898','6000','tmdb_id'),
('movie:48861','movie:4899','48861','tmdb_id'),
('movie:40427','movie:4900','40427','tmdb_id'),
('movie:237','movie:4901','237','tmdb_id'),
('movie:38086','movie:4902','38086','tmdb_id'),
('movie:39851','movie:4903','39851','tmdb_id'),
('movie:18497','movie:4904','18497','tmdb_id'),
('movie:276','movie:4905','276','tmdb_id'),
('movie:1777','movie:4906','1777','tmdb_id'),
('movie:2517','movie:4907','2517','tmdb_id'),
('movie:16447','movie:4908','16447','tmdb_id'),
('movie:12140','movie:4909','12140','tmdb_id'),
('movie:44413','movie:4910','44413','tmdb_id'),
('movie:11399','movie:4911','11399','tmdb_id'),
('movie:48121','movie:4912','48121','tmdb_id'),
('movie:20128','movie:4913','20128','tmdb_id'),
('movie:78134','movie:4914','78134','tmdb_id'),
('movie:78293','movie:4915','78293','tmdb_id'),
('movie:56785','movie:4916','56785','tmdb_id'),
('movie:20511','movie:4917','20511','tmdb_id'),
('movie:10609','movie:4918','10609','tmdb_id'),
('movie:121102','movie:4919','121102','tmdb_id'),
('movie:2702','movie:4920','2702','tmdb_id'),
('movie:153770','movie:4921','153770','tmdb_id'),
('movie:8981','movie:4922','8981','tmdb_id'),
('movie:39504','movie:4923','39504','tmdb_id'),
('movie:83827','movie:4924','83827','tmdb_id'),
('movie:61681','movie:4925','61681','tmdb_id'),
('movie:5204','movie:4926','5204','tmdb_id'),
('movie:16729','movie:4927','16729','tmdb_id'),
('movie:842','movie:4928','842','tmdb_id'),
('movie:36971','movie:4929','36971','tmdb_id'),
('movie:39798','movie:4930','39798','tmdb_id'),
('movie:3527','movie:4931','3527','tmdb_id'),
('movie:16605','movie:4932','16605','tmdb_id'),
('movie:18747','movie:4933','18747','tmdb_id'),
('movie:17247','movie:4934','17247','tmdb_id'),
('movie:445','movie:4935','445','tmdb_id'),
('movie:1665','movie:4936','1665','tmdb_id'),
('movie:1622','movie:4937','1622','tmdb_id'),
('movie:7483','movie:4938','7483','tmdb_id'),
('movie:1951','movie:4939','1951','tmdb_id'),
('movie:15702','movie:4940','15702','tmdb_id'),
('movie:126300','movie:4941','126300','tmdb_id'),
('movie:57425','movie:4942','57425','tmdb_id'),
('movie:101908','movie:4943','101908','tmdb_id'),
('movie:11554','movie:4944','11554','tmdb_id'),
('movie:8053','movie:4945','8053','tmdb_id'),
('movie:43420','movie:4946','43420','tmdb_id'),
('movie:240647','movie:4947','240647','tmdb_id'),
('movie:7870','movie:4948','7870','tmdb_id'),
('movie:8443','movie:4949','8443','tmdb_id'),
('movie:85550','movie:4950','85550','tmdb_id'),
('movie:64509','movie:4951','64509','tmdb_id'),
('movie:49256','movie:4952','49256','tmdb_id'),
('movie:1963','movie:4953','1963','tmdb_id'),
('movie:95801','movie:4954','95801','tmdb_id'),
('movie:9729','movie:4955','9729','tmdb_id'),
('movie:240646','movie:4956','240646','tmdb_id'),
('movie:2566','movie:4957','2566','tmdb_id'),
('movie:83221','movie:4958','83221','tmdb_id'),
('movie:73129','movie:4959','73129','tmdb_id'),
('movie:36637','movie:4960','36637','tmdb_id'),
('movie:9517','movie:4961','9517','tmdb_id'),
('movie:5177','movie:4962','5177','tmdb_id'),
('movie:123690','movie:4963','123690','tmdb_id'),
('movie:110305','movie:4964','110305','tmdb_id'),
('movie:60278','movie:4965','60278','tmdb_id'),
('movie:99963','movie:4966','99963','tmdb_id'),
('movie:46098','movie:4967','46098','tmdb_id'),
('movie:203746','movie:4968','203746','tmdb_id'),
('movie:43772','movie:4969','43772','tmdb_id'),
('movie:9025','movie:4970','9025','tmdb_id'),
('movie:203745','movie:4971','203745','tmdb_id'),
('movie:25650','movie:4972','25650','tmdb_id'),
('movie:35824','movie:4973','35824','tmdb_id'),
('movie:9081','movie:4974','9081','tmdb_id'),
('movie:522612','movie:4975','522612','tmdb_id'),
('movie:103692','movie:4976','103692','tmdb_id'),
('movie:59858','movie:4977','59858','tmdb_id'),
('movie:89800','movie:4978','89800','tmdb_id'),
('movie:200989','movie:4979','200989','tmdb_id'),
('movie:68569','movie:4980','68569','tmdb_id'),
('movie:374586','movie:4981','374586','tmdb_id'),
('movie:35337','movie:4982','35337','tmdb_id'),
('movie:53482','movie:4983','53482','tmdb_id'),
('movie:35651','movie:4984','35651','tmdb_id'),
('movie:44517','movie:4985','44517','tmdb_id'),
('movie:27142','movie:4986','27142','tmdb_id'),
('movie:17734','movie:4987','17734','tmdb_id'),
('movie:67384','movie:4988','67384','tmdb_id'),
('movie:208583','movie:4989','208583','tmdb_id'),
('movie:116034','movie:4990','116034','tmdb_id'),
('movie:47855','movie:4991','47855','tmdb_id'),
('movie:49915','movie:4992','49915','tmdb_id'),
('movie:77873','movie:4993','77873','tmdb_id'),
('movie:1360','movie:4994','1360','tmdb_id'),
('movie:10630','movie:4995','10630','tmdb_id'),
('movie:64523','movie:4996','64523','tmdb_id'),
('movie:154146','movie:4997','154146','tmdb_id'),
('movie:22016','movie:4998','22016','tmdb_id'),
('movie:26955','movie:4999','26955','tmdb_id'),
('movie:121036','movie:5000','121036','tmdb_id'),
('movie:203738','movie:5001','203738','tmdb_id'),
('movie:64389','movie:5002','64389','tmdb_id'),
('movie:1740','movie:5003','1740','tmdb_id'),
('movie:82832','movie:5004','82832','tmdb_id'),
('movie:7090','movie:5005','7090','tmdb_id'),
('movie:13439','movie:5006','13439','tmdb_id'),
('movie:15186','movie:5007','15186','tmdb_id'),
('movie:61665','movie:5008','61665','tmdb_id'),
('movie:101564','movie:5009','101564','tmdb_id'),
('movie:1238980','movie:5010','1238980','tmdb_id'),
('movie:164635','movie:5011','164635','tmdb_id'),
('movie:101569','movie:5012','101569','tmdb_id'),
('movie:74660','movie:5013','74660','tmdb_id'),
('movie:604159','movie:5014','604159','tmdb_id'),
('movie:114860','movie:5015','114860','tmdb_id'),
('movie:478401','movie:5016','478401','tmdb_id'),
('movie:33431','movie:5017','33431','tmdb_id'),
('movie:45044','movie:5018','45044','tmdb_id'),
('movie:272879','movie:5019','272879','tmdb_id'),
('movie:292533','movie:5020','292533','tmdb_id'),
('movie:83277','movie:5021','83277','tmdb_id'),
('movie:61952','movie:5022','61952','tmdb_id'),
('movie:2577','movie:5023','2577','tmdb_id'),
('movie:34036','movie:5024','34036','tmdb_id'),
('movie:30735','movie:5025','30735','tmdb_id'),
('movie:56616','movie:5026','56616','tmdb_id'),
('movie:154155','movie:5027','154155','tmdb_id'),
('movie:18461','movie:5028','18461','tmdb_id'),
('movie:50900','movie:5029','50900','tmdb_id'),
('movie:6317','movie:5030','6317','tmdb_id'),
('movie:24164','movie:5031','24164','tmdb_id'),
('movie:44086','movie:5032','44086','tmdb_id'),
('movie:36401','movie:5033','36401','tmdb_id'),
('movie:112183','movie:5034','112183','tmdb_id'),
('movie:26636','movie:5035','26636','tmdb_id'),
('movie:95536','movie:5036','95536','tmdb_id'),
('movie:95728','movie:5037','95728','tmdb_id'),
('movie:38244','movie:5038','38244','tmdb_id'),
('movie:90838','movie:5039','90838','tmdb_id'),
('movie:336802','movie:5040','336802','tmdb_id'),
('movie:77562','movie:5041','77562','tmdb_id'),
('movie:59062','movie:5042','59062','tmdb_id'),
('movie:961208','movie:5043','961208','tmdb_id'),
('movie:174702','movie:5044','174702','tmdb_id'),
('movie:84739','movie:5045','84739','tmdb_id'),
('movie:257740','movie:5046','257740','tmdb_id'),
('movie:11606','movie:5047','11606','tmdb_id'),
('movie:37232','movie:5048','37232','tmdb_id'),
('movie:56946','movie:5049','56946','tmdb_id'),
('movie:12456','movie:5050','12456','tmdb_id'),
('movie:14198','movie:5051','14198','tmdb_id'),
('movie:12580','movie:5052','12580','tmdb_id'),
('movie:331629','movie:5053','331629','tmdb_id'),
('movie:79767','movie:5054','79767','tmdb_id'),
('movie:1925','movie:5055','1925','tmdb_id'),
('movie:41865','movie:5056','41865','tmdb_id'),
('movie:350089','movie:5057','350089','tmdb_id'),
('movie:58531','movie:5058','58531','tmdb_id'),
('movie:213489','movie:5059','213489','tmdb_id'),
('movie:274974','movie:5060','274974','tmdb_id'),
('movie:178469','movie:5061','178469','tmdb_id'),
('movie:11171','movie:5062','11171','tmdb_id'),
('movie:116550','movie:5063','116550','tmdb_id'),
('movie:36215','movie:5064','36215','tmdb_id'),
('movie:241413','movie:5065','241413','tmdb_id'),
('movie:65513','movie:5066','65513','tmdb_id'),
('movie:1280','movie:5067','1280','tmdb_id'),
('movie:4974','movie:5068','4974','tmdb_id'),
('movie:52512','movie:5069','52512','tmdb_id'),
('movie:1595','movie:5070','1595','tmdb_id'),
('movie:57626','movie:5071','57626','tmdb_id'),
('movie:13073','movie:5072','13073','tmdb_id'),
('movie:44524','movie:5073','44524','tmdb_id'),
('movie:42420','movie:5074','42420','tmdb_id'),
('movie:41292','movie:5075','41292','tmdb_id'),
('movie:48870','movie:5076','48870','tmdb_id'),
('movie:47143','movie:5077','47143','tmdb_id'),
('movie:11632','movie:5078','11632','tmdb_id'),
('movie:95307','movie:5079','95307','tmdb_id'),
('movie:48590','movie:5080','48590','tmdb_id'),
('movie:57113','movie:5081','57113','tmdb_id'),
('movie:191608','movie:5082','191608','tmdb_id'),
('movie:4550','movie:5083','4550','tmdb_id'),
('movie:62487','movie:5084','62487','tmdb_id'),
('movie:129937','movie:5085','129937','tmdb_id'),
('movie:32687','movie:5086','32687','tmdb_id'),
('movie:56994','movie:5087','56994','tmdb_id'),
('movie:45126','movie:5088','45126','tmdb_id'),
('movie:18219','movie:5089','18219','tmdb_id'),
('movie:13994','movie:5090','13994','tmdb_id'),
('movie:20347','movie:5091','20347','tmdb_id'),
('movie:64942','movie:5092','64942','tmdb_id'),
('movie:203611','movie:5093','203611','tmdb_id'),
('movie:1540','movie:5094','1540','tmdb_id'),
('movie:11225','movie:5095','11225','tmdb_id'),
('movie:975546','movie:5096','975546','tmdb_id'),
('movie:175678','movie:5097','175678','tmdb_id'),
('movie:34787','movie:5098','34787','tmdb_id'),
('movie:148','movie:5099','148','tmdb_id'),
('movie:105766','movie:5100','105766','tmdb_id'),
('movie:340','movie:5101','340','tmdb_id'),
('movie:25530','movie:5102','25530','tmdb_id'),
('movie:128268','movie:5103','128268','tmdb_id'),
('movie:418771','movie:5104','418771','tmdb_id'),
('movie:63290','movie:5105','63290','tmdb_id'),
('movie:40859','movie:5106','40859','tmdb_id'),
('movie:550803','movie:5107','550803','tmdb_id'),
('movie:8410','movie:5108','8410','tmdb_id'),
('movie:188505','movie:5109','188505','tmdb_id'),
('movie:570','movie:5110','570','tmdb_id'),
('movie:307093','movie:5111','307093','tmdb_id'),
('movie:44704','movie:5112','44704','tmdb_id'),
('movie:24664','movie:5113','24664','tmdb_id'),
('movie:125803','movie:5114','125803','tmdb_id'),
('movie:711','movie:5115','711','tmdb_id'),
('movie:76547','movie:5116','76547','tmdb_id'),
('movie:58429','movie:5117','58429','tmdb_id'),
('movie:23550','movie:5118','23550','tmdb_id'),
('movie:78123','movie:5119','78123','tmdb_id'),
('movie:68494','movie:5120','68494','tmdb_id'),
('movie:49973','movie:5121','49973','tmdb_id'),
('movie:44853','movie:5122','44853','tmdb_id'),
('movie:12659','movie:5123','12659','tmdb_id'),
('movie:2575','movie:5124','2575','tmdb_id'),
('movie:11845','movie:5125','11845','tmdb_id'),
('movie:26976','movie:5126','26976','tmdb_id'),
('movie:168819','movie:5127','168819','tmdb_id'),
('movie:9097','movie:5128','9097','tmdb_id'),
('movie:9045','movie:5129','9045','tmdb_id'),
('movie:156635','movie:5130','156635','tmdb_id'),
('movie:112','movie:5131','112','tmdb_id'),
('movie:49145','movie:5132','49145','tmdb_id'),
('movie:60109','movie:5133','60109','tmdb_id'),
('movie:85388','movie:5134','85388','tmdb_id'),
('movie:10575','movie:5135','10575','tmdb_id'),
('movie:316','movie:5136','316','tmdb_id'),
('movie:4107','movie:5137','4107','tmdb_id'),
('movie:48212','movie:5138','48212','tmdb_id'),
('movie:25649','movie:5139','25649','tmdb_id'),
('movie:70443','movie:5140','70443','tmdb_id'),
('movie:28204','movie:5141','28204','tmdb_id'),
('movie:3983','movie:5142','3983','tmdb_id'),
('movie:49696','movie:5143','49696','tmdb_id'),
('movie:263069','movie:5144','263069','tmdb_id'),
('movie:123825','movie:5145','123825','tmdb_id'),
('movie:34595','movie:5146','34595','tmdb_id'),
('movie:4912','movie:5147','4912','tmdb_id'),
('movie:25300','movie:5148','25300','tmdb_id'),
('movie:1429','movie:5149','1429','tmdb_id'),
('movie:10717','movie:5150','10717','tmdb_id'),
('movie:21896','movie:5151','21896','tmdb_id'),
('movie:446','movie:5152','446','tmdb_id'),
('movie:10930','movie:5153','10930','tmdb_id'),
('movie:86544','movie:5154','86544','tmdb_id'),
('movie:47499','movie:5155','47499','tmdb_id'),
('movie:20','movie:5156','20','tmdb_id'),
('movie:78208','movie:5157','78208','tmdb_id'),
('movie:11615','movie:5158','11615','tmdb_id'),
('movie:11492','movie:5159','11492','tmdb_id'),
('movie:76275','movie:5160','76275','tmdb_id'),
('movie:1404','movie:5161','1404','tmdb_id'),
('movie:79346','movie:5162','79346','tmdb_id'),
('movie:144870','movie:5163','144870','tmdb_id'),
('movie:21200','movie:5164','21200','tmdb_id'),
('movie:107940','movie:5165','107940','tmdb_id'),
('movie:49681','movie:5166','49681','tmdb_id'),
('movie:167074','movie:5167','167074','tmdb_id'),
('movie:33294','movie:5168','33294','tmdb_id'),
('movie:25500','movie:5169','25500','tmdb_id'),
('movie:11099','movie:5170','11099','tmdb_id'),
('movie:62495','movie:5171','62495','tmdb_id'),
('movie:12146','movie:5172','12146','tmdb_id'),
('movie:25157','movie:5173','25157','tmdb_id'),
('movie:73634','movie:5174','73634','tmdb_id'),
('movie:65041','movie:5175','65041','tmdb_id'),
('movie:1279','movie:5176','1279','tmdb_id'),
('movie:15822','movie:5177','15822','tmdb_id'),
('movie:1901','movie:5178','1901','tmdb_id'),
('movie:24461','movie:5179','24461','tmdb_id'),
('movie:41508','movie:5180','41508','tmdb_id'),
('movie:34019','movie:5181','34019','tmdb_id'),
('movie:11728','movie:5182','11728','tmdb_id'),
('movie:54012','movie:5183','54012','tmdb_id'),
('movie:126433','movie:5184','126433','tmdb_id'),
('movie:38021','movie:5185','38021','tmdb_id'),
('movie:63275','movie:5186','63275','tmdb_id'),
('movie:10087','movie:5187','10087','tmdb_id'),
('movie:1115','movie:5188','1115','tmdb_id'),
('movie:1546','movie:5189','1546','tmdb_id'),
('movie:9047','movie:5190','9047','tmdb_id'),
('movie:16374','movie:5191','16374','tmdb_id'),
('movie:79706','movie:5192','79706','tmdb_id'),
('movie:36253','movie:5193','36253','tmdb_id'),
('movie:19666','movie:5194','19666','tmdb_id'),
('movie:11197','movie:5195','11197','tmdb_id'),
('movie:4464','movie:5196','4464','tmdb_id'),
('movie:58886','movie:5197','58886','tmdb_id'),
('movie:50314','movie:5198','50314','tmdb_id'),
('movie:31875','movie:5199','31875','tmdb_id'),
('movie:1392','movie:5200','1392','tmdb_id'),
('movie:23305','movie:5201','23305','tmdb_id'),
('movie:47943','movie:5202','47943','tmdb_id'),
('movie:10401','movie:5203','10401','tmdb_id'),
('movie:15917','movie:5204','15917','tmdb_id'),
('movie:6934','movie:5205','6934','tmdb_id'),
('movie:140','movie:5206','140','tmdb_id'),
('movie:8871','movie:5207','8871','tmdb_id'),
('movie:45943','movie:5208','45943','tmdb_id'),
('movie:55372','movie:5209','55372','tmdb_id'),
('movie:49685','movie:5210','49685','tmdb_id'),
('movie:24166','movie:5211','24166','tmdb_id'),
('movie:49680','movie:5212','49680','tmdb_id'),
('movie:47123','movie:5213','47123','tmdb_id'),
('movie:58169','movie:5214','58169','tmdb_id'),
('movie:27324','movie:5215','27324','tmdb_id'),
('movie:27062','movie:5216','27062','tmdb_id'),
('movie:327042','movie:5217','327042','tmdb_id'),
('movie:35172','movie:5218','35172','tmdb_id'),
('movie:16646','movie:5219','16646','tmdb_id'),
('movie:44768','movie:5220','44768','tmdb_id'),
('movie:27744','movie:5221','27744','tmdb_id'),
('movie:129185','movie:5222','129185','tmdb_id'),
('movie:13438','movie:5223','13438','tmdb_id'),
('movie:25461','movie:5224','25461','tmdb_id'),
('movie:48778','movie:5225','48778','tmdb_id'),
('movie:23676','movie:5226','23676','tmdb_id'),
('movie:43969','movie:5227','43969','tmdb_id'),
('movie:44513','movie:5228','44513','tmdb_id'),
('movie:28171','movie:5229','28171','tmdb_id'),
('movie:126108','movie:5230','126108','tmdb_id'),
('movie:130268','movie:5231','130268','tmdb_id'),
('movie:36281','movie:5232','36281','tmdb_id'),
('movie:259066','movie:5233','259066','tmdb_id'),
('movie:670','movie:5234','670','tmdb_id'),
('movie:11534','movie:5235','11534','tmdb_id'),
('movie:100156','movie:5236','100156','tmdb_id'),
('movie:3097','movie:5237','3097','tmdb_id'),
('movie:7276','movie:5238','7276','tmdb_id'),
('movie:47200','movie:5239','47200','tmdb_id'),
('movie:193314','movie:5240','193314','tmdb_id'),
('movie:38304','movie:5241','38304','tmdb_id'),
('movie:13512','movie:5242','13512','tmdb_id'),
('movie:123450','movie:5243','123450','tmdb_id'),
('movie:87481','movie:5244','87481','tmdb_id'),
('movie:72996','movie:5245','72996','tmdb_id'),
('movie:61485','movie:5246','61485','tmdb_id'),
('movie:255294','movie:5247','255294','tmdb_id'),
('movie:54633','movie:5248','54633','tmdb_id'),
('movie:9483','movie:5249','9483','tmdb_id'),
('movie:200002','movie:5250','200002','tmdb_id'),
('movie:61814','movie:5251','61814','tmdb_id'),
('movie:62272','movie:5252','62272','tmdb_id'),
('movie:420710','movie:5253','420710','tmdb_id'),
('movie:502928','movie:5254','502928','tmdb_id'),
('movie:177152','movie:5255','177152','tmdb_id'),
('movie:47293','movie:5256','47293','tmdb_id'),
('movie:98020','movie:5257','98020','tmdb_id'),
('movie:43973','movie:5258','43973','tmdb_id'),
('movie:2440','movie:5259','2440','tmdb_id'),
('movie:47844','movie:5260','47844','tmdb_id'),
('movie:41714','movie:5261','41714','tmdb_id'),
('movie:299285','movie:5262','299285','tmdb_id'),
('movie:37952','movie:5263','37952','tmdb_id'),
('movie:16635','movie:5264','16635','tmdb_id'),
('movie:99735','movie:5265','99735','tmdb_id'),
('movie:26779','movie:5266','26779','tmdb_id'),
('movie:125936','movie:5267','125936','tmdb_id'),
('movie:342697','movie:5268','342697','tmdb_id'),
('movie:52251','movie:5269','52251','tmdb_id'),
('movie:61686','movie:5270','61686','tmdb_id'),
('movie:99333','movie:5271','99333','tmdb_id'),
('movie:84848','movie:5272','84848','tmdb_id'),
('movie:95240','movie:5273','95240','tmdb_id'),
('movie:20021','movie:5274','20021','tmdb_id'),
('movie:99637','movie:5275','99637','tmdb_id'),
('movie:389486','movie:5276','389486','tmdb_id'),
('movie:82824','movie:5277','82824','tmdb_id'),
('movie:203723','movie:5278','203723','tmdb_id'),
('movie:98246','movie:5279','98246','tmdb_id'),
('movie:62415','movie:5280','62415','tmdb_id'),
('movie:385138','movie:5281','385138','tmdb_id')
) as expected(provider_key,work_key,tmdb_id,metadata_field)
  left join public.media_provider_links p on p.provider_key=expected.provider_key
  left join public.media_catalogue c on c.work_key=expected.work_key
  where (p.work_key is not null and p.work_key<>expected.work_key)
     or (c.work_key is not null and (c.work_type<>'movie' or (c.metadata->>expected.metadata_field) is distinct from expected.tmdb_id))
 ) then raise exception 'An award provider identity already points to a different work. Reconcile it before deployment.'; end if;
end $$;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4683','movie',4683,'{"id":4683,"title":"Crouching Tiger, Hidden Dragon","director":"Ang Lee","year":2000,"tmdb_id":146,"imdb_id":"tt0190332","original_title":"卧虎藏龍","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4684','movie',4684,'{"id":4684,"title":"Traffic","director":"Steven Soderbergh","year":2000,"tmdb_id":1900,"imdb_id":"tt0181865","original_title":"Traffic","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4685','movie',4685,'{"id":4685,"title":"Before Night Falls","director":"Julian Schnabel","year":2000,"tmdb_id":5001,"imdb_id":"tt0247196","original_title":"Before Night Falls","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4686','movie',4686,'{"id":4686,"title":"Cast Away","director":"Robert Zemeckis","year":2000,"tmdb_id":8358,"imdb_id":"tt0162222","original_title":"Cast Away","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4687','movie',4687,'{"id":4687,"title":"Pollock","director":"Ed Harris","year":2000,"tmdb_id":12509,"imdb_id":"tt0183659","original_title":"Pollock","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4688','movie',4688,'{"id":4688,"title":"Quills","director":"Philip Kaufman","year":2000,"tmdb_id":10876,"imdb_id":"tt0180073","original_title":"Quills","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4689','movie',4689,'{"id":4689,"title":"The Contender","director":"Rod Lurie","year":2000,"tmdb_id":6521,"imdb_id":"tt0208874","original_title":"The Contender","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4690','movie',4690,'{"id":4690,"title":"You Can Count on Me","director":"Kenneth Lonergan","year":2000,"tmdb_id":14295,"imdb_id":"tt0203230","original_title":"You Can Count on Me","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4691','movie',4691,'{"id":4691,"title":"Wonder Boys","director":"Curtis Hanson","year":2000,"tmdb_id":11004,"imdb_id":"tt0185014","original_title":"Wonder Boys","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4692','movie',4692,'{"id":4692,"title":"Shadow of the Vampire","director":"E. Elias Merhige","year":2000,"tmdb_id":10873,"imdb_id":"tt0189998","original_title":"Shadow of the Vampire","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4693','movie',4693,'{"id":4693,"title":"The Taste of Others","director":"Agnès Jaoui","year":2000,"tmdb_id":10697,"imdb_id":"tt0216787","original_title":"Le Goût des autres","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4694','movie',4694,'{"id":4694,"title":"Into the Arms of Strangers: Stories of the Kindertransport","director":"Mark Jonathan Harris","year":2000,"tmdb_id":58062,"imdb_id":"tt0248912","original_title":"Into the Arms of Strangers: Stories of the Kindertransport","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4695','movie',4695,'{"id":4695,"title":"Long Night''s Journey into Day","director":"Deborah Hoffmann, Frances Reid","year":2000,"tmdb_id":95682,"imdb_id":"tt0236447","original_title":"Long Night''s Journey into Day","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4696','movie',4696,'{"id":4696,"title":"Scottsboro: An American Tragedy","director":"Barak Goodman","year":2000,"tmdb_id":70564,"imdb_id":"tt0240885","original_title":"Scottsboro: An American Tragedy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4697','movie',4697,'{"id":4697,"title":"Sound and Fury","director":"Josh Aronson","year":2000,"tmdb_id":62529,"imdb_id":"tt0240912","original_title":"Sound and Fury","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4698','movie',4698,'{"id":4698,"title":"In the Bedroom","director":"Todd Field","year":2001,"tmdb_id":1999,"imdb_id":"tt0247425","original_title":"In the Bedroom","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4699','movie',4699,'{"id":4699,"title":"Divided We Fall","director":"Jan Hřebejk","year":2000,"tmdb_id":29937,"imdb_id":"tt0234288","original_title":"Musíme si pomáhat","original_language":"cs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4700','movie',4700,'{"id":4700,"title":"I Am Sam","director":"Jessie Nelson","year":2001,"tmdb_id":10950,"imdb_id":"tt0277027","original_title":"I Am Sam","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4701','movie',4701,'{"id":4701,"title":"Ali","director":"Michael Mann","year":2001,"tmdb_id":8489,"imdb_id":"tt0248667","original_title":"Ali","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4702','movie',4702,'{"id":4702,"title":"Moulin Rouge!","director":"Baz Luhrmann","year":2001,"tmdb_id":824,"imdb_id":"tt0203009","original_title":"Moulin Rouge!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4703','movie',4703,'{"id":4703,"title":"Monster''s Ball","director":"Marc Forster","year":2001,"tmdb_id":1365,"imdb_id":"tt0285742","original_title":"Monster''s Ball","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4704','movie',4704,'{"id":4704,"title":"Iris","director":"Richard Eyre","year":2001,"tmdb_id":11889,"imdb_id":"tt0280778","original_title":"Iris","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4705','movie',4705,'{"id":4705,"title":"Sexy Beast","director":"Jonathan Glazer","year":2001,"tmdb_id":11826,"imdb_id":"tt0203119","original_title":"Sexy Beast","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4706','movie',4706,'{"id":4706,"title":"Son of the Bride","director":"Juan José Campanella","year":2001,"tmdb_id":19460,"imdb_id":"tt0292542","original_title":"El hijo de la novia","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4707','movie',4707,'{"id":4707,"title":"Murder on a Sunday Morning","director":"Jean-Xavier de Lestrade","year":2001,"tmdb_id":51391,"imdb_id":"tt0307197","original_title":"Un coupable idéal","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4708','movie',4708,'{"id":4708,"title":"No Man''s Land","director":"Danis Tanović","year":2001,"tmdb_id":8342,"imdb_id":"tt0283509","original_title":"No Man''s Land","original_language":"bs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4709','movie',4709,'{"id":4709,"title":"Children Underground","director":"Edet Belzberg","year":2001,"tmdb_id":51722,"imdb_id":"tt0264476","original_title":"Children Underground","original_language":"ro","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4710','movie',4710,'{"id":4710,"title":"Promises","director":"Carlos Bolado, Justine Shapiro, B. Z. Goldberg","year":2001,"tmdb_id":38880,"imdb_id":"tt0282864","original_title":"Promises","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4711','movie',4711,'{"id":4711,"title":"LaLee''s Kin: The Legacy of Cotton","director":"Deborah Dickson, Susan Froemke, Albert Maysles","year":2001,"tmdb_id":112906,"imdb_id":"tt0274622","original_title":"LaLee''s Kin: The Legacy of Cotton","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4712','movie',4712,'{"id":4712,"title":"War Photographer","director":"Christian Frei","year":2001,"tmdb_id":12722,"imdb_id":"tt0309061","original_title":"War Photographer","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4713','movie',4713,'{"id":4713,"title":"Jimmy Neutron: Boy Genius","director":"John A. Davis","year":2001,"tmdb_id":12589,"imdb_id":"tt0268397","original_title":"Jimmy Neutron: Boy Genius","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4714','movie',4714,'{"id":4714,"title":"The Hours","director":"Stephen Daldry","year":2002,"tmdb_id":590,"imdb_id":"tt0274558","original_title":"The Hours","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4715','movie',4715,'{"id":4715,"title":"Talk to Her","director":"Pedro Almodóvar","year":2002,"tmdb_id":64,"imdb_id":"tt0287467","original_title":"Hable con ella","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4716','movie',4716,'{"id":4716,"title":"Chicago","director":"Rob Marshall","year":2002,"tmdb_id":1574,"imdb_id":"tt0299658","original_title":"Chicago","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4717','movie',4717,'{"id":4717,"title":"The Quiet American","director":"Phillip Noyce","year":2002,"tmdb_id":8198,"imdb_id":"tt0258068","original_title":"The Quiet American","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4718','movie',4718,'{"id":4718,"title":"About Schmidt","director":"Alexander Payne","year":2002,"tmdb_id":2755,"imdb_id":"tt0257360","original_title":"About Schmidt","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4719','movie',4719,'{"id":4719,"title":"Elling","director":"Petter Næss","year":2001,"tmdb_id":6007,"imdb_id":"tt0279064","original_title":"Elling","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4720','movie',4720,'{"id":4720,"title":"Unfaithful","director":"Adrian Lyne","year":2002,"tmdb_id":2251,"imdb_id":"tt0250797","original_title":"Unfaithful","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4721','movie',4721,'{"id":4721,"title":"Far from Heaven","director":"Todd Haynes","year":2002,"tmdb_id":10712,"imdb_id":"tt0297884","original_title":"Far from Heaven","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4722','movie',4722,'{"id":4722,"title":"About a Boy","director":"Chris Weitz, Paul Weitz","year":2002,"tmdb_id":245,"imdb_id":"tt0276751","original_title":"About a Boy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4723','movie',4723,'{"id":4723,"title":"Nowhere in Africa","director":"Caroline Link","year":2001,"tmdb_id":1591,"imdb_id":"tt0161860","original_title":"Nirgendwo in Afrika","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4724','movie',4724,'{"id":4724,"title":"Y Tu Mamá También","director":"Alfonso Cuarón","year":2001,"tmdb_id":1391,"imdb_id":"tt0245574","original_title":"Y tu mamá también","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4725','movie',4725,'{"id":4725,"title":"The Crime of Padre Amaro","director":"Carlos Carrera","year":2002,"tmdb_id":542,"imdb_id":"tt0313196","original_title":"El crimen del padre Amaro","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4726','movie',4726,'{"id":4726,"title":"The Man Without a Past","director":"Aki Kaurismäki","year":2002,"tmdb_id":7294,"imdb_id":"tt0311519","original_title":"Mies vailla menneisyyttä","original_language":"fi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4727','movie',4727,'{"id":4727,"title":"Zus & Zo","director":"Paula van der Oest","year":2002,"tmdb_id":16539,"imdb_id":"tt0245157","original_title":"Zus & zo","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4728','movie',4728,'{"id":4728,"title":"Prisoner of Paradise","director":"Stuart Sender, Malcolm Clarke","year":2003,"tmdb_id":112902,"imdb_id":"tt0316013","original_title":"Prisoner of Paradise","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4729','movie',4729,'{"id":4729,"title":"Daughter from Danang","director":"Gail Dolgin, Vicente Franco","year":2002,"tmdb_id":67232,"imdb_id":"tt0303281","original_title":"Daughter from Danang","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4730','movie',4730,'{"id":4730,"title":"Winged Migration","director":"Jacques Perrin","year":2001,"tmdb_id":11516,"imdb_id":"tt0301727","original_title":"Le Peuple migrateur","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4731','movie',4731,'{"id":4731,"title":"Bowling for Columbine","director":"Michael Moore","year":2002,"tmdb_id":1430,"imdb_id":"tt0310793","original_title":"Bowling for Columbine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4732','movie',4732,'{"id":4732,"title":"Master and Commander: The Far Side of the World","director":"Peter Weir","year":2003,"tmdb_id":8619,"imdb_id":"tt0311113","original_title":"Master and Commander: The Far Side of the World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4733','movie',4733,'{"id":4733,"title":"City of God","director":"Fernando Meirelles","year":2002,"tmdb_id":598,"imdb_id":"tt0317248","original_title":"Cidade de Deus","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4734','movie',4734,'{"id":4734,"title":"House of Sand and Fog","director":"Vadim Perelman","year":2003,"tmdb_id":11093,"imdb_id":"tt0315983","original_title":"House of Sand and Fog","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4735','movie',4735,'{"id":4735,"title":"Cold Mountain","director":"Anthony Minghella","year":2003,"tmdb_id":2289,"imdb_id":"tt0159365","original_title":"Cold Mountain","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4736','movie',4736,'{"id":4736,"title":"Monster","director":"Patty Jenkins","year":2003,"tmdb_id":504,"imdb_id":"tt0340855","original_title":"Monster","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4737','movie',4737,'{"id":4737,"title":"Whale Rider","director":"Niki Caro","year":2003,"tmdb_id":1088,"imdb_id":"tt0298228","original_title":"Whale Rider","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4738','movie',4738,'{"id":4738,"title":"Something''s Gotta Give","director":"Nancy Meyers","year":2003,"tmdb_id":6964,"imdb_id":"tt0337741","original_title":"Something''s Gotta Give","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4739','movie',4739,'{"id":4739,"title":"Spellbound","director":"Jeffrey Blitz","year":2002,"tmdb_id":16636,"imdb_id":"tt0334405","original_title":"Spellbound","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4740','movie',4740,'{"id":4740,"title":"In America","director":"Jim Sheridan","year":2003,"tmdb_id":10511,"imdb_id":"tt0298845","original_title":"In America","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4741','movie',4741,'{"id":4741,"title":"Thirteen","director":"Catherine Hardwicke","year":2003,"tmdb_id":11023,"imdb_id":"tt0328538","original_title":"Thirteen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4742','movie',4742,'{"id":4742,"title":"The Barbarian Invasions","director":"Denys Arcand","year":2003,"tmdb_id":11042,"imdb_id":"tt0338135","original_title":"Les invasions barbares","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4743','movie',4743,'{"id":4743,"title":"Dirty Pretty Things","director":"Stephen Frears","year":2002,"tmdb_id":3472,"imdb_id":"tt0301199","original_title":"Dirty Pretty Things","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4744','movie',4744,'{"id":4744,"title":"The Last Samurai","director":"Edward Zwick","year":2003,"tmdb_id":616,"imdb_id":"tt0325710","original_title":"The Last Samurai","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4745','movie',4745,'{"id":4745,"title":"American Splendor","director":"Shari Springer Berman, Robert Pulcini","year":2003,"tmdb_id":2771,"imdb_id":"tt0305206","original_title":"American Splendor","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4746','movie',4746,'{"id":4746,"title":"The Twilight Samurai","director":"Yoji Yamada","year":2002,"tmdb_id":12496,"imdb_id":"tt0351817","original_title":"たそがれ清兵衛","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4747','movie',4747,'{"id":4747,"title":"Twin Sisters","director":"Ben Sombogaart","year":2002,"tmdb_id":16132,"imdb_id":"tt0322674","original_title":"De Tweeling","original_language":"nl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4748','movie',4748,'{"id":4748,"title":"The Cooler","director":"Wayne Kramer","year":2003,"tmdb_id":10744,"imdb_id":"tt0318374","original_title":"The Cooler","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4749','movie',4749,'{"id":4749,"title":"Zelary","director":"Ondřej Trojan","year":2003,"tmdb_id":19765,"imdb_id":"tt0288330","original_title":"Želary","original_language":"cs","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4750','movie',4750,'{"id":4750,"title":"The Fog of War","director":"Errol Morris","year":2003,"tmdb_id":12698,"imdb_id":"tt0317910","original_title":"The Fog of War","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4751','movie',4751,'{"id":4751,"title":"Balseros","director":"Josep Maria Domènech, Carlos Bosch","year":2002,"tmdb_id":27915,"imdb_id":"tt0321376","original_title":"Balseros","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4752','movie',4752,'{"id":4752,"title":"Capturing the Friedmans","director":"Andrew Jarecki","year":2003,"tmdb_id":2260,"imdb_id":"tt0342172","original_title":"Capturing the Friedmans","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4753','movie',4753,'{"id":4753,"title":"Pieces of April","director":"Peter Hedges","year":2003,"tmdb_id":1550,"imdb_id":"tt0311648","original_title":"Pieces of April","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4754','movie',4754,'{"id":4754,"title":"The Weather Underground","director":"Sam Green, Bill Siegel","year":2002,"tmdb_id":14108,"imdb_id":"tt0343168","original_title":"The Weather Underground","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4755','movie',4755,'{"id":4755,"title":"Brother Bear","director":"Aaron Blaise, Robert Walker","year":2003,"tmdb_id":10009,"imdb_id":"tt0328880","original_title":"Brother Bear","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4756','movie',4756,'{"id":4756,"title":"Finding Neverland","director":"Marc Forster","year":2004,"tmdb_id":866,"imdb_id":"tt0308644","original_title":"Finding Neverland","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4757','movie',4757,'{"id":4757,"title":"Sideways","director":"Alexander Payne","year":2004,"tmdb_id":9675,"imdb_id":"tt0375063","original_title":"Sideways","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4758','movie',4758,'{"id":4758,"title":"Vera Drake","director":"Mike Leigh","year":2004,"tmdb_id":11109,"imdb_id":"tt0383694","original_title":"Vera Drake","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4759','movie',4759,'{"id":4759,"title":"The Triplets of Belleville","director":"Sylvain Chomet","year":2003,"tmdb_id":9662,"imdb_id":"tt0286244","original_title":"Les Triplettes de Belleville","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4760','movie',4760,'{"id":4760,"title":"Ray","director":"Taylor Hackford","year":2004,"tmdb_id":1677,"imdb_id":"tt0350258","original_title":"Ray","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4761','movie',4761,'{"id":4761,"title":"Kinsey","director":"Bill Condon","year":2004,"tmdb_id":11184,"imdb_id":"tt0362269","original_title":"Kinsey","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4762','movie',4762,'{"id":4762,"title":"Being Julia","director":"István Szabó","year":2004,"tmdb_id":18701,"imdb_id":"tt0340012","original_title":"Being Julia","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4763','movie',4763,'{"id":4763,"title":"The Motorcycle Diaries","director":"Walter Salles","year":2004,"tmdb_id":1653,"imdb_id":"tt0318462","original_title":"Diarios de motocicleta","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4764','movie',4764,'{"id":4764,"title":"As It Is in Heaven","director":"Kay Pollak","year":2004,"tmdb_id":464,"imdb_id":"tt0382330","original_title":"Så som i himmelen","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4765','movie',4765,'{"id":4765,"title":"The Sea Inside","director":"Alejandro Amenábar","year":2004,"tmdb_id":1913,"imdb_id":"tt0369702","original_title":"Mar adentro","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4766','movie',4766,'{"id":4766,"title":"Maria Full of Grace","director":"Joshua Marston","year":2004,"tmdb_id":436,"imdb_id":"tt0390221","original_title":"María, llena eres de gracia","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4767','movie',4767,'{"id":4767,"title":"Downfall","director":"Oliver Hirschbiegel","year":2004,"tmdb_id":613,"imdb_id":"tt0363163","original_title":"Der Untergang","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4768','movie',4768,'{"id":4768,"title":"The Story of the Weeping Camel","director":"Byambasuren Davaa, Luigi Falorni","year":2004,"tmdb_id":1114,"imdb_id":"tt0373861","original_title":"Die Geschichte vom weinenden Kamel","original_language":"mn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4769','movie',4769,'{"id":4769,"title":"Collateral","director":"Michael Mann","year":2004,"tmdb_id":1538,"imdb_id":"tt0369339","original_title":"Collateral","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4770','movie',4770,'{"id":4770,"title":"Twist of Faith","director":"Kirby Dick","year":2004,"tmdb_id":34581,"imdb_id":"tt0436857","original_title":"Twist of Faith","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4771','movie',4771,'{"id":4771,"title":"Super Size Me","director":"Morgan Spurlock","year":2004,"tmdb_id":9372,"imdb_id":"tt0390521","original_title":"Super Size Me","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4772','movie',4772,'{"id":4772,"title":"Tupac: Resurrection","director":"Lauren Lazin","year":2003,"tmdb_id":21525,"imdb_id":"tt0343121","original_title":"Tupac: Resurrection","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4773','movie',4773,'{"id":4773,"title":"The House of Mirth","director":"Terence Davies","year":2000,"tmdb_id":25520,"imdb_id":"tt0200720","original_title":"The House of Mirth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4774','movie',4774,'{"id":4774,"title":"Boys Don''t Cry","director":"Kimberly Peirce","year":1999,"tmdb_id":226,"imdb_id":"tt0171804","original_title":"Boys Don''t Cry","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4775','movie',4775,'{"id":4775,"title":"High Fidelity","director":"Stephen Frears","year":2000,"tmdb_id":243,"imdb_id":"tt0146882","original_title":"High Fidelity","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4776','movie',4776,'{"id":4776,"title":"The Shipping News","director":"Lasse Hallström","year":2001,"tmdb_id":6440,"imdb_id":"tt0120824","original_title":"The Shipping News","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4777','movie',4777,'{"id":4777,"title":"Me Without You","director":"Sandra Goldbacher","year":2001,"tmdb_id":26290,"imdb_id":"tt0263725","original_title":"Me Without You","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4778','movie',4778,'{"id":4778,"title":"The Piano Teacher","director":"Michael Haneke","year":2001,"tmdb_id":1791,"imdb_id":"tt0254686","original_title":"La Pianiste","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4779','movie',4779,'{"id":4779,"title":"Monsoon Wedding","director":"Mira Nair","year":2001,"tmdb_id":480,"imdb_id":"tt0265343","original_title":"Monsoon Wedding","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4780','movie',4780,'{"id":4780,"title":"Behind the Sun","director":"Walter Salles","year":2001,"tmdb_id":36093,"imdb_id":"tt0291003","original_title":"Abril Despedaçado","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4781','movie',4781,'{"id":4781,"title":"The Magdalene Sisters","director":"Peter Mullan","year":2002,"tmdb_id":8094,"imdb_id":"tt0318411","original_title":"The Magdalene Sisters","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4782','movie',4782,'{"id":4782,"title":"Big Fish","director":"Tim Burton","year":2003,"tmdb_id":587,"imdb_id":"tt0319061","original_title":"Big Fish","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4783','movie',4783,'{"id":4783,"title":"Touching the Void","director":"Kevin Macdonald","year":2003,"tmdb_id":11194,"imdb_id":"tt0379557","original_title":"Touching the Void","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4784','movie',4784,'{"id":4784,"title":"Bend It Like Beckham","director":"Gurinder Chadha","year":2002,"tmdb_id":455,"imdb_id":"tt0286499","original_title":"Bend It Like Beckham","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4785','movie',4785,'{"id":4785,"title":"The Mother","director":"Roger Michell","year":2003,"tmdb_id":59210,"imdb_id":"tt0323298","original_title":"The Mother","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4786','movie',4786,'{"id":4786,"title":"Girl with a Pearl Earring","director":"Peter Webber","year":2003,"tmdb_id":3635,"imdb_id":"tt0335119","original_title":"Girl with a Pearl Earring","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4787','movie',4787,'{"id":4787,"title":"In This World","director":"Michael Winterbottom","year":2003,"tmdb_id":36791,"imdb_id":"tt0310154","original_title":"In This World","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4788','movie',4788,'{"id":4788,"title":"Good Bye, Lenin!","director":"Wolfgang Becker","year":2003,"tmdb_id":338,"imdb_id":"tt0301357","original_title":"Good Bye, Lenin!","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4789','movie',4789,'{"id":4789,"title":"My Summer of Love","director":"Paweł Pawlikowski","year":2005,"tmdb_id":9709,"imdb_id":"tt0382189","original_title":"My Summer of Love","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4790','movie',4790,'{"id":4790,"title":"Dead Man''s Shoes","director":"Shane Meadows","year":2004,"tmdb_id":12877,"imdb_id":"tt0419677","original_title":"Dead Man''s Shoes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4791','movie',4791,'{"id":4791,"title":"To Be and to Have","director":"Nicolas Philibert","year":2002,"tmdb_id":5168,"imdb_id":"tt0318202","original_title":"Être et avoir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4792','movie',4792,'{"id":4792,"title":"The Manchurian Candidate","director":"Jonathan Demme","year":2004,"tmdb_id":14462,"imdb_id":"tt0368008","original_title":"The Manchurian Candidate","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4793','movie',4793,'{"id":4793,"title":"Sunshine","director":"István Szabó","year":1999,"tmdb_id":17771,"imdb_id":"tt0145503","original_title":"Sunshine","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4794','movie',4794,'{"id":4794,"title":"Best in Show","director":"Christopher Guest","year":2000,"tmdb_id":13785,"imdb_id":"tt0218839","original_title":"Best in Show","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4795','movie',4795,'{"id":4795,"title":"One Hundred Steps","director":"Marco Tullio Giordana","year":2000,"tmdb_id":29458,"imdb_id":"tt0238891","original_title":"I cento passi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4796','movie',4796,'{"id":4796,"title":"The Widow of Saint-Pierre","director":"Patrice Leconte","year":2000,"tmdb_id":48217,"imdb_id":"tt0191636","original_title":"La Veuve de Saint-Pierre","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4797','movie',4797,'{"id":4797,"title":"Nurse Betty","director":"Neil LaBute","year":2000,"tmdb_id":10480,"imdb_id":"tt0171580","original_title":"Nurse Betty","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4798','movie',4798,'{"id":4798,"title":"Saving Grace","director":"Nigel Cole","year":2000,"tmdb_id":2360,"imdb_id":"tt0195234","original_title":"Saving Grace","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4799','movie',4799,'{"id":4799,"title":"The Deep End","director":"David Siegel, Scott McGehee","year":2001,"tmdb_id":24936,"imdb_id":"tt0250323","original_title":"The Deep End","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4800','movie',4800,'{"id":4800,"title":"Small Time Crooks","director":"Woody Allen","year":2000,"tmdb_id":10569,"imdb_id":"tt0196216","original_title":"Small Time Crooks","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4801','movie',4801,'{"id":4801,"title":"Bandits","director":"Barry Levinson","year":2001,"tmdb_id":3172,"imdb_id":"tt0219965","original_title":"Bandits","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4802','movie',4802,'{"id":4802,"title":"Hedwig and the Angry Inch","director":"John Cameron Mitchell","year":2001,"tmdb_id":13403,"imdb_id":"tt0248845","original_title":"Hedwig and the Angry Inch","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4803','movie',4803,'{"id":4803,"title":"Life as a House","director":"Irwin Winkler","year":2001,"tmdb_id":11457,"imdb_id":"tt0264796","original_title":"Life as a House","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4804','movie',4804,'{"id":4804,"title":"Balzac and the Little Chinese Seamstress","director":"Dai Sijie","year":2002,"tmdb_id":2111,"imdb_id":"tt0291032","original_title":"巴尔扎克与小裁缝","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4805','movie',4805,'{"id":4805,"title":"Nicholas Nickleby","director":"Douglas McGrath","year":2002,"tmdb_id":29339,"imdb_id":"tt0309912","original_title":"Nicholas Nickleby","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4806','movie',4806,'{"id":4806,"title":"Igby Goes Down","director":"Burr Steers","year":2002,"tmdb_id":9685,"imdb_id":"tt0280760","original_title":"Igby Goes Down","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4807','movie',4807,'{"id":4807,"title":"The Banger Sisters","director":"Bob Dolman","year":2002,"tmdb_id":9034,"imdb_id":"tt0280460","original_title":"The Banger Sisters","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4808','movie',4808,'{"id":4808,"title":"Secretary","director":"Steven Shainberg","year":2002,"tmdb_id":11013,"imdb_id":"tt0274812","original_title":"Secretary","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4809','movie',4809,'{"id":4809,"title":"Osama","director":"Siddiq Barmak","year":2004,"tmdb_id":14757,"imdb_id":"tt0368913","original_title":"Osama","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4810','movie',4810,'{"id":4810,"title":"Veronica Guerin","director":"Joel Schumacher","year":2003,"tmdb_id":10629,"imdb_id":"tt0312549","original_title":"Veronica Guerin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4811','movie',4811,'{"id":4811,"title":"Under the Tuscan Sun","director":"Audrey Wells","year":2003,"tmdb_id":10934,"imdb_id":"tt0328589","original_title":"Under the Tuscan Sun","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4812','movie',4812,'{"id":4812,"title":"Monsieur Ibrahim","director":"François Dupeyron","year":2003,"tmdb_id":337,"imdb_id":"tt0329388","original_title":"Monsieur Ibrahim et les Fleurs du Coran","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4813','movie',4813,'{"id":4813,"title":"Calendar Girls","director":"Nigel Cole","year":2003,"tmdb_id":8696,"imdb_id":"tt0337909","original_title":"Calendar Girls","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4814','movie',4814,'{"id":4814,"title":"The School of Rock","director":"Richard Linklater","year":2003,"tmdb_id":1584,"imdb_id":"tt0332379","original_title":"The School of Rock","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4815','movie',4815,'{"id":4815,"title":"Shattered Glass","director":"Billy Ray","year":2003,"tmdb_id":13537,"imdb_id":"tt0323944","original_title":"Shattered Glass","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4816','movie',4816,'{"id":4816,"title":"House of Flying Daggers","director":"Zhang Yimou","year":2004,"tmdb_id":9550,"imdb_id":"tt0385004","original_title":"十面埋伏","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4817','movie',4817,'{"id":4817,"title":"A Very Long Engagement","director":"Jean-Pierre Jeunet","year":2004,"tmdb_id":2841,"imdb_id":"tt0344510","original_title":"Un long dimanche de fiançailles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4818','movie',4818,'{"id":4818,"title":"Birth","director":"Jonathan Glazer","year":2004,"tmdb_id":10740,"imdb_id":"tt0337876","original_title":"Birth","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4819','movie',4819,'{"id":4819,"title":"A Love Song for Bobby Long","director":"Shainee Gabel","year":2004,"tmdb_id":9953,"imdb_id":"tt0369672","original_title":"A Love Song for Bobby Long","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4820','movie',4820,'{"id":4820,"title":"De-Lovely","director":"Irwin Winkler","year":2004,"tmdb_id":15237,"imdb_id":"tt0352277","original_title":"De-Lovely","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4821','movie',4821,'{"id":4821,"title":"Bridget Jones: The Edge of Reason","director":"Beeban Kidron","year":2004,"tmdb_id":9801,"imdb_id":"tt0317198","original_title":"Bridget Jones: The Edge of Reason","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4822','movie',4822,'{"id":4822,"title":"The Chorus","director":"Christophe Barratier","year":2004,"tmdb_id":5528,"imdb_id":"tt0372824","original_title":"Les Choristes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4823','movie',4823,'{"id":4823,"title":"Beyond the Sea","director":"Kevin Spacey","year":2004,"tmdb_id":6478,"imdb_id":"tt0363473","original_title":"Beyond the Sea","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4824','movie',4824,'{"id":4824,"title":"Desert Moon","director":"Shinji Aoyama","year":2001,"tmdb_id":182134,"imdb_id":"tt0283309","original_title":"月の砂漠","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4825','movie',4825,'{"id":4825,"title":"Distance","director":"Hirokazu Kore-eda","year":2001,"tmdb_id":25051,"imdb_id":"tt0278413","original_title":"ディスタンス","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4826','movie',4826,'{"id":4826,"title":"Replay","director":"Catherine Corsini","year":2001,"tmdb_id":47254,"imdb_id":"tt0253612","original_title":"La Répétition","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4827','movie',4827,'{"id":4827,"title":"The Son''s Room","director":"Nanni Moretti","year":2001,"tmdb_id":11447,"imdb_id":"tt0208990","original_title":"La stanza del figlio","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4828','movie',4828,'{"id":4828,"title":"In Praise of Love","director":"Jean-Luc Godard","year":2001,"tmdb_id":52717,"imdb_id":"tt0181912","original_title":"Éloge de l''amour","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4829','movie',4829,'{"id":4829,"title":"Millennium Mambo","director":"Hou Hsiao-hsien","year":2001,"tmdb_id":11553,"imdb_id":"tt0283283","original_title":"千禧曼波","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4830','movie',4830,'{"id":4830,"title":"The Officers'' Ward","director":"François Dupeyron","year":2001,"tmdb_id":64481,"imdb_id":"tt0273148","original_title":"La Chambre des officiers","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4831','movie',4831,'{"id":4831,"title":"Pau and His Brother","director":"Marc Recha","year":2001,"tmdb_id":163650,"imdb_id":"tt0283539","original_title":"Pau i el seu germà","original_language":"ca","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4832','movie',4832,'{"id":4832,"title":"The Profession of Arms","director":"Ermanno Olmi","year":2001,"tmdb_id":56798,"imdb_id":"tt0245276","original_title":"Il mestiere delle armi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4833','movie',4833,'{"id":4833,"title":"The Pledge","director":"Sean Penn","year":2001,"tmdb_id":5955,"imdb_id":"tt0237572","original_title":"The Pledge","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4834','movie',4834,'{"id":4834,"title":"Boyhood Loves","director":"Yves Caumon","year":2001,"tmdb_id":326622,"imdb_id":"tt0284848","original_title":"Amour d''enfance","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4835','movie',4835,'{"id":4835,"title":"Roberto Succo","director":"Cédric Kahn","year":2001,"tmdb_id":82550,"imdb_id":"tt0234041","original_title":"Roberto Succo","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4836','movie',4836,'{"id":4836,"title":"Atanarjuat: The Fast Runner","director":"Zacharias Kunuk","year":2001,"tmdb_id":13245,"imdb_id":"tt0285441","original_title":"ᐊᑕᓈᕐᔪᐊᑦ","original_language":"iu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4837','movie',4837,'{"id":4837,"title":"Carrément à l''ouest","director":"Jacques Doillon","year":2001,"tmdb_id":47297,"imdb_id":"tt0268211","original_title":"Carrément à l''ouest","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4838','movie',4838,'{"id":4838,"title":"Tomorrow","director":"Francesca Archibugi","year":2001,"tmdb_id":307358,"imdb_id":"tt0273544","original_title":"Domani","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4839','movie',4839,'{"id":4839,"title":"Get a Life","director":"João Canijo","year":2001,"tmdb_id":217309,"imdb_id":"tt0284141","original_title":"Ganhar a Vida","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4840','movie',4840,'{"id":4840,"title":"H Story","director":"Nobuhiro Suwa","year":2001,"tmdb_id":125815,"imdb_id":"tt0285166","original_title":"H Story","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4841','movie',4841,'{"id":4841,"title":"Tears of the Black Tiger","director":"Wisit Sasanatieng","year":2001,"tmdb_id":2805,"imdb_id":"tt0269217","original_title":"ฟ้าทะลายโจร","original_language":"th","alternate_titles":["FAH TALAI JONE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4842','movie',4842,'{"id":4842,"title":"Clement","director":"Emmanuelle Bercot","year":2001,"tmdb_id":48601,"imdb_id":"tt0284970","original_title":"Clément","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4843','movie',4843,'{"id":4843,"title":"No Such Thing","director":"Hal Hartley","year":2001,"tmdb_id":29135,"imdb_id":"tt0248190","original_title":"No Such Thing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4844','movie',4844,'{"id":4844,"title":"La libertad","director":"Lisandro Alonso","year":2001,"tmdb_id":94649,"imdb_id":"tt0291310","original_title":"La libertad","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4845','movie',4845,'{"id":4845,"title":"Lovely Rita","director":"Jessica Hausner","year":2001,"tmdb_id":121883,"imdb_id":"tt0228536","original_title":"Lovely Rita","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4846','movie',4846,'{"id":4846,"title":"''R Xmas","director":"Abel Ferrara","year":2001,"tmdb_id":49110,"imdb_id":"tt0217978","original_title":"''R Xmas","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4847','movie',4847,'{"id":4847,"title":"A Dog''s Day","director":"Murali Nair","year":2001,"tmdb_id":125809,"imdb_id":"tt0286887","original_title":"Pattiyude Divasam","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4848','movie',4848,'{"id":4848,"title":"The Words of My Father","director":"Francesca Comencini","year":2001,"tmdb_id":248624,"imdb_id":"tt0285874","original_title":"Le parole di mio padre","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4849','movie',4849,'{"id":4849,"title":"The Anniversary Party","director":"Jennifer Jason Leigh, Alan Cumming","year":2001,"tmdb_id":26475,"imdb_id":"tt0254099","original_title":"The Anniversary Party","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4850','movie',4850,'{"id":4850,"title":"24 Hour Party People","director":"Michael Winterbottom","year":2002,"tmdb_id":2750,"imdb_id":"tt0274309","original_title":"24 Hour Party People","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4851','movie',4851,'{"id":4851,"title":"Storytelling","director":"Todd Solondz","year":2001,"tmdb_id":16550,"imdb_id":"tt0250081","original_title":"Storytelling","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4852','movie',4852,'{"id":4852,"title":"Demonlover","director":"Olivier Assayas","year":2002,"tmdb_id":24488,"imdb_id":"tt0284034","original_title":"Demonlover","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4853','movie',4853,'{"id":4853,"title":"Irreversible","director":"Gaspar Noé","year":2002,"tmdb_id":979,"imdb_id":"tt0290673","original_title":"Irréversible","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4854','movie',4854,'{"id":4854,"title":"Kedma","director":"Amos Gitai","year":2002,"tmdb_id":125945,"imdb_id":"tt0304267","original_title":"קדמה","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4855','movie',4855,'{"id":4855,"title":"The Adversary","director":"Nicole Garcia","year":2002,"tmdb_id":52999,"imdb_id":"tt0273069","original_title":"L''Adversaire","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4856','movie',4856,'{"id":4856,"title":"Marie-Jo and Her 2 Loves","director":"Robert Guédiguian","year":2002,"tmdb_id":12513,"imdb_id":"tt0293401","original_title":"Marie-Jo et ses deux amours","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4857','movie',4857,'{"id":4857,"title":"Chihwaseon","director":"Im Kwon-taek","year":2002,"tmdb_id":18302,"imdb_id":"tt0317234","original_title":"취화선","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4858','movie',4858,'{"id":4858,"title":"My Mother''s Smile","director":"Marco Bellocchio","year":2002,"tmdb_id":65045,"imdb_id":"tt0317965","original_title":"L’ora di religione - Il sorriso di mia madre","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4859','movie',4859,'{"id":4859,"title":"The Uncertainty Principle","director":"Manoel de Oliveira","year":2002,"tmdb_id":103701,"imdb_id":"tt0303162","original_title":"O Princípio da Incerteza","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4860','movie',4860,'{"id":4860,"title":"Unknown Pleasures","director":"Jia Zhangke","year":2002,"tmdb_id":80243,"imdb_id":"tt0318025","original_title":"任逍遥","original_language":"zh","alternate_titles":["REN XIAO YAO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4861','movie',4861,'{"id":4861,"title":"Spider","director":"David Cronenberg","year":2002,"tmdb_id":9613,"imdb_id":"tt0278731","original_title":"Spider","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4862','movie',4862,'{"id":4862,"title":"Sweet Sixteen","director":"Ken Loach","year":2002,"tmdb_id":1376,"imdb_id":"tt0313670","original_title":"Sweet Sixteen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4863','movie',4863,'{"id":4863,"title":"All or Nothing","director":"Mike Leigh","year":2002,"tmdb_id":12454,"imdb_id":"tt0286261","original_title":"All or Nothing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4864','movie',4864,'{"id":4864,"title":"Ten","director":"Abbas Kiarostami","year":2002,"tmdb_id":14633,"imdb_id":"tt0301978","original_title":"ده","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4865','movie',4865,'{"id":4865,"title":"Carnage","director":"Delphine Gleize","year":2002,"tmdb_id":44408,"imdb_id":"tt0280523","original_title":"Carnages","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4866','movie',4866,'{"id":4866,"title":"Double Vision","director":"Chen Kuofu","year":2002,"tmdb_id":57100,"imdb_id":"tt0284066","original_title":"雙瞳","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4867','movie',4867,'{"id":4867,"title":"El bonaerense","director":"Pablo Trapero","year":2002,"tmdb_id":83505,"imdb_id":"tt0315850","original_title":"El bonaerense","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4868','movie',4868,'{"id":4868,"title":"Waiting for Happiness","director":"Abderrahmane Sissako","year":2002,"tmdb_id":47226,"imdb_id":"tt0308363","original_title":"Heremakono","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4869','movie',4869,'{"id":4869,"title":"To Stay Alive","director":"Dariush Mehrjui","year":2002,"tmdb_id":125937,"imdb_id":"tt0317137","original_title":"Bemani","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4870','movie',4870,'{"id":4870,"title":"Porn Theatre","director":"Jacques Nolot","year":2002,"tmdb_id":49475,"imdb_id":"tt0287364","original_title":"La Chatte à deux têtes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4871','movie',4871,'{"id":4871,"title":"Madame Satã","director":"Karim Aïnouz","year":2002,"tmdb_id":46993,"imdb_id":"tt0317887","original_title":"Madame Satã","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4872','movie',4872,'{"id":4872,"title":"The Confession","director":"Zeki Demirkubuz","year":2002,"tmdb_id":79084,"imdb_id":"tt0317743","original_title":"İtiraf","original_language":"tr","alternate_titles":["CONFESSION"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4873','movie',4873,'{"id":4873,"title":"Blissfully Yours","director":"Apichatpong Weerasethakul","year":2002,"tmdb_id":47046,"imdb_id":"tt0317171","original_title":"สุดเสน่หา","original_language":"th","alternate_titles":["SUD SANAEHA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4874','movie',4874,'{"id":4874,"title":"Tomorrow La Scala!","director":"Francesca Joseph","year":2002,"tmdb_id":367852,"imdb_id":"tt0307839","original_title":"Tomorrow La Scala!","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4875','movie',4875,'{"id":4875,"title":"A Piece of Sky","director":"Bénédicte Liénard","year":2002,"tmdb_id":263209,"imdb_id":"tt0317978","original_title":"Une part du ciel","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4876','movie',4876,'{"id":4876,"title":"Fate","director":"Zeki Demirkubuz","year":2002,"tmdb_id":41187,"imdb_id":"tt0287803","original_title":"Yazgı","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4877','movie',4877,'{"id":4877,"title":"Rachida","director":"Yamina Bachir-Chouikh","year":2002,"tmdb_id":50956,"imdb_id":"tt0318011","original_title":"Rachida","original_language":"ar","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4878','movie',4878,'{"id":4878,"title":"Carandiru","director":"Héctor Babenco","year":2003,"tmdb_id":8440,"imdb_id":"tt0293007","original_title":"Carandiru","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4879','movie',4879,'{"id":4879,"title":"Elephant","director":"Gus Van Sant","year":2003,"tmdb_id":1807,"imdb_id":"tt0363589","original_title":"Elephant","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4880','movie',4880,'{"id":4880,"title":"Terra incognita","director":"Ghassan Salhab","year":2002,"tmdb_id":462725,"imdb_id":"tt0318116","original_title":"Terra incognita","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4881','movie',4881,'{"id":4881,"title":"Bright Future","director":"Kiyoshi Kurosawa","year":2003,"tmdb_id":26886,"imdb_id":"tt0363235","original_title":"アカルイミライ","original_language":"ja","alternate_titles":["AKARUI MIRAI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4882','movie',4882,'{"id":4882,"title":"Incantato","director":"Pupi Avati","year":2003,"tmdb_id":57424,"imdb_id":"tt0319237","original_title":"Il cuore altrove","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4883','movie',4883,'{"id":4883,"title":"Little Lili","director":"Claude Miller","year":2003,"tmdb_id":51865,"imdb_id":"tt0335351","original_title":"La Petite Lili","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4884','movie',4884,'{"id":4884,"title":"The Chops","director":"Bertrand Blier","year":2003,"tmdb_id":68970,"imdb_id":"tt0293672","original_title":"Les Côtelettes","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4885','movie',4885,'{"id":4885,"title":"Purple Butterfly","director":"Lou Ye","year":2003,"tmdb_id":34561,"imdb_id":"tt0363290","original_title":"紫蝴蝶","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4886','movie',4886,'{"id":4886,"title":"Swimming Pool","director":"François Ozon","year":2003,"tmdb_id":302,"imdb_id":"tt0324133","original_title":"Swimming Pool","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4887','movie',4887,'{"id":4887,"title":"Tiresia","director":"Bertrand Bonello","year":2003,"tmdb_id":67236,"imdb_id":"tt0362246","original_title":"Tiresia","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4888','movie',4888,'{"id":4888,"title":"Strayed","director":"André Téchiné","year":2003,"tmdb_id":38018,"imdb_id":"tt0329111","original_title":"Les égarés","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4889','movie',4889,'{"id":4889,"title":"Arimpara","director":"Murali Nair","year":2003,"tmdb_id":260524,"imdb_id":"tt0364211","original_title":"അരിമ്പാറ","original_language":"ml","alternate_titles":["A STORY THAT BEGINS AT THE END"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4890','movie',4890,'{"id":4890,"title":"The Brown Bunny","director":"Vincent Gallo","year":2003,"tmdb_id":12703,"imdb_id":"tt0330099","original_title":"The Brown Bunny","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4891','movie',4891,'{"id":4891,"title":"Drifters","director":"Wang Xiaoshuai","year":2003,"tmdb_id":255962,"imdb_id":"tt0379278","original_title":"二弟","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4892','movie',4892,'{"id":4892,"title":"The Best of Youth","director":"Marco Tullio Giordana","year":2003,"tmdb_id":11659,"imdb_id":"tt0346336","original_title":"La meglio gioventù","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4893','movie',4893,'{"id":4893,"title":"The Southern Cross","director":"Pablo Reyero","year":2003,"tmdb_id":216214,"imdb_id":"tt0321862","original_title":"La cruz del sur","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4894','movie',4894,'{"id":4894,"title":"Japanese Story","director":"Sue Brooks","year":2003,"tmdb_id":13433,"imdb_id":"tt0304229","original_title":"Japanese Story","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4895','movie',4895,'{"id":4895,"title":"Today and Tomorrow","director":"Alejandro Chomski","year":2003,"tmdb_id":58739,"imdb_id":"tt0347207","original_title":"Hoy y mañana","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4896','movie',4896,'{"id":4896,"title":"A Thousand Months","director":"Faouzi Bensaïdi","year":2003,"tmdb_id":99698,"imdb_id":"tt0325826","original_title":"Mille Mois","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4897','movie',4897,'{"id":4897,"title":"Stormy Weather","director":"Sólveig Anspach","year":2003,"tmdb_id":102533,"imdb_id":"tt0348876","original_title":"Stormviðri","original_language":"is","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4898','movie',4898,'{"id":4898,"title":"Kiss of Life","director":"Emily Young","year":2003,"tmdb_id":6000,"imdb_id":"tt0365410","original_title":"Kiss of Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4899','movie',4899,'{"id":4899,"title":"Struggle","director":"Ruth Mader","year":2003,"tmdb_id":48861,"imdb_id":"tt0337250","original_title":"Struggle","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4900','movie',4900,'{"id":4900,"title":"Crimson Gold","director":"Jafar Panahi","year":2003,"tmdb_id":40427,"imdb_id":"tt0371280","original_title":"طلای سرخ","original_language":"fa","alternate_titles":["TALAYE SORGH"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4901','movie',4901,'{"id":4901,"title":"Young Adam","director":"David Mackenzie","year":2003,"tmdb_id":237,"imdb_id":"tt0289635","original_title":"Young Adam","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4902','movie',4902,'{"id":4902,"title":"Soldiers of Salamina","director":"David Trueba","year":2003,"tmdb_id":38086,"imdb_id":"tt0314693","original_title":"Soldados de Salamina","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4903','movie',4903,'{"id":4903,"title":"Clean","director":"Olivier Assayas","year":2004,"tmdb_id":39851,"imdb_id":"tt0388838","original_title":"Clean","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4904','movie',4904,'{"id":4904,"title":"Exiles","director":"Tony Gatlif","year":2004,"tmdb_id":18497,"imdb_id":"tt0400420","original_title":"Exils","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4905','movie',4905,'{"id":4905,"title":"The Edukators","director":"Hans Weingartner","year":2004,"tmdb_id":276,"imdb_id":"tt0408777","original_title":"Die fetten Jahre sind vorbei","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4906','movie',4906,'{"id":4906,"title":"Fahrenheit 9/11","director":"Michael Moore","year":2004,"tmdb_id":1777,"imdb_id":"tt0361596","original_title":"Fahrenheit 9/11","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4907','movie',4907,'{"id":4907,"title":"Nobody Knows","director":"Hirokazu Kore-eda","year":2004,"tmdb_id":2517,"imdb_id":"tt0408664","original_title":"誰も知らない","original_language":"ja","alternate_titles":["DAREMO SHIRANAI"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4908','movie',4908,'{"id":4908,"title":"Woman Is the Future of Man","director":"Hong Sang-soo","year":2004,"tmdb_id":16447,"imdb_id":"tt0403692","original_title":"여자는 남자의 미래다","original_language":"ko","alternate_titles":["LA FEMME EST L’AVENIR DE L’HOMME"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4909','movie',4909,'{"id":4909,"title":"Ghost in the Shell 2: Innocence","director":"Mamoru Oshii","year":2004,"tmdb_id":12140,"imdb_id":"tt0347246","original_title":"イノセンス","original_language":"ja","alternate_titles":["INNOCENCE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4910','movie',4910,'{"id":4910,"title":"The Holy Girl","director":"Lucrecia Martel","year":2004,"tmdb_id":44413,"imdb_id":"tt0300270","original_title":"La niña santa","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4911','movie',4911,'{"id":4911,"title":"Look at Me","director":"Agnès Jaoui","year":2004,"tmdb_id":11399,"imdb_id":"tt0374583","original_title":"Comme une image","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4912','movie',4912,'{"id":4912,"title":"Mondovino","director":"Jonathan Nossiter","year":2004,"tmdb_id":48121,"imdb_id":"tt0411674","original_title":"Mondovino","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4913','movie',4913,'{"id":4913,"title":"Life Is a Miracle","director":"Emir Kusturica","year":2004,"tmdb_id":20128,"imdb_id":"tt0322420","original_title":"Život je čudo","original_language":"sr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4914','movie',4914,'{"id":4914,"title":"Nelly","director":"Laure Duthilleul","year":2004,"tmdb_id":78134,"imdb_id":"tt0403347","original_title":"À ce soir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4915','movie',4915,'{"id":4915,"title":"À tout de suite","director":"Benoît Jacquot","year":2004,"tmdb_id":78293,"imdb_id":"tt0407342","original_title":"À tout de suite","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4916','movie',4916,'{"id":4916,"title":"Welcome to Switzerland","director":"Léa Fazer","year":2004,"tmdb_id":56785,"imdb_id":"tt0386858","original_title":"Bienvenue en Suisse","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4917','movie',4917,'{"id":4917,"title":"Crónicas","director":"Sebastián Cordero","year":2004,"tmdb_id":20511,"imdb_id":"tt0382621","original_title":"Crónicas","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4918','movie',4918,'{"id":4918,"title":"The Life and Death of Peter Sellers","director":"Stephen Hopkins","year":2004,"tmdb_id":10609,"imdb_id":"tt0352520","original_title":"The Life and Death of Peter Sellers","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4919','movie',4919,'{"id":4919,"title":"10 on Ten","director":"Abbas Kiarostami","year":2004,"tmdb_id":121102,"imdb_id":"tt0407467","original_title":"10 on Ten","original_language":"fa","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4920','movie',4920,'{"id":4920,"title":"Earth and Ashes","director":"Atiq Rahimi","year":2004,"tmdb_id":2702,"imdb_id":"tt0420715","original_title":"Khâkestar-o-khâk","original_language":"ps","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4921','movie',4921,'{"id":4921,"title":"Marseille","director":"Angela Schanelec","year":2004,"tmdb_id":153770,"imdb_id":"tt0360779","original_title":"Marseille","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4922','movie',4922,'{"id":4922,"title":"Dear Frankie","director":"Shona Auerbach","year":2004,"tmdb_id":8981,"imdb_id":"tt0377752","original_title":"Dear Frankie","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4923','movie',4923,'{"id":4923,"title":"Moolaadé","director":"Ousmane Sembène","year":2004,"tmdb_id":39504,"imdb_id":"tt0416991","original_title":"Moolaadé","original_language":"bm","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4924','movie',4924,'{"id":4924,"title":"In the Darkness of the Night","director":"João Canijo","year":2004,"tmdb_id":83827,"imdb_id":"tt0413053","original_title":"Noite Escura","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4925','movie',4925,'{"id":4925,"title":"Lightweight","director":"Jean-Pierre Améris","year":2004,"tmdb_id":61681,"imdb_id":"tt0389282","original_title":"Poids léger","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4926','movie',4926,'{"id":4926,"title":"Kontroll","director":"Nimród Antal","year":2004,"tmdb_id":5204,"imdb_id":"tt0373981","original_title":"Kontroll","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4927','movie',4927,'{"id":4927,"title":"Don''t Move","director":"Sergio Castellitto","year":2004,"tmdb_id":16729,"imdb_id":"tt0330702","original_title":"Non ti muovere","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4928','movie',4928,'{"id":4928,"title":"The Assassination of Richard Nixon","director":"Niels Mueller","year":2004,"tmdb_id":842,"imdb_id":"tt0364961","original_title":"The Assassination of Richard Nixon","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4929','movie',4929,'{"id":4929,"title":"Whisky","director":"Juan Pablo Rebella, Pablo Stoll","year":2004,"tmdb_id":36971,"imdb_id":"tt0331370","original_title":"Whisky","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4930','movie',4930,'{"id":4930,"title":"Bashing","director":"Masahiro Kobayashi","year":2005,"tmdb_id":39798,"imdb_id":"tt0456836","original_title":"バッシング","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4931','movie',4931,'{"id":4931,"title":"Don''t Come Knocking","director":"Wim Wenders","year":2005,"tmdb_id":3527,"imdb_id":"tt0377800","original_title":"Don''t Come Knocking","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4932','movie',4932,'{"id":4932,"title":"Somersault","director":"Cate Shortland","year":2004,"tmdb_id":16605,"imdb_id":"tt0381429","original_title":"Somersault","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4933','movie',4933,'{"id":4933,"title":"Election","director":"Johnnie To","year":2005,"tmdb_id":18747,"imdb_id":"tt0434008","original_title":"黑社會","original_language":"cn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4934','movie',4934,'{"id":4934,"title":"Battle in Heaven","director":"Carlos Reygadas","year":2005,"tmdb_id":17247,"imdb_id":"tt0387055","original_title":"Batalla en el cielo","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4935','movie',4935,'{"id":4935,"title":"Caché","director":"Michael Haneke","year":2005,"tmdb_id":445,"imdb_id":"tt0387898","original_title":"Caché","original_language":"fr","alternate_titles":["HIDDEN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4936','movie',4936,'{"id":4936,"title":"Last Days","director":"Gus Van Sant","year":2005,"tmdb_id":1665,"imdb_id":"tt0403217","original_title":"Last Days","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4937','movie',4937,'{"id":4937,"title":"Lemming","director":"Dominik Moll","year":2005,"tmdb_id":1622,"imdb_id":"tt0415932","original_title":"Lemming","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4938','movie',4938,'{"id":4938,"title":"Free Zone","director":"Amos Gitai","year":2005,"tmdb_id":7483,"imdb_id":"tt0441761","original_title":"Free Zone","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4939','movie',4939,'{"id":4939,"title":"Manderlay","director":"Lars von Trier","year":2005,"tmdb_id":1951,"imdb_id":"tt0342735","original_title":"Manderlay","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4940','movie',4940,'{"id":4940,"title":"To Paint or Make Love","director":"Arnaud Larrieu, Jean-Marie Larrieu","year":2005,"tmdb_id":15702,"imdb_id":"tt0431975","original_title":"Peindre ou faire l''amour","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4941','movie',4941,'{"id":4941,"title":"Kilometer Zero","director":"Hiner Saleem","year":2005,"tmdb_id":126300,"imdb_id":"tt0459668","original_title":"Kilomètre Zéro","original_language":"ku","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4942','movie',4942,'{"id":4942,"title":"Once You''re Born You Can No Longer Hide","director":"Marco Tullio Giordana","year":2005,"tmdb_id":57425,"imdb_id":"tt0418091","original_title":"Quando sei nato non puoi più nasconderti","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4943','movie',4943,'{"id":4943,"title":"Shanghai Dreams","director":"Wang Xiaoshuai","year":2005,"tmdb_id":101908,"imdb_id":"tt0456658","original_title":"青红","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4944','movie',4944,'{"id":4944,"title":"Three Times","director":"Hou Hsiao-hsien","year":2005,"tmdb_id":11554,"imdb_id":"tt0459666","original_title":"最好的時光","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4945','movie',4945,'{"id":4945,"title":"The Three Burials of Melquiades Estrada","director":"Tommy Lee Jones","year":2005,"tmdb_id":8053,"imdb_id":"tt0419294","original_title":"The Three Burials of Melquiades Estrada","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4946','movie',4946,'{"id":4946,"title":"Cinema, Aspirins and Vultures","director":"Marcelo Gomes","year":2005,"tmdb_id":43420,"imdb_id":"tt0373760","original_title":"Cinema, Aspirinas e Urubus","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4947','movie',4947,'{"id":4947,"title":"Delwende","director":"S. Pierre Yameogo","year":2005,"tmdb_id":240647,"imdb_id":"tt0470277","original_title":"Delwende","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4948','movie',4948,'{"id":4948,"title":"Down in the Valley","director":"David Jacobson","year":2005,"tmdb_id":7870,"imdb_id":"tt0398027","original_title":"Down in the Valley","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4949','movie',4949,'{"id":4949,"title":"Lower City","director":"Sérgio Machado","year":2005,"tmdb_id":8443,"imdb_id":"tt0456899","original_title":"Cidade Baixa","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4950','movie',4950,'{"id":4950,"title":"Tale of Cinema","director":"Hong Sang-soo","year":2005,"tmdb_id":85550,"imdb_id":"tt0461795","original_title":"극장전","original_language":"ko","alternate_titles":["KEUK JANG JEON"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4951','movie',4951,'{"id":4951,"title":"I Am Guilty","director":"Christoph Hochhäusler","year":2005,"tmdb_id":64509,"imdb_id":"tt0444627","original_title":"Falscher Bekenner","original_language":"de","alternate_titles":["LOW PROFILE"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4952','movie',4952,'{"id":4952,"title":"Havana Blues","director":"Benito Zambrano","year":2005,"tmdb_id":49256,"imdb_id":"tt0441297","original_title":"Habana Blues","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4953','movie',4953,'{"id":4953,"title":"The Bow","director":"Kim Ki-duk","year":2005,"tmdb_id":1963,"imdb_id":"tt0456470","original_title":"활","original_language":"ko","alternate_titles":["HWAL"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4954','movie',4954,'{"id":4954,"title":"Jewboy","director":"Tony Krawitz","year":2005,"tmdb_id":95801,"imdb_id":"tt0439646","original_title":"Jewboy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4955','movie',4955,'{"id":4955,"title":"Where the Truth Lies","director":"Atom Egoyan","year":2005,"tmdb_id":9729,"imdb_id":"tt0373450","original_title":"Where the Truth Lies","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4956','movie',4956,'{"id":4956,"title":"Le Filmeur","director":"Alain Cavalier","year":2005,"tmdb_id":240646,"imdb_id":"tt0463991","original_title":"Le Filmeur","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4957','movie',4957,'{"id":4957,"title":"Time to Leave","director":"François Ozon","year":2005,"tmdb_id":2566,"imdb_id":"tt0417189","original_title":"Le Temps qui reste","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4958','movie',4958,'{"id":4958,"title":"The Forsaken Land","director":"Vimukthi Jayasundara","year":2005,"tmdb_id":83221,"imdb_id":"tt0413358","original_title":"සුළඟ එනු පිණිස","original_language":"si","alternate_titles":["SULANGA ENU PINISA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4959','movie',4959,'{"id":4959,"title":"Johanna","director":"Kornél Mundruczó","year":2005,"tmdb_id":73129,"imdb_id":"tt0472832","original_title":"Johanna","original_language":"hu","alternate_titles":["JOAN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4960','movie',4960,'{"id":4960,"title":"Sleeper","director":"Benjamin Heisenberg","year":2005,"tmdb_id":36637,"imdb_id":"tt0420886","original_title":"Schläfer","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4961','movie',4961,'{"id":4961,"title":"Bully","director":"Larry Clark","year":2001,"tmdb_id":9517,"imdb_id":"tt0242193","original_title":"Bully","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4962','movie',4962,'{"id":4962,"title":"Dark Horse","director":"Dagur Kári","year":2005,"tmdb_id":5177,"imdb_id":"tt0408318","original_title":"Voksne mennesker","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4963','movie',4963,'{"id":4963,"title":"The Afternoon of a Torturer","director":"Lucian Pintilie","year":2000,"tmdb_id":123690,"imdb_id":"tt0290423","original_title":"După-amiaza unui torționar","original_language":"ro","alternate_titles":["L''après-midi d''un tortionnaire"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4964','movie',4964,'{"id":4964,"title":"Zim and Co","director":"Pierre Jolivet","year":2005,"tmdb_id":110305,"imdb_id":"tt0423914","original_title":"Zim and Co","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4965','movie',4965,'{"id":4965,"title":"Hollywood Hong Kong","director":"Fruit Chan","year":2001,"tmdb_id":60278,"imdb_id":"tt0290654","original_title":"香港有個荷里活","original_language":"cn","alternate_titles":["Heung gong yau gok hor lei wood"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4966','movie',4966,'{"id":4966,"title":"How Harry Became a Tree","director":"Goran Paskaljević","year":2001,"tmdb_id":99963,"imdb_id":"tt0256084","original_title":"How Harry Became a Tree","original_language":"en","alternate_titles":["Bitter Harvest"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4967','movie',4967,'{"id":4967,"title":"Light of My Eyes","director":"Giuseppe Piccioni","year":2001,"tmdb_id":46098,"imdb_id":"tt0282701","original_title":"Luce dei miei occhi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4968','movie',4968,'{"id":4968,"title":"Who Are You?","director":"João Botelho","year":2001,"tmdb_id":203746,"imdb_id":"tt0210930","original_title":"Quem És Tu?","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4969','movie',4969,'{"id":4969,"title":"Secret Ballot","director":"Babak Payami","year":2001,"tmdb_id":43772,"imdb_id":"tt0290823","original_title":"رأی مخفی","original_language":"fa","alternate_titles":["Raye Makhfi","Void Votes"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4970','movie',4970,'{"id":4970,"title":"Dog Days","director":"Ulrich Seidl","year":2001,"tmdb_id":9025,"imdb_id":"tt0290661","original_title":"Hundstage","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4971','movie',4971,'{"id":4971,"title":"Red Moon","director":"Antonio Capuano","year":2001,"tmdb_id":203745,"imdb_id":"tt0290733","original_title":"Luna rossa","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4972','movie',4972,'{"id":4972,"title":"Address Unknown","director":"Kim Ki-duk","year":2001,"tmdb_id":25650,"imdb_id":"tt0284815","original_title":"수취인불명","original_language":"ko","alternate_titles":["Suchwiin bulmyeong","Soochwieen boolmyung"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4973','movie',4973,'{"id":4973,"title":"The Navigators","director":"Ken Loach","year":2001,"tmdb_id":35824,"imdb_id":"tt0279977","original_title":"The Navigators","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4974','movie',4974,'{"id":4974,"title":"Waking Life","director":"Richard Linklater","year":2001,"tmdb_id":9081,"imdb_id":"tt0243017","original_title":"Waking Life","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4975','movie',4975,'{"id":4975,"title":"Fifi Martingale","director":"Jacques Rozier","year":2001,"tmdb_id":522612,"imdb_id":"tt0293153","original_title":"Fifi Martingale","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4976','movie',4976,'{"id":4976,"title":"Wild Innocence","director":"Philippe Garrel","year":2001,"tmdb_id":103692,"imdb_id":"tt0290841","original_title":"Sauvage innocence","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4977','movie',4977,'{"id":4977,"title":"Sons And Daughters","director":"Marco Bechis","year":2001,"tmdb_id":59858,"imdb_id":"tt0295959","original_title":"Figli - Hijos","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4978','movie',4978,'{"id":4978,"title":"Harmful Insect","director":"Akihiko Shiota","year":2001,"tmdb_id":89800,"imdb_id":"tt0297905","original_title":"害虫","original_language":"ja","alternate_titles":["Gaichu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4979','movie',4979,'{"id":4979,"title":"Flower Island","director":"Song Il-gon","year":2001,"tmdb_id":200989,"imdb_id":"tt0302602","original_title":"꽃섬","original_language":"ko","alternate_titles":["Ggot seom"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4980','movie',4980,'{"id":4980,"title":"Invincible","director":"Werner Herzog","year":2001,"tmdb_id":68569,"imdb_id":"tt0245171","original_title":"Invincible","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4981','movie',4981,'{"id":4981,"title":"Seafood","director":"Zhu Wen","year":2001,"tmdb_id":374586,"imdb_id":"tt0297161","original_title":"海鲜","original_language":"zh","alternate_titles":["Haixian","Hai Xian"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4982','movie',4982,'{"id":4982,"title":"The Triumph of Love","director":"Clare Peploe","year":2001,"tmdb_id":35337,"imdb_id":"tt0253840","original_title":"The Triumph of Love","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4983','movie',4983,'{"id":4983,"title":"One Man Up","director":"Paolo Sorrentino","year":2001,"tmdb_id":53482,"imdb_id":"tt0295671","original_title":"L''uomo in più","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4984','movie',4984,'{"id":4984,"title":"Time Out","director":"Laurent Cantet","year":2001,"tmdb_id":35651,"imdb_id":"tt0279065","original_title":"L''Emploi du temps","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4985','movie',4985,'{"id":4985,"title":"Loco Fever","director":"Andrés Wood","year":2001,"tmdb_id":44517,"imdb_id":"tt0299876","original_title":"La fiebre del loco","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4986','movie',4986,'{"id":4986,"title":"Deep Breath","director":"Damien Odoul","year":2000,"tmdb_id":27142,"imdb_id":"tt0296210","original_title":"Le souffle","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4987','movie',4987,'{"id":4987,"title":"Thirteen Conversations About One Thing","director":"Jill Sprecher","year":2001,"tmdb_id":17734,"imdb_id":"tt0268690","original_title":"Thirteen Conversations About One Thing","original_language":"en","alternate_titles":["13 Conversations About One Thing","13 Conversations"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4988','movie',4988,'{"id":4988,"title":"A Hell of a Day","director":"Marion Vernoux","year":2001,"tmdb_id":67384,"imdb_id":"tt0269771","original_title":"Reines d''un jour","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4989','movie',4989,'{"id":4989,"title":"Larger Than Life","director":"Jeffrey Jeturian","year":2000,"tmdb_id":208583,"imdb_id":"tt0291530","original_title":"Tuhog","original_language":"tl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4990','movie',4990,'{"id":4990,"title":"Water and Salt","director":"Teresa Villaverde","year":2001,"tmdb_id":116034,"imdb_id":"tt0235110","original_title":"Água e Sal","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4991','movie',4991,'{"id":4991,"title":"Bear''s Kiss","director":"Sergei Bodrov","year":2002,"tmdb_id":47855,"imdb_id":"tt0283915","original_title":"Медвежий поцелуй","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4992','movie',4992,'{"id":4992,"title":"Tirana Year Zero","director":"Fatmir Koçi","year":2001,"tmdb_id":49915,"imdb_id":"tt0295661","original_title":"Tirana, année zéro","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4993','movie',4993,'{"id":4993,"title":"Nearest to Heaven","director":"Tonie Marshall","year":2002,"tmdb_id":77873,"imdb_id":"tt0290435","original_title":"Au plus près du paradis","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4994','movie',4994,'{"id":4994,"title":"Frida","director":"Julie Taymor","year":2002,"tmdb_id":1360,"imdb_id":"tt0120679","original_title":"Frida","original_language":"en","alternate_titles":["Frida Kahlo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4995','movie',4995,'{"id":4995,"title":"Führer Ex","director":"Winfried Bonengel","year":2002,"tmdb_id":10630,"imdb_id":"tt0329106","original_title":"Führer Ex","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4996','movie',4996,'{"id":4996,"title":"Julie Walking Home","director":"Agnieszka Holland","year":2002,"tmdb_id":64523,"imdb_id":"tt0246719","original_title":"Julie Walking Home","original_language":"en","alternate_titles":["The Healer"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4997','movie',4997,'{"id":4997,"title":"The Power of the Past","director":"Piergiorgio Gay","year":2002,"tmdb_id":154146,"imdb_id":"tt0329095","original_title":"La forza del passato","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4998','movie',4998,'{"id":4998,"title":"Man on the Train","director":"Patrice Leconte","year":2002,"tmdb_id":22016,"imdb_id":"tt0301414","original_title":"L''Homme du train","original_language":"fr","alternate_titles":["The Train Man"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:4999','movie',4999,'{"id":4999,"title":"Oasis","director":"Lee Chang-dong","year":2002,"tmdb_id":26955,"imdb_id":"tt0320193","original_title":"오아시스","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5000','movie',5000,'{"id":5000,"title":"The Best of Times","director":"Chang Tso-chi","year":2002,"tmdb_id":121036,"imdb_id":"tt0333902","original_title":"美麗時光","original_language":"zh","alternate_titles":["Mei li shi guang","Meili shiguang"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5001','movie',5001,'{"id":5001,"title":"My Voice","director":"Flora Gomes","year":2002,"tmdb_id":203738,"imdb_id":"tt0296099","original_title":"Nha fala","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5002','movie',5002,'{"id":5002,"title":"A Journey Called Love","director":"Michele Placido","year":2002,"tmdb_id":64389,"imdb_id":"tt0296145","original_title":"Un viaggio chiamato amore","original_language":"it","alternate_titles":["A Scandalous Journey"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5003','movie',5003,'{"id":5003,"title":"Naked","director":"Doris Dörrie","year":2002,"tmdb_id":1740,"imdb_id":"tt0300237","original_title":"Nackt","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5004','movie',5004,'{"id":5004,"title":"Maximum Velocity (V-Max)","director":"Daniele Vicari","year":2002,"tmdb_id":82832,"imdb_id":"tt0329731","original_title":"Velocità massima","original_language":"it","alternate_titles":["Maximum Velocity"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5005','movie',5005,'{"id":5005,"title":"Ken Park","director":"Larry Clark, Edward Lachman","year":2002,"tmdb_id":7090,"imdb_id":"tt0209077","original_title":"Ken Park","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5006','movie',5006,'{"id":5006,"title":"The Tracker","director":"Rolf de Heer","year":2002,"tmdb_id":13439,"imdb_id":"tt0212132","original_title":"The Tracker","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5007','movie',5007,'{"id":5007,"title":"Full Frontal","director":"Steven Soderbergh","year":2002,"tmdb_id":15186,"imdb_id":"tt0290212","original_title":"Full Frontal","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5008','movie',5008,'{"id":5008,"title":"Almost Peaceful","director":"Michel Deville","year":2002,"tmdb_id":61665,"imdb_id":"tt0318780","original_title":"Un monde presque paisible","original_language":"fr","alternate_titles":["Almost Peaceful World"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5009','movie',5009,'{"id":5009,"title":"The Virgin of Lust","director":"Arturo Ripstein","year":2001,"tmdb_id":101564,"imdb_id":"tt0332817","original_title":"La virgen de la lujuria","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5010','movie',5010,'{"id":5010,"title":"Lilly''s Story","director":"Roviros Manthoulis","year":2002,"tmdb_id":1238980,"imdb_id":"tt0333801","original_title":"Lilly''s Story","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5011','movie',5011,'{"id":5011,"title":"Music for Weddings and Funerals","director":"Unni Straume","year":2002,"tmdb_id":164635,"imdb_id":"tt0287580","original_title":"Musikk for bryllup og begravelser","original_language":"no","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5012','movie',5012,'{"id":5012,"title":"Public Toilet","director":"Fruit Chan","year":2002,"tmdb_id":101569,"imdb_id":"tt0334229","original_title":"화장실, 어디에요?","original_language":"ko","alternate_titles":["Hwajangshil eodieyo?","Ren min gong che"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5013','movie',5013,'{"id":5013,"title":"Soul Mate","director":"Sergio Rubini","year":2002,"tmdb_id":74660,"imdb_id":"tt0328831","original_title":"L''anima gemella","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5014','movie',5014,'{"id":5014,"title":"The Lease","director":"Kristijonas Vildžiūnas","year":2002,"tmdb_id":604159,"imdb_id":"tt0334027","original_title":"Nuomos sutartis","original_language":"lt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5015','movie',5015,'{"id":5015,"title":"Poniente","director":"Chus Gutiérrez","year":2002,"tmdb_id":114860,"imdb_id":"tt0332322","original_title":"Poniente","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5016','movie',5016,'{"id":5016,"title":"Rosa la China","director":"Valeria Sarmiento","year":2002,"tmdb_id":478401,"imdb_id":"tt0323836","original_title":"Rosa la China","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5017','movie',5017,'{"id":5017,"title":"A Snake of June","director":"Shinya Tsukamoto","year":2002,"tmdb_id":33431,"imdb_id":"tt0330904","original_title":"六月の蛇","original_language":"ja","alternate_titles":["Rokugatsu no hebi"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5018','movie',5018,'{"id":5018,"title":"Friday Night","director":"Claire Denis","year":2002,"tmdb_id":45044,"imdb_id":"tt0295743","original_title":"Vendredi soir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5019','movie',5019,'{"id":5019,"title":"Untouched by the West","director":"Raymond Depardon","year":2002,"tmdb_id":272879,"imdb_id":"tt0334574","original_title":"Un homme sans l''Occident","original_language":"fr","alternate_titles":["A Man Without the West"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5020','movie',5020,'{"id":5020,"title":"Women''s Prison","director":"Manijeh Hekmat","year":2002,"tmdb_id":292533,"imdb_id":"tt0332834","original_title":"زندان زنان","original_language":"fa","alternate_titles":["Zendan-e zanan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5021','movie',5021,'{"id":5021,"title":"The Missing Gun","director":"Lu Chuan","year":2001,"tmdb_id":83277,"imdb_id":"tt0342778","original_title":"寻枪","original_language":"zh","alternate_titles":["Xun qiang"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5022','movie',5022,'{"id":5022,"title":"A Good Lawyer''s Wife","director":"Im Sang-soo","year":2003,"tmdb_id":61952,"imdb_id":"tt0372782","original_title":"바람난 가족","original_language":"ko","alternate_titles":["Baramnan gajok","Baram-Nam Gajok"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5023','movie',5023,'{"id":5023,"title":"Code 46","director":"Michael Winterbottom","year":2003,"tmdb_id":2577,"imdb_id":"tt0345061","original_title":"Code 46","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5024','movie',5024,'{"id":5024,"title":"Imagining Argentina","director":"Christopher Hampton","year":2002,"tmdb_id":34036,"imdb_id":"tt0314197","original_title":"Imagining Argentina","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5025','movie',5025,'{"id":5025,"title":"Alila","director":"Amos Gitai","year":2003,"tmdb_id":30735,"imdb_id":"tt0349079","original_title":"עלילה","original_language":"he","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5026','movie',5026,'{"id":5026,"title":"Goodbye, Dragon Inn","director":"Tsai Ming-liang","year":2003,"tmdb_id":56616,"imdb_id":"tt0377556","original_title":"不散","original_language":"zh","alternate_titles":["Bu jian bu san","Bu San"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5027','movie',5027,'{"id":5027,"title":"The Miracle","director":"Edoardo Winspeare","year":2003,"tmdb_id":154155,"imdb_id":"tt0378362","original_title":"Il miracolo","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5028','movie',5028,'{"id":5028,"title":"Feelings","director":"Noémie Lvovsky","year":2003,"tmdb_id":18461,"imdb_id":"tt0329584","original_title":"Les Sentiments","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5029','movie',5029,'{"id":5029,"title":"Raja","director":"Jacques Doillon","year":2003,"tmdb_id":50900,"imdb_id":"tt0339558","original_title":"Raja","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5030','movie',5030,'{"id":5030,"title":"Rosenstrasse","director":"Margarethe von Trotta","year":2003,"tmdb_id":6317,"imdb_id":"tt0298131","original_title":"Rosenstraße","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5031','movie',5031,'{"id":5031,"title":"Good Morning, Night","director":"Marco Bellocchio","year":2003,"tmdb_id":24164,"imdb_id":"tt0377569","original_title":"Buongiorno, notte","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5032','movie',5032,'{"id":5032,"title":"The Kite","director":"Randa Chahal Sabbag","year":2003,"tmdb_id":44086,"imdb_id":"tt0377610","original_title":"Le cerf-volant","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5033','movie',5033,'{"id":5033,"title":"Pornography","director":"Jan Jakub Kolski","year":2003,"tmdb_id":36401,"imdb_id":"tt0357037","original_title":"Pornografia","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5034','movie',5034,'{"id":5034,"title":"Secrets of the State","director":"Paolo Benvenuti","year":2003,"tmdb_id":112183,"imdb_id":"tt0378725","original_title":"Segreti di stato","original_language":"it","alternate_titles":["Secret File"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5035','movie',5035,'{"id":5035,"title":"Twentynine Palms","director":"Bruno Dumont","year":2003,"tmdb_id":26636,"imdb_id":"tt0315110","original_title":"Twentynine Palms","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5036','movie',5036,'{"id":5036,"title":"A Talking Picture","director":"Manoel de Oliveira","year":2003,"tmdb_id":95536,"imdb_id":"tt0364093","original_title":"Um Filme Falado","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5037','movie',5037,'{"id":5037,"title":"The Floating Landscape","director":"Carol Lai Miu-Suet","year":2003,"tmdb_id":95728,"imdb_id":"tt0377923","original_title":"戀之風景","original_language":"cn","alternate_titles":["Lian zhi feng jing"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5038','movie',5038,'{"id":5038,"title":"Casa de los Babys","director":"John Sayles","year":2002,"tmdb_id":38244,"imdb_id":"tt0303830","original_title":"Casa de los Babys","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5039','movie',5039,'{"id":5039,"title":"In the Forest... Again","director":"Goutam Ghose","year":2003,"tmdb_id":90838,"imdb_id":"tt0368559","original_title":"আবার অরণ্যে","original_language":"bn","alternate_titles":["Abar Arannye"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5040','movie',5040,'{"id":5040,"title":"Abjad","director":"Abolfazl Jalili","year":2003,"tmdb_id":336802,"imdb_id":"tt0379159","original_title":"ابجد","original_language":"fa","alternate_titles":["The First Letter"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5041','movie',5041,'{"id":5041,"title":"The Return of Cagliostro","director":"Franco Maresco, Daniele Ciprì","year":2003,"tmdb_id":77562,"imdb_id":"tt0358676","original_title":"Il ritorno di Cagliostro","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5042','movie',5042,'{"id":5042,"title":"The Sun Assassinated","director":"Abdelkrim Bahloul","year":2002,"tmdb_id":59062,"imdb_id":"tt0348874","original_title":"Le Soleil Assassiné","original_language":"fr","alternate_titles":["The Assassinated Sun"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5043','movie',5043,'{"id":5043,"title":"La quimera de los héroes","director":"Daniel Rosenfeld","year":2003,"tmdb_id":961208,"imdb_id":"tt0318270","original_title":"La quimera de los héroes","original_language":"es","alternate_titles":["The Chimera of Heroes"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5044','movie',5044,'{"id":5044,"title":"Antenna","director":"Kazuyoshi Kumakiri","year":2002,"tmdb_id":174702,"imdb_id":"tt0768100","original_title":"アンテナ","original_language":"ja","alternate_titles":["Antena"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5045','movie',5045,'{"id":5045,"title":"Break Free","director":"Gianluca Maria Tavarelli","year":2003,"tmdb_id":84739,"imdb_id":"tt0382804","original_title":"Liberi","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5046','movie',5046,'{"id":5046,"title":"The Python","director":"Laila Pakalnina","year":2003,"tmdb_id":257740,"imdb_id":"tt0380631","original_title":"Pitons","original_language":"lv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5047','movie',5047,'{"id":5047,"title":"Last Life in the Universe","director":"Pen-Ek Ratanaruang","year":2003,"tmdb_id":11606,"imdb_id":"tt0345549","original_title":"เรื่องรัก น้อยนิด มหาศาล","original_language":"th","alternate_titles":["Ruang rak noi nid mahasan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5048','movie',5048,'{"id":5048,"title":"Travellers and Magicians","director":"Khyentse Norbu","year":2003,"tmdb_id":37232,"imdb_id":"tt0378906","original_title":"ཆང་ཧུབ་ཐེངས་གཅིག་གི་འཁྲུལ་སྣང","original_language":"dz","alternate_titles":["Chang hup the gi tril nung"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5049','movie',5049,'{"id":5049,"title":"Vodka Lemon","director":"Hiner Saleem","year":2003,"tmdb_id":56946,"imdb_id":"tt0379577","original_title":"Vodka Lemon","original_language":"hy","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5050','movie',5050,'{"id":5050,"title":"The Five Obstructions","director":"Lars von Trier, Jørgen Leth","year":2003,"tmdb_id":12456,"imdb_id":"tt0354575","original_title":"De fem benspænd","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5051','movie',5051,'{"id":5051,"title":"Criminal","director":"Gregory Jacobs","year":2004,"tmdb_id":14198,"imdb_id":"tt0362526","original_title":"Criminal","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5052','movie',5052,'{"id":5052,"title":"Izo","director":"Takashi Miike","year":2004,"tmdb_id":12580,"imdb_id":"tt0377079","original_title":"イゾー","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5053','movie',5053,'{"id":5053,"title":"L''enfant Endormi","director":"Yasmine Kassari","year":2004,"tmdb_id":331629,"imdb_id":"tt0424997","original_title":"The Sleeping Child","original_language":"ar","alternate_titles":["The Spleeping Child"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5054','movie',5054,'{"id":5054,"title":"Rolling Family","director":"Pablo Trapero","year":2004,"tmdb_id":79767,"imdb_id":"tt0359254","original_title":"Familia rodante","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5055','movie',5055,'{"id":5055,"title":"Agnes and His Brothers","director":"Oskar Roehler","year":2004,"tmdb_id":1925,"imdb_id":"tt0389738","original_title":"Agnes und seine Brüder","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5056','movie',5056,'{"id":5056,"title":"Grand Sons","director":"Ilan Duran Cohen","year":2004,"tmdb_id":41865,"imdb_id":"tt0427662","original_title":"Les petits fils","original_language":"fr","alternate_titles":["The Grand Sons"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5057','movie',5057,'{"id":5057,"title":"Mud","director":"Derviş Zaim","year":2003,"tmdb_id":350089,"imdb_id":"tt0384708","original_title":"Çamur","original_language":"tr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5058','movie',5058,'{"id":5058,"title":"Saimir","director":"Francesco Munzi","year":2004,"tmdb_id":58531,"imdb_id":"tt0415006","original_title":"Saimir","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5059','movie',5059,'{"id":5059,"title":"Stryker","director":"Noam Gonick","year":2004,"tmdb_id":213489,"imdb_id":"tt0397657","original_title":"Stryker","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5060','movie',5060,'{"id":5060,"title":"Zulu Love Letter","director":"Ramadan Suleman","year":2004,"tmdb_id":274974,"imdb_id":"tt0369664","original_title":"Zulu Love Letter","original_language":"en","alternate_titles":["Lettre d''amour zoulou"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5061','movie',5061,'{"id":5061,"title":"The 3 Rooms of Melancholia","director":"Pirjo Honkasalo","year":2004,"tmdb_id":178469,"imdb_id":"tt0424272","original_title":"Melancholian 3 huonetta","original_language":"ce","alternate_titles":["Melancholian Kolme Huonetta","The Three Rooms of Melancholy"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5062','movie',5062,'{"id":5062,"title":"Mysterious Skin","director":"Gregg Araki","year":2004,"tmdb_id":11171,"imdb_id":"tt0370986","original_title":"Mysterious Skin","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5063','movie',5063,'{"id":5063,"title":"A Less Bad World","director":"Alejandro Agresti","year":2004,"tmdb_id":116550,"imdb_id":"tt0385889","original_title":"Un mundo menos peor","original_language":"es","alternate_titles":["A Less Worse World"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5064','movie',5064,'{"id":5064,"title":"Vital","director":"Shinya Tsukamoto","year":2004,"tmdb_id":36215,"imdb_id":"tt0417243","original_title":"ヴィタール","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5065','movie',5065,'{"id":5065,"title":"Vento di terra","director":"Vincenzo Marra","year":2004,"tmdb_id":241413,"imdb_id":"tt0424536","original_title":"Vento di terra","original_language":"it","alternate_titles":["Land Wind"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5066','movie',5066,'{"id":5066,"title":"The Returned","director":"Robin Campillo","year":2004,"tmdb_id":65513,"imdb_id":"tt0378661","original_title":"Les Revenants","original_language":"fr","alternate_titles":["Those Who Come Back","They Came Back"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5067','movie',5067,'{"id":5067,"title":"3-Iron","director":"Kim Ki-duk","year":2004,"tmdb_id":1280,"imdb_id":"tt0423866","original_title":"빈집","original_language":"ko","alternate_titles":["Bin-jip"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5068','movie',5068,'{"id":5068,"title":"Five Times Two","director":"François Ozon","year":2004,"tmdb_id":4974,"imdb_id":"tt0354356","original_title":"5x2","original_language":"fr","alternate_titles":["5x2 (Cinq fois deux)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5069','movie',5069,'{"id":5069,"title":"Café Lumière","director":"Hou Hsiao-hsien","year":2004,"tmdb_id":52512,"imdb_id":"tt0412596","original_title":"珈琲時光","original_language":"ja","alternate_titles":["Kohi jikou","Coffee Time"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5070','movie',5070,'{"id":5070,"title":"Land of Plenty","director":"Wim Wenders","year":2004,"tmdb_id":1595,"imdb_id":"tt0382357","original_title":"Land of Plenty","original_language":"en","alternate_titles":["Angst and Alienation in America"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5071','movie',5071,'{"id":5071,"title":"Working Slowly (Radio Alice)","director":"Guido Chiesa","year":2004,"tmdb_id":57626,"imdb_id":"tt0422621","original_title":"Lavorare con lentezza","original_language":"it","alternate_titles":["Lavorare con lentezza - Radio Alice 100.6 MHz"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5072','movie',5072,'{"id":5072,"title":"Palindromes","director":"Todd Solondz","year":2004,"tmdb_id":13073,"imdb_id":"tt0362004","original_title":"Palindromes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5073','movie',5073,'{"id":5073,"title":"Kings & Queen","director":"Arnaud Desplechin","year":2004,"tmdb_id":44524,"imdb_id":"tt0344273","original_title":"Rois et Reine","original_language":"fr","alternate_titles":["Kings and Queen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5074','movie',5074,'{"id":5074,"title":"The Keys to the House","director":"Gianni Amelio","year":2004,"tmdb_id":42420,"imdb_id":"tt0345032","original_title":"Le chiavi di casa","original_language":"it","alternate_titles":["The House Keys"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5075','movie',5075,'{"id":5075,"title":"The World","director":"Jia Zhangke","year":2004,"tmdb_id":41292,"imdb_id":"tt0423176","original_title":"世界","original_language":"zh","alternate_titles":["Shijie"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5076','movie',5076,'{"id":5076,"title":"Promised Land","director":"Amos Gitai","year":2004,"tmdb_id":48870,"imdb_id":"tt0424365","original_title":"Ha-Aretz Hamuvtachat","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5077','movie',5077,'{"id":5077,"title":"The Intruder","director":"Claire Denis","year":2004,"tmdb_id":47143,"imdb_id":"tt0422491","original_title":"L''Intrus","original_language":"fr","alternate_titles":["The Intuder"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5078','movie',5078,'{"id":5078,"title":"Vanity Fair","director":"Mira Nair","year":2004,"tmdb_id":11632,"imdb_id":"tt0241025","original_title":"Vanity Fair","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5079','movie',5079,'{"id":5079,"title":"One Long Winter Without Fire","director":"Greg Zglinski","year":2004,"tmdb_id":95307,"imdb_id":"tt0423397","original_title":"Tout un hiver sans feu","original_language":"fr","alternate_titles":["A Long Winter Without Fire","All Winter Without Fire"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5080','movie',5080,'{"id":5080,"title":"Remote Access","director":"Svetlana Proskurina","year":2004,"tmdb_id":48590,"imdb_id":"tt0423433","original_title":"Удалённый доступ","original_language":"ru","alternate_titles":["Udalyonnyy dostup","Udalionnyj Dostup"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5081','movie',5081,'{"id":5081,"title":"Wherever You Are","director":"Michele Placido","year":2004,"tmdb_id":57113,"imdb_id":"tt0388526","original_title":"Ovunque sei","original_language":"it","alternate_titles":["Another Life"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5082','movie',5082,'{"id":5082,"title":"Garpastum","director":"Aleksei German Jr.","year":2005,"tmdb_id":191608,"imdb_id":"tt0488832","original_title":"Гарпастум","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5083','movie',5083,'{"id":5083,"title":"Lady Vengeance","director":"Park Chan-wook","year":2005,"tmdb_id":4550,"imdb_id":"tt0451094","original_title":"친절한 금자씨","original_language":"ko","alternate_titles":["Chin-jeol-han Geum-ja-set"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5084','movie',5084,'{"id":5084,"title":"The Days of Abandonment","director":"Roberto Faenza","year":2005,"tmdb_id":62487,"imdb_id":"tt0474694","original_title":"I giorni dell''abbandono","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5085','movie',5085,'{"id":5085,"title":"Magic Mirror","director":"Manoel de Oliveira","year":2005,"tmdb_id":129937,"imdb_id":"tt0472521","original_title":"Espelho Mágico","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5086','movie',5086,'{"id":5086,"title":"Gabrielle","director":"Patrice Chéreau","year":2005,"tmdb_id":32687,"imdb_id":"tt0435479","original_title":"Gabrielle","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5087','movie',5087,'{"id":5087,"title":"The Second Wedding Night","director":"Pupi Avati","year":2005,"tmdb_id":56994,"imdb_id":"tt0474917","original_title":"La seconda notte di nozze","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5088','movie',5088,'{"id":5088,"title":"Regular Lovers","director":"Philippe Garrel","year":2004,"tmdb_id":45126,"imdb_id":"tt0443844","original_title":"Les Amants réguliers","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5089','movie',5089,'{"id":5089,"title":"Don''t Tell","director":"Cristina Comencini","year":2005,"tmdb_id":18219,"imdb_id":"tt0443446","original_title":"La bestia nel cuore","original_language":"it","alternate_titles":["The Beast in the Heart"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5090','movie',5090,'{"id":5090,"title":"Romance & Cigarettes","director":"John Turturro","year":2004,"tmdb_id":13994,"imdb_id":"tt0368222","original_title":"Romance & Cigarettes","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5091','movie',5091,'{"id":5091,"title":"Takeshis''","director":"Takeshi Kitano","year":2005,"tmdb_id":20347,"imdb_id":"tt0478044","original_title":"Takeshis''","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5092','movie',5092,'{"id":5092,"title":"Mary","director":"Abel Ferrara","year":2005,"tmdb_id":64942,"imdb_id":"tt0425236","original_title":"Mary","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5093','movie',5093,'{"id":5093,"title":"The Fatalist","director":"João Botelho","year":2005,"tmdb_id":203611,"imdb_id":"tt0472778","original_title":"O Fatalista","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5094','movie',5094,'{"id":5094,"title":"Heading South","director":"Laurent Cantet","year":2005,"tmdb_id":1540,"imdb_id":"tt0381690","original_title":"Vers le sud","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5095','movie',5095,'{"id":5095,"title":"Into Great Silence","director":"Philip Gröning","year":2005,"tmdb_id":11225,"imdb_id":"tt0478160","original_title":"Die große Stille","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5096','movie',5096,'{"id":5096,"title":"Carmen","director":"Jean-Pierre Limosin","year":2005,"tmdb_id":975546,"imdb_id":"tt0874873","original_title":"Carmen","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5097','movie',5097,'{"id":5097,"title":"East of Paradise","director":"Lech Kowalski","year":2005,"tmdb_id":175678,"imdb_id":"tt1300218","original_title":"East of Paradise","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5098','movie',5098,'{"id":5098,"title":"Drawing Restraint 9","director":"Matthew Barney","year":2005,"tmdb_id":34787,"imdb_id":"tt0446685","original_title":"Drawing Restraint 9","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5099','movie',5099,'{"id":5099,"title":"The Secret Life of Words","director":"Isabel Coixet","year":2005,"tmdb_id":148,"imdb_id":"tt0430576","original_title":"The Secret Life of Words","original_language":"en","alternate_titles":["La vida secreta de las palabras"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5100','movie',5100,'{"id":5100,"title":"Musikanten","director":"Franco Battiato","year":2005,"tmdb_id":105766,"imdb_id":"tt0467475","original_title":"Musikanten","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5101','movie',5101,'{"id":5101,"title":"Everything Is Illuminated","director":"Liev Schreiber","year":2005,"tmdb_id":340,"imdb_id":"tt0404030","original_title":"Everything Is Illuminated","original_language":"en","alternate_titles":["The Collector"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5102','movie',5102,'{"id":5102,"title":"First on the Moon","director":"Aleksey Fedorchenko","year":2005,"tmdb_id":25530,"imdb_id":"tt0459929","original_title":"Первые на Луне","original_language":"ru","alternate_titles":["Pervye na lune"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5103','movie',5103,'{"id":5103,"title":"Veruschka: A Life for the Camera","director":"Bernd Böhm, Paul Morrissey","year":2005,"tmdb_id":128268,"imdb_id":"tt0876565","original_title":"Veruschka - Die Inszenierung (m)eines Körpers","original_language":"de","alternate_titles":["Veruschka (m)ein inszenierter Körper","Veruschka"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5104','movie',5104,'{"id":5104,"title":"Vocal Parallels","director":"Rustam Khamdamov","year":2005,"tmdb_id":418771,"imdb_id":"tt0481651","original_title":"Вокалды параллелдер","original_language":"kk","alternate_titles":["Vokaldy paralelder"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5105','movie',5105,'{"id":5105,"title":"Workingman''s Death","director":"Michael Glawogger","year":2005,"tmdb_id":63290,"imdb_id":"tt0478331","original_title":"Workingman''s Death","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5106','movie',5106,'{"id":5106,"title":"Dry Movie","director":"Lírio Ferreira","year":2005,"tmdb_id":40859,"imdb_id":"tt0431615","original_title":"Árido Movie","original_language":"pt","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5107','movie',5107,'{"id":5107,"title":"On the Way","director":"Erden Kıral","year":2005,"tmdb_id":550803,"imdb_id":"tt0431481","original_title":"Yolda","original_language":"tr","alternate_titles":["Yolda - Rüzgar geri getirirse"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5108','movie',5108,'{"id":5108,"title":"The Wild Blue Yonder","director":"Werner Herzog","year":2005,"tmdb_id":8410,"imdb_id":"tt0443693","original_title":"The Wild Blue Yonder","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5109','movie',5109,'{"id":5109,"title":"Persona non grata","director":"Krzysztof Zanussi","year":2005,"tmdb_id":188505,"imdb_id":"tt0472884","original_title":"Persona non grata","original_language":"pl","alternate_titles":["Not Grateful Person"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5110','movie',5110,'{"id":5110,"title":"Fat Girl","director":"Catherine Breillat","year":2000,"tmdb_id":570,"imdb_id":"tt0243255","original_title":"À ma sœur !","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5111','movie',5111,'{"id":5111,"title":"Perpetual Motion","director":"Ning Ying","year":2005,"tmdb_id":307093,"imdb_id":"tt0477927","original_title":"无穷动","original_language":"zh","alternate_titles":["Wu qiong dong","Wuqiong dong"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5112','movie',5112,'{"id":5112,"title":"Betelnut Beauty","director":"Lin Cheng-sheng","year":2000,"tmdb_id":44704,"imdb_id":"tt0275902","original_title":"愛你愛我","original_language":"zh","alternate_titles":["Ai ni ai wo"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5113','movie',5113,'{"id":5113,"title":"Bamboozled","director":"Spike Lee","year":2000,"tmdb_id":24664,"imdb_id":"tt0215545","original_title":"Bamboozled","original_language":"en","alternate_titles":["It''s Showtime"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5114','movie',5114,'{"id":5114,"title":"Chloe","director":"Go Riju","year":2000,"tmdb_id":125803,"imdb_id":"tt0276015","original_title":"クロエ","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5115','movie',5115,'{"id":5115,"title":"Finding Forrester","director":"Gus Van Sant","year":2000,"tmdb_id":711,"imdb_id":"tt0181536","original_title":"Finding Forrester","original_language":"en","alternate_titles":["Forrester - Gefunden!"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5116','movie',5116,'{"id":5116,"title":"Felix and Lola","director":"Patrice Leconte","year":2001,"tmdb_id":76547,"imdb_id":"tt0260036","original_title":"Félix et Lola","original_language":"fr","alternate_titles":["Felix & Lola"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5117','movie',5117,'{"id":5117,"title":"La Ciénaga","director":"Lucrecia Martel","year":2000,"tmdb_id":58429,"imdb_id":"tt0240419","original_title":"La Ciénaga","original_language":"es","alternate_titles":["The Swamp","Der Morast"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5118','movie',5118,'{"id":5118,"title":"His Secret Life","director":"Ferzan Özpetek","year":2000,"tmdb_id":23550,"imdb_id":"tt0274497","original_title":"Le fate ignoranti","original_language":"it","alternate_titles":["(The Ignorant Fairies)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5119','movie',5119,'{"id":5119,"title":"Little Senegal","director":"Rachid Bouchareb","year":2000,"tmdb_id":78123,"imdb_id":"tt0268424","original_title":"Little Senegal","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5120','movie',5120,'{"id":5120,"title":"Inugami","director":"Masato Harada","year":2000,"tmdb_id":68494,"imdb_id":"tt0277044","original_title":"狗神","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5121','movie',5121,'{"id":5121,"title":"My Sweet Home","director":"Filippos Tsitos","year":2000,"tmdb_id":49973,"imdb_id":"tt0274680","original_title":"My Sweet Home","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5122','movie',5122,'{"id":5122,"title":"The Claim","director":"Michael Winterbottom","year":2000,"tmdb_id":44853,"imdb_id":"tt0218378","original_title":"The Claim","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5123','movie',5123,'{"id":5123,"title":"Beijing Bicycle","director":"Wang Xiaoshuai","year":2000,"tmdb_id":12659,"imdb_id":"tt0276501","original_title":"十七岁的单车","original_language":"zh","alternate_titles":["Shi qi sui de dan che"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5124','movie',5124,'{"id":5124,"title":"The Tailor of Panama","director":"John Boorman","year":2000,"tmdb_id":2575,"imdb_id":"tt0236784","original_title":"The Tailor of Panama","original_language":"en","alternate_titles":["Der Schneider von Panama"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5125','movie',5125,'{"id":5125,"title":"Intimacy","director":"Patrice Chéreau","year":2000,"tmdb_id":11845,"imdb_id":"tt0256103","original_title":"Intimacy","original_language":"en","alternate_titles":["Intimität"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5126','movie',5126,'{"id":5126,"title":"Wit","director":"Mike Nichols","year":2001,"tmdb_id":26976,"imdb_id":"tt0243664","original_title":"Wit","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5127','movie',5127,'{"id":5127,"title":"Weiser","director":"Wojciech Marczewski","year":2000,"tmdb_id":168819,"imdb_id":"tt0268032","original_title":"Weiser","original_language":"pl","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5128','movie',5128,'{"id":5128,"title":"Baader","director":"Christopher Roth","year":2002,"tmdb_id":9097,"imdb_id":"tt0309320","original_title":"Baader","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5129','movie',5129,'{"id":5129,"title":"Amen.","director":"Costa-Gavras","year":2002,"tmdb_id":9045,"imdb_id":"tt0280653","original_title":"Amen.","original_language":"fr","alternate_titles":["Der Stellvertreter"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5130','movie',5130,'{"id":5130,"title":"You''re the One","director":"José Luis Garci","year":2000,"tmdb_id":156635,"imdb_id":"tt0266079","original_title":"You''re the one (Una historia de entonces)","original_language":"es","alternate_titles":["You''re the One (A Tale From Then)","You''re The One (Eine Geschichte von damals)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5131','movie',5131,'{"id":5131,"title":"Italian for Beginners","director":"Lone Scherfig","year":2000,"tmdb_id":112,"imdb_id":"tt0243862","original_title":"Italiensk for begyndere","original_language":"da","alternate_titles":["Italienisch für Anfänger"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5132','movie',5132,'{"id":5132,"title":"Bridget","director":"Amos Kollek","year":2001,"tmdb_id":49145,"imdb_id":"tt0309390","original_title":"Bridget","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5133','movie',5133,'{"id":5133,"title":"Beneath Clouds","director":"Ivan Sen","year":2001,"tmdb_id":60109,"imdb_id":"tt0295876","original_title":"Beneath Clouds","original_language":"en","alternate_titles":["Unter Wolken"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5134','movie',5134,'{"id":5134,"title":"A Map of the Heart","director":"Dominik Graf","year":2001,"tmdb_id":85388,"imdb_id":"tt0265188","original_title":"Der Felsen","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5135','movie',5135,'{"id":5135,"title":"Heaven","director":"Tom Tykwer","year":2002,"tmdb_id":10575,"imdb_id":"tt0246677","original_title":"Heaven","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5136','movie',5136,'{"id":5136,"title":"Grill Point","director":"Andreas Dresen","year":2001,"tmdb_id":316,"imdb_id":"tt0304126","original_title":"Halbe Treppe","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5137','movie',5137,'{"id":5137,"title":"Bloody Sunday","director":"Paul Greengrass","year":2002,"tmdb_id":4107,"imdb_id":"tt0280491","original_title":"Bloody Sunday","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5138','movie',5138,'{"id":5138,"title":"KT","director":"Junji Sakamoto","year":2002,"tmdb_id":48212,"imdb_id":"tt0309751","original_title":"KT","original_language":"ja","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5139','movie',5139,'{"id":5139,"title":"Bad Guy","director":"Kim Ki-duk","year":2001,"tmdb_id":25649,"imdb_id":"tt0307213","original_title":"나쁜 남자","original_language":"ko","alternate_titles":["Na-bbun-nam-ja"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5140','movie',5140,'{"id":5140,"title":"Safe Conduct","director":"Bertrand Tavernier","year":2001,"tmdb_id":70443,"imdb_id":"tt0269461","original_title":"Laissez-passer","original_language":"fr","alternate_titles":["Der Passierschein"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5141','movie',5141,'{"id":5141,"title":"Stones","director":"Ramón Salazar","year":2001,"tmdb_id":28204,"imdb_id":"tt0310001","original_title":"Piedras","original_language":"es","alternate_titles":["Steine"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5142','movie',5142,'{"id":5142,"title":"Brucio nel vento","director":"Silvio Soldini","year":2002,"tmdb_id":3983,"imdb_id":"tt0308071","original_title":"Brucio nel vento","original_language":"it","alternate_titles":["Burning In The Wind","Brenne im Wind"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5143','movie',5143,'{"id":5143,"title":"Monday Morning","director":"Otar Iosseliani","year":2001,"tmdb_id":49696,"imdb_id":"tt0284277","original_title":"Lundi matin","original_language":"fr","alternate_titles":["Montag Morgen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5144','movie',5144,'{"id":5144,"title":"Temptations","director":"Zoltán Kamondi","year":2002,"tmdb_id":263069,"imdb_id":"tt0309781","original_title":"Kísértések","original_language":"hu","alternate_titles":["Versuchungen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5145','movie',5145,'{"id":5145,"title":"Minor Mishaps","director":"Annette K. Olesen","year":2001,"tmdb_id":123825,"imdb_id":"tt0306079","original_title":"Små Ulykker","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5146','movie',5146,'{"id":5146,"title":"Alexandra''s Project","director":"Rolf de Heer","year":2002,"tmdb_id":34595,"imdb_id":"tt0338706","original_title":"Alexandra''s Project","original_language":"en","alternate_titles":["Alexandras Projekt"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5147','movie',5147,'{"id":5147,"title":"Confessions of a Dangerous Mind","director":"George Clooney","year":2002,"tmdb_id":4912,"imdb_id":"tt0270288","original_title":"Confessions of a Dangerous Mind","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5148','movie',5148,'{"id":5148,"title":"I''m Not Scared","director":"Gabriele Salvatores","year":2002,"tmdb_id":25300,"imdb_id":"tt0326977","original_title":"Io non ho paura","original_language":"it","alternate_titles":["Ich habe keine Angst"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5149','movie',5149,'{"id":5149,"title":"25th Hour","director":"Spike Lee","year":2002,"tmdb_id":1429,"imdb_id":"tt0307901","original_title":"25th Hour","original_language":"en","alternate_titles":["25 Stunden"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5150','movie',5150,'{"id":5150,"title":"Angst","director":"Oskar Roehler","year":2002,"tmdb_id":10717,"imdb_id":"tt0338714","original_title":"Der alte Affe Angst","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5151','movie',5151,'{"id":5151,"title":"Yes Nurse! No Nurse!","director":"Pieter Kramer","year":2002,"tmdb_id":21896,"imdb_id":"tt0309725","original_title":"Ja Zuster, Nee Zuster","original_language":"nl","alternate_titles":["Ja Schwester, nein Schwester"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5152','movie',5152,'{"id":5152,"title":"Distant Lights","director":"Hans-Christian Schmid","year":2002,"tmdb_id":446,"imdb_id":"tt0351238","original_title":"Lichter","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5153','movie',5153,'{"id":5153,"title":"The Flower of Evil","director":"Claude Chabrol","year":2002,"tmdb_id":10930,"imdb_id":"tt0322289","original_title":"La Fleur du mal","original_language":"fr","alternate_titles":["Die Blume des Bösen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5154','movie',5154,'{"id":5154,"title":"Madame Brouette","director":"Moussa Sène Absa","year":2002,"tmdb_id":86544,"imdb_id":"tt0309577","original_title":"L''extraordinaire destin de Madame Brouette","original_language":"fr","alternate_titles":["Frau Brouette"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5155','movie',5155,'{"id":5155,"title":"Small Cuts","director":"Pascal Bonitzer","year":2003,"tmdb_id":47499,"imdb_id":"tt0304547","original_title":"Petites coupures","original_language":"fr","alternate_titles":["Minor Injuries","Kleine Wunden"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5156','movie',5156,'{"id":5156,"title":"My Life Without Me","director":"Isabel Coixet","year":2002,"tmdb_id":20,"imdb_id":"tt0314412","original_title":"My Life Without Me","original_language":"en","alternate_titles":["Mein Leben ohne mich"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5157','movie',5157,'{"id":5157,"title":"His Brother","director":"Patrice Chéreau","year":2002,"tmdb_id":78208,"imdb_id":"tt0351770","original_title":"Son frère","original_language":"fr","alternate_titles":["Sein Bruder"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5158','movie',5158,'{"id":5158,"title":"The Life of David Gale","director":"Alan Parker","year":2003,"tmdb_id":11615,"imdb_id":"tt0289992","original_title":"The Life of David Gale","original_language":"en","alternate_titles":["Das Leben des David Gale"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5159','movie',5159,'{"id":5159,"title":"Blind Shaft","director":"Li Yang","year":2002,"tmdb_id":11492,"imdb_id":"tt0351299","original_title":"盲井","original_language":"zh","alternate_titles":["Mang Jing","Blinder Schacht"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5160','movie',5160,'{"id":5160,"title":"20 30 40","director":"Sylvia Chang","year":2003,"tmdb_id":76275,"imdb_id":"tt0397229","original_title":"20 30 40","original_language":"cn","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5161','movie',5161,'{"id":5161,"title":"Ae Fond Kiss...","director":"Ken Loach","year":2003,"tmdb_id":1404,"imdb_id":"tt0380366","original_title":"Ae Fond Kiss...","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5162','movie',5162,'{"id":5162,"title":"25 Degrees in Winter","director":"Stéphane Vuillet","year":2003,"tmdb_id":79346,"imdb_id":"tt0356317","original_title":"25 degrés en hiver","original_language":"fr","alternate_titles":["25 Grad im Winter"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5163','movie',5163,'{"id":5163,"title":"Nightsongs","director":"Romuald Karmakar","year":2003,"tmdb_id":144870,"imdb_id":"tt0349865","original_title":"Die Nacht singt ihre Lieder","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5164','movie',5164,'{"id":5164,"title":"Intimate Strangers","director":"Patrice Leconte","year":2004,"tmdb_id":21200,"imdb_id":"tt0363532","original_title":"Confidences trop intimes","original_language":"fr","alternate_titles":["Intimste Fremde"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5165','movie',5165,'{"id":5165,"title":"Spare Parts","director":"Damjan Kozole","year":2002,"tmdb_id":107940,"imdb_id":"tt0334237","original_title":"Rezervni deli","original_language":"sl","alternate_titles":["Ersatzteile"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5166','movie',5166,'{"id":5166,"title":"Lost Embrace","director":"Daniel Burman","year":2004,"tmdb_id":49681,"imdb_id":"tt0366137","original_title":"El abrazo partido","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5167','movie',5167,'{"id":5167,"title":"Your Next Life","director":"Manuel Gutiérrez Aragón","year":2003,"tmdb_id":167074,"imdb_id":"tt0395296","original_title":"La vida que te espera","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5168','movie',5168,'{"id":5168,"title":"In Your Hands","director":"Annette K. Olesen","year":2003,"tmdb_id":33294,"imdb_id":"tt0347016","original_title":"Forbrydelser","original_language":"da","alternate_titles":["In Deinen Händen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5169','movie',5169,'{"id":5169,"title":"Red Lights","director":"Cédric Kahn","year":2003,"tmdb_id":25500,"imdb_id":"tt0365190","original_title":"Feux rouges","original_language":"fr","alternate_titles":["Schlusslichter"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5170','movie',5170,'{"id":5170,"title":"The Final Cut","director":"Omar Naim","year":2003,"tmdb_id":11099,"imdb_id":"tt0364343","original_title":"The Final Cut","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5171','movie',5171,'{"id":5171,"title":"First Love","director":"Matteo Garrone","year":2003,"tmdb_id":62495,"imdb_id":"tt0396818","original_title":"Primo amore","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5172','movie',5172,'{"id":5172,"title":"The Missing","director":"Ron Howard","year":2003,"tmdb_id":12146,"imdb_id":"tt0338188","original_title":"The Missing","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5173','movie',5173,'{"id":5173,"title":"Daybreak","director":"Björn Runge","year":2003,"tmdb_id":25157,"imdb_id":"tt0347457","original_title":"Om jag vänder mig om","original_language":"sv","alternate_titles":["Morgengrauen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5174','movie',5174,'{"id":5174,"title":"Witnesses","director":"Vinko Brešan","year":2003,"tmdb_id":73634,"imdb_id":"tt0347720","original_title":"Svjedoci","original_language":"hr","alternate_titles":["The Witnesses","Die Zeugen"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5175','movie',5175,'{"id":5175,"title":"Triple Agent","director":"Éric Rohmer","year":2004,"tmdb_id":65041,"imdb_id":"tt0374294","original_title":"Triple agent","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5176','movie',5176,'{"id":5176,"title":"Samaritan Girl","director":"Kim Ki-duk","year":2004,"tmdb_id":1279,"imdb_id":"tt0397619","original_title":"사마리아","original_language":"ko","alternate_titles":["Samaria"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5177','movie',5177,'{"id":5177,"title":"Accused","director":"Jacob Thuesen","year":2004,"tmdb_id":15822,"imdb_id":"tt0388727","original_title":"Anklaget","original_language":"da","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5178','movie',5178,'{"id":5178,"title":"In Good Company","director":"Paul Weitz","year":2004,"tmdb_id":1901,"imdb_id":"tt0385267","original_title":"In Good Company","original_language":"en","alternate_titles":["Reine Chefsache"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5179','movie',5179,'{"id":5179,"title":"Asylum","director":"David Mackenzie","year":2004,"tmdb_id":24461,"imdb_id":"tt0348505","original_title":"Asylum","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5180','movie',5180,'{"id":5180,"title":"Fateless","director":"Lajos Koltai","year":2004,"tmdb_id":41508,"imdb_id":"tt0367082","original_title":"Sorstalanság","original_language":"hu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5181','movie',5181,'{"id":5181,"title":"The Hidden Blade","director":"Yoji Yamada","year":2004,"tmdb_id":34019,"imdb_id":"tt0442286","original_title":"隠し剣 鬼の爪","original_language":"ja","alternate_titles":["Kakushi Ken - Oni no Tsume"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5182','movie',5182,'{"id":5182,"title":"Peacock","director":"Gu Changwei","year":2004,"tmdb_id":11728,"imdb_id":"tt0445506","original_title":"孔雀","original_language":"zh","alternate_titles":["Kong que"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5183','movie',5183,'{"id":5183,"title":"The Last Mitterrand","director":"Robert Guédiguian","year":2004,"tmdb_id":54012,"imdb_id":"tt0364301","original_title":"Le Promeneur du Champ de Mars","original_language":"fr","alternate_titles":["Der späte Mitterrand"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5184','movie',5184,'{"id":5184,"title":"Words in Blue","director":"Alain Corneau","year":2004,"tmdb_id":126433,"imdb_id":"tt0417071","original_title":"Les mots bleus","original_language":"fr","alternate_titles":["Worte in Blau"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5185','movie',5185,'{"id":5185,"title":"Changing Times","director":"André Téchiné","year":2004,"tmdb_id":38021,"imdb_id":"tt0399738","original_title":"Les temps qui changent","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5186','movie',5186,'{"id":5186,"title":"Smalltown, Italy","director":"Stefano Mordini","year":2004,"tmdb_id":63275,"imdb_id":"tt0430494","original_title":"Provincia meccanica","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5187','movie',5187,'{"id":5187,"title":"Man to Man","director":"Régis Wargnier","year":2005,"tmdb_id":10087,"imdb_id":"tt0397530","original_title":"Man to Man","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5188','movie',5188,'{"id":5188,"title":"Ghosts","director":"Christian Petzold","year":2004,"tmdb_id":1115,"imdb_id":"tt0419773","original_title":"Gespenster","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5189','movie',5189,'{"id":5189,"title":"Thumbsucker","director":"Mike Mills","year":2004,"tmdb_id":1546,"imdb_id":"tt0318761","original_title":"Thumbsucker","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5190','movie',5190,'{"id":5190,"title":"One Day in Europe","director":"Hannes Stöhr","year":2005,"tmdb_id":9047,"imdb_id":"tt0411427","original_title":"One Day in Europe","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5191','movie',5191,'{"id":5191,"title":"Sometimes in April","director":"Raoul Peck","year":2004,"tmdb_id":16374,"imdb_id":"tt0400063","original_title":"Sometimes in April","original_language":"en","alternate_titles":["Jedes Jahr im April"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5192','movie',5192,'{"id":5192,"title":"U-Carmen eKhayelitsha","director":"Mark Dornford-May","year":2004,"tmdb_id":79706,"imdb_id":"tt0445776","original_title":"U-Carmen eKhayelitsha","original_language":"xh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5193','movie',5193,'{"id":5193,"title":"The Wayward Cloud","director":"Tsai Ming-liang","year":2004,"tmdb_id":36253,"imdb_id":"tt0445760","original_title":"天邊一朵雲","original_language":"zh","alternate_titles":["Tian bian yi duo yun"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5194','movie',5194,'{"id":5194,"title":"Lagaan: Once Upon a Time in India","director":"Ashutosh Gowariker","year":2001,"tmdb_id":19666,"imdb_id":"tt0169102","original_title":"लगान","original_language":"hi","alternate_titles":["Lagaan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5195','movie',5195,'{"id":5195,"title":"Evil","director":"Mikael Håfström","year":2003,"tmdb_id":11197,"imdb_id":"tt0338309","original_title":"Ondskan","original_language":"sv","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5196','movie',5196,'{"id":5196,"title":"Seabiscuit","director":"Gary Ross","year":2003,"tmdb_id":4464,"imdb_id":"tt0329575","original_title":"Seabiscuit","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5197','movie',5197,'{"id":5197,"title":"Everybody''s Famous!","director":"Dominique Deruddere","year":2000,"tmdb_id":58886,"imdb_id":"tt0209037","original_title":"Iedereen beroemd!","original_language":"nl","alternate_titles":["Everybody Famous!"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5198','movie',5198,'{"id":5198,"title":"My Architect: A Son''s Journey","director":"Nathaniel Kahn","year":2003,"tmdb_id":50314,"imdb_id":"tt0373175","original_title":"My Architect: A Son''s Journey","original_language":"en","alternate_titles":["My Architect"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5199','movie',5199,'{"id":5199,"title":"Last Resort","director":"Paweł Pawlikowski","year":2000,"tmdb_id":31875,"imdb_id":"tt0258761","original_title":"Last Resort","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5200','movie',5200,'{"id":5200,"title":"Born into Brothels: Calcutta''s Red Light Kids","director":"Zana Briski, Ross Kauffman","year":2004,"tmdb_id":1392,"imdb_id":"tt0388789","original_title":"Born into Brothels: Calcutta''s Red Light Kids","original_language":"en","alternate_titles":["Born into Brothels"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5201','movie',5201,'{"id":5201,"title":"The Warrior","director":"Asif Kapadia","year":2001,"tmdb_id":23305,"imdb_id":"tt0295682","original_title":"The Warrior","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5202','movie',5202,'{"id":5202,"title":"With a Friend Like Harry...","director":"Dominik Moll","year":2000,"tmdb_id":47943,"imdb_id":"tt0216800","original_title":"Harry, un ami qui vous veut du bien","original_language":"fr","alternate_titles":["Harry, He''s Here To Help (Harry, Un Ami Qui Vous Veut Du Bien)","Harry, He''s Here To Help"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5203','movie',5203,'{"id":5203,"title":"The Girl on the Bridge","director":"Patrice Leconte","year":1999,"tmdb_id":10401,"imdb_id":"tt0144201","original_title":"La Fille sur le pont","original_language":"fr","alternate_titles":["The Girl On The Bridge (La Fille Sur Le Pont)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5204','movie',5204,'{"id":5204,"title":"Devdas","director":"Sanjay Leela Bhansali","year":2002,"tmdb_id":15917,"imdb_id":"tt0238936","original_title":"देवदास","original_language":"hi","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5205','movie',5205,'{"id":5205,"title":"Yesterday","director":"Darrell James Roodt","year":2004,"tmdb_id":6934,"imdb_id":"tt0419279","original_title":"Yesterday","original_language":"zu","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5206','movie',5206,'{"id":5206,"title":"Bad Education","director":"Pedro Almodóvar","year":2004,"tmdb_id":140,"imdb_id":"tt0275491","original_title":"La mala educación","original_language":"es","alternate_titles":["Bad Education (La Mala Educación)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5207','movie',5207,'{"id":5207,"title":"How the Grinch Stole Christmas","director":"Ron Howard","year":2000,"tmdb_id":8871,"imdb_id":"tt0170016","original_title":"How the Grinch Stole Christmas","original_language":"en","alternate_titles":["Dr. Seuss'' How The Grinch Stole Christmas!"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5208','movie',5208,'{"id":5208,"title":"Taurus","director":"Aleksandr Sokurov","year":2001,"tmdb_id":45943,"imdb_id":"tt0283623","original_title":"Телец","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5209','movie',5209,'{"id":5209,"title":"Va Savoir (Who Knows?)","director":"Jacques Rivette","year":2001,"tmdb_id":55372,"imdb_id":"tt0242994","original_title":"Va savoir","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5210','movie',5210,'{"id":5210,"title":"I’m Going Home","director":"Manoel de Oliveira","year":2001,"tmdb_id":49685,"imdb_id":"tt0283422","original_title":"Je rentre à la maison","original_language":"fr","alternate_titles":["VOU PARA CASA","I Am Going Home"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5211','movie',5211,'{"id":5211,"title":"What Time Is It There?","director":"Tsai Ming-liang","year":2001,"tmdb_id":24166,"imdb_id":"tt0269746","original_title":"你那邊幾點","original_language":"zh","alternate_titles":["NI NEI PIEN CHI TIEN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5212','movie',5212,'{"id":5212,"title":"Late Marriage","director":"Dover Koshashvili","year":2001,"tmdb_id":49680,"imdb_id":"tt0287471","original_title":"חתונה מאוחרת","original_language":"he","alternate_titles":["HATOUNA MEHUHERET"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5213','movie',5213,'{"id":5213,"title":"Man Walking on Snow","director":"Masahiro Kobayashi","year":2001,"tmdb_id":47123,"imdb_id":"tt0307971","original_title":"歩く、人","original_language":"ja","alternate_titles":["ARUKU-HITO","THE MAN WALKING ON THE SNOW"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5214','movie',5214,'{"id":5214,"title":"Hijack Stories","director":"Oliver Schmitz","year":2001,"tmdb_id":58169,"imdb_id":"tt0215841","original_title":"Hijack Stories","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5215','movie',5215,'{"id":5215,"title":"Pulse","director":"Kiyoshi Kurosawa","year":2001,"tmdb_id":27324,"imdb_id":"tt0286751","original_title":"回路","original_language":"ja","alternate_titles":["KAIRO"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5216','movie',5216,'{"id":5216,"title":"Lan Yu","director":"Stanley Kwan Kam-pang","year":2001,"tmdb_id":27062,"imdb_id":"tt0292066","original_title":"蓝宇","original_language":"zh","alternate_titles":["LAN YU AND I"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5217','movie',5217,'{"id":5217,"title":"The Chimp","director":"Aktan Arym Kubat","year":2001,"tmdb_id":327042,"imdb_id":"tt0301587","original_title":"Маймыл","original_language":"ky","alternate_titles":["MAIMIL"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5218','movie',5218,'{"id":5218,"title":"The Son","director":"Jean-Pierre Dardenne, Luc Dardenne","year":2002,"tmdb_id":35172,"imdb_id":"tt0291172","original_title":"Le Fils","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5219','movie',5219,'{"id":5219,"title":"Russian Ark","director":"Aleksandr Sokurov","year":2002,"tmdb_id":16646,"imdb_id":"tt0318034","original_title":"Русский ковчег","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5220','movie',5220,'{"id":5220,"title":"Warm Water Under a Red Bridge","director":"Shōhei Imamura","year":2001,"tmdb_id":44768,"imdb_id":"tt0289054","original_title":"赤い橋の下のぬるい水","original_language":"ja","alternate_titles":["AKAI HASHI NOSHITANO NURUI MIZU"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5221','movie',5221,'{"id":5221,"title":"Divine Intervention","director":"Elia Suleiman","year":2002,"tmdb_id":27744,"imdb_id":"tt0274428","original_title":"يد إلهية‎","original_language":"ar","alternate_titles":["YADON ILAHEYYA"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5222','movie',5222,'{"id":5222,"title":"The Road","director":"Darezhan Omirbayev","year":2001,"tmdb_id":129185,"imdb_id":"tt0301481","original_title":"Jol","original_language":"kk","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5223','movie',5223,'{"id":5223,"title":"Marooned in Iraq","director":"Bahman Ghobadi","year":2002,"tmdb_id":13438,"imdb_id":"tt0317226","original_title":"جێھێڵراو لە عێراق","original_language":"ku","alternate_titles":["AVAZHAYÉ SARZAMINÉ MADARIYAM","SONGS FROM MY MOTHER''S COUNTRY","Songs of My Motherland"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5224','movie',5224,'{"id":5224,"title":"Raising Victor Vargas","director":"Peter Sollett","year":2002,"tmdb_id":25461,"imdb_id":"tt0316188","original_title":"Raising Victor Vargas","original_language":"en","alternate_titles":["LONG WAY HOME"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5225','movie',5225,'{"id":5225,"title":"That Day","director":"Raúl Ruiz","year":2003,"tmdb_id":48778,"imdb_id":"tt0343524","original_title":"Ce jour-là","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5226','movie',5226,'{"id":5226,"title":"Ten Minutes Older: The Trumpet","director":"Chen Kaige, Víctor Erice, Werner Herzog, Jim Jarmusch, Aki Kaurismäki, Spike Lee, Wim Wenders","year":2002,"tmdb_id":23676,"imdb_id":"tt0304808","original_title":"Ten Minutes Older: The Trumpet","original_language":"en","alternate_titles":["TEN MINUTES OLDER"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5227','movie',5227,'{"id":5227,"title":"At Five in the Afternoon","director":"Samira Makhmalbaf","year":2003,"tmdb_id":43969,"imdb_id":"tt0363303","original_title":"پنج عصر","original_language":"fa","alternate_titles":["PANJ É ASR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5228','movie',5228,'{"id":5228,"title":"Father and Son","director":"Aleksandr Sokurov","year":2003,"tmdb_id":44513,"imdb_id":"tt0363249","original_title":"Отец и сын","original_language":"ru","alternate_titles":["OTETS Y SYN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5229','movie',5229,'{"id":5229,"title":"Kandahar","director":"Mohsen Makhmalbaf","year":2001,"tmdb_id":28171,"imdb_id":"tt0283431","original_title":"Safar e Ghandehar","original_language":"en","alternate_titles":["SAFAR E GANDEHAR","QANDAHAR"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5230','movie',5230,'{"id":5230,"title":"Playing ''In the Company of Men''","director":"Arnaud Desplechin","year":2003,"tmdb_id":126108,"imdb_id":"tt0353400","original_title":"Léo, en jouant « Dans la compagnie des hommes »","original_language":"fr","alternate_titles":["EN JOUANT “DANS LA COMPAGNIE DES HOMMES”","In the Company of Men"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5231','movie',5231,'{"id":5231,"title":"Where Is Madame Catherine?","director":"Marc Recha","year":2003,"tmdb_id":130268,"imdb_id":"tt0347474","original_title":"Les mans buides","original_language":"fr","alternate_titles":["LES MAINS VIDES"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5232','movie',5232,'{"id":5232,"title":"Shara","director":"Naomi Kawase","year":2003,"tmdb_id":36281,"imdb_id":"tt0363060","original_title":"沙羅双樹","original_language":"ja","alternate_titles":["SHARASOJYU","Sharasojyu"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5233','movie',5233,'{"id":5233,"title":"Robinson''s Crusoe","director":"Lin Cheng-sheng","year":2003,"tmdb_id":259066,"imdb_id":"tt0340642","original_title":"魯賓遜漂流記","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5234','movie',5234,'{"id":5234,"title":"Oldboy","director":"Park Chan-wook","year":2004,"tmdb_id":670,"imdb_id":"tt0364569","original_title":"올드보이","original_language":"ko","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5235','movie',5235,'{"id":5235,"title":"Tropical Malady","director":"Apichatpong Weerasethakul","year":2004,"tmdb_id":11534,"imdb_id":"tt0381668","original_title":"สัตว์ประหลาด","original_language":"th","alternate_titles":["SUD PRALAD"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5236','movie',5236,'{"id":5236,"title":"All Tomorrow''s Parties","director":"Nelson Yu Lik-wai","year":2003,"tmdb_id":100156,"imdb_id":"tt0384804","original_title":"明日天涯","original_language":"zh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5237','movie',5237,'{"id":5237,"title":"The Tulse Luper Suitcases, Part 1: The Moab Story","director":"Peter Greenaway","year":2003,"tmdb_id":3097,"imdb_id":"tt0307596","original_title":"The Tulse Luper Suitcases, Part 1: The Moab Story","original_language":"en","alternate_titles":["THE TULSE LUPER SUITCASES-PART I. THE MOAB STORY"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5238','movie',5238,'{"id":5238,"title":"Northeast","director":"Juan Diego Solanas","year":2005,"tmdb_id":7276,"imdb_id":"tt0398664","original_title":"Nordeste","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5239','movie',5239,'{"id":5239,"title":"Schizo","director":"Gulshat Omarova","year":2004,"tmdb_id":47200,"imdb_id":"tt0406216","original_title":"Шиzа","original_language":"ru","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5240','movie',5240,'{"id":5240,"title":"Alexandria... New York","director":"Youssef Chahine","year":2004,"tmdb_id":193314,"imdb_id":"tt0416465","original_title":"إسكندرية نيويورك","original_language":"ar","alternate_titles":["ALEXANDRIE… NEW YORK"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5241','movie',5241,'{"id":5241,"title":"Far Away","director":"André Téchiné","year":2000,"tmdb_id":38304,"imdb_id":"tt0258242","original_title":"Loin","original_language":"fr","alternate_titles":["Far"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5242','movie',5242,'{"id":5242,"title":"Sword In The Moon","director":"Kim Ui-seok","year":2004,"tmdb_id":13512,"imdb_id":"tt0370402","original_title":"청풍명월","original_language":"ko","alternate_titles":["CHEONG-PUNG-MYEONG-WEOL (SWORD IN THE MOON)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5243','movie',5243,'{"id":5243,"title":"Saturday","director":"Juan Villegas","year":2001,"tmdb_id":123450,"imdb_id":"tt0284537","original_title":"Sábado","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5244','movie',5244,'{"id":5244,"title":"Quitting","director":"Zhang Yang","year":2001,"tmdb_id":87481,"imdb_id":"tt0298238","original_title":"昨天","original_language":"zh","alternate_titles":["Zuotian"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5245','movie',5245,'{"id":5245,"title":"House of Fools","director":"Andrei Konchalovsky","year":2002,"tmdb_id":72996,"imdb_id":"tt0332605","original_title":"Дом дураков","original_language":"ru","alternate_titles":["Dom durakov","Dom durakov - La maison de fous"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5246','movie',5246,'{"id":5246,"title":"Springtime in a Small Town","director":"Tian Zhuangzhuang","year":2002,"tmdb_id":61485,"imdb_id":"tt0332831","original_title":"小城之春","original_language":"zh","alternate_titles":["Xiao cheng zhi chun"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5247','movie',5247,'{"id":5247,"title":"Shadow Kill","director":"Adoor Gopalakrishnan","year":2002,"tmdb_id":255294,"imdb_id":"tt0329429","original_title":"നിഴല്‍ക്കുത്ത്","original_language":"ml","alternate_titles":["Nizhalkkuthu","Nizhalkkuthu / Ombres obscures"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5248','movie',5248,'{"id":5248,"title":"Loving Glances","director":"Srđan Karanović","year":2003,"tmdb_id":54633,"imdb_id":"tt0335426","original_title":"Sjaj u ocima","original_language":"sh","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5249','movie',5249,'{"id":5249,"title":"Schultze Gets the Blues","director":"Michael Schorr","year":2003,"tmdb_id":9483,"imdb_id":"tt0388395","original_title":"Schultze Gets the Blues","original_language":"de","alternate_titles":["Schultze Get the Blues"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5250','movie',5250,'{"id":5250,"title":"A Place Among the Living","director":"Raúl Ruiz","year":2003,"tmdb_id":200002,"imdb_id":"tt0408295","original_title":"Une place parmi les vivants","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5251','movie',5251,'{"id":5251,"title":"Gilles'' Wife","director":"Frédéric Fonteyne","year":2004,"tmdb_id":61814,"imdb_id":"tt0382691","original_title":"La Femme de Gilles","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5252','movie',5252,'{"id":5252,"title":"Te lo leggo negli occhi","director":"Valia Santella","year":2004,"tmdb_id":62272,"imdb_id":"tt0432131","original_title":"Te lo leggo negli occhi","original_language":"it","alternate_titles":["I Can See It in Your Eyes"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5253','movie',5253,'{"id":5253,"title":"L''amore imperfetto","director":"Giovanni Davide Maderna","year":2001,"tmdb_id":420710,"imdb_id":"tt0312354","original_title":"L''amore imperfetto","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5254','movie',5254,'{"id":5254,"title":"Probably Love","director":"Giuseppe Bertolucci","year":2000,"tmdb_id":502928,"imdb_id":"tt0152083","original_title":"L''amore probabilmente","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5255','movie',5255,'{"id":5255,"title":"Low Life","director":"Im Kwon-taek","year":2004,"tmdb_id":177152,"imdb_id":"tt0403100","original_title":"하류인생","original_language":"ko","alternate_titles":["Haryu insaeng","Riding the Tiger","Jailbreak","Raging Years"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5256','movie',5256,'{"id":5256,"title":"Everlasting Regret","director":"Stanley Kwan Kam-pang","year":2005,"tmdb_id":47293,"imdb_id":"tt0475263","original_title":"長恨歌","original_language":"zh","alternate_titles":["Changhen ge"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5257','movie',5257,'{"id":5257,"title":"Dignity of the Nobodies","director":"Fernando E. Solanas","year":2005,"tmdb_id":98020,"imdb_id":"tt0480126","original_title":"La Dignidad de los Nadies","original_language":"es","alternate_titles":["The Dignity of the Nobodies"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5258','movie',5258,'{"id":5258,"title":"Stray Dogs","director":"Marziyeh Meshkiny","year":2004,"tmdb_id":43973,"imdb_id":"tt0423277","original_title":"سگ‌های ولگرد","original_language":"fa","alternate_titles":["Sag-haye velgard"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5259','movie',5259,'{"id":5259,"title":"Joint Security Area","director":"Park Chan-wook","year":2000,"tmdb_id":2440,"imdb_id":"tt0260991","original_title":"공동경비구역 JSA","original_language":"ko","alternate_titles":["Gong dong kyung bi gu yuk JSA","J.S.A. (Joint Security Area)"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5260','movie',5260,'{"id":5260,"title":"One Day in August","director":"Constantine Giannaris","year":2001,"tmdb_id":47844,"imdb_id":"tt0251661","original_title":"Δεκαπενταύγουστος","original_language":"el","alternate_titles":["Dekapentavgoustos","Ein Tag im August"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5261','movie',5261,'{"id":5261,"title":"The Beautiful Country","director":"Hans Petter Moland","year":2003,"tmdb_id":41714,"imdb_id":"tt0273108","original_title":"The Beautiful Country","original_language":"en","alternate_titles":["Beautiful Country"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5262','movie',5262,'{"id":5262,"title":"Passages","director":"Yang Chao","year":2004,"tmdb_id":299285,"imdb_id":"tt0415948","original_title":"旅程","original_language":"zh","alternate_titles":["LU CHENG","The Journey"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5263','movie',5263,'{"id":5263,"title":"The Weeping Meadow","director":"Theo Angelopoulos","year":2003,"tmdb_id":37952,"imdb_id":"tt0366721","original_title":"Το Λιβάδι που δακρύζει","original_language":"el","alternate_titles":["Trilogia: To livadi pou dakrisi","Trilogy: The Weeping Meadow","Trilogie: Die Erde weint"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5264','movie',5264,'{"id":5264,"title":"In My Country","director":"John Boorman","year":2003,"tmdb_id":16635,"imdb_id":"tt0349260","original_title":"In My Country","original_language":"en","alternate_titles":["Country Of My Skull"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5265','movie',5265,'{"id":5265,"title":"Dam Street","director":"Li Yu","year":2005,"tmdb_id":99735,"imdb_id":"tt0477719","original_title":"红颜","original_language":"zh","alternate_titles":["Hongyan"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5266','movie',5266,'{"id":5266,"title":"Legacy","director":"Tod Lending","year":2000,"tmdb_id":26779,"imdb_id":"tt0188028","original_title":"Legacy","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5267','movie',5267,'{"id":5267,"title":"Angel on the Right","director":"Jamshed Usmonov","year":2002,"tmdb_id":125936,"imdb_id":"tt0317476","original_title":"Фариштаи китфи рост","original_language":"tg","alternate_titles":["FARISHTAY KITFI ROST"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5268','movie',5268,'{"id":5268,"title":"Sacrifices","director":"Ossama Mohammed","year":2002,"tmdb_id":342697,"imdb_id":"tt0303792","original_title":"صندوق الدنيا","original_language":"ar","alternate_titles":["SUNDÛQ AL-DUNYÂ","Sunduq al-dunyâ"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5269','movie',5269,'{"id":5269,"title":"Hotel","director":"Jessica Hausner","year":2004,"tmdb_id":52251,"imdb_id":"tt0415855","original_title":"Hotel","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5270','movie',5270,'{"id":5270,"title":"Marock","director":"Laïla Marrakchi","year":2005,"tmdb_id":61686,"imdb_id":"tt0415147","original_title":"Marock","original_language":"fr","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5271','movie',5271,'{"id":5271,"title":"Cry Woman","director":"Liu Bingjian","year":2002,"tmdb_id":99333,"imdb_id":"tt0317269","original_title":"哭泣的女人","original_language":"zh","alternate_titles":["KU QI DE NÜ REN"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5272','movie',5272,'{"id":5272,"title":"Blood","director":"Amat Escalante","year":2005,"tmdb_id":84848,"imdb_id":"tt0445694","original_title":"Sangre","original_language":"es","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5273','movie',5273,'{"id":5273,"title":"My God, My God, Why Hast Thou Forsaken Me?","director":"Shinji Aoyama","year":2005,"tmdb_id":95240,"imdb_id":"tt0461769","original_title":"エリ・エリ・レマ・サバクタニ","original_language":"ja","alternate_titles":["ELI, ELI, LEMA SABACHTHANI?","Eri Eri rema sabakutani"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5274','movie',5274,'{"id":5274,"title":"The King","director":"James Marsh","year":2005,"tmdb_id":20021,"imdb_id":"tt0396688","original_title":"The King","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5275','movie',5275,'{"id":5275,"title":"Eden","director":"Amos Gitai","year":2001,"tmdb_id":99637,"imdb_id":"tt0271017","original_title":"Eden","original_language":"en","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5276','movie',5276,'{"id":5276,"title":"One Night","director":"Niki Karimi","year":2005,"tmdb_id":389486,"imdb_id":"tt0470612","original_title":"یک شب","original_language":"fa","alternate_titles":["YEK SHAB"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5277','movie',5277,'{"id":5277,"title":"Texas","director":"Fausto Paravidino","year":2005,"tmdb_id":82824,"imdb_id":"tt0446602","original_title":"Texas","original_language":"it","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5278','movie',5278,'{"id":5278,"title":"Delivery","director":"Nikos Panayotopoulos","year":2004,"tmdb_id":203723,"imdb_id":"tt0431720","original_title":"Delivery","original_language":"el","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5279','movie',5279,'{"id":5279,"title":"The Sun","director":"Aleksandr Sokurov","year":2004,"tmdb_id":98246,"imdb_id":"tt0439817","original_title":"Солнце","original_language":"ru","alternate_titles":["Solnze","Die Sonne"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5280','movie',5280,'{"id":5280,"title":"17 fois Cécile Cassard","director":"Christophe Honoré","year":2002,"tmdb_id":62415,"imdb_id":"tt0296591","original_title":"17 fois Cécile Cassard","original_language":"fr","alternate_titles":["DIX-SEPT FOIS CECILE CASSARD","Seventeen Times Cécile Cassard","17 Times Cécile Cassard"]}'::jsonb,true) on conflict do nothing;
insert into public.media_catalogue(work_key,work_type,film_id,metadata,is_static) values('movie:5281','movie',5281,'{"id":5281,"title":"September","director":"Max Färberböck","year":2003,"tmdb_id":385138,"imdb_id":"tt0308865","original_title":"September","original_language":"de","alternate_titles":[]}'::jsonb,true) on conflict do nothing;
insert into public.media_provider_links values('movie:146','movie:4683') on conflict do nothing;
insert into public.media_provider_links values('movie:1900','movie:4684') on conflict do nothing;
insert into public.media_provider_links values('movie:5001','movie:4685') on conflict do nothing;
insert into public.media_provider_links values('movie:8358','movie:4686') on conflict do nothing;
insert into public.media_provider_links values('movie:12509','movie:4687') on conflict do nothing;
insert into public.media_provider_links values('movie:10876','movie:4688') on conflict do nothing;
insert into public.media_provider_links values('movie:6521','movie:4689') on conflict do nothing;
insert into public.media_provider_links values('movie:14295','movie:4690') on conflict do nothing;
insert into public.media_provider_links values('movie:11004','movie:4691') on conflict do nothing;
insert into public.media_provider_links values('movie:10873','movie:4692') on conflict do nothing;
insert into public.media_provider_links values('movie:10697','movie:4693') on conflict do nothing;
insert into public.media_provider_links values('movie:58062','movie:4694') on conflict do nothing;
insert into public.media_provider_links values('movie:95682','movie:4695') on conflict do nothing;
insert into public.media_provider_links values('movie:70564','movie:4696') on conflict do nothing;
insert into public.media_provider_links values('movie:62529','movie:4697') on conflict do nothing;
insert into public.media_provider_links values('movie:1999','movie:4698') on conflict do nothing;
insert into public.media_provider_links values('movie:29937','movie:4699') on conflict do nothing;
insert into public.media_provider_links values('movie:10950','movie:4700') on conflict do nothing;
insert into public.media_provider_links values('movie:8489','movie:4701') on conflict do nothing;
insert into public.media_provider_links values('movie:824','movie:4702') on conflict do nothing;
insert into public.media_provider_links values('movie:1365','movie:4703') on conflict do nothing;
insert into public.media_provider_links values('movie:11889','movie:4704') on conflict do nothing;
insert into public.media_provider_links values('movie:11826','movie:4705') on conflict do nothing;
insert into public.media_provider_links values('movie:19460','movie:4706') on conflict do nothing;
insert into public.media_provider_links values('movie:51391','movie:4707') on conflict do nothing;
insert into public.media_provider_links values('movie:8342','movie:4708') on conflict do nothing;
insert into public.media_provider_links values('movie:51722','movie:4709') on conflict do nothing;
insert into public.media_provider_links values('movie:38880','movie:4710') on conflict do nothing;
insert into public.media_provider_links values('movie:112906','movie:4711') on conflict do nothing;
insert into public.media_provider_links values('movie:12722','movie:4712') on conflict do nothing;
insert into public.media_provider_links values('movie:12589','movie:4713') on conflict do nothing;
insert into public.media_provider_links values('movie:590','movie:4714') on conflict do nothing;
insert into public.media_provider_links values('movie:64','movie:4715') on conflict do nothing;
insert into public.media_provider_links values('movie:1574','movie:4716') on conflict do nothing;
insert into public.media_provider_links values('movie:8198','movie:4717') on conflict do nothing;
insert into public.media_provider_links values('movie:2755','movie:4718') on conflict do nothing;
insert into public.media_provider_links values('movie:6007','movie:4719') on conflict do nothing;
insert into public.media_provider_links values('movie:2251','movie:4720') on conflict do nothing;
insert into public.media_provider_links values('movie:10712','movie:4721') on conflict do nothing;
insert into public.media_provider_links values('movie:245','movie:4722') on conflict do nothing;
insert into public.media_provider_links values('movie:1591','movie:4723') on conflict do nothing;
insert into public.media_provider_links values('movie:1391','movie:4724') on conflict do nothing;
insert into public.media_provider_links values('movie:542','movie:4725') on conflict do nothing;
insert into public.media_provider_links values('movie:7294','movie:4726') on conflict do nothing;
insert into public.media_provider_links values('movie:16539','movie:4727') on conflict do nothing;
insert into public.media_provider_links values('movie:112902','movie:4728') on conflict do nothing;
insert into public.media_provider_links values('movie:67232','movie:4729') on conflict do nothing;
insert into public.media_provider_links values('movie:11516','movie:4730') on conflict do nothing;
insert into public.media_provider_links values('movie:1430','movie:4731') on conflict do nothing;
insert into public.media_provider_links values('movie:8619','movie:4732') on conflict do nothing;
insert into public.media_provider_links values('movie:598','movie:4733') on conflict do nothing;
insert into public.media_provider_links values('movie:11093','movie:4734') on conflict do nothing;
insert into public.media_provider_links values('movie:2289','movie:4735') on conflict do nothing;
insert into public.media_provider_links values('movie:504','movie:4736') on conflict do nothing;
insert into public.media_provider_links values('movie:1088','movie:4737') on conflict do nothing;
insert into public.media_provider_links values('movie:6964','movie:4738') on conflict do nothing;
insert into public.media_provider_links values('movie:16636','movie:4739') on conflict do nothing;
insert into public.media_provider_links values('movie:10511','movie:4740') on conflict do nothing;
insert into public.media_provider_links values('movie:11023','movie:4741') on conflict do nothing;
insert into public.media_provider_links values('movie:11042','movie:4742') on conflict do nothing;
insert into public.media_provider_links values('movie:3472','movie:4743') on conflict do nothing;
insert into public.media_provider_links values('movie:616','movie:4744') on conflict do nothing;
insert into public.media_provider_links values('movie:2771','movie:4745') on conflict do nothing;
insert into public.media_provider_links values('movie:12496','movie:4746') on conflict do nothing;
insert into public.media_provider_links values('movie:16132','movie:4747') on conflict do nothing;
insert into public.media_provider_links values('movie:10744','movie:4748') on conflict do nothing;
insert into public.media_provider_links values('movie:19765','movie:4749') on conflict do nothing;
insert into public.media_provider_links values('movie:12698','movie:4750') on conflict do nothing;
insert into public.media_provider_links values('movie:27915','movie:4751') on conflict do nothing;
insert into public.media_provider_links values('movie:2260','movie:4752') on conflict do nothing;
insert into public.media_provider_links values('movie:1550','movie:4753') on conflict do nothing;
insert into public.media_provider_links values('movie:14108','movie:4754') on conflict do nothing;
insert into public.media_provider_links values('movie:10009','movie:4755') on conflict do nothing;
insert into public.media_provider_links values('movie:866','movie:4756') on conflict do nothing;
insert into public.media_provider_links values('movie:9675','movie:4757') on conflict do nothing;
insert into public.media_provider_links values('movie:11109','movie:4758') on conflict do nothing;
insert into public.media_provider_links values('movie:9662','movie:4759') on conflict do nothing;
insert into public.media_provider_links values('movie:1677','movie:4760') on conflict do nothing;
insert into public.media_provider_links values('movie:11184','movie:4761') on conflict do nothing;
insert into public.media_provider_links values('movie:18701','movie:4762') on conflict do nothing;
insert into public.media_provider_links values('movie:1653','movie:4763') on conflict do nothing;
insert into public.media_provider_links values('movie:464','movie:4764') on conflict do nothing;
insert into public.media_provider_links values('movie:1913','movie:4765') on conflict do nothing;
insert into public.media_provider_links values('movie:436','movie:4766') on conflict do nothing;
insert into public.media_provider_links values('movie:613','movie:4767') on conflict do nothing;
insert into public.media_provider_links values('movie:1114','movie:4768') on conflict do nothing;
insert into public.media_provider_links values('movie:1538','movie:4769') on conflict do nothing;
insert into public.media_provider_links values('movie:34581','movie:4770') on conflict do nothing;
insert into public.media_provider_links values('movie:9372','movie:4771') on conflict do nothing;
insert into public.media_provider_links values('movie:21525','movie:4772') on conflict do nothing;
insert into public.media_provider_links values('movie:25520','movie:4773') on conflict do nothing;
insert into public.media_provider_links values('movie:226','movie:4774') on conflict do nothing;
insert into public.media_provider_links values('movie:243','movie:4775') on conflict do nothing;
insert into public.media_provider_links values('movie:6440','movie:4776') on conflict do nothing;
insert into public.media_provider_links values('movie:26290','movie:4777') on conflict do nothing;
insert into public.media_provider_links values('movie:1791','movie:4778') on conflict do nothing;
insert into public.media_provider_links values('movie:480','movie:4779') on conflict do nothing;
insert into public.media_provider_links values('movie:36093','movie:4780') on conflict do nothing;
insert into public.media_provider_links values('movie:8094','movie:4781') on conflict do nothing;
insert into public.media_provider_links values('movie:587','movie:4782') on conflict do nothing;
insert into public.media_provider_links values('movie:11194','movie:4783') on conflict do nothing;
insert into public.media_provider_links values('movie:455','movie:4784') on conflict do nothing;
insert into public.media_provider_links values('movie:59210','movie:4785') on conflict do nothing;
insert into public.media_provider_links values('movie:3635','movie:4786') on conflict do nothing;
insert into public.media_provider_links values('movie:36791','movie:4787') on conflict do nothing;
insert into public.media_provider_links values('movie:338','movie:4788') on conflict do nothing;
insert into public.media_provider_links values('movie:9709','movie:4789') on conflict do nothing;
insert into public.media_provider_links values('movie:12877','movie:4790') on conflict do nothing;
insert into public.media_provider_links values('movie:5168','movie:4791') on conflict do nothing;
insert into public.media_provider_links values('movie:14462','movie:4792') on conflict do nothing;
insert into public.media_provider_links values('movie:17771','movie:4793') on conflict do nothing;
insert into public.media_provider_links values('movie:13785','movie:4794') on conflict do nothing;
insert into public.media_provider_links values('movie:29458','movie:4795') on conflict do nothing;
insert into public.media_provider_links values('movie:48217','movie:4796') on conflict do nothing;
insert into public.media_provider_links values('movie:10480','movie:4797') on conflict do nothing;
insert into public.media_provider_links values('movie:2360','movie:4798') on conflict do nothing;
insert into public.media_provider_links values('movie:24936','movie:4799') on conflict do nothing;
insert into public.media_provider_links values('movie:10569','movie:4800') on conflict do nothing;
insert into public.media_provider_links values('movie:3172','movie:4801') on conflict do nothing;
insert into public.media_provider_links values('movie:13403','movie:4802') on conflict do nothing;
insert into public.media_provider_links values('movie:11457','movie:4803') on conflict do nothing;
insert into public.media_provider_links values('movie:2111','movie:4804') on conflict do nothing;
insert into public.media_provider_links values('movie:29339','movie:4805') on conflict do nothing;
insert into public.media_provider_links values('movie:9685','movie:4806') on conflict do nothing;
insert into public.media_provider_links values('movie:9034','movie:4807') on conflict do nothing;
insert into public.media_provider_links values('movie:11013','movie:4808') on conflict do nothing;
insert into public.media_provider_links values('movie:14757','movie:4809') on conflict do nothing;
insert into public.media_provider_links values('movie:10629','movie:4810') on conflict do nothing;
insert into public.media_provider_links values('movie:10934','movie:4811') on conflict do nothing;
insert into public.media_provider_links values('movie:337','movie:4812') on conflict do nothing;
insert into public.media_provider_links values('movie:8696','movie:4813') on conflict do nothing;
insert into public.media_provider_links values('movie:1584','movie:4814') on conflict do nothing;
insert into public.media_provider_links values('movie:13537','movie:4815') on conflict do nothing;
insert into public.media_provider_links values('movie:9550','movie:4816') on conflict do nothing;
insert into public.media_provider_links values('movie:2841','movie:4817') on conflict do nothing;
insert into public.media_provider_links values('movie:10740','movie:4818') on conflict do nothing;
insert into public.media_provider_links values('movie:9953','movie:4819') on conflict do nothing;
insert into public.media_provider_links values('movie:15237','movie:4820') on conflict do nothing;
insert into public.media_provider_links values('movie:9801','movie:4821') on conflict do nothing;
insert into public.media_provider_links values('movie:5528','movie:4822') on conflict do nothing;
insert into public.media_provider_links values('movie:6478','movie:4823') on conflict do nothing;
insert into public.media_provider_links values('movie:182134','movie:4824') on conflict do nothing;
insert into public.media_provider_links values('movie:25051','movie:4825') on conflict do nothing;
insert into public.media_provider_links values('movie:47254','movie:4826') on conflict do nothing;
insert into public.media_provider_links values('movie:11447','movie:4827') on conflict do nothing;
insert into public.media_provider_links values('movie:52717','movie:4828') on conflict do nothing;
insert into public.media_provider_links values('movie:11553','movie:4829') on conflict do nothing;
insert into public.media_provider_links values('movie:64481','movie:4830') on conflict do nothing;
insert into public.media_provider_links values('movie:163650','movie:4831') on conflict do nothing;
insert into public.media_provider_links values('movie:56798','movie:4832') on conflict do nothing;
insert into public.media_provider_links values('movie:5955','movie:4833') on conflict do nothing;
insert into public.media_provider_links values('movie:326622','movie:4834') on conflict do nothing;
insert into public.media_provider_links values('movie:82550','movie:4835') on conflict do nothing;
insert into public.media_provider_links values('movie:13245','movie:4836') on conflict do nothing;
insert into public.media_provider_links values('movie:47297','movie:4837') on conflict do nothing;
insert into public.media_provider_links values('movie:307358','movie:4838') on conflict do nothing;
insert into public.media_provider_links values('movie:217309','movie:4839') on conflict do nothing;
insert into public.media_provider_links values('movie:125815','movie:4840') on conflict do nothing;
insert into public.media_provider_links values('movie:2805','movie:4841') on conflict do nothing;
insert into public.media_provider_links values('movie:48601','movie:4842') on conflict do nothing;
insert into public.media_provider_links values('movie:29135','movie:4843') on conflict do nothing;
insert into public.media_provider_links values('movie:94649','movie:4844') on conflict do nothing;
insert into public.media_provider_links values('movie:121883','movie:4845') on conflict do nothing;
insert into public.media_provider_links values('movie:49110','movie:4846') on conflict do nothing;
insert into public.media_provider_links values('movie:125809','movie:4847') on conflict do nothing;
insert into public.media_provider_links values('movie:248624','movie:4848') on conflict do nothing;
insert into public.media_provider_links values('movie:26475','movie:4849') on conflict do nothing;
insert into public.media_provider_links values('movie:2750','movie:4850') on conflict do nothing;
insert into public.media_provider_links values('movie:16550','movie:4851') on conflict do nothing;
insert into public.media_provider_links values('movie:24488','movie:4852') on conflict do nothing;
insert into public.media_provider_links values('movie:979','movie:4853') on conflict do nothing;
insert into public.media_provider_links values('movie:125945','movie:4854') on conflict do nothing;
insert into public.media_provider_links values('movie:52999','movie:4855') on conflict do nothing;
insert into public.media_provider_links values('movie:12513','movie:4856') on conflict do nothing;
insert into public.media_provider_links values('movie:18302','movie:4857') on conflict do nothing;
insert into public.media_provider_links values('movie:65045','movie:4858') on conflict do nothing;
insert into public.media_provider_links values('movie:103701','movie:4859') on conflict do nothing;
insert into public.media_provider_links values('movie:80243','movie:4860') on conflict do nothing;
insert into public.media_provider_links values('movie:9613','movie:4861') on conflict do nothing;
insert into public.media_provider_links values('movie:1376','movie:4862') on conflict do nothing;
insert into public.media_provider_links values('movie:12454','movie:4863') on conflict do nothing;
insert into public.media_provider_links values('movie:14633','movie:4864') on conflict do nothing;
insert into public.media_provider_links values('movie:44408','movie:4865') on conflict do nothing;
insert into public.media_provider_links values('movie:57100','movie:4866') on conflict do nothing;
insert into public.media_provider_links values('movie:83505','movie:4867') on conflict do nothing;
insert into public.media_provider_links values('movie:47226','movie:4868') on conflict do nothing;
insert into public.media_provider_links values('movie:125937','movie:4869') on conflict do nothing;
insert into public.media_provider_links values('movie:49475','movie:4870') on conflict do nothing;
insert into public.media_provider_links values('movie:46993','movie:4871') on conflict do nothing;
insert into public.media_provider_links values('movie:79084','movie:4872') on conflict do nothing;
insert into public.media_provider_links values('movie:47046','movie:4873') on conflict do nothing;
insert into public.media_provider_links values('movie:367852','movie:4874') on conflict do nothing;
insert into public.media_provider_links values('movie:263209','movie:4875') on conflict do nothing;
insert into public.media_provider_links values('movie:41187','movie:4876') on conflict do nothing;
insert into public.media_provider_links values('movie:50956','movie:4877') on conflict do nothing;
insert into public.media_provider_links values('movie:8440','movie:4878') on conflict do nothing;
insert into public.media_provider_links values('movie:1807','movie:4879') on conflict do nothing;
insert into public.media_provider_links values('movie:462725','movie:4880') on conflict do nothing;
insert into public.media_provider_links values('movie:26886','movie:4881') on conflict do nothing;
insert into public.media_provider_links values('movie:57424','movie:4882') on conflict do nothing;
insert into public.media_provider_links values('movie:51865','movie:4883') on conflict do nothing;
insert into public.media_provider_links values('movie:68970','movie:4884') on conflict do nothing;
insert into public.media_provider_links values('movie:34561','movie:4885') on conflict do nothing;
insert into public.media_provider_links values('movie:302','movie:4886') on conflict do nothing;
insert into public.media_provider_links values('movie:67236','movie:4887') on conflict do nothing;
insert into public.media_provider_links values('movie:38018','movie:4888') on conflict do nothing;
insert into public.media_provider_links values('movie:260524','movie:4889') on conflict do nothing;
insert into public.media_provider_links values('movie:12703','movie:4890') on conflict do nothing;
insert into public.media_provider_links values('movie:255962','movie:4891') on conflict do nothing;
insert into public.media_provider_links values('movie:11659','movie:4892') on conflict do nothing;
insert into public.media_provider_links values('movie:216214','movie:4893') on conflict do nothing;
insert into public.media_provider_links values('movie:13433','movie:4894') on conflict do nothing;
insert into public.media_provider_links values('movie:58739','movie:4895') on conflict do nothing;
insert into public.media_provider_links values('movie:99698','movie:4896') on conflict do nothing;
insert into public.media_provider_links values('movie:102533','movie:4897') on conflict do nothing;
insert into public.media_provider_links values('movie:6000','movie:4898') on conflict do nothing;
insert into public.media_provider_links values('movie:48861','movie:4899') on conflict do nothing;
insert into public.media_provider_links values('movie:40427','movie:4900') on conflict do nothing;
insert into public.media_provider_links values('movie:237','movie:4901') on conflict do nothing;
insert into public.media_provider_links values('movie:38086','movie:4902') on conflict do nothing;
insert into public.media_provider_links values('movie:39851','movie:4903') on conflict do nothing;
insert into public.media_provider_links values('movie:18497','movie:4904') on conflict do nothing;
insert into public.media_provider_links values('movie:276','movie:4905') on conflict do nothing;
insert into public.media_provider_links values('movie:1777','movie:4906') on conflict do nothing;
insert into public.media_provider_links values('movie:2517','movie:4907') on conflict do nothing;
insert into public.media_provider_links values('movie:16447','movie:4908') on conflict do nothing;
insert into public.media_provider_links values('movie:12140','movie:4909') on conflict do nothing;
insert into public.media_provider_links values('movie:44413','movie:4910') on conflict do nothing;
insert into public.media_provider_links values('movie:11399','movie:4911') on conflict do nothing;
insert into public.media_provider_links values('movie:48121','movie:4912') on conflict do nothing;
insert into public.media_provider_links values('movie:20128','movie:4913') on conflict do nothing;
insert into public.media_provider_links values('movie:78134','movie:4914') on conflict do nothing;
insert into public.media_provider_links values('movie:78293','movie:4915') on conflict do nothing;
insert into public.media_provider_links values('movie:56785','movie:4916') on conflict do nothing;
insert into public.media_provider_links values('movie:20511','movie:4917') on conflict do nothing;
insert into public.media_provider_links values('movie:10609','movie:4918') on conflict do nothing;
insert into public.media_provider_links values('movie:121102','movie:4919') on conflict do nothing;
insert into public.media_provider_links values('movie:2702','movie:4920') on conflict do nothing;
insert into public.media_provider_links values('movie:153770','movie:4921') on conflict do nothing;
insert into public.media_provider_links values('movie:8981','movie:4922') on conflict do nothing;
insert into public.media_provider_links values('movie:39504','movie:4923') on conflict do nothing;
insert into public.media_provider_links values('movie:83827','movie:4924') on conflict do nothing;
insert into public.media_provider_links values('movie:61681','movie:4925') on conflict do nothing;
insert into public.media_provider_links values('movie:5204','movie:4926') on conflict do nothing;
insert into public.media_provider_links values('movie:16729','movie:4927') on conflict do nothing;
insert into public.media_provider_links values('movie:842','movie:4928') on conflict do nothing;
insert into public.media_provider_links values('movie:36971','movie:4929') on conflict do nothing;
insert into public.media_provider_links values('movie:39798','movie:4930') on conflict do nothing;
insert into public.media_provider_links values('movie:3527','movie:4931') on conflict do nothing;
insert into public.media_provider_links values('movie:16605','movie:4932') on conflict do nothing;
insert into public.media_provider_links values('movie:18747','movie:4933') on conflict do nothing;
insert into public.media_provider_links values('movie:17247','movie:4934') on conflict do nothing;
insert into public.media_provider_links values('movie:445','movie:4935') on conflict do nothing;
insert into public.media_provider_links values('movie:1665','movie:4936') on conflict do nothing;
insert into public.media_provider_links values('movie:1622','movie:4937') on conflict do nothing;
insert into public.media_provider_links values('movie:7483','movie:4938') on conflict do nothing;
insert into public.media_provider_links values('movie:1951','movie:4939') on conflict do nothing;
insert into public.media_provider_links values('movie:15702','movie:4940') on conflict do nothing;
insert into public.media_provider_links values('movie:126300','movie:4941') on conflict do nothing;
insert into public.media_provider_links values('movie:57425','movie:4942') on conflict do nothing;
insert into public.media_provider_links values('movie:101908','movie:4943') on conflict do nothing;
insert into public.media_provider_links values('movie:11554','movie:4944') on conflict do nothing;
insert into public.media_provider_links values('movie:8053','movie:4945') on conflict do nothing;
insert into public.media_provider_links values('movie:43420','movie:4946') on conflict do nothing;
insert into public.media_provider_links values('movie:240647','movie:4947') on conflict do nothing;
insert into public.media_provider_links values('movie:7870','movie:4948') on conflict do nothing;
insert into public.media_provider_links values('movie:8443','movie:4949') on conflict do nothing;
insert into public.media_provider_links values('movie:85550','movie:4950') on conflict do nothing;
insert into public.media_provider_links values('movie:64509','movie:4951') on conflict do nothing;
insert into public.media_provider_links values('movie:49256','movie:4952') on conflict do nothing;
insert into public.media_provider_links values('movie:1963','movie:4953') on conflict do nothing;
insert into public.media_provider_links values('movie:95801','movie:4954') on conflict do nothing;
insert into public.media_provider_links values('movie:9729','movie:4955') on conflict do nothing;
insert into public.media_provider_links values('movie:240646','movie:4956') on conflict do nothing;
insert into public.media_provider_links values('movie:2566','movie:4957') on conflict do nothing;
insert into public.media_provider_links values('movie:83221','movie:4958') on conflict do nothing;
insert into public.media_provider_links values('movie:73129','movie:4959') on conflict do nothing;
insert into public.media_provider_links values('movie:36637','movie:4960') on conflict do nothing;
insert into public.media_provider_links values('movie:9517','movie:4961') on conflict do nothing;
insert into public.media_provider_links values('movie:5177','movie:4962') on conflict do nothing;
insert into public.media_provider_links values('movie:123690','movie:4963') on conflict do nothing;
insert into public.media_provider_links values('movie:110305','movie:4964') on conflict do nothing;
insert into public.media_provider_links values('movie:60278','movie:4965') on conflict do nothing;
insert into public.media_provider_links values('movie:99963','movie:4966') on conflict do nothing;
insert into public.media_provider_links values('movie:46098','movie:4967') on conflict do nothing;
insert into public.media_provider_links values('movie:203746','movie:4968') on conflict do nothing;
insert into public.media_provider_links values('movie:43772','movie:4969') on conflict do nothing;
insert into public.media_provider_links values('movie:9025','movie:4970') on conflict do nothing;
insert into public.media_provider_links values('movie:203745','movie:4971') on conflict do nothing;
insert into public.media_provider_links values('movie:25650','movie:4972') on conflict do nothing;
insert into public.media_provider_links values('movie:35824','movie:4973') on conflict do nothing;
insert into public.media_provider_links values('movie:9081','movie:4974') on conflict do nothing;
insert into public.media_provider_links values('movie:522612','movie:4975') on conflict do nothing;
insert into public.media_provider_links values('movie:103692','movie:4976') on conflict do nothing;
insert into public.media_provider_links values('movie:59858','movie:4977') on conflict do nothing;
insert into public.media_provider_links values('movie:89800','movie:4978') on conflict do nothing;
insert into public.media_provider_links values('movie:200989','movie:4979') on conflict do nothing;
insert into public.media_provider_links values('movie:68569','movie:4980') on conflict do nothing;
insert into public.media_provider_links values('movie:374586','movie:4981') on conflict do nothing;
insert into public.media_provider_links values('movie:35337','movie:4982') on conflict do nothing;
insert into public.media_provider_links values('movie:53482','movie:4983') on conflict do nothing;
insert into public.media_provider_links values('movie:35651','movie:4984') on conflict do nothing;
insert into public.media_provider_links values('movie:44517','movie:4985') on conflict do nothing;
insert into public.media_provider_links values('movie:27142','movie:4986') on conflict do nothing;
insert into public.media_provider_links values('movie:17734','movie:4987') on conflict do nothing;
insert into public.media_provider_links values('movie:67384','movie:4988') on conflict do nothing;
insert into public.media_provider_links values('movie:208583','movie:4989') on conflict do nothing;
insert into public.media_provider_links values('movie:116034','movie:4990') on conflict do nothing;
insert into public.media_provider_links values('movie:47855','movie:4991') on conflict do nothing;
insert into public.media_provider_links values('movie:49915','movie:4992') on conflict do nothing;
insert into public.media_provider_links values('movie:77873','movie:4993') on conflict do nothing;
insert into public.media_provider_links values('movie:1360','movie:4994') on conflict do nothing;
insert into public.media_provider_links values('movie:10630','movie:4995') on conflict do nothing;
insert into public.media_provider_links values('movie:64523','movie:4996') on conflict do nothing;
insert into public.media_provider_links values('movie:154146','movie:4997') on conflict do nothing;
insert into public.media_provider_links values('movie:22016','movie:4998') on conflict do nothing;
insert into public.media_provider_links values('movie:26955','movie:4999') on conflict do nothing;
insert into public.media_provider_links values('movie:121036','movie:5000') on conflict do nothing;
insert into public.media_provider_links values('movie:203738','movie:5001') on conflict do nothing;
insert into public.media_provider_links values('movie:64389','movie:5002') on conflict do nothing;
insert into public.media_provider_links values('movie:1740','movie:5003') on conflict do nothing;
insert into public.media_provider_links values('movie:82832','movie:5004') on conflict do nothing;
insert into public.media_provider_links values('movie:7090','movie:5005') on conflict do nothing;
insert into public.media_provider_links values('movie:13439','movie:5006') on conflict do nothing;
insert into public.media_provider_links values('movie:15186','movie:5007') on conflict do nothing;
insert into public.media_provider_links values('movie:61665','movie:5008') on conflict do nothing;
insert into public.media_provider_links values('movie:101564','movie:5009') on conflict do nothing;
insert into public.media_provider_links values('movie:1238980','movie:5010') on conflict do nothing;
insert into public.media_provider_links values('movie:164635','movie:5011') on conflict do nothing;
insert into public.media_provider_links values('movie:101569','movie:5012') on conflict do nothing;
insert into public.media_provider_links values('movie:74660','movie:5013') on conflict do nothing;
insert into public.media_provider_links values('movie:604159','movie:5014') on conflict do nothing;
insert into public.media_provider_links values('movie:114860','movie:5015') on conflict do nothing;
insert into public.media_provider_links values('movie:478401','movie:5016') on conflict do nothing;
insert into public.media_provider_links values('movie:33431','movie:5017') on conflict do nothing;
insert into public.media_provider_links values('movie:45044','movie:5018') on conflict do nothing;
insert into public.media_provider_links values('movie:272879','movie:5019') on conflict do nothing;
insert into public.media_provider_links values('movie:292533','movie:5020') on conflict do nothing;
insert into public.media_provider_links values('movie:83277','movie:5021') on conflict do nothing;
insert into public.media_provider_links values('movie:61952','movie:5022') on conflict do nothing;
insert into public.media_provider_links values('movie:2577','movie:5023') on conflict do nothing;
insert into public.media_provider_links values('movie:34036','movie:5024') on conflict do nothing;
insert into public.media_provider_links values('movie:30735','movie:5025') on conflict do nothing;
insert into public.media_provider_links values('movie:56616','movie:5026') on conflict do nothing;
insert into public.media_provider_links values('movie:154155','movie:5027') on conflict do nothing;
insert into public.media_provider_links values('movie:18461','movie:5028') on conflict do nothing;
insert into public.media_provider_links values('movie:50900','movie:5029') on conflict do nothing;
insert into public.media_provider_links values('movie:6317','movie:5030') on conflict do nothing;
insert into public.media_provider_links values('movie:24164','movie:5031') on conflict do nothing;
insert into public.media_provider_links values('movie:44086','movie:5032') on conflict do nothing;
insert into public.media_provider_links values('movie:36401','movie:5033') on conflict do nothing;
insert into public.media_provider_links values('movie:112183','movie:5034') on conflict do nothing;
insert into public.media_provider_links values('movie:26636','movie:5035') on conflict do nothing;
insert into public.media_provider_links values('movie:95536','movie:5036') on conflict do nothing;
insert into public.media_provider_links values('movie:95728','movie:5037') on conflict do nothing;
insert into public.media_provider_links values('movie:38244','movie:5038') on conflict do nothing;
insert into public.media_provider_links values('movie:90838','movie:5039') on conflict do nothing;
insert into public.media_provider_links values('movie:336802','movie:5040') on conflict do nothing;
insert into public.media_provider_links values('movie:77562','movie:5041') on conflict do nothing;
insert into public.media_provider_links values('movie:59062','movie:5042') on conflict do nothing;
insert into public.media_provider_links values('movie:961208','movie:5043') on conflict do nothing;
insert into public.media_provider_links values('movie:174702','movie:5044') on conflict do nothing;
insert into public.media_provider_links values('movie:84739','movie:5045') on conflict do nothing;
insert into public.media_provider_links values('movie:257740','movie:5046') on conflict do nothing;
insert into public.media_provider_links values('movie:11606','movie:5047') on conflict do nothing;
insert into public.media_provider_links values('movie:37232','movie:5048') on conflict do nothing;
insert into public.media_provider_links values('movie:56946','movie:5049') on conflict do nothing;
insert into public.media_provider_links values('movie:12456','movie:5050') on conflict do nothing;
insert into public.media_provider_links values('movie:14198','movie:5051') on conflict do nothing;
insert into public.media_provider_links values('movie:12580','movie:5052') on conflict do nothing;
insert into public.media_provider_links values('movie:331629','movie:5053') on conflict do nothing;
insert into public.media_provider_links values('movie:79767','movie:5054') on conflict do nothing;
insert into public.media_provider_links values('movie:1925','movie:5055') on conflict do nothing;
insert into public.media_provider_links values('movie:41865','movie:5056') on conflict do nothing;
insert into public.media_provider_links values('movie:350089','movie:5057') on conflict do nothing;
insert into public.media_provider_links values('movie:58531','movie:5058') on conflict do nothing;
insert into public.media_provider_links values('movie:213489','movie:5059') on conflict do nothing;
insert into public.media_provider_links values('movie:274974','movie:5060') on conflict do nothing;
insert into public.media_provider_links values('movie:178469','movie:5061') on conflict do nothing;
insert into public.media_provider_links values('movie:11171','movie:5062') on conflict do nothing;
insert into public.media_provider_links values('movie:116550','movie:5063') on conflict do nothing;
insert into public.media_provider_links values('movie:36215','movie:5064') on conflict do nothing;
insert into public.media_provider_links values('movie:241413','movie:5065') on conflict do nothing;
insert into public.media_provider_links values('movie:65513','movie:5066') on conflict do nothing;
insert into public.media_provider_links values('movie:1280','movie:5067') on conflict do nothing;
insert into public.media_provider_links values('movie:4974','movie:5068') on conflict do nothing;
insert into public.media_provider_links values('movie:52512','movie:5069') on conflict do nothing;
insert into public.media_provider_links values('movie:1595','movie:5070') on conflict do nothing;
insert into public.media_provider_links values('movie:57626','movie:5071') on conflict do nothing;
insert into public.media_provider_links values('movie:13073','movie:5072') on conflict do nothing;
insert into public.media_provider_links values('movie:44524','movie:5073') on conflict do nothing;
insert into public.media_provider_links values('movie:42420','movie:5074') on conflict do nothing;
insert into public.media_provider_links values('movie:41292','movie:5075') on conflict do nothing;
insert into public.media_provider_links values('movie:48870','movie:5076') on conflict do nothing;
insert into public.media_provider_links values('movie:47143','movie:5077') on conflict do nothing;
insert into public.media_provider_links values('movie:11632','movie:5078') on conflict do nothing;
insert into public.media_provider_links values('movie:95307','movie:5079') on conflict do nothing;
insert into public.media_provider_links values('movie:48590','movie:5080') on conflict do nothing;
insert into public.media_provider_links values('movie:57113','movie:5081') on conflict do nothing;
insert into public.media_provider_links values('movie:191608','movie:5082') on conflict do nothing;
insert into public.media_provider_links values('movie:4550','movie:5083') on conflict do nothing;
insert into public.media_provider_links values('movie:62487','movie:5084') on conflict do nothing;
insert into public.media_provider_links values('movie:129937','movie:5085') on conflict do nothing;
insert into public.media_provider_links values('movie:32687','movie:5086') on conflict do nothing;
insert into public.media_provider_links values('movie:56994','movie:5087') on conflict do nothing;
insert into public.media_provider_links values('movie:45126','movie:5088') on conflict do nothing;
insert into public.media_provider_links values('movie:18219','movie:5089') on conflict do nothing;
insert into public.media_provider_links values('movie:13994','movie:5090') on conflict do nothing;
insert into public.media_provider_links values('movie:20347','movie:5091') on conflict do nothing;
insert into public.media_provider_links values('movie:64942','movie:5092') on conflict do nothing;
insert into public.media_provider_links values('movie:203611','movie:5093') on conflict do nothing;
insert into public.media_provider_links values('movie:1540','movie:5094') on conflict do nothing;
insert into public.media_provider_links values('movie:11225','movie:5095') on conflict do nothing;
insert into public.media_provider_links values('movie:975546','movie:5096') on conflict do nothing;
insert into public.media_provider_links values('movie:175678','movie:5097') on conflict do nothing;
insert into public.media_provider_links values('movie:34787','movie:5098') on conflict do nothing;
insert into public.media_provider_links values('movie:148','movie:5099') on conflict do nothing;
insert into public.media_provider_links values('movie:105766','movie:5100') on conflict do nothing;
insert into public.media_provider_links values('movie:340','movie:5101') on conflict do nothing;
insert into public.media_provider_links values('movie:25530','movie:5102') on conflict do nothing;
insert into public.media_provider_links values('movie:128268','movie:5103') on conflict do nothing;
insert into public.media_provider_links values('movie:418771','movie:5104') on conflict do nothing;
insert into public.media_provider_links values('movie:63290','movie:5105') on conflict do nothing;
insert into public.media_provider_links values('movie:40859','movie:5106') on conflict do nothing;
insert into public.media_provider_links values('movie:550803','movie:5107') on conflict do nothing;
insert into public.media_provider_links values('movie:8410','movie:5108') on conflict do nothing;
insert into public.media_provider_links values('movie:188505','movie:5109') on conflict do nothing;
insert into public.media_provider_links values('movie:570','movie:5110') on conflict do nothing;
insert into public.media_provider_links values('movie:307093','movie:5111') on conflict do nothing;
insert into public.media_provider_links values('movie:44704','movie:5112') on conflict do nothing;
insert into public.media_provider_links values('movie:24664','movie:5113') on conflict do nothing;
insert into public.media_provider_links values('movie:125803','movie:5114') on conflict do nothing;
insert into public.media_provider_links values('movie:711','movie:5115') on conflict do nothing;
insert into public.media_provider_links values('movie:76547','movie:5116') on conflict do nothing;
insert into public.media_provider_links values('movie:58429','movie:5117') on conflict do nothing;
insert into public.media_provider_links values('movie:23550','movie:5118') on conflict do nothing;
insert into public.media_provider_links values('movie:78123','movie:5119') on conflict do nothing;
insert into public.media_provider_links values('movie:68494','movie:5120') on conflict do nothing;
insert into public.media_provider_links values('movie:49973','movie:5121') on conflict do nothing;
insert into public.media_provider_links values('movie:44853','movie:5122') on conflict do nothing;
insert into public.media_provider_links values('movie:12659','movie:5123') on conflict do nothing;
insert into public.media_provider_links values('movie:2575','movie:5124') on conflict do nothing;
insert into public.media_provider_links values('movie:11845','movie:5125') on conflict do nothing;
insert into public.media_provider_links values('movie:26976','movie:5126') on conflict do nothing;
insert into public.media_provider_links values('movie:168819','movie:5127') on conflict do nothing;
insert into public.media_provider_links values('movie:9097','movie:5128') on conflict do nothing;
insert into public.media_provider_links values('movie:9045','movie:5129') on conflict do nothing;
insert into public.media_provider_links values('movie:156635','movie:5130') on conflict do nothing;
insert into public.media_provider_links values('movie:112','movie:5131') on conflict do nothing;
insert into public.media_provider_links values('movie:49145','movie:5132') on conflict do nothing;
insert into public.media_provider_links values('movie:60109','movie:5133') on conflict do nothing;
insert into public.media_provider_links values('movie:85388','movie:5134') on conflict do nothing;
insert into public.media_provider_links values('movie:10575','movie:5135') on conflict do nothing;
insert into public.media_provider_links values('movie:316','movie:5136') on conflict do nothing;
insert into public.media_provider_links values('movie:4107','movie:5137') on conflict do nothing;
insert into public.media_provider_links values('movie:48212','movie:5138') on conflict do nothing;
insert into public.media_provider_links values('movie:25649','movie:5139') on conflict do nothing;
insert into public.media_provider_links values('movie:70443','movie:5140') on conflict do nothing;
insert into public.media_provider_links values('movie:28204','movie:5141') on conflict do nothing;
insert into public.media_provider_links values('movie:3983','movie:5142') on conflict do nothing;
insert into public.media_provider_links values('movie:49696','movie:5143') on conflict do nothing;
insert into public.media_provider_links values('movie:263069','movie:5144') on conflict do nothing;
insert into public.media_provider_links values('movie:123825','movie:5145') on conflict do nothing;
insert into public.media_provider_links values('movie:34595','movie:5146') on conflict do nothing;
insert into public.media_provider_links values('movie:4912','movie:5147') on conflict do nothing;
insert into public.media_provider_links values('movie:25300','movie:5148') on conflict do nothing;
insert into public.media_provider_links values('movie:1429','movie:5149') on conflict do nothing;
insert into public.media_provider_links values('movie:10717','movie:5150') on conflict do nothing;
insert into public.media_provider_links values('movie:21896','movie:5151') on conflict do nothing;
insert into public.media_provider_links values('movie:446','movie:5152') on conflict do nothing;
insert into public.media_provider_links values('movie:10930','movie:5153') on conflict do nothing;
insert into public.media_provider_links values('movie:86544','movie:5154') on conflict do nothing;
insert into public.media_provider_links values('movie:47499','movie:5155') on conflict do nothing;
insert into public.media_provider_links values('movie:20','movie:5156') on conflict do nothing;
insert into public.media_provider_links values('movie:78208','movie:5157') on conflict do nothing;
insert into public.media_provider_links values('movie:11615','movie:5158') on conflict do nothing;
insert into public.media_provider_links values('movie:11492','movie:5159') on conflict do nothing;
insert into public.media_provider_links values('movie:76275','movie:5160') on conflict do nothing;
insert into public.media_provider_links values('movie:1404','movie:5161') on conflict do nothing;
insert into public.media_provider_links values('movie:79346','movie:5162') on conflict do nothing;
insert into public.media_provider_links values('movie:144870','movie:5163') on conflict do nothing;
insert into public.media_provider_links values('movie:21200','movie:5164') on conflict do nothing;
insert into public.media_provider_links values('movie:107940','movie:5165') on conflict do nothing;
insert into public.media_provider_links values('movie:49681','movie:5166') on conflict do nothing;
insert into public.media_provider_links values('movie:167074','movie:5167') on conflict do nothing;
insert into public.media_provider_links values('movie:33294','movie:5168') on conflict do nothing;
insert into public.media_provider_links values('movie:25500','movie:5169') on conflict do nothing;
insert into public.media_provider_links values('movie:11099','movie:5170') on conflict do nothing;
insert into public.media_provider_links values('movie:62495','movie:5171') on conflict do nothing;
insert into public.media_provider_links values('movie:12146','movie:5172') on conflict do nothing;
insert into public.media_provider_links values('movie:25157','movie:5173') on conflict do nothing;
insert into public.media_provider_links values('movie:73634','movie:5174') on conflict do nothing;
insert into public.media_provider_links values('movie:65041','movie:5175') on conflict do nothing;
insert into public.media_provider_links values('movie:1279','movie:5176') on conflict do nothing;
insert into public.media_provider_links values('movie:15822','movie:5177') on conflict do nothing;
insert into public.media_provider_links values('movie:1901','movie:5178') on conflict do nothing;
insert into public.media_provider_links values('movie:24461','movie:5179') on conflict do nothing;
insert into public.media_provider_links values('movie:41508','movie:5180') on conflict do nothing;
insert into public.media_provider_links values('movie:34019','movie:5181') on conflict do nothing;
insert into public.media_provider_links values('movie:11728','movie:5182') on conflict do nothing;
insert into public.media_provider_links values('movie:54012','movie:5183') on conflict do nothing;
insert into public.media_provider_links values('movie:126433','movie:5184') on conflict do nothing;
insert into public.media_provider_links values('movie:38021','movie:5185') on conflict do nothing;
insert into public.media_provider_links values('movie:63275','movie:5186') on conflict do nothing;
insert into public.media_provider_links values('movie:10087','movie:5187') on conflict do nothing;
insert into public.media_provider_links values('movie:1115','movie:5188') on conflict do nothing;
insert into public.media_provider_links values('movie:1546','movie:5189') on conflict do nothing;
insert into public.media_provider_links values('movie:9047','movie:5190') on conflict do nothing;
insert into public.media_provider_links values('movie:16374','movie:5191') on conflict do nothing;
insert into public.media_provider_links values('movie:79706','movie:5192') on conflict do nothing;
insert into public.media_provider_links values('movie:36253','movie:5193') on conflict do nothing;
insert into public.media_provider_links values('movie:19666','movie:5194') on conflict do nothing;
insert into public.media_provider_links values('movie:11197','movie:5195') on conflict do nothing;
insert into public.media_provider_links values('movie:4464','movie:5196') on conflict do nothing;
insert into public.media_provider_links values('movie:58886','movie:5197') on conflict do nothing;
insert into public.media_provider_links values('movie:50314','movie:5198') on conflict do nothing;
insert into public.media_provider_links values('movie:31875','movie:5199') on conflict do nothing;
insert into public.media_provider_links values('movie:1392','movie:5200') on conflict do nothing;
insert into public.media_provider_links values('movie:23305','movie:5201') on conflict do nothing;
insert into public.media_provider_links values('movie:47943','movie:5202') on conflict do nothing;
insert into public.media_provider_links values('movie:10401','movie:5203') on conflict do nothing;
insert into public.media_provider_links values('movie:15917','movie:5204') on conflict do nothing;
insert into public.media_provider_links values('movie:6934','movie:5205') on conflict do nothing;
insert into public.media_provider_links values('movie:140','movie:5206') on conflict do nothing;
insert into public.media_provider_links values('movie:8871','movie:5207') on conflict do nothing;
insert into public.media_provider_links values('movie:45943','movie:5208') on conflict do nothing;
insert into public.media_provider_links values('movie:55372','movie:5209') on conflict do nothing;
insert into public.media_provider_links values('movie:49685','movie:5210') on conflict do nothing;
insert into public.media_provider_links values('movie:24166','movie:5211') on conflict do nothing;
insert into public.media_provider_links values('movie:49680','movie:5212') on conflict do nothing;
insert into public.media_provider_links values('movie:47123','movie:5213') on conflict do nothing;
insert into public.media_provider_links values('movie:58169','movie:5214') on conflict do nothing;
insert into public.media_provider_links values('movie:27324','movie:5215') on conflict do nothing;
insert into public.media_provider_links values('movie:27062','movie:5216') on conflict do nothing;
insert into public.media_provider_links values('movie:327042','movie:5217') on conflict do nothing;
insert into public.media_provider_links values('movie:35172','movie:5218') on conflict do nothing;
insert into public.media_provider_links values('movie:16646','movie:5219') on conflict do nothing;
insert into public.media_provider_links values('movie:44768','movie:5220') on conflict do nothing;
insert into public.media_provider_links values('movie:27744','movie:5221') on conflict do nothing;
insert into public.media_provider_links values('movie:129185','movie:5222') on conflict do nothing;
insert into public.media_provider_links values('movie:13438','movie:5223') on conflict do nothing;
insert into public.media_provider_links values('movie:25461','movie:5224') on conflict do nothing;
insert into public.media_provider_links values('movie:48778','movie:5225') on conflict do nothing;
insert into public.media_provider_links values('movie:23676','movie:5226') on conflict do nothing;
insert into public.media_provider_links values('movie:43969','movie:5227') on conflict do nothing;
insert into public.media_provider_links values('movie:44513','movie:5228') on conflict do nothing;
insert into public.media_provider_links values('movie:28171','movie:5229') on conflict do nothing;
insert into public.media_provider_links values('movie:126108','movie:5230') on conflict do nothing;
insert into public.media_provider_links values('movie:130268','movie:5231') on conflict do nothing;
insert into public.media_provider_links values('movie:36281','movie:5232') on conflict do nothing;
insert into public.media_provider_links values('movie:259066','movie:5233') on conflict do nothing;
insert into public.media_provider_links values('movie:670','movie:5234') on conflict do nothing;
insert into public.media_provider_links values('movie:11534','movie:5235') on conflict do nothing;
insert into public.media_provider_links values('movie:100156','movie:5236') on conflict do nothing;
insert into public.media_provider_links values('movie:3097','movie:5237') on conflict do nothing;
insert into public.media_provider_links values('movie:7276','movie:5238') on conflict do nothing;
insert into public.media_provider_links values('movie:47200','movie:5239') on conflict do nothing;
insert into public.media_provider_links values('movie:193314','movie:5240') on conflict do nothing;
insert into public.media_provider_links values('movie:38304','movie:5241') on conflict do nothing;
insert into public.media_provider_links values('movie:13512','movie:5242') on conflict do nothing;
insert into public.media_provider_links values('movie:123450','movie:5243') on conflict do nothing;
insert into public.media_provider_links values('movie:87481','movie:5244') on conflict do nothing;
insert into public.media_provider_links values('movie:72996','movie:5245') on conflict do nothing;
insert into public.media_provider_links values('movie:61485','movie:5246') on conflict do nothing;
insert into public.media_provider_links values('movie:255294','movie:5247') on conflict do nothing;
insert into public.media_provider_links values('movie:54633','movie:5248') on conflict do nothing;
insert into public.media_provider_links values('movie:9483','movie:5249') on conflict do nothing;
insert into public.media_provider_links values('movie:200002','movie:5250') on conflict do nothing;
insert into public.media_provider_links values('movie:61814','movie:5251') on conflict do nothing;
insert into public.media_provider_links values('movie:62272','movie:5252') on conflict do nothing;
insert into public.media_provider_links values('movie:420710','movie:5253') on conflict do nothing;
insert into public.media_provider_links values('movie:502928','movie:5254') on conflict do nothing;
insert into public.media_provider_links values('movie:177152','movie:5255') on conflict do nothing;
insert into public.media_provider_links values('movie:47293','movie:5256') on conflict do nothing;
insert into public.media_provider_links values('movie:98020','movie:5257') on conflict do nothing;
insert into public.media_provider_links values('movie:43973','movie:5258') on conflict do nothing;
insert into public.media_provider_links values('movie:2440','movie:5259') on conflict do nothing;
insert into public.media_provider_links values('movie:47844','movie:5260') on conflict do nothing;
insert into public.media_provider_links values('movie:41714','movie:5261') on conflict do nothing;
insert into public.media_provider_links values('movie:299285','movie:5262') on conflict do nothing;
insert into public.media_provider_links values('movie:37952','movie:5263') on conflict do nothing;
insert into public.media_provider_links values('movie:16635','movie:5264') on conflict do nothing;
insert into public.media_provider_links values('movie:99735','movie:5265') on conflict do nothing;
insert into public.media_provider_links values('movie:26779','movie:5266') on conflict do nothing;
insert into public.media_provider_links values('movie:125936','movie:5267') on conflict do nothing;
insert into public.media_provider_links values('movie:342697','movie:5268') on conflict do nothing;
insert into public.media_provider_links values('movie:52251','movie:5269') on conflict do nothing;
insert into public.media_provider_links values('movie:61686','movie:5270') on conflict do nothing;
insert into public.media_provider_links values('movie:99333','movie:5271') on conflict do nothing;
insert into public.media_provider_links values('movie:84848','movie:5272') on conflict do nothing;
insert into public.media_provider_links values('movie:95240','movie:5273') on conflict do nothing;
insert into public.media_provider_links values('movie:20021','movie:5274') on conflict do nothing;
insert into public.media_provider_links values('movie:99637','movie:5275') on conflict do nothing;
insert into public.media_provider_links values('movie:389486','movie:5276') on conflict do nothing;
insert into public.media_provider_links values('movie:82824','movie:5277') on conflict do nothing;
insert into public.media_provider_links values('movie:203723','movie:5278') on conflict do nothing;
insert into public.media_provider_links values('movie:98246','movie:5279') on conflict do nothing;
insert into public.media_provider_links values('movie:62415','movie:5280') on conflict do nothing;
insert into public.media_provider_links values('movie:385138','movie:5281') on conflict do nothing;
commit;

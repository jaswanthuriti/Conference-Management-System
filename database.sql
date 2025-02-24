/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - conference
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`conference` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `conference`;

/*Table structure for table `assignpaper` */

DROP TABLE IF EXISTS `assignpaper`;

CREATE TABLE `assignpaper` (
  `id` int(11) NOT NULL auto_increment,
  `pid` varchar(100) default NULL,
  `paper` varchar(100) default NULL,
  `reviewer` varchar(100) default NULL,
  `status` varchar(100) default NULL,
  `feedback` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `assignpaper` */

insert  into `assignpaper`(`id`,`pid`,`paper`,`reviewer`,`status`,`feedback`) values (1,'3','ANALYSIS OF WOMEN SAFETY IN INDIAN CITIES USING.pdf','kishan','Done','Accepted'),(2,'2','Using_Wearables_and_Machine_Learning (1).pdf','abc','Done','Accepted'),(3,'2','Using_Wearables_and_Machine_Learning (1).pdf','kishan','waiting','waiting'),(5,'1','ANALYSIS OF WOMEN SAFETY IN INDIAN CITIES USING.pdf','kishan','Done','Accepted');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL auto_increment,
  `paper_id` varchar(20) default NULL,
  `author_name` varchar(50) default NULL,
  `card_no` varchar(50) default NULL,
  `cvv` varchar(5) default NULL,
  `amount` varchar(20) default NULL,
  `payment_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `psection` varchar(100) default NULL,
  `months` varchar(100) default NULL,
  `emi` varchar(100) default NULL,
  `invoice` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`id`,`paper_id`,`author_name`,`card_no`,`cvv`,`amount`,`payment_date`,`psection`,`months`,`emi`,`invoice`) values (2,'2','venkatesh','1234567890988','123','15000','2023-04-07 16:52:10','Scopus Index mode','3','5000.0','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 327>>stream\nxœÍR[OÂ0~ß¯8¼A\"³İ¸eo3,:À¬hHH–²Wí\\[”ïˆ/šìAã8OM¿~—sNß¬b¹¡ÔBĞÅ£Óáúv€ì¬6ü­–ãuèÏ	óÇE0ñ¡C^*YôC½İ=OÕfùe_sg,Ï¥m·Z•jÊhéÁ‰Wª™ÊìÆ\r–ô¸gBC¤©6Êƒh5™øQÔ¸)©P4Ñ\\\n¦ô\\ÜÇ=ÇA3B.\ZöİáE\rş?Üµ4Ñe’„)µ3ù\n³Í¹ÊX\nGiJ(hÁJxç:ÍuÎ<X).ã§ját›3S‘Æ!M2.X|_İŠ\n®µÛ´ñ¦céî\n¸€(‘…Qˆ”}À^¦¬ù?C¤¦9Œ÷Òíî#„jßùaàÁ	µëñ/P\n)p/j…çâ’Ùx~ëÅêêëÁúh’.è\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407165210+05\'30\')/CreationDate(D:20230407165210+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000566 00000 n \n0000000015 00000 n \n0000000654 00000 n \n0000000409 00000 n \n0000000717 00000 n \n0000000762 00000 n \ntrailer\n<</Info 6 0 R/ID [<b09881e509efe184ec2f5dc1d89157b0><5feb564f8522a4f928f200f99329d057>]/Root 5 0 R/Size 7>>\nstartxref\n898\n%%EOF\n'),(3,'2','venkatesh','1234567890988','123','15000','2023-04-07 16:53:57','Scopus Index mode','3','5000.0','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 328>>stream\nxœÍRMOÂ@¼÷WŒ\' ‘º-ØŞjh”ÓECBÒ,íb«e·v·(ÿŞ/šô ±	¼Ódggæ½}ûfÜP£ç`@ĞØ èZƒ#¸ºµ`Ù [£¿Õb¸šz3\nö8÷G:ô¥²%?ÜÛİÓTm/¿œ«qí„g™4Í‹‹³êjÌYábÏÅ+Ó\\%fãvØq¡h¦Kå\"XF^4C&‹t*ü±›c÷«oU¨_aû¬ş?Ú•,‘°=‡*£ˆ+µ-³òr“¥*á1²,³œxOuêŒ£…¥JÅsøTmœm2®B&âpÊ¢$<¼¯NEE×æ­ÛÖºcæñ­K¤A$óRÁ1ÿÀNÆ¼ùoC¥f†;Y\níÂº&„ÔŞó¦¾‹#kÖó_>S)t¢Ğ;«-JK\'ÃÙVóå7Ö£Æƒñ	SÔ/2\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407165357+05\'30\')/CreationDate(D:20230407165357+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000567 00000 n \n0000000015 00000 n \n0000000655 00000 n \n0000000410 00000 n \n0000000718 00000 n \n0000000763 00000 n \ntrailer\n<</Info 6 0 R/ID [<bb7be57eab4d835fde39e81396eb3c11><5a14e10ae3682b57451b0363d9bca316>]/Root 5 0 R/Size 7>>\nstartxref\n899\n%%EOF\n'),(4,'3','venkatesh','8765432190456','234','8500','2023-04-07 16:56:48','IEEE Digital Library','0','No EMI','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 331>>stream\nxœÍSMOÂ@½÷W<N`\"¸…\0MoÙ³‹¦Ç[]Zlw1ü{ËMB469M2óŞ›Ïç^8<ÒƒX;M×;:w#nbã4ğ7›Ñ”†,|±Åx+iÉöFó2v²–_öU9v¬´ÎZ­Zíªª\Z*™ûØ«ô]\ZUÄ­Êæò°U©7ÒØÂ_”óÊuD.ÓB®L’¥`C=â’¶×íw»}¯M:·×¿ªÁÿe±Ü+vµRE±±ú€]ê¤ˆÕ\Z‡ÌæØÉÊñ™˜&1Z¡ &g³^få×‚#*¢òwOÊ°pÈ‚&åXp>´vë\rê·HÊ!SJ1L^#5&É2—ù¡úóÙ‘>Øf65>¼.!\'Óè”ùH­ÖgH¦YjââLÚ¥Öy)¬á#¢Ùâ[”\nçÉùÔÆ/A\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407165648+05\'30\')/CreationDate(D:20230407165648+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000570 00000 n \n0000000015 00000 n \n0000000658 00000 n \n0000000413 00000 n \n0000000721 00000 n \n0000000766 00000 n \ntrailer\n<</Info 6 0 R/ID [<17141ecd835c8f0331bf3b8b8cd7651e><9442676b116d06b08e86745432da74b7>]/Root 5 0 R/Size 7>>\nstartxref\n902\n%%EOF\n'),(5,'3','venkatesh','8765432190456','234','8500','2023-04-07 16:58:43','IEEE Digital Library','0','No EMI','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 338>>stream\nxœÍ“_o‚0ÅßùÇ\']28ÿ\0oLêl¦àÒº…Çªu°!8(.|ûáÛ–eËLô¾´I{~çööŞwík·CXÆ|£èšÖqs31aöÀ·Z‹…Î‰ÏAı§€	®øk5¾Ñ;İóDc.¿|×ÉµS™$™®·Z••\'Eîà Ó7¡dé\'7Xˆj\'S¦„*l9ÆNîÃs‘b­â,õtûvÏ¶‡ö`Ø·í‘ÑX#ó¢*ÿm˜•ˆÄA¢(×kYÛ2©°/WI\\Drƒ*+sìÅ^æøˆU«D¢\r×wg!£ÁÏA=¶`î„ğ°ŞFê{Ôõ1¦œ†%£ş½¾ßlÑ¾F\\W™/~‰•H0‹W¹È«Ó÷Ïxw—•©r`\r£ñ\Z™S~†zı3ÏRÕMØÌ8×oKË§®ÿ€0X~9%\\{Ô>‘4.\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407165843+05\'30\')/CreationDate(D:20230407165843+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000577 00000 n \n0000000015 00000 n \n0000000665 00000 n \n0000000420 00000 n \n0000000728 00000 n \n0000000773 00000 n \ntrailer\n<</Info 6 0 R/ID [<3352cf5d6fa04ac3654e886b2329eed7><11fa73b948bab9fa36aa7edcb819d5f2>]/Root 5 0 R/Size 7>>\nstartxref\n909\n%%EOF\n'),(6,'3','venkatesh','8765432190456','234','8500','2023-04-07 16:59:55','IEEE Digital Library','0','No EMI','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 325>>stream\nxœİSÁNÂ@½÷+\'0‘Ú‚\"é­¶‹l”³‹¦Ç[-İÚn1ı{ËMb44‘8—™dóŞ›™}ófÜpc8ÂØ\Z¯\r}{¼/.&6ìøÆèáw1w£	8hğRàŒ¿4´Öö^ÿoâ`/?œ«uìT¦©2ÍNç¤ºò¥(ìdö*´,c³u¹¨·2Ó`ZèªtÀGk]‡\"+ÅJ\'*õ\\ö`tm[\'µîc°‘ª‹DY­V²,7UZ#¯–iRÆrZUr‘Ëï‰¡Jtáî}Ä(C8ÁSØÜ*˜;!<j.ö \r|êğ(§„aÁhpkæë\rºçHšÕBà\'Ï‰)î“e!Šº}Ópµ§w·ªÊ´ƒñ•uøÉŒ:šü\rÍLe:nœ÷œp–OİàQ¸øôJ¸ñ`|\0+¡\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407165955+05\'30\')/CreationDate(D:20230407165955+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000564 00000 n \n0000000015 00000 n \n0000000652 00000 n \n0000000407 00000 n \n0000000715 00000 n \n0000000760 00000 n \ntrailer\n<</Info 6 0 R/ID [<722daafa46d82eda6b5233fd6d9f6879><a598fa54ae90fd60e6aefc41bbc9945f>]/Root 5 0 R/Size 7>>\nstartxref\n896\n%%EOF\n'),(7,'1','venkatesh','98765432345','123','15000','2023-04-07 17:17:23','Scopus Index mode','0','No EMI','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 344>>stream\nxœÍTQOƒ0~çW|o›‰ÌÂ&ÛxÃÁ\\£ƒ™v\ZëèÊ(B™îß‹oš,F’írI›\\ïû®×¯÷fÜpcè`BğÄ 0­É×æjnÁ²Á·Fÿ³•/ƒƒ†¸à/-,ùŞ7OcGkùã½:Ï]È<WgU‘/Eåb/‹W¡e:\'X‰ÃN\ZLİÔ.Øz6ëœ‡W¢¨ÅFgª\0õİVİÓñ„ØsªvûmC]›ØC“ŒL2†5v[·‡g::+	ÄªA*öu³ÙÈºŞ6ùeóœgu*TS¡¥¬ğé:Ó¹D^èİÇŒ2Ds<EíÿóæÛ)p”††>õBÌ(§ÃšÑğvP&[ô.‘`U65h‘ÈìT\"»W\"WZäğvª)´ëšrô\\°¤.B…vıg©\n¶z>qª·<U._xáâhı-\ZpãÁøè:\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407171723+05\'30\')/CreationDate(D:20230407171723+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000583 00000 n \n0000000015 00000 n \n0000000671 00000 n \n0000000426 00000 n \n0000000734 00000 n \n0000000779 00000 n \ntrailer\n<</Info 6 0 R/ID [<cc2def30a0236fb5600e6be0d0fc16b8><63e19cae2bac4d94c007c34dbeb8ec56>]/Root 5 0 R/Size 7>>\nstartxref\n915\n%%EOF\n'),(8,'1','venkatesh','987654321355','123','15000','2023-04-07 17:18:08','Scopus Index mode','3','5000.0','%PDF-1.4\n%âãÏÓ\n2 0 obj\n<</Filter/FlateDecode/Length 345>>stream\nxœÍTÁNƒ@½óïÖšH]ÚRRj7ZZ³[\rÇ¶¥,–¥Ú¿ãEš4iç4ÉÛyovæí¾7ÜMà’	xj˜–û•\\Í,XCğÑÇÿbåÇ‹0â Ñã’!.øKKK~±÷ÍÓDg/¼×Ñkç²(ÔYu4•bça/ËW¡e\r.°‡­,5˜º©=°u„Œ]‡ïDY‹Dçªz°ÉèÚrmûTã¶õ†d82ÉØ$,Ç³\\¸ƒ±ëœ•bÕ {‰ºIY×›¦8 j‹¼ÎdŠƒjv¨D%wxÏuëB¢?òïcF–3<-Û÷æÏB·¿@§¦ÔPNC†5£Ñí J7è]\"/ÁU55h™ÊlU*ïD®´(àoUSj–Mé<.hkŸtãß<Uê¬õóè¬vyªZ>÷£;ÄËõ4äÆƒñ	D9…\nendstream\nendobj\n4 0 obj\n<</Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 1 0 R>>>>/Parent 3 0 R/MediaBox[0 0 595 842]>>\nendobj\n1 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Kids[4 0 R]/Type/Pages/Count 1/ITXT(5.1.0)>>\nendobj\n5 0 obj\n<</Type/Catalog/Pages 3 0 R>>\nendobj\n6 0 obj\n<</ModDate(D:20230407171808+05\'30\')/CreationDate(D:20230407171808+05\'30\')/Producer(iText® 5.1.0 ©2000-2011 1T3XT BVBA)>>\nendobj\nxref\n0 7\n0000000000 65535 f \n0000000584 00000 n \n0000000015 00000 n \n0000000672 00000 n \n0000000427 00000 n \n0000000735 00000 n \n0000000780 00000 n \ntrailer\n<</Info 6 0 R/ID [<32e0f3c9081e4360b17a3074098ad6a3><7e0954f5106510056eacee6951f42ec0>]/Root 5 0 R/Size 7>>\nstartxref\n916\n%%EOF\n');

/*Table structure for table `signup` */

DROP TABLE IF EXISTS `signup`;

CREATE TABLE `signup` (
  `username` varchar(40) NOT NULL,
  `password` varchar(40) default NULL,
  `qualification` varchar(40) default NULL,
  `interested_subjects` varchar(40) default NULL,
  `contact_no` varchar(30) default NULL,
  `email` varchar(40) default NULL,
  `address` varchar(50) default NULL,
  `usertype` varchar(50) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `signup` */

insert  into `signup`(`username`,`password`,`qualification`,`interested_subjects`,`contact_no`,`email`,`address`,`usertype`) values ('abc','123','B.Tech','Computer Science','1234567890','abc@gmail.com','hyderabad','Reviewers'),('kishan','123','B.Tech','Computer Science','9876543210','kishan@gmail.com','hyderabad','Reviewers'),('venkatesh','123','B.Tech','Computer Science','9876543219','venkatesh@gmail.com','hyderabad','Authors');

/*Table structure for table `uploadpapers` */

DROP TABLE IF EXISTS `uploadpapers`;

CREATE TABLE `uploadpapers` (
  `paper_id` int(11) default NULL,
  `author_name` varchar(500) default NULL,
  `paper_name` varchar(500) default NULL,
  `paper_title` varchar(500) default NULL,
  `paper_details` varchar(200) default NULL,
  `paper_status` varchar(500) default NULL,
  `admin_feed` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uploadpapers` */

insert  into `uploadpapers`(`paper_id`,`author_name`,`paper_name`,`paper_title`,`paper_details`,`paper_status`,`admin_feed`) values (1,'venkatesh','ANALYSIS OF WOMEN SAFETY IN INDIAN CITIES USING.pdf','a','a','Paper Accepted & Payment Completed','waiting'),(2,'venkatesh','Using_Wearables_and_Machine_Learning (1).pdf','w','w','Paper Accepted & Payment Completed','waiting'),(3,'venkatesh','ANALYSIS OF WOMEN SAFETY IN INDIAN CITIES USING.pdf','r','r','Paper Accepted & Payment Completed','Accepted');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

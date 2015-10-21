-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: demo_inxedu_v2_0
-- ------------------------------------------------------
-- Server version	5.5.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `edu_article`
--

DROP TABLE IF EXISTS `edu_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_article` (
  `ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `SUMMARY` varchar(200) DEFAULT NULL COMMENT '文章摘要',
  `KEY_WORD` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `IMAGE_URL` varchar(100) DEFAULT NULL COMMENT '文章图片URL',
  `SOURCE` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `AUTHOR` varchar(10) DEFAULT NULL COMMENT '文章作者',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '文章创建时间',
  `PUBLISH_TIME` timestamp NULL DEFAULT NULL COMMENT '文章发布时间',
  `PUBLISH_STATE` tinyint(1) DEFAULT '0' COMMENT '文章发布状态 1未发布 2已发布',
  `LINK` varchar(100) DEFAULT NULL COMMENT '文章访问链接',
  `ARTICLE_TYPE` tinyint(4) DEFAULT '0' COMMENT '文章类型 2文章',
  `CLICK_NUM` int(11) DEFAULT '0' COMMENT '文章点击量',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数量',
  `COMMENT_NUM` int(11) DEFAULT '0' COMMENT '评论数',
  `SORT` int(11) DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='文章信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_article`
--

LOCK TABLES `edu_article` WRITE;
/*!40000 ALTER TABLE `edu_article` DISABLE KEYS */;
INSERT INTO `edu_article` VALUES (7,'中国首款学习习近平重要讲话APP上线','“学习中国”APP得到了国家互联网信息办公室的支持与指导。','学习中国,学习习近平','/images/upload/article/20150910/1441853023802.jpg','inxedu','lmxxxaa','2015-03-24 05:13:37','2015-09-09 14:08:03',2,'/15/03/25/1427247760573.html',2,25,1,1,0),(9,'嘲讽陈年是很容易的事，但我更愿意祝他成功','嘲讽陈年是很容易的事，但我更愿意祝他成功','嘲讽,陈年','/images/upload/article/20150910/1442305533342.jpg','inxedu','lmxxxaa','2015-03-24 05:13:57','2015-09-09 14:08:03',2,'/15/03/25/1427247760575.html',2,13,0,0,0),(11,'陈年重回T恤大战：凡客归来','凡客之路，兴于衬衫，成于T恤。2015年的春夏之交，凡客再次发布了自己的T恤，种种迹象表明，陈年与他的凡客，这一次要，归来。凡客能否重温2011年的T恤辉煌？','凡客归来,T恤大战','/images/upload/article/20150910/1441853211287.jpg','inxedu','lmxxxaa','2015-03-24 05:14:16','2015-09-09 14:08:03',2,'/15/03/25/1427247760577.html',2,6,0,0,0),(13,'法国总理证实失事客机无人生还','据美国《华盛顿邮报》3月24日报道，法国总理瓦尔斯称，一架直升机已尝试降落在坠毁地点附近，并未发现失事客机上有生还者','失事客机,证实失事','/images/upload/article/20150910/1441853275555.jpg','inxedu','lmxxxaa','2015-03-24 21:42:40','2015-09-09 14:08:03',2,'/15/03/25/1427247760579.html',2,3,0,0,0),(14,'背水一战的任天堂','面对所处的窘境，固执的任天堂也低下了他那傲娇的头，而如今啪啪啪打脸般的迈出了这一步，其实他也是被逼无奈的，或者说岩田聪已经没有什么更好的办法扭转颓势了','任天堂,背水一战','/images/upload/article/20150910/1441853318496.jpg','inxedu','lmxxxaa','2015-03-24 22:11:33','2015-09-09 14:08:03',2,'/15/03/25/1427249493862.html',2,14,0,2,0),(15,'渠道之殇：三星手机中国没落背后','渠道之殇：三星手机中国没落背后','渠道之殇：三星手机中国没落背后','/images/upload/article/20150910/1441853391646.jpg','inxedu','lmxxxaa','2015-04-03 01:47:31','2015-09-09 14:08:03',2,'/15/04/03/1428040051758.html',2,9,0,0,0),(17,'中国军舰协助英、德等10国从也门撤侨225人','中国军舰协助英、德等10国从也门撤侨225人','中国军舰协助英、德等10国从也门撤侨225人','/images/upload/article/20150910/1441853445008.jpg','inxedu','lmxxxaa','2015-04-03 01:48:42','2015-09-09 14:08:03',2,'/15/04/03/1428040122133.html',2,48,1,0,0),(20,'MBA过来人亲述：联考英语复习经验','　在各门科目之中，有两门课程是拉分最多的，一门是数学，一门是英语。其中英语是在多数考生最大的拦路虎，因为工作多年的人，如果工作中不常接触，英语的底子多是很差的。而英语是很难突击上去的，靠临时“抱佛脚”很难奏效。我英语基础较差，但经过自己有计划、有重点的系统复习，年MBA[微博]联考中，英语过了70分这道槛，取得了较为满意的结果，感到甚是欣慰。',NULL,'/images/upload/article/20150910/1441853518948.jpg','inxedu资讯在线','皱眉的人','2015-09-09 21:27:48','2015-09-10 04:00:00',0,NULL,2,26,0,0,0),(21,'美国教授：求知是为了看世界 不是让世界看你','美国教授：求知是为了看世界 不是让世界看你',NULL,'/images/upload/article/20150928/1443423884988.png','inxedu','inxedu','2015-09-28 19:04:54','2015-09-28 19:04:20',0,NULL,2,0,0,0,0),(22,'哈佛商学院院长：21世纪人人都需要创业精神','哈佛商学院院长：21世纪人人都需要创业精神',NULL,'/images/upload/article/20150928/1443424120422.jpg','inxedu','inxedu','2015-09-28 19:08:42','2015-09-28 19:08:14',0,NULL,2,0,0,0,0),(23,'雅思阅读能力提高有方法 文章精读可以这样做','雅思阅读能力提高有方法 文章精读可以这样做',NULL,'/images/upload/article/20150928/1443424285823.jpg','inxedu','inxedu','2015-09-28 19:11:37','2015-09-28 19:10:51',0,NULL,2,8,0,0,300),(26,'关注·底层教育梦：先天不足 后天亏损？','关注·底层教育梦：先天不足 后天亏损？',NULL,'/images/upload/article/20150928/1443428005821.jpg','inxedu','inxedu','2015-09-28 20:12:59','2015-09-28 20:12:54',0,NULL,2,0,0,0,0);
/*!40000 ALTER TABLE `edu_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_article_content`
--

DROP TABLE IF EXISTS `edu_article_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_article_content` (
  `ARTICLE_ID` int(11) DEFAULT '0' COMMENT '文章ID',
  `CONTENT` text COMMENT '文章内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_article_content`
--

LOCK TABLES `edu_article_content` WRITE;
/*!40000 ALTER TABLE `edu_article_content` DISABLE KEYS */;
INSERT INTO `edu_article_content` VALUES (7,'<p>\r\n	“学习中国”APP界面。\r\n</p>\r\n<p>\r\n	记者2日获悉，中共最高学府中央党校已研发推出一款“学习中国”APP，网民可利用手机和平板电脑方便地学习查阅中共中央总书记习近平的系列重要讲话和相关著作。\r\n</p>\r\n<p>\r\n	这款应用由中央党校图书馆、数字图书馆和中国干部学习网推出，包括新闻、实景地图、微课程、知识地图、“习大大”词条、专家解读、评论精选、电子书、理论文章、重点论述、“习大大”故事汇和引用诗文等12个版块，使网民通过指尖即可学习习近平同志系列重要讲话精神。\r\n</p>\r\n<p>\r\n	中央党校中国干部学习网常务副总编陈建才在2日举行的情况介绍会上说，“学习中国”APP已上线各大应用商城，希望借助移动互联网技术把中国特色社会主义理论以网民喜爱的方式呈现出来，激发民众的理论学习热情，增强全民族的理论自信。\r\n</p>\r\n<p>\r\n	据悉，这款应用的一大创新是“实景地图”和“知识地图”。读者可在移动客户端随时了解习近平总书记在何时、何地讲话，及时学习讲话内容。这些讲话和相关知识还被做成动态思维逻辑图，既方便网民理解讲话要领，又方便记忆。\r\n</p>\r\n<p>\r\n	读者可在这款APP上免费阅读习近平的多本著作，如《摆脱贫困》《之江新语》《习近平谈治国理政》等。中央党校优质的专家资源也通过APP转化为理论文章和权威讲解，直接为网民的理论学习提供服务。\r\n</p>\r\n<p>\r\n	“学习中国”APP得到了国家互联网信息办公室的支持与指导。据悉，这款应用还将陆续推出动漫视频和更多注重体验式学习的3D教室等更多服务版块，使中共理论更有效地走入寻常百姓家。(记者 李志晖)\r\n</p>'),(9,'<div class=\"blog_content\" style=\"word-break:break-all;width:638px;\">\r\n	<p class=\"MsoNormal\">\r\n		陈年将凡客2015的春夏新品发布会放在了五棵松——这个开演唱会的地方继798之后成了互联网公司的新宠，两个星期后，乐视的手机和新电视也要在这里发布。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		凡客发布会的开场让人仿佛穿越到了去年的8月，只不过那时陈年说的是衬衫，而这次是T恤，然后又是穿山越岭，飞过重洋遍寻供应商和设计师打造优质T恤的故\r\n事。陈年普及了做T恤的一些基本知识以及T恤衫的痛点，而他要做的是改善用户体验。这里涉及5个日本公司和6个中国公司以及1个美国公司的故事。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		于是，陈年很快被调侃了。某IT老记在朋友圈说他“邯郸学步学小米，干脆卖给小米做纪念品算了”。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		小米的雷军，也是凡客的投资人之一就在现场，第一排，最中间的位置。我拍了雷军的后脑勺。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		这时候陈年正在说他“只想做好一件T恤”，一件“可以穿30年、白T恤不会发黄、黑T恤不会发红”的“T恤”。他说到2014年的自己“心慌意乱”，一心要做减法，只想做黑T恤，因为他和雷军都只穿黑T恤。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		这是大家都很熟悉的陈年，一个不介意暴露自己的软肋、被调侃为“总在反思”的人。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		然后他批评中国的设计师只知道把阿玛尼、普拉达的新品拿来给老板选，完全没有任何技术含量。联系到去年凡客的衬衫发布会后被时尚圈狂踩的局面，我估计今年凡客和陈年会被骂得更惨。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		陈年对此有心理准备，他说肯定会有很多人说凡客做的不过是基本功，根本不懂时尚。但“基本功对于中国恰恰是最重要的”。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		踩完了中国设计师，他说“还好我们有日本设计师”。他用了一批日本的设计师，从T恤的版型设计到印花T恤上的各种图案，基本全由日本设计师包办，只有一个系列图案的设计师来自中国。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		这是整个发布会里我最喜欢的环节，这一次陈年把自己的文艺范做到了产品里。每个T恤图案的设计师都被隆而重之地推出，画猫跳广场舞的顾湘；说“愤怒时会画\r\n下一条线和……”的长场雄；会放电的萌系少年德田有希，他画的其中一幅画说“我听到了眼泪滴下的声音，其实只是放了一个屁”；还有从星际穿越获取灵感试图\r\n画出五维空间的Yoshirotten，他说“地球已经无法满足我的想象”。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		陈年把他们称为艺术家。他再次反省自己说，“过去15年来我更关心主流、共性，想把人扁平化”，但现在从艺术家的身上体会到独特的灵魂才最可贵，甚至他们的“神经病”也是独特的一部分，“世界万物值得留恋，因其参差多样”。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		凡客的猫和这些设计师是非常聪明的选择，让我又一次感到凡客正在给自己的品牌注入新的能量，更多样的，更亚次元的，更年轻，更萌酷的东西。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		发布会的最后，陈年说，五棵松是他到北京后落脚的第一个地方，当年租的农家院就在离万事达中心不远的地方。他想起了当年和朋友们的共同理想，就是做一点真正好的东西出来。在经历了这么多年的起起落落之后，他希望自己“不要因为走得太远而忘记为什么出发”。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		从第一次见陈年，就能感到他身上的文人气。这一点让他显得不那么像一个典型的商人，他的改不了的文艺腔、爱抒情爱反省的毛病让他在凡客如日中天时备受追捧，到凡客走下坡路时又屡遭嘲讽。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		嘲讽陈年是一件容易的事，但我更愿意祝他成功，因为陈年这个人，也因为凡客是一家有故事有情怀一直在努力做事的企业。有的企业不错，但是无趣，比如三星。\r\n而凡客是那种让人想起来总有点感触的企业。说到凡客时，我的一个同事的问题是：它还活着吗？已经被市场遗忘了吧？在淘宝、京东们，甚至后来的聚美优品、唯\r\n品会客流如织的时候，很少有人记得陈年曾经是中国最早的电商拓荒者之一，今年也已是凡客的第8个年头。连它模仿的美国PPG都已经死了，凡客还活着，虽然\r\n活得不那么光鲜。如果它如雷军所说“三五年又王者归来”，这会是一个很励志的故事，让人觉得生意场上也不都是尔虞我诈翻脸无情，也有百折不挠百炼成钢这种\r\n事。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		陈年做电商是2000年和雷军一起做卓越网开始的，那时卖的是书和音像制品，后来卓越网卖给了亚马逊，陈年几经周折在2007年创办了凡客。我第一次看到\r\n凡客的标志性大盒子，是由办公室里最文艺范的海丽下的单。那时在网上买衣服还是一件很新很酷的事，主要由城市里的小资们引领风潮。所以凡客最早的用户是北\r\n京上海的小资一族。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		那时候的凡客只卖最简单款式的T恤、Polo衫和衬衣，以男款为主，质地很好，价格也真的很便宜。没有广告，完全靠口碑传播，凡客就这样一点点做了起来。我在海丽的带动下成了凡客的用户，每年断断续续会在凡客上下几单，都是最实用的T恤袜子之类。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		再然后，凡客体风靡一时，凡客转眼间成了陈年口中的“平民时尚”，满大街都是韩寒穿着凡客T恤的广告，各大论坛上都是网友们戏谑的各种“凡客体”。凡客上卖的东西越来越多，越来越杂。小资们慢慢不屑于再穿凡客，但便宜加酷的形象使凡客成了大学生们的最爱。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		这是2010年。媒体追着陈年要采访，追着他问凡客什么时候上市。而陈年和凡客一门心思想的是再放个“炸弹”，再来个“爆款”。可是风光转眼即逝，凡客最\r\n风光的时候正是中国概念股在美国最不受待见的时候，或许是一念之差，或许是一步之差，凡客没有上市，转过年来就是电商的冬天。当陈年还在批评京东扩张越快\r\n亏得越狠的时候，2011年4月，京东拿到了C轮融资的15亿美元，再接着2013年拿到了D轮融资的7亿美元。一直到上市，京东还没有盈利，但在自营电\r\n商的模式里，它成了跑得最快的那个。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		做企业有时就是这样，拼的是一口气。如果和京东拼速度的时候，陈年胆子再大一点，吹得猛一点，撒钱再勇敢一点，也许凡客现在是另一个模式。可是陈年过不去\r\n自己这一关，他身上的文人气让他在和刘强东这样的悍将较量时落了下风。到后来媒体开始质疑凡客库存的时候，他或者避而不谈，或者气急之下口不择言。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		在疯狂扩张和随后的清库存中，凡客不知不觉间沦落成了地摊货。它和淘宝、京东很快就不再是一个层面的对手了，再然后，它的对手变成了传统的服装企业。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		掉到了制造业的坑里在某些人看来是悲剧，但陈年毕竟是陈年。这一次他和雷军给凡客的新定位是做一件小事，从做好一件衬衫一件T恤开始，向日本和德国企业学习，让中国人用上真正好的东西。现在这是一件小事，但是做好了未来也许是颠覆传统服装制造业的大事。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		这的确是小米模式在服装业的一个翻版。陈年转了一大圈，又回到了起点，不过，现在刚好可以搭上互联网+的新概念。对于自称“凑过热闹也热闹过的”陈年，这或许不那么重要了，重要的是用户还会不会认可凡客，凡客还能不能活下去。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		凡客未来要靠产品活下去。和手机一样，服装业最大的问题一直是品牌和库存。很多企业都倒在库存问题上，比如李宁。凡客在疯狂扩张的那几年后也栽在库存上，所以凡客要活下去，我最想知道的是凡客怎么来控制库存。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		做品牌营销向来是陈年的长项，陈年也一直很会卖东西，他总能赋予他卖的东西很大的内涵，仿佛他卖的不是一件T恤，而是一种文化，甚至一个民族的未来。这是凡客至今仍然拥有一群粉丝的原因，也是像我这样的人对凡客总心有戚戚的原因。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		凡客一直卖得都不错。凡客没有拼过淘宝，也没拼过京东，耽误陈年的并不是文艺腔和情怀，而是对于企业战略和执行力的一种掌控。未来陈年需要证明的是自己不仅会卖东西，还会管理企业，更重要的是有踩得准市场的远见。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		 一个像陈年这样的元老级的电商人物有勇气从头再来，无论如何都值得尊敬。套用陈年的话说，世间万物贵在参差百态，企业亦如是。每个企业都有自己擅长的套路和打法，活下来不容易，活得好更难，活得久就难上就难。\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		在来发布会的路上，我的一个同事遇到了一个凡客的用户，他从高中就开始买凡客，现在脚上还蹬着一双凡客的帆布鞋。凡客再难，也已经第8个年头了。我衷心希\r\n望凡客活下去，而且活得好。在第9个年头的时候，再拿出一件新的既融合他的文艺腔，又能博得尊重和买单的产品——毕竟，已经越来越接近制造企业角色的凡\r\n客，要靠产品说话，靠销量活下去。\r\n	</p>\r\n</div>'),(11,'<p class=\"text\">\r\n	凡客2015年春夏新品发布会，选择4月1日愚人节这天，日子是陈年定的，他说，做好的服装，需要愚公精神，匠者，匠心，简而言之，下功夫，下笨功夫。\r\n</p>\r\n<p class=\"text\">\r\n	古话说，大智若愚。这是经典，永远时髦的禅语。\r\n</p>\r\n<p class=\"text\">\r\n	互联网+”的风口，自然凭风好借力，但凡客终究是个服装品牌，有产品，需匠心，自然也就需要笨功夫。选择愚人节发布新产品，愚己悦人，既是自嘲，亦是自勉。\r\n</p>\r\n<p class=\"text\">\r\n	从2014年发布的300支衬衫、吉国武款衬衫开始，凡客重新回到创业的起点：7年之痒，凡客2007年的创业始于衬衫，2014年的再创业，重新出征，还是始于衬衫。\r\n</p>\r\n<p class=\"text\">\r\n	今天的发布会，似乎又是一个轮回，有另一番隐喻：通过T恤，凡客试图重新回到舞台中央。\r\n</p>'),(13,'【环球网综合报道】德国汉莎航空公司旗下的德国之翼(Germanwings)一架A320客机，3月24日从巴塞罗那飞往杜塞尔多夫途中，在法国南部阿尔卑斯山脉坠机。<br />\r\n<br />\r\n据美国《华盛顿邮报》3月24日报道，法国总理瓦尔斯称，一架直升机已尝试降落在坠毁地点附近，并未发现失事客机上有生还者。(实习编译：苏俏英 审稿：谭利娅)'),(14,'<p class=\"text\">\r\n	3月17日，任天堂与合作方DENA召开共同记者会，宣布两家将进行合作，将任天堂的经典游戏与人物形象带到手机上。\r\nDeNA表示，已经获得了任天堂全部人物的IP授权，并在未来与任天堂共同开发移动设备上的游戏，这意味着不仅仅是将掌机上的游戏移植到移动平台上来，而\r\n是有着更多周边、衍生、甚至全新的游戏出现，任天堂社长岩田聪也在发布会上确认了这一点。两家公司将于今年晚些时候为旗下游戏产品推出一个在线会员服务平\r\n台，移动端、任天堂游戏机3DS用户、任天堂掌机、WiiU用户均可享受该平台服务。\r\n</p>\r\n<p class=\"text\">\r\n	通过220亿日元的资产互换以后，任天堂一跃成为DeNA的第二大股东，而DeNA也成为任天堂的前十位股东之一，可见双方并非是简单的利用资源与合作而已。\r\n</p>\r\n<p class=\"text\">\r\n	任天堂社长岩田聪此次发布会透露了很多日后与\r\nDeNA的合作情况，其中不仅包括新的全平台会员服务，还有旗下IP手游的关键性内容。发布会上可以很明显的得知，日后DeNA将成为任天堂在手游平台的\r\n合作伙伴，获得授权的范围将涉及任天堂的所有游戏，并且不会移植现有的家用机和掌机平台游戏，而是经过精心开发的完全新作。\r\n</p>\r\n<p class=\"text\">\r\n	<strong>说好不做手游的呢</strong>\r\n</p>\r\n<p class=\"text\">\r\n	任天堂社长岩田聪曾多次公开表示坚决不做手游，而从此次其自打脸的行为可以看出，任天堂也是被逼无奈。\r\n</p>\r\n<p class=\"text\">\r\n	根据任天堂发布的2015财年第一财季财报显示，由于WIiU和3DS视频游戏机等业务营收疲软，任天堂第一财季净亏损99.2亿日元，而去年同期则是盈利86.2亿日元。\r\n</p>\r\n<p class=\"text\">\r\n	其实从2011年开始，任天堂就开始出现财政赤字，\r\n并且到2014年，财政赤字逐年扩大。而任天堂掌机3DS的销量有惊人下降，在2013财年任天堂售出1224万3DS游戏机，与2012财年相比下跌\r\n12%，而2014年第一季度任天堂售出82万台3DS游戏机，较去年同期下跌40%，可见其销售状况每况愈下。相比上代掌机DS发售头三年都是呈现逐年\r\n增加的趋势，而3DS则相反，发售三年呈逐年下降状态。\r\n</p>\r\n<p class=\"text\">\r\n	此前任天堂公开表明坚决不做手游，从当时的环境来看\r\n原因有两点，其一，手游与任天堂自家的掌机相类似，发展手游势必会与掌机相冲突，其二任天堂的掌机中除了自家游戏之外，还有不少第三方优秀的作品出现，如\r\n果手游影响了掌机的销售，那么会直接影响第三方作品的产出，陷入可怕的恶性循环。另外一方面任天堂对手游运营完全没有经验，不会宣传也不会卖钱，不知道进\r\n入这个市场能得到多少好处。\r\n</p>\r\n<p class=\"text\">\r\n	随着近些年智能手机时代的到来，掌机也逐渐被智能手\r\n机所取代，大屏幕触摸式的操作兼容电话和短信服务，让掌机陷入了尴尬。加上手游井喷式的爆发，人们玩掌游的习惯逐渐被取代，而掌机逐渐无人问津。任天堂掌\r\n机NDS的直接竞争对手索尼的PSP，已在2014年年末停止销售，就是一个最好的例子。\r\n</p>\r\n<p class=\"text\">\r\n	反观其游戏主机WiiU，根据游戏数据统计机构VGChartz发布的销量数据来看，截止今年2月15日，其竞争对手索尼的PS4销量已超过2000万台，而任天堂的WiiU销量则不足1000万台，并且与微软的XBOX销量之间也有超过300万台的差距。\r\n</p>\r\n<p class=\"text\">\r\n	面对所处的窘境，固执的任天堂也低下了他那傲娇的头，而如今啪啪啪打脸般的迈出了这一步，其实他也是被逼无奈的，或者说岩田聪已经没有什么更好的办法扭转颓势了。\r\n</p>\r\n<p class=\"text\">\r\n	<strong>任天堂的野心</strong>\r\n</p>\r\n<p class=\"text\">\r\n	虽说近些年在游戏设备上的销量不佳，但任天堂毕竟是地球上三大游戏主机制造商之一，手里有着若干经典游戏的IP资源，而此时任天堂将要把这些品牌和人物授权拿出来做成手游，恐怕会引起一场智能平台游戏格局颠覆性的改变。\r\n</p>\r\n<p class=\"text\">\r\n	与任天堂合作的DeNA是日本东京的网络服务公司，\r\n旗下运营的移动游戏平台Mobage在日本有大约2700万用户，2011年也正式进入了中国，与91门户合作进行推广。Mobage十分擅长开发运营以\r\n动漫IP为基础的游戏，比如在中国的官网中可以看到正版授权的《海贼王》、《变形金刚》、《灌篮高手》等游戏。\r\n</p>\r\n<p class=\"text\">\r\n	在这个IP为王的手游时代，任天堂手中的马里奥，口\r\n袋妖怪，塞尔达传说，银河战士，大金刚，皮卡丘等等IP资源足以去抢占手机用户的眼球，加上其强大的掌机游戏的研发实力，再搭配以DeNA成熟的手游平台\r\n经验，以目前进驻手游市场的厂商们，无论从游戏素质还是研发实力或者是品牌号召力，恐怕都没办法和这两个业界大佬的双剑合璧相较。\r\n</p>\r\n<p class=\"text\">\r\n	任天堂在全球粉丝众多，正因如此，在手游市场上，山\r\n寨任天堂的游戏数不胜数，比如手游《莫尼诺拯救总动员》和《Lep\'sWorld》就是仿照任天堂的《超级玛丽》，甚至关卡和操作方式完全保持了“超级玛\r\n丽”的风格，而此次任天堂进军手游对于那些山寨其游戏的商家来说无疑是噩耗，山寨产品必定会受到打击，而正版产品的推出，经典的回归，任天堂的忠实粉丝自\r\n然会成为他的用户，因为在他们心中无疑是早到了归属感。\r\n</p>\r\n<p class=\"text\">\r\n	而通过将经典搬到手游上，也能够吸引、培养和教育一\r\n批新的玩家，因为，在任天堂最辉煌的十来年中，他的用户群体实际上是断层的，任天堂的粉丝们大多是玩任天堂长大的，他们或许是任天堂现在消费的主力，但绝\r\n对不是现在游戏界的消费主力，而是更年轻的一批玩家，他们或许没经历过红白机时代，在他们的心中，任天堂对于其而言只不过是个游戏机公司，仅此而已。而任\r\n天堂将经典游戏搬到手游上，有利于培养和教育这批在任天堂游戏文化中断层的、年轻的一批用户，让他们对任天堂的游戏文化有了进一步的认识，毕竟他们才是当\r\n今和未来游戏界的消费主力。\r\n</p>\r\n<p class=\"text\">\r\n	换个角度来看，任天堂进军手游能够刺激其自身销量极差的游戏主机业务的增长，试想一下，如果在手机上出点缩水版阉割版的游戏，或多或少能吸引玩家去买完整版。\r\n</p>\r\n<p class=\"text\">\r\n	而这一点从任天堂推出“NX”计划就可以看出。\r\n</p>\r\n<p class=\"text\">\r\n	在与DENA合作的发布会上，任天堂公布了将在2016年推出新机及全新平台，代号“NX”。\r\n</p>\r\n<p class=\"text\">\r\n	其实早在几年前，岩田聪就坦言表示，自己很喜欢苹果\r\n那种由iPhone、iPad、Mac构建的生态圈，而这或许也是任天堂选择与有成功社区运作经验的DeNA合作的关键原因。DeNA最大的优势无疑是网\r\n络服务与运营技术，显然任天堂此时想借助DENA之手，通过NX搭建一个崭新的，包容NX、智能手机、3DS和WiiU在内的一体化平台。\r\n</p>\r\n<p class=\"text\">\r\n	目前，任天堂仅仅也就透露了多平台共享账号的解决方案，但反观VALE，暴雪，EA这些游戏研发商，他们都很早这么做了，而任天堂只是做了他应该做的事。不管怎么说，NX在今后将会成为任天堂战略中一个极为重要的角色，这点事毋庸置疑的。\r\n</p>\r\n<p class=\"text\">\r\n	其实坚持不做手游是态度是作为主机制造商的傲骨，但在操作上，任天堂仍然可以将手游中的精华拿出来为己所用。任天堂和手游，或许并不是两个完全不来电的词。\r\n</p>'),(15,'<p class=\"text\">\r\n	在过去的2014年，在苹果手机大屏化和中国“高性价比军团”崛起的背景下，三星电子的手机业务已经步入窘境。日前，有\r\n国外分析师明确表示，三星电子正在成为下一个黑莓和诺基亚。尤其是在中国市场，三星已经痛失中国智能手机市场第一的宝座，究竟原因，作为手机营销最重要的\r\n渠道无疑是主要原因之一，而更引起业内思考的是，是渠道背后隐藏的三星在手机产品创新及产业链优势的丧失。 \r\n</p>\r\n<p class=\"text\">\r\n	实际上，三星手机在中国市场的疲态在2014年第二季度就已经显现。2014年2月三星发布了其旗舰机GalaxyS5，但这款手机即使在渠道大力拉动下却并未取得预期的市场效果，而这种状况在三季度开始恶化。 \r\n</p>\r\n<p class=\"text\">\r\n	事实上，从我个人分析，三星GalaxyS5除了在\r\n产品上缺乏创新之外，发布时机也明显有问题，那就是从2月份MWC曝光，到4月份正式发布并陆续在全球开始上市。但这个时候，iphone6尤其是大屏的\r\niphone6plus的曝光度越来越强，很多用户在看了GalaxyS5之后，没有感到特别的惊艳，因此更希望看到苹果发布iphone6及\r\niphone6 \r\nplus之后才决定购买那部机器。因此，铺到运营商及渠道的机器很大部分都成了库存。后续的结果大家都很清楚，苹果完胜。三星本希望用GalaxyS5力\r\n挽狂澜，因此投入了巨大的营销费用，但没有获得应有的回报。反观作为挑战者华为的MATE7，不仅有溢价，至今仍然一机难求，可以说比GalaxyS5晚\r\n发的iphone6/6plus及MATE7成功的将GalaxyS5在中国市场给绞杀了。 \r\n</p>\r\n<p class=\"text\">\r\n	因此，整个三星渠道体系从2014年第三季度开始一直处于清库存的状态，有三星渠道商反馈，2014年下半年三星高端机销量只有2013年同期的1/2到1/3，渠道商已经不敢从三星拿货，原因很简单，三星手机已经不是热门的畅销品牌。 \r\n</p>\r\n<p class=\"text\">\r\n	其实，三星早已因压货问题引起了渠道商不满，其中苏\r\n宁等大零售商受到的影响最为严重，且有一些大渠道商因此拒绝继续进货。与此同时，为了冲业绩，三星对渠道的价格控制也出现了问题，这主要体现在三星对二级\r\n渠道管理力度不够，造成各个垂直渠道之间的利益冲突。销量好的时候冲突并不明显，现在三星手机全球销量下滑，问题就被放大。据称，三星某代理商，几年前鼎\r\n盛时期三星销量占到其总销量的30%，而现在充其量在15%左右。 \r\n</p>\r\n<p class=\"text\">\r\n	另据相关统计，从渠道实际出货量看，三星的下滑幅度\r\n比想象中还要严重。渠道的出货量几乎每个月都在往下走，2014年10月三星的出货量总共160多万台，2013年同期三星的出货量是800多万台。到了\r\n2014年11月，三星的出货量是120万台。相比之下，三星手机出货最高的时候，其在中国的市场份额能够达到28%—30%，下滑到现在，市场份额仅在\r\n10%左右。 \r\n</p>\r\n<p class=\"text\">\r\n	面对三星之前一直赖以生存的渠道过去一年的销售业绩\r\n的下滑及今年依然存在的压力，渠道商希望三星能在电商渠道上授权，在京东、天猫等平台上发力。不过，相比小米、联想、华为，三星此前更多是靠传统的广告营\r\n销模式来支撑品牌和市场，在互联网和电商领域，中国本土公司显然更有优势和经验。不过，据说三星已经计划效仿小米，希望在印度等市场也开始依托电商渠道进\r\n行销售。但对于三星这样大的公司而言，要想转变传统营销思维并不是一件容易的事。 \r\n</p>\r\n<p class=\"text\">\r\n	与三星的渠道之殇相比，国内手机厂商的渠道策略则更\r\n加多样化和灵活。目前国内公开渠道、运营商渠道、线上渠道基本维持比例为40%、40%、20%。由于运营商减少手机补贴，运营商渠道影响力有所减弱，传\r\n统手机分销商话语权也在减弱，而电商渠道的占比则不断提升。与此同时，手机厂商开展的线上线下营销协同体系建设正成为终端销售渠道转型的重点。预计\r\n2016年，三大渠道基本会三分天下。由此不难看出国产手机厂商在不断调整他们的渠道布局。 \r\n</p>\r\n<p class=\"text\">\r\n	例如将三星作为主要竞争对手的华为，2014年华为\r\n终端公开渠道的收入占比大幅上升，公开渠道（含电商）在手机销售收入中占比达到41%。其中，荣耀超2000万部的销量中电商平台占到了70%的份额。值\r\n得一提的是，在渠道的策略上，荣耀正在发生一些变化。尽管电商平台是荣耀的主要阵地，但对于线下渠道庞大的出量和市场，荣耀计划实施同步并举。 \r\n</p>\r\n<p class=\"text\">\r\n	据了解，华为终端正在计划成立一个新的操盘平台，即\r\n荣耀和华为终端将在前段进行销售整合，以往两者在全国的销售平台各自独立，华为终端聚焦线下渠道，荣耀聚焦电商平台。而在华为终端之前的双品牌策略下，华\r\n为终端的产品售卖主要通过线下销售，包括运营商定制、传统国代商等，并不接入荣耀的产品；而荣耀则集中在电商渠道出货，也不售卖华为终端的其他产品系列。\r\n简单而言，华为终端依然是华为终端，荣耀也还是其独立手机品牌，但在销售整合上将互相融合，使用一个新的全国操盘平台。除此之外，2014年下半年，华为\r\n开始大量建设线下渠道，去年一年就开设了300多家服务店。 \r\n</p>\r\n<p class=\"text\">\r\n	最近有一条很有意思的微博，华为终端中国区CMO杨\r\n柘发了一组图文微博:我们无法改变过去，但可以让未来变得更好……（图为济南泉城路三星最大专卖店拆除，明天就属于华为），这位前三星中国区品牌操盘手跳\r\n槽华为之后，掀起了不少品牌营销活动，并将华为品牌做的风生水起。一升一降之间，就是赤裸裸的商战结果。 \r\n</p>\r\n<p class=\"text\">\r\n	当然渠道多样化和灵活的背后是国产手机产品本身的崛\r\n起。众所周知，国产手机从2014年开始，在工艺、品质上已经完全可以和三星叫板，无论是2000元价位段的产品，还是千元智能机都有着非常不错的品质。\r\n而随着手机硬件、软件方案完全成熟之后，手机确实进入了标准化的时代，让成本下降的同时品质还可以得到保证。而且国产手机在供应链上的弱势已经几乎摊平，\r\n三星的供应链优势正在被瓦解。例如在智能手机至关重要的处理器上，华为自主研发的海思麒麟系列芯片处理能力已然高于三星的处理器。中国厂商的手机产品已经\r\n从底层芯片、处理器、软件，到硬件创新、外观工艺，让三星都失去优势。 \r\n</p>\r\n<p class=\"text\">\r\n	对于三星来说，去年的新品S5缺乏竞争力、品牌影响力在国内遭到质疑、人事变动等，削弱了渠道商的信心，所以与之前同样大量向渠道压货的情况下，却适得其反。 \r\n</p>\r\n<p class=\"text\">\r\n	我们知道，作为传统的硬件厂商，三星要实现自我革命确实很难，禁锢不仅仅来自企业内部的思维模式和管理方式，更来自于和他合作的同为传统企业的渠道商与供应商。那么三星能否在未来改变颓势？从中国手机厂商强劲的表现看，挑战颇大。 \r\n</p>\r\n<p class=\"text\">\r\n	就在本周，三星在中国正式发布2015年旗舰机GalaxyS6，中文名盖乐世。虽然该机在MWC上颇受好评，但几乎所有国产厂商都几乎坚信，在中国彻底打败三星只是时间问题，一方众志成城，一方孤军奋战，这就是三星在中国的境况，盖乐世能否乐的起来还待检验！\r\n</p>'),(17,'<p>\r\n	【环球时报记者郭媛丹报道】乘坐中国海军临沂舰撤离也门的225名外国公民当地时间2日19时15分平安抵达吉布提港。\r\n</p>\r\n<p>\r\n	此次撤离的225名外国公民来自巴基斯坦、埃塞俄比亚、新加坡、意大利、爱尔兰、波兰、德国、加拿大、英国、也门10个国家。这些外国公民搭乘临沂舰，当天从也门亚丁港撤离，经过近8个小时航行抵达吉布提港。\r\n</p>\r\n<p>\r\n	此前，中国政府在自也门撤离中国公民行动中，还协助罗马尼亚、印度、埃及等国的8名公民平安撤离。\r\n</p>'),(20,'回顾起来，感触很多，体会很深，以下几点心得，也许会对后来者有所启发。\r\n<p>\r\n	<strong>一、认清自我，坚定信心。MBA的考生，来自不同行业、不同背景，年龄、基础都不相同，在学习之前，首先要清楚自己的实力和水平。</strong> \r\n</p>\r\n<p>\r\n	我在读大学时，由于学校对英语抓得不紧，可以说我基本上就没有学英语；工作七年中，工作内容又跟英语丝毫不相关。仔细想来，我比应届高中毕业生\r\n的英语水平还要低得多。就我这种英语底子，还敢报考MBA？在报考之前，我的确非常担心，心中的最大隐患就是英语。但转念一想，不就是一门语言吗？马克思\r\n3个月都能学好一门外语，我用一年的时间还不行吗？只要认认真真下功夫，我就不信学不好英语。带着一腔热血，我就上路了。\r\n</p>\r\n<p>\r\n	首先，我找来一份2001年的真题，心想就当作一次模拟考试，看看自己的真实水平，当时是2001年3月份。结果可想而知，做到阅读理解我就已\r\n经做不下去了，一校对，20道语法词汇题，对了3道，阅读理解根本就看不懂。尽管狠狠给我泼了一瓢凉水，但我并没有灰心，于是翻出自己以前高三的英语课\r\n本，开始了自己艰难的考研之路。\r\n</p>\r\n<p>\r\n	<strong>二、做好计划，系统复习。古人云：“预则立，不预则废”，事实的确如此，要想做好一件事情，必须做好计划。当时是3月份，离考试大约还有10个月的时间，我把这10个月分为四个部分：</strong> \r\n</p>\r\n<p>\r\n	3、4月是熟悉英语阶段，主要就是复习高中和大学的英语课本，每天利用工作之余，尽可能多地看英语书籍；\r\n</p>\r\n<p>\r\n	5、6、7月份是英语、数学一起复习阶段，根据大纲要求，把英语大纲认认真真看一遍，也就是在这个阶段，听说要加试听力，于是我就买来随身听，\r\n坚持在上班的路上听英语，本来是乘班车上班，但为了避免与同事说闲话，我就坚持骑半小时的自行车，既练习了听力，又锻炼了身体。在一天的安排上，我上午看\r\n数学，下午看英语，晚上做数学题，最后背词汇；\r\n</p>\r\n<p>\r\n	8、9、10、11这四个月是全面复习阶段，四门课程同时复习，狂做历年考题和多套模拟试题(尤其是英语和数学试题)，通过做题，找出自己的不足和弱项，然后转入最后的冲刺阶段：考前50天。\r\n</p>\r\n<p>\r\n	在这50天的学习中，就英语而言，每天做4至5篇考研的阅读理解，熟记背诵几句作文闪光句型及一些常用词组，其它多余的时间就应该更注重其他各科了。除了整个进程的计划之外，每天的学习也要有所固定的安排。\r\n</p>\r\n<p>\r\n	当时为了提高学习效率，我每天早上坚持锻炼身体半小时，回家后复习一下昨天学过的内容大概以及错题笔记，然后再去上班。晚上是一天学习最重要的\r\n时间，在晚上学习之前，先看看今天学了什么，还要学什么，然后全力以赴，力争完成，但要争取在1点之前睡觉。既要上班又要复习，感觉是挺累的，但现在上班\r\n族考MBA可以选择网上教学，随时随地学习，效果还不错，确实是一条捷径。如何选择适合自己的MBA课程，我认为应该考虑几个因素：国际声誉、地区声誉、\r\n灵活性和方便、专攻方向、入学者的概况等等。\r\n</p>\r\n<p>\r\n	<strong>三、找准弱项，突出重点。“知己知彼，百战不殆”</strong> \r\n</p>\r\n<p>\r\n	我清楚地知道英语是自己的弱项，而词汇和阅读又是英语之中的薄弱环节。所以我十分注重词汇的积累，为此，我买了文曲星，并且充分利用文区星携带\r\n方便的特点，随身携带，随时学习，而且把记不住的单词存到生词表里，一有空就拿出来背。最后临近考试时，再翻开考试大纲的词汇，已经很少见到不认识的单词\r\n了。\r\n</p>\r\n<p>\r\n	对于阅读，一天4至5篇阅读理解，我一直坚持了近两个月。此外，我还订阅了《二十一世纪》，工作闲暇之余就拿来一读，不断提高自己的英语阅读水平，为我在考场上的较好表现奠定了良好的基础。\r\n</p>\r\n<p>\r\n	<strong>四、做好模拟，强化应试</strong> \r\n</p>\r\n<p>\r\n	<strong></strong>如果势利一点讲，考试就是为了考高分，而要想考高分，就要从如何才能考高分入手去复习。无疑，模拟考试就是\r\n一种很好的方法。从10月份开始，我坚持每周做一套英语试题，到最后，仿佛做出了“题感”，感觉英语考试简单多了。 \r\n　　当然，在众多的试题之中，有很多是重复的，但我相信，只要你做了一定量的题，你就会在考试时感到有很多试题你似曾相识，这样就会加快你的做题速度，使\r\n你能有一个好的心态去应对整个考试。MBA英语试题的题量相对来说还是比较大的，有很多考生都做不完，如果你能顺顺利利做完，相信你的考试分数就不会低\r\n了。\r\n</p>\r\n<p>\r\n	<strong>五、注意技巧，争取高分</strong> \r\n</p>\r\n<p>\r\n	<strong></strong>任\r\n何考试都有很多技巧，英语考试也不例外。如果能参加一个辅导班，你会感觉英语考试可能也就是那么一点点技巧而已，当然这种感觉是建立在你已经准备得比较充\r\n分这个基础之上的。 \r\n　　比如：英语作文，你只要背上几篇像样的、有代表性的范文及一些闪光句型，保准你的作文分会在及格以上，现在这样的范文书很多，像《万能作文》，《十句\r\n话作文》等等。再比如做题顺序，要先做阅读理解、汉译英等大分值的题目，其次是作文，最后才是语法、词汇和完型填空等低分值题目。这样在你头脑清醒、时间\r\n相对宽松的情况下，你就可以尽可能地保住高分值题目了，至于低分值题目，此时的影响就不是很大了。\r\n</p>\r\n<p>\r\n	国内不少高校的MBA提前面试正在进行中，您可以完善以下信息进\r\n</p>'),(21,'<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	十几年前在耶鲁读书时，我找到个助教职位，是帮助把关一个专业有关中国研究的毕业论文。其实，论文最后还是要教授过目。我只不过是进行一些前期辅导，比如论文设计、写作大纲、原始材料的翻译等等，别让学生弄得太不靠谱，搞得教授的修改工作量过大。这个工作经验，让我近距离接触了美国的学霸。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	至今最为记忆犹新的，是一位女生。她先来跟我谈论文计划，颇有条理。我就批准了。可等她的书面提纲提交上来，我就傻了：所讨论的题目不仅没有展开，而且漫无头绪，<a class=\"a-tips-Article-QQ\" href=\"http://edu.qq.com/en/\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">英语</a>(<a target=\"_blank\" href=\"http://class.qq.com/category/90.html\" class=\"a-tips-Article-QQ\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">精品课</a>)还不如口头讲得好。于是，我批改说：当初谈的时候想法很清晰，但这个提纲的质量让我意外。写作时要精心发展当初的想法，提供一些展开的论述和大致的证据。同时，英语一定不要有太多错误。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	结果，这位第一次见面还十分友好的女生，在整一个学期的论文写作阶段再不跟我说一句话，还去找了另外一位助教。当时和我共事的一位美国博士生听了后说：这些孩子，大概很少听别人批评，所以受不了了。我一想，也许我这个外国学生本身英语就说得不靠谱。连我都说她英语不好，对于一路学霸当过来的耶鲁学生，肯定觉得是奇耻大辱。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	还有一位学生，论文的证据不足，我让他把数据搞清楚，下结论要有证据，别用太多含糊的形容词。后来那位同学居然提出：“能否不这么批评？”其实，我和所有同学事先都声明：英语不是我的母语，委婉的话我不会说。我的责任，就是指出你们的问题。我们就事论事，目的是找到问题，并把这些问题解决，免得论文送到教授那里出麻烦。更不用说，我提出批评时，全是一对一的私下场所，根本不存在脸面挂不住等问题。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	毕业后多年，看到许多对常春藤学生的批判，对这些经验慢慢才能消化理解。有些教育家说，这些常春藤的学生一路都是学霸，认的就是分数以及分数背后别人的认可，心里其实很懦弱，没有自己的主心骨。他们选课，不是追求兴趣，而是计算哪门能拿高分。如果拿不到高分，似乎就在所有的人生期待面前崩溃了。这话或许有点极端。但常春藤里，这种风气确实很盛。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	最近我教中国的高中生，在学霸群中也碰到类似的问题。比如，有个学生能力上鹤立鸡群，但有一次我狠狠批评了她，因为错得太离谱。之后，她就再不和我沟通了。还有一位，因为讨论问题时总是被另一位学霸压一头，就退出了。这些学生都很聪明，从小到大的成绩无懈可击。他们每做一件事，结果都是赢得赞许。这种对赞许的期待，也成了他们的心理支撑。如果你不赞许他们，反而严厉批评，他们就特别容易心理崩溃。这就和那些从没有接触过病菌的人一样，体内一点免疫力没有。真一接触，就可能要命。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	当然，这些或许还属于比较极端的事例。最经常发生的事情是：一旦学霸的意识在脑子里生根，这些学霸在求知过程中就容易缩手缩脚。他们总觉得自己拿出的东西，一定要赢得掌声，否则就绝对不能出手。他们特别怕别人说：“闹半天连他也搞不懂这个问题！闹半天他这里也会错！”过分回避犯错误，已经形成本能。慢慢的，就丧失了数不清的学习和进步机会。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	我的求学历程比较长，见得就比较多。当学生，特别是在比较有挑战性的环境中，面对的很多批评都是当众，人家会指着你鼻子说“肤浅”、“误导”……简直一无是处。这个时候，一个成熟的学生要聚焦别人指出的问题，而不是觉得别人看不起自己，这是最好的学习机会。我见过很多有成就的人，面对这些批评都能全神贯注在自己的问题上。而许多人则全神贯注在别人的态度和自己的自尊心上，对于问题本身却没有心思去想。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	我跟学生们一再讲：好面子的当不好学生，进步不了。你总在乎自己在别人眼里是什么样子，就集中不了精力在所学的东西上。中小学所学的东西简单，小聪明能应付，所以还关系不大。日后学得复杂了，这一点就非常重要。我特别喜欢的，是最近在美国大红大紫的一篇毕业致辞。致辞者是波士顿地区一所名校的英语老师David McCullough。他说：“登上是为了看世界，不是让世界看你。”求知岂不也是如此？\r\n</p>'),(22,'<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	哈佛商学院现任院长尼汀·诺里亚(Nitin Nohria)的背景迥异于所有前任院长：身为印度裔美国人，他是哈佛商学院百年历史上第一位出生在美国之外的院长；此外，他不像前任那样大都是经济学或财务背景，而是一名领导力教授，且历来强调商业伦理在商学院教育中的重要性。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	2010年诺里亚的上任意味深长。他承载着哈佛商学院重振声誉、保持辉煌的使命。因为始自2008年的金融危机让曾经风光骄傲的华尔街精英名誉扫地，甚至整个商业世界都失信于民。作为培养出最多华尔街精英、代表整个美国商业大脑与灵魂的机构，哈佛商学院因此备受指责和压力。对诺里亚的任命，被认为是哈佛大学对这一切的回应。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	五年过去，诺里亚在上海接受《哈佛商业评论》中文版采访，谈他如何履行使命、如何应对挑战。言辞之间，诺里亚显然不愿意也不认为，哈佛商学院会将其在20世纪持续百年的领先地位拱手相让。他说无论他个人或者哈佛商学院、甚至整个哈佛大学，都会以创业者的姿态去面对21世纪所有的变化与挑战。而且，面对今日之世界，他建议人人都要具备创业者精神。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	<strong>哈佛商学院从未试图本土化</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：在中国我听到一些抱怨，说哈佛商学院像其他大型跨国公司一样，相当官僚而且行动缓慢，你怎么回应？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：那些说哈佛商学院行动迟缓的人大概并不知道，差不多所有商业教育领域的全新做法都始自哈佛商学院。我们创造了案例教学法，我们创造了高管培训项目，其他商学院纷纷效仿；我们创造了哈佛商业出版体系，哈佛商学院生产的案例被全世界所有商学院使用，等等。哈佛商学院一直充满活力，对哈佛商学院迟缓官僚的印象肯定是错的。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	另一个对哈佛商学院的错误印象是说我们缺乏创业者精神，但是数据表明，哈佛商学院非常具有创业精神：50%的哈佛商学院毕业生在毕业后的20年里创办过自己的企业，只不过他们并不是都在硅谷，不都是科技企业而已，而是身处各行各业。最近《福布斯》以及另外一些机构做排名，哪家商学院产生了最多的创业者？哈佛商学院在几个排名里都名列前两位。还有我提及的哈佛创新实验室，也是哈佛大学大力投资创业精神的例证。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	我想主要是因为长期以来哈佛商学院培养了太多成功的大公司CEO，所以人们容易误会哈佛商学院并不擅长培养创业者，但如果看数据，事实是，哈佛商学院既为大公司培养了许多杰出的CEO，也培养了大量杰出的创业者。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：那么你如何看待哈佛商学院在中国市场的竞争者？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚： 中国市场对于商业管理教育的需求呈爆炸式增长，不论哈佛商学院或其他任何一家商学院都不能充分满足市场的全部需求。从某种程度说，我们很高兴看到本土商学院崛起填补当地需求。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	但是，中国的企业高管一定会在某个时刻需要全球化的商业管理教育，真正跻身全球商业高管精英当中。但至少目前，想要与来自印度、巴西、欧洲、拉丁美洲等等的全球杰出企业高管一起学习讨论，在清华、北大的课堂里还是很难实现的。这就是哈佛商学院课堂的优势。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	其实哈佛商学院从未试图本土化，我们在做的是帮助本土商学院成长。比如我们跟清华、北大之间的合作都是教给他们案例教学的方法，指导他们的案例写作等等。本质上，哈佛商学院在做的并不是一门生意，我们不和其他生意竞争，我们的目标是让全球任何地方的人都可以受益于商业管理教育。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	<strong>在线教育更像零售业</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：传统教育在数字化时代会是怎样的生存状况？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚： 我觉得在线教育有点像零售业。想想看，在线零售的崛起并没有完全替代人们在实体店消费时许多非常个人化的体验。传统教育相当于实体店的质量和体验。让传统商学院无可替代的，不仅在于它提供的知识、技巧和工具，还有长达终生的深厚的同窗之谊，它为你提供某种身份认同，让你探索自己在这个世界的位置，我不相信这些事情都会移到线上。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：所以实体教室会永远存在？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：我相信实体教室仍然会是教育系统中非常重要的一部分，但它必须变得非常特别。如果教室只提供标准化课程，学生们就会都去线上学习了，但如果你提供非常互动性、启发性的内容，就像哈佛商学院的课堂，教授在学生之间引导对话，学生们在对话和互相启发中不仅学到知识，还培养出卓越的判断力，并且发展出持续终生的友谊，课堂就依然极具吸引力。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：所以MOOCs的用户其实不是哈佛商学院的客户？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：对。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：目前对MOOCs的商业模式以及持续发展有很多争论，你怎么看？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：我觉得对MOOCs的需求是真实存在的，就像我刚才说的，它更像零售业，人们对亚马逊有需求，但同时会去耐克精品店、苹果体验店一样。你可以在网上买到任何一款苹果产品，但是在苹果的纽约店和波士顿店始终排着长队。用户在苹果店里试用各种产品，听非常熟悉产品的店员给你详细介绍，这些是线上没有的体验。我相信MOOCs可以提供质量相当不错的教育产品，同时也有很多人没钱没时间，没有能力投资于更互动的教育体验，他们会受益于MOOCs。但市场上同时还存在另一种需求，对更互动、更亲密的教育形式的需求。所以实体教室和在线教育不是非此即彼，而会同时并存。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	<strong>21世纪，人人都需要创业精神</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：作为领导力教授，你认为21世纪的领导者需要具备哪些特质，跟上一辈商业领袖有哪些相同和不同？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：其实我不相信卓越领导者拥有一系列“特质”(traits)，而更愿意说他们具备一系列“能力”(capabilities)。因为“特质”是生而有之，而“能力”是后天习得的。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	习得“情境领导力”、获得全球视野，对21世纪的商业领袖来说是极其必要的能力。学生们坐在美国的课堂里想象中国市场可能对某个产品、某种服务感兴趣，但是当他们来到中国，实地测试这个产品或服务的时候，就会发现因为政治因素、文化因素等等情境差异，需要重新思考这个产品和服务，需要做出基于中国市场的应对和调整。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	除了情境领导力，我特别想强调的是，21世纪非常重要的是，人人都需要具备创业者精神(entrepreneurship)。这不是说人人都要去创办自己的企业，而是说即便身居大公司你也需要以创业者的精神去做事。即便哈佛商学院，一旦我们丧失了创业者精神，也必将落后。所有牢固的百年大公司都需要以创业者的精神面对竞争。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：可是哈佛商学院的口号仍然是培养“领导者”(leaders)，而不是培养“创业者”(entrepreneurs)。在《他们的时代》中，你区分了领导者、创业者、管理者(managers)三者的不同。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：是的，创业者是改变行业规则、创造全新事物的人；管理者是把企业从小做大，实现规模性增长的人；领导者是在企业遇到危机时将企业带向新生的人。我主要是从领导力的类型来区分三者，但是对一个领导者来说，这三种能力应该是结合在一起的，在企业发展的不同阶段，需要他更多体现或具备其中某种或全部这些能力。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	HBR中文版：对商业领袖而言，相比20世纪的商业管理，哪些需要改变，哪些不会改变？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	诺里亚：持续变化的是商业模式。Facebook刚创办的时候，没人认为它能赚钱，但是它最终找到了自己的商业模式。每天都有新的商业模式出现，商业领袖要永远对商业模式保持警觉，新出现的商业模式随时可能威胁公司现有的生存。对哈佛商学院也同样如此，如果不紧密关注数字化在教育领域催生的新商业模式，我们也会有危险。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	而永远不变的，还是对人的管理。不管任何时代、任何环境、任何技术革命，你始终需要激励人、鼓舞人，用更好的方式让人们彼此协作不论商业模式怎样变，不论公司规模大小、发展阶段，领导力都是最核心的不变的东西。\r\n</p>'),(23,'<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	关于<a class=\"a-tips-Article-QQ\" href=\"http://edu.qq.com/kszx/ielts.shtml\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">雅思</a>(<a target=\"_blank\" href=\"http://class.qq.com/category/94.html\" class=\"a-tips-Article-QQ\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">课程</a>)精读，首先，认真选择精读文章，只需10篇剑桥文章，你的成绩就可以在7.5以上。但这一前提是你不是流于形式，而是认真走心的读。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	我一直认为雅思精读最大的目的在于四点：\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	1、生词+学科核心生词\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	2、每道题涉及解题的同义替换\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	3、长难句的不回读训练\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	4、段落中心句位置+文章构架的积累训练与开悟体验\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	1、生词+学科核心生词\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	雅思考生公认精读来扫清阅读单词死角是再合适不过的了，尤其精读了几篇生物类文章，再答生物类全都认识了。比如C7蚂蚁智能里面的forage/scout/bearing/odour等词，精读过少量生物类文章，再去做OG上的swarm之类的文章就非常easy了，通篇可以快速读懂，准确定位，正确率超高。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	再如精读过C9的金星凌日，天文类词汇基底你就get到了，什么日食月食轨道运行太阳黑子与光斑，只要考试出了天文类，百分之75以上的基底词汇你都是认识的，答题就自如多了。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	2、每道题涉及解题的同义替换\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	粗定位一个定位词，全文可能会出现30多处，俗话说：两点定一线，你的关键词/定位词，至少要画两个以上还要全都找到。我一般建议学生“抓三点”“抓四点”“抓五点”，题配句，词换词，细定位就是要找至少两三个换的词。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	说到底，同义替换词这个事情，还是要多多积累的，比积累词汇量在雅思阅读中，还要重要。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	所以单词量达到瓶颈以后，要做的是背”同义替换词表“\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	3、长难句的不回读训练\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	忘了是哪个老师说三行以上必出题。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	N个学生的反馈都是：长难句读到后半句，前面就忘了度过了什么。或者单词都认识，就是读文章速度太慢。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	当年考GMAT看过一本《GMAT长难句练习》，里面提到了”打死我也不回读”这个方法，一直分享给学生，效果反馈很棒。里面说：\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	只要每天练习五个长难句不回读训练，看到大长句子，习惯性切割主谓宾，一周就会看到效果。本来想着不就是主谓宾嘛，结果练了十多天，读题速度有了飞跃性的提升。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	长难句再也不是问题，看到就自动读主谓宾，这就可以轻松记住意思，读下面句子的时候，逻辑就形成了非常舒服的衔接。如果有题在句子中，再去精读也不迟。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	4、段落中心句位置+文章构架的积累训练与开悟体验\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	LOH和 段落信息配对，怎么做，主要靠精读的这个步骤。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	LOH做多了，自然有了feel，首句中心句?末句中心句?转折中心句?这就不细说了，做多了就知道。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;text-indent:2em;background-color:#FFFFFF;\">\r\n	段落信息配对题，因为无序且恶心，同义替换幅度较大，有时候需要通读全文。我却始终坚信“预测乃解决断子绝孙题的直通车”。只要精读了，你就会发现，原来文章各个部位都有暗示你过，那么下次如果你没读原文直接做MATCHING你要怎么“蒙题”，精读多了你就懂了\r\n</p>'),(26,'<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	原标题：关注·底层教育梦：先天不足 后天亏损？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	对多数不能升学的底层孩子而言，与其被老师教成温顺的小绵羊，不如告诉他们真实世界的行事规则\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	大多数身处农村底层和城镇边缘家庭的孩子就近入学所就读的学校，很难成为其阶层上升流动的通道\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	这种“先天不足”与“后天更弱”的教育现实，使绝大多数底层群体早在中考前就已经和重点大学无缘\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	--\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	在知识和文凭愈来愈成为当今中国核心竞争力和时代化标签的同时，为何底层社会群体越来越无心通过文化资本的集聚来改变其底层状态？他们是天然具有根深蒂固的反智主义传统？还是因为其他因素的制约，导致他们被抛出教育这条“马拉松竞赛”的轨道？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	笔者主持了国家社科基金课题《中国城镇化进程中西部底层孩子们阶层再生产发生的日常机制及策略干预研究》。在展开全国大样本调研基础上，笔者深入中国西部农业县——四川芥县，开展为期半年的田野工作，深入研究从幼儿园入学一直到进入就业市场的教育筛选轨道中，底层家庭是如何一步步被固化的。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong>不少人即使送孩子读书，也支持“读书无用”</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	在乡间底层群体中，“读书是否有用”经常发生行为与观念上的“二元背离”。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	笔者的调研结论证明：与子女已经接受完各阶段教育的农户家庭相比，有子女正在接受各阶段教育的农户家庭对读书有用性的认同度更高。但是，他们似乎仅仅是“读书有用”的观念认同者，但却是“读书无用”的行动支持者。尽管在送孩子入学时都会叮嘱孩子要好好学习，实际上，他们并不真正把孩子的学习当回事：\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	一方面，家长任意肢解和侵占孩子的学习、休息时间，甚至在上课期间，有家长以孩子生病或转学的名义，领孩子到工地打工或到农田帮活；\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	另一方面，他们因为能力的限制而并不能真正参与到对子女的教育中来，甚至有时候因为功利、实用、短视与金钱至上的观念，而与学校主流价值观和教育实践形成抵触与反叛。升学希望渺茫与教育回报率低的尴尬现实，使他们寻找到一套属于底层的教育理性——\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	绝大多数的孩子将来都是升不了学的，这就意味着吃不了“国家饭”，他们迟早都要到社会上“谋饭吃”。与其在学校里被老师教成温顺的小绵羊，变成按书本规矩办事的“书呆子”，还不如现在就告诉孩子真实世界的行事规则。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	这是乡间底层一种无可奈何的尴尬选择。在现实中，底层因为家庭、教育、社会等多项因素影响，在通向社会阶层上层流动的教育竞争轨道中过早地被抛弃。同时，因为这种教育的高淘汰和低预期，底层孩子更快地结束了在教育筛选轨道中的旅程，提前开始了底层内部的个体社会化预演和训练。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	原标题：关注·底层教育梦：先天不足 后天亏损？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong>“邻村”幼儿园：可有可无的教育场所</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	早期的儿童教育具有特殊重要性，因为在这段时间，儿童正逐步形成他们的自我概念和社会意识，这是个体社会化的第一步。然而，第一步对于不同的儿童来讲差异甚大。在城镇中，特别是大城市，儿童被送入学费昂贵的幼儿园接受有专家指导的正规早期教育。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	一项对3000名儿童提供学前教育的研究（大部分是贫困的美国黑人）表明，接受学前教育的儿童在很多方面处在优势地位：他们很少被分到特殊班或补习班，很少有学生因成绩差而被留级；接受过学前教育的贫困家庭孩子在随后3年的标准比奈智力测试中，分数比控制组儿童高；他们保持着更强的“成就取向”，也倾向于培养比自身还要高的职业志向。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	然而，与城镇，特别是大城市的家长相比，底层农村社会中的家长却在送孩子入幼儿园上发生了困难。笔者所调研的四川芥县很多农村家庭持有这样的观点：\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	第一，诸多底层家庭认为幼儿园就是一群孩子玩的地方，可上可不上，何况家里有剩余劳动力，或自己带，或给父辈亲戚带，更能保证安全；\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	第二，幼儿园的学费普遍较贵，这是一笔不用浪费的支出，何况每天还要接送孩子，费时费力。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	事实上，这种观念的形成，在很大程度上源于底层社会学前教育发展的自身困境。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	一方面，根据公开的统计数据，中国幼儿园在2001年到2011年的年平均增长率为4.09%，其中，城镇幼儿园和县镇幼儿园年均增加率分别高达6.76%和5.86%，但农村幼儿园年均仅增加1.02%。再从2010年到2011年的全国数据来看，在城市和县镇幼儿园绝对增长数纷纷过万的情况下，农村幼儿园却锐减了12904所。2011年，全国4～6岁幼儿人数中，农村占56.91%，可农村幼儿园园数和班数却仅占全国的35.19%和33.75%。农村幼儿教育陷入到一个恶性循环之中。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	另一方面，农村幼儿园的保教人员（专任教师和保育员）非常紧缺，以全国数据为例，农村幼儿园专任教师2001到2011年间的年均增长率仅4.86%，这远低于城市和县镇的10.75%和9.51%，甚至近年来还出现了大规模减少的现象。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	因为专任教师的紧缺，在农村学校布局调整后，四川芥县被淘汰下来的农村中小学教师转到农村幼儿园任教。他们没有经过系统化和专业化的学前教育培训，只能给农村幼儿讲授小学中的各种学科知识，从而进一步加剧了农村学前教育小学化问题的严峻性和复杂性。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	由此可见，这些留守的底层群体从起跑线处的学前教育开始，就面临着各种制度性和结构性的阻滞因素和现实困难。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	原标题：关注·底层教育梦：先天不足 后天亏损？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong>就近入学：公平还是不公平</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	家住云乡最偏远村落——蜈村的杨光，是就近入学政策的严格遵守者。杨光来自典型的底层家庭：父亲早逝，母亲改嫁，一直和叔叔一家一起生活。腿部有残疾的叔叔和妻子在家务农，维持全家四口的日常生计。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	7岁时，杨光入读了本村村小——蜈村小学。作为云乡九年一贯制学校分管的一个教学点，蜈村小学中唯一的老师是一名年近六旬的民办老师。这位老师不会讲普通话，教学水平也不高。二年级时，蜈村小学因为县里调整农村学校布局而被撤并，杨光转到邻村的桥村小学读书，但该小学也仅有5名教师，其中3名还是民办教师。两年后，桥村小学在新一轮农村学校布局调整中再次被撤并。随后，杨光转到云乡九年一贯制学校。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	与杨光同村的张小理则选择了另外一条不“就近入学”的路子。在外省打工的父母坚决把他送到县城的公办民助实验小学就读，尽管父母为此交纳不菲的学费，但张小理却在更优的环境中顺利成长。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	目前已经初三的张小理尽管学习成绩不算突出，却有把握考入乡镇普通高中——寿镇中学，而当年成绩更为优秀的杨光，却只能接受根本不可能考上普通高中的事实。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	仅以<a class=\"a-tips-Article-QQ\" href=\"http://edu.qq.com/en/\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">英语</a>(<a target=\"_blank\" href=\"http://class.qq.com/category/90.html\" class=\"a-tips-Article-QQ\" style=\"outline:none;color:#000000;text-decoration:none;border-bottom-width:1px;border-bottom-style:dotted;border-bottom-color:#536DA6;\">精品课</a>)为例，杨光所读的农村学校直到七年级时才开始教授英语，而张小理所就读的县城小学，早在三年级就开始教授英语了。同样的蜈村同辈，就近入学与择校之间的英语差距就是3年。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	在一次次农村学校布局变更中，多次的就近入学经历使杨光很难跟上不同学校的教学进度，也很难迅速适应不断变换的教学风格。同时，也因为进了教学质量并不好的各类农村学校，杨光在懵懵懂懂中，从“好学生”变成了现在的“差学生”。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	众所周知，从幼儿园到大学，各种层级教育空间内部质量差异甚大：越是处于行政区划序列下端的学校，教育质量越差，反之亦然。所以，因为出生地、户口所在地、家庭条件等因素而被置于行政区划不同序列节点中的个体，会因为就近入学而被国家强迫性地分流到不同质量的学校就读。而这种客观存在的学校教育质量差异，从一开始就设定了个体能否在若干年后取得成功，并实现阶层上升流动的程序。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	对于绝大多数身处农村底层家庭和城镇边缘家庭的孩子来说，就近入学所就读的学校，只会在他们的生命历程中扮演底层再生产的功能，而很难成为其阶层上升流动的通道。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong>初中后的分流：普通高中、职业高中或终止学业</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	事实上，教育分流中这种不公平的家庭资本关系在芥县也有明显体现。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	笔者在芥县教育局获得了2013年全县中考的录取信息表和家庭基本情况表。在这份录取表中，笔者选择了4所芥县的初中学校作为样本学校，它们分别是县城中的公办民助贵族式初中、县城普通公办初中、镇上普通初中、乡里的九年一贯制学校。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	按照等比例抽样原则，笔者在每所学校随机抽取了50个考生，按照学校提供的家庭收入情况调查表，将家庭年收入在10万元以上的划为上层、5～10万元的划为中上层、2～5万元的划分为中层、1～2万元的划为中下层、1万元以下的划为底层。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	定量研究数据发现，芥县初中生毕业后的流向与家庭所处阶层具有明显的相关性：上层子女就读市重点高中、县重点高中的比例高达66.7%和20.8%，而底层子女则没有人能入读市重点高中，仅有4%的比例入读县重点高中。底层子女入读本县职业高中的比例高达66%，终止学业的也高达22%。与之相反，上层子女则无人入读本县职业高中，也无人终止学业。另外，笔者还发现：职业中学成了中下层和底层子女绝大多数初中后的主要出路，而普通高中是中层以上子女的主要出路。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	学生在学业与升学中的不平等主要是因为文化机制，教育主要体现的是一种文化资本传递，这种传递是通过日复一日的“实践”形成的习惯。随着有技能、受过良好教育的劳动力在经济上的地位日趋重要，学校制度中的不平等现象，在一代一代地再生产，原有的阶级结构也越来越重要了。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	父母的学历所代表的学校教育成果作为文化资本，不仅在家庭里积蓄着，由子女继承下来，而且子女和家庭的升迁性流动机会在很大程度上取决于能够为子女提供怎样的学校教育机会。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	原标题：关注·底层教育梦：先天不足 后天亏损？\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong>难以企及的重点大学、劳动力市场分割与就业困难</strong>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	在教育层层分流与筛选的过程中，对于绝大多数底层群体而言，重点大学是可望而不可及的遥远梦想：一方面，这需要家庭持续性的长期教育投资和丰富的文化资本传递，而这两项正好是底层群体相对最为稀缺的资源。他们没有足够的经济资本可以容许子女长达数年的教育周期性积累，在子女成长最为关键的时期内，他们也没有科学的教育方式和充足的文化资本予以理性培育与有效传递，他们甚至自身也并不真正重视教育，生存理性的强大思维惯性使他们急于期待子女尽早进入到劳动力市场中去谋取即时的报酬，哪怕所获的微薄报酬甚至根本难以满足基本的日常生存所需。他们没有足够的资本去进行人力资源投资，更无法容忍这种投资所需要承担的高风险：毕业后即失业；\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	另一方面，录取制度和知识考核对底层群体也极不公平。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	以英语为例，在笔者所调研的芥县云乡九年一贯制学校中，最近几年，少年们才在小学三年级开始零星接受一点英语学习，而就在几年前，因为英语老师紧缺，少年们都是要到初一才开始系统学习英语，且任教的英语老师甚至都不是英语专业出身，而是由教语文的老师兼职授课。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	双语幼儿园和各种幼儿、少年英语培训班，在芥县县城和大城市里随处可见。就连芥县经济稍微发达一点的乡镇，家庭经济条件中等以上的孩子也都从幼儿园就开始学习英语。且不论这些幼儿园英语教学专业性水平有多高，但与身处真正底层社区中的云乡少年们相比，乡镇少年的英语学习至少早了4～5年。所以，每次在全县的统一测试中，云乡八年级和九年级的少年们，仅英语一科的平均分就比全县平均分低至少30分以上，更不要说其他学科了。在最后城乡统一的升学考试残酷竞争中，他们根本无力取得一丁点儿的优势。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	这种“先天不足”与“后天更弱”的教育现实，使绝大多数底层群体早在中考前就已经和重点大学无缘了，能够考上一般普通高中的都是凤毛麟角，更不要说升入重点高中。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	底层群体在教育筛选轨道中面对比其他社会阶层更多更大的困难，但他们并没有得到制度性和社会性的弥补，反而却受到更大的歧视和挑战：\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	其一，国家教材和升学知识考核的亲城逆乡性，底层群体要去学习他们根本没有生活背景和经验体悟的精密化知识符码，这与他们日常生活毫无关系。所以他们学习会比其他阶层面临更多的困难。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	其二，各种决定命运的升学考试都要到陌生的城镇中去参考，这给本身就缺乏竞争优势的底层子弟带来更大的心理挑战。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	其三，他们中的佼佼者即便幸运地进入了重点大学，但因为底层家庭社会资本的薄弱，在主要劳动力市场日益固化和排他化了的当代社会，他们又不得不流入低收入和低机会的次要劳动力市场，同时还要面对城乡、区域和行业等多重非均衡市场分割现实以及城镇新移民现实生存危机的多重挑战，这些都是“教育改变命运”事实上的无效性或低效性所必然带来的高风险底层命运。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:29px;padding:0px;line-height:28px;font-family:宋体, Arial, sans-serif;font-size:15.9996px;white-space:normal;background-color:#FFFFFF;\">\r\n	（文中人名、县及县以下地名均为化名。感谢东北师范大学农村教育研究所和中国农村教育发展协同创新中心提供的帮助，感谢田野工作中提供过各种帮助的人士，感谢东北师范大学教授邬志辉与作者的多次讨论）（中国青年报 为中国社会科学院社会学研究所博士后）\r\n</p>');
/*!40000 ALTER TABLE `edu_article_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_comment`
--

DROP TABLE IF EXISTS `edu_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户id',
  `P_COMMENT_ID` int(11) DEFAULT NULL COMMENT '父级评论id(为0则是一级评论,不为0则是回复)',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `ADDTIME` datetime DEFAULT NULL COMMENT '创建时间',
  `OTHER_ID` int(11) DEFAULT NULL COMMENT '评论的相关id',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数量',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复数量',
  `TYPE` int(11) DEFAULT '0' COMMENT '1文章 2课程',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_comment`
--

LOCK TABLES `edu_comment` WRITE;
/*!40000 ALTER TABLE `edu_comment` DISABLE KEYS */;
INSERT INTO `edu_comment` VALUES (33,7,0,'很喜欢','2015-08-29 14:55:02',6,0,0,1),(34,7,0,'山东在哪啊','2015-08-29 15:13:22',6,0,0,1),(35,7,0,'我很喜欢这个课程的老师','2015-08-29 16:33:44',10,2,9,2),(36,7,35,'恩 我也是','2015-08-29 16:34:39',10,0,0,2),(52,7,0,'开始了','2015-09-01 18:42:28',19,2,3,2),(53,7,52,'哈哈哈','2015-09-01 18:42:40',19,0,0,2),(54,7,0,'我是河北的','2015-09-09 11:54:12',6,10,3,1),(55,7,54,'我是保定的','2015-09-09 11:55:57',6,10,0,1),(56,7,0,'哈哈 这个不错哦','2015-09-09 15:36:40',7,10,0,1),(57,7,54,'dsfgsfdgsdfgg','2015-09-11 17:52:34',6,1,0,1),(58,7,0,'呵呵','2015-09-15 17:11:46',10,1,1,2),(59,7,35,'哈哈','2015-09-19 14:15:49',10,0,0,2),(60,7,35,'嘎嘎','2015-09-19 14:15:54',10,0,0,2),(61,7,35,'呵呵','2015-09-19 14:15:58',10,0,0,2),(62,7,35,'哟哟哟','2015-09-19 14:16:04',10,0,0,2),(63,7,35,'嘻嘻嘻嘻','2015-09-19 14:16:10',10,0,0,2),(64,7,35,'呜呜呜呜呜呜','2015-09-19 14:16:15',10,0,0,2),(65,7,35,'wuwuwuwuwuwwuwuwuwuw','2015-09-19 16:18:36',10,0,0,2),(66,7,35,'呜呜呜uwuwuw','2015-09-19 16:18:52',10,0,0,2),(67,7,0,'嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎','2015-09-19 17:33:33',15,1,10,2),(68,7,67,'嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎','2015-09-19 17:33:42',15,0,0,2),(69,7,67,'嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎','2015-09-19 17:33:48',15,1,0,2),(70,7,67,'哈哈哈啊哈哈哈哈哈哈','2015-09-19 17:33:57',15,0,0,2),(71,7,67,'呵呵呵呵额呵呵呵呵呵','2015-09-19 17:34:03',15,0,0,2),(72,7,67,'无uwuwuuwuwuw','2015-09-19 17:34:10',15,0,0,2),(73,7,0,'嘻嘻i嘻嘻嘻嘻嘻','2015-09-19 17:34:19',15,0,0,2),(74,7,67,'a水电费','2015-09-19 17:34:25',15,0,0,2),(75,7,67,'玩儿','2015-09-19 17:34:28',15,0,0,2),(76,7,67,'蔷薇','2015-09-19 17:34:32',15,0,0,2),(77,7,67,'下次','2015-09-19 17:34:36',15,0,0,2),(78,7,67,'二','2015-09-19 17:34:40',15,0,0,2),(79,6,0,'还没讲完是吗','2015-09-24 11:19:57',15,0,0,2),(80,6,0,'咋没有教材视频','2015-09-24 11:45:42',11,0,0,2),(81,6,0,'asdfsadfasdfasdf','2015-09-24 15:04:20',19,0,4,2),(82,6,81,'9','2015-09-24 15:04:35',19,0,0,2),(83,6,81,'8','2015-09-24 15:04:43',19,0,0,2),(84,6,81,'7','2015-09-24 15:04:51',19,0,0,2),(85,6,52,'.......','2015-09-24 15:05:02',19,0,0,2),(86,6,81,'1234234','2015-09-24 15:05:08',19,0,0,2),(87,6,52,'asdfasdfasdf','2015-09-24 15:05:12',19,1,0,2),(88,6,0,'asdfsad','2015-09-24 15:10:33',6,1,1,1),(89,6,54,'hahaha','2015-09-24 15:10:58',6,1,0,1),(90,6,88,'hahahhahahahahahahahahahahaha','2015-09-24 15:11:04',6,1,0,1),(91,7,58,'gagag','2015-09-30 11:54:44',10,0,0,2),(92,7,0,'我很喜欢这个课程','2015-10-14 11:00:56',17,0,0,2),(93,7,0,'有谁在吗','2015-10-14 11:01:03',17,0,0,2),(94,7,0,'哇','2015-10-14 11:14:14',14,0,0,1),(95,7,0,'很喜欢','2015-10-14 11:22:12',14,0,0,1);
/*!40000 ALTER TABLE `edu_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course`
--

DROP TABLE IF EXISTS `edu_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course` (
  `COURSE_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `COURSE_NAME` varchar(300) NOT NULL DEFAULT '' COMMENT '课程名称',
  `IS_AVALIABLE` int(10) NOT NULL DEFAULT '0' COMMENT '1正常2删除',
  `SUBJECT_ID` int(11) DEFAULT '0' COMMENT '课程专业ID',
  `SUBJECT_LINK` varchar(255) DEFAULT NULL COMMENT '课程专业链',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `SOURCE_PRICE` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程原价格（只显示）',
  `CURRENT_PRICE` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程销售价格（实际支付价格）设置为0则可免费观看',
  `TITLE` varchar(200) NOT NULL DEFAULT '' COMMENT '课程简介',
  `CONTEXT` longtext NOT NULL COMMENT '课程详情',
  `LESSION_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '总课时',
  `LOGO` varchar(200) NOT NULL DEFAULT '' COMMENT '图片路径',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '最后更新时间',
  `PAGE_BUYCOUNT` int(11) DEFAULT '0' COMMENT '销售数量',
  `PAGE_VIEWCOUNT` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `END_TIME` timestamp NULL DEFAULT NULL COMMENT '有效结束时间',
  `LOSETYPE` int(2) DEFAULT '0' COMMENT '有效期类型，0：到期时间，1：按天数',
  `LOSE_TIME` varchar(255) DEFAULT NULL COMMENT '有效期:商品订单过期时间点',
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course`
--

LOCK TABLES `edu_course` WRITE;
/*!40000 ALTER TABLE `edu_course` DISABLE KEYS */;
INSERT INTO `edu_course` VALUES (10,'零基础入门学习Python课程学习',1,221,',221,','2015-03-26 04:00:28','50.00','10.00','Python包含的内容很多，加上各种标准库、拓展库，乱花渐欲迷人眼','Python包含的内容很多，加上各种标准库、拓展库，乱花渐欲迷人眼。我一直希望写一个快速的、容易上手的Python教程，而且言语简洁，循序渐进，让没有背景的读者也可以从基础开始学习。我将在每一篇中专注于一个小的概念，希望在闲暇时可以很快读完。<br />\r\n<br />\r\n<br />\r\n小提醒<br />\r\n<br />\r\n    教程将专注于Python基础，语法基于Python 2.7 (我会提醒Python 3.x中有变化的地方，以方便读者适应3.X的情况)。测试环境为Linux。标准库的一些包不适用于Windows平台。如果文中的程序无法在你的平台上运行，欢迎讨论。<br />\r\n    我将专注于Python的主干，以便读者能以最快时间对Python形成概念。<br />\r\n    Linux命令行将以$开始，比如 $ls, $python<br />\r\n    Python命令行将以>>>开始，比如 >>>print \'Hello World!\'<br />\r\n    注释会以#开始<br />\r\n<br />\r\n<br />\r\n建议<br />\r\n<br />\r\n    将教程中的命令敲到Python中看看效果。<br />\r\n    看过教程之后，可以进行一些练习。<br />\r\n    参与文章评论区的讨论，可以更好的积累经验。<br />\r\n<br />\r\n<br />',10,'/images/upload/course/20150915/1442295455437.jpg','2015-09-15 17:37:40',80,110,'2016-12-29 13:00:00',0,''),(11,'影想力摄影小课堂',1,213,',210,213,','2015-03-30 03:58:40','88.00','38.00','摄影是一门技术，同样也是经验的积累。下面是无数摄影师的经验汇聚而成的十二条最经典、最实用的摄影技巧，将其熟记于心，将帮助你应对很多难以掌控的拍摄场景 ','<ol class=\"exp-conent-orderlist\">\r\n	<li class=\"exp-content-list list-item-1\">\r\n		<div class=\"content-list-text\">\r\n			1.\r\n阳光十六法则 (Sunny 16 \r\nRule)“阳光十六法则”是在没有测光表时，正确估算日光下曝光数值的方法，所以这条法则只有在阳光充足的情况下适合使用。将光圈设为F/16，快门与\r\nISO同步，或者略快。如，ISO设为100时，快门应该设为1/100秒(1/125秒)。所以，根据这个法则，在海滩上摄影时，应该使用F/22光\r\n圈，在多云时应使用F/11光圈。<br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=1\" target=\"_self\"><br />\r\n<span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-2\">\r\n		<div style=\"visibility:visible;\" class=\"list-icon\">\r\n			2\r\n		</div>\r\n		<div class=\"content-list-text\">\r\n			2.月光11、8和5.6法则 (Moony 11,8and 5.6 Rules)如果你想拍摄月亮，那么这里有一条很好的法则。快门与ISO同步的时候，拍摄满月用F11光圈，弦月的时候用F8光圈，新月则使用F5.6光圈。<br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=2\" target=\"_self\"><br />\r\n<span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-3\">\r\n		<div style=\"visibility:visible;\" class=\"list-icon\">\r\n			3\r\n		</div>\r\n		<div class=\"content-list-text\">\r\n			3.相机抖动法则 (Camera Shake Rule)<br />\r\n当你手持相机拍摄时，快门的速度不能小于镜头焦距的倒数。如果快门速度越慢，那么拍摄抖动时就越可能降低锐度。如果用50mm焦距的话，快门就要达到1/60秒以上为宜，只有当环境实在昏暗时，用闪光灯、脚架或者把相机放在硬物上防止抖动。<br />\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-4\">\r\n		<div class=\"content-list-text\">\r\n			4.灰板法则 (Anatomical Gray Card)<br />\r\n18%中灰版<br />\r\n随身携带18%中灰板是拍摄的利器。可是如果身上没有灰度板怎么办呢?可以将手掌摊开面向阳光，对手掌进行测光，然后加一档曝光。<br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=3\" target=\"_self\"><br />\r\n<span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-5\">\r\n		<div class=\"content-list-text\">\r\n			5.景深法则 (Depth of Field Rules)<br />\r\n后景深是前景深的2倍<br />\r\n当被摄物体比较深的时候，应该对焦点选择在景深的前1/3处，因为这样，对焦点后的景深是之前的2倍。各种光圈和焦段组合都可以使用这个法则。记住，光圈越小，焦距越短，距离被摄物体越远，景深就越大。\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-6\">\r\n		<div class=\"content-list-text\">\r\n			<br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=4\" target=\"_self\"><br />\r\n<span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-7\">\r\n		<div class=\"content-list-text\">\r\n			6.数码冲印尺寸法则 (Largest Digital Print Rule)<br />\r\n如果你想把你的作品打印成大尺寸的照片时，照片的尺寸不能大于数码图片的长宽像素各除以200，如果你对作品要求很高，那么至少得除以250。<br />\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-8\">\r\n		<div class=\"content-list-text\">\r\n			7.曝光法则 (Exposure Rules)<br />\r\n在处理数码照片时，最普遍的法则是保证高光区曝光准确，低光区随他去。可是当处理负片，特别是彩色负片的时候，你最好增曝一档。<br />\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-9\">\r\n		<div class=\"content-list-text\">\r\n			8.快速闪光输出法则 (Quick Flash-fill Rule)<br />\r\n当你的相机不能自动输出控制的闪光灯时，将闪光灯的感光度设为胶卷的二倍。如果对主体测光，机身选择光圈整档，闪光灯设为同样的光圈。这样，照片的阴影区会比主体的亮度低一档。\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-10\">\r\n		<div class=\"content-list-text\">\r\n			9.闪光距离法则 (Flash Range Rule)<br />\r\n这个法则很简单：距离乘以2，感光度乘以4。例如，你的闪光灯在ISO100时，有效距离为20米。如果你想使闪光灯的距离达到40米时，则需要提高感光度到ISO400。<br />\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-11\">\r\n		<div class=\"content-list-text\">\r\n			10.像素翻倍法则 (Megapixel Multiplier Rule)<br />\r\n如果你想使数码相机的分辨率增倍，那么很简单，就是要像素翻两番。<br />\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-12\">\r\n		<div class=\"content-list-text\">\r\n			11.\r\n捕捉动态法则 (Action-stopping \r\nRule)这条法则是根据角度与速度的经验公式而来的。如果物体沿着镜头的轴线运动你能够用1/125的快门捕捉下，那么它追至于镜头轴线的运动能用1\r\n/500秒捕捉下来。也就是说，如果物体沿镜头轴线称45度运动，只需要1/250的快门速度。 <br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=5\" target=\"_self\"><br />\r\n<span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n	<li class=\"exp-content-list list-item-13\">\r\n		<div class=\"content-list-text\">\r\n			12.日落法则 (Sunset Rule)<br />\r\n拍摄落日时，要对落日上部测光，但是不能让太阳出现在你的取景器中。如果想让日落看上去比实际晚一小时，可以在曝光补偿中减1。<br />\r\n		</div>\r\n		<div class=\"content-list-media\">\r\n			<div class=\"content-list-image clearfix\">\r\n				<br />\r\n<a class=\"exp-image-wraper\" href=\"http://jingyan.baidu.com/album/454316abbd9954f7a7c03ad8.html?picindex=6\" target=\"_self\"><span class=\"exp-album-enter-mask\"></span></a> \r\n			</div>\r\n		</div>\r\n	</li>\r\n</ol>',9,'/images/upload/course/20150915/1442295472860.jpg','2015-09-15 17:37:55',12,30,NULL,1,'30'),(12,'数学给宝宝带来的兴趣',1,218,',208,218,','2015-03-30 23:54:43','123.00','98.00','随着我国幼儿教育课程改革的不断深入，幼教工作者对幼儿园数学教育活动的研究也越来越深化。数学能力将制约一个人的发展潜力。','游戏在<span style=\"width:auto;height:auto;float:none;\" id=\"1_nwp\"><a style=\"text-decoration:none;\" target=\"_blank\" href=\"http://cpro.baidu.com/cpro/ui/uijs.php?adclass=0&app_id=0&c=news&cf=1001&ch=0&di=128&fv=11&is_app=0&jk=c0a6c5bfffad0b2&k=%CA%FD%D1%A7%BD%CC%D3%FD&k0=%CA%FD%D1%A7%BD%CC%D3%FD&kdi0=0&luki=5&n=10&p=baidu&q=00046150_cpr&rb=0&rs=1&seller_id=1&sid=b2d0faff5b6c0a0c&ssp2=1&stid=0&t=tpclicked3_hc&td=2113080&tu=u2113080&u=http%3A%2F%2Fwww%2Ejy135%2Ecom%2Fhtml%2Ftesekecheng%2Fzhuxinsuan%2F2010%2F0124%2F24729%2Ehtml&urlid=0\" id=\"1_nwl\"><span style=\"color:#0000ff;font-size:14px;width:auto;height:auto;float:none;\">数学教育</span></a></span>中起着重要的作用，因为幼儿天生就有好奇心，驱使他们去注视、观察、摆弄、发现、探索、了解，去发现、找寻学习的乐趣。把抽象的数学知识与生动活泼的游戏紧密结合起来，能够使幼儿自发地<span style=\"width:auto;height:auto;float:none;\" id=\"2_nwp\"><a style=\"text-decoration:none;\" target=\"_blank\" href=\"http://cpro.baidu.com/cpro/ui/uijs.php?adclass=0&app_id=0&c=news&cf=1001&ch=0&di=128&fv=11&is_app=0&jk=c0a6c5bfffad0b2&k=%D3%A6%D3%C3%CA%FD%D1%A7&k0=%D3%A6%D3%C3%CA%FD%D1%A7&kdi0=0&luki=3&n=10&p=baidu&q=00046150_cpr&rb=0&rs=1&seller_id=1&sid=b2d0faff5b6c0a0c&ssp2=1&stid=0&t=tpclicked3_hc&td=2113080&tu=u2113080&u=http%3A%2F%2Fwww%2Ejy135%2Ecom%2Fhtml%2Ftesekecheng%2Fzhuxinsuan%2F2010%2F0124%2F24729%2Ehtml&urlid=0\" id=\"2_nwl\"><span style=\"color:#0000ff;font-size:14px;width:auto;height:auto;float:none;\">应用数学</span></a></span>，获得有益的经验。所以生动、形象、有趣的游戏，可以使幼儿投入到引人入胜的集体活动中去。在轻松、愉快的环境中获得知识。',10,'/images/upload/course/20150915/1442302831779.jpg','2015-09-15 19:40:34',120,256,NULL,1,'80'),(13,'国家教师资格考试专用',1,217,',208,217,','2015-03-30 23:57:13','30.00','18.00','在全面研究国家教师资格考试中学科目二的真题内容的基础上，全面总结命题规律，统计分析了教师资格教育知识与能力（中学）试题所包含的考点，最终确定了本书知识体系、结构框架以及核心内容。','教育基础知识和基本原理、中学课程、中学教学、中学生学习心理、中学生发展心理、中学生心理辅导、中学德育、中学班级管理与教师心理八个模块内容，从最基\r\n本、最重要的考点入手，深入浅出地讲解各个知识点，帮助读者巩固知识要点，查漏补缺，稳步提升。本书做到了理论与实践的完美结合，具有极强的前瞻性和预测\r\n性，帮助广大考生圆三尺讲台之梦。',6,'/images/upload/course/20150915/1442295506745.jpg','2015-09-15 17:38:31',10,20,'2015-11-12 05:00:00',0,''),(14,'XHTML CSS2 JS整站制作教程课程学习',1,221,',221,','2015-04-02 22:33:34','56.00','0.00','XHTML CSS2 JS整站制作教程课程学习','XHTML CSS2 JS整站制作教程课程学习',3,'/images/upload/course/20150915/1442295527931.jpg','2015-09-15 17:39:05',3,14,'2015-09-20 12:00:00',0,''),(15,'HTML5入门课程学习',1,251,',223,251,','2015-04-02 22:34:32','123.00','116.00','HTML5草案的前身名为Web Applications 1.0。於2004年被WHATWG提出，於2007年被W3C接纳，并成立了新的HTML工作团队。在2008年1月22日，第一份正式草案已公布,预计将在2010年9月正式向公众推荐。WHATWG表示该规范是目前正在进行的工作，仍须多年的努力。','HTML5 吸取了 XHTML 2 一些建议，包括一些用来改善文档结构的功能，比如，新的 HTML 标签 header, footer, dialog, aside, figure 等的使用，将使内容创作者更加语义地创建文档，之前的开发者在这些场合是一律使用 div 的。  <br />\r\n  HTML5 还包含了一些将内容和展示分离的努力，开发者们也许会惊讶，b 和 i 标签依然存在，但它们的意义已经和之前有所不同，这些标签的意义只是为了将一段文字标识出来，而不是为了为它们设置粗体或斜体式样。u，font，center，strike 这些标签则被完全去掉了。  <br />\r\n  新标准适用了一些全新的表单输入对象，包括日期，URL，Email 地址，其它的对象则增加了对非拉丁字符的支持。HTML5 还引入了微数据，一种使用机器可以识别的标签标注内容的方法，使语义 Web 的处理更为简单。总的来说，这些与结构有关的改进使内容创建者可以创建更干净，更容易管理的网页，这样的网页对搜索引擎，对读屏软件等更为友好。',23,'/images/upload/course/20150915/1442295556203.jpg','2015-09-15 17:39:18',0,23,'2016-05-30 12:00:00',0,''),(16,'20世纪西方音乐',1,203,',202,203,','2015-04-02 22:35:34','5.00','0.01','《20世纪西方音乐》为分1945年以前、1945年以后两个部分，共有十六讲包括表现主义音乐、新古典主义音乐、民族主义音乐、序列音乐等不同的音乐类型。','《20世纪西方音乐》这本教材与1991年由人民音乐出版社出版的《西方现代音乐概述》内容基本相似，进行了一定能够的整理和修改；而《西方现代音乐概\r\n述》是从1981年起我在中央音乐学院开设的一门课程的讲稿基础上整理而成的。《20世纪西方音乐》是西方音乐通史中的最后一个部分，主要涉及印象派以后\r\n的西方各种不同流派和风格的音乐。',2,'/images/upload/course/20150915/1442295379715.jpg','2015-09-15 17:36:23',3,34,'2016-04-29 12:00:00',0,''),(17,'MySql从入门到精通',1,223,',223,','2015-04-03 01:13:58','3.00','0.01','《MySQL数据库应用从入门到精通》中的每个技术点都配备了与此相对应的实例，旨在帮助MySQL数据库初学者快速入门，同时也适合MysQL数据库管理员和想全面学习MysQL数据库技术以提升应用水平的人员使用。','<div class=\"para\">\r\n	最适合的往往是最实用的，就像我们要讲述的MysQL一样，它的功能不是最全的，架构也不是最完善的。但是其体积小、速度快、总体拥有成本低，尤其是它具备开放源码的优势，迅速成为中小型企业和网站的首选数据库。\r\n</div>\r\n<div class=\"para\">\r\n	崔洋等编著的《MySQL数据库应用从入门到精通》共分为3篇。其中第一篇为<a target=\"_blank\" href=\"http://baike.baidu.com/subview/673475/673475.htm\">MySQL数据库</a>基础篇，内容包括数据库所涉及的基本概念、<a target=\"_blank\" href=\"http://baike.baidu.com/subview/673475/673475.htm\">MysQL数据库</a>的安装与配置。第二篇为MysQL数据库操作和应用篇，内容包括操作<a target=\"_blank\" href=\"http://baike.baidu.com/subview/50913/50913.htm\">数据库对象</a>、操作表对象、操作索引对象、操作视图对象、操作触发器对象和操作数据。第三篇为MySOL数据库管理篇，内容包括MysQL数据库的用户管理和权限管理、MysQL数据库的日志管理、MysQL数据库的性能优化和PowerDesigller数据库设计软件。\r\n</div>',100,'/images/upload/course/20150915/1442295570359.jpg','2015-09-15 17:39:32',34,125,'2015-10-30 12:00:00',0,''),(18,'Java精品课程',1,202,',202,','2015-04-03 01:28:46','600.00','480.00','Java是一种简单的，面象对象的、分布式的、解释的、健壮的、结构中立的、可移植的、性能优异的多线程的动态语言。 ','Java的发展历史，可追溯到1990年。当时Sun Microsystem公司为了发展消费性电子产品而进行了一个名为Green的项目计划。该计划\r\n负责人是James Gosling。起初他以C++来写一种内嵌式软件，可以放在烤面包机或PAD等小型电子消费设备里，使得机器更聪明，具有人工智\r\n能。但他发现C++并不适合完成这类任务！因为C++常会有使系统失效的程序错误，尤其是内存管理，需要程序设计师记录并管理内存资源。这给设计师们造成\r\n极大的负担，并可能产生许多bugs。 <br />\r\n为了解决所遇到的问题，Gosling决定要发展一种新的语言，来解决C++的潜在性危险问题，这个语言名叫Oak。Oak是一种可移植性语言，也就是一种平台独立语言，能够在各种芯片上运行。<br />\r\n1994年，Oak技术日趋成熟，这时网络正开始蓬勃发展。Oak研发小组发现Oak很适合作为一种网络程序语言。因此发展了一个能与Oak配合的浏\r\n览器--WebRunner，后更名为HotJava，它证明了Oak是一种能在网络上发展的程序语言。由于Oak商标已被注册，工程师们便想到以自己常\r\n享用的咖啡(Java)来重新命名，并于Sun World 95中被发表出来。',20,'/images/upload/course/20150915/1442295581911.jpg','2015-09-15 17:39:43',150,500,'2016-01-30 13:00:00',0,''),(19,'听力口语',1,204,',202,204,','2015-04-03 02:00:01','1630.00','1000.00','四大优势超越期待','<div class=\"body_content_part1_user_name\">\r\n	全球外教来你家\r\n</div>\r\n<div class=\"body_content_part1_user_job\">\r\n	专业英语任你学\r\n</div>\r\n<div class=\"body_content_part1_user_detail\">\r\n	为您甄选全球具有TESOL、TEFL等教育资格认证同时具有法律、商学、企管等等各种专业背景的资深外教。全球超过60个国家、80座城市的3000多位外籍顾问，带给您全球化语言学习环境。<br />\r\n<br />\r\n	<div class=\"body_content_part1_user_name\">\r\n		24小时随时上课\r\n	</div>\r\n	<div class=\"body_content_part1_user_job\">\r\n		灵活轻松无限制\r\n	</div>\r\n用担心堵车迟到，不用害怕高温暴雨，VIPABC为您节省更多时间。365天、24小时全年无休的授课安排，没有了时间和空间的限制，随时随地轻松学英语<br />\r\n<br />\r\n<br />\r\n	<div class=\"body_content_part1_user_name\">\r\n		专业团队护隐私\r\n	</div>\r\n	<div class=\"body_content_part1_user_job\">\r\n		躺着坐着不尴尬\r\n	</div>\r\n	<div class=\"body_content_part1_user_detail\">\r\n		专为教学设计的单向视频模式，保证了您的个人隐私。与外教自由互动的同时，让学习者无惧尴尬，大胆开口说英语。\r\n	</div>\r\n</div>',10,'/images/upload/course/20150915/1442295592705.jpg','2015-09-15 17:39:55',500,9632,NULL,1,'300'),(20,'C4D零基础',1,250,',224,250,','2015-04-13 09:38:12','180.00','108.00','C4D全称Cinema 4D，是3D的表现软件，以其高的运算速度和强大的渲染插件著称，适合完成大规模的阵列动画。近年来随着C4D越来越突出的表现，它在电影公司，电视包装领域受到了极高的重视。','<p>\r\n	1.零基础轻松直达C4D中级水平，轻松学会3D；\r\n</p>\r\n<p>\r\n	2.由专业的影视传媒集团的资深从业者授课,简单轻松学会；\r\n</p>\r\n<p>\r\n	3.引用了大量耳熟能详的成功实战案例；\r\n</p>\r\n<p>\r\n	4.有专业人士对学员进行实战式培养；\r\n</p>\r\n<p>\r\n	5.丰富的练习素材分享，练习无忧；\r\n</p>\r\n<p>\r\n	6.名师答疑，为你解开困惑，提供建议；\r\n</p>',6,'/images/upload/course/20150915/1442295604295.jpg','2015-09-15 17:40:07',10,300,'2015-10-01 01:41:02',0,''),(21,'搜索引擎优化技术',1,221,',221,','2015-09-15 15:38:57','123.00','88.00','学完候学生可以运用seo策略和技术，独立操作网站seo优化，包括前期网站诊断，网站数据分析，网站优化，项目实操，订单转化，团队管理，方案撰写等主流公司需要的工作技能.','<img src=\"http://p.qpic.cn/qqke_course_info/ajNVdqHZLLB55Mfcl4iaibJ5fzbYwsWFJNTofxUPDPbd8LOsz5YzyJqwib5A3QsKOK7eXgzv7d2MAU/\" height=\"250\" width=\"850\" /><img src=\"http://p.qpic.cn/qqke_course_info/ajNVdqHZLLDw26rXTymgicZmyEBUS5Hib3wmIfVFNiaIYzhhqkxcVTZ6aN3yXIeENCd7rtxaUlMaMM/\" height=\"344\" width=\"850\" /><img src=\"http://p.qpic.cn/qqke_course_info/ajNVdqHZLLDBBDm1tRSibKKW1l7m9xzRnTFXicwMHnHmpdXNFfZAoWBOH929pc9lnUwchKYnibldJ4/\" height=\"466\" width=\"850\" />',23,'/images/upload/course/20150915/1442302852837.jpg','2015-09-15 19:40:54',23,123,NULL,1,'60');
/*!40000 ALTER TABLE `edu_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_favorites`
--

DROP TABLE IF EXISTS `edu_course_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_favorites` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_favorites`
--

LOCK TABLES `edu_course_favorites` WRITE;
/*!40000 ALTER TABLE `edu_course_favorites` DISABLE KEYS */;
INSERT INTO `edu_course_favorites` VALUES (1,10,2,'2015-04-07 06:43:45'),(2,13,2,'2015-04-07 06:45:00'),(3,12,2,'2015-04-07 06:45:05'),(5,14,2,'2015-04-08 22:29:37'),(6,15,2,'2015-04-08 22:29:43'),(7,16,2,'2015-04-08 22:39:41'),(8,17,2,'2015-04-08 22:39:48'),(9,18,2,'2015-04-08 22:39:53'),(11,10,13,'2015-04-13 09:49:29'),(12,12,23,'2015-04-13 11:44:47'),(13,12,13,'2015-04-13 11:49:51'),(14,16,13,'2015-04-13 11:50:15'),(15,17,13,'2015-04-13 12:22:11'),(21,12,7,'2015-08-29 15:22:43'),(22,10,7,'2015-08-29 15:24:15'),(23,19,7,'2015-09-01 22:08:13'),(24,14,7,'2015-09-06 19:54:34'),(25,10,11,'2015-09-10 13:50:56'),(26,21,7,'2015-09-16 21:21:04'),(27,16,7,'2015-09-16 21:21:47');
/*!40000 ALTER TABLE `edu_course_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_kpoint`
--

DROP TABLE IF EXISTS `edu_course_kpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_kpoint` (
  `KPOINT_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `NAME` varchar(300) DEFAULT NULL COMMENT '节点名称',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '父级ID',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  `SORT` int(11) DEFAULT '0' COMMENT '显示排序',
  `PLAY_COUNT` int(11) DEFAULT '0' COMMENT '播放次数',
  `IS_FREE` tinyint(1) DEFAULT '0' COMMENT '是否可以试听1免费2收费',
  `VIDEO_URL` varchar(500) DEFAULT NULL COMMENT '视频地址',
  `TEACHER_ID` int(11) DEFAULT '0' COMMENT '讲师id',
  `play_time` varchar(100) DEFAULT '' COMMENT '播放时间',
  `KPOINT_TYPE` int(1) DEFAULT '0' COMMENT '节点类型 0文件目录 1视频',
  `VIDEO_TYPE` varchar(30) DEFAULT NULL COMMENT '视频类型',
  PRIMARY KEY (`KPOINT_ID`),
  KEY `course_id` (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='知识点的基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_kpoint`
--

LOCK TABLES `edu_course_kpoint` WRITE;
/*!40000 ALTER TABLE `edu_course_kpoint` DISABLE KEYS */;
INSERT INTO `edu_course_kpoint` VALUES (1,10,'第一章',0,'2015-03-31 17:17:11',10,520,2,NULL,74,'',0,'IFRAME'),(2,10,'第二节',1,'2015-03-31 17:21:06',12,11,2,'http://player.youku.com/embed/XOTYxNTY4NjI0',73,'11:20',1,'IFRAME'),(3,10,'第二章',0,'2015-04-01 10:11:59',9,0,1,NULL,74,'',0,'IFRAME'),(4,10,'第一节',3,'2015-04-01 10:12:02',0,0,2,'http://player.youku.com/embed/XMTMzODEyOTEzNg==',74,'33:00',1,'IFRAME'),(5,10,'第一节',1,'2015-04-01 10:12:03',30,0,1,'http://player.youku.com/embed/XMTM0Mjk4MDAxMg==',76,'01:20',1,'IFRAME'),(13,19,'第一章节：首先教学搭建开发环境',0,'2015-04-13 21:31:16',0,0,1,NULL,83,'',0,'IFRAME'),(14,20,'新创建视频',0,'2015-04-13 21:38:28',0,0,1,NULL,83,'',0,'IFRAME'),(15,14,'第一章',0,'2015-05-12 15:45:45',0,0,1,'',74,'',0,'IFRAME'),(16,14,'XHTML CSS2 JS整站制作教程课1',15,'2015-05-12 15:46:14',0,0,1,'http://player.youku.com/embed/XNzE0MjAwMjMy',78,'',1,'IFRAME'),(17,19,'第一课时：输入与输出和用户交互',13,'2015-09-01 17:10:19',0,0,1,'http://player.youku.com/embed/XODgyNDU4MjAw',82,'',1,'IFRAME'),(18,19,'第二课时：输入出和用户交互',13,'2015-09-01 17:10:55',0,0,2,'http://player.youku.com/embed/XMTMwODc3ODM4NA==',75,'',1,'IFRAME'),(19,19,'第二章节：首先教学搭建开发环境',0,'2015-09-01 17:21:12',0,0,1,NULL,73,'',0,'IFRAME'),(20,19,'第一课时',19,'2015-09-01 17:21:47',0,0,2,'http://player.youku.com/embed/XOTU2NDEzMDYw',78,'',1,'IFRAME'),(32,14,'第二章',0,'2015-09-10 11:33:58',0,0,1,NULL,82,'',0,'IFRAME'),(33,14,'XHTML CSS2 JS 第二章 一节',32,'2015-09-10 11:34:19',0,0,1,'http://player.youku.com/embed/XNDMxNjU5NDM2',80,'',1,'IFRAME'),(34,14,'XHTML CSS2 JS整站制作教程课2',15,'2015-09-10 11:37:49',0,0,1,'http://player.youku.com/embed/XMTMzODEyOTEzNg==',77,'',1,'IFRAME'),(35,16,'第一章',0,'2015-09-10 11:40:32',0,0,1,NULL,74,'',0,'IFRAME'),(36,16,'第二章',0,'2015-09-10 11:40:48',0,0,1,NULL,75,'',0,'IFRAME'),(37,16,'第一节',35,'2015-09-10 11:41:05',0,0,1,'http://player.youku.com/embed/XMTM0Mjk4MDAxMg==',76,'',1,'IFRAME'),(38,16,'第一节',36,'2015-09-10 11:41:44',0,0,2,'http://player.youku.com/embed/XNzE0MjAwMjMy',82,'',1,'IFRAME'),(39,16,'第二节',35,'2015-09-10 11:43:02',0,0,2,'http://player.youku.com/embed/XODgyNDU4MjAw',78,'',1,'IFRAME'),(40,17,'第一章',0,'2015-09-10 13:35:14',0,0,1,NULL,75,'',0,'IFRAME'),(41,17,'第一节',40,'2015-09-10 13:35:41',0,0,2,'http://player.youku.com/embed/XMTMwODc3ODM4NA==',78,'',1,'IFRAME'),(44,10,'主讲课程',0,'2015-09-19 09:18:19',12,0,1,'http://player.youku.com/embed/XOTU2NDEzMDYw',73,'45:23',1,'IFRAME'),(48,10,'第三章',0,'2015-09-19 10:21:43',8,0,1,NULL,83,'',0,'IFRAME');
/*!40000 ALTER TABLE `edu_course_kpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_note`
--

DROP TABLE IF EXISTS `edu_course_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_note` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `COURSE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `KPOINT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '节点ID',
  `CONTENT` longtext NOT NULL COMMENT '笔记信息',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `STATUS` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0公开1隐藏',
  PRIMARY KEY (`ID`),
  KEY `CUS_ID` (`KPOINT_ID`),
  KEY `POINT_ID` (`COURSE_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='笔记信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_note`
--

LOCK TABLES `edu_course_note` WRITE;
/*!40000 ALTER TABLE `edu_course_note` DISABLE KEYS */;
INSERT INTO `edu_course_note` VALUES (1,7,19,17,'我诶哦去我i饿哦那哦哦i哦<img class=\"vam\" alt=\"\" src=\"http://192.168.110.60:8080/kindeditor/plugins/emoticons/images/33.gif\" border=\"0\" />','2015-09-08 14:24:44',0),(2,7,19,18,'<img class=\"vam\" src=\"http://127.0.0.1:8080/kindeditor/plugins/emoticons/images/33.gif\" alt=\"\" border=\"0\" />啦啦啦啦啦','2015-09-07 18:55:45',0),(3,7,10,5,'<img class=\"vam\" src=\"http://127.0.0.1:8080/kindeditor/plugins/emoticons/images/79.gif\" alt=\"\" border=\"0\" />赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞<br />','2015-09-10 22:03:49',0);
/*!40000 ALTER TABLE `edu_course_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_studyhistory`
--

DROP TABLE IF EXISTS `edu_course_studyhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_studyhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户id',
  `COURSE_ID` int(11) NOT NULL COMMENT '课程id',
  `KPOINT_ID` int(11) NOT NULL COMMENT '节点id',
  `PLAYERCOUNT` int(11) NOT NULL DEFAULT '0' COMMENT '观看次数,累加',
  `COURSE_NAME` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `KPOINT_NAME` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `DATABACK` text COMMENT 'playercount小于20时记录,备注观看的时间，叠加',
  `UPDATE_TIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后观看时间',
  PRIMARY KEY (`ID`),
  KEY `user_course_id` (`USER_ID`,`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='课程播放记录(学习记录)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_studyhistory`
--

LOCK TABLES `edu_course_studyhistory` WRITE;
/*!40000 ALTER TABLE `edu_course_studyhistory` DISABLE KEYS */;
INSERT INTO `edu_course_studyhistory` VALUES (1,7,19,17,43,'听力口语','第一课时：输入与输出和用户交互','2015-09-08 06:11:56,2015-09-08 06:10:23,2015-09-08 05:35:42,2015-09-08 05:33:20,2015-09-08 03:20:59,2015-09-08 03:18:42,2015-09-08 02:22:56,2015-09-07 07:10:08,2015-09-07 07:09:10,2015-09-07 07:08:14,2015-09-07 07:00:17,2015-09-07 06:57:51,2015-09-07 06:57:12,2015-09-07 06:57:05,2015-09-07 06:56:24,2015-09-07 06:56:17,2015-09-07 06:55:40,2015-09-07 06:54:26,2015-09-07 06:52:53,2015-09-07 06:52:08,2015-09-07 06:47:17,2015-09-07 06:46:44,2015-09-07 06:42:31,2015-09-07 06:40:39,2015-09-07 06:38:23,','2015-09-08 14:11:56'),(2,7,19,18,4,'听力口语','第二课时：输入出和用户交互','2015-09-07 06:56:20,2015-09-07 06:55:44,2015-09-07 06:54:36,2015-09-06 02:55:27,','2015-09-07 14:56:20'),(3,7,10,5,100,'零基础入门学习Python课程学习','第一节','2015-10-14 06:42:28,2015-10-14 06:42:14,2015-10-14 03:50:54,2015-09-29 01:34:58,2015-09-29 01:34:00,2015-09-29 01:32:53,2015-09-29 01:32:43,2015-09-28 06:31:56,2015-09-28 06:30:58,2015-09-28 06:30:13,2015-09-28 06:26:02,2015-09-19 09:45:35,2015-09-19 09:43:10,2015-09-19 09:43:08,2015-09-19 09:43:02,2015-09-19 09:32:05,2015-09-19 09:28:32,2015-09-19 09:27:16,2015-09-19 09:27:12,2015-09-19 09:27:08,2015-09-19 09:26:28,2015-09-19 09:25:58,2015-09-19 05:40:40,2015-09-19 05:40:06,2015-09-19 05:39:55,','2015-10-14 14:42:28'),(4,7,14,16,6,'XHTML CSS2 JS整站制作教程课程学习','有种你爱我','2015-09-08 09:35:18,2015-09-08 09:34:34,2015-09-08 09:34:01,2015-09-08 09:32:56,2015-09-08 09:32:07,2015-09-08 09:31:46,','2015-09-08 17:35:18'),(5,7,10,2,33,'零基础入门学习Python课程学习','第二节','2015-10-14 07:06:24,2015-10-14 06:42:16,2015-10-14 03:50:56,2015-09-29 01:34:59,2015-09-29 01:34:01,2015-09-29 01:32:54,2015-09-29 01:32:51,2015-09-28 06:31:58,2015-09-28 06:31:00,2015-09-28 06:30:15,2015-09-28 06:26:41,2015-09-19 09:45:36,2015-09-19 09:43:09,2015-09-19 09:43:03,2015-09-19 09:32:07,2015-09-19 09:28:33,2015-09-19 09:27:16,2015-09-19 09:27:13,2015-09-19 09:27:09,2015-09-19 09:26:29,2015-09-19 09:26:17,2015-09-19 05:40:04,2015-09-18 08:34:03,2015-09-10 10:03:07,2015-09-10 08:12:59,','2015-10-14 15:06:24'),(6,10,10,5,1,'零基础入门学习Python课程学习','少年时代','2015-09-09 20:30:57,','2015-09-09 16:30:57'),(7,6,14,16,2,'XHTML CSS2 JS整站制作教程课程学习','XHTML CSS2 JS整站制作教程课1','2015-09-24 02:26:54,2015-09-10 03:39:11,','2015-09-24 10:26:54'),(8,6,14,34,2,'XHTML CSS2 JS整站制作教程课程学习','XHTML CSS2 JS整站制作教程课2','2015-09-10 03:39:24,2015-09-10 03:39:17,','2015-09-10 11:39:24'),(9,6,14,33,1,'XHTML CSS2 JS整站制作教程课程学习','XHTML CSS2 JS 第二章 一节','2015-09-10 03:39:21,','2015-09-10 11:39:21'),(10,7,10,4,20,'零基础入门学习Python课程学习','第一节','2015-10-14 07:06:30,2015-10-14 06:42:26,2015-10-14 06:42:22,2015-10-14 03:51:35,2015-10-14 03:51:01,2015-09-29 01:35:01,2015-09-29 01:32:57,2015-09-28 06:32:15,2015-09-28 06:31:02,2015-09-28 06:28:33,2015-09-28 06:28:10,2015-09-28 06:27:25,2015-09-19 09:27:18,2015-09-18 08:34:13,2015-09-10 08:12:54,2015-09-10 08:12:47,2015-09-10 08:11:07,2015-09-10 08:10:16,2015-09-10 08:08:20,2015-09-10 08:06:53,','2015-10-14 15:06:30'),(11,7,10,44,75,'零基础入门学习Python课程学习','主讲课程','2015-10-14 07:06:22,2015-10-14 06:42:31,2015-10-14 06:42:09,2015-10-14 04:35:31,2015-10-14 04:35:08,2015-10-14 04:04:28,2015-10-14 04:04:26,2015-10-14 03:55:44,2015-10-14 03:54:31,2015-10-14 03:52:46,2015-10-14 03:52:08,2015-10-14 03:52:03,2015-10-14 03:51:42,2015-10-14 03:51:39,2015-10-14 03:51:38,2015-10-14 03:50:52,2015-10-14 03:50:47,2015-10-14 03:48:20,2015-10-14 03:35:32,2015-10-14 03:35:31,2015-09-29 01:35:03,2015-09-29 01:34:53,2015-09-29 01:34:20,2015-09-29 01:33:58,2015-09-29 01:32:52,','2015-10-14 15:06:22'),(12,7,10,54,4,'零基础入门学习Python课程学习','乐视云视频','2015-09-29 01:35:17,2015-09-28 10:24:11,2015-09-19 09:13:58,2015-09-19 05:40:45,','2015-09-29 09:35:17'),(13,7,10,49,2,'零基础入门学习Python课程学习','新创建视频1','2015-10-14 03:51:07,2015-10-14 03:51:03,','2015-10-14 11:51:07'),(14,7,10,53,1,'零基础入门学习Python课程学习','新创建视频2','2015-10-14 03:51:04,','2015-10-14 11:51:04');
/*!40000 ALTER TABLE `edu_course_studyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_subject`
--

DROP TABLE IF EXISTS `edu_course_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_subject` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `SUBJECT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `course_subject` (`COURSE_ID`,`SUBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_subject`
--

LOCK TABLES `edu_course_subject` WRITE;
/*!40000 ALTER TABLE `edu_course_subject` DISABLE KEYS */;
INSERT INTO `edu_course_subject` VALUES (13,4,222),(14,5,209),(15,6,209),(16,3,206),(17,7,210),(18,8,217);
/*!40000 ALTER TABLE `edu_course_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_course_teacher`
--

DROP TABLE IF EXISTS `edu_course_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_course_teacher` (
  `COURSE_ID` int(11) DEFAULT NULL COMMENT '课程id',
  `TEACHER_ID` int(11) DEFAULT NULL COMMENT '讲师id',
  KEY `course_id` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程讲师关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_course_teacher`
--

LOCK TABLES `edu_course_teacher` WRITE;
/*!40000 ALTER TABLE `edu_course_teacher` DISABLE KEYS */;
INSERT INTO `edu_course_teacher` VALUES (16,75),(16,74),(16,73),(10,74),(10,73),(11,75),(11,74),(11,73),(13,75),(13,74),(13,73),(14,75),(14,73),(15,74),(17,74),(18,74),(19,75),(19,74),(19,73),(20,83),(12,73),(21,74);
/*!40000 ALTER TABLE `edu_course_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_msg_receive`
--

DROP TABLE IF EXISTS `edu_msg_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_msg_receive` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `CUS_ID` int(11) DEFAULT '0' COMMENT '发信人用户id',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `CONTENT` text COMMENT '信内容',
  `TYPE` tinyint(3) DEFAULT '0' COMMENT '类型1系统通知2站内信',
  `STATUS` tinyint(3) DEFAULT '0' COMMENT '0未读1已读2接受3拒绝4黑名单',
  `RECEIVING_CUSID` int(11) DEFAULT '0' COMMENT '收信人id',
  `GROUP_ID` int(11) DEFAULT '0' COMMENT '申请加入群同意之后所需要的字段',
  `SHOWNAME` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名',
  PRIMARY KEY (`ID`),
  KEY `CUS_ID` (`CUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='站内信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_msg_receive`
--

LOCK TABLES `edu_msg_receive` WRITE;
/*!40000 ALTER TABLE `edu_msg_receive` DISABLE KEYS */;
INSERT INTO `edu_msg_receive` VALUES (1,'2015-08-31 14:07:56',0,'2015-08-31 14:07:56','欢迎...........',1,1,7,NULL,'朗诵'),(2,'2015-08-31 14:11:53',0,'2015-08-31 14:11:54','欢迎...........',1,1,7,NULL,'朗诵'),(3,'2015-08-31 14:13:34',0,'2015-08-31 14:13:34','欢迎...........',1,1,7,NULL,'朗诵'),(4,'2015-08-31 14:20:26',0,'2015-08-31 14:20:26','欢迎...........',1,1,7,NULL,'朗诵'),(5,'2015-08-31 14:26:40',0,'2015-08-31 14:26:40','欢迎...........',1,1,7,NULL,'朗诵'),(6,'2015-08-31 14:28:46',0,'2015-08-31 14:28:46','欢迎...........',1,1,7,NULL,'朗诵'),(7,'2015-08-31 14:30:57',0,'2015-08-31 14:30:57','欢迎...........',1,1,7,NULL,'朗诵'),(30,'2015-09-01 15:37:07',0,'2015-09-01 11:29:39','欢迎来到因酷教育网站<br />',1,1,7,NULL,'朗诵'),(31,'2015-09-01 15:46:01',0,'2015-09-01 15:46:01','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,1,NULL,''),(32,'2015-09-01 15:46:09',0,'2015-09-01 15:46:09','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,2,NULL,''),(33,'2015-09-01 15:46:13',0,'2015-09-01 15:46:13','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,3,NULL,'小少爷'),(34,'2015-09-01 15:46:18',0,'2015-09-01 15:46:18','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,4,NULL,''),(35,'2015-09-01 15:46:20',0,'2015-09-01 15:46:20','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,5,NULL,''),(36,'2015-09-01 15:46:23',0,'2015-09-01 15:46:23','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,6,NULL,'颦儿'),(37,'2015-09-01 15:46:25',0,'2015-09-02 15:44:13','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,1,7,NULL,'朗诵'),(38,'2015-09-01 15:46:26',0,'2015-09-01 15:46:26','欢迎来到因酷教育,希望你们能愉快的学习<br />',1,0,8,NULL,''),(39,'2015-09-01 15:50:36',0,'2015-09-02 15:44:13','<img class=\"vam\" src=\"http://127.0.0.1:8080/kindeditor/plugins/emoticons/images/13.gif\" alt=\"\" border=\"0\" />哈哈哈哈哈哈哈<br />',1,1,7,NULL,'朗诵'),(40,'2015-09-01 20:21:54',0,'2015-09-01 20:21:54','欢迎来到INXEDU 在线教育平台,希望您能够快乐的学习',1,0,9,NULL,''),(41,'2015-09-09 19:35:12',0,'2015-09-09 19:36:02','欢迎来到INXEDU 在线教育平台,希望您能够快乐的学习',1,1,10,NULL,''),(42,'2015-09-10 13:39:14',0,'2015-09-10 13:39:14','欢迎来到INXEDU 在线教育平台,希望您能够快乐的学习',1,0,11,NULL,''),(43,'2015-10-08 13:27:22',0,'2015-10-08 13:27:22','欢迎来到INXEDU 在线教育平台,希望您能够快乐的学习',1,0,12,NULL,'');
/*!40000 ALTER TABLE `edu_msg_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_msg_system`
--

DROP TABLE IF EXISTS `edu_msg_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_msg_system` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADD_TIME` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `CONTENT` text COMMENT '信内容',
  `STATUS` tinyint(3) DEFAULT '0' COMMENT '0正常1删除2过期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_msg_system`
--

LOCK TABLES `edu_msg_system` WRITE;
/*!40000 ALTER TABLE `edu_msg_system` DISABLE KEYS */;
INSERT INTO `edu_msg_system` VALUES (1,'2015-08-31 13:31:27','2015-08-31 13:31:26','欢迎...........',0);
/*!40000 ALTER TABLE `edu_msg_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_orders`
--

DROP TABLE IF EXISTS `edu_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_orders` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程ID',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `ORDER_NO` varchar(50) DEFAULT NULL COMMENT '订单号',
  `SUM_MONEY` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `STATES` varchar(10) DEFAULT NULL COMMENT '订单状态 SUCCESS已支付 INIT未支付  CANCEL已取消',
  `DESCRIBE` varchar(255) DEFAULT NULL COMMENT '订单购买内容简单描述',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `PAY_TIME` timestamp NULL DEFAULT NULL COMMENT '订单支付时间',
  `SYS_USER_ID` int(11) DEFAULT '0' COMMENT '审核用户ID',
  `EXPIRE_TIME` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '课程过期时间',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='课程订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_orders`
--

LOCK TABLES `edu_orders` WRITE;
/*!40000 ALTER TABLE `edu_orders` DISABLE KEYS */;
INSERT INTO `edu_orders` VALUES (1,19,7,'1437620157823-7','0.01','SUCCESS','购买《听力口语》课程','2015-07-23 10:55:57','2015-07-27 10:24:18',2,'0000-00-00 00:00:00'),(2,10,7,'1440810564636-7','0.01','INIT','购买《零基础入门学习Python课程学习》课程','2015-08-29 13:09:24',NULL,0,'2016-12-29 08:00:00'),(3,16,7,'1440810588717-7','0.01','CANCEL','购买《20世纪西方音乐》课程','2015-08-29 13:09:48',NULL,0,'0000-00-00 00:00:00'),(4,10,7,'1441071866098-7','0.01','SUCCESS','购买《零基础入门学习Python课程学习》课程','2015-09-01 13:44:26','2015-09-08 17:57:51',2,'2016-12-29 08:00:00'),(5,10,7,'1441097063936-7','0.01','SUCCESS','购买《零基础入门学习Python课程学习》课程','2015-09-01 20:44:23','2015-09-08 17:57:49',2,'2016-12-29 08:00:00'),(6,10,7,'1441606531792-7','0.01','SUCCESS','购买《零基础入门学习Python课程学习》课程','2015-09-07 18:15:31','2015-09-08 17:57:47',2,'2016-12-29 08:00:00'),(7,16,7,'1441678437807-7','0.01','SUCCESS','购买《20世纪西方音乐》课程','2015-09-08 14:13:57','2015-09-08 17:57:45',2,'2017-12-29 08:00:00'),(8,17,10,'1441828697744-10','0.01','INIT','购买《MySql从入门到精通》课程','2015-09-09 19:58:17',NULL,0,'0000-00-00 00:00:00'),(9,15,10,'1441829752143-10','0.01','INIT','购买《HTML5入门课程学习》课程','2015-09-09 20:15:52',NULL,0,'0000-00-00 00:00:00'),(10,18,10,'1441829866677-10','0.01','INIT','购买《Java精品课程》课程','2015-09-09 20:17:46',NULL,0,'0000-00-00 00:00:00'),(11,16,10,'1441830088136-10','0.01','INIT','购买《20世纪西方音乐》课程','2015-09-09 20:21:28',NULL,0,'0000-00-00 00:00:00'),(12,10,10,'1441830567357-10','0.01','SUCCESS','购买《零基础入门学习Python课程学习》课程','2015-09-09 20:29:27','2015-09-09 20:29:56',0,'2016-09-29 08:00:00'),(13,12,7,'1441787446855-7','0.01','INIT','购买《新创建课程》课程','2015-09-09 20:30:46',NULL,0,'0000-00-00 00:00:00'),(16,17,6,'14419517539406','0.01','SUCCESS','购买《MySql从入门到精通》课程','2015-09-11 18:09:13','2015-09-14 22:35:00',0,'2015-10-30 08:00:00'),(17,16,7,'14419547932327','0.01','INIT','购买《20世纪西方音乐》课程','2015-09-11 18:59:53',NULL,0,'2016-04-29 08:00:00'),(18,17,4,'14422000744324','0.01','INIT','购买《MySql从入门到精通》课程','2015-09-14 15:07:54',NULL,0,'2015-10-30 08:00:00'),(19,17,3,'14422094907713','0.01','INIT','购买《MySql从入门到精通》课程','2015-09-14 17:44:50',NULL,0,'2015-10-30 08:00:00'),(20,15,3,'14422096908333','116.00','INIT','购买《HTML5入门课程学习》课程','2015-09-14 17:48:10',NULL,0,'2016-05-30 08:00:00'),(21,20,3,'14422099080083','108.00','INIT','购买《C4D零基础》课程','2015-09-14 17:51:48',NULL,0,'2015-09-30 21:41:02'),(22,13,6,'14430632963236','18.00','INIT','购买《国家教师资格考试专用》课程','2015-09-24 14:54:56',NULL,0,'2015-11-12 00:00:00'),(23,15,6,'14430647497126','116.00','INIT','购买《HTML5入门课程学习》课程','2015-09-24 15:19:09',NULL,0,'2016-05-30 08:00:00'),(24,16,6,'14430785309956','0.01','INIT','购买《20世纪西方音乐》课程','2015-09-24 19:08:50',NULL,0,'2016-04-29 08:00:00');
/*!40000 ALTER TABLE `edu_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_praise`
--

DROP TABLE IF EXISTS `edu_praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_praise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户id',
  `TARGET_ID` int(11) DEFAULT NULL COMMENT '点赞的对象id',
  `TYPE` int(11) DEFAULT NULL COMMENT '点赞类型 1问答点赞 2问答评论点赞 3 文章点赞数4 评论点赞',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='所有的点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_praise`
--

LOCK TABLES `edu_praise` WRITE;
/*!40000 ALTER TABLE `edu_praise` DISABLE KEYS */;
INSERT INTO `edu_praise` VALUES (15,7,6,3,'2015-08-27 15:23:51'),(33,7,12,4,'2015-08-28 11:49:37'),(34,7,14,4,'2015-08-28 15:43:17'),(35,7,20,4,'2015-08-28 16:28:54'),(36,7,22,4,'2015-08-28 16:52:31'),(37,7,26,4,'2015-08-29 10:26:23'),(38,7,27,4,'2015-08-29 10:26:55'),(39,7,32,4,'2015-08-29 10:41:30'),(40,7,7,3,'2015-08-29 15:40:23'),(41,7,17,3,'2015-08-29 15:40:42'),(43,7,52,4,'2015-09-01 18:42:47'),(44,7,35,4,'2015-09-08 17:36:45'),(45,7,54,4,'2015-09-09 11:55:38'),(46,7,8,3,'2015-09-09 15:54:55'),(47,10,6,3,'2015-09-09 16:35:17'),(48,11,6,3,'2015-09-10 09:43:21'),(49,7,6,1,'2015-09-10 10:20:06'),(50,7,1,2,'2015-09-10 10:20:22'),(51,7,2,2,'2015-09-10 10:20:52'),(52,3,6,1,'2015-09-10 10:22:54'),(53,3,2,2,'2015-09-10 10:22:57'),(54,6,6,2,'2015-09-10 10:34:21'),(55,6,9,1,'2015-09-10 10:35:46'),(56,7,10,2,'2015-09-15 17:09:46'),(57,7,10,3,'2015-09-15 17:27:46'),(58,7,5,1,'2015-09-15 17:29:28'),(59,7,9,1,'2015-09-19 10:14:36'),(60,7,10,4,'2015-09-19 16:49:20'),(61,7,20,2,'2015-09-19 16:51:44'),(62,7,13,2,'2015-09-19 16:52:09'),(63,7,24,2,'2015-09-19 17:00:24'),(64,7,25,2,'2015-09-19 17:00:52'),(65,7,67,4,'2015-09-19 17:34:49'),(66,7,69,4,'2015-09-19 17:34:54'),(67,7,30,2,'2015-09-19 17:36:25'),(68,6,10,2,'2015-09-21 09:12:20'),(69,6,17,2,'2015-09-21 09:12:39'),(70,6,15,2,'2015-09-21 09:13:41'),(71,6,58,4,'2015-09-24 10:27:03'),(72,6,35,4,'2015-09-24 10:27:16'),(73,6,52,4,'2015-09-24 15:05:21'),(74,6,87,4,'2015-09-24 15:05:25'),(75,6,6,3,'2015-09-24 15:10:22'),(76,6,90,4,'2015-09-24 15:11:07'),(77,6,89,4,'2015-09-24 15:11:12'),(78,6,57,4,'2015-09-24 15:11:15'),(79,6,88,4,'2015-09-24 15:11:37'),(80,6,40,2,'2015-09-24 15:15:40'),(81,6,39,2,'2015-09-24 15:15:43');
/*!40000 ALTER TABLE `edu_praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_questions`
--

DROP TABLE IF EXISTS `edu_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CUS_ID` int(11) DEFAULT NULL COMMENT '创建人id',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '问答标题',
  `CONTENT` text COMMENT '问答内容',
  `TYPE` int(1) DEFAULT NULL COMMENT '分类 1课程问答 2 学习分享',
  `STATUS` int(1) DEFAULT '0' COMMENT '状态 0可回复1不可回复（采纳最佳答案后改为1 ）',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '问答回复数量',
  `BROWSE_COUNT` int(11) DEFAULT '0' COMMENT '问答浏览次数',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '问答点赞数量',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_questions`
--

LOCK TABLES `edu_questions` WRITE;
/*!40000 ALTER TABLE `edu_questions` DISABLE KEYS */;
INSERT INTO `edu_questions` VALUES (1,7,'视频在播放的时候视频会闪一下，但是视频无法正常播放。','视频在播放的时候视频会闪一下，但是视频无法正常播放。',1,0,0,5,0,'2015-09-10 10:04:58'),(2,7,'谁知道支付宝即时到账接口中的有卡就能付没有了怎么回事','谁知道支付宝即时到账接口中的有卡就能付没有了怎么回事',1,0,1,11,0,'2015-09-10 10:07:01'),(3,7,'jbpm5.4 执行TaskClient.start(taskId, userId, responseHandler);','公文提交的时候 抛出异常 ，提示当前用户不能执行start方法。具体异常如下：\n\norg.jbpm.task.service.PermissionDeniedException: User \'[User:\'admin\']\' was unable to execution operation \'Start\' on task id 2 due to a no \'current status\' match\n\n	at org.jbpm.task.service.TaskServiceSession.evalCommand(TaskServiceSession.java:300)\n\n	at org.jbpm.task.service.TaskServiceSession.taskOperation(TaskServiceSession.java:415)\n\n	at org.jbpm.task.service.TaskServerHandler.messageReceived(TaskServerHandler.java:92)\n\n	at org.jbpm.task.service.hornetq.HornetQTaskServerHandler.messageReceived(HornetQTaskServerHandler.java:44)\n\n	at org.jbpm.task.service.hornetq.BaseHornetQTaskServer.run(BaseHornetQTaskServer.java:85)\n\n	at java.lang.Thread.run(Thread.java:619)',1,0,0,2,0,'2015-09-10 10:08:14'),(4,7,'photoshop怎么抠图 ,能详细点吗','将一个图片中的某一部分单独抠出来，或者更换别的背景，或者用于别的图片当中',1,0,1,9,0,'2015-09-10 10:11:43'),(5,7,'我的MYSQL日志学习心得,给大家分享','二进制日志\n\n二进制日志就是我们经常说的binlog，主要记录mysql数据库的变化。\n\n二进制日志以一种有效的格式，并且是事务安全的方式包含更新日志中可用的所有信息。\n\n \n\n二进制日志包含关于每个更新数据库的语句的执行时间信息。他不包含没有修改任何数据的语句，例如select语句\n\n使用二进制日志的最大目的是最大可能地恢复数据库，因为二进制日志包含备份后进行的所有更新\n\n \n\n1、启动和设置二进制日志\n\n默认情况下，二进制日志是关闭的，可以通过修改mysql的配置文件来启动和设置二进制日志\n\nmy.ini中[mysqld]组下面有几个设置是关于二进制日志的：\n\nlog-bin[=PATH/[FILENAME]]\nexpire_logs_days=10\nmax_binlog_size=100M\n\nlog-bin定义开启二进制日志；path表明日志文件所在的目录路径；\n\nfilename指定了日志文件的名称，如文件的全名是filename.0001，filename.0002等\n\n除了上述文件之外，还有一个成为filename.index的文件，文件内容为所有日志的清单，可以使用记事本打开该文件\n\nfilename.index文件的内容，joe是我的计算机名，当前只有一个binlog文件：.\\joe-bin.000001\n\n.\\joe-bin.000001\n\n \n\nexpire_logs_days定义了mysql清除过期日志的时间，即二进制日志自动删除的天数。\n\n默认值为0，表示“没有自动删除”。当mysql启动或刷新二进制日志时可能删除该文件\n\n \n\nmax_binlog_size定义了单个文件的大小限制，如果二进制日志写入的内容大小超出给定值，日志就会发生滚动\n\n（关闭当前文件，重新打开一个新的日志文件）。不能将该变量设置为大于1GB或小于4096字节。默认值是1GB\n\n \n\n如果正在使用大事务 ，二进制日志文件大小还可能超过max_binlog_size的定义大小。\n\n在my.ini配置文件中的[mysqld]组下，添加以下几个参数与参数值\n\n[mysqld]\nlog-bin\nexpire_logs_days=10\nmax_binlog_size=100M\n\n添加完毕之后，关闭并重启mysql服务进程，即可打开二进制日志，然后可以通过SHOW VARIABLES语句来查询日志设置\n\n \n\n使用show VARIABLES  语句查看日志设置\n\nshow VARIABLES  LIKE \'%log_%\';\n\n \n\n可以看到log_bin为ON，max_binlog_size为104857600字节，换算为MB为100MB\n\nMYSQL重新启动之后，就可以看到新产生的文件后缀为.000001和.index的两个文件，文件名称默认为主机名称\n\n如果想改变日志文件的目录位置，可以修改my.ini中log-bin参数\n\n例如：\n\n[mysqld]\nlog-bin=\"D:\\mysql\\log\\binlog\"\n\n关闭并重启mysql服务之后，新的二进制日志将出现在\"D:\\mysql\\log\\binlog\"路径下\n\n \n\n提示：数据库文件最好不要和日志文件放在同一个磁盘上，这样当数据库文件所在磁盘发生损坏的时候，可以使用日志来恢复数据\n\n \n\n2、查看二进制日志\n\nmysql二进制日志是经常用到的。当mysql创建二进制日志文件时，首先创建一个以filename为名称，以index为后缀的文件；\n\n再创建一个以filename为名称，以“.000001”为后缀的文件。当mysql服务重新启动一次，以“.000001”为后缀的文件会增加一个，\n\n并且后缀名加1递增；如果日志长度超过了max_binlog_size的上限（默认是1GB）也会创建一个新的日志文件\n\n \n\nshow binary logs语句可以查看当前二进制日志文件个数和文件名。mysql二进制日志并不能直接查看，如果要查看日志内容，\n\n可以通过mysqlbinlog命令查看\n\n \n\n使用show binary logs语句查看二进制日志文件个数和文件名\n\nSHOW BINARY LOGS;\n\n可以看到，当前有两个二进制日志文件，因为我把mysql服务重启了一次，日志文件的个数和mysql服务启动的次数相同。\n\n每启动一次mysql服务，将会产生一个新的日志文件\n\n \n\n使用mysqlbinlog查看二进制日志\n\nmysqlbinlog是一个单独的exe，需要在命令行里执行我们把binlog文件里面的内容导出到binlog.txt\n\nmysqlbinlog  \"D:\\Program Files (x86)\\MySQL\\MySQL Server5.5\\data\\joe-bin.000002\" >c:\\binlog.txt\n\n/*!40019 SET @@session.max_insert_delayed_threads=0*/;\n/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;\nDELIMITER /*!*/;\n# at 4\n#140731  7:49:30 server id 1  end_log_pos 107     Start: binlog v 4, server v 5.5.20-log created 140731  7:49:30 at startup\n# Warning: this binlog is either in use or was not closed properly.\nROLLBACK/*!*/;\nBINLOG \'\nioTZUw8BAAAAZwAAAGsAAAABAAQANS41LjIwLWxvZwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAACKhNlTEzgNAAgAEgAEBAQEEgAAVAAEGggAAAAICAgCAA==\n\'/*!*/;\nDELIMITER ;\n# End of log file\nROLLBACK /* added by mysqlbinlog */;\n/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;\n\n \n\n3、删除二进制日志\n\nmysql的二进制日志可以配置自动删除，同时mysql也提供了安全的手动删除二进制日志的方法\n\n删除所有的二进制日志文件使用RESET MASTER;\n\nRESET MASTER;\n\n执行该语句，所有二进制日志将被删除，mysql 会重新创建二进制日志，新的日志文件扩展名将重新从000001开始编号\n\n \n\n只删除部分二进制日志文件使用PURGE MASTER LOGS;\n\nPURGE MASTER LOGS;\n\n语法如下\n\nPURGE {MASTER | BINARY} LOGS TO \'log_name\'\nPURGE {MASTER | BINARY} LOGS BEFORE \'date\'\n\n第一种方法指定文件名，执行该命令将删除文件名编号比指定文件名编号小的所有日志文件\n\n第二种方法指定日期，执行该命令将删除指定日期以前的所有日志文件\n\n \n\n \n\n使用PURGE MASTER LOGS;删除创建时间比binlog.000003早的所有日志文件\n\n首先，为了演示语句操作过程，准备多个日志文件，读者可以对mysql服务进行多次重启\n\n例如这里有10个日志文件\n\n执行删除命令\n\n PURGE MASTER LOGS TO \"joe-bin.000003\";\n\n执行完成后，使用 show BINARY logs; 查看二进制日志\n\n可以看到joe-bin.000001和joe-bin.000002两个日志文件被删除了\n\n \n\n使用 PURGE MASTER LOGS 删除2013年3月30日前创建的所有日志文件，执行命令如下\n\nPURGE MASTER LOGS BEFORE \'20130330\'\n\n执行完毕之后，2013年3月30日前的日志文件都被删除，但2013年3月30日的日志会被保留\n\n \n\n4、查看二进制日志里的操作记录\n\nshow binlog events;\n\n比如想查看某一个二进制日志里面的记录，但又不想用mysqlbinlog，可以使用show binlog events\n\n比如我想查看\'joe-bin.000006\'这个binlog文件的内容，执行如下命令\n\nshow binlog events in \'joe-bin.000006\';\n\n内容如下\n\nLog_name: joe-bin.000006\nPos: 202 \nEvent_type: Query \nServer_id: 1 \nEnd_log_pos: 304 \nInfo: use `test`; insert into bin(name) values (\'orange\') \n\n可以看到\'joe-bin.000006\'这个binlog文件记录了哪些SQL命令\n\n \n\n如果想知道binlog文件的创建时间，就需要mysqlbinlog工具来查看\n\nC:\\ProgramData\\MySQL\\MySQL Server 5.5\\data>mysqlbinlog mysql_bin.000001 \n/*!40019 SET @@session.max_insert_delayed_threads=0*/; \n/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/; \nDELIMITER /*!*/; \n# at 4 \n#131015 16:35:56 server id 1  end_log_pos 106   \n\n其中131015为日志创建时间，即2013年10月15日\n\n \n\n5、使用二进制日志还原数据库\n\n如果mysql服务器启用了二进制日志，在数据库出现意外丢失数据时，可以使用mysqlbinlog工具从指定的时间点开始\n\n（例如，最后一次备份）直到现在，或另外一个指定的时间点的日志中恢复数据\n\n \n\n要想从二进制日志恢复数据，需要知道当前二进制日志文件的路径和文件名。一般可以从配置文件（即my.cnf或者my.ini，文件名取决于mysql\n\n服务器的操作系统）中找到路径\n\n \n\nmysqlbinlog恢复数据的语法如下：\n\nmysqlbinlog [option] filename |mysql -uuser -ppass\n\noption是一些可选项，filename是日志文件名\n\n比较重要的两对option参数是\n\n--start-datetime、--stop-datetime\n\n--start-position、--stop--position\n\n--start-date、--stop-date可以指定恢复数据库的起始时间点和结束时间点\n\n--start-position、--stop--position可以指定恢复数据的开始位置和结束位置\n\n \n\n使用mysqlbinlog恢复mysql数据库到2014年7月2日15：27：48时的状态，执行下面命令\n\nmysqlbinlog --stop-datetime=\"2014-7-2 15:27:48 \" D:\\mysql\\log\\binlog\\binlog.000008 |mysql -u user -p password\n\n该命令执行成功后，会根据binlog.000008日志文件恢复2014年7月2日15：27：48前的所有操作。\n\n这种方法对误操作的删除数据比较有效\n\n \n\n6、暂时停止二进制日志\n\n如果在mysql的配置文件配置启动了二进制日志，mysql会一直记录二进制日志，修改配置文件，可以停止二进制日志，\n\n但是需要重启mysql数据库。mysql提供了暂时停止二进制日志的功能。通过 SET SQL_LOG_BIN 语句可以使mysql暂停或者启动二进制日志\n\n语法如下\n\nSET sql_log_bin={0|1}\n\n执行下面语句将暂停二进制日志\n\nSET sql_log_bin=0;\n\n执行下面语句将恢复记录二进制日志\n\nSET sql_log_bin=1;\n\n实际上，binlog文件有点类似于SQLSERVER的ldf文件，大家都保存了数据库的操作日志，都可以根据这个日志来恢复数据库\n\n但是又有不同，mysql的binlog可用不开启，因为mysql的redo日志放在ib_logfile开头的文件里面，而undo日志跟数据文件是放在一起的\n\n所以这一点跟SQLSERVER很不一样\n\n \n\n在复制的时候，MYSQL一定要开启binlog功能，slave读取binlog，而SQLSERVER的订阅端读取发布端的ldf文件\n\n所以刚才说：binlog文件有点类似于SQLSERVER的ldf文件\n\n错误日志\n\n错误日志文件包含了当mysqld启动和停止时，以及服务器在运行过程中发生任何严重错误时的相关信息。\n\n在MYSQL中，错误日志也是非常重要的，mysql将启动和停止数据库信息以及一些错误信息记录到错误日志中\n\n \n\n1、启动和设置错误日志\n\n在默认情况下，错误日志会记录到数据库的数据目录下。如果没有在配置文件中指定文件名，则文件名默认为hostname.err。\n\n例如：mysql所在服务器主机名为mysql-db，记录错误信息的文件名为mysql-db.err。如果执行了FLUSH LOGS，错误日志文件会重新加载\n\n \n\n错误日志的启动和停止以及日志文件名，都可以通过修改my.ini（或者my.cnf）来配置。错误日志的配置项是log-error。\n\n在[mysqld]下配置log-error，在启动错误日志。如果需要指定文件名，则配置项如下：\n\n[mysqld]\n\nlog-error=[path/[file_name]]\n\npath为日志文件所在的目录路径，filename为日志文件名。修改配置项后，需要重启mysql服务才生效\n\n \n\n2、查看错误日志\n\n通过错误日志可以监视系统的运行状态，便于及时发现故障，修复故障。mysql错误日志是以文本文件形式存储的，可以使用文本编辑器直接\n\n查看mysql错误日志\n\n \n\n如果不知道日志文件的存储路径，可以使用 show variables; 语句查看错误日志的存储路径。\n\n语句如下\n\nshow variables LIKE \'log_error\';\n\n \n\n使用记事本查看mysql错误日志\n\n通过上面 show variables LIKE \'log_error\'; 的语句查看到错误日志的路径，然后用记事本打开该文件\n\n我们可以看到错误日志内容如下\nView Code\n\n \n\n3、删除错误日志\n\nmysql的错误日志以文本文件的形式存储在文件系统中，可以直接删除\n\n对于mysql5.5.7以前的版本，flush logs可以将错误日志文件重命名为filename.err_old，\n\n并创建新的日志文件。但是从mysql5.5.7开始，flush logs只是重新打开日志文件，并不做日志备份和创建的操作。\n\n如果日志文件不存在，mysql启动或者执行flush logs时会创建新的日志文件\n\n \n\n在运行状态下删除错误日志文件后，mysql并不会自动创建日志文件。flush logs在重新加载日志的时候，如果文件不存在，\n\n则会自动创建。所以在删除错误日志之后，如果需要重建日志文件需要在服务器端执行以下命令：\n\nmysqladmin -u root -p flush-logs\n\n或者在客户端登录mysql数据库，执行flush logs语句\n\nflush logs;\n\n \n\n删除err文件，并用flush logs语句重建log-error文件\n\n手动删除文件\n\n手动执行 flush logs; ，err文件恢复了\n\n 打开err文件，里面什么都没有\n\n通用查询日志\n\n \n\n通用查询日志记录了mysql的所有用户操作，包括启动和关闭服务、执行查询和更新语句等\n\n \n\n1、启动和设置通用查询日志\n\nmysql服务器默认情况下并没有开启通用查询日志。如果需要通用查询日志，可以通过修改my.ini或my.cnf配置文件来\n\n开启。在my.ini或my.cnf的[mysqld]组下加入log选项\n\n形式如下\n\n[mysqld]\n\nlog[=path/[filename]]\n\npath为日志文件所在目录路径，filename为日志文件名。如果不指定目录和文件名，通用查询日志将默认存储在mysql数据目录中的\n\nhostname.log文件中。hostname是mysql数据库的主机名\n\n这里在[mysqld]下面增加选项log，后面不指定参数值\n\n[mysqld]\nlog\n\n \n\n2、查看通用查询日志\n\n通用查询日志中记录了用的所有操作。通过查看通用查询日志，可以了解用户对mysql进行的操作。通用查询日志是\n\n以文本文件形式存储在文件系统中的，可以使用文本编辑器直接打开通用日志文件进行查看，Windows下可以使用记事本\n\nLinux下可以使用vim、gedit等\n\n使用记事本查看mysql通用查询日志\n\n文件内容如下\n\nE:\\Program Files\\MySQL\\MySQL Server 5.5\\bin\\mysqld, Version: 5.5.19-log (MySQL Community Server (GPL)). started with:\nTCP Port: 3306, Named Pipe: (null)\nTime                 Id Command    Argument\n140801 23:39:33        1 Connect    root@localhost on \n            1 Query    SHOW VARIABLES\n            1 Query    SHOW WARNINGS\n            1 Query    select timediff( curtime(), utc_time() )\n            1 Query    SHOW COLLATION\n            1 Query    SET NAMES utf8\n            1 Query    SET character_set_results=NULL\n            1 Query    SELECT * FROM `emp`\n140801 23:39:44        1 Query    SELECT * FROM `emp`\n            1 Query    SELECT * FROM `emp`\n140801 23:39:55        1 Query    USE test;\n\nSELECT * FROM `emp`\n            1 Init DB    test\n\n可以看到mysql启动信息和用户root连接服务器与执行查询语句的记录\n\n \n\n3、删除通用查询日志\n\n通用查询日志是以文本文件的形式存储在文件系统中的。通用查询日志记录用户的所有操作\n\n因此在用户查询、更新频繁的情况下，通用查询日志会增长得很快。DBA可以定期删除比较早的通用日志，以节省磁盘空间\n\n \n\n可以用直接删除日志文件的方式删除通用查询日志。要重新建立新的日志文件，可使用语句\n\nmysqladmin -flush logs\n\n直接删除log文件\n\n执行 flush logs \n\n \n\n log文件重新生成了\n\n慢查询日志\n\n \n\n慢查询日志是记录查询时长超过指定时间的日。慢查询日志主要用来记录执行时间较长的查询语句\n\n通过慢查询日志，可以找出执行时间较长、执行效率较低的语句，然后进行优化\n\n \n\n1、启动和设置慢查询日志\n\nmysql中慢查询日志默认是关闭的，可以通过配置文件my.ini或my.cnf中的log-slow-queries选项打开，也可以在mysql服务\n\n启动的时候使用--log--slow-queries[=file_name]启动慢查询日志。启动慢查询日志时，需要在my.ini或者my.cnf文件中\n\n配置long_query_time选项指定记录阀值，如果某条查询语句的查询时间超过了这个值，这个查询过程将被记录到慢查询日志\n\n文件中。\n\n \n\n在my.ini或者my.cnf文件中开启慢查询日志的配置如下：\n\n[mysqld]\n\nlog-slow-queries[=path/[filename]]\nlong_query_time=n\n\npath为日志文件所在目录路径，filename为日志文件名。如果不指定目录和文件名称，默认存储在数据目录中\n\n文件名为hostname-slow.log，hostname是mysql服务器的主机名。参数n是时间值，单位是秒。\n\n如果没有设置long-query_time选项，默认时间为10秒\n\n \n\n开启慢查询日志\n\n[mysqld]\nlog-slow-queries\nlong_query_time=1\n\n \n\n2、查看慢查询日志\n\nmysql的慢查询日志是以文本形式存储的，可以直接使用文本编辑器查看。在慢查询日志中，记录着执行时间较长的查询语句，\n\n用户可以从慢查询日志中获取执行效率较低的查询语句，为查询优化提供重要的依据\n\n \n\n查看慢查询日志的一些参数\n\nshow variables like \'%slow%\';\n\n \n\n查看慢查询日志文件里的内容，使用文本编辑器打开数据目录下的WIN7U-20130414Z-slow.log文件\n\nE:\\Program Files\\MySQL\\MySQL Server 5.5\\bin\\mysqld, Version: 5.5.19-log (MySQL Community Server (GPL)). started with:\nTCP Port: 3306, Named Pipe: (null)\nTime                 Id Command    Argument\n# Time: 140802  0:02:29\n# User@Host: root[root] @ localhost [::1]\n# Query_time: 7.578125  Lock_time: 0.000000 Rows_sent: 1  Rows_examined: 0\nuse test;\nSET timestamp=1406908949;\nSELECT BENCHMARK (10000000,PASSWORD (\'newpwd\'));\n\n可以看到这里记录了一条慢查询日志。执行该条语句的帐户是root @ localhost \n\n查询时间是Query_time: 7.578125秒\n\n查询语句是 SELECT BENCHMARK (10000000,PASSWORD (\'newpwd\')); \n\n该语句查询时间大大超过了设置值1秒，因此被记录在慢查询日志文件中\n\nBENCHMARK函数简介：http://database.51cto.com/art/201010/229366.htm \n\n \n\n3、删除慢查询日志\n\n和通用查询日志一样，慢查询日志也可以直接删除。删除后在不重启服务器的情况下，需要执行\n\nmysqladmin -u root -p flush logs\n\n重新生成日志文件，或者在客户端登录到服务器执行 flush logs; 语句重建日志文件\n\n \n\n官方mysql的慢查询日志在这里有一个缺陷，就是查询阀值只能是1秒或以上，如果要设置一秒以下就无能为力了\n\n这时候如果想找出1秒以下的慢查询SQL，可以使用percona提供的microslow-patch来突破限制，将慢查询时间阀值减小到毫秒级别\n\n平时应打开哪些日志\n\n日志既会影响mysql的性能，又会占用大量磁盘空间。因此，如果不必要，应尽可能少地开启日志。\n\n根据不同的使用环境，考虑开启不同的日志。\n\n例如开发环境中优化查询效率低的语句，可以开启慢查询日志，或者生产环境中发现某些SQL执行特别慢也可以开启\n\n如果磁盘空间不是特充足可以在高峰期间开启，在捕获到查询慢的SQL之后再关闭慢查询日志\n\n \n\n如果需要搭建复制环境，那么就一定要开启二进制日志，如果数据特别重要也建议开启二进制日志，以便数据库损坏的时候也可以通过二进制日志\n\n挽救一部分数据\n\n \n\n通用日志无论在哪种情况下，一般不建议开启 \n\n总结\n\n本文简单的阐述了MYSQL的日志面的内容，MYSQL的日志系统还是比较完善的，希望这篇文章对大家有帮助\n\n \n\n如有不对的地方，欢迎大家拍砖o(∩_∩)o ',2,1,1,13,1,'2015-09-10 10:14:19'),(6,7,'我是如何自学Android，资料分享（2015 版）','Android 系列教程\n\n这一段时间，发现了好多学习资源，自己收藏了，不敢独享，所以拿出来和大家分享，如果您发现不错的学习资源，欢迎留言；\n而学习的过程中，也忽略了一些问题，比如自己学习的不系统，如果您也是自学的话，一定要注意这个问题，我觉得，除了看官方文档和大牛的博客之外，最重要就找一本好书，把自己的知识系统化；\n入门指南\n\n    Getting Started | Android Developers\n\n    How to get started programming Android apps | HalfApp\n\n    A step by step guide about how to get started and involved in Android Development - Reddit\n\n    Beginning Android Resources · codepath/android_guides Wiki\n\n    我是如何自学Android，资料分享\n\n    我推荐的 Android 基础学习路线\n\n    Android入门杂谈\n\n书籍推荐\n\n首先自己没有很系统地去看一本书，所以我也是搜索，或者实在知乎上别人推荐的，所以，要根据自己的情况，适合自己的书来看；\n\n    The Busy Coder\'s Guide to Android Development\n    这是大牛CommonsGuy 开源的一本书，它的更新非常及时，基本上就是跟着SDK 更新的，下载PDF 可以在这里（Four-to-Free Guarantee）下载，书籍中源码可以在Github（commonsguy/cw-omnibus） 中查看；\n\n    Best Android Books and Resources 2014\n    这篇文章主要介绍了Android 书籍和开发资源；\n\n公开课\n\n    How to Develop Android Apps Online Course - Udacity\n\n    Programming Mobile Applications for Android (Coursera)\n\n    Android Development For Absolute Beginners - YouTube\n\n系列教程\n\n    Home · codepath/android_guides Wiki - codepath\n    Android 指南，它不仅介绍怎么创建一个最简单的App Demo，循序渐进教你使用各种流行的框架，对于即将工作的同学来说是很用用的；Demo 很有实战意义；\n\n    Android tutorial - TutorialSpoint\n    是不是特别熟悉呀，对上面提到过，教程特别通俗易懂，代码实例也不错；\n\n    Android Development - Vogella\n    教程挺通俗易懂\n\n    AndroidHive | Tutorials, Games, Apps, Tips |\n    博主是印度人，博客主要是以教程为主，质量较高，而且会分享比较新的东西；\n\n    Android Tutorial | Interactive and Step by step tutorial to learn Android\n\n    Android SDK - Tuts+ Code Category\n\n    Android Programming Archives - Learn2Crack\n\n    Android Learning Path | SlideRule\n\n大牛博客推荐\n\n    android-cn/android-dev-cn\n    主要介绍国内Android 开发大牛；\n\n    android-cn/android-dev-com\n    主要介绍国外Android 开发大牛；\n\n    What are must-read Android developer blogs? - Quora\n    Quora 上的回答\n\n    有哪些 Android 大牛的 blog 值得推荐？ - 知乎\n    知乎上的回答\n\n开源App\n\n    F-Droid | Free and Open Source Android App Repository\n    F-Droid 是一个Android 开源App 仓库\n\n    Android优秀开源项目 - 小猪爬爬\n\n    The Android Arsenal - A categorized directory of free libraries and tools for Android\n    在这里，找到最新最流行的Android 开源类库\n\n    Trinea/android-open-project - Trinea\n    大牛Trinea 写的Android 开源项目汇总\n\n开发工具\n\n    Great Code Examples & Snippets | Codota\n    一个Android 代码搜索引擎；前两天发现了这个工具就爱不释手，写了篇文章——《Android 开发工具之Codota——搜索最好的Android 代码 - 简书》，让你参考入门。\n\n    Gradle\n    知乎上我回答的《如何从eclipse转入android studio,感觉Gradle什么的很难理解的。有什么教程吗? - Tikitoo 的回答 - 知乎》，可以参考。\n\n    Android Studio\n    从Google 的态度就可以看出，Android Studio 就是未来，而且在最近发布了正式版，教程在网上也不少。\n\n    Android User Interface | User Experience | Inspiration source for Android Designers and Developers\n\n    Android App Patterns\n\n    Iconfinder - 400,000+ free and premium icons\n    一个Icon 搜索引擎\n\n    google/material-design-icons - github\n    Google 把官方的Material Design 1000+ 的Icon 开源了，不仅仅只有Android 版，而且还有Web 和iOS，真是业界良心呀。\n\n    inferjay/AndroidDevTools\n    inferjay 总结的开发工具，并且提供了国内的镜像。\n\n    Genymotion - A faster Android emulator\n    Genymotion 是Android 的虚拟机，比官方的快了不知多少啊，它是基于Virtual Box，并且提供了插件。\n',2,0,6,97,2,'2015-09-10 10:16:31'),(7,3,'JavaScript刷新页面方法大全','1，reload 方法，该方法强迫浏览器刷新当前页面。\n语法：location.reload([bForceGet])  \n参数： bForceGet， 可选参数， 默认为 false，从客户端缓存里取当前页。true, 则以 GET 方式，从服务端取最新的页面, 相当于客户端点击 F5(\"刷新\")\n\n2，replace 方法，该方法通过指定URL替换当前缓存在历史里（客户端）的项目，因此当使用replace方法之后，你不能通过“前进”和“后退”来访问已经被替换的URL。\n语法： location.replace(URL)  \n通常使用： location.reload() 或者是 history.go(0) 来做。\n此方法类似客户端点F5刷新页面，所以页面method=\"post\"时，会出现\"网页过期\"的提示。\n因为Session的安全保护机制。\n当调用 location.reload() 方法时， aspx页面此时在服务端内存里已经存在， 因此必定是 IsPostback 的。\n如果有这种应用： 需要重新加载该页面，也就是说期望页面能够在服务端重新被创建，期望是 Not IsPostback 的。\n这里，location.replace() 就可以完成此任务。被replace的页面每次都在服务端重新生成。\n代码： location.replace(location.href);\n\n返回并刷新页面：\n\nlocation.replace(document.referrer);\ndocument.referrer //前一个页面的URL\n\n不要用 history.go(-1)，或 history.back();来返回并刷新页面，这两种方法不会刷新页面。',2,0,0,5,0,'2015-09-10 10:26:06'),(8,3,'Web App开发教程,有没有分享下','入门级的,有资料没,有视频没,感谢',1,0,3,16,0,'2015-09-10 10:27:58'),(9,6,'Premiere视频教学视频,大神分享下好吗','Premiere视频教学视频资料,有哪位大神可以分享下吗,膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜膜拜',1,0,2,51,2,'2015-09-10 10:31:40'),(10,7,'111111111111111111111111111','<script>alert(1)</script><script>alert(1)</script><script>alert(1)</script><script>alert(1)</script>',1,0,0,2,0,'2015-10-15 08:58:27');
/*!40000 ALTER TABLE `edu_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_questions_comment`
--

DROP TABLE IF EXISTS `edu_questions_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_questions_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `CUS_ID` int(11) DEFAULT NULL COMMENT '评论人id',
  `QUESTION_ID` int(11) DEFAULT NULL COMMENT '问答id',
  `CONTENT` varchar(300) DEFAULT NULL COMMENT '评论内容',
  `IS_BEST` int(1) DEFAULT NULL COMMENT '是否最佳答案 0否1是',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复数量',
  `PRAISE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '回复时间',
  `COMMENT_ID` int(11) DEFAULT '0' COMMENT '父级评论id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='问答评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_questions_comment`
--

LOCK TABLES `edu_questions_comment` WRITE;
/*!40000 ALTER TABLE `edu_questions_comment` DISABLE KEYS */;
INSERT INTO `edu_questions_comment` VALUES (1,7,6,'感谢大家支持',0,3,1,'2015-09-10 10:20:20',0),(2,7,6,'有什么不对的地方,欢迎指出',0,1,2,'2015-09-10 10:20:49',0),(3,3,0,'我来点个赞',0,0,0,'2015-09-10 10:23:15',1),(4,3,0,'收藏了......',0,0,0,'2015-09-10 10:23:27',1),(5,3,2,'能不能详细的描述下',0,0,0,'2015-09-10 10:28:31',0),(6,6,4,'第一步，打开ps，打开你要修改的图片。文件---打开就可以了。\n如果你并不追求完美的效果，而只是想快速一些，就选择快速选择工具，如图所示。用鼠标点击一下这里。\n然后用鼠标左键在图片上想抠出来的区域拖动，直到选择好你想选择的区域之后，点击ctrl+c组合键复制。然后新建一个空白图片。在此空白图片上粘贴，就出现了你刚才抠出来的图片了。\n如果你想得到更完美的抠图效果 ，可以使用铅笔工具 ，如图所示。\n用钢笔工具在图像的边缘定出若二个点，如图所示，确定完成之后按crtl+回车键选择，然后复制，新建空白图片。\n7在空白图片中粘贴，刚才抠出来的图便出现了。由于时间关系 ，我的抠图并不是十分准确。',0,0,1,'2015-09-10 10:34:17',0),(7,6,5,'不错',1,0,0,'2015-09-10 10:34:50',0),(8,7,0,'赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞',0,0,0,'2015-09-10 18:13:58',1),(9,7,6,'怎么没人呢,人呢....',0,2,0,'2015-09-10 18:27:46',0),(10,7,6,'分享的东西很全',0,11,2,'2015-09-10 18:29:56',0),(11,7,0,'很有水平',0,0,0,'2015-09-10 18:31:42',10),(12,7,9,'premiere是一款常用的视频编辑软件，由Adobe公司推出。现在常用的有CS4 CS5 CS6等版本。是一款编辑画面质量比较好的软件，有较好的兼容性，且可以与adobe公司推出的其他软件相互协作。目前这款软件广泛应用于广告制作和电视节目制作中。 其最新版本为Adobe Premiere Pro CC。',0,0,0,'2015-09-19 10:15:27',0),(13,7,0,'wuuwuw',0,0,1,'2015-09-19 16:47:03',10),(14,7,0,'asdf',0,0,0,'2015-09-19 16:47:05',10),(15,7,0,'asdf',0,0,1,'2015-09-19 16:47:07',10),(16,7,0,'asdf',0,0,0,'2015-09-19 16:47:15',10),(17,7,0,'12341234',0,0,1,'2015-09-19 16:47:22',10),(18,7,0,'asdfasdf',0,0,0,'2015-09-19 16:47:29',10),(19,7,0,'asdfasdf',0,0,0,'2015-09-19 16:47:34',10),(20,7,0,'asdfasdf',0,0,1,'2015-09-19 16:47:41',10),(21,7,0,'呜呜uwuwwu',0,0,0,'2015-09-19 16:54:31',10),(22,7,0,'阿斯顿发生地方',0,0,0,'2015-09-19 16:56:39',9),(23,7,0,'呜呜呜呜呜呜呜',0,0,0,'2015-09-19 16:59:59',2),(24,7,0,'呜呜呜呜呜呜呜',0,0,1,'2015-09-19 17:00:19',9),(25,7,0,'呜呜呜呜呜呜',0,0,1,'2015-09-19 17:00:39',10),(26,7,6,'来晚了我问我你哦',0,0,0,'2015-09-19 17:01:09',0),(27,7,8,'呜呜呜',0,0,0,'2015-09-19 17:35:20',0),(28,7,8,'嘻嘻嘻嘻',0,0,0,'2015-09-19 17:35:25',0),(29,7,8,'哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈',0,9,0,'2015-09-19 17:35:30',0),(30,7,0,'....................',0,0,1,'2015-09-19 17:35:36',29),(31,7,0,'玩儿玩儿',0,0,0,'2015-09-19 17:35:41',29),(32,7,0,'玩儿',0,0,0,'2015-09-19 17:35:44',29),(33,7,0,'嘎嘎嘎嘎嘎',0,0,0,'2015-09-19 17:35:49',29),(34,7,0,'有呀呀呀呀呀呀呀呀呀呀呀呀呀',0,0,0,'2015-09-19 17:35:57',29),(35,7,0,'快快快快快快快快快快快快快快快',0,0,0,'2015-09-19 17:36:03',29),(36,7,0,'去去去去去去去去去去去去',0,0,0,'2015-09-19 17:36:06',29),(37,7,0,'呃呃呃呃呃呃额额',0,0,0,'2015-09-19 17:36:10',29),(38,7,0,'哦哦哦哦哦哦哦哦哦哦哦哦',0,0,0,'2015-09-19 17:36:18',29),(39,6,6,'gagagggaggagagag',0,2,1,'2015-09-24 15:15:17',0),(40,6,0,'wqerqwe',0,0,1,'2015-09-24 15:15:29',39),(41,6,0,'yiyiyi',0,0,0,'2015-09-24 15:16:15',39),(42,7,9,'<script>alert(1)</script>',0,0,0,'2015-10-15 08:59:03',0);
/*!40000 ALTER TABLE `edu_questions_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_questions_tag`
--

DROP TABLE IF EXISTS `edu_questions_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_questions_tag` (
  `QUESTIONS_TAG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `QUESTIONS_TAG_NAME` varchar(45) DEFAULT NULL COMMENT '标签名',
  `STATUS` int(1) DEFAULT NULL COMMENT '状态0默认1删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENT_ID` varchar(45) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`QUESTIONS_TAG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='问答标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_questions_tag`
--

LOCK TABLES `edu_questions_tag` WRITE;
/*!40000 ALTER TABLE `edu_questions_tag` DISABLE KEYS */;
INSERT INTO `edu_questions_tag` VALUES (1,'JAVA',0,'2015-08-26 15:30:18','0'),(2,'Maya',0,'2015-08-26 15:30:51','0'),(3,'MongoDB',0,'2015-08-26 15:43:23','0'),(5,'Premiere',0,'2015-08-26 15:50:59','0'),(6,'Photoshop',0,'2015-08-26 15:52:36','0'),(7,'Mysql',0,'2015-08-26 15:53:38','0'),(8,'Android',0,'2015-08-26 15:53:41','0'),(9,'Unity3D',0,'2015-09-07 16:07:16','0'),(10,'JavaScript',0,'2015-09-07 16:08:19','0'),(11,'WebApp',0,'2015-09-08 10:35:10','0');
/*!40000 ALTER TABLE `edu_questions_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_questions_tag_relation`
--

DROP TABLE IF EXISTS `edu_questions_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_questions_tag_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `QUESTIONS_ID` int(11) DEFAULT NULL COMMENT '问答id',
  `QUESTIONS_TAG_ID` int(11) DEFAULT NULL COMMENT '问答标签id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_questions_tag_relation`
--

LOCK TABLES `edu_questions_tag_relation` WRITE;
/*!40000 ALTER TABLE `edu_questions_tag_relation` DISABLE KEYS */;
INSERT INTO `edu_questions_tag_relation` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,6),(5,5,7),(6,6,8),(7,7,10),(8,8,11),(9,9,5),(10,10,1);
/*!40000 ALTER TABLE `edu_questions_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_statistics_day`
--

DROP TABLE IF EXISTS `edu_statistics_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_statistics_day` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATISTICS_TIME` datetime NOT NULL COMMENT '统计日期',
  `LOGIN_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数（活跃人数 ）',
  `CREATE_TIME` datetime NOT NULL COMMENT '生成时间',
  PRIMARY KEY (`ID`),
  KEY `STATISTICS_TIME` (`STATISTICS_TIME`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COMMENT='网站统计日数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_statistics_day`
--

LOCK TABLES `edu_statistics_day` WRITE;
/*!40000 ALTER TABLE `edu_statistics_day` DISABLE KEYS */;
INSERT INTO `edu_statistics_day` VALUES (45,'2015-08-22 00:00:00',23,'2015-09-22 13:59:35'),(46,'2015-08-23 00:00:00',13,'2015-09-22 13:59:35'),(113,'2015-08-24 00:00:00',2,'2015-09-22 14:18:03'),(117,'2015-08-28 00:00:00',12,'2015-09-22 14:18:03'),(147,'2015-08-25 00:00:00',147,'2015-09-22 14:18:58'),(148,'2015-08-26 00:00:00',2,'2015-09-22 14:18:58'),(149,'2015-08-27 00:00:00',1,'2015-09-22 14:18:58'),(151,'2015-08-29 00:00:00',2,'2015-09-22 14:18:58'),(152,'2015-08-30 00:00:00',3,'2015-09-22 14:18:58'),(153,'2015-08-31 00:00:00',6,'2015-09-22 14:18:58'),(154,'2015-09-01 00:00:00',154,'2015-09-22 14:18:58'),(155,'2015-09-02 00:00:00',155,'2015-09-22 14:18:58'),(156,'2015-09-03 00:00:00',156,'2015-09-22 14:18:58'),(157,'2015-09-04 00:00:00',157,'2015-09-22 14:18:58'),(158,'2015-09-05 00:00:00',158,'2015-09-22 14:18:58'),(159,'2015-09-06 00:00:00',159,'2015-09-22 14:18:58'),(160,'2015-09-07 00:00:00',160,'2015-09-22 14:18:58'),(161,'2015-09-08 00:00:00',161,'2015-09-22 14:18:58'),(162,'2015-09-09 00:00:00',162,'2015-09-22 14:18:58'),(163,'2015-09-10 00:00:00',163,'2015-09-22 14:18:58'),(164,'2015-09-11 00:00:00',164,'2015-09-22 14:18:58'),(165,'2015-09-12 00:00:00',165,'2015-09-22 14:18:58'),(166,'2015-09-13 00:00:00',166,'2015-09-22 14:18:58'),(167,'2015-09-14 00:00:00',167,'2015-09-22 14:18:58'),(168,'2015-09-15 00:00:00',168,'2015-09-22 14:18:58'),(169,'2015-09-16 00:00:00',169,'2015-09-22 14:18:58'),(170,'2015-09-17 00:00:00',2,'2015-09-22 14:18:58'),(171,'2015-09-18 00:00:00',34,'2015-09-22 14:18:58'),(172,'2015-09-19 00:00:00',29,'2015-09-22 14:18:58'),(173,'2015-09-20 00:00:00',19,'2015-09-22 14:18:58'),(179,'2015-09-22 00:00:00',3,'2015-09-23 06:02:36');
/*!40000 ALTER TABLE `edu_statistics_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_teacher`
--

DROP TABLE IF EXISTS `edu_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_teacher` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `NAME` varchar(12) NOT NULL DEFAULT '' COMMENT '教师名称',
  `EDUCATION` varchar(200) NOT NULL DEFAULT '' COMMENT '教师资历,一句话说明老师',
  `CAREER` text NOT NULL COMMENT '教师简介',
  `IS_STAR` tinyint(1) NOT NULL DEFAULT '0' COMMENT '头衔 1高级讲师2首席讲师',
  `PIC_PATH` varchar(200) NOT NULL DEFAULT '' COMMENT '图片路径',
  `STATUS` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态:0正常1删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `SUBJECT_ID` int(11) DEFAULT '0' COMMENT '专业ID',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='讲师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_teacher`
--

LOCK TABLES `edu_teacher` WRITE;
/*!40000 ALTER TABLE `edu_teacher` DISABLE KEYS */;
INSERT INTO `edu_teacher` VALUES (73,'李诚','毕业于师范大学数学系，热爱教育事业，执教数学思维6年有余','具备深厚的数学思维功底、丰富的小学教育经验，授课风格生动活泼，擅长用形象生动的比喻帮助理解、简单易懂的语言讲解难题，深受学生喜欢',1,'/images/upload/teacher/20150915/1442298121626.jpg',0,'2015-03-30 17:15:57','2015-09-15 14:22:03',218,0),(74,'马妮妮','中国人民大学附属中学数学一级教师','中国科学院数学与系统科学研究院应用数学专业博士，研究方向为数字图像处理，中国工业与应用数学学会会员。参与全国教育科学“十五”规划重点课题“信息化进程中的教育技术发展研究”的子课题“基与课程改革的资源开发与应用”，以及全国“十五”科研规划全国重点项目“掌上型信息技术产品在教学中的运用和开发研究”的子课题“用技术学数学”。',2,'/images/upload/teacher/20150915/1442297957332.jpg',0,'2015-03-30 18:28:26','2015-09-15 14:19:18',210,0),(75,'张云唻','毕业于北京大学数学系','中教一级职称。讲课极具亲和力。',1,'/images/upload/teacher/20150915/1442297969808.jpg',0,'2015-03-31 09:20:46','2015-09-15 14:19:30',202,0),(76,'王健化','长期从事考研政治课讲授和考研命题趋势与应试对策研究。考研辅导新锐派的代表。','政治学博士、管理学博士后，北京师范大学马克思主义学院副教授。多年来总结出了一套行之有效的应试技巧与答题方法，针对性和实用性极强，能帮助考生在轻松中应考，在激励的竞争中取得高分，脱颖而出。',1,'/images/upload/teacher/20150915/1442297977255.jpg',0,'2015-04-03 14:13:51','2015-09-15 14:19:38',202,0),(77,'林奇','人大附中2009届毕业生','北京大学数学科学学院2008级本科生，2012年第八届学生五四奖章获得者，在数学领域取得多项国际国内奖项，学术研究成绩突出。曾被两次评为北京大学三好学生、一次评为北京大学三好标兵，获得过北京大学国家奖学金、北京大学廖凯原奖学金、北京大学星光国际一等奖学金、北京大学明德新生奖学金等。',1,'/images/upload/teacher/20150915/1442297987091.jpg',0,'2015-04-03 14:15:36','2015-09-15 14:19:50',224,0),(78,'陈红','华东师范大学数学系硕士生导师，中国数学奥林匹克高级教练','曾参与北京市及全国多项数学活动的命题和组织工作，多次带领北京队参加高中、初中、小学的各项数学竞赛，均取得优异成绩。教学活而新，能够调动学生的学习兴趣并擅长对学生进行思维点拨，对学生学习习惯的养成和非智力因素培养有独到之处，是一位深受学生喜爱的老师。',1,'/images/upload/teacher/20150915/1442297999141.jpg',0,'2015-04-03 14:19:28','2015-09-15 14:20:00',224,0),(80,'潘新强','考研政治辅导实战派专家，全国考研政治命题研究组核心成员。','法学博士，北京师范大学马克思主义学院副教授，专攻毛泽东思想概论、邓小平理论，长期从事考研辅导。出版著作两部，发表学术论文30余篇，主持国家社会科学基金项目和教育部重大课题子课题各一项，参与中央实施马克思主义理论研究和建设工程项目。',2,'/images/upload/teacher/20150915/1442297935589.jpg',0,'2015-04-03 14:21:03','2015-09-15 14:18:56',221,8),(81,'李立','上海师范大学法学院副教授','上海师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。',1,'/images/upload/teacher/20150915/1442297927029.jpg',0,'2015-04-03 14:23:06','2015-09-15 14:18:48',209,9),(82,'李小梅','资深课程设计专家，专注10年AACTP美国培训协会认证导师','十年课程研发和培训咨询经验，曾任国企人力资源经理、大型外企培训经理，负责企业大学和培训体系搭建；曾任专业培训机构高级顾问、研发部总监，为包括广东移动、东莞移动、深圳移动、南方电网、工商银行、农业银行、民生银行、邮储银行、TCL集团、清华大学继续教育学院、中天路桥、广西扬翔股份等超过200家企业提供过培训与咨询服务，并担任近50个大型项目的总负责人。',1,'/images/upload/teacher/20150915/1442297919077.jpg',0,'2015-04-03 14:23:33','2015-09-15 14:18:40',204,10),(83,'陈晓薇','北京师范大学法学院副教授','北京师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。',1,'/images/upload/teacher/20150915/1442297885942.jpg',0,'2015-04-03 14:32:19','2015-09-15 14:18:11',224,20);
/*!40000 ALTER TABLE `edu_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user`
--

DROP TABLE IF EXISTS `edu_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '学员ID',
  `MOBILE` varchar(11) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱号',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT '密码',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `SHOW_NAME` varchar(50) DEFAULT NULL COMMENT '显示名 （昵称）',
  `SEX` tinyint(1) DEFAULT '0' COMMENT '性别  1男  2女',
  `AGE` tinyint(3) DEFAULT '0' COMMENT '年龄',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `IS_AVALIBLE` tinyint(1) DEFAULT '1' COMMENT '是否可用 1正常  2冻结',
  `PIC_IMG` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `BANNER_URL` varchar(200) DEFAULT NULL COMMENT '个人中心用户背景图片',
  `MSG_NUM` int(11) DEFAULT '0' COMMENT '站内信未读消息数',
  `SYS_MSG_NUM` int(11) DEFAULT '0',
  `LAST_SYSTEM_TIME` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上传统计系统消息时间',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_user`
--

LOCK TABLES `edu_user` WRITE;
/*!40000 ALTER TABLE `edu_user` DISABLE KEYS */;
INSERT INTO `edu_user` VALUES (1,'18911893513','lmx193@163.com','3c5ef8ed366124eb3dd39b79b5ecdc6f',NULL,NULL,0,0,'2015-05-15 05:20:52',1,NULL,NULL,0,1,NULL),(2,'13661164223','lmx193@162.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-05-15 05:24:41',1,NULL,NULL,0,1,NULL),(3,'13661164224','lmx1943@163.com','96e79218965eb72c92a549dd5a330112','小星星','小少爷',1,24,'2015-05-15 05:26:41',1,'/images/upload/customer/20150910/1441866820099.jpg',NULL,0,1,NULL),(4,'18911893512','lmingxing@inxedu.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-05-15 06:41:11',1,NULL,NULL,0,1,NULL),(5,'13661164225','limingxing@inxedu.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-05-15 06:42:34',1,NULL,'/images/upload/image/20150512/1431402426251.jpg',0,1,NULL),(6,'18201604788','916033995@qq.com','96e79218965eb72c92a549dd5a330112','lucky','goddess',0,0,'2015-05-22 10:28:42',1,'',NULL,0,1,NULL),(7,'13161090129','demo@inxedu.com','96e79218965eb72c92a549dd5a330112','笑笑','inxedu',2,12,'2015-05-25 13:55:48',1,'/images/upload/customer/20150910/1441527777887.jpg',NULL,0,0,'2015-10-12 18:22:11'),(8,'13300009999','23@test.com','3d186804534370c3c817db0563f0e461',NULL,NULL,0,0,'2015-08-09 22:15:25',1,'/images/upload/customer/20150512/6818.jpg',NULL,0,1,'0000-00-00 00:00:00'),(9,'15612348458','9162321458@qq.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-09-01 20:21:54',1,NULL,NULL,0,1,'2015-09-01 16:21:54'),(10,'15940037813','exmail@qq.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-09-09 19:35:12',1,NULL,NULL,0,0,'2015-09-09 16:38:28'),(11,'13161090128','609682727@qq.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-09-10 13:39:14',1,NULL,NULL,0,1,'2015-09-10 09:39:14'),(12,'13161090120','6096827271@qq.com','96e79218965eb72c92a549dd5a330112',NULL,NULL,0,0,'2015-10-08 13:27:22',1,NULL,NULL,0,1,'2015-10-08 09:27:22');
/*!40000 ALTER TABLE `edu_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user_login_log`
--

DROP TABLE IF EXISTS `edu_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `OS_NAME` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `USER_AGENT` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_user_login_log`
--

LOCK TABLES `edu_user_login_log` WRITE;
/*!40000 ALTER TABLE `edu_user_login_log` DISABLE KEYS */;
INSERT INTO `edu_user_login_log` VALUES (1,'2015-09-21 22:58:38','127.0.1.1',7,'linux','firefox 3'),(2,'2015-09-21 22:59:00','127.0.1.1',6,'linux','firefox 3'),(3,'2015-09-22 14:10:49','127.0.1.1',6,'linux','firefox 3'),(4,'2015-09-22 14:11:02','127.0.1.1',7,'linux','firefox 3'),(5,'2015-09-22 14:11:28','127.0.1.1',3,'linux','firefox 3'),(6,'2015-09-24 14:26:37','127.0.1.1',6,'linux','firefox 4'),(7,'2015-09-24 14:47:16','127.0.1.1',6,'linux','firefox 4'),(8,'2015-09-24 14:54:52','127.0.1.1',6,'linux','firefox 4'),(9,'2015-09-24 15:19:07','127.0.1.1',6,'linux','firefox 4'),(10,'2015-09-24 15:45:25','127.0.1.1',6,'linux','firefox 4'),(11,'2015-09-24 19:03:59','127.0.1.1',6,'linux','firefox 4'),(12,'2015-09-28 14:12:49','127.0.1.1',7,'linux','firefox 4'),(13,'2015-09-28 14:51:01','127.0.1.1',7,'linux','firefox 4'),(14,'2015-09-28 15:06:49','127.0.1.1',7,'linux','firefox 4'),(15,'2015-09-28 15:07:49','127.0.1.1',7,'linux','firefox 4'),(16,'2015-09-28 17:13:25','127.0.1.1',7,'linux','firefox 4'),(17,'2015-09-28 17:32:09','127.0.1.1',7,'linux','firefox 4'),(18,'2015-09-28 17:32:45','127.0.1.1',7,'linux','chrome'),(19,'2015-09-28 18:15:20','127.0.1.1',7,'linux','firefox 4'),(20,'2015-09-28 21:43:23','127.0.1.1',7,'linux','chrome'),(21,'2015-09-28 21:51:47','127.0.1.1',7,'linux','firefox 4'),(22,'2015-09-28 22:17:23','127.0.1.1',7,'linux','firefox 4'),(23,'2015-09-28 22:19:50','127.0.1.1',7,'linux','chrome'),(24,'2015-09-29 13:32:07','127.0.1.1',7,'linux','firefox 4'),(25,'2015-09-30 15:54:39','127.0.1.1',7,'linux','firefox 4'),(26,'2015-10-12 22:15:08','127.0.1.1',7,'mac os x (iphone)','mobile safari'),(27,'2015-10-12 22:21:39','127.0.1.1',7,'mac os x (iphone)','mobile safari'),(28,'2015-10-14 15:00:49','127.0.1.1',7,'linux','firefox 4'),(29,'2015-10-14 18:41:50','127.0.1.1',7,'linux','firefox 4'),(30,'2015-10-14 19:00:11','127.0.1.1',7,'linux','firefox 4'),(31,'2015-10-14 19:05:44','127.0.1.1',7,'linux','firefox 4'),(32,'2015-10-14 20:13:43','127.0.1.1',7,'linux','firefox 4'),(33,'2015-10-15 12:57:53','127.0.1.1',7,'linux','firefox 4'),(34,'2015-10-20 00:42:51','127.0.1.1',7,'linux','firefox 4');
/*!40000 ALTER TABLE `edu_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_course`
--

DROP TABLE IF EXISTS `edu_website_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT '' COMMENT '推荐模块名称',
  `LINK` varchar(255) DEFAULT '' COMMENT '点击更多链接',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT '说明',
  `COURSENUM` int(11) DEFAULT '0' COMMENT '推荐课程限制数量',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站课程推荐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_course`
--

LOCK TABLES `edu_website_course` WRITE;
/*!40000 ALTER TABLE `edu_website_course` DISABLE KEYS */;
INSERT INTO `edu_website_course` VALUES (2,'首页-为你推荐课程','/front/showcoulist','首页-推荐课程（第一屏，导航图下面的位置）',6);
/*!40000 ALTER TABLE `edu_website_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_course_detail`
--

DROP TABLE IF EXISTS `edu_website_course_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_course_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RECOMMEND_ID` int(11) DEFAULT '0' COMMENT '推荐分类的id',
  `COURSE_ID` int(11) DEFAULT '0' COMMENT '课程id',
  `ORDER_NUM` int(11) DEFAULT '0' COMMENT '课程显示排序',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='推荐课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_course_detail`
--

LOCK TABLES `edu_website_course_detail` WRITE;
/*!40000 ALTER TABLE `edu_website_course_detail` DISABLE KEYS */;
INSERT INTO `edu_website_course_detail` VALUES (59,2,14,0),(60,2,15,0),(61,2,16,0),(62,2,17,0),(63,2,18,0),(64,2,19,0);
/*!40000 ALTER TABLE `edu_website_course_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_images`
--

DROP TABLE IF EXISTS `edu_website_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_images` (
  `IMAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `LINK_ADDRESS` varchar(255) DEFAULT NULL COMMENT '图链接地址',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '图标题',
  `TYPE_ID` int(11) DEFAULT '0' COMMENT '图片类型',
  `SERIES_NUMBER` int(11) DEFAULT '0' COMMENT '序列号',
  `PREVIEW_URL` varchar(255) DEFAULT NULL COMMENT '略缩图片地址',
  `COLOR` varchar(255) DEFAULT '' COMMENT '背景色',
  `describe` varchar(600) DEFAULT '' COMMENT '图片描述',
  PRIMARY KEY (`IMAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='banner图管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_images`
--

LOCK TABLES `edu_website_images` WRITE;
/*!40000 ALTER TABLE `edu_website_images` DISABLE KEYS */;
INSERT INTO `edu_website_images` VALUES (274,'/images/upload/image/20150915/1442313365861.jpg','/front/showcoulist','首页banner图片01',1,1,'/images/upload/image/20150915/1442313369401.jpg','#ef550f',''),(284,'/images/upload/image/20150915/1442313573533.jpg','/front/showcoulist','首页banner图片02',1,2,'/images/upload/image/20150915/1442313577205.jpg','#ef550f',''),(309,'/images/upload/image/20150908/1441801228269.png','http://www.inxedu.com/','底部微信二维码',11,0,'/images/upload/image/20150909/1441801233822.png','','底部微信二维码'),(310,'/images/upload/image/20150908/1441801298938.png','/','底部微薄二维码',11,0,'/images/upload/image/20150909/1441801303288.png','','底部微薄二维码'),(311,'/images/upload/image/20150908/1442225242188.jpg','/','文章列表',12,0,'','','文章列表右下角广告图'),(316,'/images/upload/image/20151019/1445228515754.jpg','/','首页banner图',16,0,'/images/upload/image/20151019/1445228518051.jpg','#009ed9','首页banner图'),(317,'/images/upload/image/20151019/1445228546398.jpg','/','首页banner',16,0,'/images/upload/image/20151019/1445228548787.jpg','#17b3f0','首页banner'),(318,'/images/upload/image/20151019/1445228621692.jpg','/','首页banner',17,0,'/images/upload/image/20151019/1445228624814.jpg','#68cb9b','首页banner'),(319,'/images/upload/image/20151019/1445228659207.jpg','/','首页banner',17,0,'/images/upload/image/20151019/1445228662019.jpg','#70dca8','首页banner');
/*!40000 ALTER TABLE `edu_website_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_images_type`
--

DROP TABLE IF EXISTS `edu_website_images_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_images_type` (
  `TYPE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '类型名',
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='图片类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_images_type`
--

LOCK TABLES `edu_website_images_type` WRITE;
/*!40000 ALTER TABLE `edu_website_images_type` DISABLE KEYS */;
INSERT INTO `edu_website_images_type` VALUES (1,'首页Banner图片_orange'),(11,'底部二维码'),(12,'文章列表'),(16,'首页Banner图片_blue'),(17,'首页Banner图片_green');
/*!40000 ALTER TABLE `edu_website_images_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_navigate`
--

DROP TABLE IF EXISTS `edu_website_navigate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_navigate` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(100) NOT NULL DEFAULT '' COMMENT '导航显示名称',
  `URL` varchar(100) NOT NULL DEFAULT '' COMMENT '导航显示位置',
  `NEWPAGE` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否在新页面打开0是1否',
  `TYPE` varchar(50) NOT NULL DEFAULT '' COMMENT '类型：INDEX首页、USER个人中心、FRIENDLINK尾部友链、TAB尾部标签',
  `ORDERNUM` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序',
  `STATUS` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1冻结',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_navigate`
--

LOCK TABLES `edu_website_navigate` WRITE;
/*!40000 ALTER TABLE `edu_website_navigate` DISABLE KEYS */;
INSERT INTO `edu_website_navigate` VALUES (1,'首页','/',1,'INDEX',100,0),(2,'课程','/front/showcoulist',1,'INDEX',99,0),(5,'名师','/front/teacherlist',1,'INDEX',96,0),(7,'文章','/front/articlelist',1,'INDEX',95,0),(14,'关于我们','#',0,'TAB',100,0),(16,'成功案例','#',0,'TAB',97,0),(17,'产品介绍','/help',0,'TAB',98,0),(18,'联系我们','#',0,'TAB',99,0),(31,'因酷时代','http://www.inxedu.com',0,'FRIENDLINK',0,0),(37,'问答','/questions/list',1,'INDEX',0,0);
/*!40000 ALTER TABLE `edu_website_navigate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_website_profile`
--

DROP TABLE IF EXISTS `edu_website_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_website_profile` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `DESCIPTION` text COMMENT '内容JSON格式',
  `EXPLAIN` varchar(50) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_website_profile`
--

LOCK TABLES `edu_website_profile` WRITE;
/*!40000 ALTER TABLE `edu_website_profile` DISABLE KEYS */;
INSERT INTO `edu_website_profile` VALUES (1,'web','{\"author\":\"INXEDU(http://www.inxedu.com)\",\"title\":\"中国在线教育平台第一品牌\",\"phone\":\"000 - 0000 - 0000\",\"keywords\":\"INXEDU,在线教育,网校搭建,网校,网络教育,远程教育,云网校,在线学习,在线考试\",\"email\":\"XXXXX@qq.com\",\"description\":\"inxedu是一家专注“在线教育平台”的互联网公司，在国内属顶级在线教育解决方案提供商中的领跑者。为大、中型客户提供领先的在线教育平台方案服务。\",\"company\":\"INXEDU 在线教育平台\",\"workTime\":\"9:00-18:00\",\"copyright\":\"©2010-2015 INXEDU有限公司 版权所有 京ICP备15017521号\"}','基本信息的维护'),(2,'alipay','{\"sellerEmail\":\"\",\"alipaykey\":\"\",\"alipaypartnerID\":\"\",\"status\":\"0\"}','支付宝配置'),(6,'letv','{\"user_unique\":\"\",\"secret_key\":\"\"}','乐视云'),(3,'logo','{\"url\":\"/images/upload/websiteLogo/20150820/1440035056371.png\"}','logo'),(4,'censusCode','{\"censusCodeString\":\"<script type=\\\"text/javascript\\\">\\r\\nvar _bdhmProtocol = ((\\\"https:\\\" == document.location.protocol) ? \\\" https://\\\" : \\\" http://\\\");\\r\\ndocument.write(unescape(\\\"%3Cscript src=\'\\\" + _bdhmProtocol + \\\"hm.baidu.com/h.js%3Ff9174a438ce90af0345a8e670f502461\' type=\'text/javascript\'%3E%3C/script%3E\\\"));\\r\\n</script>\\r\\n\"}','统计代码'),(5,'online','{\"onlineImageUrl\":\"/images/upload/online/20150522/1432262143299.png\",\"onlineUrl\":\"http://www.baidu.com\"}','在线咨询'),(8,'cc','{\"ccappID\":\"\",\"ccappKEY\":\"\"}','CC视频配置');
/*!40000 ALTER TABLE `edu_website_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function`
--

DROP TABLE IF EXISTS `sys_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function` (
  `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '权限父ID',
  `FUNCTION_NAME` varchar(100) DEFAULT NULL COMMENT '权限名',
  `FUNCTION_URL` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `FUNCTION_TYPE` tinyint(1) DEFAULT '0' COMMENT '权限类型 1菜单 2功能',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function`
--

LOCK TABLES `sys_function` WRITE;
/*!40000 ALTER TABLE `sys_function` DISABLE KEYS */;
INSERT INTO `sys_function` VALUES (18,45,'权限树','/admin/sysfunctioin/showfunctionztree',1,'2015-03-18 01:46:16',0),(19,45,'角色管理','/admin/sysrole/showroleList',1,'2015-03-18 01:46:17',0),(20,18,'修改权限','/admin/sysfunctioin/updatefunction',2,'2015-03-18 01:47:21',0),(21,18,'添加权限','/admin/sysfunctioin/addfunction',2,'2015-03-18 01:47:23',0),(22,18,'拖拽权限','/admin/sysfunctioin/updateparentid',2,'2015-03-18 01:48:44',0),(23,18,'删除权限','/admin/sysfunctioin/deletefunction',2,'2015-03-18 01:50:30',0),(24,0,'用户管理','',1,'2015-03-18 01:50:30',9),(25,24,'用户列表','/admin/sysuser/userlist',1,'2015-03-18 01:50:30',0),(26,19,'保存角色权限','/admin/sysrole/saveroelfunction/',2,'2015-03-19 22:56:09',0),(30,0,'媒体广告图片','',1,'2015-03-23 05:40:44',0),(31,24,'添加用户','/admin/sysuser/createuser',2,'2015-03-23 05:46:17',0),(32,30,'广告图','/admin/website/imagesPage',1,'2015-03-23 05:41:47',0),(33,24,'修改用户密码','/admin/sysuser/updatepwd/',2,'2015-03-23 05:48:55',0),(34,24,'修改用户','/admin/sysuser/updateuser',2,'2015-03-23 05:48:55',0),(35,24,'禁用或启用用户','/admin/sysuser/disableOrstart/',2,'2015-03-23 05:50:14',0),(36,0,'课程管理','',1,'2015-03-23 21:58:20',8),(37,36,'专业管理','/admin/subj/toSubjectList',1,'2015-03-23 21:58:34',0),(38,36,'课程管理','/admin/cou/list',1,'2015-03-23 22:01:46',0),(39,36,'推荐课程','/admin/detail/list',1,'2015-03-23 22:03:00',0),(40,36,'推荐课程分类','/admin/website/websiteCoursePage',1,'2015-03-23 22:03:34',0),(42,0,'教师管理','',1,'2015-03-23 22:04:17',0),(43,42,'教师列表','/admin/teacher/list',1,'2015-03-23 22:04:37',0),(44,42,'添加讲师','/admin/teacher/toadd',1,'2015-03-23 22:05:18',0),(45,0,'系统管理','',1,'2015-03-23 23:47:53',10),(46,0,'文章资讯管理','',1,'2015-03-23 23:58:35',7),(47,46,'添加文章','/admin/article/initcreate',1,'2015-03-23 23:58:49',0),(49,82,'基本配置','/admin/websiteProfile/find/web',1,'2015-03-24 04:08:44',0),(50,46,'文章列表','/admin/article/showlist',1,'2015-03-24 04:30:48',0),(51,82,'导航管理','/admin/website/navigates',1,'2015-03-24 04:36:45',0),(55,50,'删除资讯','/admin/article/publishOrDelete/2',2,'2015-03-25 03:41:06',0),(56,50,'发布文章','/admin/article/publishOrDelete/1',2,'2015-03-25 03:41:09',0),(57,50,'修改并发布文章','/admin/article/updatearticle/2',2,'2015-03-25 03:41:10',0),(58,50,'修改文章','/admin/article/updatearticle/1',2,'2015-03-25 03:44:02',0),(59,47,'保存文章','/admin/article/addarticle/1',2,'2015-03-25 03:44:42',0),(60,47,'保存并发布文章','/admin/article/addarticle/2',2,'2015-03-25 03:44:44',0),(61,0,'学员管理','',1,'2015-03-26 05:31:10',5),(62,61,'学员列表','/admin/user/getuserList',1,'2015-03-26 05:31:28',0),(63,0,'订单管理','',1,'2015-03-27 05:43:58',6),(64,63,'订单列表','/admin/order/showorderlist',1,'2015-03-27 05:44:14',0),(65,64,'取消或恢复订单','/admin/order/cancelOrRegain',2,'2015-03-27 06:57:28',0),(66,64,'审核订单','/admin/order/auditing/',2,'2015-03-27 06:58:02',0),(68,82,'在线咨询','/admin/websiteProfile/online',1,'2015-03-28 01:33:56',0),(69,37,'创建专业','/admin/subj/createSubject',2,'2015-03-29 23:47:32',0),(70,37,'修改专业父ID','/admin/subj/updateparentid/',2,'2015-03-29 23:47:32',0),(71,37,'修改专业名','/admin/subj/updatesubjectName',2,'2015-03-29 23:47:34',0),(72,37,'删除专业','/admin/subj/deleteSubject/',2,'2015-03-29 23:49:09',0),(73,38,'章节管理','/admin/kpoint/list/',2,'2015-03-31 22:13:35',0),(74,38,'修改课程','/admin/cou/updateCourse',2,'2015-03-31 22:14:27',0),(75,38,'上架或下架课程','/admin/cou/avaliable/',2,'2015-03-31 22:15:04',0),(76,73,'创建视频','/admin/kpoint/addkpoint',2,'2015-03-31 22:16:14',0),(77,73,'修改视频节点','/admin/kpoint/updateKpoint',2,'2015-03-31 22:16:52',0),(78,73,'删除视频节点','/admin/kpoint/deletekpoint/',2,'2015-03-31 22:17:20',0),(79,30,'图片类型','/admin/imagetype/getlist',1,'2015-04-01 06:25:06',0),(80,62,'修改学员密码','/admin/user/updateUserPwd',2,'2015-04-02 06:00:46',0),(81,62,'禁用或启用学员','/admin/user/updateuserstate',2,'2015-04-02 06:00:47',0),(82,0,'网站信息','',1,'2015-04-10 01:39:37',0),(83,43,'修改讲师','/admin/teacher/update',2,'2015-05-15 06:33:19',0),(84,43,'删除讲师','/admin/teacher/delete/',2,'2015-05-15 06:34:07',0),(91,0,'问答','',1,'2015-08-26 18:31:07',0),(92,91,'问答标签','/admin/questions/toQuestionsTagList',1,'2015-08-26 18:31:23',0),(93,91,'问答列表','/admin/questions/list',1,'2015-08-26 22:46:39',0),(94,91,'问答回复列表','/admin/questionscomment/list',1,'2015-08-27 13:44:43',0),(95,0,'系统消息','',1,'2015-08-29 22:33:06',0),(96,95,'全站系统消息','/admin/user/letter/toSendSystemMessages',1,'2015-08-29 22:33:20',0),(97,0,'评论管理','',1,'2015-08-31 13:11:44',0),(98,97,'评论列表','/admin/comment/query',1,'2015-08-31 13:12:18',0),(99,95,'批量发送','/admin/user/letter/toSendSystemMessagesBatch',1,'2015-08-31 22:18:18',0),(100,82,'前台主题色','/admin/theme/toupdate',1,'2015-09-22 18:25:32',0);
/*!40000 ALTER TABLE `sys_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT '0' COMMENT '用户ID',
  `OS_NAME` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `USER_AGENT` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (1,'2015-03-18 06:18:31','192.168.1.119',1,'windows 7','firefox 3'),(2,'2015-03-19 04:13:41','192.168.1.119',8,'windows 7','firefox 3'),(3,'2015-03-19 04:17:44','192.168.1.119',8,'windows 7','firefox 3'),(4,'2015-03-19 04:27:09','192.168.1.119',8,'windows 7','firefox 3'),(5,'2015-03-19 21:21:10','192.168.1.119',8,'windows 7','firefox 3'),(6,'2015-03-20 01:19:46','192.168.1.119',8,'windows 7','firefox 3'),(7,'2015-03-20 01:35:00','192.168.1.119',8,'windows 7','firefox 3'),(8,'2015-03-20 02:35:29','192.168.1.166',8,'windows 7','firefox 3'),(9,'2015-03-20 02:46:54','192.168.1.119',8,'windows 7','firefox 3'),(10,'2015-03-20 06:00:49','192.168.1.166',8,'windows 7','firefox 3'),(11,'2015-03-22 22:21:46','192.168.1.166',14,'windows 7','firefox 3'),(12,'2015-03-22 22:47:19','192.168.1.119',8,'windows 7','firefox 3'),(13,'2015-03-22 23:50:09','192.168.1.166',8,'windows 7','firefox 3'),(14,'2015-03-23 00:11:45','192.168.1.119',8,'windows 7','firefox 3'),(15,'2015-03-23 00:12:54','192.168.1.119',8,'windows 7','firefox 3'),(16,'2015-03-23 00:26:12','192.168.1.119',8,'windows 7','firefox 3'),(17,'2015-03-23 02:41:53','192.168.1.119',8,'windows 7','firefox 3'),(18,'2015-03-23 03:50:33','192.168.1.119',8,'windows 7','firefox 3'),(19,'2015-03-23 03:57:31','192.168.1.119',8,'windows 7','firefox 3'),(20,'2015-03-23 04:26:08','192.168.1.119',8,'windows 7','firefox 3'),(21,'2015-03-23 04:26:33','192.168.1.119',8,'windows 7','firefox 3'),(22,'2015-03-23 04:29:49','192.168.1.166',8,'windows 7','firefox 3'),(23,'2015-03-23 04:31:02','192.168.1.166',8,'windows 7','firefox 3'),(24,'2015-03-23 05:03:37','192.168.1.119',8,'windows 7','firefox 3'),(25,'2015-03-23 05:04:09','192.168.1.119',8,'windows 7','firefox 3'),(26,'2015-03-23 05:04:40','192.168.1.119',8,'windows 7','firefox 3'),(27,'2015-03-23 05:06:10','192.168.1.119',8,'windows 7','firefox 3'),(28,'2015-03-23 05:18:14','192.168.1.119',8,'windows 7','firefox 3'),(29,'2015-03-23 05:20:03','192.168.1.119',8,'windows 7','firefox 3'),(30,'2015-03-23 05:38:05','192.168.1.166',8,'windows 7','firefox 3'),(31,'2015-03-23 05:43:12','192.168.1.166',8,'windows 7','firefox 3'),(32,'2015-03-23 05:50:53','192.168.1.119',8,'windows 7','firefox 3'),(33,'2015-03-23 06:02:28','192.168.1.119',2,'windows 7','firefox 3'),(34,'2015-03-23 06:02:40','192.168.1.119',8,'windows 7','firefox 3'),(35,'2015-03-23 06:25:31','192.168.1.119',8,'windows 7','firefox 3'),(36,'2015-03-23 06:27:40','192.168.1.119',8,'windows 7','mozilla'),(37,'2015-03-23 06:32:08','192.168.1.119',8,'windows 7','firefox 3'),(38,'2015-03-23 06:47:42','192.168.1.119',8,'windows 7','firefox 3'),(39,'2015-03-23 21:07:07','192.168.1.119',8,'windows 7','firefox 3'),(40,'2015-03-23 21:18:46','192.168.1.166',8,'windows 7','firefox 3'),(41,'2015-03-23 21:21:43','192.168.1.160',2,'windows 7','firefox 3'),(42,'2015-03-23 22:06:23','192.168.1.166',8,'windows 7','firefox 3'),(43,'2015-03-23 22:10:02','192.168.1.160',2,'windows 7','firefox 3'),(44,'2015-03-23 22:27:16','192.168.1.166',8,'windows 7','firefox 3'),(45,'2015-03-23 22:29:07','192.168.1.166',2,'windows 7','firefox 3'),(46,'2015-03-23 22:30:12','192.168.1.166',8,'windows 7','firefox 3'),(47,'2015-03-23 22:33:25','192.168.1.166',8,'windows 7','firefox 3'),(48,'2015-03-23 22:42:41','192.168.1.160',8,'windows 7','firefox 3'),(49,'2015-03-23 23:59:43','192.168.1.119',8,'windows 7','firefox 3'),(50,'2015-03-24 03:30:53','192.168.1.119',8,'windows 7','firefox 3'),(51,'2015-03-24 03:27:03','192.168.1.160',2,'windows 7','firefox 3'),(52,'2015-03-24 03:27:17','192.168.1.160',8,'windows 7','firefox 3'),(53,'2015-03-24 03:34:23','192.168.1.166',8,'windows 7','firefox 3'),(54,'2015-03-24 04:12:31','192.168.1.166',8,'windows 7','firefox 3'),(55,'2015-03-24 04:31:37','192.168.1.119',8,'windows 7','firefox 3'),(56,'2015-03-24 04:57:16','192.168.1.166',8,'windows 7','firefox 3'),(57,'2015-03-24 04:59:10','192.168.1.166',8,'windows 7','firefox 3'),(58,'2015-03-24 06:49:31','192.168.1.119',8,'windows 7','firefox 3'),(59,'2015-03-24 06:50:02','192.168.1.119',8,'windows 7','firefox 3'),(60,'2015-03-24 21:08:22','192.168.1.119',8,'windows 7','firefox 3'),(61,'2015-03-24 21:06:15','192.168.1.160',8,'windows 7','firefox 3'),(62,'2015-03-24 21:27:06','192.168.1.166',8,'windows 7','firefox 3'),(63,'2015-03-25 03:15:27','192.168.1.119',8,'windows 7','firefox 3'),(64,'2015-03-25 04:24:01','192.168.1.119',8,'windows 7','firefox 3'),(65,'2015-03-25 04:30:26','192.168.1.119',8,'windows 7','firefox 3'),(66,'2015-03-25 04:32:19','192.168.1.119',8,'windows 7','firefox 3'),(67,'2015-03-25 04:27:55','192.168.1.160',8,'windows 7','firefox 3'),(68,'2015-03-25 21:03:34','192.168.1.160',8,'windows 7','firefox 3'),(69,'2015-03-25 23:33:26','192.168.1.166',8,'windows 7','firefox 3'),(70,'2015-03-25 23:48:13','192.168.1.160',8,'windows 7','firefox 3'),(71,'2015-03-26 03:19:09','192.168.1.160',8,'windows 7','firefox 3'),(72,'2015-03-26 03:19:16','192.168.1.160',8,'windows 7','firefox 3'),(73,'2015-03-26 05:00:45','192.168.1.119',8,'windows 7','firefox 3'),(74,'2015-03-26 05:39:09','192.168.1.160',8,'windows 7','firefox 3'),(75,'2015-03-26 05:45:09','192.168.1.119',8,'windows 7','firefox 3'),(76,'2015-03-26 05:45:45','192.168.1.119',8,'windows 7','firefox 3'),(77,'2015-03-26 21:18:01','192.168.1.119',8,'windows 7','firefox 3'),(78,'2015-03-26 21:47:23','192.168.1.160',8,'windows 7','firefox 3'),(79,'2015-03-26 21:56:24','192.168.1.160',8,'windows 7','firefox 3'),(80,'2015-03-26 22:09:26','192.168.1.119',8,'windows 7','chrome'),(81,'2015-03-26 22:10:14','192.168.1.119',8,'windows 7','chrome'),(82,'2015-03-26 22:10:59','192.168.1.119',8,'windows 7','mozilla'),(83,'2015-03-26 22:44:25','192.168.1.119',8,'windows 7','firefox 3'),(84,'2015-03-26 22:52:53','192.168.1.119',8,'windows 7','firefox 3'),(85,'2015-03-27 01:37:05','192.168.1.119',8,'windows 7','firefox 3'),(86,'2015-03-27 01:51:18','192.168.1.166',8,'windows 7','firefox 3'),(87,'2015-03-27 03:45:01','192.168.1.160',8,'windows 7','firefox 3'),(88,'2015-03-27 04:13:02','192.168.1.160',8,'windows 7','firefox 3'),(89,'2015-03-27 05:38:07','192.168.1.160',8,'windows 7','firefox 3'),(90,'2015-03-27 05:44:43','192.168.1.119',8,'windows 7','firefox 3'),(91,'2015-03-27 05:45:07','192.168.1.119',8,'windows 7','firefox 3'),(92,'2015-03-27 05:58:36','192.168.1.160',8,'windows 7','chrome'),(93,'2015-03-27 06:27:59','192.168.1.160',8,'windows 7','chrome'),(94,'2015-03-27 06:43:34','192.168.1.160',8,'windows 7','chrome'),(95,'2015-03-27 06:58:25','192.168.1.119',8,'windows 7','firefox 3'),(96,'2015-03-27 06:53:23','192.168.1.160',8,'windows 7','firefox 3'),(97,'2015-03-27 20:56:03','192.168.1.166',8,'windows 7','firefox 3'),(98,'2015-03-27 21:02:29','192.168.1.160',8,'windows 7','firefox 3'),(99,'2015-03-27 21:10:46','192.168.1.119',8,'windows 7','firefox 3'),(100,'2015-03-28 01:35:05','192.168.1.166',8,'windows 7','firefox 3'),(101,'2015-03-28 01:56:26','192.168.1.166',8,'windows 7','firefox 3'),(102,'2015-03-28 03:58:58','192.168.1.166',8,'windows 7','firefox 3'),(103,'2015-03-28 04:22:17','192.168.1.166',8,'windows 7','firefox 3'),(104,'2015-03-29 21:07:35','192.168.1.166',8,'windows 7','firefox 3'),(105,'2015-03-29 21:14:21','192.168.1.119',8,'windows 7','firefox 3'),(106,'2015-03-29 22:22:58','192.168.1.160',8,'windows 7','firefox 3'),(107,'2015-03-29 23:49:33','192.168.1.119',8,'windows 7','firefox 3'),(108,'2015-03-29 23:54:49','192.168.1.119',8,'windows 7','firefox 3'),(109,'2015-03-29 23:52:04','192.168.1.160',8,'windows 7','firefox 3'),(110,'2015-03-30 21:15:37','192.168.1.119',8,'windows 7','firefox 3'),(111,'2015-03-31 21:18:53','192.168.1.119',8,'windows 7','firefox 3'),(112,'2015-03-31 22:17:46','192.168.1.119',8,'windows 7','firefox 3'),(113,'2015-03-31 22:18:48','192.168.1.119',8,'windows 7','firefox 3'),(114,'2015-03-31 22:21:10','192.168.1.119',8,'windows 7','firefox 3'),(115,'2015-03-31 22:23:00','192.168.1.119',8,'windows 7','firefox 3'),(116,'2015-04-01 01:11:16','192.168.1.119',8,'windows 7','firefox 3'),(117,'2015-04-01 06:25:43','192.168.1.119',8,'windows 7','firefox 3'),(118,'2015-04-01 21:11:37','192.168.1.119',8,'windows 7','firefox 3'),(119,'2015-04-02 06:29:10','192.168.1.119',8,'windows 7','firefox 3'),(120,'2015-04-02 21:07:28','192.168.1.119',8,'windows 7','firefox 3'),(121,'2015-04-03 01:56:44','192.168.1.119',8,'windows 7','firefox 3'),(122,'2015-04-03 03:15:22','192.168.1.119',8,'windows 7','firefox 3'),(123,'2015-04-07 02:41:42','192.168.1.119',8,'windows 7','firefox 3'),(124,'2015-04-07 07:07:03','192.168.1.119',8,'windows 7','firefox 3'),(125,'2015-04-07 21:50:28','192.168.1.119',8,'windows 7','firefox 3'),(126,'2015-04-08 03:34:01','192.168.1.119',8,'windows 7','firefox 3'),(127,'2015-04-08 04:31:18','192.168.1.119',8,'windows 7','firefox 3'),(128,'2015-04-08 06:07:00','192.168.1.119',8,'windows 7','firefox 3'),(129,'2015-04-08 07:33:29','192.168.1.119',8,'windows 7','firefox 3'),(130,'2015-04-08 23:20:28','192.168.1.119',8,'windows 7','firefox 3'),(131,'2015-04-09 02:43:47','192.168.1.119',8,'windows 7','firefox 3'),(132,'2015-04-09 23:57:01','192.168.1.119',8,'windows 7','firefox 3'),(133,'2015-04-10 00:01:44','192.168.1.119',8,'windows 7','firefox 3'),(134,'2015-04-10 00:04:22','192.168.1.119',8,'windows 7','firefox 3'),(135,'2015-04-10 01:23:34','192.168.1.119',8,'windows 7','firefox 3'),(136,'2015-04-10 01:40:37','192.168.1.119',8,'windows 7','firefox 3'),(137,'2015-04-10 02:10:52','192.168.1.119',2,'windows 7','firefox 3'),(138,'2015-04-10 02:11:28','192.168.1.119',8,'windows 7','firefox 3'),(139,'2015-04-10 02:37:14','192.168.1.119',8,'windows 7','firefox 3'),(140,'2015-04-10 03:09:03','192.168.1.119',8,'windows 7','firefox 3'),(141,'2015-04-10 04:36:11','192.168.1.119',8,'windows 7','firefox 3'),(142,'2015-04-11 12:54:42','192.168.1.119',8,'windows 7','mozilla'),(143,'2015-04-13 07:27:49','192.168.1.158',8,'windows 7','firefox 3'),(144,'2015-04-13 07:37:02','192.168.1.158',8,'windows 7','internet explorer'),(145,'2015-04-13 10:03:26','192.168.1.158',8,'windows 7','internet explorer'),(146,'2015-04-13 11:51:24','192.168.1.158',8,'windows 7','internet explorer'),(147,'2015-04-13 12:04:23','192.168.1.158',8,'windows 7','internet explorer'),(148,'2015-04-13 12:09:46','192.168.1.158',8,'windows 7','internet explorer'),(149,'2015-04-13 12:11:35','192.168.1.158',8,'windows 7','internet explorer'),(150,'2015-04-18 06:02:59','192.168.1.119',8,'windows 7','firefox 3'),(151,'2015-05-12 09:41:08','192.168.1.157',8,'windows 7','firefox 3'),(152,'2015-05-12 15:44:22','192.168.1.157',8,'windows 7','firefox 3'),(153,'2015-05-12 12:33:08','192.168.1.165',8,'windows 7','chrome'),(154,'2015-05-12 12:46:12','192.168.1.157',8,'windows 7','firefox 3'),(155,'2015-05-12 12:48:06','192.168.1.157',8,'windows 7','firefox 3'),(156,'2015-05-15 05:07:22','192.168.1.157',8,'windows 7','firefox 3'),(157,'2015-05-15 05:51:07','192.168.1.157',8,'windows 7','firefox 3'),(158,'2015-05-15 06:30:22','192.168.1.157',8,'windows 7','firefox 3'),(159,'2015-05-15 06:34:59','192.168.1.157',8,'windows 7','firefox 3'),(160,'2015-05-19 13:32:47','192.168.1.158',8,'windows 7','chrome'),(161,'2015-05-19 13:38:42','192.168.1.158',2,'windows 7','chrome'),(162,'2015-05-19 13:38:56','192.168.1.158',8,'windows 7','chrome'),(163,'2015-05-19 13:39:52','192.168.1.158',2,'windows 7','chrome'),(164,'2015-05-19 13:40:48','192.168.1.158',2,'windows 7','chrome'),(165,'2015-05-19 13:40:56','192.168.1.158',8,'windows 7','chrome'),(166,'2015-05-19 13:41:26','192.168.1.158',2,'windows 7','chrome'),(167,'2015-05-19 13:42:09','192.168.1.158',8,'windows 7','chrome'),(168,'2015-05-19 13:44:02','192.168.1.158',8,'windows 7','chrome'),(169,'2015-05-19 10:43:30','192.168.1.164',8,'windows 7','firefox 3'),(170,'2015-05-19 10:46:16','192.168.1.164',8,'windows 7','firefox 3'),(171,'2015-05-19 10:47:36','192.168.1.164',8,'windows 7','firefox 3'),(172,'2015-05-19 10:48:31','192.168.1.164',8,'windows 7','firefox 3'),(173,'2015-05-19 10:49:18','192.168.1.164',2,'windows 7','firefox 3'),(174,'2015-05-21 15:05:22','123.151.136.214',8,'windows 7','firefox 3'),(175,'2015-05-21 16:35:21','123.151.136.214',2,'windows 7','firefox 3'),(176,'2015-05-21 17:28:10','123.151.136.214',2,'windows 7','firefox 3'),(177,'2015-05-21 17:28:28','123.151.136.214',8,'windows 7','firefox 3'),(178,'2015-05-21 18:16:08','123.151.136.214',2,'windows 7','firefox 3'),(179,'2015-05-21 18:19:41','123.151.136.214',8,'windows 7','firefox 3'),(180,'2015-05-21 18:31:12','123.151.136.214',8,'windows 7','firefox 3'),(181,'2015-05-22 10:17:24','123.151.136.214',8,'windows 7','firefox 3'),(182,'2015-05-22 11:38:52','123.151.136.214',8,'windows 7','firefox 3'),(183,'2015-05-25 13:27:10','123.151.136.214',2,'windows 7','firefox 3'),(184,'2015-05-25 13:27:21','123.151.136.214',8,'windows 7','firefox 3'),(185,'2015-05-25 13:42:31','123.151.136.214',2,'windows 7','firefox 3'),(186,'2015-05-25 13:57:45','123.151.136.214',2,'windows 7','internet explorer 7'),(187,'2015-05-25 14:09:02','123.151.136.214',2,'mac os x','firefox'),(188,'2015-05-28 11:49:14','219.143.143.179',2,'windows 7','firefox 3'),(189,'2015-05-28 12:59:03','123.151.136.214',2,'windows 7','internet explorer 9'),(190,'2015-07-15 11:28:15','123.150.202.1',2,'linux','firefox 3'),(191,'2015-07-15 11:45:50','123.150.202.1',2,'windows 7','internet explorer 7'),(192,'2015-07-15 11:47:39','123.151.136.83',2,'windows 7','firefox 3'),(193,'2015-07-24 10:26:45','123.151.136.82',2,'windows 7','chrome'),(194,'2015-07-27 10:23:38','123.151.136.82',2,'windows 7','firefox 3'),(195,'2015-08-11 16:00:02','123.151.136.214',2,'linux','firefox 3'),(196,'2015-08-12 17:17:48','127.0.1.1',2,'linux','firefox 3'),(197,'2015-08-12 17:27:55','127.0.1.1',2,'linux','firefox 3'),(198,'2015-08-12 17:57:24','127.0.1.1',2,'linux','firefox 3'),(199,'2015-08-12 23:15:32','127.0.1.1',2,'linux','firefox 3'),(200,'2015-08-12 23:59:44','127.0.1.1',2,'linux','firefox 3'),(201,'2015-08-20 13:26:55','127.0.1.1',2,'linux','firefox 3'),(202,'2015-08-20 18:01:14','127.0.1.1',2,'linux','firefox 4'),(203,'2015-08-20 20:09:42','127.0.1.1',2,'linux','firefox 3'),(204,'2015-08-20 20:36:37','127.0.1.1',2,'linux','firefox 3'),(205,'2015-08-24 20:31:53','127.0.1.1',2,'linux','firefox 4'),(206,'2015-08-24 21:36:04','127.0.1.1',2,'linux','firefox 4'),(207,'2015-08-24 21:52:25','127.0.1.1',2,'linux','firefox 4'),(208,'2015-08-24 21:58:51','127.0.1.1',2,'linux','firefox 4'),(209,'2015-08-24 22:37:33','127.0.1.1',2,'linux','firefox 4'),(210,'2015-08-24 22:41:31','127.0.1.1',2,'linux','firefox 4'),(211,'2015-08-24 22:44:39','127.0.1.1',2,'linux','firefox 4'),(212,'2015-08-24 22:48:12','127.0.1.1',2,'linux','firefox 4'),(213,'2015-08-24 22:55:13','127.0.1.1',2,'linux','firefox 4'),(214,'2015-08-25 13:08:42','127.0.1.1',2,'linux','firefox 4'),(215,'2015-08-25 13:29:18','127.0.1.1',2,'linux','firefox 4'),(216,'2015-08-25 13:32:42','127.0.1.1',2,'linux','firefox 4'),(217,'2015-08-25 14:22:47','127.0.1.1',2,'linux','firefox 4'),(218,'2015-08-25 14:31:42','127.0.1.1',2,'linux','firefox 4'),(219,'2015-08-25 14:36:48','127.0.1.1',2,'linux','firefox 4'),(220,'2015-08-25 14:54:16','127.0.1.1',2,'linux','firefox 4'),(221,'2015-08-25 14:54:25','127.0.1.1',2,'linux','firefox 4'),(222,'2015-08-25 15:03:14','127.0.1.1',2,'linux','firefox 4'),(223,'2015-08-25 15:06:41','127.0.1.1',2,'linux','firefox 4'),(224,'2015-08-25 15:19:53','127.0.1.1',2,'linux','firefox 4'),(225,'2015-08-25 15:22:49','127.0.1.1',2,'linux','firefox 4'),(226,'2015-08-25 15:27:18','127.0.1.1',2,'linux','firefox 4'),(227,'2015-08-25 15:29:16','127.0.1.1',2,'linux','firefox 3'),(228,'2015-08-25 15:40:06','127.0.1.1',2,'linux','firefox 4'),(229,'2015-08-25 15:49:14','127.0.1.1',2,'linux','firefox 4'),(230,'2015-08-25 17:58:32','127.0.1.1',2,'linux','firefox 4'),(231,'2015-08-25 18:17:56','127.0.1.1',2,'linux','firefox 4'),(232,'2015-08-25 18:25:51','127.0.1.1',2,'linux','firefox 4'),(233,'2015-08-25 18:27:27','127.0.1.1',2,'linux','firefox 4'),(234,'2015-08-25 18:30:34','127.0.1.1',2,'linux','firefox 4'),(235,'2015-08-25 18:43:29','127.0.1.1',2,'linux','firefox 4'),(236,'2015-08-25 18:59:30','127.0.1.1',2,'linux','firefox 4'),(237,'2015-08-25 20:07:32','127.0.1.1',2,'linux','firefox 4'),(238,'2015-08-25 20:51:19','127.0.1.1',2,'linux','firefox 4'),(239,'2015-08-26 17:46:35','127.0.1.1',2,'linux','firefox 4'),(240,'2015-08-26 18:29:27','127.0.1.1',2,'linux','firefox 3'),(241,'2015-08-26 18:37:58','127.0.1.1',2,'linux','firefox 4'),(242,'2015-08-26 19:25:44','127.0.1.1',2,'linux','firefox 3'),(243,'2015-08-26 19:26:06','127.0.1.1',2,'linux','firefox 3'),(244,'2015-08-26 19:42:30','127.0.1.1',2,'linux','firefox 3'),(245,'2015-08-26 19:49:59','127.0.1.1',2,'linux','firefox 3'),(246,'2015-08-26 19:51:24','127.0.1.1',2,'linux','firefox 4'),(247,'2015-08-26 21:25:04','127.0.1.1',2,'linux','firefox 4'),(248,'2015-08-26 22:46:26','127.0.1.1',2,'linux','firefox 3'),(249,'2015-08-26 22:49:39','127.0.1.1',2,'linux','firefox 3'),(250,'2015-08-26 23:34:33','127.0.1.1',2,'linux','firefox 3'),(251,'2015-08-26 23:36:26','127.0.1.1',2,'linux','firefox 3'),(252,'2015-08-26 23:40:43','127.0.1.1',2,'linux','firefox 3'),(253,'2015-08-27 00:03:57','127.0.1.1',2,'linux','firefox 3'),(254,'2015-08-27 00:16:59','127.0.1.1',2,'linux','firefox 3'),(255,'2015-08-27 00:20:28','127.0.1.1',2,'linux','firefox 3'),(256,'2015-08-27 00:22:30','127.0.1.1',2,'linux','firefox 3'),(257,'2015-08-27 00:24:09','127.0.1.1',2,'linux','firefox 3'),(258,'2015-08-27 01:04:04','127.0.1.1',2,'linux','firefox 3'),(259,'2015-08-27 12:30:45','127.0.1.1',2,'linux','firefox 4'),(260,'2015-08-27 13:08:46','127.0.1.1',2,'linux','firefox 3'),(261,'2015-08-27 13:25:15','127.0.1.1',2,'linux','firefox 4'),(262,'2015-08-27 13:33:05','127.0.1.1',2,'linux','firefox 4'),(263,'2015-08-27 13:44:36','127.0.1.1',2,'linux','firefox 3'),(264,'2015-08-27 13:45:17','127.0.1.1',2,'linux','firefox 3'),(265,'2015-08-27 14:00:28','127.0.1.1',2,'linux','firefox 4'),(266,'2015-08-27 14:20:00','127.0.1.1',2,'linux','firefox 3'),(267,'2015-08-27 14:35:00','127.0.1.1',2,'linux','firefox 3'),(268,'2015-08-27 14:58:17','127.0.1.1',2,'linux','firefox 4'),(269,'2015-08-27 15:10:28','127.0.1.1',2,'linux','firefox 3'),(270,'2015-08-27 15:11:37','127.0.1.1',2,'linux','firefox 3'),(271,'2015-08-27 15:36:44','127.0.1.1',2,'linux','firefox 3'),(272,'2015-08-27 15:47:21','127.0.1.1',2,'linux','firefox 3'),(273,'2015-08-27 15:50:36','127.0.1.1',2,'linux','firefox 3'),(274,'2015-08-27 17:48:40','127.0.1.1',2,'linux','firefox 3'),(275,'2015-08-27 18:33:22','127.0.1.1',2,'linux','firefox 4'),(276,'2015-08-27 19:14:31','127.0.1.1',2,'linux','firefox 4'),(277,'2015-08-27 19:47:50','127.0.1.1',2,'linux','firefox 3'),(278,'2015-08-27 21:01:56','127.0.1.1',2,'linux','firefox 3'),(279,'2015-08-27 23:51:30','127.0.1.1',2,'linux','firefox 3'),(280,'2015-08-28 00:26:45','127.0.1.1',2,'linux','firefox 4'),(281,'2015-08-28 13:02:59','127.0.1.1',2,'linux','firefox 4'),(282,'2015-08-28 13:48:43','127.0.1.1',2,'linux','firefox 4'),(283,'2015-08-28 20:47:36','127.0.1.1',2,'linux','firefox 3'),(284,'2015-08-28 20:55:07','127.0.1.1',2,'linux','firefox 3'),(285,'2015-08-29 14:08:59','127.0.1.1',2,'linux','firefox 4'),(286,'2015-08-29 14:12:15','127.0.1.1',2,'linux','firefox 4'),(287,'2015-08-29 14:45:19','127.0.1.1',2,'linux','firefox 4'),(288,'2015-08-29 18:58:33','127.0.1.1',2,'linux','firefox 4'),(289,'2015-08-29 19:33:32','127.0.1.1',2,'linux','firefox 4'),(290,'2015-08-29 22:32:49','127.0.1.1',2,'linux','firefox 3'),(291,'2015-08-29 22:34:24','127.0.1.1',2,'linux','firefox 3'),(292,'2015-08-29 22:35:14','127.0.1.1',2,'linux','firefox 3'),(293,'2015-08-31 13:11:36','127.0.1.1',2,'linux','firefox 4'),(294,'2015-08-31 13:21:25','127.0.1.1',2,'linux','firefox 3'),(295,'2015-08-31 13:29:15','127.0.1.1',2,'linux','firefox 4'),(296,'2015-08-31 13:30:02','127.0.1.1',2,'linux','firefox 3'),(297,'2015-08-31 13:50:59','127.0.1.1',2,'linux','firefox 4'),(298,'2015-08-31 13:51:46','127.0.1.1',2,'linux','firefox 4'),(299,'2015-08-31 13:53:09','127.0.1.1',2,'linux','firefox 4'),(300,'2015-08-31 14:07:28','127.0.1.1',2,'linux','firefox 4'),(301,'2015-08-31 14:45:45','127.0.1.1',2,'linux','firefox 4'),(302,'2015-08-31 14:53:51','127.0.1.1',2,'linux','firefox 4'),(303,'2015-08-31 15:48:33','127.0.1.1',2,'linux','firefox 4'),(304,'2015-08-31 17:55:09','127.0.1.1',2,'linux','firefox 4'),(305,'2015-08-31 18:50:09','127.0.1.1',2,'linux','firefox 4'),(306,'2015-08-31 19:43:33','127.0.1.1',2,'linux','firefox 4'),(307,'2015-08-31 20:41:31','127.0.1.1',2,'linux','firefox 3'),(308,'2015-08-31 21:12:32','127.0.1.1',2,'linux','firefox 4'),(309,'2015-08-31 21:36:19','127.0.1.1',2,'linux','firefox 3'),(310,'2015-08-31 21:40:34','127.0.1.1',2,'linux','firefox 3'),(311,'2015-08-31 22:18:04','127.0.1.1',2,'linux','firefox 3'),(312,'2015-08-31 22:19:38','127.0.1.1',2,'linux','firefox 3'),(313,'2015-08-31 22:22:12','127.0.1.1',2,'linux','firefox 3'),(314,'2015-08-31 22:30:23','127.0.1.1',2,'linux','firefox 3'),(315,'2015-09-01 15:14:12','127.0.1.1',2,'linux','firefox 3'),(316,'2015-09-01 15:35:58','127.0.1.1',2,'linux','firefox 3'),(317,'2015-09-01 15:49:10','127.0.1.1',2,'linux','firefox 3'),(318,'2015-09-01 17:45:13','127.0.1.1',2,'linux','firefox 4'),(319,'2015-09-01 19:07:00','127.0.1.1',2,'linux','firefox 4'),(320,'2015-09-01 19:08:55','127.0.1.1',2,'linux','firefox 4'),(321,'2015-09-01 21:09:33','127.0.1.1',2,'linux','firefox 3'),(322,'2015-09-01 21:45:04','127.0.1.1',2,'linux','firefox 3'),(323,'2015-09-02 18:09:27','127.0.1.1',2,'linux','firefox 4'),(324,'2015-09-02 19:40:46','127.0.1.1',2,'linux','firefox 4'),(325,'2015-09-02 21:03:20','127.0.1.1',2,'linux','firefox 4'),(326,'2015-09-07 15:35:40','127.0.1.1',2,'linux','firefox 3'),(327,'2015-09-07 16:01:25','127.0.1.1',2,'linux','firefox 3'),(328,'2015-09-07 17:33:19','127.0.1.1',2,'linux','firefox 3'),(329,'2015-09-07 17:36:26','127.0.1.1',2,'linux','firefox 3'),(330,'2015-09-07 17:48:39','127.0.1.1',2,'linux','firefox 3'),(331,'2015-09-07 20:00:30','127.0.1.1',2,'linux','firefox 3'),(332,'2015-09-07 20:26:12','127.0.1.1',2,'linux','firefox 3'),(333,'2015-09-07 20:29:30','127.0.1.1',2,'linux','firefox 3'),(334,'2015-09-07 20:36:24','127.0.1.1',2,'linux','firefox 3'),(335,'2015-09-07 20:42:45','127.0.1.1',2,'linux','firefox 3'),(336,'2015-09-07 22:09:26','127.0.1.1',2,'linux','firefox 4'),(337,'2015-09-07 22:30:37','127.0.1.1',2,'linux','firefox 4'),(338,'2015-09-08 13:14:48','127.0.1.1',2,'linux','firefox 3'),(339,'2015-09-08 13:36:07','127.0.1.1',2,'linux','chrome'),(340,'2015-09-08 14:01:53','127.0.1.1',2,'linux','chrome'),(341,'2015-09-08 14:06:11','127.0.1.1',2,'linux','chrome'),(342,'2015-09-08 14:25:26','192.168.110.50',2,'windows vista','internet explorer 7'),(343,'2015-09-08 15:16:19','127.0.1.1',2,'linux','firefox 3'),(344,'2015-09-08 15:42:11','192.168.110.60',2,'linux','chrome'),(345,'2015-09-08 15:48:10','192.168.110.60',2,'linux','chrome'),(346,'2015-09-08 17:50:57','192.168.110.60',2,'linux','firefox 4'),(347,'2015-09-08 18:23:57','127.0.1.1',2,'linux','firefox 3'),(348,'2015-09-08 21:20:21','127.0.1.1',2,'linux','firefox 3'),(349,'2015-09-08 22:16:19','127.0.1.1',2,'linux','chrome'),(350,'2015-09-08 23:16:27','127.0.1.1',2,'linux','chrome'),(351,'2015-09-09 00:18:43','127.0.1.1',2,'linux','firefox 4'),(352,'2015-09-09 12:58:42','127.0.1.1',2,'linux','chrome'),(353,'2015-09-09 13:09:45','127.0.1.1',2,'linux','firefox 3'),(354,'2015-09-09 13:57:16','127.0.1.1',2,'linux','chrome'),(355,'2015-09-09 14:13:31','127.0.1.1',2,'linux','firefox 3'),(356,'2015-09-09 14:14:28','127.0.1.1',2,'linux','firefox 3'),(357,'2015-09-09 14:15:32','127.0.1.1',2,'linux','firefox 3'),(358,'2015-09-09 14:18:40','127.0.1.1',2,'linux','firefox 3'),(359,'2015-09-09 14:57:31','127.0.1.1',2,'linux','firefox 4'),(360,'2015-09-09 15:04:55','127.0.1.1',2,'linux','firefox 4'),(361,'2015-09-09 18:18:36','127.0.1.1',2,'linux','firefox 3'),(362,'2015-09-09 18:29:02','127.0.1.1',2,'linux','chrome'),(363,'2015-09-09 18:51:52','127.0.1.1',2,'linux','firefox 3'),(364,'2015-09-09 18:54:58','127.0.1.1',2,'linux','firefox 3'),(365,'2015-09-09 18:57:39','127.0.1.1',2,'linux','firefox 3'),(366,'2015-09-09 19:30:05','192.168.1.6',2,'windows vista','chrome'),(367,'2015-09-09 19:32:49','127.0.1.1',2,'linux','firefox 3'),(368,'2015-09-09 19:55:18','127.0.1.1',2,'linux','firefox 3'),(369,'2015-09-09 20:13:55','127.0.1.1',2,'linux','firefox 4'),(370,'2015-09-09 20:16:34','127.0.1.1',2,'linux','firefox 4'),(371,'2015-09-09 20:22:48','127.0.1.1',2,'linux','firefox 4'),(372,'2015-09-09 20:47:32','127.0.1.1',2,'linux','firefox 4'),(373,'2015-09-09 20:57:53','127.0.1.1',2,'linux','firefox 4'),(374,'2015-09-09 20:59:26','127.0.1.1',2,'linux','firefox 4'),(375,'2015-09-09 21:13:44','127.0.1.1',2,'linux','chrome'),(376,'2015-09-09 21:36:45','127.0.1.1',2,'linux','firefox 3'),(377,'2015-09-09 21:36:52','127.0.1.1',2,'linux','firefox 3'),(378,'2015-09-09 21:42:09','127.0.1.1',2,'linux','firefox 4'),(379,'2015-09-09 21:47:05','127.0.1.1',2,'linux','chrome'),(380,'2015-09-09 22:40:28','127.0.1.1',2,'linux','firefox 4'),(381,'2015-09-09 22:47:50','127.0.1.1',2,'linux','firefox 4'),(382,'2015-09-09 23:02:41','127.0.1.1',2,'linux','firefox 4'),(383,'2015-09-09 23:21:00','127.0.1.1',2,'linux','firefox 4'),(384,'2015-09-10 00:02:28','127.0.1.1',2,'linux','firefox 4'),(385,'2015-09-10 14:09:05','127.0.1.1',2,'linux','chrome'),(386,'2015-09-10 14:17:22','127.0.1.1',2,'linux','chrome'),(387,'2015-09-10 14:36:12','127.0.1.1',2,'linux','firefox 3'),(388,'2015-09-10 15:36:40','127.0.1.1',2,'linux','firefox 3'),(389,'2015-09-10 15:39:52','127.0.1.1',2,'linux','chrome'),(390,'2015-09-10 17:32:54','127.0.1.1',2,'linux','firefox 3'),(391,'2015-09-10 17:48:35','127.0.1.1',2,'linux','chrome'),(392,'2015-09-10 18:08:07','127.0.1.1',2,'linux','chrome'),(393,'2015-09-10 18:17:33','127.0.1.1',2,'linux','firefox 3'),(394,'2015-09-10 18:23:57','127.0.1.1',2,'linux','firefox 3'),(395,'2015-09-10 18:46:46','127.0.1.1',2,'linux','firefox 3'),(396,'2015-09-10 18:54:33','127.0.1.1',2,'linux','firefox 3'),(397,'2015-09-10 20:44:10','127.0.1.1',2,'linux','firefox 4'),(398,'2015-09-10 20:54:40','127.0.1.1',2,'linux','chrome'),(399,'2015-09-10 20:56:29','127.0.1.1',2,'linux','chrome'),(400,'2015-09-10 20:58:26','127.0.1.1',2,'linux','chrome'),(401,'2015-09-10 21:00:52','127.0.1.1',2,'linux','chrome'),(402,'2015-09-11 00:30:03','127.0.1.1',2,'linux','chrome'),(403,'2015-09-11 13:23:23','127.0.1.1',2,'linux','firefox 4'),(404,'2015-09-11 13:55:23','127.0.1.1',2,'linux','firefox 4'),(405,'2015-09-11 14:07:24','127.0.1.1',2,'linux','firefox 4'),(406,'2015-09-11 18:00:04','127.0.1.1',2,'linux','firefox 3'),(407,'2015-09-14 13:23:41','127.0.1.1',2,'linux','firefox 3'),(408,'2015-09-14 14:18:19','127.0.1.1',2,'linux','firefox 3'),(409,'2015-09-14 14:39:07','127.0.1.1',2,'linux','firefox 3'),(410,'2015-09-14 15:34:00','127.0.1.1',2,'linux','firefox 3'),(411,'2015-09-14 20:04:06','127.0.1.1',2,'linux','firefox 3'),(412,'2015-09-14 20:06:43','127.0.1.1',2,'linux','firefox 3'),(413,'2015-09-14 22:01:10','127.0.1.1',2,'linux','firefox 3'),(414,'2015-09-14 22:22:32','127.0.1.1',2,'linux','firefox 3'),(415,'2015-09-15 14:10:55','127.0.1.1',2,'linux','firefox 3'),(416,'2015-09-15 14:11:31','127.0.1.1',2,'linux','firefox 3'),(417,'2015-09-15 14:12:14','127.0.1.1',2,'linux','firefox 3'),(418,'2015-09-15 14:12:53','127.0.1.1',2,'linux','firefox 3'),(419,'2015-09-15 14:25:27','127.0.1.1',2,'linux','firefox 3'),(420,'2015-09-15 14:52:00','127.0.1.1',2,'linux','firefox 3'),(421,'2015-09-15 15:35:27','127.0.1.1',2,'linux','firefox 3'),(422,'2015-09-15 17:35:42','127.0.1.1',2,'linux','firefox 3'),(423,'2015-09-15 18:17:15','127.0.1.1',2,'linux','firefox 3'),(424,'2015-09-15 19:20:22','127.0.1.1',2,'linux','firefox 3'),(425,'2015-09-15 20:20:27','127.0.1.1',2,'linux','firefox 3'),(426,'2015-09-15 20:57:25','127.0.1.1',2,'linux','firefox 3'),(427,'2015-09-15 21:52:10','127.0.1.1',2,'linux','firefox 3'),(428,'2015-09-15 22:00:32','127.0.1.1',2,'linux','chrome'),(429,'2015-09-15 22:01:07','127.0.1.1',2,'linux','firefox 3'),(430,'2015-09-15 22:02:18','127.0.1.1',2,'linux','chrome'),(431,'2015-09-15 22:04:15','127.0.1.1',2,'linux','chrome'),(432,'2015-09-15 22:21:06','127.0.1.1',2,'linux','chrome'),(433,'2015-09-15 22:24:33','127.0.1.1',2,'linux','chrome'),(434,'2015-09-15 22:26:05','127.0.1.1',2,'linux','chrome'),(435,'2015-09-15 22:34:06','127.0.1.1',2,'linux','chrome'),(436,'2015-09-16 00:38:04','127.0.1.1',2,'linux','chrome'),(437,'2015-09-16 14:26:10','127.0.1.1',2,'linux','firefox 3'),(438,'2015-09-16 14:53:34','127.0.1.1',2,'linux','firefox 3'),(439,'2015-09-16 15:06:15','127.0.1.1',2,'linux','firefox 3'),(440,'2015-09-16 15:18:56','127.0.1.1',2,'linux','firefox 3'),(441,'2015-09-16 15:27:35','127.0.1.1',2,'linux','firefox 3'),(442,'2015-09-16 15:48:37','127.0.1.1',2,'linux','firefox 3'),(443,'2015-09-16 15:54:08','127.0.1.1',2,'linux','firefox 3'),(444,'2015-09-16 15:59:04','127.0.1.1',2,'linux','firefox 3'),(445,'2015-09-16 17:33:44','127.0.1.1',2,'linux','firefox 3'),(446,'2015-09-16 17:37:09','127.0.1.1',2,'linux','firefox 3'),(447,'2015-09-16 17:39:51','127.0.1.1',2,'linux','firefox 3'),(448,'2015-09-16 18:53:22','127.0.1.1',2,'linux','firefox 3'),(449,'2015-09-16 19:09:45','127.0.1.1',2,'linux','firefox 3'),(450,'2015-09-16 19:11:39','127.0.1.1',2,'linux','firefox 3'),(451,'2015-09-16 19:24:15','127.0.1.1',2,'linux','firefox 3'),(452,'2015-09-16 21:44:26','127.0.1.1',2,'linux','firefox 3'),(453,'2015-09-16 22:45:49','127.0.1.1',2,'linux','firefox 3'),(454,'2015-09-16 22:57:52','127.0.1.1',2,'linux','firefox 3'),(455,'2015-09-17 13:02:04','127.0.1.1',2,'linux','firefox 3'),(456,'2015-09-17 13:40:55','127.0.1.1',2,'linux','firefox 3'),(457,'2015-09-17 13:44:27','127.0.1.1',2,'linux','firefox 3'),(458,'2015-09-17 14:03:17','127.0.1.1',2,'linux','firefox 3'),(459,'2015-09-17 14:18:37','127.0.1.1',2,'linux','firefox 3'),(460,'2015-09-17 14:31:43','127.0.1.1',2,'linux','firefox 3'),(461,'2015-09-17 19:19:52','127.0.1.1',2,'linux','firefox 4'),(462,'2015-09-17 19:40:34','172.30.52.1',2,'windows 7','chrome'),(463,'2015-09-17 20:16:19','127.0.1.1',2,'linux','firefox 4'),(464,'2015-09-17 20:19:38','127.0.1.1',2,'linux','firefox 4'),(465,'2015-09-18 14:38:27','127.0.1.1',2,'linux','firefox 3'),(466,'2015-09-18 23:49:54','127.0.1.1',2,'linux','firefox 3'),(467,'2015-09-18 23:59:37','127.0.1.1',2,'linux','firefox 3'),(468,'2015-09-19 12:58:02','127.0.1.1',2,'linux','firefox 3'),(469,'2015-09-19 13:42:08','127.0.1.1',2,'linux','firefox 3'),(470,'2015-09-19 14:40:42','127.0.1.1',2,'linux','firefox 3'),(471,'2015-09-19 17:42:04','127.0.1.1',2,'linux','firefox 3'),(472,'2015-09-19 19:25:47','127.0.1.1',2,'linux','firefox 3'),(473,'2015-09-19 21:56:06','127.0.1.1',2,'linux','firefox 3'),(474,'2015-09-21 22:41:47','127.0.1.1',2,'linux','firefox 3'),(475,'2015-09-22 13:15:25','127.0.1.1',2,'linux','chrome'),(476,'2015-09-22 13:37:52','127.0.1.1',2,'linux','firefox 4'),(477,'2015-09-22 13:56:54','127.0.1.1',2,'linux','firefox 4'),(478,'2015-09-22 15:10:40','127.0.1.1',2,'linux','firefox 4'),(479,'2015-09-22 15:48:43','192.168.1.123',2,'windows 7','chrome'),(480,'2015-09-22 15:49:36','127.0.1.1',2,'linux','firefox 4'),(481,'2015-09-22 15:56:47','127.0.1.1',2,'linux','firefox 4'),(482,'2015-09-22 15:58:13','127.0.1.1',2,'linux','firefox 4'),(483,'2015-09-22 15:59:54','127.0.1.1',2,'linux','firefox 4'),(484,'2015-09-22 18:00:17','127.0.1.1',2,'linux','firefox 4'),(485,'2015-09-22 18:01:46','192.168.1.123',2,'windows 7','chrome'),(486,'2015-09-22 18:14:59','127.0.1.1',2,'linux','firefox 4'),(487,'2015-09-22 18:17:02','127.0.1.1',2,'linux','firefox 4'),(488,'2015-09-22 18:26:32','127.0.1.1',2,'linux','firefox 4'),(489,'2015-09-22 18:27:21','127.0.1.1',2,'linux','firefox 4'),(490,'2015-09-22 18:41:24','127.0.1.1',2,'linux','firefox 4'),(491,'2015-09-22 18:47:07','192.168.1.123',2,'windows 7','chrome'),(492,'2015-09-22 21:36:37','127.0.1.1',2,'linux','firefox 3'),(493,'2015-09-22 21:58:12','127.0.1.1',2,'linux','firefox 3'),(494,'2015-09-22 22:04:42','127.0.1.1',2,'linux','firefox 3'),(495,'2015-09-22 22:06:32','127.0.1.1',2,'linux','firefox 3'),(496,'2015-09-22 22:09:08','127.0.1.1',2,'linux','firefox 3'),(497,'2015-09-22 22:27:36','127.0.1.1',2,'linux','firefox 3'),(498,'2015-09-22 22:33:54','127.0.1.1',2,'linux','firefox 3'),(499,'2015-09-22 22:38:01','127.0.1.1',2,'linux','firefox 3'),(500,'2015-09-22 22:56:38','127.0.1.1',2,'linux','firefox 3'),(501,'2015-09-22 23:00:40','127.0.1.1',2,'linux','firefox 3'),(502,'2015-09-22 23:04:32','127.0.1.1',2,'linux','firefox 3'),(503,'2015-09-23 13:46:17','127.0.1.1',2,'linux','firefox 3'),(504,'2015-09-23 14:03:55','127.0.1.1',2,'linux','firefox 3'),(505,'2015-09-24 14:42:59','127.0.1.1',2,'linux','firefox 4'),(506,'2015-09-24 18:13:30','127.0.1.1',2,'linux','firefox 4'),(507,'2015-09-24 18:24:11','127.0.1.1',2,'linux','firefox 4'),(508,'2015-09-24 18:45:02','127.0.1.1',2,'linux','chrome'),(509,'2015-09-24 18:48:10','127.0.1.1',2,'linux','chrome'),(510,'2015-09-24 18:49:10','127.0.1.1',2,'linux','firefox 4'),(511,'2015-09-24 19:07:09','127.0.1.1',2,'linux','firefox 4'),(512,'2015-09-25 13:59:36','127.0.1.1',2,'linux','chrome'),(513,'2015-09-25 15:04:28','127.0.1.1',2,'linux','chrome'),(514,'2015-09-28 14:03:44','127.0.1.1',2,'linux','firefox 4'),(515,'2015-09-28 15:26:01','127.0.1.1',2,'linux','chrome'),(516,'2015-09-28 17:36:02','127.0.1.1',2,'linux','firefox 4'),(517,'2015-09-28 18:01:20','127.0.1.1',2,'linux','firefox 4'),(518,'2015-09-28 18:04:17','127.0.1.1',2,'linux','firefox 4'),(519,'2015-09-28 18:33:51','127.0.1.1',2,'linux','firefox 4'),(520,'2015-09-28 19:01:25','127.0.1.1',2,'linux','chrome'),(521,'2015-09-28 19:41:22','127.0.1.1',2,'linux','firefox 4'),(522,'2015-09-28 19:50:38','127.0.1.1',2,'linux','firefox 4'),(523,'2015-09-28 19:58:35','127.0.1.1',2,'linux','firefox 4'),(524,'2015-09-28 19:59:43','127.0.1.1',2,'linux','firefox 4'),(525,'2015-09-28 20:12:23','127.0.1.1',2,'linux','chrome'),(526,'2015-09-28 21:26:00','127.0.1.1',2,'linux','firefox 4'),(527,'2015-09-28 21:50:12','127.0.1.1',2,'linux','firefox 4'),(528,'2015-09-28 22:09:29','127.0.1.1',2,'linux','firefox 4'),(529,'2015-09-28 22:12:01','127.0.1.1',2,'linux','chrome'),(530,'2015-09-28 22:50:51','127.0.1.1',2,'linux','firefox 4'),(531,'2015-09-28 22:57:41','127.0.1.1',2,'linux','chrome'),(532,'2015-09-28 22:57:59','127.0.1.1',2,'linux','firefox 4'),(533,'2015-09-29 13:27:59','127.0.1.1',2,'linux','firefox 4'),(534,'2015-09-29 13:43:12','127.0.1.1',2,'linux','chrome'),(535,'2015-09-29 13:46:52','127.0.1.1',2,'linux','chrome'),(536,'2015-09-29 14:58:57','127.0.1.1',2,'linux','chrome'),(537,'2015-09-29 15:50:01','127.0.1.1',2,'linux','chrome'),(538,'2015-09-29 20:16:30','127.0.1.1',2,'linux','chrome'),(539,'2015-09-29 20:39:54','127.0.1.1',2,'linux','firefox 4'),(540,'2015-09-29 20:40:37','127.0.1.1',2,'linux','firefox 4'),(541,'2015-09-29 20:45:51','127.0.1.1',2,'linux','firefox 4'),(542,'2015-09-29 22:21:27','127.0.1.1',2,'linux','firefox 4'),(543,'2015-09-30 20:13:13','127.0.1.1',2,'linux','firefox 4'),(544,'2015-09-30 21:22:43','127.0.1.1',2,'linux','firefox 4'),(545,'2015-10-14 15:48:39','127.0.1.1',2,'linux','firefox 4'),(546,'2015-10-14 17:20:51','127.0.1.1',2,'linux','firefox 4'),(547,'2015-10-14 18:43:04','127.0.1.1',2,'linux','firefox 4'),(548,'2015-10-15 14:12:59','127.0.1.1',1,'linux','firefox 4'),(549,'2015-10-15 14:15:18','127.0.1.1',1,'linux','firefox 4'),(550,'2015-10-16 12:56:44','127.0.1.1',1,'linux','firefox 4'),(551,'2015-10-16 13:21:36','127.0.1.1',1,'linux','firefox 4'),(552,'2015-10-16 18:40:20','127.0.1.1',1,'linux','firefox 4'),(553,'2015-10-16 19:24:38','127.0.1.1',1,'linux','firefox 4'),(554,'2015-10-16 20:48:50','127.0.1.1',1,'linux','firefox 4'),(555,'2015-10-19 16:17:44','127.0.1.1',1,'linux','firefox 4'),(556,'2015-10-19 16:21:34','127.0.1.1',1,'linux','firefox 4'),(557,'2015-10-20 19:43:09','127.0.1.1',1,'linux','chrome'),(558,'2015-10-20 19:43:30','127.0.1.1',1,'linux','firefox 4'),(559,'2015-10-21 13:14:00','127.0.1.1',1,'linux','firefox 4');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) DEFAULT NULL COMMENT '角色名',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'系统管理员','2015-03-18 12:00:00'),(2,'老师','2015-03-18 21:53:32'),(3,'普通管理员','2015-03-18 22:13:16');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_function`
--

DROP TABLE IF EXISTS `sys_role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_function` (
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '角色ID',
  `FUNCTION_ID` int(11) DEFAULT '0' COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_function`
--

LOCK TABLES `sys_role_function` WRITE;
/*!40000 ALTER TABLE `sys_role_function` DISABLE KEYS */;
INSERT INTO `sys_role_function` VALUES (8,17),(8,18),(8,20),(8,21),(2,63),(2,64),(2,65),(2,66),(2,61),(2,62),(2,80),(2,81),(3,45),(3,18),(3,21),(3,36),(3,38),(3,73),(3,76),(3,77),(3,74),(3,75),(3,39),(3,40),(3,46),(3,47),(3,59),(3,60),(3,50),(3,56),(3,57),(3,58),(1,45),(1,18),(1,20),(1,21),(1,22),(1,23),(1,19),(1,26),(1,24),(1,25),(1,31),(1,33),(1,34),(1,35),(1,36),(1,37),(1,69),(1,70),(1,71),(1,72),(1,38),(1,73),(1,76),(1,77),(1,78),(1,74),(1,75),(1,39),(1,40),(1,46),(1,47),(1,59),(1,60),(1,50),(1,55),(1,56),(1,57),(1,58),(1,63),(1,64),(1,65),(1,66),(1,61),(1,62),(1,80),(1,81),(1,30),(1,32),(1,79),(1,42),(1,43),(1,83),(1,84),(1,44),(1,82),(1,49),(1,51),(1,68),(1,100),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,99),(1,97),(1,98);
/*!40000 ALTER TABLE `sys_role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_subject`
--

DROP TABLE IF EXISTS `sys_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_subject` (
  `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SUBJECT_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT '专业名称',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0:默认 1:删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '父ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`SUBJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='专业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_subject`
--

LOCK TABLES `sys_subject` WRITE;
/*!40000 ALTER TABLE `sys_subject` DISABLE KEYS */;
INSERT INTO `sys_subject` VALUES (202,'外语考试',0,'2014-03-04 09:53:03',0,2),(203,'职称英语',0,'2014-03-04 09:53:24',202,6),(204,'英语四级',0,'2014-03-04 09:53:38',202,3),(206,'英语六级',0,'2014-03-04 09:54:10',202,7),(208,'教师资格证',0,'2014-06-15 23:33:33',0,0),(209,'教师',1,'2014-06-16 14:00:10',208,0),(210,'公务员',0,'2014-06-26 09:37:33',0,0),(211,'行测',0,'2014-06-26 09:37:59',210,0),(213,'面试',0,'2014-06-26 09:38:21',210,0),(214,'其他',0,'2014-06-26 09:38:29',210,0),(215,'幼儿',1,'2014-06-26 09:39:36',209,0),(216,'小学',0,'2014-06-26 09:39:47',208,0),(217,'初中',0,'2014-06-26 09:39:55',208,5),(218,'高中',0,'2014-06-26 09:40:05',208,6),(221,'移动开发',0,'2014-06-26 09:41:21',0,0),(222,'游戏开发',0,'2014-06-26 09:41:32',221,0),(223,'数据库',0,'2014-06-26 09:41:41',0,3),(224,'操作系统',0,'2014-06-26 09:41:51',0,0),(247,'新建专业',1,'2015-09-10 10:32:19',224,0),(248,'新建专业',1,'2015-09-10 10:34:50',247,0),(249,'新建专业',1,'2015-09-10 10:34:56',247,0),(250,'window',0,'2015-09-10 10:35:07',224,0),(251,'mysql',0,'2015-09-10 10:35:56',223,0);
/*!40000 ALTER TABLE `sys_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGIN_NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `LOGIN_PWD` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实姓名名',
  `STATUS` tinyint(1) DEFAULT '0' COMMENT '状态.0: 正常,1:冻结,2：删除',
  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `TEL` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `ROLE_ID` int(11) DEFAULT '0' COMMENT '所属角色ID',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','inxedu教育',0,'2015-10-21 13:14:00','127.0.1.1','2015-03-17 05:45:46','inxedu@inxedu.com','12345678900',1),(16,'1111111','96e79218965eb72c92a549dd5a330112','111',0,NULL,NULL,'2015-10-20 19:53:10','11111111@qq.com','111111',1);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-21  7:24:27

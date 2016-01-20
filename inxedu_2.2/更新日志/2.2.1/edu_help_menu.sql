DROP TABLE IF EXISTS `edu_help_menu`;
CREATE TABLE `edu_help_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT '0' COMMENT '父级分类ID，默认0为一级分类',
  `name` varchar(20) DEFAULT '' COMMENT '菜单名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `content` longtext COMMENT '菜单内容',
  `sort` int(11) DEFAULT '0' COMMENT '排序  倒叙',
  `varchar` varchar(200) DEFAULT NULL,
  `link_building` varchar(255) DEFAULT NULL COMMENT '外链字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='帮助菜单';

insert  into `edu_help_menu`(`id`,`parentId`,`name`,`create_time`,`content`,`sort`,`varchar`,`link_building`) values (171,0,'新手指南','2014-10-19 21:34:19','',100,NULL,NULL),(172,171,'注册登录','2014-10-19 21:34:39','&nbsp; <br />',100,NULL,''),(173,171,'购课流程','2014-10-19 21:58:21','<div class=\"mt10\">\r\n	<p>\r\n		(1)、注册，登录；\r\n	</p>\r\n	<p>\r\n		(2)、选择要购买的课程；\r\n	</p>\r\n	<p>\r\n		(3)、点击“立即购买”；\r\n	</p>\r\n	<p class=\"mt10\">\r\n		(4)、提交订单；\r\n	</p>\r\n	<p class=\"mt10\">\r\n		(5)、点击“立即支付”，通过网上银行或支付宝支付即可；\r\n	</p>\r\n</div>',99,NULL,''),(174,171,'常见问题','2014-10-19 21:58:32','&nbsp;',98,NULL,''),(175,171,'付款方式','2014-10-19 21:58:51','&nbsp;',97,NULL,''),(176,171,'支付常见问题','2014-10-19 21:59:07','&nbsp;',96,NULL,''),(177,0,'课程学习','2014-10-19 21:59:19','',99,NULL,NULL),(178,177,'学习流程','2014-10-19 21:59:38','&nbsp;',100,NULL,''),(179,177,'批量购买','2014-10-19 21:59:52','&nbsp;',99,NULL,''),(180,0,'用户中心','2014-10-19 22:00:10','',98,NULL,NULL),(181,180,'账户设置','2014-10-19 22:00:29','&nbsp;',100,NULL,''),(183,180,'订单查询','2014-10-19 22:00:57','&nbsp;',98,NULL,''),(185,0,'售后服务','2014-10-19 22:01:27','',97,NULL,NULL),(189,185,'网站建议','2014-10-19 22:02:41','11111111111111111',96,NULL,NULL),(193,0,'关于我们','2014-10-19 22:03:51','',93,NULL,NULL),(194,0,'联系我们','2014-10-19 22:04:37','',92,NULL,NULL),(197,0,'版权声明','2014-10-19 22:05:21','',89,NULL,NULL);
DROP TABLE IF EXISTS `edu_help_menu`;
CREATE TABLE `edu_help_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT '0' COMMENT '��������ID��Ĭ��0Ϊһ������',
  `name` varchar(20) DEFAULT '' COMMENT '�˵�����',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '����ʱ��',
  `content` longtext COMMENT '�˵�����',
  `sort` int(11) DEFAULT '0' COMMENT '����  ����',
  `varchar` varchar(200) DEFAULT NULL,
  `link_building` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='�����˵�';

insert  into `edu_help_menu`(`id`,`parentId`,`name`,`create_time`,`content`,`sort`,`varchar`,`link_building`) values (171,0,'����ָ��','2014-10-19 21:34:19','',100,NULL,NULL),(172,171,'ע���¼','2014-10-19 21:34:39','&nbsp; <br />',100,NULL,''),(173,171,'��������','2014-10-19 21:58:21','<div class=\"mt10\">\r\n	<p>\r\n		(1)��ע�ᣬ��¼��\r\n	</p>\r\n	<p>\r\n		(2)��ѡ��Ҫ����Ŀγ̣�\r\n	</p>\r\n	<p>\r\n		(3)��������������򡱣�\r\n	</p>\r\n	<p class=\"mt10\">\r\n		(4)���ύ������\r\n	</p>\r\n	<p class=\"mt10\">\r\n		(5)�����������֧������ͨ���������л�֧����֧�����ɣ�\r\n	</p>\r\n</div>',99,NULL,''),(174,171,'��������','2014-10-19 21:58:32','&nbsp;',98,NULL,''),(175,171,'���ʽ','2014-10-19 21:58:51','&nbsp;',97,NULL,''),(176,171,'֧����������','2014-10-19 21:59:07','&nbsp;',96,NULL,''),(177,0,'�γ�ѧϰ','2014-10-19 21:59:19','',99,NULL,NULL),(178,177,'ѧϰ����','2014-10-19 21:59:38','&nbsp;',100,NULL,''),(179,177,'��������','2014-10-19 21:59:52','&nbsp;',99,NULL,''),(180,0,'�û�����','2014-10-19 22:00:10','',98,NULL,NULL),(181,180,'�˻�����','2014-10-19 22:00:29','&nbsp;',100,NULL,''),(183,180,'������ѯ','2014-10-19 22:00:57','&nbsp;',98,NULL,''),(185,0,'�ۺ����','2014-10-19 22:01:27','',97,NULL,NULL),(189,185,'��վ����','2014-10-19 22:02:41','11111111111111111',96,NULL,NULL),(193,0,'��������','2014-10-19 22:03:51','',93,NULL,NULL),(194,0,'��ϵ����','2014-10-19 22:04:37','',92,NULL,NULL),(197,0,'��Ȩ����','2014-10-19 22:05:21','',89,NULL,NULL);
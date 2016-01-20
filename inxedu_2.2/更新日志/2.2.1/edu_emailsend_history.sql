DROP TABLE IF EXISTS `edu_emailsend_history`;
CREATE TABLE `edu_emailsend_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` longtext,
  `user_id` int(11) DEFAULT '0',
  `title` varchar(300) DEFAULT '' COMMENT '邮箱标题',
  `content` text COMMENT '邮箱正文',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `send_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '定时发送时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '1 已发送 2 未发送',
  `type` tinyint(3) DEFAULT '1' COMMENT '1 普通 2 定时',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件发送记录';
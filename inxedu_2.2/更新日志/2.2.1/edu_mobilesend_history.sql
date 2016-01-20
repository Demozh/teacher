DROP TABLE IF EXISTS `edu_mobilesend_history`;
CREATE TABLE `edu_mobilesend_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` text,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL COMMENT '定时发送时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '1 已发送 2 未发送',
  `type` tinyint(3) DEFAULT '1' COMMENT '1 正常 2 定时',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机短信发送记录';

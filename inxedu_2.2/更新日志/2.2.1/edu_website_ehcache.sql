DROP TABLE IF EXISTS `edu_website_ehcache`;
CREATE TABLE `edu_website_ehcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ehcache_key` varchar(200) NOT NULL DEFAULT '' COMMENT 'ehcache key',
  `ehcache_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

INSERT INTO `edu_website_ehcache` VALUES (38,'INDEX_TEACHER_RECOMMEND','前台首页 网校名师 缓存 '),(39,'ARTICLE_GOOD_RECOMMEND','文章  好文推荐 缓存 '),(40,'QUESTIONS_HOT_RECOMMEND','问答  热门问答推荐 缓存'),(41,'WEB_STATISTICS','网站统计'),(42,'WEB_STATISTICS_THIRTY','网站最近30条活跃统计'),(43,'WEB_COUNT','后台统计'),(44,'HELP_CENTER','帮助页面左侧菜单');

package com.yizhilu.os.inxedu.entity.article;

import java.io.Serializable;
import java.util.Date;

import com.yizhilu.os.inxedu.common.service.cache.EHCacheUtil;
import lombok.Data;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.constructs.blocking.BlockingCache;


/**
 * 文章资讯
 */
@Data
public class Article implements Serializable{
	private static final long serialVersionUID = -760228884438140694L;
	/**文章ID*/
	private int articleId;
	/**文章标题*/
	private String title;
	/**文章摘要*/
	private String summary;//
	/**文章关键字*/
	private String keyWord;
	/**文章图片URL*/
	private String imageUrl;
	/**文章来源*/
	private String source;
	/**文章作者*/
	private String author;
	/**创建时间*/
	private Date createTime;
	/**发布时间 */
	private Date publishTime;
	/**文章类型*/
	private int type;
	/**文章点击量*/
	private int clickNum;
	/**文章点赞量*/
	private int praiseCount;
	
	/**文章评论数*/
	private int commentNum;
	
}

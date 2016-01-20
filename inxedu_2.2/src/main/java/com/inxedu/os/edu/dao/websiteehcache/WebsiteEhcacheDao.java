package com.inxedu.os.edu.dao.websiteehcache;

import java.util.List;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.edu.entity.websiteehcache.WebsiteEhcache;

public interface WebsiteEhcacheDao {
	/**
	 * 添加
	 */
	public void addWebsiteEhcache(WebsiteEhcache websiteEhcache);
	
	/**
	 * 列表
	 */
	public List<WebsiteEhcache> queryWebsiteEhcacheList(WebsiteEhcache websiteEhcache,PageEntity page);
	
	/**
	 * 删除
	 */
	public Long delWebsiteEhcache(Long id);
	
	/**
	 * 根据Id查询
	 */
	public WebsiteEhcache getWebsiteEhcacheById(Long id);
	
	/**
	 * 查询key是否存在
	 */
	public int queryWebsiteEhcacheIsExsit(String key);
}

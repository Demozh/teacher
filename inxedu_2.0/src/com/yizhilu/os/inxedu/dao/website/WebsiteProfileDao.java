package com.yizhilu.os.inxedu.dao.website;


import com.yizhilu.os.inxedu.entity.website.WebsiteProfile;

import java.util.List;

/**
 * 网站配置
 */
public interface WebsiteProfileDao {
	/**
	 * 根据type查询网站配置
	 */
	public WebsiteProfile getWebsiteProfileByType(String type);

	/**
	 * 更新网站配置管理
	 */
	public void updateWebsiteProfile(WebsiteProfile websiteProfile);

	/**
	 * 查询网站配置
	 */
	public List<WebsiteProfile> getWebsiteProfileList();
}
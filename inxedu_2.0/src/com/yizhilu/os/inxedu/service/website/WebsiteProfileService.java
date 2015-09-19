package com.yizhilu.os.inxedu.service.website;


import com.yizhilu.os.inxedu.entity.website.WebsiteProfile;

import java.util.Map;

/**
 * service
 */
public interface WebsiteProfileService {
	/**
	 * 修改WebsiteProfile
	 */
	public void updateWebsiteProfile(WebsiteProfile websiteProfile) throws Exception;

	/**
	 * 查询所有网站配置
	 */
	public Map<String, Object> getWebsiteProfileList() throws Exception;
	/**
	 * 根据type查询网站配置
	 */
	public Map<String,Object> getWebsiteProfileByType(String type);

}
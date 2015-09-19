package com.yizhilu.os.inxedu.dao.impl.website;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.website.WebsiteProfileDao;
import com.yizhilu.os.inxedu.entity.website.WebsiteProfile;
import org.springframework.stereotype.Repository;

import java.util.List;

/** 网站配置 */
 @Repository("websiteProfileDao")
public class WebsiteProfileDaoImpl extends GenericDaoImpl implements WebsiteProfileDao {
	
	
	public WebsiteProfile getWebsiteProfileByType(String type) {
		return this.selectOne("WebsiteProfileMapper.getWebsiteProfileByType", type);
	}

	
	public void updateWebsiteProfile(WebsiteProfile websiteProfile) {
		this.update("WebsiteProfileMapper.updateWebsiteProfile", websiteProfile);
	}

	
	public List<WebsiteProfile> getWebsiteProfileList() {
		return this.selectList("WebsiteProfileMapper.getWebsiteProfileList", null);
	}

}

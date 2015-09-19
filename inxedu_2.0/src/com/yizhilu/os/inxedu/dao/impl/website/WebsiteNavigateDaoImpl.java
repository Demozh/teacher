package com.yizhilu.os.inxedu.dao.impl.website;


import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.website.WebsiteNavigateDao;
import com.yizhilu.os.inxedu.entity.website.WebsiteNavigate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 网站导航dao
 */
@Repository("websiteNavigateDao")
public class WebsiteNavigateDaoImpl extends GenericDaoImpl implements WebsiteNavigateDao {

	
	public List<WebsiteNavigate> getWebsiteNavigate(WebsiteNavigate websiteNavigate){
		return this.selectList("WebsiteNavigateMapper.getWebsiteNavigate", websiteNavigate);
	}
	
	
	public void addWebsiteNavigate(WebsiteNavigate websiteNavigate){
		this.insert("WebsiteNavigateMapper.createWebsiteNavigate", websiteNavigate);
	}

	
	public void freezeWebsiteNavigate(WebsiteNavigate websiteNavigate){
		this.update("WebsiteNavigateMapper.freezeWebsiteNavigate", websiteNavigate);
	}
	
	
	public void delWebsiteNavigate(int id){
		this.delete("WebsiteNavigateMapper.delWebsiteNavigate",id);
	}
	
	
	public void updateWebsiteNavigate(WebsiteNavigate websiteNavigate){
		this.update("WebsiteNavigateMapper.updateWebsiteNavigate", websiteNavigate);
	}
	
	
	public WebsiteNavigate getWebsiteNavigateById(int id){
		return this.selectOne("WebsiteNavigateMapper.getWebsiteNavigateById", id);
	}
	
	
	public List<WebsiteNavigate> getWebNavigate(){
		return this.selectList("WebsiteNavigateMapper.getWebNavigate",0);
	}

}

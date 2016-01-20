package com.inxedu.os.edu.service.impl.websiteehcache;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.stereotype.Service;

import com.inxedu.os.edu.dao.websiteehcache.WebsiteEhcacheDao;
import com.inxedu.os.edu.entity.websiteehcache.WebsiteEhcache;
import com.inxedu.os.edu.service.websiteehcache.WebsiteEhcacheService;

@Service("websiteEhcacheService")
public class WebsiteEhcacheServiceImpl implements WebsiteEhcacheService{
	
	@Autowired
	private WebsiteEhcacheDao websiteEhcacheDao;

	@Override
	public void addWebsiteEhcache(WebsiteEhcache websiteEhcache) {
		websiteEhcacheDao.addWebsiteEhcache(websiteEhcache);
	}
	
	@Override
	public List<WebsiteEhcache> queryWebsiteEhcacheList(WebsiteEhcache websiteEhcache, PageEntity page) {
		return websiteEhcacheDao.queryWebsiteEhcacheList(websiteEhcache, page);
	}

	@Override
	public Long delWebsiteEhcache(Long id) {
		return websiteEhcacheDao.delWebsiteEhcache(id);
	}

	@Override
	public WebsiteEhcache getWebsiteEhcacheById(Long id) {
		return websiteEhcacheDao.getWebsiteEhcacheById(id);
	}

	@Override
	public boolean queryWebsiteEhcacheIsExsit(String key) {
		if(websiteEhcacheDao.queryWebsiteEhcacheIsExsit(key)>0){
			return true;
		}else{
			return false;
		}
	}

}

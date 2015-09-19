package com.yizhilu.os.inxedu.service.impl.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.dao.website.WebSiteImagesTypeDao;
import com.yizhilu.os.inxedu.entity.website.WebSiteImagesType;
import com.yizhilu.os.inxedu.service.website.WebSiteImagesTypeService;

@Service("webSiteImagesTypeService")
public class WebSiteImagesTypeServiceImpl implements WebSiteImagesTypeService{
	
	@Autowired
	private WebSiteImagesTypeDao webSiteImagesTypeDao;
	
	public int createImageType(WebSiteImagesType type) {
		return webSiteImagesTypeDao.createImageType(type);
	}

	
	public List<WebSiteImagesType> queryAllTypeList() {
		return webSiteImagesTypeDao.queryAllTypeList();
	}

	
	public void deleteTypeById(int typeId) {
		webSiteImagesTypeDao.deleteTypeById(typeId);
	}

	
	public void updateType(WebSiteImagesType type) {
		webSiteImagesTypeDao.updateType(type);
	}

}

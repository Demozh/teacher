package com.inxedu.os.service.impl.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inxedu.os.dao.website.WebSiteImagesTypeDao;
import com.inxedu.os.entity.website.WebSiteImagesType;
import com.inxedu.os.service.website.WebSiteImagesTypeService;

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

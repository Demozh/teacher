package com.yizhilu.os.inxedu.dao.impl.website;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.website.WebSiteImagesTypeDao;
import com.yizhilu.os.inxedu.entity.website.WebSiteImagesType;

@Repository("webSiteImagesTypeDao")
public class WebSiteImagesTypeDaoImpl extends GenericDaoImpl implements WebSiteImagesTypeDao{

	
	public int createImageType(WebSiteImagesType type) {
		this.insert("WebSiteImagesTypeMapper.createImageType", type);
		return type.getTypeId();
	}

	
	public List<WebSiteImagesType> queryAllTypeList() {
		return this.selectList("WebSiteImagesTypeMapper.queryAllTypeList", null);
	}

	
	public void deleteTypeById(int typeId) {
		this.delete("WebSiteImagesTypeMapper.deleteTypeById", typeId);
	}

	
	public void updateType(WebSiteImagesType type) {
		this.update("WebSiteImagesTypeMapper.updateType", type);
	}

}

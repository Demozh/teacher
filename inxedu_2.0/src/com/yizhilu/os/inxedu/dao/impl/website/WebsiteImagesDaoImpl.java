package com.yizhilu.os.inxedu.dao.impl.website;


import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.website.WebsiteImagesDao;
import com.yizhilu.os.inxedu.entity.website.WebsiteImages;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 *广告图Dao层实现
 */
@Repository("websiteImagesDao")
public class WebsiteImagesDaoImpl extends GenericDaoImpl implements WebsiteImagesDao {

	
	public int creasteImage(WebsiteImages image) {
		this.insert("WebsiteImagesMapper.creasteImage", image);
		return image.getImageId();
	}

	
	public List<Map<String,Object>> queryImagePage(WebsiteImages image, PageEntity page) {
		return this.queryForListPage("WebsiteImagesMapper.queryImagePage", image, page);
	}

	
	public WebsiteImages queryImageById(int imageId) {
		return this.selectOne("WebsiteImagesMapper.queryImageById", imageId);
	}

	
	public void deleteImages(String imageIds) {
		this.delete("WebsiteImagesMapper.deleteImages", imageIds);
	}

	
	public void updateImage(WebsiteImages image) {
		this.update("WebsiteImagesMapper.updateImage", image);
		
	}

	
	public List<WebsiteImages> queryImagesByType() {
		return this.selectList("WebsiteImagesMapper.queryImagesByType", null);
	}
}

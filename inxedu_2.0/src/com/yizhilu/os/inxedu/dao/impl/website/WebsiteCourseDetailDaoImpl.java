package com.yizhilu.os.inxedu.dao.impl.website;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.website.WebsiteCourseDetailDao;
import com.yizhilu.os.inxedu.entity.website.WebsiteCourseDetail;
import com.yizhilu.os.inxedu.entity.website.WebsiteCourseDetailDTO;

/**
 *
 * 推荐课程关联Dao层
 */
 @Repository("websiteCourseDetailDao")
public class WebsiteCourseDetailDaoImpl extends GenericDaoImpl implements WebsiteCourseDetailDao {

	
	public void createWebsiteCourseDetail(String detail) {
		this.insert("WebsiteCourseDetailMapper.createWebsiteCourseDetail", detail);
	}

	
	public List<WebsiteCourseDetailDTO> queryCourseDetailPage(WebsiteCourseDetailDTO dto, PageEntity page) {
		return this.queryForListPage("WebsiteCourseDetailMapper.queryCourseDetailPage", dto, page);
	}

	
	public void deleteDetailById(int id) {
		this.delete("WebsiteCourseDetailMapper.deleteDetailById", id);
	}

	
	public void updateSort(Map<String, Integer> map) {
		this.update("WebsiteCourseDetailMapper.updateSort", map);
	}

	
	public List<WebsiteCourseDetail> queryDetailListByrecommendId(int recommendId) {
		return this.selectList("WebsiteCourseDetailMapper.queryDetailListByrecommendId", recommendId);
	}
}

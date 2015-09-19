package com.yizhilu.os.inxedu.service.impl.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.dao.website.WebsiteCourseDao;
import com.yizhilu.os.inxedu.entity.website.WebsiteCourse;
import com.yizhilu.os.inxedu.service.website.WebsiteCourseService;

/**
 * 推荐课程分类管理接口
 */
@Service("websiteCourseService")
public class WebsiteCourseServiceImpl implements WebsiteCourseService {
	@Autowired
	private WebsiteCourseDao websiteCourseDao;
	 /**
     * 推荐课程分类列表
     */
    public List<WebsiteCourse> queryWebsiteCourseList(){
    	return websiteCourseDao.queryWebsiteCourseList();
    }
    /**
     * 查询推荐课程分类
     */
    public WebsiteCourse queryWebsiteCourseById(int id){
    	return websiteCourseDao.queryWebsiteCourseById(id);
    }
    /**
     * 修改推荐课程分类
     */
    public void updateWebsiteCourseById(WebsiteCourse websiteCourse){
    	websiteCourseDao.updateWebsiteCourseById(websiteCourse);
    }
    /**
     * 添加推荐课程分类
     */
    public void addWebsiteCourse(WebsiteCourse websiteCourse){
    	websiteCourseDao.addWebsiteCourse(websiteCourse);
    }
    /**
     * 删除推荐课程分类及分类下推荐课程
     */
    public void deleteWebsiteCourseDetailById(int id){
    	websiteCourseDao.deleteWebsiteCourseDetailById(id);
    }
}
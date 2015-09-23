package com.inxedu.os.controller.course;


import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.entity.kpoint.CourseKpoint;
import com.inxedu.os.entity.kpoint.CourseKpointDto;
import com.inxedu.os.service.course.CourseKpointService;

/**
 * CourseKpoint管理接口
 */
@Controller
@RequestMapping("/admin")
public class AdminKpointController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(AdminKpointController.class);

	// 章节列表
	private static final String kpointList = getViewPath("/admin/kpoint/kpoint_list");// 章节列表

    // 绑定变量名字和属性，参数封装进类
    @InitBinder("courseKpoint")
    public void initBinderCourseKpoint(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("courseKpoint.");
    }

    @Autowired
    private CourseKpointService courseKpointService;
    
    
    @RequestMapping("/kpoint/updateparentid/{parentId}/{kpointId}")
    public Map<String,Object> updateKpointParentId(@PathVariable("parentId") int parentId,@PathVariable("kpointId") int kpointId){
    	try{
    		courseKpointService.updateKpointParentId(kpointId, parentId);
    		this.setJson(true, null, null);
    	}catch (Exception e) {
    		this.setAjaxException();
			logger.error("updateKpointParentId()---error",e);
		}
    	return json;
    }
    
    /**
     * 删除视频节点
     * @param kpointIds 视频ID串
     * @return Map<String,Object>
     */
    @RequestMapping("/kpoint/deletekpoint/{kpointIds}")
    @ResponseBody
    public Map<String,Object> deleteKpoint(@PathVariable("kpointIds") String kpointIds){
    	try{
    		courseKpointService.deleteKpointByIds(kpointIds);
    		this.setJson(true, null, null);
    	}catch (Exception e) {
    		this.setAjaxException();
			logger.error("deleteKpoint()---error",e);
		}
    	return json;
    }
    
    /**
     * 修改视频节点
     * @param courseKpoint 
     * @return Map<String,Object>
     */
    @RequestMapping("/kpoint/updateKpoint")
    @ResponseBody
    public Map<String,Object> updateKpoint(@ModelAttribute("courseKpoint") CourseKpoint courseKpoint){
    	try{
    		courseKpointService.updateKpoint(courseKpoint);
    		this.setJson(true, null, courseKpoint);
    	}catch (Exception e) {
    		this.setAjaxException();
			logger.error("updateKpoint()---error",e);
		}
    	return json;
    }
    
    /**
     * 通过过ID，查询视频详情
     * @param kpointId 视频ID
     * @return Map<String,Object>
     */ 
    @RequestMapping("/kpoint/getkpoint/{kpointId}")
    @ResponseBody
    public Map<String,Object> queryCourseKpointById(@PathVariable("kpointId") int kpointId){
    	try{
    		CourseKpointDto kpoint = courseKpointService.queryCourseKpointById(kpointId);
    		this.setJson(true, null, kpoint);
    	}catch (Exception e) {
			this.setAjaxException();
			logger.error("queryCourseKpointById()--error",e);
		}
    	return json;
    }
    
    /**
     * 创建节点视频
     * @param courseKpoint
     * @return Map<String,Object>
     */
    @RequestMapping("/kpoint/addkpoint")
    @ResponseBody
    public Map<String,Object> addKpoint(@ModelAttribute("courseKpoint") CourseKpoint courseKpoint){
    	try{
    		courseKpoint.setAddTime(new Date());
    		courseKpoint.setFree(1);
    		courseKpointService.addCourseKpoint(courseKpoint);
    		this.setJson(true, null, courseKpoint);
    	}catch (Exception e) {
    		this.setAjaxException();
			logger.error("addKpoint()--error",e);
		}
    	return json;
    }

    /**
     * 课程的视频列表
     */
    @RequestMapping("/kpoint/list/{courseId}")
    public ModelAndView showKpointList(HttpServletRequest request, @PathVariable("courseId") int courseId) {
    	ModelAndView model = new ModelAndView();
    	try {
    		model.setViewName(kpointList);
    		List<CourseKpoint> kpointList = courseKpointService.queryCourseKpointByCourseId(courseId);
    		model.addObject("kpointList", gson.toJson(kpointList));
    		model.addObject("courseId", courseId);
    	} catch (Exception e) {
            logger.error("showKpointList()---error", e);
            model.setViewName(this.setExceptionRequest(request, e));
        }
        return model;
    }


}
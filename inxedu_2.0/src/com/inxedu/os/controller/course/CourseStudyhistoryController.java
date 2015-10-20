package com.inxedu.os.controller.course;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import org.springframework.common.entity.PageEntity;
import org.springframework.cache.EHCacheUtil;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.entity.course.CourseStudyhistory;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.course.CourseStudyhistoryService;

/**
 * CourseStudyhistory Controller
 */
@Controller
public class CourseStudyhistoryController extends BaseController{

 	@Autowired
    private CourseStudyhistoryService courseStudyhistoryService;
 	private String studyHistory = getViewPath("/ucenter/study_list");// 学习记录
 	private String ajax_studyHistory = getViewPath("/course/ajax_study_history");// 学习记录ajax

    private Logger logger = LoggerFactory.getLogger(CourseStudyhistoryController.class);
 	@Autowired
    private CourseService courseService;
 	
 	/**
	 * 添加播放次数 ,播放记录
	 * 
	 * @param model
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/couserStudyHistory/ajax/playertimes")
	@ResponseBody
	public Object addCoursePlayerTime(HttpServletRequest request, @ModelAttribute("courseId") Long courseId,
			@ModelAttribute("kpointId") Long kpointId) {
		// 要更新3个表 edu_course_profile,edu_course_studyhistory,edu_course_kpoint
		try {
			CourseStudyhistory courseStudyhistory = new CourseStudyhistory();
			courseStudyhistory.setCourseId(courseId);
			courseStudyhistory.setKpointId(kpointId);
			courseStudyhistory.setUserId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));
			courseStudyhistoryService.playertimes(courseStudyhistory);
			this.setJson(true, "", null);
		} catch (Exception e) {
			logger.error("CourseStudyhistoryController.addCoursePlayerTime()",e);
			return setExceptionRequest(request, e);
		}
		return json;
	}
 	
	/**
	 * 学过此课程的用户
	 * @return
	 */
	@RequestMapping("/couserStudyHistory/ajax/courseLearnedUser/{courseId}")
	@ResponseBody
	public Object getCourseLearnedUser(HttpServletRequest request, @PathVariable("courseId") Long courseId) {
		try {
			//从缓存中获取
			//学习此课程的总人数
			Long couStudyhistorysLearnedCount=(Long)EHCacheUtil.get("COURSE_LEARNED_USER_COUNT_"+courseId);
			//学习此课程的人 (最新8个)
			List<CourseStudyhistory> couStudyhistorysLearned=(List<CourseStudyhistory>)EHCacheUtil.get("COURSE_LEARNED_USER_"+courseId);
			if(couStudyhistorysLearned==null||couStudyhistorysLearned.size()==0){
				couStudyhistorysLearned=courseStudyhistoryService.getCourseStudyhistoryListByCouId(Long.valueOf(String.valueOf(courseId)));
				EHCacheUtil.set("COURSE_LEARNED_USER_"+courseId, couStudyhistorysLearned,3600);//缓存一小时
				
				couStudyhistorysLearnedCount=Long.valueOf(courseStudyhistoryService.getCourseStudyhistoryCountByCouId(courseId));
				EHCacheUtil.set("COURSE_LEARNED_USER_COUNT_"+courseId, couStudyhistorysLearnedCount,3600);//缓存一小时
			}
			this.setJson(true, String.valueOf(couStudyhistorysLearnedCount), couStudyhistorysLearned);
		} catch (Exception e) {
			logger.error("CourseStudyhistoryController.getCourseLearnedUser()",e);
			this.setJson(false, "","");
		}
		return json;
	}
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	/**
     * 学习记录
     * @param request
     * @param page
     * @return
     */
    @RequestMapping("/uc/study")
    public ModelAndView studyHistory(HttpServletRequest request, @ModelAttribute("page") PageEntity page) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(studyHistory);
        CourseStudyhistory courseStudyhistory = new CourseStudyhistory();
        try {
        	page.setPageSize(3);
        	this.setPage(page);
            courseStudyhistory.setUserId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));
            List<CourseStudyhistory> studylist = courseStudyhistoryService.getCourseStudyhistoryListByCondition(courseStudyhistory, page);
			// 获得所有推荐课程
			//Map<String, List<CourseDto>> mapCourseList = courseService.getCourseListByHomePage(0L);
            modelAndView.addObject("studylist", studylist);
			//modelAndView.addObject("mapCourseList", mapCourseList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    /**
     * 学习记录 ajax
     * @param request
     * @param page
     * @return
     */
    @RequestMapping("/course/ajax/his")
    public Object studyHistory(HttpServletRequest request ) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            PageEntity page = new PageEntity();
            CourseStudyhistory courseStudyhistory = new CourseStudyhistory();
            courseStudyhistory.setUserId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));
            List<CourseStudyhistory> studylist = courseStudyhistoryService.getCourseStudyhistoryListByCondition(courseStudyhistory, page);
            modelAndView.addObject("studylist", studylist);
            modelAndView.setViewName(ajax_studyHistory);
        } catch (Exception e) {
            return new ModelAndView(this.setExceptionRequest(request, e));
        }
        return modelAndView;
    }
    
   
}
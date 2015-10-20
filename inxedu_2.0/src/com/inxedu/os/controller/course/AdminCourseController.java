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
import org.springframework.common.entity.PageEntity;
import com.inxedu.os.common.util.WebUtils;
import com.inxedu.os.entity.course.Course;
import com.inxedu.os.entity.course.CourseDto;
import com.inxedu.os.entity.course.QueryCourse;
import com.inxedu.os.entity.subject.QuerySubject;
import com.inxedu.os.entity.subject.Subject;
import com.inxedu.os.entity.website.WebsiteCourse;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.course.CourseTeacherService;
import com.inxedu.os.service.subject.SubjectService;
import com.inxedu.os.service.teacher.TeacherService;
import com.inxedu.os.service.website.WebsiteCourseService;

/**
 * 后台课程管理
 */
@Controller
@RequestMapping("/admin")
public class AdminCourseController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCourseController.class);

	// 课程列表
	private static final String showCourseList = getViewPath("/admin/course/course_list");//课程列表
	private static final String toAddCourse = getViewPath("/admin/course/add_course");//添加课程
    private static final String showRecommendCourseList = getViewPath("/admin/course/course_recommend_list");//课程列表(推荐课程)
	private static final String update_course=getViewPath("/admin/course/update_course");//更新课程

	@Autowired
	private CourseService courseService;
	@Autowired
	private SubjectService subjectService;
    @Autowired
    private CourseTeacherService courseTeacherService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private WebsiteCourseService websiteCourseService;
	// 绑定变量名字和属性，参数封装进类
	@InitBinder("queryCourse")
	public void initBinderQueryCourse(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("queryCourse.");
	}

	@InitBinder("course")
	public void initBinderCourse(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("course.");
	}

	/**
	 * 课程列表展示
	 */
	@RequestMapping("/cou/list")
	public ModelAndView showCourseList(HttpServletRequest request, @ModelAttribute("page") PageEntity page, @ModelAttribute("queryCourse") QueryCourse queryCourse) {
		ModelAndView model = new ModelAndView();
		try {
			page.setPageSize(14);
			model.setViewName(showCourseList);
			queryCourse.setIsavaliable(1);
			//查询课程
			List<CourseDto> courseList = courseService.queryCourseListPage(queryCourse, page);
			model.addObject("page", page);
			model.addObject("courseList", courseList);
			model.addObject("queryCourse", queryCourse);
			//查询专业
            QuerySubject querySubject = new QuerySubject();
			List<Subject> subjectList = subjectService.getSubjectList(querySubject);
			model.addObject("subjectList", gson.toJson(subjectList));
			request.getSession().setAttribute("courseListUri", WebUtils.getServletRequestUriParms(request));
		} catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("CourseController.showCourseList", e);
		}
		return model;
	}

    /**
     * 到添加课程页面
     */
    @RequestMapping("/cou/toAddCourse")
    public ModelAndView toAddCourse(HttpServletRequest request) {
    	ModelAndView model = new ModelAndView();
        try {
        	model.setViewName(toAddCourse);
            //查询专业
            QuerySubject querySubject = new QuerySubject();
            List<Subject> subjectList = subjectService.getSubjectList(querySubject);
            model.addObject("subjectList", gson.toJson(subjectList));
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("CourseController.toAddCourse", e);
        }
        return model;
    }
    
    /**
     * 添加课程
     * @param request
     * @param course 课程对象
     * @return ModelAndView
     */
    @RequestMapping("/cou/addCourse")
    public ModelAndView addCourse(HttpServletRequest request,@ModelAttribute("course") Course course){
    	ModelAndView model = new ModelAndView();
    	try{
    		model.setViewName("redirect:/admin/cou/list");
    		course.setAddTime(new Date());
    		course.setUpdateTime(new Date());
    		course.setIsavaliable(1);
    		courseService.addCourse(course);
    		//添加课程与讲师的关联数据
    		this.addCourseTeacher(request, course);
    	}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
		}
    	return model;
    }

    /**
     * 添加课程与讲师的关联数据
     * @param request
     * @param course 课程
     */
	private void addCourseTeacher(HttpServletRequest request, Course course) {
		courseTeacherService.deleteCourseTeacher(course.getCourseId());
		String teacherIds = request.getParameter("teacherIdArr");
		if(teacherIds!=null && teacherIds.trim().length()>0){
			String[] tcIdArr = teacherIds.split(",");
			StringBuffer val = new StringBuffer();
			for(int i=0;i<tcIdArr.length;i++){
				if(i<tcIdArr.length-1){
					val.append("("+course.getCourseId()+","+tcIdArr[i]+"),");
				}else{
					val.append("("+course.getCourseId()+","+tcIdArr[i]+")");
				}
			}
			courseTeacherService.addCourseTeacher(val.toString());
		}
	}
    
    /**
     * 初始化修改页面
     * @param request
     * @param courseId 课程ID
     * @return ModelAndView
     */
    @RequestMapping("/cou/initUpdate/{courseId}")
    public ModelAndView initUpdatePage(HttpServletRequest request,@PathVariable("courseId") int courseId){
    	ModelAndView model = new ModelAndView();
    	try{
    		model.setViewName(update_course);
    		Course course = courseService.queryCourseById(courseId);
    		model.addObject("course", course);
    		 //查询专业
            QuerySubject querySubject = new QuerySubject();
            List<Subject> subjectList = subjectService.getSubjectList(querySubject);
            model.addObject("subjectList", gson.toJson(subjectList));
            
            //查询课程所属老师
            List<Map<String,Object>> teacherList = teacherService.queryCourseTeacerList(course.getCourseId());
            model.addObject("teacherList", gson.toJson(teacherList));
    	}catch (Exception e) {
    		model.setViewName(this.setExceptionRequest(request, e));
			logger.error("initUpdatePage()---error",e);
		}
    	return model;
    }
    
    /**
     * 修改课程
     * @param request
     * @param course 课程数据
     * @return ModelAndView
     */
    @RequestMapping("/cou/updateCourse")
    public ModelAndView updateCourse(HttpServletRequest request,@ModelAttribute("course") Course course){
    	ModelAndView model = new ModelAndView();
    	try{
    		model.setViewName("redirect:/admin/cou/list");
    		course.setUpdateTime(new Date());
    		courseService.updateCourse(course);
    		Object uri = request.getSession().getAttribute("courseListUri");
    		if(uri!=null){
    			model.setViewName("redirect:"+uri.toString());
    		}
    		//修改课程与讲师的关联数
    		this.addCourseTeacher(request, course);
    	}catch (Exception e) {
    		model.setViewName(this.setExceptionRequest(request, e));
			logger.error("updateCourse()--error",e);
		}
    	return model;
    }
    
    /**
     * 删除课程
     * @param courseId 课程ID
     * @param type 1正常 2删除
     * @return Map<String,Object>
     */
    @RequestMapping("/cou/avaliable/{courseId}/{type}")
    @ResponseBody
    public Map<String,Object> avaliable(@PathVariable("courseId") int courseId,@PathVariable("type") int type){
    	try{
    		courseService.updateAvaliableCourse(courseId,type);
    		this.setJson(true, null, null);
    	}catch (Exception e) {
			this.setAjaxException();
			logger.error("avaliable()--error",e);
		}
    	return json;
    }

    /**
     * 推荐选择课程列表
     * @param request
     * @return ModelAndView
     */
    @RequestMapping("/cou/showrecommendList")
    public ModelAndView showRecommendCourseList(HttpServletRequest request, @ModelAttribute("page") PageEntity page, @ModelAttribute("queryCourse") QueryCourse queryCourse){
    	ModelAndView model = new ModelAndView();
    	try{
    		model.setViewName(showRecommendCourseList);
    		//查询课程
    		queryCourse.setIsavaliable(1);
			List<CourseDto> courseList = courseService.queryCourseListPage(queryCourse, page);
			model.addObject("page", page);
			model.addObject("courseList", courseList);
			model.addObject("queryCourse", queryCourse);
			//查询专业
            QuerySubject querySubject = new QuerySubject();
			List<Subject> subjectList = subjectService.getSubjectList(querySubject);
			model.addObject("subjectList", gson.toJson(subjectList));
			
			//查询推荐分类
			List<WebsiteCourse> webstieList = websiteCourseService.queryWebsiteCourseList();
			model.addObject("webstieList", webstieList);
    	}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("showRecommendCourseList()--error",e);
		}
    	return model;
    }

}
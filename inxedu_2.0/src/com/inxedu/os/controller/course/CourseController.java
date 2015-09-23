package com.inxedu.os.controller.course;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.ObjectUtils;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.entity.course.Course;
import com.inxedu.os.entity.course.CourseDto;
import com.inxedu.os.entity.course.CourseFavorites;
import com.inxedu.os.entity.course.QueryCourse;
import com.inxedu.os.entity.kpoint.CourseKpoint;
import com.inxedu.os.entity.subject.QuerySubject;
import com.inxedu.os.entity.subject.Subject;
import com.inxedu.os.entity.teacher.QueryTeacher;
import com.inxedu.os.entity.teacher.Teacher;
import com.inxedu.os.service.course.CourseFavoritesService;
import com.inxedu.os.service.course.CourseKpointService;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.order.OrderService;
import com.inxedu.os.service.subject.SubjectService;
import com.inxedu.os.service.teacher.TeacherService;
/**
 * Course管理接口
 */
@Controller
public class CourseController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
    // 课程列表
    private static final String showCourseList = getViewPath("/web/course/courses-list");
    // 课程详情
    private static final String couinfo = getViewPath("/web/course/course-infor");
    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private SubjectService subjectService;
	@Autowired
	private CourseFavoritesService courseFavoritesService;
	@Autowired
	private CourseKpointService courseKpointService;
	@Autowired
	private OrderService orderService;
    // 绑定变量名字和属性，参数封装进类
    @InitBinder("queryCourse")
    public void initBinderQueryCourse(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("queryCourse.");
    }
    @InitBinder("courseFavorites")
    public void initBinderCourseFavorites(WebDataBinder binder) {
    	binder.setFieldDefaultPrefix("courseFavorites.");
    }

    /**
     * 课程列表展示,搜索课程
     */
    @RequestMapping("/front/showcoulist")
    public ModelAndView showCourseList(HttpServletRequest request, @ModelAttribute("page") PageEntity page, @ModelAttribute("queryCourse") QueryCourse queryCourse) {
        ModelAndView model = new ModelAndView();
        try {
        	model.setViewName(showCourseList);
            // 页面传来的数据放到page中
        	page.setPageSize(12);
            //只查询上架的
            queryCourse.setIsavaliable(1);
            // 搜索课程列表
            List<CourseDto> courseList = courseService.queryWebCourseListPage(queryCourse, page);
            model.addObject("courseList", courseList);
            
            // 查询所有1级专业
            QuerySubject querySubject = new QuerySubject();
            querySubject.setParentId(0);
            List<Subject> subjectList = subjectService.getSubjectList(querySubject);
            
            
            //根据条件专业查询 所有的子专业
            if (ObjectUtils.isNotNull(queryCourse.getSubjectId())) {
                Subject subject = new Subject();
                subject.setSubjectId(queryCourse.getSubjectId());
                subject = subjectService.getSubjectBySubject(subject);
                //查询子专业
                List<Subject> sonSubjectList = null;
                if (subject.getParentId() != 0) {//条件为二级专业
                    sonSubjectList = subjectService.getSubjectListByOne(Long.valueOf(subject.getParentId()));
                    
                    model.addObject("subjectParentId", subject.getParentId());//父级id
                } else {//条件为一级专业
                    sonSubjectList = subjectService.getSubjectListByOne(Long.valueOf(subject.getSubjectId()));
                }
                model.addObject("sonSubjectList", sonSubjectList);
            }
            
            // 全部教师
            QueryTeacher query = new QueryTeacher();
            List<Teacher> teacherList =teacherService.queryTeacherList(query);
            
            model.addObject("page",page);
            model.addObject("queryCourse", queryCourse);
            model.addObject("teacherList", teacherList);
            model.addObject("subjectList", subjectList);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("showCourseList()--error", e);
        }
        return model;
    }

    /**
     * 课程详情
     * 不管是课程套餐还是课程目录时都放到list(coursePackageList)中
     */
    @RequestMapping("/front/couinfo/{id}")
    public ModelAndView couinfo(HttpServletRequest request, @PathVariable("id") int courseId) {
        ModelAndView model = new ModelAndView();
    	try {
    		model.setViewName(couinfo);
            // 查询课程详情
            Course course = courseService.queryCourseById(courseId);
            //判断该课程是否可以观看
        	boolean isok=false;
            if(course!=null){
            	model.addObject("course", course);
            	//查询课程老师
            	List<Map<String,Object>> teacherList = teacherService.queryCourseTeacerList(courseId);
            	model.addObject("teacherList", teacherList);
            	//相关课程
            	List<CourseDto> courseList = courseService.queryInterfixCourseLis(course.getSubjectId(), 5,course.getCourseId());
            	for(CourseDto tempCoursedto : courseList){
            		teacherList=teacherService.queryCourseTeacerList(tempCoursedto.getCourseId());
            		tempCoursedto.setTeacherList(teacherList);
            	}
            	model.addObject("courseList", courseList);
            	int userId = SingletonLoginUtils.getLoginUserId(request);
            	if(userId>0){
            		isok = orderService.checkUserCursePay(userId, courseId);
            		
            		//查询是否已经收藏
        			boolean isFavorites = courseFavoritesService.checkFavorites(userId, courseId);
        			model.addObject("isFavorites", isFavorites);
            	}
            	//如果课程价格为0可以观看
            	if(course.getCurrentPrice().compareTo(new BigDecimal(0))==0){
            		isok=true;
            	}
            	//查询目录
            	List<CourseKpoint> parentKpointList = new ArrayList<CourseKpoint>();
            	List<CourseKpoint> kpointList = courseKpointService.queryCourseKpointByCourseId(courseId);
            	if(kpointList!=null && kpointList.size()>0){
            		for(CourseKpoint temp:kpointList){
                		if (temp.getParentId()==0) {
                			parentKpointList.add(temp);
    					}
                		//如果没有观看权限则清空视频URL避免被盗看
                		if (isok ==false) {
                			//设置收费的视频URL为空
                			if(temp.getFree()==2){
                    			temp.setVideoUrl(null);
                			}
						}
                	}
            		String freeVideoUrl="";
            		for(CourseKpoint tempParent:parentKpointList){
                		for(CourseKpoint temp:kpointList){
                    		if (temp.getParentId()==tempParent.getKpointId()) {
                    			tempParent.getKpointList().add(temp);
        					}
                    		//获取一个可以试听的视频地址
                    		if (freeVideoUrl.equals("")&&temp.getFree()==1) {
                    			freeVideoUrl=temp.getVideoUrl();
                    			model.addObject("freeVideoUrl",freeVideoUrl);
							}
                    	}
                	}
                	model.addObject("parentKpointList", parentKpointList);
            	}
            }
            model.addObject("isok", isok);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("couinfo()----error", e);
        }
        return model;
    }
    
    /**
     * 添加课程收藏
     */
    @RequestMapping("/front/createfavorites/{courseId}")
    @ResponseBody
    public Map<String,Object> createFavorites(HttpServletRequest request,@ModelAttribute("courseFavorites") CourseFavorites courseFavorites,@PathVariable("courseId") int courseId){
    	try{
    		int userId = SingletonLoginUtils.getLoginUserId(request);
    		if(userId<=0){
    			this.setJson(false, "请登录！", null);
    			return json;
    		}
    		if(courseId<=0){
    			this.setJson(false, "请选择要收藏的课程！", null);
    			return json;
    		}
    		boolean is = courseFavoritesService.checkFavorites(userId, courseId);
    		if(is){
    			this.setJson(false, "该课程你已经收藏过了！", null);
    			return json;
    		}
    		courseFavorites.setUserId(userId);
    		courseFavorites.setAddTime(new Date());
    		courseFavoritesService.createCourseFavorites(courseFavorites);
    		this.setJson(true, "收藏成功", null);
    	}catch (Exception e) {
    		this.setAjaxException();
			logger.error("createFavorites()--error",e);
		}
    	return json;
    }
}
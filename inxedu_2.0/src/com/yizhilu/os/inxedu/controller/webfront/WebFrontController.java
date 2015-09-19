package com.yizhilu.os.inxedu.controller.webfront;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yizhilu.os.inxedu.common.constants.CacheConstans;
import com.yizhilu.os.inxedu.common.controller.BaseController;
import com.yizhilu.os.inxedu.common.service.cache.EHCacheUtil;
import com.yizhilu.os.inxedu.common.util.ObjectUtils;
import com.yizhilu.os.inxedu.entity.common.Comment;
import com.yizhilu.os.inxedu.entity.course.CourseDto;
import com.yizhilu.os.inxedu.entity.course.QueryCourse;
import com.yizhilu.os.inxedu.entity.order.Order;
import com.yizhilu.os.inxedu.entity.system.SysFunction;
import com.yizhilu.os.inxedu.entity.teacher.QueryTeacher;
import com.yizhilu.os.inxedu.entity.teacher.Teacher;
import com.yizhilu.os.inxedu.entity.website.WebsiteImages;
import com.yizhilu.os.inxedu.service.comment.CommentService;
import com.yizhilu.os.inxedu.service.course.CourseService;
import com.yizhilu.os.inxedu.service.order.OrderService;
import com.yizhilu.os.inxedu.service.teacher.TeacherService;
import com.yizhilu.os.inxedu.service.website.WebsiteImagesService;

/**
 * 前台 controller
 */
@Controller
public class WebFrontController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(WebFrontController.class);
	//首页
	private static String getIndexpage = getViewPath("/web/front/index");
	private static String huanyihuan = getViewPath("/web/front/ajax-course-recommend");
	private static String bna = getViewPath("/web/front/ajax-course-bna");
	//学员动态
	private static String studentDynamic = getViewPath("/web/front/ajax-student-dynamic");
	//忘记密码
	private static String passwordPage=getViewPath("/web/user/password-recovery");
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private WebsiteImagesService websiteImagesService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CommentService commentService;
	
	/**
	 * 首页获取网站首页数据
	 */
	@RequestMapping("/index")
	public String getIndexpage(HttpServletRequest request, Model model) {
		try {
			// 获得banner图
			Map<String, List<WebsiteImages>> websiteImages = websiteImagesService.queryImagesByType();
			model.addAttribute("websiteImages", websiteImages);
			
			// 查询排序最高的4位老师
			List<Teacher> teacherList=(List<Teacher>)EHCacheUtil.get(CacheConstans.INDEX_TEACHER_RECOMMEND);
			if(teacherList==null||teacherList.size()==0){
				QueryTeacher queryTeacher = new QueryTeacher();
				queryTeacher.setCount(4);
				teacherList = teacherService.queryTeacherList(queryTeacher);
				EHCacheUtil.set(CacheConstans.INDEX_TEACHER_RECOMMEND, teacherList,CacheConstans.RECOMMEND_COURSE_TIME);//缓存一小时
			}
			model.addAttribute("teacherList", teacherList);
			
			//课程互动
			Comment comment = new Comment();
			comment.setLimitNumber(10);
			List<Comment> commentList = commentService.queryCommentInteraction(comment);
			model.addAttribute("commentList", commentList);
		} catch (Exception e) {
			logger.error("WebFrontController.getIndexpage", e);
			return setExceptionRequest(request, e);
		}
		return getIndexpage;
	}

	// 首页为你推荐换一换功能
	@RequestMapping("/index/ajax/huanyihuan")
	public String queryRecommenCourseListByRecommendId(HttpServletRequest request) {
		try {
			// RecommendId是分类Id
			// 获得为你推荐的课程
			List<CourseDto> courseDtoList = courseService.queryRecommenCourseListByRecommendId(2l, 4l);
			request.setAttribute("courseDtoList", courseDtoList);
		} catch (Exception e) {
			logger.error("WebFrontController.queryRecommenCourseListByRecommendId", e);
			return setExceptionRequest(request, e);
		}
		return huanyihuan;
	}

	// 首页学生动态
		@RequestMapping("/index/ajax/studentDynamic")
		public String studentDynamic(HttpServletRequest request) {
			try {
				 List<Order> orderList = (List<Order>) EHCacheUtil.get(CacheConstans.INDEX_STUDENT_DYNAMIC);
			        if(ObjectUtils.isNull(orderList)){
			        	Order order = new Order();
			        	order.setLimitNum(4);
			        	orderList = orderService.queryOrder(order);
			        	EHCacheUtil.set(CacheConstans.INDEX_STUDENT_DYNAMIC,orderList);
			        }
				request.setAttribute("orderList", orderList);
			} catch (Exception e) {
				logger.error("studentDynamic", e);
				return setExceptionRequest(request, e);
			}
			return studentDynamic;
		}
		
	// 首页精品课程、最新课程、全部课程
	@RequestMapping("/index/ajax/bna")
	public String queryCourse(HttpServletRequest request) {
		try {
			String order = request.getParameter("order");
			if (order != null && !order.equals("")) {
				QueryCourse queryCourse = new QueryCourse();
				queryCourse.setOrder(order);
				//只查询上架的
	            queryCourse.setIsavaliable(1);
				// 获得精品课程、最新课程、全部课程
				List<CourseDto> courseDtoBNAList = courseService.queryCourse(queryCourse);
				request.setAttribute("queryCourse", queryCourse);
				request.setAttribute("courseDtoBNAList", courseDtoBNAList);
			}
		} catch (Exception e) {
			logger.error("WebFrontController.queryCourse", e);
			return setExceptionRequest(request, e);
		}
		return bna;
	}
	/**
	 * 跳转找回密码页面
	 */
	@RequestMapping("/front/passwordRecovery")
	public ModelAndView passWordRecovery(){
		return new ModelAndView(passwordPage);
	}
}

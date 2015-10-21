package com.inxedu.os.controller.webfront;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.asual.lesscss.LessEngine;
import com.inxedu.os.common.constants.CacheConstans;
import com.inxedu.os.common.controller.BaseController;
import org.springframework.cache.EHCacheUtil;
import org.springframework.web.util.ObjectUtils;
import com.inxedu.os.entity.common.Comment;
import com.inxedu.os.entity.course.CourseDto;
import com.inxedu.os.entity.course.QueryCourse;
import com.inxedu.os.entity.order.Order;
import com.inxedu.os.entity.teacher.QueryTeacher;
import com.inxedu.os.entity.teacher.Teacher;
import com.inxedu.os.entity.website.WebsiteImages;
import com.inxedu.os.service.comment.CommentService;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.order.OrderService;
import com.inxedu.os.service.teacher.TeacherService;
import com.inxedu.os.service.website.WebsiteImagesService;

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
			model.addAttribute("num", new Date().getDate());
			// 获得banner图
			Map<String, List<WebsiteImages>> websiteImages = websiteImagesService.queryImagesByType();
			model.addAttribute("websiteImages", websiteImages);
			//不同的主题显示不同的颜色
			String cacheColor=(String)EHCacheUtil.get("inxedu_index_theme_color");
			if(StringUtils.isNotEmpty(cacheColor)){
				if("blue".equals(cacheColor)){
					List<WebsiteImages> websiteImagesList = websiteImages.get("type_16");
					model.addAttribute("websiteImagesList", websiteImagesList);
				}
				if("green".equals(cacheColor)){
					List<WebsiteImages> websiteImagesList = websiteImages.get("type_17");
					model.addAttribute("websiteImagesList", websiteImagesList);
				}
				if("orange".equals(cacheColor)){
					List<WebsiteImages> websiteImagesList = websiteImages.get("type_1");
					model.addAttribute("websiteImagesList", websiteImagesList);
				}
			}else{
				changeColor(request,"orange");
				List<WebsiteImages> websiteImagesList = websiteImages.get("type_1");
				model.addAttribute("websiteImagesList", websiteImagesList);
			}
			model.addAttribute("theme_color", (String)EHCacheUtil.get("inxedu_index_theme_color"));
			
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
	
	/** 
	 * 修改主题色
	 * 
	 */
    @RequestMapping("/theme/ajax/update")
    @ResponseBody
    public Object updateTheme(HttpServletRequest request,@RequestParam String color) {
		changeColor(request,color);
		this.setJson(true, color, "");
		return json;
    }
    
    public void changeColor(HttpServletRequest request,String colorfalg){
    	String color="#ea562e";
    	if (colorfalg.equals("blue")) {
    		color="#009ed9";
		}else if (colorfalg.equals("green")) {
    		color="#68cb9b";
		}
    	
    	//放入缓存
    	EHCacheUtil.set("inxedu_index_theme_color",colorfalg,21600);//缓存六小时
    	//获得项目根目录
    	String strDirPath = request.getSession().getServletContext().getRealPath("/");     	
    	//读取字符串
    	StringBuffer sb = new StringBuffer();
    	//当前读取行数
    	int rowcount = 1 ;
    	//要修改的行数
    	int updaterowcount = 2 ;
    	FileReader fr;
    	try {
			String path = strDirPath+"/static/inxweb/css/less/theme.less";
			fr = new FileReader(path);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			while (line != null) {
				if(rowcount==updaterowcount&&StringUtils.isNotEmpty(color)){
					sb.append("@mColor:"+color+";");
				}else{
					sb.append(line);
				}
				line = br.readLine();
				rowcount++;
			}
			br.close();
			fr.close();
			LessEngine engine = new LessEngine();
			FileWriter fw = new FileWriter(strDirPath+"/static/inxweb/css/theme.css");
		    fw.write(engine.compile(sb.toString()));
			fw.flush();
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
			this.setJson(false, "系统异常", "");
		}
    }
}

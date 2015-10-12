package com.inxedu.os.controller.user;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.inxedu.os.common.constants.CacheConstans;
import com.inxedu.os.common.constants.CommonConstants;
import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.service.cache.EHCacheUtil;
import com.inxedu.os.common.service.email.EmailService;
import com.inxedu.os.common.util.MD5;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.common.util.StringUtils;
import com.inxedu.os.common.util.WebUtils;
import com.inxedu.os.constants.enums.WebSiteProfileType;
import com.inxedu.os.entity.course.Course;
import com.inxedu.os.entity.course.CourseDto;
import com.inxedu.os.entity.course.CourseStudyhistory;
import com.inxedu.os.entity.course.FavouriteCourseDTO;
import com.inxedu.os.entity.course.QueryCourse;
import com.inxedu.os.entity.kpoint.CourseKpoint;
import com.inxedu.os.entity.letter.MsgReceive;
import com.inxedu.os.entity.letter.QueryMsgReceive;
import com.inxedu.os.entity.user.User;
import com.inxedu.os.entity.user.UserLoginLog;
import com.inxedu.os.service.course.CourseFavoritesService;
import com.inxedu.os.service.course.CourseKpointService;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.course.CourseStudyhistoryService;
import com.inxedu.os.service.letter.MsgReceiveService;
import com.inxedu.os.service.order.OrderService;
import com.inxedu.os.service.teacher.TeacherService;
import com.inxedu.os.service.user.UserLoginLogService;
import com.inxedu.os.service.user.UserService;
import com.inxedu.os.service.website.WebsiteProfileService;

/**
 * 个人中心  Controller
 */
@Controller
@RequestMapping("/uc")
public class UserController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	private static String userInfo = getViewPath("/web/ucenter/user-info");
	private static String ucIndex = getViewPath("/web/ucenter/uc_index");
	private static String palyPage = getViewPath("/web/ucenter/player-video");
	private static String favoritesList = getViewPath("/web/ucenter/favourite_course_list");
	private static String freeCourseList=getViewPath("/web/ucenter/uc_freecourse");
	private String queryUserLetter = getViewPath("/web/ucenter/uc_letter_inbox");// 用户消息
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserLoginLogService userLoginLogService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private CourseKpointService courseKpointService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CourseFavoritesService courseFavoritesService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private WebsiteProfileService websiteProfileService;
	@Autowired
	private MsgReceiveService msgReceiveService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private CourseStudyhistoryService courseStudyhistoryService;
	
	@InitBinder({"user"})
	public void initBinderUser(WebDataBinder binder){
		binder.setFieldDefaultPrefix("user.");
	}
	
	@InitBinder("msgReceive")
	public void initBinderMsgReceive(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("msgReceive.");
	}
	
	/**
	 * 删除收藏
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteFaveorite/{ids}")
	public ModelAndView deleteFavorite(HttpServletRequest request,@PathVariable("ids") String ids){
		ModelAndView model = new ModelAndView();
		try{
			courseFavoritesService.deleteCourseFavoritesById(ids);
			Object uri = request.getSession().getAttribute("favoritesListUri");
			if(uri!=null){
				model.setViewName("redirect:"+uri.toString());
			}else{
				model.setViewName("redirect:/uc/myFavorites");
			}
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("deleteFavorite()---error",e);
		}
		return model;
	}
	
	/**
	 * 我的收藏列表
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping("/myFavorites")
	public ModelAndView myFavorites(HttpServletRequest request,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView(favoritesList);
		try{
			page.setPageSize(6);
			int userId = SingletonLoginUtils.getLoginUserId(request);
			List<FavouriteCourseDTO> favoriteList = courseFavoritesService.queryFavoritesPage(userId, page);
			model.addObject("favoriteList", favoriteList);
			model.addObject("page", page);
			request.getSession().setAttribute("favoritesListUri", WebUtils.getServletRequestUriParms(request));
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("myFavorites()---error",e);
		}
		return model;
	}
	
	/**
	 * 修改用户个人中心个性化图片URL
	 * @return Map<String,Object>
	 */
	@RequestMapping("/updateUserBanner")
	@ResponseBody
	public Map<String,Object> updateUserBanner(HttpServletRequest request){
		try{
			String bannerUrl = request.getParameter("bannerUrl");
			int userId = SingletonLoginUtils.getLoginUserId(request);
			if(bannerUrl!=null && bannerUrl.trim().length()>0 && userId>0){
				User user = new User();
				user.setUserId(SingletonLoginUtils.getLoginUserId(request));
				user.setBannerUrl(bannerUrl);
				userService.updateUserBannerUrl(user);
				
				//重新查询用户数据
				user = userService.queryUserById(user.getUserId());
				//更新用户缓存
				EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), user);
				this.setJson(true, null, null);
				return json;
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("updateUserBanner()--error",e);
		}
		return json;
	}
	
	
	/**
	 * 进入播放页面
	 * @param request
	 * @param courseId 课程ID
	 * @return ModelAndView
	 */
	@RequestMapping("/play/{courseId}")
	public ModelAndView playVideo(HttpServletRequest request,@PathVariable("courseId") int courseId){
		ModelAndView model = new ModelAndView();
		try{
			model.setViewName(palyPage);
			//获取课程
			Course course = courseService.queryCourseById(courseId);
			if(course!=null){
				model.addObject("course", course);
				int userId = SingletonLoginUtils.getLoginUserId(request);
				//查询是否已经收藏
				boolean isFavorites = courseFavoritesService.checkFavorites(userId, courseId);
				model.addObject("isFavorites", isFavorites);
	    		
				boolean isok= orderService.checkUserCursePay(userId, course.getCourseId());
				//如果课程价格为0可以观看
            	if(course.getCurrentPrice().compareTo(new BigDecimal(0))==0){
            		isok=true;
            	}
				if(isok){
					//查询课程目录
					List<CourseKpoint> parentKpointList = new ArrayList<CourseKpoint>();
	            	List<CourseKpoint> kpointList = courseKpointService.queryCourseKpointByCourseId(courseId);
	            	if(kpointList!=null && kpointList.size()>0){
	            		//遍历 一级目录
	            		for(CourseKpoint temp:kpointList){
	                		if (temp.getParentId()==0) {
	                			parentKpointList.add(temp);
	    					}
	                	}
	            		
	            		//遍历 获取二级目录
	            		for(CourseKpoint tempParent:parentKpointList){
	                		for(CourseKpoint temp:kpointList){
	                    		if (temp.getParentId()==tempParent.getKpointId()) {
	                    			tempParent.getKpointList().add(temp);
	        					}
	                    	}
	                	}
	                	model.addObject("parentKpointList", parentKpointList);
	            	}
	            	
	            	//相关课程
	            	List<CourseDto> courseList = courseService.queryInterfixCourseLis(course.getSubjectId(), 5,course.getCourseId());
	            	for(CourseDto tempCoursedto : courseList){
	            		List<Map<String,Object>> teacherList=teacherService.queryCourseTeacerList(tempCoursedto.getCourseId());
	            		tempCoursedto.setTeacherList(teacherList);
	            	}
	            	model.addObject("courseList", courseList);
	            	
	            	
	            	CourseStudyhistory courseStudyhistory=new CourseStudyhistory();
	            	courseStudyhistory.setUserId(Long.valueOf(userId));
	            	courseStudyhistory.setCourseId(Long.valueOf(String.valueOf(courseId)));
	            	//我的课程学习记录
	            	List<CourseStudyhistory>  couStudyhistorysLearned=courseStudyhistoryService.getCourseStudyhistoryList(courseStudyhistory);
	            	int courseHistorySize=0;
	            	if (couStudyhistorysLearned!=null&&couStudyhistorysLearned.size()>0) {
	            		courseHistorySize=couStudyhistorysLearned.size();
					}
	            	//二级视频节点的 总数
					int sonKpointCount=courseKpointService.getSecondLevelKpointCount(Long.valueOf(courseId));
	            	NumberFormat numberFormat = NumberFormat.getInstance();  
	            	//我的学习进度百分比
	                // 设置精确到小数点后0位  
	                numberFormat.setMaximumFractionDigits(0);  
	                String studyPercent = numberFormat.format((float) courseHistorySize / (float) sonKpointCount * 100);  
	                course.setStudyPercent(studyPercent);
				}else{
					model.addObject("message", "您未购买【"+course.getCourseName()+"】课程，播放失败！");
				}
				model.addObject("isok", isok);
			}
			
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("playVideo()--error",e);
		}
		return model;
	}
	
	/**
	 * 进入个人中心
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping("/index")
	public ModelAndView ucIndex(HttpServletRequest request,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView();
		try{
			page.setPageSize(9);
			//获取登录用户ID
			int userId = SingletonLoginUtils.getLoginUserId(request);
			//查询我的课程
			List<CourseDto> courseList = courseService.queryMyCourseList(userId, page);
			
			if(courseList!=null&&courseList.size()>0){
				for(Course course:courseList){
					CourseStudyhistory courseStudyhistory=new CourseStudyhistory();
	            	courseStudyhistory.setUserId(Long.valueOf(userId));
	            	courseStudyhistory.setCourseId(Long.valueOf(String.valueOf(course.getCourseId())));
	            	//我的课程学习记录
	            	List<CourseStudyhistory>  couStudyhistorysLearned=courseStudyhistoryService.getCourseStudyhistoryList(courseStudyhistory);
	            	int courseHistorySize=0;
	            	if (couStudyhistorysLearned!=null&&couStudyhistorysLearned.size()>0) {
	            		courseHistorySize=couStudyhistorysLearned.size();
					}
	            	//二级视频节点的 总数
					int sonKpointCount=courseKpointService.getSecondLevelKpointCount(Long.valueOf(course.getCourseId()));
	            	NumberFormat numberFormat = NumberFormat.getInstance();  
	            	//我的学习进度百分比
	                // 设置精确到小数点后0位  
	                numberFormat.setMaximumFractionDigits(0);  
	                String studyPercent = numberFormat.format((float) courseHistorySize / (float) sonKpointCount * 100);  
	                course.setStudyPercent(studyPercent);
				}
			}
			
            
			model.addObject("courseList", courseList);
			model.addObject("page", page);
			
			model.setViewName(ucIndex);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("ucIndex()--error",e);
		}
		return model;
	}
	
	/**
     * 免费课程列表
     */
    @RequestMapping("/freeCourseList")
    public ModelAndView showFreeCourseList(HttpServletRequest request, @ModelAttribute("page") PageEntity page, @ModelAttribute("queryCourse") QueryCourse queryCourse) {
        ModelAndView model = new ModelAndView();
        try {
        	model.setViewName(freeCourseList);
            // 页面传来的数据放到page中
        	page.setPageSize(9);
            //只查询上架的
            queryCourse.setIsavaliable(1);
            queryCourse.setIsFree("true");//查询免费的课程
            // 搜索课程列表
            List<CourseDto> courseList = courseService.queryWebCourseListPage(queryCourse, page);
            model.addObject("courseList", courseList);
            model.addObject("page",page);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("showFreeCourseList()--error", e);
        }
        return model;
    }
	
	/**
	 * 修改用户头像
	 * @return Map<String,Object>
	 */
	@RequestMapping("/updateImg")
	@ResponseBody
	public Map<String,Object> updatePicImg(@ModelAttribute("user") User user){
		try{
			if(user.getUserId()>0){
				userService.updateImg(user);
				user = userService.queryUserById(user.getUserId());
				EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), user,CacheConstans.USER_TIME);
				this.setJson(true, null, null);
			}else{
				this.setJson(true, "头像修改失败", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("updatePicImg()",e);
		}
		return json;
	}
	
	/**
	 * 修改用户密码
	 * @param request
	 * @param user
	 * @return Map<String,Object>
	 */
	@RequestMapping("/updatePwd")
	@ResponseBody
	public Map<String,Object> updatePwd(HttpServletRequest request,@ModelAttribute("user") User user){
		try{
			user = userService.queryUserById(user.getUserId());
			if(user!=null){
				//原密码
				String nowPassword = request.getParameter("nowPassword")==null?"":request.getParameter("nowPassword");
				//新密码
				String newPassword = request.getParameter("newPassword")==null?"":request.getParameter("newPassword");
				//确认密码
				String confirmPwd = request.getParameter("confirmPwd")==null?"":request.getParameter("confirmPwd");
				if(nowPassword.equals("")|| nowPassword.trim().length()==0){
					this.setJson(false, "请输入旧密码！", null);
					return json;
				}
				if(!user.getPassword().equals(MD5.getMD5(nowPassword))){
					this.setJson(false, "旧密码不正确！", null);
					return json;
				}
				if(newPassword.equals("") || newPassword.trim().length()==0){
					this.setJson(false, "请输入新密码！", null);
					return json;
				}
				if(!WebUtils.isPasswordAvailable(newPassword)){
					this.setJson(false, "密码只能是数字字母组合且大于等于6位小于等于16位", null);
					return json;
				}
				if(!newPassword.equals(confirmPwd)){
					this.setJson(false, "新密码和确认密码不一致！", null);
					return json;
				}
				user.setPassword(MD5.getMD5(newPassword));
				userService.updateUserPwd(user);
				this.setJson(true, "修改成功", null);
				return json;
			}
			this.setJson(false, "修改失败", null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("updatePwd()--error",e);
		}
		return json;
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param user
	 * @return Map<String,Object>
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public Map<String,Object> updateUserInfo(HttpServletRequest request,@ModelAttribute("user") User user){
		try{
			userService.updateUser(user);
			this.setJson(true, "修改成功", user);
			User us = userService.queryUserById(user.getUserId());
			//重新设置缓存中的用户信息
			EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), us, CacheConstans.USER_TIME);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("updateUserInfo()---error",e);
		}
		return json;
	}
	
	/**
	 * 初始化修改用户信息页面
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping("/initUpdateUser/{index}")
	public ModelAndView initUpdateUser(HttpServletRequest request,@PathVariable("index") int index){
		ModelAndView model = new ModelAndView();
		try{
			int userId = SingletonLoginUtils.getLoginUserId(request);
			User user = userService.queryUserById(userId);
			model.addObject("user", user);
			model.addObject("index",index);
			model.setViewName(userInfo);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("initUpdateUser()---error",e);
		}
		return model;
	}
	
	
	/**
	 * 获取登录
	 */
	@RequestMapping("/getloginUser")
	@ResponseBody
	public Map<String,Object> getLoginUser(HttpServletRequest request,HttpServletResponse response){
		try{
			User user = SingletonLoginUtils.getLoginUser(request);
			if(user==null|| user.getUserId()==0){
				this.setJson(false, null, null);
			}else{
				this.setJson(true, null, user);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("getLoginUser()---error",e);
		}
		return json;
	}
	/**
	 * 执行登录
	 * @param request
	 * @return Map<String,Object> 
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,Object> userLogin(HttpServletRequest request,HttpServletResponse response){
		try{
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			if(!StringUtils.isNotEmpty(account)){
				this.setJson(false, "请输入登录帐号", null);
				return json;
			}
			if(!StringUtils.isNotEmpty(password)){
				this.setJson(false, "请输入登录密码", null);
				return json;
			}
			User user = userService.getLoginUser(account, MD5.getMD5(password));
			if(user==null){
				this.setJson(false, "帐号或密码错误", null);
				return json;
			}
			EHCacheUtil.remove(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId());
			if(user.getIsavalible()==2){
				this.setJson(false, "帐号已被禁用", null);
				return json;
			}
			//缓存用户
			EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), user,CacheConstans.USER_TIME);
			//request.getSession().setAttribute(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), user);
			WebUtils.setCookie(response, CacheConstans.WEB_USER_LOGIN_PREFIX, CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), 1);
			
			UserLoginLog loginLog =new UserLoginLog();
			loginLog.setIp(WebUtils.getIpAddr(request));
			loginLog.setLoginTime(new Date());
			String userAgent = WebUtils.getUserAgent(request);
			if(StringUtils.isNotEmpty(userAgent)){
				loginLog.setOsName(userAgent.split(";")[1]);
				loginLog.setUserAgent(userAgent.split(";")[0]);
			}
			loginLog.setUserId(user.getUserId());
			userLoginLogService.createLoginLog(loginLog);
			this.setJson(true, "", null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("userLogin()--error",e);
		}
		return json;
	}
	
	/**
	 * 创建学员
	 * @param user 学员对象
	 * @return Map<String,Object>
	 */
	@RequestMapping("/createuser")
	@ResponseBody
	public Map<String,Object> createUser(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("user") User user){
		try{
			String registerCode = request.getParameter("registerCode")==null?"":request.getParameter("registerCode");
			Object randCode = request.getSession().getAttribute(CommonConstants.RAND_CODE);
			if(randCode==null || !registerCode.equals(randCode.toString())){
				this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
			
			String confirmPwd = request.getParameter("confirmPwd");
			
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtils.checkEmail(user.getEmail(), 50)){
				this.setJson(false, "请输入正确的邮箱号", null);
				return json;
			}
			if(userService.checkEmail(user.getEmail().trim())){
				this.setJson(false, "该邮箱号已被使用", null);
				return json;
			}
			if(user.getMobile()==null || user.getMobile().trim().length()==0 || !WebUtils.checkMobile(user.getMobile())){
				this.setJson(false, "请输入正确的手机号", null);
				return json;
			}
			if(userService.checkMobile(user.getMobile())){
				this.setJson(false, "该手机号已被使用", null);
				return json;
			}
			if(user.getPassword()==null || user.getPassword().trim().length()==0 || !WebUtils.isPasswordAvailable(user.getPassword())){
				this.setJson(false, "密码有字母和数字组合且≥6位≤16位", null);
				return json;
			}
			if(!user.getPassword().equals(confirmPwd)){
				this.setJson(false, "两次密码不一致", null);
				return json;
			}
			
			user.setCreateTime(new Date());
			user.setIsavalible(1);
			user.setPassword(MD5.getMD5(user.getPassword()));
			user.setMsgNum(0);
			user.setSysMsgNum(0);
			user.setLastSystemTime(new Date());
			userService.createUser(user);
			request.getSession().removeAttribute(CommonConstants.RAND_CODE);
			this.setJson(true, "注册成功", null);
			
			// 注册时发送系统消息
			Map<String, Object> websitemap = websiteProfileService.getWebsiteProfileByType(WebSiteProfileType.web.toString());
			Map<String, Object> web = (Map<String, Object>) websitemap.get("web");
			String company = web.get("company").toString();
			String conent = "欢迎来到" + company + ",希望您能够快乐的学习";
			msgReceiveService.addSystemMessageByCusId(conent, Long.valueOf(user.getUserId()));
			
			//缓存用户
			EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), user,CacheConstans.USER_TIME);
			WebUtils.setCookie(response, CacheConstans.WEB_USER_LOGIN_PREFIX, CacheConstans.WEB_USER_LOGIN_PREFIX+user.getUserId(), 1);
		}catch (Exception e) {
			logger.error("createUser()--eror",e);
		}
		return json;
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @return String
	 */
	@RequestMapping("/exit")
	@ResponseBody
	public Map<String,Object> outLogin(HttpServletRequest request){
		try{
			String prefix = WebUtils.getCookie(request, CacheConstans.WEB_USER_LOGIN_PREFIX);
			if(prefix!=null){
				EHCacheUtil.remove(prefix);
			}
			this.setJson(true, null, null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("outLogin()--error",e);
			
		}
		return json;
	}
	
	
	/**
	 * 发送找回密码邮件
	 * @return Map<String,Object>
	 */
	@RequestMapping("/sendEmail")
	@ResponseBody
	public Map<String,Object> sendEmail(HttpServletRequest request){
		try{
			String email = request.getParameter("email");
			if(email==null || email.trim().length()==0){
				this.setJson(false, "请填写邮箱号", null);
				return json;
			}
			if(!WebUtils.checkEmail(email, 50)){
				this.setJson(false, "请填正确的邮箱号", null);
				return json;
			}
			String pageCode = request.getParameter("pageCode");
			String randCode = (String) request.getSession().getAttribute(CommonConstants.RAND_CODE);
			if(randCode==null ||randCode.trim().length()==0 || pageCode==null || pageCode.trim().length()==0 || !pageCode.equals(randCode) ){
				this.setJson(false, "验证码错误", null);
				return json;
			}
			User user = userService.queryUserByEmailOrMobile(email);
			if(user==null){
				this.setJson(false, "该邮箱号未注册", null);
				return json;
			}
			String newPwd = getRandomNum(6);
			user.setPassword(MD5.getMD5(newPwd));
			Map<String, Object> websitemap = websiteProfileService.getWebsiteProfileByType(WebSiteProfileType.web.toString());
			@SuppressWarnings("unchecked")
			Map<String, Object> web = (Map<String, Object>) websitemap.get("web");
			String company = web.get("company").toString();
			emailService.sendMail("找回密码","帐号为["+user.getEmail()+"]的用户，您新密码是["+newPwd+"],请使用后修改密码———帐号找回["+company+"]", email);
			this.setJson(true, "邮件发送成功，请登录邮箱查收", null);
			request.getSession().removeAttribute(CommonConstants.RAND_CODE);
			userService.updateUserPwd(user);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("sendEmail()--error",e);
		}
		return json;
	}
	
	/**
	 * 生成随机数
	 * @param count 生成个数
	 * @return String
	 */
	private String getRandomNum(int count){
		Random ra = new Random();
		String random="";
		for(int i=0;i<count;i++){
			random+=ra.nextInt(9);
		}
		return random;
	}
	
	/**
	 * 查询站内信收件箱（无社区）
	 * 
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/letter")
	public ModelAndView queryUserLetter(HttpServletRequest request, @ModelAttribute("page") PageEntity page) {
		ModelAndView modelAndView = new ModelAndView(queryUserLetter);
		try {
			this.setPage(page);
			page.setPageSize(6);// 分页页数为6
			MsgReceive msgReceive = new MsgReceive();
			msgReceive.setReceivingCusId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));// set用户id
			//msgReceiveService.updateAllReadMsgReceiveInbox(msgReceive);//
			// 更新所有收件箱为已读
			List<QueryMsgReceive> queryLetterList = msgReceiveService.queryMsgReceiveByInbox(msgReceive, this.getPage());// 查询站内信收件箱
			
			//修改用户消息数后  重新加入缓存
	        //缓存用户
	        User user=userService.queryUserById(msgReceive.getReceivingCusId().intValue());
			EHCacheUtil.set(CacheConstans.WEB_USER_LOGIN_PREFIX+msgReceive.getReceivingCusId(), user,CacheConstans.USER_TIME);
			
			modelAndView.addObject("queryLetterList", queryLetterList);// 查询出的站内信放入modelAndView中
			modelAndView.addObject("page", this.getPage());// 分页参数放入modelAndView中
		} catch (Exception e) {
			logger.error("UserController.queryUserLetter()", e);
			setExceptionRequest(request, e);
			modelAndView.setViewName(this.setExceptionRequest(request, e));
		}
		return modelAndView;
	}
	
	/**
     * 删除站内信收件箱
     *
     * @param msgReceive
     * @return
     */
    @RequestMapping(value = "/ajax/delLetterInbox")
    @ResponseBody
    public Map<String, Object> delLetterInbox(@ModelAttribute MsgReceive msgReceive, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            msgReceive.setReceivingCusId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));// set 用户id
            Long num = msgReceiveService.delMsgReceiveInbox(msgReceive);// 删除收件箱
            if (num.intValue() == 1) {
                map.put("message", "success");// 成功
            } else {
                map.put("message", "false");// 失败
            }
        } catch (Exception e) {
            logger.error("UserController.delLetterInbox()", e);
            setExceptionRequest(request, e);
        }
        return map;
    }
    
    /**
     * 查询该用户有多少未读消息
     */
    @RequestMapping(value = "/ajax/queryUnReadLetter")
    @ResponseBody
    public Map<String, Object> queryUnReadLetter(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //未登录不可操作
            if (SingletonLoginUtils.getLoginUserId(request)== 0) {
                return map;
            }
            Map<String, String> queryletter = msgReceiveService.queryUnReadMsgReceiveNumByCusId(Long.valueOf(SingletonLoginUtils.getLoginUserId(request)));// 查询该用户有多少未读消息
            map.put("entity", queryletter);// 把值放入map中返回json
        } catch (Exception e) {
            logger.error("UserController.queryUnReadLetter()", e);
            setExceptionRequest(request, e);
        }
        return map;
    }
}

package com.inxedu.os.controller.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.constants.CacheConstans;
import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.service.cache.EHCacheUtil;
import com.inxedu.os.common.util.ObjectUtils;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.entity.system.SysFunction;
import com.inxedu.os.entity.system.SysUser;
import com.inxedu.os.service.article.ArticleService;
import com.inxedu.os.service.course.CourseService;
import com.inxedu.os.service.system.SysFunctionService;
import com.inxedu.os.service.user.UserService;

@Controller
@RequestMapping("/admin/main")
public class MainController extends BaseController{
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static String mainPage = getViewPath("/admin/main/main");
	private static String mainIndexPage = getViewPath("/admin/main/index");
	@Autowired
	private SysFunctionService sysFunctionService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	
	private List<SysFunction> functionList =null;
	/**
	 * 进入操作中心
	 * @param request
	 * @return ModelAndView
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping()
	public ModelAndView mainPage(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		try{
			SysUser sysuser = SingletonLoginUtils.getLoginSysUser(request);
			//得到缓存用户权限
			List<SysFunction> userFunctionList =(List<SysFunction>) EHCacheUtil.get(CacheConstans.USER_FUNCTION_PREFIX+sysuser.getUserId());
			//如果缓存中不存在则查询数据库中的用户权限
			if(ObjectUtils.isNull(userFunctionList)){
				userFunctionList = sysFunctionService.querySysUserFunction(sysuser.getUserId());
				EHCacheUtil.set(CacheConstans.USER_FUNCTION_PREFIX+sysuser.getUserId(), userFunctionList);
			}
			//处理权限
			functionList = handleUserFunction(userFunctionList);
			model.addObject("userFunctionList", functionList);
			model.setViewName(mainPage);
			model.addObject("sysuser", sysuser);
			
			//所有文章数量
			int articleCount = articleService.queryAllArticleCount();
			model.addObject("articleCount", articleCount);
			//所有用户数量
			int userCount = userService.queryAllUserCount();
			model.addObject("userCount", userCount);
			//所有课程数量
			int courseCount = courseService.queryAllCourseCount();
			model.addObject("courseCount", courseCount);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("mainPage()--error",e);
		}
		return model;
	}
	
	/**
	 * 处理权限
	 * @param userFunctionList 用户权限列表
	 * @return List<Map<String,Object>>
	 */
	private List<SysFunction> handleUserFunction(List<SysFunction> userFunctionList){
		functionList = new ArrayList<SysFunction>();
		List<SysFunction> _functionList = null;
		if(userFunctionList!=null && userFunctionList.size()>0){
			//获取根级权限
			List<SysFunction> parentList = new ArrayList<SysFunction>();
			for(SysFunction sf : userFunctionList){
				int _index=0;
				for(SysFunction _sf : userFunctionList){
					if(sf.getParentId()==_sf.getFunctionId()){
						_index++;
						break;
					}
				}
				if(_index==0 && sf.getFunctionType()==1){
					parentList.add(sf);
				}
			}
			//获取根级权限的子级权限
			for(SysFunction psf : parentList){
				recursionFunction(userFunctionList,psf);
			}
			_functionList =parentList;
		}
		return _functionList;
	}
	
	/**
	 * 递归得到每个权限的子级权限
	 * @param userFunctionList 用户权限列表
	 * @param sf 当前权限
	 */
	private void recursionFunction(List<SysFunction> userFunctionList,SysFunction sf){
		List<SysFunction> childFunction = new ArrayList<SysFunction>();
		for(SysFunction usf : userFunctionList){
			if(sf.getFunctionId()==usf.getParentId() && usf.getFunctionType()==1){
				childFunction.add(usf);
				recursionFunction(userFunctionList,usf);
			}
		}
		sf.setChildList(childFunction);
		functionList.add(sf);
	}
	
	/**
	 * 后台操作中心初始化首页
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping("/index")
	public ModelAndView mainIndex(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		try{


			model.setViewName(mainIndexPage);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("mainIndex()---error",e);
		}
		return model;
	}
	
	/**
	 * 访问权限受限制跳转
	 * @return ModelAndView
	 */
	@RequestMapping("/notfunction")
	public ModelAndView notFunctionMsg(){
		ModelAndView model = new ModelAndView();
		model.addObject("message", "对不起，您没有操作权限！");
		model.setViewName("/common/notFunctonMsg");
		return model;
	}
	
}

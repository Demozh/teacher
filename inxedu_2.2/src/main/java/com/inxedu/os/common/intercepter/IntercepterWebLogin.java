package com.inxedu.os.common.intercepter;

import org.springframework.cache.EHCacheUtil;
import org.springframework.common.util.StringUtils;

import com.inxedu.os.common.constants.CacheConstans;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.common.util.WebUtils;
import com.inxedu.os.edu.entity.user.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.ObjectUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 前台用户登录拦截器
 * @author www.inxedu.com
 */
public class IntercepterWebLogin extends HandlerInterceptorAdapter{

	public boolean ischeck=true;//是否开启同时1个帐号只能1个人登录开关
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		User user = SingletonLoginUtils.getLoginUser(request);


		if(ObjectUtils.isNotNull(user)){
			if(ischeck){
				//缓存中 用户的登录时间
				String mcuurent=(String) EHCacheUtil.get(CacheConstans.USER_CURRENT_LOGINTIME+user.getUserId());
				//登录状态的验证,是否被其他人踢掉
				if(StringUtils.isNotEmpty(mcuurent)&&request.getHeader("x-requested-with")==null){//排除信息页,和异步请求
					if(user.getLoginTimeStamp()!=Long.valueOf(mcuurent).longValue()){
						//跳转到登录页面并提示信息根据msg
						response.sendRedirect("/?msg=LimitLogin");
						//清除登录状态
						String sid = WebUtils.getCookie(request, CacheConstans.WEB_USER_LOGIN_PREFIX);
						if (StringUtils.isNotEmpty(sid)) {
							EHCacheUtil.remove(sid);
						}
						WebUtils.deleteCookie(request, response, CacheConstans.WEB_USER_LOGIN_PREFIX);
						return false;
					}
				}
				return true;
			}else{
				return true;
			}
		}
		//未登录时跳转到登录页面
		if(user==null){
			response.sendRedirect("/");//跳转登录页面
			return false;
		}
		return true;
	}

	
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}
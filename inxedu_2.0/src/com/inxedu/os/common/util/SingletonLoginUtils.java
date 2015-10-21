package com.inxedu.os.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.common.util.StringUtils;
import org.springframework.web.util.ObjectUtils;

import com.inxedu.os.common.constants.CacheConstans;
import org.springframework.cache.EHCacheUtil;
import com.inxedu.os.entity.system.SysUser;
import com.inxedu.os.entity.user.User;

public class SingletonLoginUtils {
	
	
	/**
	 * 
	 * 获取后台登录用户ID
	 * @param request
	 * @return 返因用户ID
	 */
	public static int getLoginSysUserId(HttpServletRequest request) {
		SysUser useObject = getLoginSysUser(request);
		if (ObjectUtils.isNotNull(useObject)) {
			return useObject.getUserId();
		} else {
			return 0;
		}
	}

	/**
	 * 获取后台登录用户
	 * 
	 * @return SysUser
	 * @throws Exception
	 */
	public static SysUser getLoginSysUser(HttpServletRequest request) {
		String userKey = WebUtils.getCookie(request, CacheConstans.LOGIN_MEMCACHE_PREFIX);
		if (StringUtils.isNotEmpty(userKey)) {
			SysUser sysUser = (SysUser) EHCacheUtil.get(userKey);
			if (ObjectUtils.isNotNull(sysUser)) {
				return sysUser;
			}
		}
		return null;
	}
	
	/**
	 * 获取前台登录用户ID
	 * @param request
	 * @return 返回用户ID
	 */
	public static int getLoginUserId(HttpServletRequest request){
		User user = getLoginUser(request);
		if(user!=null){
			return user.getUserId();
		}
		return 0;
	}
	
	/**
	 * 获取前台登录用户
	 * @param request
	 * @return User
	 */
	public static User getLoginUser(HttpServletRequest request){
		String userKey = WebUtils.getCookie(request, CacheConstans.WEB_USER_LOGIN_PREFIX);
		if(StringUtils.isNotEmpty(userKey)){
			User user = (User) EHCacheUtil.get(userKey);
			//User user = (User) request.getSession().getAttribute(userKey);
			if(ObjectUtils.isNotNull(user)){
				return user;
			}
		}
		return null;
	}
}

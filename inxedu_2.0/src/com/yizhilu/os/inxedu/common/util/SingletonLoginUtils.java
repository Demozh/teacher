package com.yizhilu.os.inxedu.common.util;

import javax.servlet.http.HttpServletRequest;

import com.yizhilu.os.inxedu.common.constants.CacheConstans;
import com.yizhilu.os.inxedu.common.service.cache.EHCacheUtil;
import com.yizhilu.os.inxedu.entity.system.SysUser;
import com.yizhilu.os.inxedu.entity.user.User;

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
			//SysUser sysUser = (SysUser) request.getSession().getAttribute(userKey);
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

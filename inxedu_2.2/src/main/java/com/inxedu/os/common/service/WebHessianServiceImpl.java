package com.inxedu.os.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.edu.entity.user.WebLoginUser;
import com.inxedu.os.edu.service.user.UserService;
/**
 * Created by Administrator on 2014/12/25.
 */
@Service("webHessianService")
public class WebHessianServiceImpl implements WebHessianService {
	private static final Logger logger = LoggerFactory.getLogger(WebHessianServiceImpl.class);
	
	private Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

	@Autowired
	private UserService userService;
	/**
	 * 查询用户信息
	 * @param cusId
	 * @return
	 */
	public Map<String,String> getUserInfo(Long cusId){
		Map<String,String> map=new HashMap<String, String>();
		try {
			//用户信息
	        User user= userService.queryUserById(Integer.parseInt(cusId+""));
	        WebLoginUser webLoginUser=null;
	        if (user!=null) {
	        	webLoginUser=new WebLoginUser();
	        	//添加需要的属性
				webLoginUser.setCusId(Long.valueOf(user.getUserId()));
				webLoginUser.setEmail(user.getEmail());
				webLoginUser.setGender(user.getSex());
				webLoginUser.setId(Long.valueOf(user.getUserId()));
				webLoginUser.setMobile(user.getMobile());
				webLoginUser.setNickname(user.getShowName());
				webLoginUser.setRealname(user.getUserName());
				webLoginUser.setAvatar(user.getPicImg());
				webLoginUser.setUserInfo("这个人很懒，他还没有签名");
			}
	        //转Json
	        String userJson=gson.toJson(webLoginUser).toString();
	        map.put("userJson", userJson);
		} catch (Exception e) {
			logger.error("WebHessianServiceImpl.getUserInfo-----error",e);
		}
		return map;
	}

	/**
	 * 批量查询用户信息
	 * @param cusIds
	 * @return
	 */
	public Map<String,String> getUserInfoByUids(String cusIds){
		Map<String,String> userMap=new HashMap<String, String>();
		try {
			//批量用户信息
			Map<String, User> map=userService.getUserExpandByUids(cusIds);
			Map<String, WebLoginUser> webUserMap = new HashMap<String, WebLoginUser>();
			WebLoginUser webLoginUser=null;
			User user=null;
			//添加需要的属性
			for(Entry<String, User> entry: map.entrySet()) { 
				webLoginUser=new WebLoginUser();
				user=entry.getValue();
				webLoginUser.setCusId(Long.valueOf(user.getUserId()));
				webLoginUser.setEmail(user.getEmail());
				webLoginUser.setGender(user.getSex());
				webLoginUser.setId(Long.valueOf(user.getUserId()));
				webLoginUser.setMobile(user.getMobile());
				webLoginUser.setNickname(user.getShowName());
				webLoginUser.setRealname(user.getUserName());
				webLoginUser.setAvatar(user.getPicImg());
				webLoginUser.setUserInfo("这个人很懒，他还没有签名");
				webUserMap.put(String.valueOf(user.getUserId()), webLoginUser);
			} 
			
			//转为String用户集合
			List<String> userExpandDtos=new ArrayList<String>();
			for(Entry<String, WebLoginUser> entry: webUserMap.entrySet()) { 
				userExpandDtos.add(gson.toJson(entry.getValue())); 
			} 
			//转Json
			String usersJson=gson.toJson(userExpandDtos).toString();
			userMap.put("usersJson", usersJson);
		} catch (Exception e) {
			logger.error("WebHessianServiceImpl.getUserInfoByUids-----error",e);
		}
		return userMap;
	}
}

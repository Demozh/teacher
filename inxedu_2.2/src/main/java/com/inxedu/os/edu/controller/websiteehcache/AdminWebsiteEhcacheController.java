package com.inxedu.os.edu.controller.websiteehcache;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.EHCacheUtil;
import org.springframework.common.entity.PageEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.edu.controller.user.AdminUserController;
import com.inxedu.os.edu.entity.websiteehcache.WebsiteEhcache;
import com.inxedu.os.edu.service.websiteehcache.WebsiteEhcacheService;

/**
 * 缓存管理
 * @author www.inxedu.com
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminWebsiteEhcacheController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	
	private static final String toWebsiteEhcacheList = getViewPath("/admin/websiteehcache/website_ehcache_list");// Ehcache列表页
	private static final String toAddwebsiteEhcache = getViewPath("/admin/websiteehcache/website_ehcache_add");// Ehcache添加页
	
	@Autowired
	private WebsiteEhcacheService websiteEhcacheService;
	
	@InitBinder("websiteEhcache")
	public void initBinderEmail(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("websiteEhcache.");
	}
	
	/**
	 * 列表
	 */
	@RequestMapping("/ehcache/queryWebsiteEhcacheList")
	public String queryWebsiteEhcacheList(HttpServletRequest request,@ModelAttribute WebsiteEhcache websiteEhcache,@ModelAttribute PageEntity page){
		try{
			List<WebsiteEhcache> websiteEhcacheList=websiteEhcacheService.queryWebsiteEhcacheList(websiteEhcache, page);
			request.setAttribute("websiteEhcacheList", websiteEhcacheList);
			request.setAttribute("page", page);
			request.setAttribute("websiteEhcache", websiteEhcache);
		}catch(Exception e){
			logger.error("AdminEhcacheController.queryWebsiteEhcacheList", e);
		}
		return toWebsiteEhcacheList;
	}
	
	/**
	 * 添加页面
	 */
	@RequestMapping("/ehcache/toAdd")
	public String toAdd(){
		return toAddwebsiteEhcache;
	}
	
	/**
	 * 添加
	 */
	@RequestMapping("/ehcache/addWebsiteEhcache")
	@ResponseBody
	public Map<String, Object> addWebsiteEhcache(WebsiteEhcache websiteEhcache){
		Map<String, Object> json=null;
		try{
			if(websiteEhcache!=null){
				boolean flag=websiteEhcacheService.queryWebsiteEhcacheIsExsit(websiteEhcache.getEhcacheKey().replaceAll(" ", ""));
				if(flag==false){
					websiteEhcacheService.addWebsiteEhcache(websiteEhcache);
					json=setJson(true, "true", null);
				}else{
					json=setJson(false, "已存在", null);
				}
			}
		}catch(Exception e){
			logger.error("AdminEhcacheController.addWebsiteEhcache", e);
			json=setJson(false, "erro", null);
		}
		return json;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/ehcache/delWebsiteEhcache/{id}")
	@ResponseBody
	public Map<String, Object> delWebsiteEhcache(@PathVariable Long id){
		Map<String, Object> json=null;
		try{
			Long num=websiteEhcacheService.delWebsiteEhcache(id);
			if(num!=null&&num>0){
				json=setJson(true, "true", null);
			}else{
				json=setJson(false, "false", null);
			}
		}catch(Exception e){
			logger.error("AdminEhcacheController.delWebsiteEhcache", e);
			json=setJson(false, "error", null);
		}
		return json;
	}
	
	/**
	 * 清空单个缓存
	 * @param id
	 * @return
	 */
	@RequestMapping("/ehcache/removeEHCache/{id}")
	@ResponseBody
	public Map<String, Object> removeEHCache(@PathVariable Long id){
		Map<String, Object> json=null;
		try{
			WebsiteEhcache websiteEhcache=websiteEhcacheService.getWebsiteEhcacheById(id);
			if(websiteEhcache!=null){
				EHCacheUtil.remove("CacheConstans."+websiteEhcache.getEhcacheKey());
				json=setJson(true, "true", null);
			}
		}catch(Exception e){
			logger.error("AdminEhcacheController.removeEHCache", e);
			json=setJson(false, "error", null);
		}
		return json;
	}
	
	/**
	 * 清空所有缓存
	 */
	@RequestMapping("/ehcache/removeAllEHCache")
	@ResponseBody
	public Map<String, Object> removeAllEHCache(){
		Map<String, Object> json=null;
		try{
			EHCacheUtil.removeAll();
			json=setJson(true, "true", null);
		}catch(Exception e){
			logger.error("AdminEhcacheController.removeAllEHCache", e);
			json=setJson(false, "error", null);
		}
		return json;
	}
	
	
}

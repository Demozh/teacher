package com.inxedu.os.common.controller; 

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.common.util.DateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Controller基础继承类
 * @ClassName com.inxedu.os.inxedu.common.BaseController
 * @Create Date : 2015-3-16 下午2:11:59
 *  @author www.inxedu.com
 */

public class BaseController {
	public static Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	protected static final String SIMPLE_VIEW_PATH = "inxedu";
    // log对象
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    
    @InitBinder({"page"})
    public void initBinderPage(WebDataBinder binder) {
      binder.setFieldDefaultPrefix("page.");
    }

	/**
	 * 获取页面路径
	 */
	public static String getViewPath(String path) {
		if (path != null && !path.trim().equals("")) {
			return SIMPLE_VIEW_PATH + path;
		}
		return "";
	}
    
	/**
	 * 设置ajax请返回结果
	 * 
	 * @param success
	 *            请求状态
	 * @param message
	 *            提示信息
	 * @param entity
	 *            返回数据结果对象
	 */
	public Map<String,Object> setJson(boolean success, String message, Object entity) {
		Map<String,Object> json = new HashMap<String,Object>();
		json.put("success", Boolean.valueOf(success));
		json.put("message", message);
		json.put("entity", entity);
		return json;
	}
	
    
	/**
	 * 异常跳转
	 * @param request
	 * @param e
	 */
	public String setExceptionRequest(HttpServletRequest request, Exception e) {
		logger.error(request.getContextPath(), e);
		StackTraceElement[] messages = e.getStackTrace();
		if (messages != null && messages.length > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append(e.toString()).append("<br/>");
			for (int i = 0; i < messages.length; i++) {
				buffer.append(messages[i].toString()).append("<br/>");
			}
			request.setAttribute("myexception", buffer.toString());
		}
		return "/common/error";
	}
	
	/**
	 * ajax请异常
	 */
	public Map<String,Object> setAjaxException(Map<String,Object> map){
		map.put("success", false);
		map.put("message", "系统繁忙，请稍后再操作！");
		map.put("entity", null);
		return map;
	}

    /** spring接受date类型转换
     */
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        // 对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
}

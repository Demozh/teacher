package com.inxedu.os.common.controller; 

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.DateEditor;

/**
 * Controller基础继承类
 * @ClassName com.yizhilu.os.inxedu.common.BaseController
 * @Create Date : 2015-3-16 下午2:11:59
 */
public class BaseController {
	public static Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	protected static final String SIMPLE_VIEW_PATH = "inxedu";
    // log对象
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    //ajax请返返回
    public Map<String, Object> json = new HashMap<String, Object>(4);
    
    private PageEntity page;
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
	public void setJson(boolean success, String message, Object entity) {
		this.json.put("success", Boolean.valueOf(success));
		this.json.put("message", message);
		this.json.put("entity", entity);
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
	public void setAjaxException(){
		this.setJson(false, "系统繁忙，请稍后再操作！", null);
	}

	public PageEntity getPage() {
		return page;
	}

	public void setPage(PageEntity page) {
		this.page = page;
	}
    /** spring接受date类型转换
     */
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        // 对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
}

package com.inxedu.os.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 弹框
 */
@Controller
public class DialogController extends BaseController{

	private static Logger logger = LoggerFactory.getLogger(DialogController.class);
	private static final String getDialogHtml = "/common/dialog";// 弹出窗页面
	
	/**
	 * 获取弹出窗页面
	 * 
	 * @param request
	 * @param model
	 * @param dialog
	 * @return
	 */
	@RequestMapping("/common/dialog")
	public String getDialog(HttpServletRequest request, Model model) {
		try {
			Map<String,Object> mapDialog = new HashMap<String, Object>();
			mapDialog.put("title", request.getParameter("title"));
			mapDialog.put("context", request.getParameter("context"));
			
			mapDialog.put("height",request.getParameter("height")==null?157:request.getParameter("height"));
			model.addAttribute("dialog", mapDialog);
		} catch (Exception e) {
			logger.error("getDialog", e);
			return setExceptionRequest(request, e);
		}
		return getDialogHtml;
	}
}

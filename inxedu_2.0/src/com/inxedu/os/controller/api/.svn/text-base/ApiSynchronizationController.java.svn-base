package com.inxedu.os.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.entity.order.Order;
import com.inxedu.os.entity.subject.QuerySubject;
import com.inxedu.os.entity.subject.Subject;
import com.inxedu.os.service.order.OrderService;
import com.inxedu.os.service.subject.SubjectService;
import com.inxedu.os.service.user.UserService;

/**
 * 同步接口
 */
@Controller
@RequestMapping("/api")
public class ApiSynchronizationController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(ApiSynchronizationController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SubjectService subjectService;
	/**
	 * 查询相关数据
	 */
	@RequestMapping("/queryInfo")
	@ResponseBody
	public Map<String,Object> queryData(HttpServletRequest request){
		try{
			int usercount = userService.queryAllUserCount();
			int ordercount = orderService.queryOrderCount(new Order());
			List<Subject> subjectList = subjectService.getSubjectList(new QuerySubject());
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("usercount",usercount);
			map.put("ordercount",ordercount);
			map.put("subjectList",subjectList);
			this.setJson(true, null, map);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("queryData",e);
		}
		return json;
	}

}

package com.yizhilu.os.inxedu.controller.api;

import com.yizhilu.os.inxedu.common.controller.BaseController;
import com.yizhilu.os.inxedu.entity.order.Order;
import com.yizhilu.os.inxedu.entity.subject.QuerySubject;
import com.yizhilu.os.inxedu.entity.subject.Subject;
import com.yizhilu.os.inxedu.service.order.OrderService;
import com.yizhilu.os.inxedu.service.subject.SubjectService;
import com.yizhilu.os.inxedu.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

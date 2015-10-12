package com.inxedu.os.controller.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.DateUtils;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.constants.enums.OrderState;
import com.inxedu.os.entity.order.Order;
import com.inxedu.os.entity.order.QueryOrder;
import com.inxedu.os.entity.system.SysUser;
import com.inxedu.os.service.order.OrderService;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(AdminOrderController.class);
	private static String orderList = getViewPath("/admin/order/order-list");
	@Autowired
	private OrderService orderService;
	
	@InitBinder({"order"})
	public void initBinderorder(WebDataBinder binder){
		binder.setFieldDefaultPrefix("order.");
	}
	@InitBinder({"queryOrder"})
	public void initBinderQueryOrder(WebDataBinder binder){
		binder.setFieldDefaultPrefix("queryOrder.");
	}
	
	/**
	 * 审核订单
	 * @param request
	 * @param orderId 订单ID
	 * @return Map<String,Object>
	 */
	@RequestMapping("/auditing/{orderNo}")
	@ResponseBody
	public Map<String,Object> auditing(HttpServletRequest request,@PathVariable("orderNo") String orderNo){
		try{
			Date nowDate = new Date();
			SysUser sysUser = SingletonLoginUtils.getLoginSysUser(request);
			Order order = new Order();
			order.setSysUserId(sysUser.getUserId());
			order.setOrderNo(orderNo);
			order.setPayTime(nowDate);;
			order.setStates(OrderState.SUCCESS.toString());
			orderService.updateOrderSuccess(order);
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("order", order);
			map.put("sysUser", sysUser.getLoginName());
			map.put("payTime", DateUtils.dateToStr(nowDate, "dd/MM/yyyy HH:mm:ss"));
			this.setJson(true, null, map);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("auditing()--error",e);
		}
		return json;
	}
	
	/**
	 * 取消或恢复订单
	 * @param order 订单数据
	 * @return Map<String,Object>
	 */
	@RequestMapping("/cancelOrRegain")
	@ResponseBody
	public Map<String,Object> cancelOrRegain(@ModelAttribute("order") Order order){
		try{
			orderService.updateOrderState(order);
			this.setJson(true, null, null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("cancelOrRegain()--error",e);
		}
		return json;
	}
	
	/**
	 * 显示订单列表
	 * @param request
	 * @param page 分页条件
	 * @return ModelAndView
	 */
	@RequestMapping("/showorderlist")
	public ModelAndView showOrderList(HttpServletRequest request,@ModelAttribute("queryOrder") QueryOrder queryOrder,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView();
		try{
			page.setPageSize(15);
			model.setViewName(orderList);
			List<Map<String,Object>> orderList = orderService.queryOrderListPage(queryOrder, page);
			model.addObject("orderList", orderList);
			model.addObject("page", page);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("showOrderList()--error",e);
		}
		return model;
	}

}

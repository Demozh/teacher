package com.inxedu.os.edu.controller.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.util.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.constants.enums.OrderState;
import com.inxedu.os.edu.entity.order.Order;
import com.inxedu.os.edu.entity.order.QueryOrder;
import com.inxedu.os.edu.entity.system.SysUser;
import com.inxedu.os.edu.service.order.OrderService;

/**
 * @author www.inxedu.com
 *
 */
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
		Map<String,Object> json = new HashMap<String,Object>();
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
			json = this.setJson(true, null, map);
		}catch (Exception e) {
			this.setAjaxException(json);
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
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			orderService.updateOrderState(order);
			json = this.setJson(true, null, null);
		}catch (Exception e) {
			this.setAjaxException(json);
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

	/**
	 * 课程延期:只有订单状态为SUCCESS 才可以进行延期操作
	 */
	@RequestMapping("/delayorder")
	@ResponseBody
	public Map<String, Object> delayOrder(@ModelAttribute("order") Order order, HttpServletRequest request) {
		Map<String,Object> json = new HashMap<String,Object>();
		try {
			if (order != null) {
				Order orderUpd =orderService.queryOrderById(order.getOrderId());
				if(!orderUpd.getStates().equals("SUCCESS")){
					json=this.setJson(false, "该课程未付款,不能延期", "");
					return json;
				}else if (orderUpd.getExpireTime().after(order.getExpireTime())) {
					json=this.setJson(false, "延期时间必须大于原来的到期时间", "");
					return json;
				}
				orderUpd.setExpireTime(order.getExpireTime());
				orderService.updateOrder(orderUpd);
				json=this.setJson(true, "延期成功", "");
			} else {
				json=this.setJson(false, "参数不能为空", null);
			}
		} catch (Exception e) {
			logger.error("delayOrder.error----", e);
			json=this.setJson(false, "系统异常,请稍后重试", null);
		}
		return json;
	}

	/**
	 * 关闭课程：更改状态为closed
	 */
	@RequestMapping("/closeCourse/{orderId}")
	@ResponseBody
	public Object closeCourse(@PathVariable("orderId") int orderId, HttpServletRequest request) {
		Map<String,Object> json = new HashMap<String,Object>();
		try {
			Order orderUpd =orderService.queryOrderById(orderId);
			orderUpd.setStates(OrderState.CLOSED.toString());
			orderService.updateOrder(orderUpd);
			json=this.setJson(true, "关闭课程成功", "");
		} catch (Exception e) {
			logger.error("closeCourse.error---", e);
			json=this.setJson(false, "系统异常,请稍后重试", "");
		}
		return json;
	}
}

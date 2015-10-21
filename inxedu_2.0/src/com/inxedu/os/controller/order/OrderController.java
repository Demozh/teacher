package com.inxedu.os.controller.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.common.util.WebUtils;
import com.inxedu.os.constants.enums.OrderState;
import com.inxedu.os.entity.order.Order;
import com.inxedu.os.entity.order.QueryOrder;
import com.inxedu.os.service.order.OrderService;

/**
 * 前台订单
 */
@Controller
@RequestMapping("/uc/order")
public class OrderController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
	private static String myOrderList = getViewPath("/web/ucenter/my-order-list");
	@Autowired
	private OrderService orderService;
	
	@InitBinder({"queryOrder"})
	public void initQueryOrder(WebDataBinder binder){
		binder.setFieldDefaultPrefix("queryOrder.");
	}
	
	/**
	 * 取消订单
	 * @param request
	 * @param orderId 订单ID
	 * @return ModelAndView
	 */
	@RequestMapping("/cancelOrder/{orderId}")
	public ModelAndView cancelOrder(HttpServletRequest request,@PathVariable("orderId") int orderId){
		ModelAndView model = new ModelAndView();
		try{
			Order order = new Order();
			order.setOrderId(orderId);
			order.setStates(OrderState.CANCEL.toString());
			orderService.updateOrderState(order);
			Object uri = request.getSession().getAttribute("orderListUri");
			if(uri!=null){
				model.setViewName("redirect:"+uri.toString());
			}else{
				model.setViewName("redirect:/uc/order/myOrderList");
			}
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("cancelOrder()--error",e);
		}
		return model;
	}
	/**
	 * 我的订单列表
	 * @param request
	 * @param page 分页条件
	 * @return ModelAndView
	 */
	@RequestMapping("/myOrderList/{state}")
	public ModelAndView myOrderList(HttpServletRequest request,@PathVariable("state") String state,@ModelAttribute("queryOrder") QueryOrder queryOrder,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView();
		try{
			int userId = SingletonLoginUtils.getLoginUserId(request);
			model.setViewName(myOrderList);
			page.setPageSize(4);
			queryOrder.setUserId(userId);
			queryOrder.setStates(state);
			List<Map<String,Object>> orderList = orderService.queryOrderListPage(queryOrder, page);
			model.addObject("orderList", orderList);
			model.addObject("page", page);
			model.addObject("state", state);
			Order order = new Order();
			order.setUserId(userId);
			//查询未支付订单数量
			order.setStates(OrderState.INIT.toString());
			int count = orderService.queryOrderStateCount(order);
			model.addObject("initCount", count);
			//查询已取消订单数量
			order.setStates(OrderState.CANCEL.toString());
			count = orderService.queryOrderStateCount(order);
			model.addObject("cancelCount", count);
			//查询支付成功订单数量
			order.setStates(OrderState.SUCCESS.toString());
			count = orderService.queryOrderStateCount(order);
			model.addObject("successCount", count);
			
			request.getSession().setAttribute("orderListUri", WebUtils.getServletRequestUriParms(request));
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("myOrderList()---error",e);
		}
		return model;
	}
}

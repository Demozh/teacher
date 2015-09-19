package com.yizhilu.os.inxedu.service.impl.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tools.ant.types.resources.comparators.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.common.util.DateUtils;
import com.yizhilu.os.inxedu.dao.order.OrderDao;
import com.yizhilu.os.inxedu.entity.order.Order;
import com.yizhilu.os.inxedu.entity.order.QueryOrder;
import com.yizhilu.os.inxedu.service.order.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	public int createOrder(Order order) {
		return orderDao.createOrder(order);
	}

	public void updateOrderSuccess(Order order) {
		orderDao.updateOrderSuccess(order);
	}
	
	public void updateOrderState(Order order) {
		orderDao.updateOrderState(order);
	}

	public List<Map<String, Object>> queryOrderListPage(QueryOrder query,PageEntity page) {
		return orderDao.queryOrderListPage(query, page);
	}

	public boolean checkUserCursePay(int userId, int courseId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("courseId", courseId);
		map.put("nowDate",DateUtils.formatDate(new java.util.Date(), "yyyy-MM-dd hh:mm:ss"));
		int count = orderDao.checkUserCursePay(map);
		if(count>0){
			return true;
		}
		return false;
	}
	public int queryOrderStateCount(Order order) {
		return orderDao.queryOrderStateCount(order);
	}
	public Order queryOrderById(int orderId) {
		return orderDao.queryOrderById(orderId);
	}
	/**
	 * 根据条件查询订单数量
	 */
	public int queryOrderCount(Order order){
		return orderDao.queryOrderCount(order);
	}
	/**
	 * 根据条件查询订单
	 */
	public List<Order> queryOrder(Order order){
		return orderDao.queryOrder(order);
	}
}

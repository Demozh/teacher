package com.inxedu.os.service.order;

import java.util.List;
import java.util.Map;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.entity.order.Order;
import com.inxedu.os.entity.order.QueryOrder;

public interface OrderService {
	/**
	 * 创建订单 
	 * @param order  订单实体
	 * @return 订单ID
	 */
	public int createOrder(Order order);
	
	/**
	 * 更新订单状态为支付成功状态
	 * @param order 订单实体
	 */
	public void updateOrderSuccess(Order order);
	
	/**
	 * 取消或恢复订单 
	 * @param order 订单实体
	 */
	public void updateOrderState(Order order);
	
	/**
	 * 分页查询订单列表
	 * @param query 查询条件
	 * @param page 分页条件
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> queryOrderListPage(QueryOrder query,PageEntity page);
	
	/**
	 * 测试用户是否购买过某个课程
	 * @param userId 用户ID
	 * @param courseId 课程ID
	 * @return true购买过 false未购买过
	 */
	public boolean checkUserCursePay(int userId,int courseId);
	/**
	 * 查询用户不同状态的订单数量
	 * @param order 查询条件
	 * @return 返回数量
	 */
	public int queryOrderStateCount(Order order);
	/**
	 * 通过ID，查询订单数据
	 */
	public Order queryOrderById(int orderId);
	/**
	 * 根据条件查询订单数量
	 */
	public int queryOrderCount(Order order);
	/**
	 * 根据条件查询订单
	 */
	public List<Order> queryOrder(Order order);
}

package com.inxedu.os.edu.constants.enums;

/**
 * 订单状态
 * @author www.inxedu.com
 */
public enum OrderState {
	SUCCESS,//已支付
	INIT,//未支付
	CANCEL,//已取消
	CLOSED//关闭，后台手动关闭
}

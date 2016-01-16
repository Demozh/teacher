package com.inxedu.os.edu.entity.statistics;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author www.inxedu.com
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class StatisticsDay implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键id
	 */
	private Long id;
	/**
	 * 统计日期
	 */
    private java.util.Date statisticsTime;
    /**
     * 登录人数（活跃人数 ）
     */
    private Long loginNum;
    /**
     *  生成时间
     */
    private java.util.Date createTime;
    /**
     * 注册人数
     */
    private Long registeredNum;
    /**
     * 订单数
     */
    private Long orderNum;
    /**
     * 支付成功订单数
     */
    private Long orderSuccessNum;
    /**
     * 未支付订单数
     */
    private Long orderInitNum;
    /**
     * 已取消的订单数
     */
    private Long orderClosedNum;
}

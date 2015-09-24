package com.inxedu.os.entity.statistics;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
}

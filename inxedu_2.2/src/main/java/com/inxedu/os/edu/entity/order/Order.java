package com.inxedu.os.edu.entity.order;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.common.util.DateUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 课程订单
 * @author www.inxedu.com
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Order implements Serializable{
	private static final long serialVersionUID = 7687324559966427231L;
	/**订单ID*/
	private int orderId;
	/**课程ID*/
	private int courseId;
	/**购买用户ID*/
	private int userId;
	/**订单号*/
	private String orderNo;
	/**订单总金额*/
	private BigDecimal sumMoney;
	/**订单状态  SUCCESS已支付 INIT未支付 CANCEL已取消*/
	private String states;
	/**订单简单描述*/
	private String describe;
	/**订单创建时间*/
	private Date createTime;
	/**订单支付时间*/
	private Date payTime;
	/**后台审核用户ID*/
	private int sysUserId;
	/**订单到期时间*/
	private Date expireTime;
	/**支付类型 ALIPAY支付宝  FREE免费赠送,后台赠送  */
	private String payType;
	
	/**课程名称*/
	private String courseName;
	/**课程标题*/
	private String courseTitle;
	/**课程图片*/
	private String courseLogo;
	/**查询数*/
	private int limitNum;
	/**用户邮箱*/
	private String email;
	/**用户姓名*/
	private String userName;
	/**头像*/
	private String picImg;
	
	/**订单创建时间 格式化显示**/
	private String createTimeFormat;
	
	//格式化显示时间
	public void setCreateTime(Date date){
		this.createTime=date;
		this.createTimeFormat=getModelDate(this.getCreateTime());
	}
	
	public String getModelDate(Date oldDate) {
		if (oldDate!=null) {
			Date newDate = new Date();
			long second = (newDate.getTime() - oldDate.getTime()) / 1000L;
			if (second <= 60L)
				return second + "秒前";
			if ((60L < second) && (second <= 3600L)) {
				second /= 60L;
				return second + "分钟前";
			}
			if ((3600L < second) && (second <= 86400L)) {
				second = second / 60L / 60L;
				return second + "小时前";
			}
			if ((86400L < second) && (second <= 864000L)) {
				String formatDate = DateUtils.formatDate(oldDate, "HH:mm");
				second = second / 60L / 60L / 24L;

				return second + "天前";
			}
			return DateUtils.formatDate(oldDate, "yyyy-MM-dd HH:mm");
		}

		return "";
	}
}

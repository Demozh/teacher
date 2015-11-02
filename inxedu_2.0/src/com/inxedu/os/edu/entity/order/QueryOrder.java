package com.inxedu.os.edu.entity.order;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * @author www.inxedu.com
 *
 */
@Data
public class QueryOrder {
	private String keyWord;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date beginCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date beginPayTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endPayTime;
	private int userId;
	private String states;
}

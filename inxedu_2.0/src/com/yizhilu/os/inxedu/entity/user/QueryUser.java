package com.yizhilu.os.inxedu.entity.user;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class QueryUser {
	private int isavalible;
	private String keyWord;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date beginCreateTime;//查询 开始注册时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endCreateTime;//查询 结束注册时间
}

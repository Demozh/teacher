package com.inxedu.os.edu.entity.websiteehcache;

import java.io.Serializable;
import java.util.Date;

import com.inxedu.os.edu.entity.email.UserEmailMsg;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class WebsiteEhcache implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4611745081384979974L;
	
	private Long id;//主键自增
	private String ehcacheKey;//ehcache key
	private String ehcacheDesc;//ehcache 描述

}

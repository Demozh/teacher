package com.inxedu.os.edu.entity.system;

import java.io.Serializable;

import lombok.Data;

/**
 * @author www.inxedu.com
 *
 */
@Data
public class QuerySysUser implements Serializable{
	private static final long serialVersionUID = 1L;
	private String keyWord;
}

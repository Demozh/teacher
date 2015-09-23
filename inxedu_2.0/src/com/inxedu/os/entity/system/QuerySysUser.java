package com.inxedu.os.entity.system;

import java.io.Serializable;

import lombok.Data;

@Data
public class QuerySysUser implements Serializable{
	private static final long serialVersionUID = 1L;
	private String keyWord;
}

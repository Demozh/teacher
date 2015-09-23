package com.inxedu.os.entity.website;

import java.io.Serializable;

import lombok.Data;

/**
 * 图片类型
 */
@Data
public class WebSiteImagesType implements Serializable{
	private static final long serialVersionUID = 1L;
	/**类型ID*/
	private int typeId;
	/**类型名*/
	private String typeName;

}

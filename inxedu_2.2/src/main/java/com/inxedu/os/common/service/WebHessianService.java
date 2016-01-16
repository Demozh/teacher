package com.inxedu.os.common.service;

import java.util.Map;



/**
 * Created by Administrator on 2014/12/25.
 */
public interface WebHessianService {
	/**
	 * 查询用户信息
	 * @param cusId
	 * @return
	 */
	public Map<String,String> getUserInfo(Long cusId);

	/**
	 * 批量查询用户信息
	 * @param ids
	 * @return
	 */
	public Map<String,String> getUserInfoByUids(String ids);
}

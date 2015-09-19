package com.yizhilu.os.inxedu.service.user;

import java.util.List;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.entity.user.UserLoginLog;

public interface UserLoginLogService {
	/**
	 * 添加登录日志
	 * @param loginLog
	 * @return 日志ID
	 */
	public int createLoginLog(UserLoginLog loginLog);
	
	/**
	 * 查询用户登录日志
	 * @param userId 用户ID
	 * @param page 分页条件
	 * @return List<UserLoginLog>
	 */
	public List<UserLoginLog> queryUserLogPage(int userId,PageEntity page);
}

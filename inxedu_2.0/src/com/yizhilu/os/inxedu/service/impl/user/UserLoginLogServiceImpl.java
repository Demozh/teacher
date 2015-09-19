package com.yizhilu.os.inxedu.service.impl.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.user.UserLoginLogDao;
import com.yizhilu.os.inxedu.entity.user.UserLoginLog;
import com.yizhilu.os.inxedu.service.user.UserLoginLogService;

@Service("userLoginLogService")
public class UserLoginLogServiceImpl implements UserLoginLogService{

	@Autowired
	private UserLoginLogDao userLoginLogDao;
	
	public int createLoginLog(UserLoginLog loginLog) {
		return userLoginLogDao.createLoginLog(loginLog);
	}
	
	public List<UserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return userLoginLogDao.queryUserLogPage(userId, page);
	}

}

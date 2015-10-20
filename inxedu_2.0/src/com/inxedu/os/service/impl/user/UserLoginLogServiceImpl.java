package com.inxedu.os.service.impl.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.common.entity.PageEntity;
import com.inxedu.os.dao.user.UserLoginLogDao;
import com.inxedu.os.entity.user.UserLoginLog;
import com.inxedu.os.service.user.UserLoginLogService;

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

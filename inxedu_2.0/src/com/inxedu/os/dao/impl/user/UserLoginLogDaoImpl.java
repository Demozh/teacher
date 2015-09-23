package com.inxedu.os.dao.impl.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.dao.user.UserLoginLogDao;
import com.inxedu.os.entity.user.UserLoginLog;

@Repository("userLoginLogDao")
public class UserLoginLogDaoImpl extends GenericDaoImpl implements UserLoginLogDao {

	
	public int createLoginLog(UserLoginLog loginLog) {
		this.insert("UserLoginLogMapper.createLoginLog", loginLog);
		return loginLog.getLogId();
	}

	
	public List<UserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return this.queryForListPage("UserLoginLogMapper.queryUserLogPage", userId, page);
	}

}

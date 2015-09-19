package com.yizhilu.os.inxedu.dao.impl.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.user.UserLoginLogDao;
import com.yizhilu.os.inxedu.entity.user.UserLoginLog;

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

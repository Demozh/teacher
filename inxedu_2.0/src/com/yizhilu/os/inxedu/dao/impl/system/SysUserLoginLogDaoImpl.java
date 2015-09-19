package com.yizhilu.os.inxedu.dao.impl.system;

import java.util.List;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.system.SysUserLoginLogDao;
import com.yizhilu.os.inxedu.entity.system.SysUserLoginLog;
import org.springframework.stereotype.Repository;

@Repository("sysUserLoginLogDao")
public class SysUserLoginLogDaoImpl extends GenericDaoImpl implements SysUserLoginLogDao {

	
	public int createLoginLog(SysUserLoginLog loginLog) {
		this.insert("SysUserLoginLogMapper.createLoginLog", loginLog);
		return loginLog.getLogId();
	}

	
	public List<SysUserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return this.queryForListPage("SysUserLoginLogMapper.queryUserLogPage", userId, page);
	}

}

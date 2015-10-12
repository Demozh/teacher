package com.inxedu.os.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.dao.system.SysUserLoginLogDao;
import com.inxedu.os.entity.system.SysUserLoginLog;
import com.inxedu.os.service.system.SysUserLoginLogService;

@Service("sysUserLoginLogService")
public class SysUserLoginLogServiceImpl implements SysUserLoginLogService{

	@Autowired
	private SysUserLoginLogDao sysUserLoginLogDao;
	
	public int createLoginLog(SysUserLoginLog loginLog) {
		return sysUserLoginLogDao.createLoginLog(loginLog);
	}
	
	public List<SysUserLoginLog> queryUserLogPage(int userId, PageEntity page) {
		return sysUserLoginLogDao.queryUserLogPage(userId, page);
	}

}

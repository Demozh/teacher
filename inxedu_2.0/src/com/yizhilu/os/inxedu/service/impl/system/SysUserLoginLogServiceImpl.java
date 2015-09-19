package com.yizhilu.os.inxedu.service.impl.system;

import java.util.List;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.system.SysUserLoginLogDao;
import com.yizhilu.os.inxedu.entity.system.SysUserLoginLog;
import com.yizhilu.os.inxedu.service.system.SysUserLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

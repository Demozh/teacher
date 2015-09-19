package com.yizhilu.os.inxedu.dao.impl.system;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.system.SysFunctionDao;
import com.yizhilu.os.inxedu.entity.system.SysFunction;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("sysFunctionDao")
public class SysFunctionDaoImpl extends GenericDaoImpl implements SysFunctionDao{

	
	public List<SysFunction> queryAllSysFunction() {
		return this.selectList("SysFunctionMapper.queryAllSysFunction", null);
	}

	
	public int cresateSysFunction(SysFunction sysFunction) {
		this.insert("SysFunctionMapper.cresateSysFunction", sysFunction);
		return sysFunction.getFunctionId();
	}

	
	public void updateFunction(SysFunction sysFunction) {
		this.update("SysFunctionMapper.updateFunction", sysFunction);
	}

	
	public void updateFunctionParentId(Map<String, Object> paramrs) {
		this.update("SysFunctionMapper.updateFunctionParentId", paramrs);
	}

	
	public void deleteFunctionByIds(String ids) {
		this.delete("SysFunctionMapper.deleteFunctionByIds", ids);
	}
	
	
	public List<SysFunction> querySysUserFunction(int userId) {
		return this.selectList("SysFunctionMapper.querySysUserFunction", userId);
	}

}

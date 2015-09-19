package com.yizhilu.os.inxedu.dao.impl.system;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.system.SysRoleDao;
import com.yizhilu.os.inxedu.entity.system.SysRole;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sysRoleDao")
public class SysRoleDaoImpl extends GenericDaoImpl implements SysRoleDao{

	
	public int createRoel(SysRole sysRole) {
		this.insert("SysRoleMapper.createRoel", sysRole);
		return sysRole.getRoleId();
	}

	
	public void updateRole(SysRole sysRole) {
		this.update("SysRoleMapper.updateRole", sysRole);
	}

	
	public List<SysRole> queryAllRoleList() {
		return this.selectList("SysRoleMapper.queryAllRoleList", null);
	}

	
	public void deleteRoleByIds(String ids) {
		this.delete("SysRoleMapper.deleteRoleByIds", ids);
		
	}

	
	public void deleteRoleFunctionByRoleId(int roleId) {
		this.delete("SysRoleMapper.deleteRoleFunctionByRoleId", roleId);
		
	}

	
	public void deleteRoleFunctionByFunctionId(String functionId) {
		this.delete("SysRoleMapper.deleteRoleFunctionByFunctionId", functionId);
		
	}

	
	public void createRoleFunction(String value) {
		this.insert("SysRoleMapper.createRoleFunction", value);
		
	}

	
	public List<Integer> queryRoleFunctionIdByRoleId(int roleId) {
		return this.selectList("SysRoleMapper.queryRoleFunctionIdByRoleId", roleId);
	}

}

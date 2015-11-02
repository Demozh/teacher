package com.inxedu.os.edu.dao.impl.system;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.edu.dao.system.SysRoleDao;
import com.inxedu.os.edu.entity.system.SysRole;

/**
 * @author www.inxedu.com
 *
 */
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

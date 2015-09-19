package com.yizhilu.os.inxedu.dao.system;

import com.yizhilu.os.inxedu.entity.system.SysRole;

import java.util.List;

public interface SysRoleDao {
	
	/**
	 * 创建角色
	 * @param sysRole
	 * @return 角色ID
	 */
	public int createRoel(SysRole sysRole);
	
	/**
	 * 修改角色
	 * @param sysRole
	 */
	public void updateRole(SysRole sysRole);
	
	/**
	 * 查询所有的角色
	 * @return List<SysRole>
	 */
	public List<SysRole> queryAllRoleList();
	
	/**
	 * 删除角色
	 * @param ids
	 */
	public void deleteRoleByIds(String ids);
	
	/**
	 * 通过角色ID删除角色权限关联
	 * @param roleId
	 */
	public void deleteRoleFunctionByRoleId(int roleId);
	
	/**
	 * 通过权限ID，删除角色权限关联
	 * @param functionId
	 */
	public void deleteRoleFunctionByFunctionId(String functionId);
	
	/**
	 * 创建角色权限关联
	 * @param value
	 */
	public void createRoleFunction(String value);
	
	/**
	 * 获取角色对应的权限ID
	 * @param roleId
	 * @return
	 */
	public List<Integer> queryRoleFunctionIdByRoleId(int roleId);

}

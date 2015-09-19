package com.yizhilu.os.inxedu.controller.system;

import com.yizhilu.os.inxedu.common.controller.BaseController;
import com.yizhilu.os.inxedu.entity.system.SysFunction;
import com.yizhilu.os.inxedu.entity.system.SysRole;
import com.yizhilu.os.inxedu.service.system.SysFunctionService;
import com.yizhilu.os.inxedu.service.system.SysRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/sysrole")
public class SysRoleController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(SysRoleController.class);
	
	private static String rolePage=getViewPath("/admin/system/sys-role-page");
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysFunctionService sysFunctionService;

	@InitBinder("sysRole")
	public void initBinderSysBole(WebDataBinder binder){
		binder.setFieldDefaultPrefix("sysRole.");
	}

	/**
	 * 改变选择角色，勾选对应权限
	 * @param roleId 角色ID
	 * @return Map<String,Object>
	 */
	@RequestMapping("/changesrole/{roleId}")
	@ResponseBody
	public Map<String,Object> changesRole(@PathVariable("roleId") int roleId){
		try{
			this.setJson(false, null, null);
			if(roleId>0){
				List<Integer> functionIdList = sysRoleService.queryRoleFunctionIdByRoleId(roleId);
				this.setJson(true, null, functionIdList);
			}
		}catch (Exception e) {
			logger.error("changesRole()--error",e);
		}
		return json;
	}

	/**
	 * 删除角色
	 * @param roleId 角色ID
	 * @return Map<String,Object>
	 */
	@RequestMapping("/deleterole/{roleId}")
	@ResponseBody
	public Map<String,Object> deleteRole(@PathVariable("roleId") int roleId){
		try{
			if(roleId>0){
				sysRoleService.deleteRoleByIds(String.valueOf(roleId));
				sysRoleService.deleteRoleFunctionByRoleId(roleId);
				this.setJson(true, "角色删除成功", null);
			}else{
				this.setJson(false, "请选择要删除的角色!", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("deleteRole()--error");
		}
		return json;
	}

	/**
	 * 保存角色权限
	 * @param request
	 * @param roleId 角色ID
	 * @param functionIds 权限ID串
	 * @return Map<String,Object>
	 */
	@RequestMapping("/saveroelfunction/{roleId}")
	@ResponseBody
	public Map<String,Object> saveRoleFunction(HttpServletRequest request,@PathVariable("roleId") int roleId){
		try{
			if(roleId>0){
				//删除原有的角色权限关联记录
				sysRoleService.deleteRoleFunctionByRoleId(roleId);
				//得到权限ID串
				String functionIds = request.getParameter("functionIds");
				if(functionIds!=null && functionIds.trim().length()>0){
					String[] funArr = functionIds.split(",");
					if(funArr.length>0){
						StringBuffer val = new StringBuffer();
						for(String strFun : funArr){
							val.append("("+roleId+","+strFun+"),");
						}
						sysRoleService.createRoleFunction(val.toString());
					}
				}
			}
			this.setJson(true, "保存成功", null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("saveRoleFunction()--error",e);
		}
		return json;
	}

	/**
	 * 编辑角色
	 * @param request
	 * @param sysRoel
	 * @return Map<String,Object>
	 */
	@RequestMapping("/editrole/{type}")
	@ResponseBody
	public Map<String,Object> addRole(HttpServletRequest request,@ModelAttribute("sysRole") SysRole sysRole,@PathVariable("type") int type){
		try{
			if(sysRole.getRoleName()!=null && sysRole.getRoleName().trim().length()>0){
				if(type==1){
					sysRole.setCreateTime(new Date());
					sysRoleService.createRoel(sysRole);
					this.setJson(true, "["+sysRole.getRoleName()+"]角色创建成功", sysRole);
				}else if(type==2){
					sysRoleService.updateRole(sysRole);
					this.setJson(true, "修改成功", sysRole);
				}
			}else{
				this.setJson(false, "请输入角色名！", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("addRole()---error",e);
		}
		return json;
	}
	/**
	 * 进入角色管理页面
	 * @return ModelAndView
	 */
	@RequestMapping("/showroleList")
	public ModelAndView showRoleList(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		try{
			model.setViewName(rolePage);
			//查询所有的角色
			List<SysRole> roleList = sysRoleService.queryAllRoleList();
			model.addObject("roleList", roleList);
			//查询所有的权限
			List<SysFunction> functionList = sysFunctionService.queryAllSysFunction();
			model.addObject("functionList", gson.toJson(functionList));
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("showRoleList()--error",e);
		}
		return model;
	}
}

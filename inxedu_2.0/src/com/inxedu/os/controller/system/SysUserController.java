package com.inxedu.os.controller.system;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.WebUtils;
import com.inxedu.os.entity.system.QuerySysUser;
import com.inxedu.os.entity.system.SysRole;
import com.inxedu.os.entity.system.SysUser;
import com.inxedu.os.entity.system.SysUserLoginLog;
import com.inxedu.os.service.system.SysRoleService;
import com.inxedu.os.service.system.SysUserLoginLogService;
import com.inxedu.os.service.system.SysUserService;

@Controller
@RequestMapping("/admin/sysuser")
public class SysUserController extends BaseController {
	
	private static Logger logger = LoggerFactory.getLogger(SysUserController.class);
	
	/**用户列表页面*/
	private static String sysUserListPage = getViewPath("/admin/system/sys-user-list");
	/**日志列表*/
	private static String logList = getViewPath("/admin/system/sys-user-loginlog");
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysUserLoginLogService sysUserLoginLogService;
	@InitBinder({"sysUser"})
	public void initBinderSysUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("sysUser.");
	}
	@InitBinder({"querySysUser"})
	public void initBinderQuerySysUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("querySysUser.");
	}
	
	/**
	 * 查询用户登录日志
	 * @param request
	 * @param page 分页条件
	 * @return ModelAndView
	 */
	@RequestMapping("/looklog/{userId}")
	public ModelAndView lookLoginLog(HttpServletRequest request,@PathVariable("userId") int userId,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView();
		try{
			model.setViewName(logList);
			page.setPageSize(20);
			List<SysUserLoginLog> logList = sysUserLoginLogService.queryUserLogPage(userId, page);
			model.addObject("logList", logList);
			model.addObject("userId", userId);
			model.addObject("page", page);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("lookLoginLog()--error",e);
		}
		return model;
	}
	
	/**
	 * 禁用或启用用户
	 * @param request
	 * @param userId 用户ID
	 * @param type 2禁用  1启用
	 * @return Map<String,Object> 
	 */
	@RequestMapping("/disableOrstart/{userId}/{type}")
	@ResponseBody
	public Map<String,Object> disableOrstart(HttpServletRequest request,@PathVariable("userId") int userId,@PathVariable("type") int type){
		try{
			if(userId>0){
				sysUserService.updateDisableOrstartUser(userId, type);
				this.setJson(true, "操作成功", null);
			}else{
				this.setJson(false, "操作失败", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("disableOrstart()--error",e);
		}
		return json;
	}
	/**
	 * 修改用户密码
	 * @param reuqest
	 * @param userId 用户ID
	 * @param newPwd 用户新密码
	 * @return Map<String,Object>
	 */
	@RequestMapping("/updatepwd/{userId}")
	@ResponseBody
	public Map<String,Object> updateUserPew(HttpServletRequest request,@PathVariable("userId") int userId ){
		try{
			String newPwd = request.getParameter("newPwd");
			if(userId>0 && newPwd!=null && newPwd.trim().length()>0){
				SysUser sysuser =new SysUser();
				sysuser.setUserId(userId);
				
				if(!WebUtils.isPasswordAvailable(newPwd)){
					this.setJson(false, "输入错误，密码可由“_”，数字，英文大于等6位小于等于16位", null);
					return json;
				}
				sysuser.setLoginPwd(MD5.getMD5(newPwd));
				sysUserService.updateUserPwd(sysuser);
				this.setJson(true, "密码修改成功", null);
			}else{
				this.setJson(false, "密码修改失败", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("updateUserPew()---error",e);
		}
		return json;
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param sysuser 用户数据
	 * @return  Map<String,Object> 
	 */ 
	@RequestMapping("/updateuser")
	@ResponseBody
	public Map<String,Object> updateSysUser(HttpServletRequest request,@ModelAttribute("sysUser") SysUser sysuser){
		try{
			if(sysuser.getUserId()>0){
				if(sysuser.getEmail()!=null && sysuser.getEmail().trim().length()>0 && !WebUtils.checkEmail(sysuser.getEmail(), 50)){
					this.setJson(false, "请输入正确的邮箱号", null);
					return json;
				}
				if(sysuser.getTel()!=null && sysuser.getTel().trim().length()>0 && !WebUtils.checkMobile(sysuser.getTel())){
					this.setJson(false, "请输入正确的电话号", null);
					return json;
				}
				sysUserService.updateSysUser(sysuser);
				this.setJson(true, "修改成功", null);
			}else{
				this.setJson(false, "修改失败", null);
			}
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("udpateSysUser()--error",e);
		}
		return json;
	}
	
	
	/**
	 * 初始化修改用户修改
	 * @param userId 用户ID
	 * @return  Map<String,Object>
	 */
	@RequestMapping("/initupdateuser/{userId}")
	@ResponseBody
	public Map<String,Object> initUpdateUser(@PathVariable("userId") int userId){
		try{
			SysUser sysUser= sysUserService.querySysUserByUserId(userId);
			this.setJson(true, null, sysUser);
		}catch (Exception e) {
			this.setJson(false, null, null);
			logger.error("initUpdateUser()--error",e);
		}
		return json;
	}
	
	
	/**
	 * 创建用户
	 * @param request
	 * @param sysuser 用户实体
	 * @return Map<String,Object>
	 */
	@RequestMapping("/createuser")
	@ResponseBody
	public Map<String,Object> createSysUser(HttpServletRequest request,@ModelAttribute("sysUser") SysUser sysuser){
		try{
			Map<String,Object> resultJson = verifyUserData(sysuser);
			if(resultJson!=null){
				return resultJson;
			}
			boolean isExist = sysUserService.validateLoginName(sysuser.getLoginName());
			if(!isExist){
				this.setJson(false, "该帐户号已经存在", null);
				return json;
			}
			
			sysuser.setLoginName(sysuser.getLoginName().trim());
			sysuser.setLoginPwd(MD5.getMD5(sysuser.getLoginPwd()));
			sysuser.setCreateTime(new Date());
			sysUserService.createSysUser(sysuser);
			this.setJson(true, "用户保成功", null);
		}catch (Exception e) {
			this.setAjaxException();
			logger.error("createSysUser()--error",e);
		}
		return json;
	}
	/**
	 * 验证用户数据
	 * @param sysuser 用户实体
	 * @return Map<String,Object>
	 */
	private Map<String,Object> verifyUserData(SysUser sysuser) {
		
		if(sysuser.getLoginName()==null || sysuser.getLoginName().trim().equals("")){
			this.setJson(false, "请输入帐户号", null);
			return json;
		}else{
			
			if(WebUtils.checkLoginName(sysuser.getLoginName().trim())){
				this.setJson(false, "请输入6到20位字母数字组合的帐号", null);
				return json;
			}
		}
		if(sysuser.getLoginPwd()==null || !WebUtils.isPasswordAvailable(sysuser.getLoginPwd())){
			this.setJson(false, "密码错误，密码可由“_”，数字，英文大于等6位小于等于16位", null);
			return json;
		}
		if(sysuser.getEmail()!=null && !sysuser.getEmail().trim().equals("") && !WebUtils.checkEmail(sysuser.getEmail(), 50)){
			this.setJson(false, "请输入正确的邮箱号", null);
			return json;
		}
		if(sysuser.getTel()!=null && !sysuser.getTel().trim().equals("") && !WebUtils.checkMobile(sysuser.getTel())){
			this.setJson(false, "请输入正确的电话号码", null);
			return json;
		}
		return null;
	}
	
	
	/**
	 * 分页查询后台用户列表
	 * @param request
	 * @param querySysUser 查询条件
	 * @param page 分页条件
	 * @return 用户列表
	 */
	@RequestMapping("/userlist")
	public ModelAndView querySysUserList(HttpServletRequest request,@ModelAttribute("querySysUser") QuerySysUser querySysUser,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView();
		try{
			page.setPageSize(15);
			//设置页面路径 
			model.setViewName(sysUserListPage);
			//查询用户数据
			List<SysUser> sysUserList = sysUserService.querySysUserPage(querySysUser, page);
			//向页面传数据
			model.addObject("userList", sysUserList);
			model.addObject("page",page);
			
			//查询所有的角色
			List<SysRole> sysRoleList = sysRoleService.queryAllRoleList();
			model.addObject("sysRoleList",sysRoleList);
		}catch (Exception e) {
			logger.error("querySysUserList()--error",e);
			model.setViewName(this.setExceptionRequest(request, e));
		}
		return model;
	}
}

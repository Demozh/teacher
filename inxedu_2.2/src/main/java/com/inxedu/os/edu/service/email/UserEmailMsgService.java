package com.inxedu.os.edu.service.email;


import java.util.List;
import java.util.Map;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.edu.entity.email.UserEmailMsg;

/**
 * 
 * @ClassName com.yizhilu.os.edu.service.user.UserEmailMsgService
 * @description
 * @author : 
 * @Create Date : 2015年1月6日 下午10:00:56
 */
public interface UserEmailMsgService {
	/**
	 * 查询记录
	 * 
	 * @param userEmailMsg
	 * @param page
	 * @return
	 */
	public List<UserEmailMsg> queryUserEmailMsgList(UserEmailMsg userEmailMsg, PageEntity page);
	
	/**
	 * 获得单个记录
	 * 
	 * @param id
	 * @return
	 */
	public UserEmailMsg queryUserEmailMsgById(Long id);
	
	/**
	 * 添加发送用户邮件记录
	 * @return
	 */
	public void addUserEmailMsg(List<UserEmailMsg> userEmailMsgList);
	
	/**
     * 更新 UserEmailMsg
     */
    public void updateUserEmailMsgById(UserEmailMsg userEmailMsg);
    
    /**
     * 删除发送邮件记录
     */
    public void delUserEmailMsgById(Long id);
    
    /**
     * 发送邮件和短信定时service
     */
    public void queryTimingSendEmailMsg()throws Exception;
	
	/**
     * 起四个线程批量发送邮件
     */
    public void batchSendEmail(java.lang.String[] mailto, java.lang.String text, java.lang.String title,int num);
    
    /**
	 * 验证邮箱格式 去重
	 */
	public Map<String, Object> checkEmail(String emailStr);
	
	/**
	 * 验证手机格式 去掉重复的方法
	 */
	public Map<String, Object> checkMobile(String mobileArr);
}

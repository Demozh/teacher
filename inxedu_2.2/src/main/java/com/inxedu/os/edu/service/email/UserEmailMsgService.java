package com.inxedu.os.edu.service.email;


import java.util.List;

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
     * 起四个线程批量发送邮件
     */
    public void batchSendEmail(java.lang.String[] mailto, java.lang.String text, java.lang.String title,int num);
}

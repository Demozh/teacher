package com.inxedu.os.edu.dao.email;

import java.util.List;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.edu.entity.email.UserEmailMsg;


/**
 * 
 * @ClassName com.yizhilu.os.edu.dao.user.UserEmailMsgDao
 * @description
 * @author : 
 * @Create Date : 2015年1月6日 下午
 */
public interface UserEmailMsgDao {
	/**
     * 查询记录
     * 
     * @param userEmailMsg
     * @param page
     * @return
     */
    public List<UserEmailMsg> queryUserEmailMsgList(UserEmailMsg userEmailMsg,PageEntity page);
    
    /**
     * 获得单个记录
     * 
     * @param id
     * @return
     */
    public UserEmailMsg queryUserEmailMsgById(Long id);
    
    
    /**
     * 添加发送用户邮箱记录
     * 
     * @param userEmailMsg
     * @return
     */
    public Long addUserEmailMsg(List<UserEmailMsg> userEmailMsgList);
    
    /**
     * 更新 UserEmailMsg
     */
    public void updateUserEmailMsgById(UserEmailMsg userEmailMsg);
    
    /**
     * 删除发送邮件记录
     */
    public void delUserEmailMsgById(Long id);
    
    /**
     * 按条件查询邮箱记录
     */
    public List<UserEmailMsg> queryUserEmailList(UserEmailMsg userEmailMsg);
    
    /**
     * 更新邮件为已发送
     */
    public void updateUserEmailStatus(UserEmailMsg userEmailMsg);
    
}

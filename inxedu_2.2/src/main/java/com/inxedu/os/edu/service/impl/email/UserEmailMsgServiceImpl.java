package com.inxedu.os.edu.service.impl.email;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.util.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.util.ObjectUtils;

import com.inxedu.os.common.service.email.EmailService;
import com.inxedu.os.edu.dao.email.UserEmailMsgDao;
import com.inxedu.os.edu.entity.email.UserEmailMsg;
import com.inxedu.os.edu.service.email.EmailThread;
import com.inxedu.os.edu.service.email.UserEmailMsgService;

/**
 * 
 * @ClassName  com.yizhilu.os.edu.service.impl.user.UserEmailMsgServiceImpl
 * @description
 * @author : 
 * @Create Date : 2015年1月6日 下午
 */
@Service("userEmailMsgService")
public class UserEmailMsgServiceImpl implements UserEmailMsgService{
	@Autowired
    private UserEmailMsgDao userEmailMsgDao;
	@Autowired
    private EmailService emailService;
	
	/**
     * 查询记录
     * 
     * @param userEmailMsg
     * @param page
     * @return
     */
    public List<UserEmailMsg> queryUserEmailMsgList(UserEmailMsg userEmailMsg,
            PageEntity page) {
        return userEmailMsgDao.queryUserEmailMsgList(userEmailMsg, page);
    }
    
    /**
     * 获得单个记录
     * 
     * @param id
     * @return
     */
    public UserEmailMsg queryUserEmailMsgById(Long id) {
        return userEmailMsgDao.queryUserEmailMsgById(id);
    }
    
    /**
     * 添加发送用户邮箱记录
     * 
     * @param userEmailMsg
     * @return
     */
    public void addUserEmailMsg(List<UserEmailMsg> userEmailMsg) {
        userEmailMsgDao.addUserEmailMsg(userEmailMsg);
    }
    
    /**
     * 起四个线程批量发送邮件
     */
    public void batchSendEmail(java.lang.String[] mailto, java.lang.String text, java.lang.String title,int num){
        if(ObjectUtils.isNotNull(mailto)){
            List<String> list = new ArrayList<String>();
            list.addAll(Arrays.asList(mailto));
            EmailThread emailThread = new EmailThread(list,text,title,emailService);
            System.out.println("批量发送邮件线程启动：线程数："+num+"发送邮件数："+mailto.length);
            System.out.println("开始发送时间"+DateUtils.getNowTime());
            //启动多少线程
            for(int i=0;i<num;i++){
                new Thread(emailThread).start();
            }
        }
    }
}

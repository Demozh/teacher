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

import com.inxedu.os.edu.dao.email.UserMobileMsgDao;
import com.inxedu.os.edu.entity.email.UserMobileMsg;
import com.inxedu.os.edu.service.email.SmsBatchThread;
import com.inxedu.os.edu.service.email.SmsServiceStub;
import com.inxedu.os.edu.service.email.SmsThread;
import com.inxedu.os.edu.service.email.UserMobileMsgService;

/**
 * 
 * @ClassName  com.yizhilu.os.edu.service.impl.user.UserMobileMsgServiceImpl
 * @description
 * @author : XuJunBao
 * @Create Date : 2014年9月21日 下午10:08:33
 */
@Service("userMobileMsgService")
public class UserMobileMsgServiceImpl implements UserMobileMsgService{
    @Autowired
    private UserMobileMsgDao userMobileMsgDao;

    /**
     * 添加发送用户短信记录
     * 
     * @param userMobileMsg
     * @return
     */
    public void addUserMobileMsg(List<UserMobileMsg> userMobileMsg) {
        userMobileMsgDao.addUserMobileMsg(userMobileMsg);
    }

    /**
     * 查询记录
     * 
     * @param userMobileMsg
     * @param page
     * @return
     */
    public List<UserMobileMsg> queryUserMobileMsgList(UserMobileMsg userMobileMsg,
            PageEntity page) {
        return userMobileMsgDao.queryUserMobileMsgList(userMobileMsg, page);
    }

    /**
     * 获得单个记录
     * 
     * @param id
     * @return
     */
    public UserMobileMsg queryUserMobileMsgById(Long id) {
        return userMobileMsgDao.queryUserMobileMsgById(id);
    }
    /**
	 * 发送短信
	 * 
	 * @param msgContent
	 * @param destNumber
	 * @param sendTime
	 * @param subNumber
	 * @param wapURL
	 * @throws java.lang.Exception
	 */
    public void sendEx(String msgContent, String destNumber, String sendTime, String subNumber, String wapURL) throws Exception {
    	 	SmsServiceStub serviceStub  = new SmsServiceStub();
 	    	serviceStub.setDestNumber(destNumber);
 	    	serviceStub.setMsgContent(msgContent);
 	    	SmsThread smsThread = new SmsThread(serviceStub);
    	    smsThread.start();
    }
    /**
     * 发送短信
     */
    public void sendBatchEx(String msgContent, String[] destNumber) throws java.lang.Exception{
        if(ObjectUtils.isNotNull(destNumber)){
            for(String str:destNumber){
                SmsServiceStub serviceStub  = new SmsServiceStub();
                serviceStub.setDestNumber(str.trim());
                serviceStub.setMsgContent(msgContent);
                SmsThread smsThread = new SmsThread(serviceStub);
                smsThread.start();
                System.out.println(str.trim());
                Thread.sleep(100);
            }
        }

    }

    /**
     * 起多个线程批量发送手机
     */
    public void batchSendMobileMsg(java.lang.String text,java.lang.String[] mailto,int num){
        if(ObjectUtils.isNotNull(mailto)){
            List<String> list = new ArrayList<String>();
            list.addAll(Arrays.asList(mailto));
            SmsBatchThread smsBatchThread = new SmsBatchThread(list,text);
            System.out.println("批量发送短信线程启动：线程数："+num+"发送邮件数："+mailto.length);
            System.out.println("短信开始发送时间"+DateUtils.getNowTime());
            //启动多少线程
            for(int i=0;i<num;i++){
                new Thread(smsBatchThread).start();
            }
        }
    }
    /**
     * 查询和当前时间相等的短信记录 发送
     */
    public List<UserMobileMsg> queryNowMobileMsgList(Date nowDate){
    	return userMobileMsgDao.queryNowMobileMsgList(nowDate);
    }
    
    /**
     * 修改短信发送状态
     */
    public void updateMsgStatus(Long id){
    	userMobileMsgDao.updateMsgStatus(id);
    }
    
    /**
     * 定时发送  调用的方法
     */
    public void timingSendMsg(Date nowDate) throws Exception{
		List<UserMobileMsg> mobileMsgs=this.queryNowMobileMsgList(nowDate);
        if(ObjectUtils.isNotNull(mobileMsgs)){
            for (int i = 0; i < mobileMsgs.size(); i++) {
                String msgContent=mobileMsgs.get(i).getContent();
                String destNumber=mobileMsgs.get(i).getMobile();
                System.out.println(DateUtils.dateToStr(new Date(), "yyyy-MM-dd hh:mm:ss")+":发送短信"+destNumber);
                //发送
                this.batchSendMobileMsg(msgContent, destNumber.split(","),3);
                //修改短信发送状态
                this.updateMsgStatus(Long.valueOf(mobileMsgs.get(i).getId()));
            }
        }
	}
    
    /**
     * 修改短信
     * @param userMobileMsg
     */
    public void updateUserMobileMsg(UserMobileMsg userMobileMsg){
    	userMobileMsgDao.updateUserMobileMsg(userMobileMsg);
    }
    
    /**
     * 删除短信
     */
    public void delUserMobileMsg(Long id){
    	userMobileMsgDao.delUserMobileMsg(id);
    }
}

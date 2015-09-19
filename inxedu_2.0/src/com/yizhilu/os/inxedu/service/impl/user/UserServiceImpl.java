package com.yizhilu.os.inxedu.service.impl.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.common.util.ObjectUtils;
import com.yizhilu.os.inxedu.common.util.StringUtils;
import com.yizhilu.os.inxedu.dao.user.UserDao;
import com.yizhilu.os.inxedu.entity.user.QueryUser;
import com.yizhilu.os.inxedu.entity.user.User;
import com.yizhilu.os.inxedu.service.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	public int createUser(User user) {
		return userDao.createUser(user);
	}

	
	public User queryUserById(int userId) {
		return userDao.queryUserById(userId);
	}

	
	public boolean checkMobile(String mobile) {
		int count = userDao.checkMobile(mobile);
		if(count>0){
			return true;
		}
		return false;
	}

	
	public boolean checkEmail(String email) {
		int count = userDao.checkEmail(email);
		if(count>0){
			return true;
		}
		return false;
	}

	
	public User getLoginUser(String account,String password) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("account", account);
		map.put("password", password);
		return userDao.getLoginUser(map);
	}

	
	public void updateUserPwd(User user) {
		userDao.updateUserPwd(user);
		
	}

	
	public List<User> queryUserListPage(QueryUser query, PageEntity page) {
		return userDao.queryUserListPage(query, page);
	}

	
	public void updateUserStates(User user) {
		userDao.updateUserStates(user);
		
	}

	
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	
	public void updateImg(User user) {
		userDao.updateImg(user);
	}

	
	public void updateUserBannerUrl(User user) {
		userDao.updateUserBannerUrl(user);
	}

	
	public int queryAllUserCount() {
		return userDao.queryAllUserCount();
	}

	
	public User queryUserByEmailOrMobile(String emailOrMobile) {
		return userDao.queryUserByEmailOrMobile(emailOrMobile);
	}


	@Override
	public Map<String, User> queryCustomerInCusIds(List<Long> cusIds) throws Exception {
		if(ObjectUtils.isNotNull(cusIds)){
            Map<String, User> map = new HashMap<String, User>();
            // 通过传入的cusIds 查询customer
            List<User> queryCustomerList = userDao.queryUsersByIds(cusIds);
            // 整理数据放回map
            if (ObjectUtils.isNotNull(queryCustomerList)) {
                for (User queryCustomer : queryCustomerList) {
                    map.put(String.valueOf(queryCustomer.getUserId()), queryCustomer);
                }
            }
            return map;
        }else{
            return null;
        }
	}


	@Override
	public Map<String, User> getUserExpandByUids(String uids) throws Exception {
		String [] arrays=uids.split(",");
        List<Long> list = new ArrayList<Long>();
        for(String lo:arrays){
            if(StringUtils.isNotEmpty(lo)&&!"null".equals(lo)){
                list.add(Long.valueOf(lo));
            }
        }
        return queryCustomerInCusIds(list);
	}


	@Override
	public void updateUnReadMsgNumAddOne(String falg, Long cusId) {
		userDao.updateUnReadMsgNumAddOne(falg, cusId);
	}

	@Override
	public void updateUnReadMsgNumReset(String falg, Long cusId) {
		userDao.updateUnReadMsgNumReset(falg, cusId);
	}


	@Override
	public void updateCusForLST(Long cusId, Date date) {
		userDao.updateCusForLST(cusId, date);
	}



}

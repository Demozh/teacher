package com.inxedu.os.edu.service.impl.user;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.util.DateUtils;
import org.springframework.common.util.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.ObjectUtils;

import com.inxedu.os.edu.constants.enums.OrderState;
import com.inxedu.os.edu.constants.enums.PayType;
import com.inxedu.os.edu.dao.user.UserDao;
import com.inxedu.os.edu.entity.course.Course;
import com.inxedu.os.edu.entity.order.Order;
import com.inxedu.os.edu.entity.system.SysUser;
import com.inxedu.os.edu.entity.user.QueryUser;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.edu.service.course.CourseService;
import com.inxedu.os.edu.service.order.OrderService;
import com.inxedu.os.edu.service.system.SysUserService;
import com.inxedu.os.edu.service.user.UserService;
import com.opensymphony.module.sitemesh.taglib.decorator.MD5;
import com.inxedu.os.common.exception.BaseException;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.common.util.WebUtils;

/**
 * @author www.inxedu.com
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private CourseService courseService;
	
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


	@Override
	public String updateImportExcel(HttpServletRequest request,MultipartFile myFile,Integer mark) throws Exception {
		String msg="";
 		HSSFWorkbook wookbook = new HSSFWorkbook(myFile.getInputStream());
		HSSFSheet sheet = wookbook.getSheet("Sheet1");
		
		int rows = sheet.getLastRowNum();// 指的行数，一共有多少行+
		if(rows==0){
			throw new BaseException("请填写数据");
		}
		for (int i = 1; i <= rows+1; i++) {
			// 读取左上端单元格
			HSSFRow row = sheet.getRow(i);
			// 行不为空
			if (row != null) {
				// **读取cell**
				String email = getCellValue(row.getCell((short) 0));//邮箱
				String mobile = getCellValue(row.getCell((short) 1));//手机
				String pwd=getCellValue(row.getCell((short) 2));//获得密码
				String courseIds = getCellValue(row.getCell((short) 3));//赠送给用户学员的课程Id
				
				//邮箱
				if(ObjectUtils.isNull(email) || email.equals("")){
					if(mark==1){
						msg+="第" + i + "行邮箱错误<br/>";
						continue;
					}else{
						throw new BaseException("第" + i + "行邮箱错误<br/>");
					}
				}
				if(ObjectUtils.isNotNull(email) && StringUtils.isNotEmpty(email)){
					if (WebUtils.checkEmail(email, 50)==false) {
						if(mark==1){
							msg+="第"+i+"行邮箱格式错误<br/>";
							continue;
						}else{
							throw new BaseException("第"+i+"行邮箱格式错误<br/>");
						}
					}
				}
				boolean b = checkEmail(email.toLowerCase());
				if (b==true) {
					if(mark==1){
						msg+="第"+i+"行邮箱已存在<br/>";
						continue;
					}else{
						throw new BaseException("第"+i+"行邮箱已存在<br/>");
					}
				}
				//手机
				if(ObjectUtils.isNull(mobile) || mobile.equals("")){
					if(mark==1){
						msg+="第"+i+"行手机错误<br/>";
						continue;
					}else{
						throw new BaseException("第"+i+"行手机错误<br/>");
					}
				}
				if(ObjectUtils.isNotNull(mobile) && StringUtils.isNotEmpty(mobile)){
					if(!WebUtils.checkMobile(mobile)){
						if(mark==1){
							msg+="第"+i+"行手机格式错误<br/>";
							continue;
						}else{
							throw new BaseException("第"+i+"行手机格式错误<br/>");
						}
					}
				}
				//密码
				if(ObjectUtils.isNotNull(pwd) && !pwd.equals("")){
					if(pwd.length()<6 || pwd.length()>20){
						if(mark==1){
							msg+="第"+i+"行密码错误<br/>";
							continue;
						}else{
							throw new BaseException("第"+i+"行密码错误<br/>");
						}
					}
				}
				if(ObjectUtils.isNull(pwd) || pwd.equals("")){
					pwd="111111";
				}
				User user = new User();
				user.setEmail(email);//用户学员邮箱
				user.setMobile(mobile);//用户学员手机
				user.setPassword(MD5.getMD5(pwd));//用户学员密码
				user.setCreateTime(new Date());//注册时间
				user.setLastSystemTime(new Date());//上传统计系统消息时间
				userDao.createUser(user);//添加学员
				
				if(courseIds != null && !courseIds.equals("")){
					int userId = user.getUserId();//用户学员Id
					String[] courseIdArr = courseIds.replace(",", " ").trim().split(" ");//赠送课程Id数组
					for(int j=0;j<courseIdArr.length;j++){
						int courseId = Integer.parseInt(courseIdArr[j]);
						// 判断课程是否已过期
						boolean overdue = false;
						Course course = courseService.queryCourseById(courseId);
						if (ObjectUtils.isNull(course)) {
							if(mark==1){
								msg+="第"+i+"行第"+(j+1)+"个赠送课程不存在<br/>";
								continue;
							}else{
								throw new BaseException("第"+i+"行第"+(j+1)+"个赠送课程不存在<br/>");
							}
						}
						//如果课程价格为0可以观看
						if(course.getCurrentPrice().compareTo(new BigDecimal(0))==0){
							if(mark==1){
								msg+="第"+i+"行第"+(j+1)+"个赠送课程价格不能为零<br/>";
								continue;
							}else{
								throw new BaseException("第"+i+"行第"+(j+1)+"个赠送课程价格不能为零<br/>");
							}
						}
						//判断该课程是否可以观看
						boolean isok=orderService.checkUserCursePay(userId, courseId);;
						if(isok){
							if(mark==1){
								msg+="第"+i+"行第"+(j+1)+"个用户已经购买了此课程<br/>";
								continue;
							}else{
								throw new BaseException("第"+i+"行第"+(j+1)+"个用户已经购买了此课程<br/>");
							}
						}
						//判断是否到期
						if (course.getLoseType() == 0) {
							Date date = new Date();// 今天
							String nowStr = DateUtils.formatDate(date, "yyyy-MM-dd");
							String authStr = DateUtils.formatDate(course.getEndTime(), "yyyy-MM-dd");
							if (Integer.valueOf(DateUtils.getTwoDay(authStr, nowStr)) + 1 > 0) {
								overdue = true;
							}
						} else {
							overdue = true;
						}
						if (overdue) {
							Date nowDate = new Date();
							String orderNo= nowDate.getTime()+""+userId;//订单号
							//课程到期时间
							Date expireDate = null;
							// 课程有效期 到期时间
							if (course.getLoseType() == 0) {
								expireDate=course.getEndTime();
							}
							// 按天数计算
							else if (course.getLoseType() == 1) {//
								// 按所写时间推移过期时间
								Calendar now = Calendar.getInstance();
								now.setTime(nowDate);
								now.set(Calendar.DATE, now.get(Calendar.DATE) + Integer.valueOf(course.getLoseTime()));
								expireDate= now.getTime();
							}

							SysUser sysUser=sysUserService.querySysUserByUserId(SingletonLoginUtils.getLoginSysUserId(request));
							//创建订单
							Order order = new Order();
							//订单有效期
							order.setExpireTime(expireDate);
							//购买的课程ID
							order.setCourseId(Integer.parseInt(String.valueOf(course.getCourseId())));
							//购买的用户ID
							order.setUserId(userId);
							//订单号
							order.setOrderNo(orderNo);
							//订单总金额
							order.setSumMoney(course.getCurrentPrice());//订单总金额
							//订单状态
							order.setStates(OrderState.SUCCESS.toString());
							//订单简单描述
							order.setDescribe("后台管理员"+sysUser.getLoginName()+"赠送《"+course.getCourseName()+"》课程");
							//创建订单时间
							order.setCreateTime(nowDate);
							//后台订单审核用户ID，默认为0
							order.setSysUserId(sysUser.getUserId());
							order.setPayTime(new Date());
							//支付类型 赠送
							order.setPayType(PayType.FREE.toString());
							//执行创建订单
							int num = orderService.createOrder(order);
							if(num<=0){
								if(mark==1){
									msg+="第"+i+"行第"+(j+1)+"个赠送课程失败<br/>";
									continue;
								}else{
									throw new BaseException("第"+i+"行第"+(j+1)+"个赠送课程失败<br/>");
								}
							}
						} else {
							if(mark==1){
								msg+="第"+i+"行第"+j+1+"个赠送课程已过期<br/>";
								continue;
							}else{
								throw new BaseException("第"+i+"行第"+j+1+"个赠送课程已过期<br/>");
							}
						}
					}
				}
			}
		}
		return msg;
	}
	
	/**
	 * 获得Hsscell内容
	 * 
	 * @param cell
	 * @return
	 */
	public String getCellValue(HSSFCell cell) {
		String value = "";
		if (cell != null) {
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_FORMULA:
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				DecimalFormat df = new DecimalFormat("0");    
				value = df.format(cell.getNumericCellValue());
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue().trim();
				break;
			default:
				value = "";
				break;
			}
		}
		return value.trim();
	}
	
	/**
	 * 根据条件获取User列表  带课程名称
	 * @param user  用户
	 * @param page   分页参数
	 * @return
	 */
	public List<User> getUserListPage(User user, PageEntity page) {
		return userDao.getUserListPage(user, page);
	}

}

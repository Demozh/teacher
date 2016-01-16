package com.inxedu.os.edu.controller.email;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.ObjectUtils;

import com.google.gson.JsonObject;
import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.controller.user.AdminUserController;
import com.inxedu.os.edu.entity.email.UserEmailMsg;
import com.inxedu.os.edu.entity.system.SysUser;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.edu.service.email.EmailThread;
import com.inxedu.os.edu.service.email.SmsBatchThread;
import com.inxedu.os.edu.service.email.UserEmailMsgService;
import com.inxedu.os.edu.service.user.UserService;

/**
 * @author www.inxedu.com
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminEmailController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	
	private static final String sendEmailMsgList = getViewPath("/admin/email/sendEmail_list");// 短信管理页面
	private static final String sendEmailMsgInfo = getViewPath("/admin/email/sendEmail_info");// 邮件管理页面
	private static final String toSendEmailMsg = getViewPath("/admin/email/to_sendEmailMsg");// 发送邮件页面
	private static final String toSelectUserList = getViewPath("/admin/email/select_user_list");// 短信发送
	private static final String progressbar = getViewPath("/admin/email/progressbar");// 进度
	
	@Autowired
	private UserEmailMsgService userEmailMsgService;
	@Autowired
	private UserService userService;
	
	@InitBinder("userEmailMsg")
	public void initBinderEmail(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("userEmailMsg.");
	}
	
	/**
	 * 邮箱管理
	 */
	@RequestMapping("/email/sendEmaillist")
	public String querySendEmailMsgList(Model model, HttpServletRequest request, @ModelAttribute("userEmailMsg") UserEmailMsg userEmailMsg, @ModelAttribute("page") PageEntity page) {
		try {
			page.setPageSize(10);
			List<UserEmailMsg> list = userEmailMsgService.queryUserEmailMsgList(userEmailMsg, page);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			logger.error("querySendEmailMsgList", e);
		}
		return sendEmailMsgList;
	}
	
	/**
	 * 查询邮件详情
	 */
	@RequestMapping("/email/sendEmailMsgInfo/{id}")
	public String querySendEmailMsgInfo(Model model, @PathVariable("id") Long id) {
		try {
			UserEmailMsg userEmailMsg = userEmailMsgService.queryUserEmailMsgById(id);
			model.addAttribute("userEmailMsg", userEmailMsg);
		} catch (Exception e) {
			logger.error("querySendMobleMsgInfo", e);
		}
		return sendEmailMsgInfo;
	}
	
	/**
	 * 跳转发送邮件页面
	 * 
	 * @return
	 */
	@RequestMapping("/email/toEmailMsg")
	public String toSendEmailMsg() {
		return toSendEmailMsg;
	}
	
	/**
	 * 短信邮件发送 查询用户列表集合
	 * 
	 * @param user
	 * @param page
	 * @return
	 */
	@RequestMapping("/email/select_userlist")
	public ModelAndView selectUserList(@ModelAttribute User user, @ModelAttribute("page") PageEntity page) {
		ModelAndView modelandView = new ModelAndView();
		// 设置返回页面
		modelandView.setViewName(toSelectUserList);
		try {
			// 查询学员列表
			List<User> list = userService.getUserListPage(user, page);
			// 把参数放到modelAndView中
			modelandView.addObject("list", list);
			modelandView.addObject("page", page);
		} catch (Exception e) {
			logger.error("AdminUserController.userList", e);
		}
		return modelandView;
	}
	
	/**
	 * 导入Excel 解析
	 */
	@RequestMapping("/email/importMsgExcel")
	@ResponseBody
	public Map<String, Object> importExcel(HttpServletRequest request, @RequestParam("myFile") MultipartFile myFile) {
		Map<String, Object> json = null;
		try {
			logger.info("myFile:" + myFile.getName());
			HSSFWorkbook wookbook = new HSSFWorkbook(myFile.getInputStream());
			// 只读取sheet1
			HSSFSheet sheet = wookbook.getSheet("Sheet1");
			int rows = sheet.getLastRowNum();// Excel行数
			String mobileStr = "";
			for (int i = 1; i <= rows; i++) {
				// 读取左上端单元格
				HSSFRow row = sheet.getRow(i);
				// 行不为空
				if (row != null) {
					// **读取cell**
					HSSFCell cell = row.getCell((short) 0);
					if (cell != null) {
						switch (cell.getCellType()) {
						case HSSFCell.CELL_TYPE_FORMULA:
							break;
						case HSSFCell.CELL_TYPE_NUMERIC:
							DecimalFormat df = new DecimalFormat("#");
							mobileStr += df.format(cell.getNumericCellValue()) + ",";
							break;
						case HSSFCell.CELL_TYPE_STRING:
							mobileStr += cell.getStringCellValue().trim() + ",";
							break;
						default:
							break;
						}
					}
				}
			}
			// 获得页面的
			if (request.getParameter("numerStr") != null && request.getParameter("numerStr") != "") {
				mobileStr += request.getParameter("numerStr");
			}
			Map<String, Object> returnMap = null;
			// 邮箱页面
			returnMap = checkEmail(mobileStr);
			if (Boolean.parseBoolean(returnMap.get("flag").toString()) == false) {
				json = this.setJson(false, returnMap.get("errorMessage").toString(), "");
				return json;
			} else {
				json = this.setJson(true, "", returnMap.get("returnList"));
			}
		} catch (Exception e) {
			logger.error("importExcel", e);
			json = this.setJson(false, "Excel导入错误", null);
			return json;
		}
		return json;
	}
	
	/**
	 * 验证邮箱格式 去重
	 * 
	 * @param emailStr
	 */
	public Map<String, Object> checkEmail(String emailStr) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		emailStr = emailStr.replaceAll("\r\n", "");// 去除空格回车
		emailStr = emailStr.replaceAll(" ", "");// 去除空格回车
		String[] lm = emailStr.split(",");// 定义数组

		List list = new ArrayList();// new一个arralist
		Set set = new HashSet();// new 一个hashset
		set.addAll(Arrays.asList(lm));// 将数组转为list并存入set中，就可以去掉重复项了
		for (Iterator it = set.iterator(); it.hasNext();) {
			list.add(it.next());// 遍历set 将所有元素键入list中
		}
		String noRepeatList = list.toString();
		noRepeatList = noRepeatList.replace("[", "");
		noRepeatList = noRepeatList.replace("]", "");
		noRepeatList = noRepeatList.replace(" ", "");
		noRepeatList = noRepeatList.trim();

		boolean flag = true;
		String errorMessage = "";
		String[] lms = noRepeatList.split(",");
		if (lms.length > 0) {
			for (int i = 0; i < lms.length; i++) {
				if (!lms[i].trim().matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")) {
					flag = false;
					errorMessage = lms[i] + "格式有误";
					break;
				}
			}
		}

		returnMap.put("flag", flag);
		returnMap.put("returnList", noRepeatList);
		returnMap.put("errorMessage", errorMessage);
		return returnMap;
	}
	
	/**
	 * 发送邮件
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/sendEmailMsg")
	@ResponseBody
	public Map<String, Object> sendEmailMsg(HttpServletRequest request) {
		Map<String, Object> json = null;
		try {
			String linksman = request.getParameter("linksman");// 获取联系人
			String title = request.getParameter("title");// 获取标题
			String content = request.getParameter("content");// 获取内容

			int type = Integer.valueOf(request.getParameter("type"));// 邮件类型
			String startTime = request.getParameter("startTime");// 发送时间
			Date starttime = new Date();
			// 如果是定时短信发送时间要大于当前时间
			if (type == 2) {
				if ("".equals(startTime)) {
					json = this.setJson(false, "请输入发送时间", "");
					return json;
				}
				SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				starttime = formatDate.parse(startTime);
				if (!starttime.after(new Date())) {
					json = this.setJson(false, "定时发送的时间要大于当前日期", "");
					return json;
				}
			}

			if (StringUtils.isNotEmpty(linksman) && StringUtils.isNotEmpty(content) && StringUtils.isNotEmpty(title)) {
				// 验证邮箱
				Map<String, Object> returnMap = checkEmail(linksman);
				// 错误信息
				String errorEmail = returnMap.get("errorMessage").toString();
				if (Boolean.parseBoolean(returnMap.get("flag").toString()) == false) {
					json = this.setJson(false, errorEmail, "");
					return json;
				} else {
					SysUser user = SingletonLoginUtils.getLoginSysUser(request);
					List<UserEmailMsg> emailMsgList = new ArrayList<UserEmailMsg>();
					UserEmailMsg userEmailMsg = new UserEmailMsg();
					userEmailMsg.setId(0);
					userEmailMsg.setTitle(title);
					userEmailMsg.setContent(content);
					userEmailMsg.setEmail(returnMap.get("returnList").toString());
					userEmailMsg.setType(type);
					userEmailMsg.setSendTime(starttime);
					if (type == 1) {
						// 发送邮件
						userEmailMsgService.batchSendEmail(returnMap.get("returnList").toString().split(","), content, title, 3);
						// emailService.sendBatchMail(returnMap.get("returnList").toString().split(","),
						// content, title);
						userEmailMsg.setStatus(1);
					} else {
						userEmailMsg.setStatus(2);

					}
					if (ObjectUtils.isNotNull(user)) {
						userEmailMsg.setUserId(Long.parseLong(""+user.getUserId()));
					} else {
						userEmailMsg.setUserId(0L);
					}
					userEmailMsg.setCreateTime(new Date());
					emailMsgList.add(userEmailMsg);
					userEmailMsgService.addUserEmailMsg(emailMsgList);
					errorEmail = "发送成功";
				}
				json = this.setJson(Boolean.parseBoolean(returnMap.get("flag").toString()), errorEmail, "");
			} else {
				json = this.setJson(false, "联系人、标题或内容不能为空", null);
			}
		} catch (Exception e) {
			logger.error("sendEmailMsg", e);
		}
		return json;
	}
	
	/**
	 * 进度条
	 */
	@RequestMapping("/email/progressbar")
	public String progressbar(HttpServletRequest request, @RequestParam("type") int type) {
		try {
			request.setAttribute("type", type);
		} catch (Exception e) {
			logger.error("progressbar", e);
		}
		return progressbar;
	}
	
	/**
	 * 查询进度
	 */
	@RequestMapping("/query/progressbar")
	@ResponseBody
	public Object queryprogressbar(HttpServletRequest request, @RequestParam("type") int type) {
		Map<String, Object> json = null;
		try {
			if (type == 1) {
				EmailThread emailThread = new EmailThread();
				double sumNum = Double.valueOf(emailThread.getSumNum());
				double listNum = Double.valueOf(emailThread.getList().size());
				Map map = new HashMap();
				map.put("sumNum", sumNum);
				map.put("listNum", listNum);
				json = this.setJson(true, "", map);
			} else {
				SmsBatchThread smsBatchThread = new SmsBatchThread();
				double sumNum = Double.valueOf(smsBatchThread.getSumNum());
				double listNum = Double.valueOf(smsBatchThread.getList().size());
				Map map = new HashMap();
				map.put("sumNum", sumNum);
				map.put("listNum", listNum);
				json = this.setJson(true, "", map);
			}
		} catch (Exception e) {
			logger.error("queryprogressbar", e);
		}
		return json;
	}
	
}

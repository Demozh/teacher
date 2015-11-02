package com.inxedu.os.edu.controller.pay;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.common.alipay.Payment;
import org.springframework.common.alipay.PaymentPersonal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.constants.CommonConstants;
import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.constants.enums.OrderState;
import com.inxedu.os.edu.constants.enums.WebSiteProfileType;
import com.inxedu.os.edu.entity.course.Course;
import com.inxedu.os.edu.entity.order.Order;
import com.inxedu.os.edu.service.course.CourseService;
import com.inxedu.os.edu.service.order.OrderService;
import com.inxedu.os.edu.service.website.WebsiteProfileService;

/**
 * @author www.inxedu.com
 *
 */
@Controller
@RequestMapping("/zfbpay")
public class ZfbPayController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(ZfbPayController.class);
	private static String zfbPage = getViewPath("/web/pay/zhifubao");
	private static String payOkPage = getViewPath("/web/pay/payok");
	private static String payErrorPage = getViewPath("/web/pay/pay-error");
	private static String MESSAGE ="message";
	@Autowired
	private CourseService courseService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private WebsiteProfileService websiteProfileService;
	
	/**
	 * 重新支付订单
	 * @param request
	 * @param orderId 订单ID
	 * @return ModelAndView
	 */
	@RequestMapping("/order/againpay/{orderId}")
	public ModelAndView againPay(HttpServletRequest request,@PathVariable("orderId") int orderId){
		ModelAndView model = new ModelAndView();
		model.setViewName(payErrorPage);
		try{
			Order order = orderService.queryOrderById(orderId);
			Course course = courseService.queryCourseById(order.getCourseId());
			if(order!=null && course!=null){
				if(order.getStates().equals(OrderState.INIT.toString())){
					//获取支付宝配置
					Map<String,Object> alipay = websiteProfileService.getWebsiteProfileByType(WebSiteProfileType.alipay.toString());
					@SuppressWarnings("unchecked")
					Map<String,Object> alipayConfig = (Map<String, Object>) alipay.get("alipay");
					//获取跳转支付宝URL
					String zfbUrl = null;
					if(alipayConfig.get("status").toString().equals("0")){
						//企业支付宝
						zfbUrl = enterZfbParm(order,course,alipayConfig);
					}else if(alipayConfig.get("status").toString().equals("1")){
						//个人支付宝
						zfbUrl = zfbParm(order,course,alipayConfig);
					}
					model.addObject("zfbUrl", zfbUrl);
					model.setViewName(zfbPage);
				}else{
					if(order.getStates().equals(OrderState.SUCCESS.toString())){
						model.addObject(MESSAGE, "订单已经成功支付,不可重新支付！");
					}else if(order.getStates().equals(OrderState.CANCEL.toString())){
						model.addObject(MESSAGE, "订单已被取消,支付失败！");
					}
				}
			}else{
				model.addObject(MESSAGE, "错误订单,支付失败！");
			}
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("againPay()--error",e);
		}
		return model;
	}
	/**
	 * 跳转支付宝支付
	 * @param request
	 * @param courseId 课程ID
	 * @return ModelAndView
	 */
	@RequestMapping("/gotozfb/{courseId}")
	public ModelAndView goToZfb(HttpServletRequest request,@PathVariable("courseId") int courseId){
		ModelAndView model = new ModelAndView();
		try{
			Date nowDate = new Date();
			int userId = SingletonLoginUtils.getLoginUserId(request);
			Course course = courseService.queryCourseById(courseId);
			if(userId>0 && course!=null){
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
				// 如果课程已经过期
				if (nowDate.getTime() > expireDate.getTime()) {
					model.addObject(MESSAGE, "购买失败,此课程已过期,请选择其他课程！");
					model.setViewName(payErrorPage);
					return model;
				}
				
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
				//订单初始化状态
				order.setStates(OrderState.INIT.toString());
				//订单简单描述
				order.setDescribe("购买《"+course.getCourseName()+"》课程");
				//创建订单时间 
				order.setCreateTime(nowDate);
				//后台订单审核用户ID，默认为0
				order.setSysUserId(0);
				//执行创建订单
				orderService.createOrder(order);
				//如果订单金额是0元，则直接设置支付成功
				if(order.getSumMoney().compareTo(new BigDecimal(0))==0){
					order.setStates(OrderState.SUCCESS.toString());
					order.setPayTime(new Date());
					orderService.updateOrderSuccess(order);
					model.setViewName(payOkPage);
				}else{
					//获取支付宝配置
					Map<String,Object> alipay = websiteProfileService.getWebsiteProfileByType(WebSiteProfileType.alipay.toString());
					@SuppressWarnings("unchecked")
					Map<String,Object> alipayConfig = (Map<String, Object>) alipay.get("alipay");
					//获取跳转支付宝URL
					String zfbUrl = null;
					if(alipayConfig.get("status").toString().equals("0")){
						//企业支付宝
						zfbUrl = enterZfbParm(order,course,alipayConfig);
					}else if(alipayConfig.get("status").toString().equals("1")){
						//个人支付宝
						zfbUrl = zfbParm(order,course,alipayConfig);
					}
					model.addObject("zfbUrl", zfbUrl);
					model.setViewName(zfbPage);
				}
			}else{
				model.addObject(MESSAGE, "错误订单,支付失败！");
				model.setViewName(payErrorPage);
			}
		}catch (Exception e) {
			this.setExceptionRequest(request, e);
			logger.error("goToZfb()---error",e);
		}
		return model;
	}
	
	/**
	 * 企业支付
	 * @param order 订单
	 * @param course 课程
	 * @param alipayConfig 支付宝配置
	 * @return 返回跳转支付宝路径
	 */
	public String enterZfbParm(Order order,Course course,Map<String,Object> alipayConfig) {
		String paygateway = "https://mapi.alipay.com/gateway.do?";// 支付接口
		String service = "create_direct_pay_by_user";// 快速付款交易服务
		String sign_type = "MD5";// 文件加密机制
		String out_trade_no = order.getOrderNo();// 商户网站订单
		String input_charset = "utf-8";// （不可以修改）
		
		String partner = alipayConfig.get("alipaypartnerID").toString();// pid
		String key = alipayConfig.get("alipaykey").toString();// key
		String seller_email = alipayConfig.get("sellerEmail").toString();// 卖家支付宝帐户
		
		String body = order.getDescribe();// 商品描述，
		String total_fee = order.getSumMoney().toString();// 订单总价
		String payment_type = "1";// 行为类型 1商品购买
		String subject = course.getCourseName();// 商品名称
		String show_url = CommonConstants.contextPath + "/front/couinfo/"+course.getCourseId();//根据集成的网站而定
		String path = CommonConstants.contextPath;
		String notify_url = path + "/zfbpay/callback/1";// 同步回调（本地测试）
		String return_url = path + "/zfbpay/callback/2";// 异步回调（线上）
		String paymethod = "directPay";
		String defaultbank = null;
		
		String extra_common_param=order.getOrderNo();//扩展信息
		//访问路径，传递给支付宝
		String zfbUrl = Payment.CreateUrl(paygateway, service, sign_type, out_trade_no, input_charset, partner, key, show_url, body, total_fee, payment_type, seller_email, subject, notify_url, return_url, paymethod, defaultbank, extra_common_param);
		logger.info("+++ zfbUrl:" + zfbUrl); //  日志记录签名
		return zfbUrl;
	}
	
	/**
	 * 生成支付信息 （个人支付帐号）
	 * @param order 订单
	 * @param course 课程
	 * @param alipayConfig 支付宝配置
	 * @return
	 */
	private String zfbParm(Order order,Course course,Map<String,Object> alipayConfig) {
		String out_trade_no = order.getOrderNo();			   // 商户网站订单
		String total_fee = order.getSumMoney().toString();  // 订单总价
		String contextPath = CommonConstants.contextPath;		   // 项目域名
		String input_charset = "utf-8";// （不可以修改）
		String sign_type = "MD5";// 文件加密机制
		
		String partner = alipayConfig.get("alipaypartnerID").toString();// pid
		String key = alipayConfig.get("alipaykey").toString();// key
		String sellerEmail = alipayConfig.get("sellerEmail").toString();// 卖家支付宝帐户
		
		String notify_url = contextPath + "/zfbpay/callback/1"; // 通知接收URL(本地测试时，服务器返回无法测试)
		String return_url = contextPath + "/zfbpay/callback/2"; // 支付完成后跳转返回的网址URL
		String service = "trade_create_by_buyer";				   // 接口名称
		String subject = course.getCourseName();				// 商品名称
		String payment_type = "1";								   // 收款类型
		String logistics_fee = "0";								   // 物流费用
		String logistics_payment = "BUYER_PAY";					   // 物流支付类型
		String logistics_type = "EMS";
		String quantity = "1";									   // 商品数量
		String url = PaymentPersonal.createUrl(service,partner, input_charset,sign_type, key, out_trade_no, subject, payment_type, logistics_fee,logistics_payment, sellerEmail, total_fee, quantity, notify_url, return_url,logistics_type);
		return url;
	}
	
	/**
	 * 支付成功回调
	 * @param request
	 * @param response
	 * @param type 1同步 2异步
	 * @return ModelAndView
	 */
	@RequestMapping("/callback/{type}")
	public ModelAndView zfbCallback(HttpServletRequest request,HttpServletResponse response,@PathVariable("type") int type){
		ModelAndView model = new ModelAndView();
		try{
			model.setViewName(payOkPage);
			// 订单号
			String out_trade_no = request.getParameter("out_trade_no");
			if (request.getParameter("trade_status").equals("TRADE_FINISHED") || request.getParameter("trade_status").equals("TRADE_SUCCESS")) {
				Order order = new Order();
				order.setOrderNo(out_trade_no);
				order.setPayTime(new Date());
				order.setStates(OrderState.SUCCESS.toString());
				orderService.updateOrderSuccess(order);
			}
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("zfbCallback()--error",e);
		}
		return model;
	}
}

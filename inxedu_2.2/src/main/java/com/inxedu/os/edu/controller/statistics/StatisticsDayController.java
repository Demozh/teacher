package com.inxedu.os.edu.controller.statistics;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.edu.entity.statistics.StatisticsDay;
import com.inxedu.os.edu.service.statistics.StatisticsDayService;

/**
 * StatisticsDay管理接口
 * @author www.inxedu.com
 */
@Controller
@RequestMapping("/admin")
public class StatisticsDayController extends BaseController {
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsDayController.class);
	@Autowired
	private StatisticsDayService statisticsDayService;

	private static final String loginChart = getViewPath("/admin/statistics/login_statistics");// 用户登录统计图
	private static final String registeredChart = getViewPath("/admin/statistics/registered_statistics");// 用户注册统计图
	private static final String orderChart = getViewPath("/admin/statistics/order_statistics");// 用户订单统计图
	private static final String GenerationStatisticsChart = getViewPath("/admin/statistics/generation_statistics");// 生成统计图

	/**
	 * 登录统计（活跃人数）信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/statistics/login")
	public ModelAndView getLoginStatistics(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView(loginChart);
		try {
			SimpleDateFormat s = new SimpleDateFormat("yyyy");
			String month = request.getParameter("month");// 月份
			String year = request.getParameter("year");// 年
			if (year == null) {
				year = s.format(new Date());
			}
			Map<String, Object> sourceMap = statisticsDayService
					.getStatisticsMsg(month, year);
			@SuppressWarnings("unchecked")
			List<StatisticsDay> statistics = (List<StatisticsDay>) sourceMap
					.get("statisticsDayList");
			String showDate = (String) sourceMap.get("showDate");// 统计js的X轴的日期显示
			String loginNum = "";// 登录数
			for (int i = statistics.size() - 1; i >= 0; i--) {
				loginNum += statistics.get(i).getLoginNum() + ",";
			}
			if (loginNum.length() > 0) {
				loginNum = loginNum.substring(0, loginNum.length() - 1);
			}

			modelAndView.addObject("chart", showDate + "|" + loginNum);// 绘图数据
			modelAndView.addObject("statistics", statistics);// 表数据
			modelAndView.addObject("month", month);
			modelAndView.addObject("year", year);
		} catch (Exception e) {
			logger.error("StatisticsDayController.getLoginStatistics" + e);
			return new ModelAndView(this.setExceptionRequest(request, e));
		}
		return modelAndView;
	}

	/**
	 * 最近统计查询
	 * 
	 * @param request
	 * @param days
	 * @param type
	 * @return
	 */
	@RequestMapping("/statistics/web/detailajax")
	@ResponseBody
	public Map<String, Object> getWebStatisticsAjax(HttpServletRequest request,
			@RequestParam int days, @RequestParam String type) {
		Map<String,Object> json = null;
		try {
			if (days > 0) {// 历史的
				List<StatisticsDay> loginStatistics = statisticsDayService
						.getStatisticThirty(days);
				String statisticalNum = "";// 登录数--统计数（包括三中）
				String orderNum = "";//总下单数
				String orderSuccessNum = "";//下单支付成功数
				String orderInitNum = "";//下单未支付数
				String orderClosedNum="";//下单取消数
				Calendar c = Calendar.getInstance();
				Object[] showDate = new Object[days];// 时间轴
				for (int i = loginStatistics.size() - 1; i >= 0; i--) {
					c.setTime(loginStatistics.get(i).getStatisticsTime());
					if (days > 15) {
						showDate[loginStatistics.size() - 1 - i] = c
								.get(Calendar.DAY_OF_MONTH);
					} else {
						showDate[loginStatistics.size() - 1 - i] = (c
								.get(Calendar.MONTH) + 1)
								+ "月"
								+ c.get(Calendar.DAY_OF_MONTH);
					}
					if (type.equals("LOGIN_NUM")) {
						statisticalNum += loginStatistics.get(i).getLoginNum()
								+ ",";
					}
					if(type.equals("REGISTERED_NUM")){
						statisticalNum += loginStatistics.get(i).getRegisteredNum()
								+ ",";
					}
					if(type.equals("ORDER_NUM")){
						orderNum += loginStatistics.get(i).getOrderNum()
								+ ",";
						orderSuccessNum += loginStatistics.get(i).getOrderSuccessNum()
								+ ",";
						orderInitNum += loginStatistics.get(i).getOrderInitNum()
								+ ",";
						orderClosedNum += loginStatistics.get(i).getOrderClosedNum()
								+ ",";
						}
				}
				if(type.equals("LOGIN_NUM")||type.equals("REGISTERED_NUM")){
					if (statisticalNum.length() > 0) {
						statisticalNum = statisticalNum.substring(0,
								statisticalNum.length() - 1);
					}
					json = this.setJson(true, gson.toJson(showDate)
							.toString(), statisticalNum);
				}
				if(type.equals("ORDER_NUM")){
					Map<String, Object> map=new HashMap<String, Object>();
					if(orderNum.length()>0){
						orderNum = orderNum.substring(0, orderNum.length()-1);
						map.put("orderNum", orderNum);
					}
					if(orderSuccessNum.length()>0){
						orderSuccessNum = orderSuccessNum.substring(0, orderSuccessNum.length()-1);
						map.put("orderSuccessNum", orderSuccessNum);
					}
					if(orderInitNum.length()>0){
						orderInitNum = orderInitNum.substring(0, orderInitNum.length()-1);
						map.put("orderInitNum", orderInitNum);
					}
					if(orderClosedNum.length()>0){
						orderClosedNum = orderClosedNum.substring(0, orderClosedNum.length()-1);
						map.put("orderClosedNum", orderClosedNum);
					}
					json = this.setJson(true, gson.toJson(showDate).toString(), map);
				}
			} else {// 今天的

			}

		} catch (Exception e) {
			logger.error("StatisticsDayController.getWebStatisticsAjax" + e);
			json = this.setJson(false, "", null);
		}
		return json;
	}

	/**
	 * 生成指定时间段的统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/statistics/create/batch")
	@ResponseBody
	public Map<String, Object> createStatisticsByDate(HttpServletRequest request) {
		Map<String,Object> json = new HashMap<String,Object>();
		try {
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			List<StatisticsDay> statistics = statisticsDayService
					.getStatisticsByDate(startTime, endTime);
			if (statistics.size() > 0) {// 时间段内已有数据
				json = this.setJson(true, "exists", null);
				return json;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dBegin = sdf.parse(startTime);
			Date dEnd = sdf.parse(endTime);	
			statisticsDayService.createStatisticsByDate(dBegin, dEnd);
			json = this.setJson(true, "true", null);
		} catch (Exception e) {
			logger.error("StatisticsDayController.createStatisticsByDate" + e);
			json = this.setJson(false, "error", null);
		}
		return json;
	}

	/**
	 * 删除指定时间段的统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/statistics/del/batch")
	@ResponseBody
	public Map<String, Object> delStatisticsByDate(HttpServletRequest request) {
		Map<String,Object> json = new HashMap<String,Object>();
		try {
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			statisticsDayService.delStatisticsByDate(startTime, endTime);
			json = this.setJson(true, "true", null);
		} catch (Exception e) {
			logger.error("StatisticsDayController.createStatisticsByDate" + e);
			json = this.setJson(false, "error", null);
		}
		return json;
	}
	
	/**
	 * 每日注册人数
	 */
	@RequestMapping("/todayRegisteredNum")
	@ResponseBody
	public Map<String, Object> todayRegisteredNum(){
		Map<String, Object> json = null;
		try{
			int registeredNum=statisticsDayService.getTodayRegisteredNum(new Date());
			json = this.setJson(true, "true", registeredNum);
		}catch(Exception e){
			logger.error("StatisticsDayController.todayRegisteredNum" + e);
			json = this.setJson(false, "error", null);
		}
		return json;
	}
	/**
	 * 每日订单数
	 */
	@RequestMapping("/todayOrderNum")
	@ResponseBody
	public Map<String, Object> todayOrderNum(){
		Map<String, Object> json = null;
		try{
			Map<String, Object> map=statisticsDayService.getTodayOrderNum(new Date());
			json = this.setJson(true, "true", map);
		}catch(Exception e){
			logger.error("StatisticsDayController.todayOrderNum" + e);
			json = this.setJson(false, "error", null);
		}
		return json;
	}
	
	/**
	 * 注册统计信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/statistics/registered")
	public ModelAndView getRegisteredStatistics(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView(registeredChart);
		try {
			SimpleDateFormat s = new SimpleDateFormat("yyyy");
			String month = request.getParameter("month");// 月份
			String year = request.getParameter("year");// 年
			if (year == null) {
				year = s.format(new Date());
			}
			Map<String, Object> sourceMap = statisticsDayService
					.getStatisticsMsg(month, year);
			@SuppressWarnings("unchecked")
			List<StatisticsDay> statistics = (List<StatisticsDay>) sourceMap
					.get("statisticsDayList");
			String showDate = (String) sourceMap.get("showDate");// 统计js的X轴的日期显示
			String registerNum = "";// 注册数
			for (int i = statistics.size() - 1; i >= 0; i--) {
				registerNum += statistics.get(i).getRegisteredNum() + ",";
			}
			if (registerNum.length() > 0) {
				registerNum = registerNum
						.substring(0, registerNum.length() - 1);
			}

			modelAndView.addObject("chart", showDate + "|" + registerNum);// 绘图数据
			modelAndView.addObject("statistics", statistics);// 表数据
			modelAndView.addObject("month", month);
			modelAndView.addObject("year", year);
		} catch (Exception e) {
			logger.error("StatisticsDayController.getRegisterStatistics" + e);
			return new ModelAndView(this.setExceptionRequest(request, e));
		}
		return modelAndView;
	}
	/**
	 * 订单统计信息
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/statistics/order")
	public ModelAndView getOrderStatistics(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView(orderChart);
		try {
			SimpleDateFormat s = new SimpleDateFormat("yyyy");
			String month = request.getParameter("month");// 月份
			String year = request.getParameter("year");// 年
			if (year == null) {
				year = s.format(new Date());
			}
			Map<String, Object> sourceMap = statisticsDayService
					.getStatisticsMsg(month, year);
			@SuppressWarnings("unchecked")
			List<StatisticsDay> statistics = (List<StatisticsDay>) sourceMap
					.get("statisticsDayList");
			String showDate = (String) sourceMap.get("showDate");// 统计js的X轴的日期显示
			String orderNum = "";//总下单数
			String orderSuccessNum = "";//下单支付成功数
			String orderInitNum = "";//下单未支付数
			String orderClosedNum="";//下单取消数
			for (int i = statistics.size() - 1; i >= 0; i--) {
				orderNum += statistics.get(i).getOrderNum() + ",";
				orderSuccessNum += statistics.get(i).getOrderSuccessNum() + ",";
				orderInitNum += statistics.get(i).getOrderInitNum() + ",";
				orderClosedNum += statistics.get(i).getOrderClosedNum() + ",";
			}
			if (orderNum.length() > 0) {
				orderNum = orderNum
						.substring(0, orderNum.length() - 1);
			}

			modelAndView.addObject("chart", showDate + "|" + orderNum + "|" + orderSuccessNum + "|" + orderInitNum + "|" + orderClosedNum);// 绘图数据
			modelAndView.addObject("statistics", statistics);// 表数据
			modelAndView.addObject("month", month);
			modelAndView.addObject("year", year);
		} catch (Exception e) {
			logger.error("StatisticsDayController.getRegisterStatistics" + e);
			return new ModelAndView(this.setExceptionRequest(request, e));
		}
		return modelAndView;
	}
	/**
	 * 跳转到统计数据生成页
	 * @return
	 */
	@RequestMapping("/jumpGenerationStatisticsPage")
	public String jumpLoginStatisticsPage(){
		return GenerationStatisticsChart;
	}
}
package com.inxedu.os.controller.statistics;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.entity.statistics.StatisticsDay;
import com.inxedu.os.service.statistics.StatisticsDayService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * StatisticsDay管理接口
 */
@Controller
@RequestMapping("/admin")
public class StatisticsDayController extends BaseController {
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsDayController.class);
	@Autowired
	private StatisticsDayService statisticsDayService;

	private static final String loginChart = getViewPath("/admin/statistics/statistics_login");// 用户登录统计图

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
		try {
			if (days > 0) {// 历史的
				List<StatisticsDay> loginStatistics = statisticsDayService
						.getStatisticThirty(days);
				String statisticalNum = "";// 登录数--统计数（包括三中）
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
				}

				if (statisticalNum.length() > 0) {
					statisticalNum = statisticalNum.substring(0,
							statisticalNum.length() - 1);
				}
				this.setJson(true, statisticalNum, gson.toJson(showDate)
						.toString());
			} else {// 今天的

			}

		} catch (Exception e) {
			logger.error("StatisticsDayController.getWebStatisticsAjax" + e);
			this.setJson(false, "", null);
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
		try {
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			List<StatisticsDay> statistics = statisticsDayService
					.getStatisticsByDate(startTime, endTime);
			if (statistics.size() > 0) {// 时间段内已有数据
				this.setJson(true, "exists", null);
				return json;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dBegin = sdf.parse(startTime);
			Date dEnd = sdf.parse(endTime);	
			statisticsDayService.createStatisticsByDate(dBegin, dEnd);
			this.setJson(true, "true", null);
		} catch (Exception e) {
			logger.error("StatisticsDayController.createStatisticsByDate" + e);
			this.setJson(false, "error", null);
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
		try {
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			statisticsDayService.delStatisticsByDate(startTime, endTime);
			this.setJson(true, "true", null);
		} catch (Exception e) {
			logger.error("StatisticsDayController.createStatisticsByDate" + e);
			this.setJson(false, "error", null);
		}
		return json;
	}
}
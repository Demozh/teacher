package com.yizhilu.os.inxedu.controller.praise;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yizhilu.os.inxedu.common.controller.BaseController;
import com.yizhilu.os.inxedu.common.util.SingletonLoginUtils;
import com.yizhilu.os.inxedu.entity.praise.Praise;
import com.yizhilu.os.inxedu.service.praise.PraiseService;
import com.yizhilu.os.inxedu.service.questions.QuestionsCommentService;
import com.yizhilu.os.inxedu.service.questions.QuestionsService;

/**
 * 点赞controller
 */
@Controller
public class PraiseController extends BaseController {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(PraiseController.class);
	
	@Autowired
	private PraiseService praiseService;

	@InitBinder({"praise"})
	public void initBinderPraise(WebDataBinder binder){
		binder.setFieldDefaultPrefix("praise.");
	}
	
	/**
	 * 添加点赞记录
	 */
	@RequestMapping("/praise/ajax/add")
	@ResponseBody
	public Object addPraise(HttpServletRequest request,@ModelAttribute("praise")Praise praise){
		try{
			int userId = SingletonLoginUtils.getLoginUserId(request);
			if (userId==0) {
				this.setJson(false, "请先登录", "");
				return json;
			}
			//查询是否点赞 过
			praise.setUserId(Long.valueOf(userId));
			int praiseCount=praiseService.queryPraiseCount(praise);
			if(praiseCount>0){
				this.setJson(false, "您已赞过", "");
				return json;
			}
			
			//添加点赞记录
			praise.setAddTime(new Date());
			praiseService.addPraise(praise);

			//在service 中    根据点赞目标 type 修改相应的 点赞总数
			this.setJson(true, "", "");
		}catch (Exception e) {
			logger.error("PraiseController.addPraise()---error",e);
			this.setJson(false, "系统错误,请稍后重试", "");
		}
		return json;
	}
}

package com.inxedu.os.controller.questions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.entity.questions.Questions;
import com.inxedu.os.entity.questions.QuestionsComment;
import com.inxedu.os.entity.questions.QuestionsTag;
import com.inxedu.os.entity.questions.QuestionsTagRelation;
import com.inxedu.os.service.questions.QuestionsCommentService;
import com.inxedu.os.service.questions.QuestionsService;
import com.inxedu.os.service.questions.QuestionsTagRelationService;
import com.inxedu.os.service.questions.QuestionsTagService;

/**
 * 问答后台 Controller
 */
@Controller
@RequestMapping("/admin")
public class AdminQuestionsController extends BaseController {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AdminQuestionsController.class);
	
	@Autowired
	private QuestionsService questionsService;
	@Autowired
	private QuestionsCommentService questionsCommentService;
	@Autowired
	private QuestionsTagRelationService questionsTagRelationService;
	@Autowired
	private QuestionsTagService questionsTagService;
	
	// 问答列表
	private static final String questionslist = getViewPath("/admin/questions/questions_list");
	//问答详情页面
	private static final String questionsinfo=getViewPath("/admin/questions/questions_info");
	
	@InitBinder({"questions"})
	public void initBinderQuestions(WebDataBinder binder){
		binder.setFieldDefaultPrefix("questions.");
	}
	
	/**
	 * 问答列表
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping("/questions/list")
	public ModelAndView getQuestionsList(HttpServletRequest request,@ModelAttribute("questions")Questions questions,@ModelAttribute("page") PageEntity page){
		ModelAndView model = new ModelAndView(questionslist);
		try{
			page.setPageSize(10);
			List<Questions> questionsList = questionsService.getQuestionsList(questions, page);
			model.addObject("questionsList", questionsList);
			model.addObject("page", page);
			//查询所有问答标签
			QuestionsTag questionsTag=new QuestionsTag();
			List<QuestionsTag> questionsTagList=questionsTagService.getQuestionsTagList(questionsTag);
			model.addObject("questionsTagList", questionsTagList);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("getQuestionsList()---error",e);
		}
		return model;
	}
	
	/**
	 * 删除问答
	 */
	@RequestMapping("/questions/del/{questionsId}")
	@ResponseBody
	public Object delQuestions(HttpServletRequest request,@PathVariable("questionsId")Long questionsId){
		try{
			QuestionsComment questionsComment=new QuestionsComment();
			questionsComment.setIsBest(-1);
			questionsComment.setLimitSize(0);
			questionsComment.setQuestionId(questionsId);
			List<QuestionsComment> questionsCommentList=questionsCommentService.getQuestionsCommentList(questionsComment);
			for(QuestionsComment questionsCommentTemp : questionsCommentList){
				//删除该问答回复下的所有评论
				questionsCommentService.delQuestionsCommentByCommentId(questionsCommentTemp.getId());
			}
			
			//删除问答
			questionsService.deleteQuestionsById(questionsId);
			//删除该问答下的回复
			questionsCommentService.delQuestionsCommentByQuestionId(questionsId);
			this.setJson(true, "", "");
		}catch (Exception e) {
			logger.error("delQuestions()---error",e);
			this.setJson(false, "系统错误,请稍后重试", "");
		}
		return json;
	}
	
	
	/**
	 * 到问答详情
	 */
	@RequestMapping("/questions/info/{id}")
	public ModelAndView toQuestionsInfo(HttpServletRequest request,@PathVariable("id")Long id){
		ModelAndView model = new ModelAndView(questionsinfo);
		try{
			Questions questions=questionsService.getQuestionsById(id);

			//查询该问答的标签
			QuestionsTagRelation questionsTagRelation=new QuestionsTagRelation();
			questionsTagRelation.setQuestionsId(questions.getId());
			questions.setQuestionsTagRelationList(questionsTagRelationService.queryQuestionsTagRelation(questionsTagRelation));
			
			if(questions.getStatus()==1){//已采纳最佳答案
				QuestionsComment questionsComment=new QuestionsComment();
				//查找最佳回答回复
				questionsComment.setIsBest(1);//已采纳
				questionsComment.setQuestionId(questions.getId());
				questionsComment.setLimitSize(1);
				questions.setQuestionsCommentList(questionsCommentService.getQuestionsCommentList(questionsComment));
			}
			model.addObject("questions", questions);
		}catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("toQuestionsInfo()---error",e);
		}
		return model;
	}
	
	/**
	 * 修改问答
	 */
	@RequestMapping("/questions/updQuestions")
	@ResponseBody
	public Object updQuestionComment(HttpServletRequest request,@ModelAttribute("questions")Questions questions){
		try{
			Questions questionsUpd=questionsService.getQuestionsById(questions.getId());
			questionsUpd.setTitle(questions.getTitle());
			questionsUpd.setPraiseCount(questions.getPraiseCount());
			questionsUpd.setBrowseCount(questions.getBrowseCount());
			questionsUpd.setContent(questions.getContent());
			questionsService.updateQuestions(questionsUpd);
			this.setJson(true, "", "");
		}catch (Exception e) {
			logger.error("updQuestionComment()---error",e);
			this.setJson(false, "系统错误,请稍后重试", "");
		}
		return json;
	}
}

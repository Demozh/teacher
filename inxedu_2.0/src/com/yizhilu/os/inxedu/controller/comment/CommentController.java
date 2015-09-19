package com.yizhilu.os.inxedu.controller.comment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yizhilu.os.inxedu.common.controller.BaseController;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.common.util.SingletonLoginUtils;
import com.yizhilu.os.inxedu.entity.common.Comment;
import com.yizhilu.os.inxedu.entity.user.User;
import com.yizhilu.os.inxedu.service.comment.CommentService;

/**
 * 前台评论模块
 */
@Controller
@RequestMapping("/web/comment")
public class CommentController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(CommentController.class);
	// 评论列表
	private static String queryComment = getViewPath("/web/comment/comment");
	// 评论回复
	private static String queryCommentReply = getViewPath("/web/comment/comment_reply");
	@Autowired
	private CommentService commentService;
	/**
	 * 查询评论
	 */
	@RequestMapping("/ajax/query")
	public String queryComment(HttpServletRequest request, @ModelAttribute("page") PageEntity page,Comment comment) {
		try {
			page.setPageSize(6);
			//查询评论一级
			comment.setPCommentId(0);
			List<Comment> commentList = commentService.getCommentByPage(comment, page);// 查询评论
			request.setAttribute("commentList", commentList);// 评论list
			request.setAttribute("page", page);
			request.setAttribute("comment", comment);
			User user = SingletonLoginUtils.getLoginUser(request);
			request.setAttribute("user", user);
		} catch (Exception e) {
			this.setAjaxException();
			logger.error("queryComment()--error", e);
		}
		return queryComment;
	}

	/**
	 * 添加评论
	 */
	@RequestMapping("/ajax/addcomment")
	@ResponseBody
	public Map<String, Object> addComment(HttpServletRequest request, Comment comment) {
		try {
			// 如果用户未登录则不能评论
			int userId = SingletonLoginUtils.getLoginUserId(request);
			if (userId == 0) {
				this.setJson(false, "isnotlogin", "用户id为空");
				return json;
			}
			// 登陆用户id
			comment.setUserId(userId);
			// 添加评论
			commentService.addComment(comment);
			this.setJson(true, "true", "发送成功");

		} catch (Exception e) {
			this.setJson(false, "false", "发送异常");
			logger.error("addComment()--error", e);
		}
		return json;
	}
	/**
	 * 查询文章评论的回复
	 */
	@RequestMapping("/ajax/commentreply")
	public String queryCommentReply(HttpServletRequest request, @ModelAttribute("page") PageEntity page,Comment comment) {
		try {
			// 查询排行文章
			page.setPageSize(30);
			List<Comment> commentList = commentService.getCommentByPage(comment, page);// 查询回复
			request.setAttribute("commentList", commentList);// 回复
			request.setAttribute("page", page);
			User user = SingletonLoginUtils.getLoginUser(request);
			request.setAttribute("user", user);
		} catch (Exception e) {
			this.setAjaxException();
			logger.error("queryCommentReply()--error", e);
		}
		return queryCommentReply;
	}
	
}

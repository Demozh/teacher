package com.inxedu.os.service.impl.common;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.common.entity.PageEntity;
import com.inxedu.os.dao.common.CommentDao;
import com.inxedu.os.entity.common.Comment;
import com.inxedu.os.service.article.ArticleService;
import com.inxedu.os.service.comment.CommentService;
/**
 * 评论模块server实现
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	@Autowired
	private ArticleService articleService;
	public List<Comment> getCommentByPage(Comment comment, PageEntity page) {
		return commentDao.getCommentByPage(comment, page);
	}
	/**
	 * 查询评论互动
	 */
	public List<Comment> queryCommentInteraction(Comment comment){
		return commentDao.queryCommentInteraction(comment);
	}
	/**
	 * 更新评论点赞数,回复数等
	 */
	public void updateCommentNum(Map<String, String> map) {
		commentDao.updateCommentNum(map);
	}
	/**
	 * 查询评论
	 */
	public Comment queryComment(Comment comment){
		return commentDao.queryComment(comment);
	}
	public void addComment(Comment comment) {
		comment.setAddTime(new Date());
		commentDao.addComment(comment);
		//如果是回复,则更新评论上的回复数
		if (comment.getPCommentId() != 0) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("num","+1");
			map.put("type", "replyCount");
			map.put("commentId", comment.getPCommentId()+"");
			commentDao.updateCommentNum(map);
		}
		//添加一级评论,给不同类型的对象更新评论数
		if (comment.getPCommentId() == 0) {
			//文章评论更新文章评论数
			if(comment.getType()==1){
				Map<String,String> map = new HashMap<String,String>();
				map.put("num","+1");
				map.put("type", "commentCount");
				map.put("articleId", comment.getOtherId()+"");
				articleService.updateArticleNum(map);
			}
		}
	}
	
	/**
	 * 更新评论
	 */
	public void updateComment(Comment comment){
		commentDao.updateComment(comment);
	}
	
	/**
	 * 删除评论
	 */
	public void delComment(int commentId) {
		Comment comment = new Comment();
		comment.setCommentId(commentId);
		comment = commentDao.queryComment(comment);
		//如果是一级评论 更新他的父级的对象数减一
		if(comment.getPCommentId()==0){
			if(comment.getType()==1){
				Map<String,String> map = new HashMap<String,String>();
				map.put("num","-1");
				map.put("type", "commentCount");
				map.put("articleId", comment.getOtherId()+"");
				articleService.updateArticleNum(map);
			}
		}
		//如果是二级回复 更新他的父级的评论数减一
		if(comment.getPCommentId()!=0){
			Map<String,String> map = new HashMap<String,String>();
			map.put("num","-1");
			map.put("type", "replyCount");
			map.put("commentId", comment.getPCommentId()+"");
			commentDao.updateCommentNum(map);
		}
		commentDao.delComment(commentId);
	}
	@Override
	public  List<Comment> queryCommentList(Comment comment) {
		return commentDao.queryCommentList(comment);
	}

	
}

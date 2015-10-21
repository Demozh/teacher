package com.inxedu.os.service.impl.questions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.common.entity.PageEntity;
import com.inxedu.os.dao.questions.QuestionsCommentDao;
import com.inxedu.os.entity.questions.QuestionsComment;
import com.inxedu.os.service.questions.QuestionsCommentService;

@Service("questionsCommentService")
public class QuestionsCommentServiceImpl implements QuestionsCommentService {

	@Autowired
	private QuestionsCommentDao questionsCommentDao;
	
	@Override
	public Long addQuestionsComment(QuestionsComment questionsComment) {
		return questionsCommentDao.addQuestionsComment(questionsComment);
		
	}

	@Override
	public Long deleteQuestionsCommentById(Long id) {
		return questionsCommentDao.deleteQuestionsCommentById(id);
	}
	
	@Override
	public QuestionsComment getQuestionsCommentById(Long id) {
		return questionsCommentDao.getQuestionsCommentById(id);
	}

	@Override
	public void updateQuestionsComment(QuestionsComment questionsComment) {
		questionsCommentDao.updateQuestionsComment(questionsComment);
	}

	@Override
	public List<QuestionsComment> getQuestionsCommentList(QuestionsComment questionsComment) {
		return questionsCommentDao.getQuestionsCommentList(questionsComment);
	}

	@Override
	public List<QuestionsComment> queryQuestionsCommentListByQuestionsId(QuestionsComment questionsComment,
			PageEntity page) {
		return questionsCommentDao.queryQuestionsCommentListByQuestionsId(questionsComment,page);
	}

	@Override
	public Long delQuestionsCommentByQuestionId(Long id) {
		return questionsCommentDao.delQuestionsCommentByQuestionId(id);
	}

	@Override
	public List<QuestionsComment> queryQuestionsCommentList(QuestionsComment questionsComment, PageEntity page) {
		return questionsCommentDao.queryQuestionsCommentList(questionsComment,page);
	}

	@Override
	public Long delQuestionsCommentByCommentId(Long commentId) {
		return questionsCommentDao.delQuestionsCommentByCommentId(commentId);
	}

}

package com.inxedu.os.service.impl.questions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.common.entity.PageEntity;
import com.inxedu.os.dao.questions.QuestionsDao;
import com.inxedu.os.entity.questions.Questions;
import com.inxedu.os.service.questions.QuestionsService;

/**
 * questions服务接口 实现
 *
 */
@Service("questionsService")
public class QuestionsServiceImpl implements QuestionsService {

	@Autowired
	private QuestionsDao questionsDao;
	
	@Override
	public Long addQuestions(Questions questions) {
		return questionsDao.addQuestions(questions);
	}

	@Override
	public Long deleteQuestionsById(Long id) {
		return questionsDao.deleteQuestionsById(id);
	}

	@Override
	public void updateQuestions(Questions questions) {
		questionsDao.updateQuestions(questions);
	}

	@Override
	public Questions getQuestionsById(Long id) {
		return questionsDao.getQuestionsById(id);
	}

	@Override
	public List<Questions> getQuestionsList(Questions questions, PageEntity page) {
		return questionsDao.getQuestionsList(questions, page);
	}

	@Override
	public List<Questions> queryQuestionsOrder(int size) {
		return questionsDao.queryQuestionsOrder(size);
	}

}

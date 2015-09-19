package com.yizhilu.os.inxedu.dao.impl.questions;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.questions.QuestionsDao;
import com.yizhilu.os.inxedu.entity.questions.Questions;

@Repository("questionsDao")
public class QuestionsDaoImpl extends GenericDaoImpl implements QuestionsDao {

	@Override
	public Long addQuestions(Questions questions) {
		return this.insert("QuestionsMapper.createQuestions", questions);
	}

	@Override
	public Long deleteQuestionsById(Long id) {
		return this.delete("QuestionsMapper.deleteQuestionsById",id);
	}

	@Override
	public void updateQuestions(Questions questions) {
		this.update("QuestionsMapper.updateQuestions", questions);
	}

	@Override
	public Questions getQuestionsById(Long id) {
		return this.selectOne("QuestionsMapper.getQuestionsById", id);
	}

	@Override
	public List<Questions> getQuestionsList(Questions questions, PageEntity page) {
		return this.queryForListPage("QuestionsMapper.getQuestionsList", questions, page);
	}

	@Override
	public List<Questions> queryQuestionsOrder(int size) {
		return this.selectList("QuestionsMapper.queryQuestionsOrder", size);
	}

}

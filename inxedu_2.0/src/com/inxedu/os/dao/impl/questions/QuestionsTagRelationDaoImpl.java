package com.inxedu.os.dao.impl.questions;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.dao.questions.QuestionsTagRelationDao;
import com.inxedu.os.entity.questions.QuestionsTagRelation;

/**
 * 问答和 问答标签的 关联表 实现类
 */
@Repository("questionsTagRelationDao")
public class QuestionsTagRelationDaoImpl extends GenericDaoImpl implements QuestionsTagRelationDao {

	@Override
	public Long addQuestionsTagRelation(QuestionsTagRelation questionsTagRelation) {
		return this.insert("QuestionsTagRelationMapper.createQuestionsTagRelation", questionsTagRelation);
	}

	@Override
	public List<QuestionsTagRelation> queryQuestionsTagRelation(QuestionsTagRelation questionsTagRelation) {
		return this.selectList("QuestionsTagRelationMapper.queryQuestionsTagRelation", questionsTagRelation);
	}

}

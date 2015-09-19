package com.yizhilu.os.inxedu.service.impl.questions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.dao.questions.QuestionsTagDao;
import com.yizhilu.os.inxedu.entity.questions.QuestionsTag;
import com.yizhilu.os.inxedu.service.questions.QuestionsTagService;

/**
 * 专业service实现
 */
@Service("questionsTagService")
public class QuestionsTagServiceImpl implements QuestionsTagService {

    @Autowired
    private QuestionsTagDao questionsTagDao;

	
	public int createQuestionsTag(QuestionsTag questionsTag) {
		return questionsTagDao.createQuestionsTag(questionsTag);
	}

	
	public List<QuestionsTag> getQuestionsTagList(QuestionsTag query) {
		return questionsTagDao.getQuestionsTagList(query);
	}

	
	public void updateQuestionsTagParentId(int questionsTagId, int parentId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("questionsTagId", questionsTagId);
		map.put("parentId", parentId);
		questionsTagDao.updateQuestionsTagParentId(map);
	}

	
	public void updateQuestionsTag(QuestionsTag questionsTag) {
		questionsTagDao.updateQuestionsTag(questionsTag);
	}

	
	public void deleteQuestionsTag(int questionsTagId) {
		questionsTagDao.deleteQuestionsTag(questionsTagId);
	}

	
	public List<QuestionsTag> queryRootQuestionsTag(int count) {
		List<QuestionsTag> questionsTagList = new ArrayList<QuestionsTag>();
		QuestionsTag query = new QuestionsTag();
		List<QuestionsTag> _list = questionsTagDao.getQuestionsTagList(query);
		if(_list!=null && _list.size()>0){
			//循环两次，查询出来没有父级的专业
			for(int i=0;i<_list.size();i++){
				int _index =0;
				for(int j=0;j<_list.size();j++){
					if(_list.get(i).getParentId()==_list.get(j).getQuestionsTagId()){
						_index=1;
					}
				}
				if(_index==0 && questionsTagList.size()<count){
					questionsTagList.add(_list.get(i));
				}
			}
		}
		return questionsTagList;
	}
}

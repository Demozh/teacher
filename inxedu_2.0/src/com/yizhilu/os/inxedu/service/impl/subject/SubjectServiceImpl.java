package com.yizhilu.os.inxedu.service.impl.subject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.dao.subject.SubjectDao;
import com.yizhilu.os.inxedu.entity.subject.QuerySubject;
import com.yizhilu.os.inxedu.entity.subject.Subject;
import com.yizhilu.os.inxedu.service.subject.SubjectService;

/**
 * 专业service实现
 */
@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;

	public int createSubject(Subject subject) {
		return subjectDao.createSubject(subject);
	}

	public List<Subject> getSubjectList(QuerySubject query) {
		return subjectDao.getSubjectList(query);
	}

	public void updateSubjectParentId(int subjectId, int parentId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subjectId", subjectId);
		map.put("parentId", parentId);
		subjectDao.updateSubjectParentId(map);
	}

	public void updateSubject(Subject subject) {
		subjectDao.updateSubject(subject);
	}
	/**
	 * 修改排序
	 */
	public void updateSubjectSort(Subject subject){
		subjectDao.updateSubjectSort(subject);
	}

	public void deleteSubject(int subjectId) {
		subjectDao.deleteSubject(subjectId);
	}

	public List<Subject> queryRootSubject(int count) {
		List<Subject> subjectList = new ArrayList<Subject>();
		QuerySubject query = new QuerySubject();
		List<Subject> _list = subjectDao.getSubjectList(query);
		if (_list != null && _list.size() > 0) {
			// 循环两次，查询出来没有父级的专业
			for (int i = 0; i < _list.size(); i++) {
				int _index = 0;
				for (int j = 0; j < _list.size(); j++) {
					if (_list.get(i).getParentId() == _list.get(j).getSubjectId()) {
						_index = 1;
					}
				}
				if (_index == 0 && subjectList.size() < count) {
					subjectList.add(_list.get(i));
				}
			}
		}
		return subjectList;
	}

	@Override
	public Subject getSubjectBySubject(Subject subject) {
		return subjectDao.getSubjectBySubject(subject);
	}

	@Override
	public List<Subject> getSubjectListByOne(Long subjectId) {
		return subjectDao.getSubjectListByOne(subjectId);
	}
}

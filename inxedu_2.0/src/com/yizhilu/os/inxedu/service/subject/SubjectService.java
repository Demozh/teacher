package com.yizhilu.os.inxedu.service.subject;

import java.util.List;

import com.yizhilu.os.inxedu.entity.subject.QuerySubject;
import com.yizhilu.os.inxedu.entity.subject.Subject;



/**
 * 专业接口
 */
public interface SubjectService {
	/**
	 * 创建专业
	 * @param subject
	 * @return 返回专业ID
	 */
	public int createSubject(Subject subject);
	
	/**
	 * 查询专业列表
	 * @return List<Subject>
	 */
	public List<Subject> getSubjectList(QuerySubject query);
	
	/**
	 * 修改专业父ID
	 * @param subjectId 专业ID
	 * @param parentId 专业父ID
	 */
	public void updateSubjectParentId(int subjectId,int parentId);
	/**
	 * 修改专业
	 */
	public void updateSubject(Subject subject);
	/**
	 * 修改排序
	 */
	public void updateSubjectSort(Subject subject);
	/**
	 * 删除专业 
	 * @param subjectId 要删除的专业ID
	 */
	public void deleteSubject(int subjectId);
	
	/**
	 * 获取最根级专业
	 * @param count获取数量
	 * @return List<Subject>
	 */
	public List<Subject> queryRootSubject(int count);
	
	 /**
     * 查询项目
     */
    public Subject getSubjectBySubject(Subject subject);
    
    /**
     * 根据父级ID查找子项目集合
     */
    public List<Subject> getSubjectListByOne(Long subjectId);
}

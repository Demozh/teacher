package com.inxedu.os.edu.dao.impl.course;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.common.entity.PageEntity;
import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.edu.dao.course.CourseStudyhistoryDao;
import com.inxedu.os.edu.entity.course.CourseDto;
import com.inxedu.os.edu.entity.course.CourseStudyhistory;

/**
 *
 * CourseStudyhistory 管理接口实现
 * @author www.inxedu.com
 */
 @Repository("courseStudyhistoryDao")
public class CourseStudyhistoryDaoImpl extends GenericDaoImpl implements CourseStudyhistoryDao{

    public java.lang.Long addCourseStudyhistory(CourseStudyhistory courseStudyhistory) {
        return this.insert("CourseStudyhistoryMapper.createCourseStudyhistory",courseStudyhistory);
    }

    public void deleteCourseStudyhistoryById(Long id){
        this.delete("CourseStudyhistoryMapper.deleteCourseStudyhistoryById",id);
    }

    public void updateCourseStudyhistory(CourseStudyhistory courseStudyhistory) {
        this.update("CourseStudyhistoryMapper.updateCourseStudyhistory",courseStudyhistory);
    }

    public CourseStudyhistory getCourseStudyhistoryById(Long id) {
        return this.selectOne("CourseStudyhistoryMapper.getCourseStudyhistoryById",id);
    }

    public List<CourseStudyhistory> getCourseStudyhistoryList(CourseStudyhistory courseStudyhistory) {
        return this.selectList("CourseStudyhistoryMapper.getCourseStudyhistoryList",courseStudyhistory);
    }
    @Override
    public List<CourseStudyhistory> getCourseStudyhistoryListByCondition(
    		CourseStudyhistory courseStudyhistory, PageEntity page) {
    	// TODO Auto-generated method stub
    	 return this.queryForListPage("CourseStudyhistoryMapper.getCourseStudyhistoryListByCondition",courseStudyhistory,page);
    }
    /**
     * 根据ids删除CourseStudyhistory
     * @param id 要删除的id
     */
    public void delCourseStudyhistory(String ids){
    	this.delete("CourseStudyhistoryMapper.delCourseStudyhistory", ids);
    }
    /**
     * 根据课程ids和用户查询
     * @param list
     * @param userId
     * @return
     */
	public Long getCourseStudyhistoryCount(List<CourseDto> list, Long userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("userId", userId);
		return this.selectOne("CourseStudyhistoryMapper.getCourseStudyhistoryCount",map);
	}

	@Override
	public List<CourseStudyhistory> getCourseStudyhistoryListByCouId(Long courseId) {
		return this.selectList("CourseStudyhistoryMapper.getCourseStudyhistoryListByCouId", courseId);
	}

	@Override
	public int getCourseStudyhistoryCountByCouId(Long courseId) {
		return (Integer)this.selectOne("CourseStudyhistoryMapper.getCourseStudyhistoryCountByCouId", courseId);
	}
    
}

package com.yizhilu.os.inxedu.dao.impl.course;


import java.util.List;
import java.util.Map;

import lombok.ToString;
import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.course.CourseKpointDao;
import com.yizhilu.os.inxedu.entity.kpoint.CourseKpoint;
import com.yizhilu.os.inxedu.entity.kpoint.CourseKpointDto;

/**
 *
 * CourseKpoint
 */
 @ToString
 @Repository("courseKpointDao")
public class CourseKpointDaoImpl extends GenericDaoImpl implements CourseKpointDao {

    public int addCourseKpoint(CourseKpoint courseKpoint) {
    	this.insert("CourseKpointMapper.createCourseKpoint",courseKpoint);
        return courseKpoint.getKpointId();
    }

	
	public List<CourseKpoint> queryCourseKpointByCourseId(int courseId) {
		return this.selectList("CourseKpointMapper.queryCourseKpointByCourseId", courseId);
	}

	
	public CourseKpointDto queryCourseKpointById(int kpointId) {
		return this.selectOne("CourseKpointMapper.queryCourseKpointById", kpointId);
	}

	
	public void updateKpoint(CourseKpoint kpoint) {
		this.update("CourseKpointMapper.updateKpoint", kpoint);
		
	}

	
	public void deleteKpointByIds(String ids) {
		this.delete("CourseKpointMapper.deleteKpointByIds", ids);
		
	}

	
	public void updateKpointParentId(Map<String, Integer> map) {
		this.update("CourseKpointMapper.updateKpointParentId", map);
	}


	@Override
	public int getSecondLevelKpointCount(Long courseId) {
		return this.selectOne("CourseKpointMapper.getSecondLevelKpointCount", courseId);
	}

}

package com.yizhilu.os.inxedu.dao.impl.course;


import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.dao.course.CourseTeacherDao;

@Repository("courseTeacherDao")
public class CourseTeacherDaoImpl extends GenericDaoImpl implements CourseTeacherDao {

	
	public void addCourseTeacher(String value) {
		this.insert("CourseTeacherMapper.createCourseTeacher", value);
		
	}

	
	public void deleteCourseTeacher(int courseId) {
		this.delete("CourseTeacherMapper.deleteCourseTeacher", courseId);
	}

}

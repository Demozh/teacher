package com.inxedu.os.dao.impl.course;


import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.dao.course.CourseTeacherDao;

@Repository("courseTeacherDao")
public class CourseTeacherDaoImpl extends GenericDaoImpl implements CourseTeacherDao {

	
	public void addCourseTeacher(String value) {
		this.insert("CourseTeacherMapper.createCourseTeacher", value);
		
	}

	
	public void deleteCourseTeacher(int courseId) {
		this.delete("CourseTeacherMapper.deleteCourseTeacher", courseId);
	}

}

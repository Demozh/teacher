package com.inxedu.os.service.impl.course;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inxedu.os.dao.course.CourseTeacherDao;
import com.inxedu.os.service.course.CourseTeacherService;

/**
 * CourseTeacher管理接口
 */
@Service("courseTeacherService")
public class CourseTeacherServiceImpl implements CourseTeacherService {

 	@Autowired
    private CourseTeacherDao courseTeacherDao;

	
	public void addCourseTeacher(String value) {
		courseTeacherDao.addCourseTeacher(value);
	}

	
	public void deleteCourseTeacher(int courseId) {
		courseTeacherDao.deleteCourseTeacher(courseId);
	}
}
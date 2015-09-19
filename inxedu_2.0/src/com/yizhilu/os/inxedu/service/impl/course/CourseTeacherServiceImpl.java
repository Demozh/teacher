package com.yizhilu.os.inxedu.service.impl.course;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.dao.course.CourseTeacherDao;
import com.yizhilu.os.inxedu.service.course.CourseTeacherService;

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
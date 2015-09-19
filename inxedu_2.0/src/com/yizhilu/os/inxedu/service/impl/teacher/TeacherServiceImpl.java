package com.yizhilu.os.inxedu.service.impl.teacher;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.teacher.TeacherDao;
import com.yizhilu.os.inxedu.entity.teacher.QueryTeacher;
import com.yizhilu.os.inxedu.entity.teacher.Teacher;
import com.yizhilu.os.inxedu.service.teacher.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Teacher管理接口
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	private TeacherDao teacherDao;

	public int addTeacher(Teacher teacher) {
		return teacherDao.addTeacher(teacher);
	}

	public void deleteTeacherById(int tcId) {
		teacherDao.deleteTeacherById(tcId);
	}

	public void updateTeacher(Teacher teacher) {
		teacherDao.updateTeacher(teacher);
	}

	public Teacher getTeacherById(int tcId) {
		return teacherDao.getTeacherById(tcId);
	}

	public List<Teacher> queryTeacherListPage(QueryTeacher query, PageEntity page) {
		return teacherDao.queryTeacherListPage(query, page);
	}

	public List<Map<String, Object>> queryCourseTeacerList(int courseId) {
		return teacherDao.queryCourseTeacerList(courseId);
	}

	public List<Teacher> queryTeacherList(QueryTeacher queryTeacher) {
		return teacherDao.queryTeacherList(queryTeacher);
	}
}
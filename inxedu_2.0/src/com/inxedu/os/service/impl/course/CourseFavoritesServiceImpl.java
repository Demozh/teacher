package com.inxedu.os.service.impl.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.common.entity.PageEntity;
import com.inxedu.os.dao.course.CourseFavoritesDao;
import com.inxedu.os.entity.course.CourseFavorites;
import com.inxedu.os.entity.course.FavouriteCourseDTO;
import com.inxedu.os.service.course.CourseFavoritesService;

/**
 * CourseFavorites管理接口
 */
@Service("courseFavoritesService")
public class CourseFavoritesServiceImpl implements CourseFavoritesService {

	@Autowired
	private CourseFavoritesDao courseFavoritesDao;

	
	public void createCourseFavorites(CourseFavorites cf) {
		courseFavoritesDao.createCourseFavorites(cf);
	}

	
	public void deleteCourseFavoritesById(String ids) {
		courseFavoritesDao.deleteCourseFavoritesById(ids);
	}

	
	public boolean checkFavorites(int userId, int courseId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("courseId", courseId);
		int count = courseFavoritesDao.checkFavorites(map);
		if(count>0){
			return true;
		}
		return false;
	}

	
	public List<FavouriteCourseDTO> queryFavoritesPage(int userId,PageEntity page) {
		return courseFavoritesDao.queryFavoritesPage(userId, page);
	}
    

}
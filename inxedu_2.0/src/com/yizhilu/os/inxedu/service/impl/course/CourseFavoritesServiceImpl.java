package com.yizhilu.os.inxedu.service.impl.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.course.CourseFavoritesDao;
import com.yizhilu.os.inxedu.entity.course.CourseFavorites;
import com.yizhilu.os.inxedu.entity.course.FavouriteCourseDTO;
import com.yizhilu.os.inxedu.service.course.CourseFavoritesService;

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
package com.inxedu.os.dao.impl.course;

import java.util.List;
import java.util.Map;

import org.springframework.common.entity.PageEntity;
import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.dao.course.CourseFavoritesDao;
import com.inxedu.os.entity.course.CourseFavorites;
import com.inxedu.os.entity.course.FavouriteCourseDTO;

/**
 *
 * CourseFavorites
 */
 @Repository("courseFavoritesDao")
public class CourseFavoritesDaoImpl extends GenericDaoImpl implements CourseFavoritesDao {

	
	public void createCourseFavorites(CourseFavorites cf) {
		this.insert("CourseFavoritesMapper.createCourseFavorites", cf);
		
	}

	
	public void deleteCourseFavoritesById(String ids) {
		this.delete("CourseFavoritesMapper.deleteCourseFavoritesById", ids);
	}

	
	public int checkFavorites(Map<String, Object> map) {
		return this.selectOne("CourseFavoritesMapper.checkFavorites", map);
	}

	
	public List<FavouriteCourseDTO> queryFavoritesPage(int userId, PageEntity page) {
		return this.queryForListPage("CourseFavoritesMapper.queryFavoritesPage", userId, page);
	}

    
}

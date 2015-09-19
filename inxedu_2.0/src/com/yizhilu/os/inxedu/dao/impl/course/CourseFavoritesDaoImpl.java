package com.yizhilu.os.inxedu.dao.impl.course;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yizhilu.os.inxedu.common.dao.GenericDaoImpl;
import com.yizhilu.os.inxedu.common.entity.PageEntity;
import com.yizhilu.os.inxedu.dao.course.CourseFavoritesDao;
import com.yizhilu.os.inxedu.entity.course.CourseFavorites;
import com.yizhilu.os.inxedu.entity.course.FavouriteCourseDTO;

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

package com.inxedu.os.service.course;


import java.util.List;

import org.springframework.common.entity.PageEntity;

import com.inxedu.os.entity.course.CourseFavorites;
import com.inxedu.os.entity.course.FavouriteCourseDTO;

/**
 * CourseFavorites管理接口
 */
public interface CourseFavoritesService {
	/**
	 * 添加课程收藏
	 * @param cf
	 */
	public void createCourseFavorites(CourseFavorites cf);
	
	/**
	 * 删除课程收藏
	 * @param ids
	 */
	public void deleteCourseFavoritesById(String ids);
	
	/**
	 * 检测用户是否收藏过
	 * @param userId 用户ID
	 * @param courseId 课程ID
	 * @return true收藏过 ，false未收藏
	 */
	public boolean checkFavorites(int userId,int courseId);
	
	/**
	 * 分页查询用户收藏列表
	 * @param userId 用户ID
	 * @param page 分页条件
	 * @return List<FavouriteCourseDTO>
	 */
	public List<FavouriteCourseDTO> queryFavoritesPage(int userId,PageEntity page);
}
package com.inxedu.os.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.common.entity.PageEntity;
import org.springframework.common.entity.PageOL;
import org.springframework.stereotype.Repository;

/**
 * @author www.inxedu.com
 *
 */
@Repository("genericDao")
public abstract class GenericDaoImpl implements GenericDao {
	public SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return this.sqlSession;
	}

	@Resource(name = "sqlSessionMain")
	public void setSqlSession1(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public Long insert(String sqlKey, Object object) {
		return Long.valueOf(getSqlSession().insert(sqlKey, object));
	}

	public Long delete(String sqlKey, Object object) {
		return Long.valueOf(getSqlSession().delete(sqlKey, object));
	}

	public Long update(String key, Object object) {
		return Long.valueOf(getSqlSession().update(key, object));
	}


	@SuppressWarnings("unchecked")
	public <T> T selectOne(String sqlKey, Object params) {
		Object selectOne = null;
		List<Object> list = selectList(sqlKey, params);
		if (list != null && list.size() > 0) {
			selectOne = list.get(0);
		}
		return (T) selectOne;
	}

	public <T> List<T> selectList(String sqlKey, Object params) {
		return getSqlSession().selectList(sqlKey, params);
	}

	public <T> List<T> queryForListPage(String sqlKey, Object params,PageEntity page) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("e", params);
		
		PageOL pageOL = new PageOL();
		
		pageOL.setOffsetPara((page.getCurrentPage() - 1) * page.getPageSize());
		pageOL.setLimitPara(page.getPageSize());
		map.put("page", pageOL);

		Integer objectscount = (Integer) selectOne(sqlKey + "Count", map);

		if ((objectscount == null) || (objectscount.intValue() == 0)) {
			page.setTotalResultSize(0);
			int totalPageSize = 0;
			page.setTotalPageSize(totalPageSize);
			return null;
		}
		page.setTotalResultSize(objectscount.intValue());
		int totalPageSize = (page.getTotalResultSize() - 1) / page.getPageSize() + 1;
		page.setTotalPageSize(totalPageSize);
		return selectList(sqlKey, map);
	}
	/**
	 *  mybatis拦截分页方法
	 */	
	public <T> List<T> queryForListPageCount(String sqlKey, Object params,PageEntity page) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("e", params);
		map.put("countfalg", "true");
		map.put("pageEntity", page);
		return selectList(sqlKey, map);
	}
}
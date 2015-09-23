package com.inxedu.os.dao.impl.praise;

import org.springframework.stereotype.Repository;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.dao.praise.PraiseDao;
import com.inxedu.os.entity.praise.Praise;

@Repository("praiseDao")
public class PraiseDaoImpl extends GenericDaoImpl implements PraiseDao {

	@Override
	public Long addPraise(Praise praise) {
		return this.insert("PraiseMapper.addPraise", praise);
	}

	@Override
	public int queryPraiseCount(Praise praise) {
		return this.selectOne("PraiseMapper.queryPraiseCount", praise);
	}

}

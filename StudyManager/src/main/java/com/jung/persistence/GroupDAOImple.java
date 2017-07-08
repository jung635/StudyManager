package com.jung.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.BoardBean;
import com.jung.domain.GroupBean;
@Repository
public class GroupDAOImple implements GroupDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.jung.mapper.GroupMapper";

	@Override
	public void groupMake(GroupBean gb) throws Exception {
		sqlSession.insert(namespace+".makeGroup", gb);
	}

	@Override
	public int getMaxNum() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxNum") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxNum");
		
		return max;
	}
	
	

}

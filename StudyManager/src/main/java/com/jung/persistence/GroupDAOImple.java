package com.jung.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.BoardBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;
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

	@Override
	public List<GroupBean> getGroupList(String id) throws Exception {
		return sqlSession.selectList(namespace+".getGroupList", id);
	}

	@Override
	public GroupBean getGroupDetail(int group_num) throws Exception {
		return sqlSession.selectOne(namespace+".getGroupDetail", group_num);
	}
}

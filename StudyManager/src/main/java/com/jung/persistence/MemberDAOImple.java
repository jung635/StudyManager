package com.jung.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.MemberBean;
@Repository
public class MemberDAOImple implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.jung.mapper.MemberMapper";
	
	@Override
	public void insertMember(MemberBean mb) throws Exception {
		sqlSession.insert(namespace+".insertMember", mb);
		
	}

	@Override
	public String getPass(String id) throws Exception {
		return sqlSession.selectOne(namespace+".getPass", id);
	}

	@Override
	public MemberBean getInfo(String id) throws Exception {
		return sqlSession.selectOne(namespace+".getInfo", id);
	}

	@Override
	public void updateMember(MemberBean mb) throws Exception {
		sqlSession.update(namespace+".updateMember", mb);
		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		sqlSession.delete(namespace+".deleteMember", id);
	}

	@Override
	public List<MemberBean> getList() throws Exception {
		return sqlSession.selectList(namespace+".getList");
		
	}

	@Override
	public void regGroup(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace+".regGroup", map);
	}
	
}

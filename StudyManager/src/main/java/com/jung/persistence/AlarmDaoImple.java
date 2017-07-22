package com.jung.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.AlarmBean;
@Repository
public class AlarmDaoImple implements AlarmDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.jung.mapper.AlarmMapper";
	@Override
	public void insertAlarm(AlarmBean ab) throws Exception {
		sqlSession.insert(namespace+".insertAlarm", ab);
		
	}

	@Override
	public int getMaxNum() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxNum") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxNum");
		
		return max;
	}

	@Override
	public List<AlarmBean> getBoardList(String id) throws Exception {
		return sqlSession.selectList(namespace+".getAlarmList", id);
	}

}

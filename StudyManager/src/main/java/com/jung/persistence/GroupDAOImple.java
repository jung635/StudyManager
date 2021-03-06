package com.jung.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.AttendenceBean;
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
	public List<GroupBean> getGroupList() throws Exception {
		return sqlSession.selectList(namespace+".getGroupList");
	}

	@Override
	public GroupBean getGroupDetail(int group_num) throws Exception {
		return sqlSession.selectOne(namespace+".getGroupDetail", group_num);
	}

	@Override
	public void insertAttendence(AttendenceBean ab) throws Exception {
		sqlSession.insert(namespace+".insertAttendence", ab);
	}

	@Override
	public int getMaxNumForAttendence() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxNumForAttendence") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxNumForAttendence");
		
		return max;
	}

	@Override
	public List<AttendenceBean> getAttendenceList(String id) throws Exception {
		return sqlSession.selectList(namespace+".getAttendenceList", id);
	}

	@Override
	public List<AttendenceBean> getAttendenceListByDate(Date date) throws Exception {
		return sqlSession.selectList(namespace+".getAttendenceListByDate", date);
	}

	@Override
	public AttendenceBean getAttendenceDetail(String id) throws Exception {
		return sqlSession.selectOne(namespace+".getAttendenceDetail", id);
	}

	@Override
	public AttendenceBean getAttendenceByDateAndId(Map<String, String> map) throws Exception {
		return sqlSession.selectOne(namespace+".getAttendenceByDateAndId", map);
	}
	
	@Override
	public AttendenceBean getAttendenceListByDateGroup(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace+".getAttendenceListByDateGroup", map);
	}

	@Override
	public List<AttendenceBean> getAllFeeById(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace+".getAllFeeById", map);
	}

	@Override
	public List<AttendenceBean> getAllFee(int group_num) throws Exception {
		return sqlSession.selectList(namespace+".getAllFee", group_num);
	}
	
	@Override
	public AttendenceBean getFeeByNum(int num) throws Exception {
		return sqlSession.selectOne(namespace+".getFeeByNum", num);
	}

	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace+".updateMember", map);
		
	}

	@Override
	public List<GroupBean> groupSearch(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace+".groupSearch", map);
	}

	@Override
	public void payDone(int attend_num) throws Exception {
		sqlSession.update(namespace+".payDone", attend_num);
	}

	@Override
	public void attendDel(int attend_num) throws Exception {
		sqlSession.delete(namespace+".attendDel", attend_num);
	}

	@Override
	public void updateAttend(AttendenceBean ab) throws Exception {
		sqlSession.update(namespace+".updateAttend", ab);
	}

	@Override
	public void updateGroup(GroupBean gb) throws Exception {
		sqlSession.update(namespace+".updateGroup", gb);
	}
	
	
}

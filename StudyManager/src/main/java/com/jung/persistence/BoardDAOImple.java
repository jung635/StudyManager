package com.jung.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jung.domain.BoardBean;
import com.jung.domain.BoardTeamBean;
import com.jung.domain.PageMaker;
@Repository
public class BoardDAOImple implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.jung.mapper.BoardMapper";
	@Override
	public void insertBoard(BoardBean bb) throws Exception {
		sqlSession.insert(namespace+".insertBoard", bb);
	}
	
	@Override
	public int getMaxNum() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxNum") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxNum");
		
		return max;
	}

	@Override
	public List<BoardBean> getBoardList(Map<String, Object> pageMap) throws Exception {
		return sqlSession.selectList(namespace+".getBoardList", pageMap);
	}
	
	@Override
	public int getListCount(Map<String, Object> count_map) throws Exception {
		return sqlSession.selectOne(namespace+".getListCount", count_map);
	}

	@Override
	public BoardBean getContent(int num) throws Exception {
		return sqlSession.selectOne(namespace+".getContent", num);
	}

	@Override
	public void updateBoard(BoardBean bb) throws Exception {
		sqlSession.update(namespace+".updateBoard", bb);
	}

	@Override
	public void updateReadCount(int num) throws Exception {
		sqlSession.update(namespace+".updateReadCount", num);
		
	}

	@Override
	public void deleteBoard(int num) throws Exception {
		sqlSession.delete(namespace+".deleteBoard", num);
		
	}

	@Override
	public List<BoardBean> getBoardListByGroup(Map<String, Object> pageMap) throws Exception {
		return sqlSession.selectList(namespace+".getBoardListByGroup", pageMap);
	}

	@Override
	public int getListCountByGroup(int group_num) throws Exception {
		return sqlSession.selectOne(namespace+".getListCountByGroup", group_num);
	}

	@Override
	public void insertBoardTeam(BoardTeamBean bt) throws Exception {
		sqlSession.insert(namespace+".insertBoardTeam", bt);
	}

	@Override
	public int getMaxNumBoardTeam() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxNumBoardTeam") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxNumBoardTeam");
		
		return max;
	}

	@Override
	public List<BoardBean> getBoardTeamListByGroup(int group_num) throws Exception {
		return sqlSession.selectList(namespace+".getBoardTeamListByGroup", group_num);
	}

	@Override
	public void insertReply(BoardBean bb) throws Exception {
		sqlSession.insert(namespace+".insertReply", bb);
	}

	@Override
	public int getMaxReNum() throws Exception {
		int max;
		if(sqlSession.selectOne(namespace+".getMaxReNum") == null) max = 0;
		else max = sqlSession.selectOne(namespace+".getMaxReNum");
		
		return max;
	}

	@Override
	public List<BoardBean> getReplyList(Map<String, Object> pageMap) throws Exception {
		return sqlSession.selectList(namespace+".getReplyList", pageMap);
	}

	@Override
	public BoardTeamBean getBoardTeamDetail(int board_num) throws Exception {
		return sqlSession.selectOne(namespace+".getBoardTeamDetail", board_num);
	}
	
	
}

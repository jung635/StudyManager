package com.jung.persistence;

import java.util.List;
import java.util.Map;

import com.jung.domain.BoardBean;
import com.jung.domain.BoardTeamBean;
import com.jung.domain.PageMaker;

public interface BoardDAO {
	public void insertBoard(BoardBean bb) throws Exception;
	public int getMaxNum() throws Exception;
	public List<BoardBean> getBoardList(Map<String, Object> pageMap) throws Exception;
	public int getListCount(Map<String, Object> count_map) throws Exception;
	public List<BoardBean> getBoardListByGroup(Map<String, Object> pageMap) throws Exception;
	public int getListCountByGroup(int group_num) throws Exception;
	public BoardBean getContent(int num) throws Exception;
	public void updateBoard(BoardBean bb) throws Exception;
	public void updateReadCount(int num) throws Exception;
	public void deleteBoard(int num) throws Exception;
	public void insertBoardTeam(BoardTeamBean bt) throws Exception;
	public int getMaxNumBoardTeam() throws Exception;
	public List<BoardBean> getBoardTeamListByGroup(int group_num) throws Exception;
	public void insertReply(BoardBean bb) throws Exception;
	public void insertReReply(BoardBean bb) throws Exception;
	public int getMaxReNum(int re_board_num) throws Exception;
	public List<BoardBean> getReplyList(Map<String, Object> pageMap) throws Exception;
	public BoardTeamBean getBoardTeamDetail(int board_num) throws Exception;
	public List<BoardBean> getReReplyList(Map<String, Object> pageMap) throws Exception;
	public void updateTeamBoard(BoardTeamBean bt) throws Exception;
}

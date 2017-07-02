package com.jung.service;

import java.util.List;
import java.util.Map;

import com.jung.domain.BoardBean;
import com.jung.domain.PageMaker;

public interface BoardService {
	public void insertBoard(BoardBean bb) throws Exception;
	public int getMaxNum() throws Exception;
	public List<BoardBean> getBoardList(Map<String, Object> pageMap) throws Exception;
	public int getListCount() throws Exception;
	public BoardBean getContent(int num) throws Exception;
	public void updateBoard(BoardBean bb) throws Exception;
	public void updateReadCount(int num) throws Exception;
	public void deleteBoard(int num) throws Exception;
}

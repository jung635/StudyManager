package com.jung.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jung.domain.BoardBean;
import com.jung.domain.PageMaker;

public interface BoardService {
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
	public String getBrowser(HttpServletRequest request) throws Exception;
	public String getDisposition(String filename, String browser) throws Exception;
}

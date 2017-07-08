package com.jung.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jung.domain.BoardBean;
import com.jung.persistence.BoardDAO;
@Service
public class BoardServiceImple implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public void insertBoard(BoardBean bb) throws Exception {
		bdao.insertBoard(bb);
	}

	@Override
	public int getMaxNum() throws Exception {
		return bdao.getMaxNum();
	}

	@Override
	public List<BoardBean> getBoardList(Map<String, Object> pageMap) throws Exception {
		return bdao.getBoardList(pageMap);
	}

	@Override
	public int getListCount() throws Exception {
		return bdao.getListCount();
	}

	@Override
	public BoardBean getContent(int num) throws Exception {
		return bdao.getContent(num);
	}

	@Override
	public void updateBoard(BoardBean bb) throws Exception {
		bdao.updateBoard(bb);
	}

	@Override
	public void updateReadCount(int num) throws Exception {
		bdao.updateReadCount(num);
	}

	@Override
	public void deleteBoard(int num) throws Exception {
		bdao.deleteBoard(num);
		
	}
	
}

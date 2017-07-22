package com.jung.service;

import java.util.List;

import com.jung.domain.AlarmBean;

public interface AlarmService {
	public void insertAlarm(AlarmBean ab) throws Exception;
	public int getMaxNum() throws Exception;
	public List<AlarmBean> getBoardList(String id) throws Exception;
}

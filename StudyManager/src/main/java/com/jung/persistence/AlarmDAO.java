package com.jung.persistence;

import java.util.List;
import java.util.Map;

import com.jung.domain.AlarmBean;

public interface AlarmDAO {
	public void insertAlarm(AlarmBean ab) throws Exception;
	public int getMaxNum() throws Exception;
	public List<AlarmBean> getBoardList(String id) throws Exception;
}

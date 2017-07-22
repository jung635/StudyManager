package com.jung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jung.domain.AlarmBean;
import com.jung.persistence.AlarmDAO;

@Service
public class AlarmServiceImple implements AlarmService {
	@Inject
	AlarmDAO adao;

	@Override
	public void insertAlarm(AlarmBean ab) throws Exception {
		adao.insertAlarm(ab);
	}

	@Override
	public int getMaxNum() throws Exception {
		return adao.getMaxNum();
	}

	@Override
	public List<AlarmBean> getBoardList(String id) throws Exception {
		return adao.getBoardList(id);
	}
	
	
}

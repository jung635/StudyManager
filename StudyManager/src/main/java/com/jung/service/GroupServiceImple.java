package com.jung.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jung.domain.GroupBean;
import com.jung.persistence.GroupDAO;

@Service
public class GroupServiceImple implements GroupService{
	@Inject
	private GroupDAO gdao;
	@Override
	public void groupMake(GroupBean gb) throws Exception {
		gdao.groupMake(gb);
		
	}

	@Override
	public int getMaxNum() throws Exception {
		return gdao.getMaxNum();
	}

}

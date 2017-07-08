package com.jung.service;

import com.jung.domain.GroupBean;

public interface GroupService {
	public void groupMake(GroupBean gb) throws Exception;
	public int getMaxNum() throws Exception;
}

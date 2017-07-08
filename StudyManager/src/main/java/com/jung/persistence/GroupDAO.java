package com.jung.persistence;

import com.jung.domain.GroupBean;

public interface GroupDAO {
	public void groupMake(GroupBean gb) throws Exception;
	public int getMaxNum() throws Exception;
}

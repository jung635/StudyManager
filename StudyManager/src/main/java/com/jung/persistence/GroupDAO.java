package com.jung.persistence;

import java.util.List;

import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;

public interface GroupDAO {
	public void groupMake(GroupBean gb) throws Exception;
	public int getMaxNum() throws Exception;
	public List<GroupBean> getGroupList(String id) throws Exception;
	public GroupBean getGroupDetail(int group_num) throws Exception;
}

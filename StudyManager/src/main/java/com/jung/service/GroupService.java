package com.jung.service;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.jung.domain.AttendenceBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;

public interface GroupService {
	public void groupMake(GroupBean gb) throws Exception;
	public int getMaxNum() throws Exception;
	public List<GroupBean> getGroupList(String id) throws Exception;
	public GroupBean getGroupDetail(int group_num) throws Exception;
	public LinkedHashMap<MemberBean, AttendenceBean> getGroupMemberList(int group_num, Date date) throws Exception;
	public LinkedHashMap<MemberBean, String> getGroupMemberList(int group_num) throws Exception;
	public void insertAttendence(AttendenceBean ab) throws Exception;
	public int getMaxNumForAttendence() throws Exception;
	public List<AttendenceBean> getAttendenceList(String id) throws Exception;
	public List<AttendenceBean> getAttendenceListByDate(Date date) throws Exception;
	public AttendenceBean getAttendenceDetail(String id) throws Exception;
	public AttendenceBean getAttendenceByDateAndId(String id, Date date) throws Exception;
}

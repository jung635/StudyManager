package com.jung.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jung.domain.AttendenceBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;

public interface GroupDAO {
	public void groupMake(GroupBean gb) throws Exception;
	public int getMaxNum() throws Exception;
	public List<GroupBean> getGroupList() throws Exception;
	public GroupBean getGroupDetail(int group_num) throws Exception;
	public void insertAttendence(AttendenceBean ab) throws Exception;
	public int getMaxNumForAttendence() throws Exception;
	public List<AttendenceBean> getAttendenceList(String id) throws Exception;
	public List<AttendenceBean> getAttendenceListByDate(Date date) throws Exception;
	public AttendenceBean getAttendenceDetail(String id) throws Exception;
	public AttendenceBean getAttendenceByDateAndId(Map<String, String> map) throws Exception;
	public AttendenceBean getAttendenceListByDateGroup(Map<String, Object> map) throws Exception;
	public List<AttendenceBean> getAllFeeById(Map<String, Object> map) throws Exception;
	public List<AttendenceBean> getAllFee(int group_num) throws Exception;
	public AttendenceBean getFeeByNum(int num) throws Exception;
	public void updateMember(Map<String, Object> map) throws Exception;
	public List<GroupBean> groupSearch(Map<String, Object> map) throws Exception;
	public void payDone(int attend_num) throws Exception;
	public void attendDel(int attend_num) throws Exception;
	public void updateAttend(AttendenceBean ab) throws Exception;
	public void updateGroup(GroupBean gb) throws Exception;

}

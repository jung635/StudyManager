package com.jung.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jung.domain.AttendenceBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;
import com.jung.persistence.GroupDAO;
import com.jung.persistence.MemberDAO;

@Service
public class GroupServiceImple implements GroupService{
	@Inject
	private GroupDAO gdao;
	@Inject
	private MemberDAO mdao;
	
	@Override
	public void groupMake(GroupBean gb) throws Exception {
		gdao.groupMake(gb);
		
	}

	@Override
	public int getMaxNum() throws Exception {
		return gdao.getMaxNum();
	}

	@Override
	public List<GroupBean> getGroupList() throws Exception {
		return gdao.getGroupList();
	}

	@Override
	public GroupBean getGroupDetail(int group_num) throws Exception {
		return gdao.getGroupDetail(group_num);
	}

	public LinkedHashMap<MemberBean, AttendenceBean> getGroupMemberList(int group_num, Date date) throws Exception {
		String member = gdao.getGroupDetail(group_num).getMember();
		Map<MemberBean, AttendenceBean> mbab_map = new HashMap<MemberBean, AttendenceBean>();
		LinkedHashMap<MemberBean, AttendenceBean> member_map = new LinkedHashMap<MemberBean, AttendenceBean>();
		if(member!=null){
			String[] member_arr = member.split(",");
			for(int i=0; i<member_arr.length; i++){
					String[] member_arr_detail = member_arr[i].split("/");
					MemberBean mb = mdao.getInfo(member_arr_detail[0]);
					AttendenceBean ab = getAttendenceListByDateGroup(mb.getId(), date, group_num);
					mbab_map.put(mb, ab);
					member_map.put(mb, ab);
			}
		}
		return member_map;
	}
	
	@Override
	public LinkedHashMap<MemberBean, String> getGroupMemberList(int group_num) throws Exception {
		String member = gdao.getGroupDetail(group_num).getMember();
		LinkedHashMap<MemberBean, String> member_map = new LinkedHashMap<MemberBean, String>();
		if(member != null){
			String[] member_arr = member.split(",");
			for(int i=0; i<member_arr.length; i++){
					String[] member_arr_detail = member_arr[i].split("/");
					MemberBean mb = mdao.getInfo(member_arr_detail[0]);
					member_map.put(mb, member_arr_detail[1]);
					}
		}
		return member_map;
	}

	@Override
	public void insertAttendence(AttendenceBean ab) throws Exception {
		gdao.insertAttendence(ab);
	}

	@Override
	public int getMaxNumForAttendence() throws Exception {
		return gdao.getMaxNumForAttendence();
	}

	@Override
	public List<AttendenceBean> getAttendenceList(String id) throws Exception {
		return gdao.getAttendenceList(id);
	}

	@Override
	public List<AttendenceBean> getAttendenceListByDate(Date date) throws Exception {
		return gdao.getAttendenceListByDate(date);
	}

	@Override
	public AttendenceBean getAttendenceDetail(String id) throws Exception {
		return gdao.getAttendenceDetail(id);
	}

	@Override
	public AttendenceBean getAttendenceByDateAndId(String id, Date date) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		map.put("id", id);
		map.put("date", format.format(date));
		return gdao.getAttendenceByDateAndId(map);
	}

	@Override
	public AttendenceBean getAttendenceListByDateGroup(String id, Date date, int group_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		map.put("id", id);
		map.put("date", format.format(date));
		map.put("group_num", group_num);
		return gdao.getAttendenceListByDateGroup(map);
	}

	@Override
	public List<AttendenceBean> getAllFeeById(String id, int group_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("group_num", group_num);
		return gdao.getAllFeeById(map);
	}

	@Override
	public List<AttendenceBean> getAllFee(int group_num) throws Exception {
		return gdao.getAllFee(group_num);
	}

	@Override
	public void updateMember(String member, int group_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("group_num", group_num);
		gdao.updateMember(map);
		
	}

	@Override
	public List<GroupBean> groupSearch(Map<String, Object> map) throws Exception {
		return gdao.groupSearch(map);
	}

	@Override
	public void payDone(int attend_num) throws Exception {
		gdao.payDone(attend_num);
	}

	@Override
	public void attendDel(int attend_num) throws Exception {
		gdao.attendDel(attend_num);
	}

	@Override
	public AttendenceBean getFeeByNum(int num) throws Exception {
		return gdao.getFeeByNum(num);
	}

	@Override
	public void updateAttend(AttendenceBean ab) throws Exception {
		gdao.updateAttend(ab);
	}

	@Override
	public void updateGroup(GroupBean gb) throws Exception {
		gdao.updateGroup(gb);
		
	}
	
}

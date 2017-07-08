package com.jung.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public List<GroupBean> getGroupList(String id) throws Exception {
		return gdao.getGroupList(id);
	}

	@Override
	public GroupBean getGroupDetail(int group_num) throws Exception {
		return gdao.getGroupDetail(group_num);
	}

	public LinkedHashMap<MemberBean, String> getGroupMemberList(int group_num) throws Exception {
		String member = gdao.getGroupDetail(group_num).getMember();
		String[] member_arr = member.split(",");
		LinkedHashMap<MemberBean, String> member_map = new LinkedHashMap<MemberBean, String>();
		for(int i=0; i<member_arr.length; i++){
				String[] member_arr_detail = member_arr[i].split("/");
				MemberBean mb = mdao.getInfo(member_arr_detail[0]);
				member_map.put(mb, member_arr_detail[1]);
		}
		return member_map;
	}
	
}

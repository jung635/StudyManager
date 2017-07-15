package com.jung.persistence;

import java.util.List;
import java.util.Map;

import com.jung.domain.MemberBean;

public interface MemberDAO {
	public void insertMember(MemberBean mb) throws Exception;
	public String getPass(String id) throws Exception;
	public MemberBean getInfo(String id) throws Exception;
	public void updateMember(MemberBean mb) throws Exception;
	public void deleteMember(String id) throws Exception;
	public List<MemberBean> getList() throws Exception;
	public void regGroup(Map<String, Object> map) throws Exception;
}

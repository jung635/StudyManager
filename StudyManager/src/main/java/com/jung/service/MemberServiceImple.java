package com.jung.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jung.domain.MemberBean;
import com.jung.persistence.MemberDAO;

@Service
public class MemberServiceImple implements MemberService{

	@Inject
	private MemberDAO mdao;
	@Inject
	private PasswordEncoding passwordEncoder;
	
	@Override
	public void insertMember(MemberBean mb) throws Exception {
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		mb.setReg_date(reg_date);
		mb.setPass(passwordEncoder.encode(mb.getPass()));
		mdao.insertMember(mb);
	}

	@Override
	public MemberBean getInfo(String id) throws Exception {
		return mdao.getInfo(id);
	}

	@Override
	public boolean matches(CharSequence inputPass, String encodedPass) throws Exception {
		return passwordEncoder.matches(inputPass, encodedPass);
	}

	@Override
	public String getPass(String id) throws Exception {
		return mdao.getPass(id);
	}

	@Override
	public void updateMember(MemberBean mb) throws Exception {
		mdao.updateMember(mb);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		mdao.deleteMember(id);
		
	}

	@Override
	public List<MemberBean> getList() throws Exception {
		return mdao.getList();
	}

	@Override
	public boolean dupIdCheck(String id) throws Exception {
		if(mdao.getInfo(id) == null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void updateGroup(Map<String, Object> map) throws Exception {
		mdao.updateGroup(map);
	}

	@Override
	public List<MemberBean> getSearchList(String search_id) throws Exception {
		return mdao.getSearchList(search_id);
	}
	
	
}


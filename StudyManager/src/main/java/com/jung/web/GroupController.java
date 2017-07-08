package com.jung.web;


import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;
import com.jung.service.GroupService;

@Controller
@RequestMapping(value="/group/*")
public class GroupController {
	
	@Inject
	private GroupService service;
	
	
	@RequestMapping(value="/make", method=RequestMethod.GET)
	public String makeGet() throws Exception{
		return "/group/make";
	}
	
	@RequestMapping(value="/make", method=RequestMethod.POST)
	public String makePost(GroupBean gb, HttpSession session) throws Exception{
		System.out.println(gb.getName());
		gb.setNum(service.getMaxNum()+1);
		gb.setAdmin((String)session.getAttribute("id"));
		service.groupMake(gb);
		return "/member/main";
	}
	
	@RequestMapping(value="/header", method=RequestMethod.GET)
	public String headerGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] board_arr = gb.getBoard().split(",");
		model.addAttribute("board", board_arr);
		model.addAttribute("length", board_arr.length);
		model.addAttribute("gb", gb);
		model.addAttribute("id", (String)session.getAttribute("id"));
		return "/group/header";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainGet(@RequestParam("group_num") int group_num, Model model, HttpSession session) throws Exception{
		GroupBean gb = service.getGroupDetail(group_num);
		session.setAttribute("group_num", gb.getNum());
		LinkedHashMap<MemberBean, String> group_map = service.getGroupMemberList(group_num);
		model.addAttribute("gb", gb);
		model.addAttribute("group_map", group_map);
		return "/group/main";
	}
	
	@RequestMapping(value="/attendence", method=RequestMethod.GET)
	public String  attendenceGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		LinkedHashMap<MemberBean, String> group_map = service.getGroupMemberList(group_num);
		model.addAttribute("gb", gb);
		model.addAttribute("group_map", group_map);
		return "/group/attendence";
	}
}

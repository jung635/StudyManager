package com.jung.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jung.domain.GroupBean;
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
	public String makePost(GroupBean gb) throws Exception{
		//SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		//Date date = format.parse(late_start);
		//System.out.println(date);
		//Thu Jan 01 14:01:00 KST 1970
		System.out.println(gb.getName());
		gb.setNum(service.getMaxNum()+1);
		service.groupMake(gb);
		return "/member/main";
	}
}

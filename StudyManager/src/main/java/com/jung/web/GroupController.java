package com.jung.web;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jung.domain.AttendenceBean;
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
		Date now = Calendar.getInstance().getTime();
		//LinkedHashMap<Map<MemberBean, AttendenceBean>, GroupBean> group_map = service.getGroupMemberList(group_num, now);
		LinkedHashMap<MemberBean, AttendenceBean> group_map = service.getGroupMemberList(group_num, now);
		model.addAttribute("gb", gb);
		model.addAttribute("group_map", group_map);
		return "/group/attendence";
	}
	
	@RequestMapping(value="/attendence", method=RequestMethod.POST)
	public String  attendencePost(Model model, HttpSession session, GroupBean gb_form, @RequestParam("status") String status, 
			@RequestParam("member_id") String member_id, HttpServletResponse resp) throws Exception{
		Calendar now = Calendar.getInstance();
		if(service.getAttendenceByDateAndId(member_id, now.getTime()) != null){
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			
			out.println("<script>");
			out.println("alert('이미 출석체크 한 회원입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			out.close();
		}else{
			AttendenceBean ab = new AttendenceBean();
			ab.setId(member_id);//as member id입력
			ab.setGroup_num(gb_form.getNum());//as group num 입력
			ab.setNum(service.getMaxNumForAttendence()+1);
			int group_num = (Integer)session.getAttribute("group_num");
			if(status.equals("attend")){
				ab.setStatus("attend");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				System.out.println(now.getTime());
				ab.setDate(now.getTime());//as 오늘자 날짜 입력
				String time = gb_form.getLate_start();
				String max_time = gb_form.getLate_max();
				if(max_time.split(":").length<3) max_time += ":00";
				if(time.split(":").length<3) time += ":00";
				Date late_start_time = format.parse(format2.format((Date)now.getTime()) + " " + time);
				Date late_max_time = format.parse(format2.format((Date)now.getTime()) + " " + max_time);
				Calendar late_time_cal = Calendar.getInstance();
				late_time_cal.setTime(late_start_time);
				Calendar late_max_time_cal = Calendar.getInstance();
				late_max_time_cal.setTime(late_max_time);
				long late_interval = (now.getTimeInMillis() - late_time_cal.getTimeInMillis())/(60*1000);
				System.out.println(late_time_cal);
				System.out.println(late_max_time_cal);
				long max_interval = (late_max_time_cal.getTimeInMillis() - late_time_cal.getTimeInMillis())/(60*1000);
				if(max_interval<0) max_interval += (long)(24*60*60*1000);
				System.out.println("interval: "+late_interval+"분");
				System.out.println("max interval: "+max_interval);
				ab.setLate_interval((int)late_interval);
				if(late_interval<0){
					ab.setLate_interval(0);//as interval 입력
					ab.setLate_fee(0);//as late fee입력
				}else if(late_interval>max_interval){
					ab.setLate_interval((int)late_interval);//as interval 입력
					ab.setLate_fee(gb_form.getLate_maxFee());//as late fee입력
				}else if(late_interval<=max_interval){
					ab.setLate_interval((int)late_interval);//as interval 입력
					System.out.println((int)((Math.ceil((double)late_interval/(double)gb_form.getLate_interval())))*gb_form.getLate_fee());
					ab.setLate_fee((int)((Math.ceil((double)late_interval/(double)gb_form.getLate_interval())))*gb_form.getLate_fee());//as late fee입력
				}
			}else{
				ab.setStatus("absence");
				ab.setDate(now.getTime());//as 오늘자 날짜 입력
				ab.setLate_interval(-1);//as interval 입력
				ab.setLate_fee(gb_form.getAbsent_fee());//as late fee입력
			}
			
			service.insertAttendence(ab);
		}
		
		return "/group/attendence";
	}
}

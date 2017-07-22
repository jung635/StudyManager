package com.jung.web;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jung.domain.AlarmBean;
import com.jung.domain.AttendenceBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;
import com.jung.service.AlarmService;
import com.jung.service.GroupService;
import com.jung.service.MemberService;

@Controller
@RequestMapping(value="/group/*")
public class GroupController {
	
	@Inject
	private GroupService service;
	
	@Inject
	private MemberService mservice;
	
	@Inject
	private AlarmService aservice;
	@RequestMapping(value="/make", method=RequestMethod.GET)
	public String makeGet() throws Exception{
		return "/group/make";
	}
	
	@RequestMapping(value="/make", method=RequestMethod.POST)
	public String makePost(GroupBean gb, HttpSession session) throws Exception{
		System.out.println("week: "+gb.getWeek());
		System.out.println("city: "+gb.getCity());
		System.out.println("goal: "+gb.getGoal());
		System.out.println("cat: "+gb.getCategory());
		System.out.println("hash: "+gb.getHashTag());
		System.out.println("secret: "+gb.isSecret());
		gb.setNum(service.getMaxNum()+1);
		String id = (String)session.getAttribute("id");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar now = Calendar.getInstance();
		String member = id + "/" + format.format(now.getTime());
		gb.setAdmin(id);
		gb.setMember(member);
		service.groupMake(gb);
		MemberBean mb = mservice.getInfo(id);
		String group = "";
		if(mb.getTeam() == null) group = String.valueOf(gb.getNum());
		else group = mb.getTeam() + "," + String.valueOf(gb.getNum());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("group", group);
		mservice.updateGroup(map);
		return "redirect:/member/main";
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
	
	@RequestMapping(value="/manage_nav", method=RequestMethod.GET)
	public String manage_navGet() throws Exception{
		return "/group/manage_nav";
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
		int group_num = (Integer)session.getAttribute("group_num");
		Calendar now = Calendar.getInstance();
		if(service.getAttendenceListByDateGroup(member_id, now.getTime(), group_num) != null){
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
			ab.setNum(service.getMaxNumForAttendence()+1);
			ab.setGroup_num(group_num);//as group num 입력
			if(status.equals("attend")){
				ab.setStatus("attend");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String time = gb_form.getLate_start();
				String max_time = gb_form.getLate_max();
				if(max_time.split(":").length<3) max_time += ":00";
				if(time.split(":").length<3) time += ":00";
				Date late_start_time = format.parse(format2.format((Date)now.getTime()) + " " + time);
				Date late_max_time = format.parse(format2.format((Date)now.getTime()) + " " + max_time);
				Calendar late_time_cal = Calendar.getInstance();
				late_time_cal.setTime(late_start_time);
				System.out.println("현재시간: "+ format.parse(format.format(now.getTime())));
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
					ab.setStatus("late");
					ab.setLate_interval((int)late_interval);//as interval 입력
					ab.setLate_fee(gb_form.getLate_maxFee());//as late fee입력
				}else if(late_interval<=max_interval){
					ab.setStatus("late");
					ab.setLate_interval((int)late_interval);//as interval 입력
					System.out.println((int)((Math.ceil((double)late_interval/(double)gb_form.getLate_interval())))*gb_form.getLate_fee());
					ab.setLate_fee((int)((Math.ceil((double)late_interval/(double)gb_form.getLate_interval())))*gb_form.getLate_fee());//as late fee입력
				}
			}else{
				ab.setStatus("absent");
				ab.setDate(now.getTime());//as 오늘자 날짜 입력
				ab.setLate_interval(-1);//as interval 입력
				ab.setAbsent_fee(gb_form.getAbsent_fee());//as late fee입력
			}
			
			service.insertAttendence(ab);
		}
		
		return "redirect:/group/attendence";
	}
	
	
	@RequestMapping(value="/myChart", method=RequestMethod.GET)
	public String  myChartGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		String id = (String)session.getAttribute("id");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<AttendenceBean> ab_list = service.getAllFeeById(id, group_num);
		List<AttendenceBean> ab_all_list = service.getAllFee(group_num);
		Iterator<AttendenceBean> ab_iterator = ab_list.iterator();
		Iterator<AttendenceBean> ab_all_iterator = ab_all_list.iterator();
		Map<String, Long> fee_map = new HashMap<String, Long>();
		long all_fee = 0;
		long all_fee_group = 0;
		while(ab_iterator.hasNext()){
			AttendenceBean ab = ab_iterator.next();
			ab.setDate(format.parse(format.format(ab.getDate())));
			System.out.println(format.parse(format.format(ab.getDate())));
			all_fee += ab.getAbsent_fee() + ab.getFee() + ab.getLate_fee();
		}
		while(ab_all_iterator.hasNext()){
			AttendenceBean ab = ab_all_iterator.next();
			if(fee_map.get(ab.getId()) != null)
				fee_map.put(ab.getId(), fee_map.get(ab.getId())+(long)(ab.getAbsent_fee() + ab.getFee() + ab.getLate_fee()));
			else
				fee_map.put(ab.getId(), (long)(ab.getAbsent_fee() + ab.getFee() + ab.getLate_fee()));
			all_fee_group += ab.getAbsent_fee() + ab.getFee() + ab.getLate_fee();
		}
		String data = "";
		if(fee_map.size() != 0){
			data = "[";
			Iterator<String> fee_map_Iterator = fee_map.keySet().iterator();
			while(fee_map_Iterator.hasNext()){
				String key = fee_map_Iterator.next();
				data += "['"+key+"',"+fee_map.get(key)+"], ";
			}
			data = data.substring(0,data.length()-2)+ "]";
		}
		
		
		model.addAttribute("ab_list", ab_list);
		model.addAttribute("all_fee", all_fee);
		model.addAttribute("all_fee_group", all_fee_group);
		model.addAttribute("fee_map", fee_map);
		model.addAttribute("data", data);
		return "/group/myChart";
	}
	
	@RequestMapping(value="/manageMember", method=RequestMethod.GET)
	public String  manageMemberGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] member_arr = gb.getMember().split(",");
		for(int i=0; i<member_arr.length; i++){
			member_arr[i] = member_arr[i].split("/")[0];
		}
		model.addAttribute("member", member_arr);
		model.addAttribute("length", member_arr.length);
		return "/group/member_manage";
	}
	
	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)
	public String  memberInfoGet(@RequestParam("member_id") String member_id, 
			Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] member_arr = gb.getMember().split(",");
		String reg_date = "";
		for(int i=0; i<member_arr.length; i++){
			String reg_date_tmp = member_arr[i].split("/")[1];
			member_arr[i] = member_arr[i].split("/")[0];
			if(member_arr[i].equals(member_id)) reg_date = reg_date_tmp;
		}
		MemberBean mb = mservice.getInfo(member_id);
		
		model.addAttribute("mb", mb);
		model.addAttribute("reg_date", reg_date);
		return "/group/memberInfo";
	}
	
	@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
	public void  memberDeleteGet(@RequestParam("member_id") String member_id, 
			Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] member_arr = gb.getMember().split(",");
		String member = "";
		for(int i=0; i<member_arr.length; i++){
			String member_str = member_arr[i].split("/")[0];
			if(!member_str.equals(member_id)) {
				member += member_arr[i] + ",";
			}
		}
		System.out.println(member.substring(0, member.length()-1));
		service.updateMember(member.substring(0, member.length()-1), group_num);
		
		MemberBean mb = mservice.getInfo(member_id);
		String[] group_num_arr = mb.getTeam().split(",");
		String group = "";
		for(int i=0; i<group_num_arr.length; i++){
			int member_group_num = Integer.parseInt(group_num_arr[i]);
			if(member_group_num != group_num){
				group += member_group_num + ",";
			}
		}
		System.out.println(group.substring(0, group.length()-1));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", member_id);
		map.put("group", group.substring(0, group.length()-1));
		mservice.updateGroup(map);
		
		out.println("<script>");
		out.println("alert('탈퇴 되었습니다.');");
		out.println("location.href='manageMember';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/memberSearchList", method=RequestMethod.GET)
	public String  memberSearchListGet(@RequestParam("search_id") String search_id,
			Model model, HttpSession session) throws Exception{
		List<MemberBean> memberList = mservice.getSearchList(search_id);
		model.addAttribute("memberList", memberList);
		model.addAttribute("length", memberList.size());
		return "/group/memberSearchList";
	}
	
	@RequestMapping(value="/invite", method=RequestMethod.GET)
	public void  inviteGet(@RequestParam("invite_id") String invite_id,
			Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] team = gb.getMember().split(",");
		boolean joined_member = false;
		for(int i=0; i<team.length; i++){
			if(team[i].split("/")[0].equals(invite_id)){
				joined_member = true;
			}
		}
		
		if(joined_member){
			out.println("<script>");
			out.println("alert('이미 가입한 회원입니다.');");
			out.println("history.back()");
			out.println("</script>");
		}else{
			String content = "\"" + gb.getName() + "\"" + "그룹으로부터 초대가 되었습니다.";
			AlarmBean ab = new AlarmBean();
			ab.setId(invite_id);
			ab.setNum(aservice.getMaxNum()+1);
			ab.setMove("invited?group_num="+group_num);
			ab.setContent(content);
			aservice.insertAlarm(ab);
			
			out.println("<script>");
			out.println("alert('초대가 완료되었습니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/manageBoard", method=RequestMethod.GET)
	public String  manageBoardGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] board_arr = gb.getBoard().split(",");
		model.addAttribute("board", board_arr);
		model.addAttribute("length", board_arr.length);
		model.addAttribute("gb", gb);
		return "/group/board_manage";
	}
	@RequestMapping(value="/manageFee", method=RequestMethod.GET)
	public String  manageFeeGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] board_arr = gb.getBoard().split(",");
		model.addAttribute("board", board_arr);
		model.addAttribute("length", board_arr.length);
		model.addAttribute("gb", gb);
		return "/group/fee_manage";
	}
	@RequestMapping(value="/manageGroup", method=RequestMethod.GET)
	public String  manageGroupGet(Model model, HttpSession session) throws Exception{
		int group_num = (Integer)session.getAttribute("group_num");
		GroupBean gb = service.getGroupDetail(group_num);
		String[] board_arr = gb.getBoard().split(",");
		model.addAttribute("board", board_arr);
		model.addAttribute("length", board_arr.length);
		model.addAttribute("gb", gb);
		return "/group/group_manage";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String searchPost(GroupBean gb, HttpSession session,
			@RequestParam("search_input") String search_input, Model model) throws Exception{
		Map<String, Object> search_map = new HashMap<String, Object>();
		if(gb.getWeek() != null){
			String[] week_array = gb.getWeek().split(",");
			search_map.put("week", week_array);
		}
		if(gb.getCity() != null && gb.getCity().trim().length() != 0)
			search_map.put("city", gb.getCity());
		if(gb.getGoal() != null && gb.getGoal().trim().length() != 0)
			search_map.put("goal", gb.getGoal());
		if(gb.getCategory() != null && gb.getCategory().trim().length() != 0)
			search_map.put("category", gb.getCategory());
		
		search_map.put("search_input", search_input);
		
		List<GroupBean> list = service.groupSearch(search_map);
		Iterator<GroupBean> iterator = list.iterator();
		while(iterator.hasNext()){
			System.out.println(iterator.next().getName());
		}
		
		model.addAttribute("list", list);
		return "/group/groupSearchList";
	}
}

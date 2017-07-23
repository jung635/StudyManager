package com.jung.web;



import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jung.domain.AlarmBean;
import com.jung.domain.BoardBean;
import com.jung.domain.GroupBean;
import com.jung.domain.MemberBean;
import com.jung.domain.PageMaker;
import com.jung.service.AlarmService;
import com.jung.service.BoardService;
import com.jung.service.CustomUserDetails;
import com.jung.service.GroupService;
import com.jung.service.MemberService;
import com.jung.service.RegisterRequestValidator;


@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private RegisterRequestValidator validator; //주입을 사용하려면 그 사용하려는 클래스를 new로 객체화하면 안되고 주입해주어야한다!
	
	@Inject
	private GroupService gservice;
	
	@Inject
	private AlarmService aservice;
	
	@Inject
	private BoardService bservice;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertGet() throws Exception{
		return "/member/insertForm";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(@ModelAttribute("mb") MemberBean mb, Errors error, Model model) throws Exception{
		//RegisterRequestValidator validator = new RegisterRequestValidator(); ->이렇게 하면 안됨!
		validator.validate(mb, error);
		if(error.hasErrors()){
			return "/member/insertForm";
		}else{
			service.insertMember(mb);
			return "redirect:/member/login";
		}
	}
	@RequestMapping(value="/dupIdCheck", method=RequestMethod.GET)
	public String dupIdCheckGet(String dupId, Model model) throws Exception{
		model.addAttribute("dupId", dupId);
		return "/member/dupIdCheck";
	}
	@RequestMapping(value="/dupIdCheck", method=RequestMethod.POST)
	public String dupIdCheckPost(MemberBean mb, Model model) throws Exception{
		model.addAttribute("dupCheck", service.dupIdCheck(mb.getId())) ;
		model.addAttribute("dupId", mb.getId());
		return "/member/dupIdCheck";
	}
	
	@RequestMapping(value="/login", method={RequestMethod.GET,RequestMethod.POST})
	public String loingGet() throws Exception{
		return "/member/loginForm";
	}
	
	@RequestMapping(value="/login_success", method={RequestMethod.GET,RequestMethod.POST})
	public String loginPost(MemberBean mb, HttpSession session, HttpServletResponse response) throws Exception{
		CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();
		session.setAttribute("id", userDetails.getUsername());
			
		return "redirect:/member/main";
	}
	
	@RequestMapping(value="/main2", method=RequestMethod.GET)
	public String mainGet(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		model.addAttribute("id", id);
		Map<Integer, GroupBean> map = new HashMap<Integer, GroupBean>();
		if(service.getInfo(id).getTeam() != null){
			String[] group_num = service.getInfo(id).getTeam().split(",");
			for(int i=0; i<group_num.length; i++){
				System.out.println(group_num[i]);
				map.put(Integer.parseInt(group_num[i]), gservice.getGroupDetail(Integer.parseInt(group_num[i])));
			}
			
		}
		model.addAttribute("group_map", map);
		return "/member/main";
	}
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainGet2(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		Map<Integer, GroupBean> group_map = new HashMap<Integer, GroupBean>();
		model.addAttribute("id", id);
		if(id != null){
			if(service.getInfo(id).getTeam() != null){
				String[] group_num = service.getInfo(id).getTeam().split(",");
				for(int i=0; i<group_num.length; i++){
					group_map.put(Integer.parseInt(group_num[i]), gservice.getGroupDetail(Integer.parseInt(group_num[i])));
				}
			}
		}
		
		model.addAttribute("group_map", group_map);
		return "/member/main2";
	}
	
	@RequestMapping(value="/header", method={ RequestMethod.GET, RequestMethod.POST })
	public String headerGet() throws Exception{
		return "/member/header";
	}
	@RequestMapping(value="/member_nav", method={ RequestMethod.GET, RequestMethod.POST })
	public String member_navGet() throws Exception{
		return "/member/member_nav";
	}
	
	@RequestMapping(value="/bottom", method={ RequestMethod.GET, RequestMethod.POST })
	public String bottomGet() throws Exception{
		return "/member/bottom";
	}
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String infoGet(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		MemberBean mb = service.getInfo(id);
		model.addAttribute("mb", mb);
		
		return "/member/info";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateGet(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		MemberBean mb = service.getInfo(id);
		
		model.addAttribute("mb", mb);
		return "/member/updateForm";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(HttpSession session, MemberBean mb, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		String encodedPass = service.getPass(id);
		boolean isMatch = service.matches(mb.getPass(), encodedPass);
		String url = "";
		String mesg = "";
		if(isMatch){
			service.updateMember(mb);
			url = "ok";
			mesg = "업데이트 되었습니다.";
		}else{
			url = "notOk";
			mesg = "비밀번호를 확인해주세요.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("mesg", mesg);
		return "/member/updateCheck";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteGet(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		model.addAttribute("id", id);
		return "/member/deleteForm";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deletePost(HttpSession session, MemberBean mb, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		String encodedPass = service.getPass(id);
		boolean isMatch = service.matches(mb.getPass(), encodedPass);
		String url = "";
		String mesg = "";
		if(isMatch){
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if(id != null){
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			service.deleteMember(id);
			url = "ok";
			mesg = "탈퇴되었습니다.";
		}else{
			url = "notOk";
			mesg = "비밀번호를 확인해주세요.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("mesg", mesg);
		
		return "/member/deleteCheck";
	}
	
	@RequestMapping(value="/login_duplicate", method=RequestMethod.GET)
	public String loginDuplicate() throws Exception{
		return "/member/loginDuplicate";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model) throws Exception{
		List<MemberBean> list = service.getList();
		model.addAttribute("list", list);
		return "/member/list";
	}
	
	@RequestMapping(value="/alarmList", method=RequestMethod.GET)
	public String AlarmListGet(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		List<AlarmBean> alarmList = aservice.getBoardList(id);
		model.addAttribute("alarmList", alarmList);
		return "/member/alarmList";
	}
	
	@RequestMapping(value="/invited", method=RequestMethod.GET)
	public void  invitedGet(@RequestParam("group_num") int group_num,
			Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		GroupBean gb = gservice.getGroupDetail(group_num);
		String id = (String)session.getAttribute("id");
		MemberBean mb = service.getInfo(id);
		String group = "";
		boolean joined_member = false;
		if(mb.getTeam() == null){
			group = String.valueOf(gb.getNum());
		}else{
			String[] team = mb.getTeam().split(",");
			group = mb.getTeam() + "," + String.valueOf(gb.getNum());
			for(int i=0; i<team.length; i++){
				if(Integer.parseInt(team[i]) == group_num){
					joined_member = true;
				}
			}
		}
		
			
		if(joined_member){
			out.println("<script>");
			out.println("alert('이미 가입한 그룹입니다.');");
			out.println("window.close()");
			out.println("</script>");
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("group", group);
			service.updateGroup(map);
			
			out.println("<script>");
			out.println("alert('그룹에 가입이 완료되셨습니다.');");
			out.println("window.close()");
			out.println("</script>");
			
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar now = Calendar.getInstance();
			String member = gb.getMember() + "," + id + "/" + format.format(now.getTime());
			System.out.println(member);
			gservice.updateMember(member, group_num);
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="/myGroup", method=RequestMethod.GET)
	public String myGroupList(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("id");
		Map<Integer, GroupBean> group_map = new HashMap<Integer, GroupBean>();
		model.addAttribute("id", id);
		if(id != null){
			if(service.getInfo(id).getTeam() != null){
				String[] group_num = service.getInfo(id).getTeam().split(",");
				for(int i=0; i<group_num.length; i++){
					group_map.put(Integer.parseInt(group_num[i]), gservice.getGroupDetail(Integer.parseInt(group_num[i])));
				}
			}
		}
		
		model.addAttribute("group_map", group_map);
		return "/member/myGroup";
	}
	
	@RequestMapping(value="/groupSearch", method=RequestMethod.GET)
	public String groupSearchGet() throws Exception{
		return "/member/groupSearch";
	}
}

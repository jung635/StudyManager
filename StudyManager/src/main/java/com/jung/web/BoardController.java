package com.jung.web;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jung.domain.BoardBean;
import com.jung.domain.MemberBean;
import com.jung.domain.PageMaker;
import com.jung.service.BoardService;
import com.jung.service.MemberService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	@Inject
	private MemberService mservice;
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String insertGet() throws Exception{
		return "/board/writeForm";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String insertPost(BoardBean bb, @RequestParam("fileInput") MultipartFile file ,HttpServletRequest req, HttpSession session) throws Exception{
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) ip = req.getRemoteAddr();
		bb.setIp(ip);
		bb.setNum(service.getMaxNum()+1);
		bb.setName((String)session.getAttribute("id"));
		String root_path = req.getSession().getServletContext().getRealPath("/");
		String my_path = "resources"+File.separator+"files";
		File file_dir = new File(root_path+my_path);
		if(file_dir.exists() == false) file_dir.mkdirs();
		
		String file_name = file.getOriginalFilename();
		bb.setFileName(file_name);
		int index = file_name.lastIndexOf(".");
		System.out.println(root_path+my_path);
		String re_file_name = (String)session.getAttribute("id") + new Date().getTime() + file_name.substring(index, file_name.length());
		//File file_ori = new File(root_path + my_path + File.separator + file_name);
		File file_new = new File(root_path + my_path + File.separator + re_file_name);
		//file_ori.renameTo(file_new);
		file.transferTo(file_new);
		bb.setFile(re_file_name);
		
		service.insertBoard(bb);
		return "redirect:/board/list?pageNum=1";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model, HttpServletRequest req) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageBlock(10);
		pageMaker.setPageSize(10);
		pageMaker.setCount(service.getListCount());
		int pageNum;
		if(req.getParameter("pageNum") == null) pageNum = 1;
		else pageNum = Integer.parseInt(req.getParameter("pageNum"));
		pageMaker.setPageNum(pageNum);
		Map<String, Object> pageMap = new HashMap<String, Object>();
		int start = (pageMaker.getPageSize()*(pageNum-1));
		pageMap.put("start", start);
		pageMap.put("pageSize", pageMaker.getPageSize());
		model.addAttribute("boardList", service.getBoardList(pageMap));
		model.addAttribute("pageMaker", pageMaker);
		return "/board/list";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String contentGet(Model model, @RequestParam("num") int num, @RequestParam("pageNum") int pageNum) throws Exception{
		service.updateReadCount(num);
		model.addAttribute("bb", service.getContent(num));
		model.addAttribute("pageNum", pageNum);
		return "/board/content";
	}
	
	@RequestMapping(value="/fileDownload", method=RequestMethod.GET)
	public String fileDownload(@RequestParam("fileName") String fileName, HttpServletRequest req,HttpServletResponse resp) throws Exception{
		String root_path = req.getSession().getServletContext().getRealPath("/");
		String my_path = "resources"+File.separator+"files";
		byte fileByte[] = FileUtils.readFileToByteArray(new File(root_path + my_path + File.separator + fileName));
	    resp.setContentType("application/octet-stream");
	    resp.setContentLength(fileByte.length);
	    resp.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8")+"\";");
	    resp.setHeader("Content-Transfer-Encoding", "binary");
	    resp.getOutputStream().write(fileByte);
	     
	    resp.getOutputStream().flush();
	    resp.getOutputStream().close();

		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateGet(HttpSession session, Model model, @RequestParam("num") int num, @RequestParam("pageNum") int pageNum) throws Exception{
		BoardBean bb = service.getContent(num);
		String url;
		if(!((String)session.getAttribute("id")).equals(bb.getName())){
			url = "board/updateReject";
		}else{
			model.addAttribute("bb", bb);
			model.addAttribute("pageNum", pageNum);
			url = "board/updateForm";
		}

		return url;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void updatePost(BoardBean bb, @RequestParam("pass") String pass,@RequestParam("pageNum") int pageNum,@RequestParam("file_ori") String file_ori, @RequestParam("fileInput") MultipartFile file ,HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		MemberBean mb = mservice.getInfo((String)session.getAttribute("id"));
		if(mservice.matches(pass, mb.getPass())){
			String ip = req.getHeader("X-FORWARDED-FOR");
			if(ip == null) ip = req.getRemoteAddr();
			bb.setIp(ip);
			
			if(!file.isEmpty()){
				String root_path = req.getSession().getServletContext().getRealPath("/");
				String my_path = "resources"+File.separator+"files";
				File file_dir = new File(root_path+my_path);
				if(file_dir.exists() == false) file_dir.mkdirs();
				
				String file_name = file.getOriginalFilename();
				bb.setFileName(file_name);
				int index = file_name.lastIndexOf(".");
				System.out.println(root_path+my_path);
				String re_file_name = (String)session.getAttribute("id") + new Date().getTime() + file_name.substring(index, file_name.length());
				File file_new = new File(root_path + my_path + File.separator + re_file_name);
				file.transferTo(file_new);
				bb.setFile(re_file_name);
				File file_ori_delete = new File(root_path + my_path + File.separator + file_ori);
				file_ori_delete.delete();
			}else{
				bb.setFile(file_ori);
			}
			service.updateBoard(bb);
			
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다.');");
			out.println("location.href='/web/board/content?num=" + bb.getNum() + "&pageNum="+pageNum+"';");
			out.println("</script>");
			out.flush();
			out.close();
		}else{
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteGet(Model model, HttpSession session,@RequestParam("num") int num) throws Exception{
		BoardBean bb = service.getContent(num);
		String url;
		if(!((String)session.getAttribute("id")).equals(bb.getName())){
			url = "board/updateReject";
		}else{
			model.addAttribute("num", num);
			model.addAttribute("id", (String)session.getAttribute("id"));
			url = "board/deleteForm";
		}

		return url;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void deletePost(@RequestParam("num") int num, @RequestParam("pass") String pass, HttpServletResponse resp, HttpSession session) throws Exception{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		MemberBean mb = mservice.getInfo((String)session.getAttribute("id"));
		if(mservice.matches(pass, mb.getPass())){
			service.deleteBoard(num);
			out.println("<script>");
			out.println("alert('삭제가 완료되었습니다.');");
			out.println("location.href='/web/board/list';");
			out.println("</script>");
			out.flush();
			out.close();
		}else{
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
			out.close();
		}
	}
}

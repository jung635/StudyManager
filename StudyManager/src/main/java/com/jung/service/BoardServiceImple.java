package com.jung.service;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.jung.domain.BoardBean;
import com.jung.persistence.BoardDAO;
@Service
public class BoardServiceImple implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public void insertBoard(BoardBean bb) throws Exception {
		bdao.insertBoard(bb);
	}

	@Override
	public int getMaxNum() throws Exception {
		return bdao.getMaxNum();
	}

	@Override
	public List<BoardBean> getBoardList(Map<String, Object> pageMap) throws Exception {
		return bdao.getBoardList(pageMap);
	}

	@Override
	public int getListCount(Map<String, Object> count_map) throws Exception {
		return bdao.getListCount(count_map);
	}

	@Override
	public BoardBean getContent(int num) throws Exception {
		return bdao.getContent(num);
	}

	@Override
	public void updateBoard(BoardBean bb) throws Exception {
		bdao.updateBoard(bb);
	}

	@Override
	public void updateReadCount(int num) throws Exception {
		bdao.updateReadCount(num);
	}

	@Override
	public void deleteBoard(int num) throws Exception {
		bdao.deleteBoard(num);
		
	}
	
	@Override
	public String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent"); 
		if (header.indexOf("MSIE") > -1) { return "MSIE"; } 
		else if (header.indexOf("Chrome") > -1) { return "Chrome"; } 
		else if (header.indexOf("Opera") > -1) { return "Opera"; } 
		else if (header.indexOf("Trident/7.0") > -1){return "MSIE"; } 
		return "Firefox";
	}
	
	@Override
	public String getDisposition(String filename, String browser) throws Exception {
        
		   String encodedFilename = null;
		   if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		   } else if (browser.equals("Firefox")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		   } else if (browser.equals("Opera")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		   } else if (browser.equals("Chrome")) {
			  StringBuffer sb = new StringBuffer();
			  for (int i = 0; i < filename.length(); i++) {
						  char c = filename.charAt(i);
						  if (c > '~') {
									 sb.append(URLEncoder.encode("" + c, "UTF-8"));
						  } else {
									 sb.append(c);
						  }
			  }
			  encodedFilename = sb.toString();
		   } else {
			  throw new RuntimeException("Not supported browser");
		   }
		   return encodedFilename;
		 
		}

	
}

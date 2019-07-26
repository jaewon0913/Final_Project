package com.khfinal.mvc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberbiz;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/mainpage.do")
	public String main() {
		return "redirect:mainpage.jsp";
	}
	 
	@RequestMapping("/logintest.do")
	@ResponseBody
	public Map<String, Boolean> login(String id, String pw, HttpSession session) {
		MemberDto memberdto = memberbiz.login(id,pw);
		boolean loginchk = false;
		
		if(memberdto != null) {
			session.setAttribute("login", memberdto);
			loginchk = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("loginchk", loginchk);
		
		return map;
	}
	
	@RequestMapping("/logouttest.do")
	public String logout(HttpSession session) {
		session.setAttribute("login", null);
		
		return "redirect:mainpage.jsp";
	}
	
	@RequestMapping("/insertformtest.do")
	public String insertform() {
		
		return "insertform";
	}
	
}

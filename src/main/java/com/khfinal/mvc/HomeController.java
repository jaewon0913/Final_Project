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

import com.khfinal.mvc.member.biz.member_biz;
import com.khfinal.mvc.member.dto.member_dto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private member_biz memberbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/mainpage.do")
	public String main() {
		return "mainpage";
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
	public Map<String, Boolean> login(String id, String pw, HttpSession session) {
		member_dto memberdto = memberbiz.login(id,pw);
		boolean loginchk = false;
		
		if(memberdto != null) {
			session.setAttribute("login", memberdto);
			loginchk = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("loginchk", loginchk);
		
		return map;
	}
	
	@RequestMapping("/insertform.do")
	public String insertform() {
		return "insertform";
	}
}

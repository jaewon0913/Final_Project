package com.khfinal.mvc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;

@Controller
public class LoginController {
	
	@Autowired
	private MemberBiz memberbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	 
	@RequestMapping("/login.do")
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
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("login", null);
		
		return "redirect:mainpage.jsp";
	}
	
	@RequestMapping("/insertform.do")
	public String insertform() {
		return "MemberInsert";
	}
	
	@RequestMapping("/insert_res.do")
	public String insert_res(MemberDto dto) {
		int res = memberbiz.insert_member(dto);
		if(res > 0) {
			return "redirect:mainpage.do";
		}else {
			return "redirect:insertform.do";
		}
	}
	
	@RequestMapping("/idChk.do")
	public String idChk(String member_id,Model model) {
		boolean idnotused = memberbiz.idChk(member_id);
		model.addAttribute("idnotused", idnotused);
		return "idchk";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "MemberMypage";
	}

	@RequestMapping("/detail.do")
	public String detail(Model model, String id, HttpSession session) {
		MemberDto memberdto = (MemberDto) session.getAttribute("login");
		model.addAttribute("memberdto", memberdto);
		return "MemberUpdate";
	}
	
	@RequestMapping("/update.do")
	public String update(@ModelAttribute MemberDto dto) {
		System.err.println("�뾽�뜲�씠�듃�븯�옄");
		int res = memberbiz.update_member(dto);
		System.out.println("�뾽�뜲�씠�듃寃곌낵 : " + res);
		if(res > 0) {
			return "redirect:mypage.do";
		} else {
			return "error/ErrorPage";
		}
	}
}

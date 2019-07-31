package com.khfinal.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;
import com.khfinal.mvc.member.etc.VerifyRecaptcha;

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
	
	@RequestMapping("/kakaologin.do")
	public String kakaologin(String id, String name,HttpSession session,Model model){
		Boolean idchk = false;
		idchk = memberbiz.idChk(id);//가입가능 = true
		if(idchk == true) {//가입페이지로 이동
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			return "kakaoMemberInsert";
		}else {//로그인으로이동
			MemberDto memberdto = memberbiz.login(id,id);
			if(memberdto != null) {
				session.setAttribute("login", memberdto);
			}
			return "redirect:mainpage.do";
		}
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
//Captcha
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha.do", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey("6Lcjlq8UAAAAAHgAY2P6C7a6VUKdGFoqBhYj70ap");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		System.out.println(gRecaptchaResponse);
		//0 = 성공, 1 = 실패, -1 = 오류
		try {
			if(VerifyRecaptcha.verify(gRecaptchaResponse))
				return 0;
			else return 1;
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
}

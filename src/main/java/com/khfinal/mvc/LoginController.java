package com.khfinal.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String insert_res(MemberDto dto,String addr1,String addr2, String addr3) {
		System.out.println(addr1+" "+addr2+" "+addr3);
		dto.setMember_address(addr2+" "+addr3);
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
	public String update(@ModelAttribute MemberDto dto, Model model, HttpSession session) {
		int res = memberbiz.update_member(dto);
		if (res > 0) {
			MemberDto memberdto = (MemberDto) session.getAttribute("login");
			MemberDto memberdto_res = memberbiz.login(memberdto.getMember_id(), memberdto.getMember_pw());
			session.setAttribute("login", memberdto_res);
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
	
	/* ---------- 아이디 / 비밀번호 찾기 ---------- */
	@RequestMapping("/accountfind.do")
	public String accountfind() {
		return "AccountFind";
	}
	
	@RequestMapping("/idfind.do")
	public String idfind(MemberDto dto, Model model, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("name:" + dto.getMember_name() + "email: " + dto.getMember_email());
		MemberDto memberdto = memberbiz.idfind(dto.getMember_name(), dto.getMember_email());
		if (memberdto != null) {
			model.addAttribute("memberdto", memberdto);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원님의 아이디는" + memberdto.getMember_id() + "입니다.')</script>");
			out.flush();
			return "AccountFind";
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이름과 이메일을 확인해주세요')</script>");
			out.flush();
			return "AccountFind";
		}
	}
	
	@RequestMapping("/pwfind.do")
	public String pwfind(MemberDto dto, Model model, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("id:" + dto.getMember_id() + "email: " + dto.getMember_email());
		MemberDto memberdto = memberbiz.pwfind(dto.getMember_id(), dto.getMember_email());
		if (memberdto != null) {
			model.addAttribute("memberdto", memberdto);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원님의 비밀번호는" + memberdto.getMember_pw() + "입니다.')</script>");
			out.flush();
			return "AccountFind";
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디와 이메일을 확인해주세요')</script>");
			out.flush();
			return "AccountFind";
		}
	}
}

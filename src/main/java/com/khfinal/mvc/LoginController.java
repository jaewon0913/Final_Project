package com.khfinal.mvc;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.khfinal.mvc.boxorder.biz.BoxorderBiz;
import com.khfinal.mvc.boxorder.dto.BoxorderDto;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;
import com.khfinal.mvc.member.etc.VerifyRecaptcha;


@Controller
public class LoginController {

	@Autowired
	private MemberBiz memberbiz;
	@Autowired
	private BoxorderBiz boxorderbiz;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping("/login.do")
	public String login(String id, String password) {
		String encPassword = bcryptPasswordEncoder.encode(password);
		System.out.println("암호화된 비밀번호 : "+encPassword);
		
		MemberDto memberdto = memberbiz.login(id,encPassword);
		
		if(memberdto != null) {
			return "redirect: mainpage.do";
		}else {
			return "redirect: loginMain.do";
		}
		
	}
	@RequestMapping("/loginsuccess.do")
	public String loginsuccess(Principal auth,HttpSession session) {
		MemberDto memberdto = memberbiz.loginsuccess(auth.getName());
		if(memberdto != null) {
			session.setAttribute("logindto", memberdto);
			return "redirect: mainpage.do";
		}else {
			return "redirect: mainpage.do";
		}
	}

	@RequestMapping("/kakaologin.do")
	public String kakaologin(String id, String name, HttpSession session, Model model) {
		Boolean idchk = false;
		idchk = memberbiz.idChk(id);// 가입가능 = true
		if (idchk == true) {// 가입페이지로 이동
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			return "kakaoMemberInsert";
		}else {//로그인으로이동
			System.out.println("kakaologin컨틀롤러 else문");
			MemberDto memberdto = memberbiz.login(id,id);
			System.out.println(memberdto.getMember_address()+" "+memberdto.getMember_name());
			if(memberdto != null) {
				session.setAttribute("logindto", memberdto);
			}
			return "redirect:mainpage.do";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("login", null);

		return "redirect:mainpage.do";
	}

	@RequestMapping("/insertform.do")
	public String insertform() {
		return "member/MemberInsert";
	}

	@RequestMapping("/insert_res.do")
	public String insert_res(MemberDto dto,String addr1,String addr2, String addr3) {
		System.out.println("내가 입력한 pw: "+dto.getMember_pw());
		
		System.out.println(addr1+" "+addr2+" "+addr3);
		dto.setMember_address(addr2+" "+addr3);
		
		String encPassword = bcryptPasswordEncoder.encode(dto.getMember_pw());
		dto.setMember_pw(encPassword);
		System.out.println("암호화된 비밀번호 : "+encPassword);
		
		
		int res = memberbiz.insert_member(dto);
		if (res > 0) {
			return "redirect:mainpage.do";
		} else {
			return "redirect:insertform.do";
		}
	}
	
	@RequestMapping("/kakaoinsert_res.do")
	public String kakaoinsert_res(MemberDto dto,String addr1,String addr2,String addr3,HttpSession session) {
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
	public String idChk(String member_id, Model model) {
		boolean idnotused = memberbiz.idChk(member_id);
		model.addAttribute("idnotused", idnotused);
		return "member/idchk";
	}
	
	@RequestMapping("/test.do")
	public String testpage(Principal auth) {
		System.out.println("---------------"+auth.getName());
		return "redirect:main.do";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/MemberMypage";
	}

	@RequestMapping("/detail.do")
	public String detail(Model model, String id, HttpSession session) {
		MemberDto memberdto = (MemberDto) session.getAttribute("login");
		model.addAttribute("memberdto", memberdto);
		return "member/MemberUpdate";
	}

	@RequestMapping("/update.do")
	public String update(@ModelAttribute MemberDto dto, Model model, HttpSession session) {
		System.out.println("내가 입력한 pw: "+dto.getMember_pw());		
		String encPassword = bcryptPasswordEncoder.encode(dto.getMember_pw());
		dto.setMember_pw(encPassword);
		System.out.println("암호화된 비밀번호 : "+encPassword);
		int res = memberbiz.update_member(dto);
		if (res > 0) {
			MemberDto memberdto = (MemberDto) session.getAttribute("logindto");
			MemberDto memberdto_res = memberbiz.login(memberdto.getMember_id(), encPassword);
			session.setAttribute("logindto", memberdto_res);
			return "redirect:mypage.do";
		} else {
			return "error/ErrorPage";
		}
	}
	
	@RequestMapping("/pwupdateform.do")
	public String pwupdateform(Model model, HttpServletResponse response,@RequestParam String member_id) {
		String id = member_id.split(",")[1];
		model.addAttribute("member_id",id);
		System.out.println("넘어온아이디" + id);
		return "pwUpdate";
	}
	
	@RequestMapping("/pwupdate.do")
	public String pwupdate(@ModelAttribute MemberDto dto, Model model,HttpServletResponse response, HttpSession session,@RequestParam String member_id) throws IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("내가 입력한 pw: " + dto.getMember_pw());		
		String encPassword = bcryptPasswordEncoder.encode(dto.getMember_pw());
		model.addAttribute(member_id);
		dto.setMember_pw(encPassword);
		dto.setMember_id(member_id);
		System.out.println(member_id+"아이디입니다");
		System.out.println("암호화된 비밀번호 : "+encPassword);
		int res = memberbiz.update_pw(dto);
		if(res > 0) {
			/*
			 * MemberDto memberdto_res = memberbiz.loginpw(dto.getMember_id(), encPassword);
			 * session.setAttribute("logindto", memberdto_res);
			 */
			session.setAttribute("logindto", null);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 변경되었습니다.')</script>");
			out.flush();
			return "loginMain";
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
		return "member/AccountFind";
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
			return "member/AccountFind";
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이름과 이메일을 확인해주세요')</script>");
			out.flush();
			return "member/AccountFind";
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
			out.println("<script>alert('비밀번호 재설정 페이지로 이동합니다.')</script>");
			out.flush();
			return "member/AccountFind";
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디와 이메일을 확인해주세요')</script>");
			out.flush();
			return "member/AccountFind";
		}
	}
	
//	@RequestMapping("/qrcodepage.do")
//	public String qrcodepage(Principal auth,Model model) {
//		BoxorderDto boxorderdto = boxorderbiz.selectOne(auth.getName());
//		model.addAttribute("boxorderdto", boxorderdto);
//		
//		return "qrcodepage";
//	}
	
	@RequestMapping(value="/makeqr.do") 
	public void makeqr() throws IOException { 
		String url = "http://192.168.110.39:8787/mvc/"; 
		int width = 150; 
		int height = 150; 
		String file_path = "C:"+File.separator+"qr"+File.separator; 
		System.out.println("file.separator"+File.separator);
		String file_name = "QRcode.png"; 
		makeQR(url, width, height, file_path, file_name); 
	}

	public static void makeQR(String url,int width, int height, String file_path, String file_name){ 
		try { 
				File file = null; 
				file = new File(file_path); 
				if(!file.exists()) { 
					file.mkdirs(); 
				} 
				QRCodeWriter writer = new QRCodeWriter(); 
				url = new String(url.getBytes("UTF-8"), "ISO-8859-1"); 
				BitMatrix matrix = writer.encode(url, BarcodeFormat.QR_CODE,width, height); 
				//QR코드 색상 
				int qrColor	=	0xFF2e4e96; 
				MatrixToImageConfig config = new MatrixToImageConfig(qrColor,0xFFFFFFFF); 
				BufferedImage qrImage	= MatrixToImageWriter.toBufferedImage(matrix,config); 
				ImageIO.write(qrImage, "png", new File(file_path+file_name));		
			} catch (Exception e) { 
				e.printStackTrace(); 
			} 
		}
		
	}

	


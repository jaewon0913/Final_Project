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
	@RequestMapping("/custom.do")
	public String custom() {
		return "custom/CustomPage";
	}
	@RequestMapping("/chat.do")
	public String chat() {
		return "chat/chat";
	}
	@RequestMapping("/loginMain.do")
	public String loginmain() {
		return "loginMain";
	}
}

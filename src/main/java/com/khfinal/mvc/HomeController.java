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
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/mainpage.do")
	public String main() {
		
		
		return "mainpage";
	}

	@RequestMapping("/chat.do")
	public String chat() {
		return "chat/chat";
	}
	@RequestMapping("/loginMain.do")
	public String loginmain() {
		return "member/loginMain";
	}
	@RequestMapping("/delivery_place.do")
	public String delivery_place() {
		return "place/delivery_place";
	}
	@RequestMapping("/popup_map.do")
	public String popup_map() {
		return "place/popup_map";
	}
	@RequestMapping("/nutritiongraph.do")
	public String nutritiongraph() {
		return "graph/nutritiongraph";
	}

}

package com.khfinal.mvc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.notice.biz.NoticeBiz;
import com.khfinal.mvc.notice.dto.NoticeDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MemberBiz memberbiz;
	
	@Autowired
	private NoticeBiz noticebiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/startpage.do")
	public String startpage() {
		return "startpage";
	}
	
	@RequestMapping("/mainpage.do")
	public String main(Model model) {
		List<NoticeDto> list = noticebiz.NoticemainSelect();
		model.addAttribute("noticelist", list);
		
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

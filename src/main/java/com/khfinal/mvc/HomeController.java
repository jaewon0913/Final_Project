package com.khfinal.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.dosirak.biz.DosirakBiz;
import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.etc.biz.EtcBiz;
import com.khfinal.mvc.free.biz.FreeboardBiz;
import com.khfinal.mvc.free.dto.FreeboardDto;
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
	
	@Autowired
	private DosirakBiz dosirakbiz;
	
	@Autowired
	private FreeboardBiz freeboardbiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/startpage.do")
	public String startpage() {
		return "startpage";
	}
	
	@Autowired
	private EtcBiz etcBiz;
	
	@RequestMapping("/mainpage.do")
	public String main(Model model) {
		List<FreeboardDto> freelist = freeboardbiz.freemainselect();
		model.addAttribute("freelist",freelist);
		
		List<NoticeDto> noticelist = noticebiz.NoticemainSelect();
		model.addAttribute("noticelist", noticelist);
		
		List<DosirakDto> viewslist = dosirakbiz.viewslist();
		model.addAttribute("viewslist", viewslist);
		
		return "MainPage";
	}

	@RequestMapping("/loginMain.do")
	public String loginmain() {
		return "member/LoginMain";
	}
	@RequestMapping("/delivery_place.do")
	public String delivery_place() {
		return "place/DeliveryPlace";
	}
	@RequestMapping("/popup_map.do")
	public String popup_map() {
		return "place/PopupMap";
	}
	@RequestMapping("/nutritiongraph.do")
	public String nutritiongraph() {
		return "graph/Nutritiongraph";
	}
	
	@RequestMapping("/TermsAndConditions.do")
	public String TermsAndConditions() {
		return "member/TermsAndConditions";
	}
	
	@RequestMapping("/search.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) {
		String text = request.getParameter("text");
				
		System.out.println(text);
		
		List<NoticeDto> noticelist = etcBiz.NoticeSelectList(text);
		List<FreeboardDto> freelist = etcBiz.FreeSelectList(text);
		List<DosirakDto> dosiraklist = etcBiz.DosirakSelectList(text);
		
		model.addAttribute("noticelist",noticelist);
		model.addAttribute("freelist",freelist);
		model.addAttribute("dosiraklist",dosiraklist);
		
		return "search/SearchPage";
	}
}

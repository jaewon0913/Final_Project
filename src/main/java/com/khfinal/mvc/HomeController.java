package com.khfinal.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/mainpage.do")
	public String main() {		
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
}

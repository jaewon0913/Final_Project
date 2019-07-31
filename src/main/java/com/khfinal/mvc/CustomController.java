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
public class CustomController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);

	@RequestMapping("/customSikpan.do")
	@ResponseBody
	public Map<String, String> customSikpan(String sikpan) {
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("sikpan", sikpan);
		
		return map;
	}
	
	@RequestMapping("/sikpanChange.do")
	public String sikpanChange(HttpSession session, String count) {
				
		session.setAttribute("count", count);
		
		return "custom/CustomPage";
	}
	
	@RequestMapping("/customdosilak.do")
	public String customdosilak() {
		
		
		return null;
	}
}

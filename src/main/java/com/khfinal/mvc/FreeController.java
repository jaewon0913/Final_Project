package com.khfinal.mvc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.free.biz.FreeboardBiz;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;


@Controller
public class FreeController {
	
	/*
	 * @Autowired private MemberBiz memberbiz;
	 */
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/*
	 * @RequestMapping("/mainpage.do") public String main() { return
	 * "redirect:mainpage.jsp"; }
	 */
	
	@Autowired
	private FreeboardBiz biz;
	
	@RequestMapping("/freeboard_list.do")
	public String selectList(Model model) {
		logger.info("<<<freeBoard_list>>>");
		model.addAttribute("list",biz.selectList());
		return "freeboard/freeboard_list";
	}
	
}

package com.khfinal.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.notice.biz.NoticeBiz;

@Controller
public class NoticeController {
	
	/*
	 * @Autowired private MemberBiz memberbiz;
	 */
	@Autowired
	private NoticeBiz noticebiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/*
	 * @RequestMapping("/mainpage.do") public String main() { return
	 * "redirect:mainpage.jsp"; }
	 */


	@RequestMapping("/notice_list.do")
	public String notice(Model model) {
		System.out.println("notice_list.do 들어옴");
		model.addAttribute("list", noticebiz.NoticeSelectlist());
		return "noticeboard/notice_selectlist";
	}

	@RequestMapping("/insertform.do")
	public String insertform() {
		return "insertform";
	}

	@RequestMapping("/insert.do")
	public String notice_insert() {
		return "notice_insert";
	}

}

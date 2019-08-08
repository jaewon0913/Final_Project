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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.free.biz.FreeboardBiz;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;


@Controller
public class FreeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	private FreeboardBiz biz;
	private MemberBiz memberbiz;
	
	@RequestMapping("/freeboard_list.do")
	public String selectList(Model model) {
		logger.info("<<<freeBoard_list>>>");
		model.addAttribute("freeboard_list",biz.selectList());
		return "freeboard/freeboard_list";
	}

	
	/* 議고쉶�닔媛� �뱾�뼱媛� */
	@RequestMapping("/freeboard_detail.do")
	public String detail(Model model, @RequestParam int free_postnum) {
		logger.info("<<<Detail>>>");
		int res =0;
		System.out.println(free_postnum);
		model.addAttribute("dto", biz.selectOne(free_postnum));			
		res = biz.updateViews(free_postnum);
		if(res>0) {
			System.out.println("�뾽�뜲�씠�듃�맖");
			return "freeboard/freeboard_detail";
		}
		return "freeboard/freeboard_detail";
	}
	
	@RequestMapping("/freeboard_insertform.do")
	public String insertform(){
		return "freeboard/freeboard_insertform";
	}
	
	@RequestMapping("/freeboard_insert.do")
	public String insert(@ModelAttribute FreeboardDto dto) {
		int res = biz.freeboard_insert(dto);
		if(res>0) {
			return "redirect:freeboard_list.do";
		}else {
			return "redirect:freeboard_list.do";
		}
	}
	@RequestMapping("/selectOne.do")
	public String selectOne(@RequestParam int free_postnum, Model model) {
		FreeboardDto dto = biz.selectOne(free_postnum);
		model.addAttribute("dto",dto);
		return"freeboard/freeboard_detail";
		
	}

	@RequestMapping("/freeboard_updateform.do")
	public String updateform(@RequestParam int free_postnum, Model model) {
		
		 FreeboardDto dto = biz.selectOne(free_postnum);
		 model.addAttribute("dto",dto);
		 //model.addAttribute("dto", biz.selectOne(free_postnum)); 
		
		return "freeboard/freeboard_updateform";
	}
	
	@RequestMapping("/freeboard_update.do")
	public String update(@ModelAttribute FreeboardDto dto, Model model, HttpSession session) {
		int res = biz.freeboard_update(dto);
		System.out.println("res : "+res);
		
		return "redirect:freeboard_list.do";
		
//		if(res>0) {
////			MemberDto memberdto = (MemberDto) session.getAttribute("login");
////			MemberDto membetdto_res = memberbiz.login(memberdto.getMember_id(), memberdto.getMember_pw());
////			session.setAttribute("login", membetdto_res);
//			return "redirect:freeboard_list.do";
//		}else {
//			return "redirect:freeboard_list.do";
//		}
		
	}
	
	@RequestMapping("/freeboard_delete.do")
	public String delete(@RequestParam int free_postnum) {
		int res = biz.freeboard_delete(free_postnum);
		//biz.freeboard_delete(free_postnum);
		if(res>0) {
			return "redirect:freeboard_list.do";
		}else {			
		return "redirect:freeboard_list.do";
	}	
		//return "redirect:freeboard_list.do";
		
	}
	
	@RequestMapping("/freeboard_muldel.do")
	//public String freeboard_muldel(String[] free_chk) {
	public String freeboard_muldel(Integer[] free_chk) {
		int res = biz.freeboard_muldel(free_chk);
		if(res>0) {
			return "redirect:freeboard_list.do";
		}else {
			return "redirect:freeboard_list.do";
		}
	}


	
	
}

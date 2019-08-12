package com.khfinal.mvc;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.dosirak.biz.DosirakBiz;
import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.member.dto.MemberDto;


@Controller
public class DosirakController {

	@Autowired
	private DosirakBiz dosirakbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(DosirakController.class);

	
	@RequestMapping("/dosiraktest.do")
	public String dosiraktest(Model model) {
		DosirakDto dosirakdto = dosirakbiz.selectOne(1);
		model.addAttribute("dosirakdto", dosirakdto);
		
		return "payment/dosiraktest";
	}
	
	@RequestMapping("/kakaopay.do")
	public String kakaopay(DosirakDto dto, Model model,HttpSession session) {
		
		MemberDto memberdto = (MemberDto)session.getAttribute("logindto");
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberdto",memberdto);
		return "payment/kakaopay";
	}
	
}

	


package com.khfinal.mvc;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.boxorder.biz.BoxorderBiz;
import com.khfinal.mvc.boxorder.dto.BoxorderDto;
import com.khfinal.mvc.dosirak.biz.DosirakBiz;
import com.khfinal.mvc.dosirak.dto.DosirakDto;


@Controller
public class BoxorderController {

	@Autowired
	private DosirakBiz dosirakbiz;
	
	@Autowired
	private BoxorderBiz boxorderbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(BoxorderController.class);

	
	@RequestMapping("/dosirakorderinsert.do")
	public String dosirakorderinsert(Model model,BoxorderDto boxorderdto) {
		
		
		System.out.println(boxorderdto.getDosirak_delivery()+" "+boxorderdto.getOrdernumber());
		int res = boxorderbiz.dosirakinsert(boxorderdto);
		
		BoxorderDto dto = boxorderbiz.selectOne(boxorderdto.getMember_id(), boxorderdto.getOrdernumber());
		model.addAttribute("dto", dto);
		//
		//insert
		//selectone
		//결제완료페이지
		return "payment/orderresult";
	}
	
	@RequestMapping("/qrcode.do")
	public String qrcoderesult(Model model,HttpServletRequest request) {
		String member_id = request.getParameter("member_id");
		String ordernumber = request.getParameter("ordernumber");
		System.out.println(member_id+" "+ordernumber);
		BoxorderDto dto = boxorderbiz.selectOne(member_id, ordernumber);
		model.addAttribute("dto", dto);
		System.out.println(dto.getDosirak_delivery());		
		return "payment/qrcoderesult";
	}
	
	@RequestMapping("/receive.do")
	public String receive(BoxorderDto dto,Model model) {
		System.out.println("receive 들어옴");
		int res = boxorderbiz.receiveUpdate(dto);
		
		BoxorderDto resultdto = boxorderbiz.selectOne(dto.getMember_id(),dto.getOrdernumber());
		model.addAttribute("dto", resultdto);
		
		return "payment/receiveresult";
	}
	
	@RequestMapping("/qrcodeSelect.do")
	public String qrcodeSelect(Model model,Principal auth) {
		List<BoxorderDto> list = boxorderbiz.qrcodeSelect(auth.getName());
		model.addAttribute("list", list);
		
		return "member/qrcodeSelect";
	}
}

	


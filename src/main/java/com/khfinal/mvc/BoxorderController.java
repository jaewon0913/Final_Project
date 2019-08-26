package com.khfinal.mvc;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.boxorder.biz.BoxorderBiz;
import com.khfinal.mvc.boxorder.dto.BoxorderDto;
import com.khfinal.mvc.dosirak.biz.DosirakBiz;


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
		boxorderdto.setDish1("없음");
		boxorderdto.setDish2("없음");
		boxorderdto.setDish3("없음");
		boxorderdto.setDish4("없음");
		boxorderdto.setDish5("없음");
		boxorderdto.setDish6("없음");
		boxorderdto.setDish7("없음");
		boxorderdto.setCustom_status("N");
		int res = boxorderbiz.dosirakinsert(boxorderdto);
				
		return "redirect:orderresult.do?member_id="+boxorderdto.getMember_id()+"&ordernumber="+boxorderdto.getOrdernumber();
	}
	@RequestMapping("/orderresult.do")
	public String orderresult(Model model,String member_id,String ordernumber) {
		BoxorderDto dto = boxorderbiz.selectOne(member_id,ordernumber);
		model.addAttribute("dto", dto);
		
		return "payment/orderresult";
	}
	
	@RequestMapping("/qrcode.do")
	public String qrcoderesult(Model model,HttpServletRequest request) {
		System.out.println("!!#!@#!@#!@#!@#qrcode.do 들어옴~!!!!!");
		String member_id = request.getParameter("member_id");
		String ordernumber = request.getParameter("ordernumber");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!"+member_id+" "+ordernumber);
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
	
	@RequestMapping("/graph.do")
	@ResponseBody
	public Map<String, List<BoxorderDto>> graph(Model model,Principal auth) {
		Map<String, List<BoxorderDto>> map = new HashMap<String, List<BoxorderDto>>();
		
		System.out.println("1" + auth);
		System.out.println("2" + boxorderbiz );
		
		
		List<BoxorderDto> list = boxorderbiz.graphSelectList(auth.getName());
		//7번돌려
		
		map.put("list", list);
		
		return map;
	}
}

	


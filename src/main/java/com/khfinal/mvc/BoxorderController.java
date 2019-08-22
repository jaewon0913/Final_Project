package com.khfinal.mvc;

import java.lang.reflect.Field;
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
import com.khfinal.mvc.etc.util.CustomOrderDto;


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
		
//		BoxorderDto dto = boxorderbiz.selectOne(boxorderdto.getMember_id(), boxorderdto.getOrdernumber());
//		model.addAttribute("dto", dto);
		
		return "redirect:orderresult.do?member_id="+boxorderdto.getMember_id()+"&ordernumber="+boxorderdto.getOrdernumber();
	}
	
	@RequestMapping("/dosirakorderinsert_custom.do")
	public String dosirakorderinsert_custom(Model model,BoxorderDto boxorderdto, CustomOrderDto customdto) {
		
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		try{
	        Object obj=boxorderdto;
	        for (Field field : obj.getClass().getDeclaredFields()){
	            field.setAccessible(true);
	            Object value=field.get(obj);
	            System.out.println(field.getName()+","+value);
	        }
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		
		int res = boxorderbiz.dosirakinsert(boxorderdto);
		
		System.out.println("요까지도 온건가???");

		
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
		
		List<BoxorderDto> list = boxorderbiz.graphSelectList(auth.getName());
		map.put("list", list);
		
		return map;
	}
}

	


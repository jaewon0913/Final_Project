package com.khfinal.mvc;

import java.lang.reflect.Field;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.boxorder.biz.BoxorderBiz;
import com.khfinal.mvc.boxorder.dto.BoxorderDto;
import com.khfinal.mvc.etc.util.CustomOrderDto;
import com.khfinal.mvc.member.dto.MemberDto;


@Controller
public class BoxorderController {
	
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
	
	@RequestMapping("/dosirakorderinsert_custom.do")
	public String dosirakorderinsert_custom(Model model,BoxorderDto boxorderdto, CustomOrderDto customdto) {
		
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
		
		return "payment/OrderResult";
	}
	
	@RequestMapping("/qrcode.do")
	public String qrcoderesult(Model model,HttpServletRequest request) {
		String member_id = request.getParameter("member_id");
		String ordernumber = request.getParameter("ordernumber");
		BoxorderDto dto = boxorderbiz.selectOne(member_id, ordernumber);
		model.addAttribute("dto", dto);
		return "payment/QrcodeResult";
	}
	
	@RequestMapping("/receive.do")
	public String receive(BoxorderDto dto,Model model) {
		int res = boxorderbiz.receiveUpdate(dto);
		
		BoxorderDto resultdto = boxorderbiz.selectOne(dto.getMember_id(),dto.getOrdernumber());
		model.addAttribute("dto", resultdto);
		
		return "payment/ReceiveResult";
	}
	
	@RequestMapping("/qrcodeSelect.do")
	public String qrcodeSelect(Model model,Principal auth) {
		List<BoxorderDto> list = boxorderbiz.qrcodeSelect(auth.getName());
		model.addAttribute("list", list);
		
		return "member/QrcodeSelect";
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
	
	@RequestMapping("/orderresultpage.do")
	public String orderresult(Model model,HttpSession session) {
		MemberDto logindto = (MemberDto) session.getAttribute("logindto");
		System.out.println(logindto.getMember_id());
		List<BoxorderDto> list = boxorderbiz.orderresult(logindto.getMember_id());
		
		model.addAttribute("list", list);
		model.addAttribute("member_id",logindto.getMember_id());
		
		return "member/orderresult";
	}
	
	@RequestMapping("/todayorderresult.do")
	public String todayorderresult(Model model,String member_id) {
		System.out.println("todayorderresult들어옴");
		List<BoxorderDto> list = boxorderbiz.todayorderresult(member_id);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("member_id", member_id);
		
		return "member/todayorderresult";
	}
	@RequestMapping("/weekorderresult.do")
	public String weekorderresult(Model model,String member_id) {
		List<BoxorderDto> list = boxorderbiz.weekorderresult(member_id);
		model.addAttribute("list", list);
		model.addAttribute("member_id", member_id);
		
		return "member/weekorderresult";
	}
	@RequestMapping("/monthorderresult.do")
	public String monthorderresult(Model model,String member_id) {
		List<BoxorderDto> list = boxorderbiz.monthorderresult(member_id);
		model.addAttribute("list", list);
		model.addAttribute("member_id", member_id);
		
		
		return "member/monthorderresult";
	}
}

	


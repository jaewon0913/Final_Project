package com.khfinal.mvc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.etc.util.CookieDto;
import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.member.dto.MemberDto;

@Controller
public class CustomController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
	@RequestMapping("/custom.do")
	public String custom(Model model) {		
		return "custom/CustomPage";
	}
	
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
	
	@RequestMapping("/createCookie.do")
	@ResponseBody
	public Map<String, String> cookie(HttpServletResponse response, CookieDto dto) {
		Cookie setCookie_name = new Cookie("cookieName", "커스텀도시락");
		
		Cookie setCookie_tan = new Cookie("cookieTan", dto.getTan());
		Cookie setCookie_dan = new Cookie("cookieDan", dto.getDan());
		Cookie setCookie_zi = new Cookie("cookieZi", dto.getZi());
		Cookie setCookie_cal = new Cookie("cookieCal", dto.getCal());
		Cookie setCookie_price = new Cookie("cookiePrice", dto.getPrice());
		Cookie setCookie_count = new Cookie("cookieCount", dto.getCount());
		
		setCookie_name.setMaxAge(60*60*24);
		setCookie_tan.setMaxAge(60*60*24);
		setCookie_dan.setMaxAge(60*60*24);
		setCookie_zi.setMaxAge(60*60*24);
		setCookie_cal.setMaxAge(60*60*24);
		setCookie_price.setMaxAge(60*60*24);
		setCookie_count.setMaxAge(60*60*24);
		
		response.addCookie(setCookie_name);
		response.addCookie(setCookie_tan);
		response.addCookie(setCookie_dan);
		response.addCookie(setCookie_zi);
		response.addCookie(setCookie_cal);
		response.addCookie(setCookie_price);
		response.addCookie(setCookie_count);
		
		if(dto.getCount().equals("4")) {
			Cookie setCookie_dish1 = new Cookie("cookieDish1", dto.getDish1());
			Cookie setCookie_dish2 = new Cookie("cookieDish2", dto.getDish2());
			Cookie setCookie_dish3 = new Cookie("cookieDish3", dto.getDish3());
			Cookie setCookie_dish4 = new Cookie("cookieDish4", dto.getDish4());
			Cookie setCookie_dish5 = new Cookie("cookieDish5", dto.getDish5());
			
			setCookie_dish1.setMaxAge(60*60*24);
			setCookie_dish2.setMaxAge(60*60*24);
			setCookie_dish3.setMaxAge(60*60*24);
			setCookie_dish4.setMaxAge(60*60*24);
			setCookie_dish5.setMaxAge(60*60*24);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			
		 } else if(dto.getCount().equals("5")){
			Cookie setCookie_dish1 = new Cookie("cookieDish1", dto.getDish1());
			Cookie setCookie_dish2 = new Cookie("cookieDish2", dto.getDish2());
			Cookie setCookie_dish3 = new Cookie("cookieDish3", dto.getDish3());
			Cookie setCookie_dish4 = new Cookie("cookieDish4", dto.getDish4());
			Cookie setCookie_dish5 = new Cookie("cookieDish5", dto.getDish5());
			Cookie setCookie_dish6 = new Cookie("cookieDish6", dto.getDish6());
			
			setCookie_dish1.setMaxAge(60);
			setCookie_dish2.setMaxAge(60);
			setCookie_dish3.setMaxAge(60);
			setCookie_dish4.setMaxAge(60);
			setCookie_dish5.setMaxAge(60);
			setCookie_dish6.setMaxAge(60);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			response.addCookie(setCookie_dish6);
		 } else {
			Cookie setCookie_dish1 = new Cookie("cookieDish1", dto.getDish1());
			Cookie setCookie_dish2 = new Cookie("cookieDish2", dto.getDish2());
			Cookie setCookie_dish3 = new Cookie("cookieDish3", dto.getDish3());
			Cookie setCookie_dish4 = new Cookie("cookieDish4", dto.getDish4());
			Cookie setCookie_dish5 = new Cookie("cookieDish5", dto.getDish5());
			Cookie setCookie_dish6 = new Cookie("cookieDish5", dto.getDish6());
			Cookie setCookie_dish7 = new Cookie("cookieDish5", dto.getDish7());
			
			setCookie_dish1.setMaxAge(60);
			setCookie_dish2.setMaxAge(60);
			setCookie_dish3.setMaxAge(60);
			setCookie_dish4.setMaxAge(60);
			setCookie_dish5.setMaxAge(60);
			setCookie_dish6.setMaxAge(60);
			setCookie_dish7.setMaxAge(60);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			response.addCookie(setCookie_dish6);
			response.addCookie(setCookie_dish7);
		 }
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "success");
		
		return map;
	}
	
	@RequestMapping("/getCookie.do")
	public String getCookie(Model model, HttpSession session, HttpServletRequest request, CookieDto dto) {
		// 쿠키값 가져오기
	    Cookie[] cookies = request.getCookies() ;
		String count = null;
		String[] cName = new String[cookies.length];
		String[] cValue = new String[cookies.length];
		
	    if(cookies != null){ 
	        for(int i=0; i < cookies.length; i++){
	            Cookie c = cookies[i] ;
	            // 저장된 쿠키 이름을 가져온다
	            cName[i] = c.getName();
	            // 쿠키값을 가져온다
	          	cValue[i] = c.getValue() ;  
	          	if(c.getName().equals("cookieCount")) {
	          		count = c.getValue();
	          		dto.setCount(count);
	          	}
	          	System.out.println("이름 : " + cName[i] + " / 값 : " + cValue[i] + "/ i : " + i );
	        }
	    }
	    
	    dto.setTan(cValue[2]);
	    dto.setDan(cValue[3]);
	    dto.setZi(cValue[4]);
	    dto.setCal(cValue[5]);
	    dto.setPrice(cValue[6]);
	   
	    if(dto.getCount().equals("4")) {
	    		dto.setDish1(cValue[12]);
	    		dto.setDish2(cValue[11]);
	    		dto.setDish3(cValue[10]);
	    		dto.setDish4(cValue[9]);
	    		dto.setDish5(cValue[8]);
	    } else if (count == "5") {
	    		dto.setDish1(cValue[13]);
		    	dto.setDish2(cValue[12]);
	    		dto.setDish3(cValue[11]);
	    		dto.setDish4(cValue[10]);
	    		dto.setDish5(cValue[9]);
	    		dto.setDish6(cValue[8]);
	    } else if (count == "6") {
		    	dto.setDish1(cValue[14]);
		    	dto.setDish2(cValue[13]);
	    		dto.setDish3(cValue[12]);
	    		dto.setDish4(cValue[11]);
	    		dto.setDish5(cValue[10]);
	    		dto.setDish6(cValue[9]);
	    		dto.setDish7(cValue[8]);
	    }
	    
	    System.out.println(count);
	    System.out.println(dto.getCount());
	    
	    System.out.println(dto.getDish1());
	    System.out.println(dto.getDish2());
		
	    model.addAttribute("cookiedto", dto);
		return "member/MemberBasket";
	}
}

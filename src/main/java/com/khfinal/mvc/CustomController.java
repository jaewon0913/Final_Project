package com.khfinal.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.etc.util.CookieDto;

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
		
		setCookie_name.setMaxAge(60*3);
		setCookie_tan.setMaxAge(60*3);
		setCookie_dan.setMaxAge(60*3);
		setCookie_zi.setMaxAge(60*3);
		setCookie_cal.setMaxAge(60*3);
		setCookie_price.setMaxAge(60*3);
		setCookie_count.setMaxAge(60*3);
		
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
			
			Cookie setCookie_src1 = new Cookie("cookieSrc1", dto.getSrc1());
			Cookie setCookie_src2 = new Cookie("cookieSrc2", dto.getSrc2());
			Cookie setCookie_src3 = new Cookie("cookieSrc3", dto.getSrc3());
			Cookie setCookie_src4 = new Cookie("cookieSrc4", dto.getSrc4());
			Cookie setCookie_src5 = new Cookie("cookieSrc5", dto.getSrc5());
			
			setCookie_dish1.setMaxAge(60*3);
			setCookie_dish2.setMaxAge(60*3);
			setCookie_dish3.setMaxAge(60*3);
			setCookie_dish4.setMaxAge(60*3);
			setCookie_dish5.setMaxAge(60*3);
			
			setCookie_src1.setMaxAge(60*3);
			setCookie_src2.setMaxAge(60*3);
			setCookie_src3.setMaxAge(60*3);
			setCookie_src4.setMaxAge(60*3);
			setCookie_src5.setMaxAge(60*3);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			
			response.addCookie(setCookie_src1);
			response.addCookie(setCookie_src2);
			response.addCookie(setCookie_src3);
			response.addCookie(setCookie_src4);
			response.addCookie(setCookie_src5);

		 } else if(dto.getCount().equals("5")){
			Cookie setCookie_dish1 = new Cookie("cookieDish1", dto.getDish1());
			Cookie setCookie_dish2 = new Cookie("cookieDish2", dto.getDish2());
			Cookie setCookie_dish3 = new Cookie("cookieDish3", dto.getDish3());
			Cookie setCookie_dish4 = new Cookie("cookieDish4", dto.getDish4());
			Cookie setCookie_dish5 = new Cookie("cookieDish5", dto.getDish5());
			Cookie setCookie_dish6 = new Cookie("cookieDish6", dto.getDish6());
			
			Cookie setCookie_src1 = new Cookie("cookieSrc1", dto.getSrc1());
			Cookie setCookie_src2 = new Cookie("cookieSrc2", dto.getSrc2());
			Cookie setCookie_src3 = new Cookie("cookieSrc3", dto.getSrc3());
			Cookie setCookie_src4 = new Cookie("cookieSrc4", dto.getSrc4());
			Cookie setCookie_src5 = new Cookie("cookieSrc5", dto.getSrc5());
			Cookie setCookie_src6 = new Cookie("cookieSrc6", dto.getSrc6());
			
			setCookie_dish1.setMaxAge(60);
			setCookie_dish2.setMaxAge(60);
			setCookie_dish3.setMaxAge(60);
			setCookie_dish4.setMaxAge(60);
			setCookie_dish5.setMaxAge(60);
			setCookie_dish6.setMaxAge(60);
			
			setCookie_src1.setMaxAge(60);
			setCookie_src2.setMaxAge(60);
			setCookie_src3.setMaxAge(60);
			setCookie_src4.setMaxAge(60);
			setCookie_src5.setMaxAge(60);
			setCookie_src6.setMaxAge(60);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			response.addCookie(setCookie_dish6);
			
			response.addCookie(setCookie_src1);
			response.addCookie(setCookie_src2);
			response.addCookie(setCookie_src3);
			response.addCookie(setCookie_src4);
			response.addCookie(setCookie_src5);
			response.addCookie(setCookie_src6);

		 } else {
			Cookie setCookie_dish1 = new Cookie("cookieDish1", dto.getDish1());
			Cookie setCookie_dish2 = new Cookie("cookieDish2", dto.getDish2());
			Cookie setCookie_dish3 = new Cookie("cookieDish3", dto.getDish3());
			Cookie setCookie_dish4 = new Cookie("cookieDish4", dto.getDish4());
			Cookie setCookie_dish5 = new Cookie("cookieDish5", dto.getDish5());
			Cookie setCookie_dish6 = new Cookie("cookieDish6", dto.getDish6());
			Cookie setCookie_dish7 = new Cookie("cookieDish7", dto.getDish7());
			
			Cookie setCookie_src1 = new Cookie("cookieSrc1", dto.getSrc1());
			Cookie setCookie_src2 = new Cookie("cookieSrc2", dto.getSrc2());
			Cookie setCookie_src3 = new Cookie("cookieSrc3", dto.getSrc3());
			Cookie setCookie_src4 = new Cookie("cookieSrc4", dto.getSrc4());
			Cookie setCookie_src5 = new Cookie("cookieSrc5", dto.getSrc5());
			Cookie setCookie_src6 = new Cookie("cookieSrc6", dto.getSrc6());
			Cookie setCookie_src7 = new Cookie("cookieSrc7", dto.getSrc7());
			
			setCookie_dish1.setMaxAge(60);
			setCookie_dish2.setMaxAge(60);
			setCookie_dish3.setMaxAge(60);
			setCookie_dish4.setMaxAge(60);
			setCookie_dish5.setMaxAge(60);
			setCookie_dish6.setMaxAge(60);
			setCookie_dish7.setMaxAge(60);
			
			setCookie_src1.setMaxAge(60);
			setCookie_src2.setMaxAge(60);
			setCookie_src3.setMaxAge(60);
			setCookie_src4.setMaxAge(60);
			setCookie_src5.setMaxAge(60);
			setCookie_src6.setMaxAge(60);
			setCookie_src7.setMaxAge(60);
			
			response.addCookie(setCookie_dish1);
			response.addCookie(setCookie_dish2);
			response.addCookie(setCookie_dish3);
			response.addCookie(setCookie_dish4);
			response.addCookie(setCookie_dish5);
			response.addCookie(setCookie_dish6);
			response.addCookie(setCookie_dish7);
			
			response.addCookie(setCookie_src1);
			response.addCookie(setCookie_src2);
			response.addCookie(setCookie_src3);
			response.addCookie(setCookie_src4);
			response.addCookie(setCookie_src5);
			response.addCookie(setCookie_src6);
			response.addCookie(setCookie_src7);
		 }
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "success");
		
		return map;
	}
	
	@RequestMapping("/getCookie.do")
	public String getCookie(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, CookieDto dto) {
		// 쿠키값 가져오기
		try {
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
		    		
		    		dto.setSrc1(cValue[13]);
		    		dto.setSrc2(cValue[14]);
		    		dto.setSrc3(cValue[15]);
		    		dto.setSrc4(cValue[16]);
		    		dto.setSrc5(cValue[17]);
		    } else if (dto.getCount().equals("5")) {
		    		dto.setDish1(cValue[13]);
			    	dto.setDish2(cValue[12]);
		    		dto.setDish3(cValue[11]);
		    		dto.setDish4(cValue[10]);
		    		dto.setDish5(cValue[9]);
		    		dto.setDish6(cValue[8]);
		    		
		    		dto.setSrc1(cValue[14]);
		    		dto.setSrc2(cValue[15]);
		    		dto.setSrc3(cValue[16]);
		    		dto.setSrc4(cValue[17]);
		    		dto.setSrc5(cValue[18]);
		    		dto.setSrc6(cValue[19]);
		    } else if (dto.getCount().equals("6")) {
			    	dto.setDish1(cValue[14]);
			    	dto.setDish2(cValue[13]);
		    		dto.setDish3(cValue[12]);
		    		dto.setDish4(cValue[11]);
		    		dto.setDish5(cValue[10]);
		    		dto.setDish6(cValue[9]);
		    		dto.setDish7(cValue[8]);
		    		
		    		dto.setSrc1(cValue[15]);
		    		dto.setSrc2(cValue[16]);
		    		dto.setSrc3(cValue[17]);
		    		dto.setSrc4(cValue[18]);
		    		dto.setSrc5(cValue[19]);
		    		dto.setSrc6(cValue[20]);
		    		dto.setSrc7(cValue[21]);
		    }
			
		    model.addAttribute("cookiedto", dto);
			return "member/MemberBasket";
		} catch (Exception e) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out;

			try {
				out = response.getWriter();
				out.println("<script>"
						+ "alert('장바구니가 비어있습니다.');"
						+ "location.href = 'mypage.do';</script>");
				 
				out.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			return "error/ErrorPage";
		}
	}
}

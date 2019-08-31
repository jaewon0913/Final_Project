package com.khfinal.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	/**
	 *  아래의 코드 기준으로는 시큐리티가 적용되어서 세션의 값을 User를 이용해 불러오게 된다. 즉, 웹 소켓에서 사용하는 세션의 값은 User의 값가 동일하다.
	 *  스프링환경에서는 시큐리티를 통한 세션 관리를 권장한다.
	 */
	@RequestMapping("mvc/echo")
	public ModelAndView chat(ModelAndView mv) {
		System.out.println("실행");
		//	
		mv.setViewName("chat");
		
		//	사용자 정보 출력(세션)
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("user name : " + user.getUsername());
		System.out.println("normal chat page");
		
		mv.addObject("userid", user.getUsername());
		
		return mv;
	}
}

package com.khfinal.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/common/errorpage")
public class ErrorController {
	
	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping("/error.do")
	public String errorPage() {
		return "error/errorPage";
	}
}

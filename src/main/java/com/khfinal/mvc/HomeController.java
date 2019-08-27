package com.khfinal.mvc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.etc.biz.EtcBiz;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.notice.dto.NoticeDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private EtcBiz etcBiz;
	
	@RequestMapping("/mainpage.do")
	public String main() {		
		return "MainPage";
	}

	@RequestMapping("/loginMain.do")
	public String loginmain() {
		return "member/LoginMain";
	}
	@RequestMapping("/delivery_place.do")
	public String delivery_place() {
		return "place/DeliveryPlace";
	}
	@RequestMapping("/popup_map.do")
	public String popup_map() {
		return "place/PopupMap";
	}
	@RequestMapping("/nutritiongraph.do")
	public String nutritiongraph() {
		return "graph/Nutritiongraph";
	}
	
	
	@RequestMapping("/testpage.do")
	public String test() {
		
		try {
			System.out.println("크롤링테스트중");
			URL url = new URL("https://www.instagram.com/explore/tags/도시락/");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			BufferedReader br = new BufferedReader (new InputStreamReader(con.getInputStream()));
			
			String temp;
			System.out.println("여기까진 오고");
			while ((temp = br.readLine()) != null) {
				//System.out.println(temp);
				
				if(temp.contains("display_url")){
					System.out.println(temp);
					System.out.println("야호야호");
				}
			}
			con.disconnect();
			br.close();
			System.out.println("여기까지는 왓는가?");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "testpage";
	}
	
	@RequestMapping("/search.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) {
		String text = request.getParameter("text");
				
		List<NoticeDto> noticelist = etcBiz.NoticeSelectList(text);
		List<FreeboardDto> freelist = etcBiz.FreeSelectList(text);
		List<DosirakDto> dosiraklist = etcBiz.DosirakSelectList(text);
		
		model.addAttribute("noticelist",noticelist);
		model.addAttribute("freelist",freelist);
		model.addAttribute("dosiraklist",dosiraklist);
		
		return "search/SearchPage";
	}
}

package com.khfinal.mvc;

import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.mvc.member.biz.MemberBiz;
import com.khfinal.mvc.notice.biz.NoticeBiz;
import com.khfinal.mvc.notice.dto.NoticeDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MemberBiz memberbiz;
	
	@Autowired
	private NoticeBiz noticebiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/startpage.do")
	public String startpage() {
		return "startpage";
	}
	
	@RequestMapping("/mainpage.do")
	public String main(Model model) {
		List<NoticeDto> list = noticebiz.NoticemainSelect();
		model.addAttribute("noticelist", list);
		
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
	
	@RequestMapping("/TermsAndConditions.do")
	public String TermsAndConditions() {
		return "member/TermsAndConditions";
	
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
}

package com.khfinal.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khfinal.mvc.dosirak.biz.DosirakBiz;
import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.member.dto.MemberDto;
import com.khfinal.mvc.paging.Paging;

@Controller
public class DosirakController {
	
	@Autowired
	private DosirakBiz dosirakbiz;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/dosiraktest.do")
	public String dosiraktest(Model model) {
		DosirakDto dosirakdto = dosirakbiz.selecttest(1);
		model.addAttribute("dosirakdto", dosirakdto);
		
		return "payment/dosiraktest";
	}
	
	@RequestMapping("/kakaopay.do")
	public String kakaopay(DosirakDto dto, Model model,HttpSession session) {
		System.out.println("kakaopay들어옴");
		MemberDto memberdto = (MemberDto)session.getAttribute("logindto");
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberdto",memberdto);
		return "payment/kakaopay";
	}
	

	@RequestMapping("/dosirak_list.do")
	public String dosiraklist(Model model) {
		model.addAttribute("list",dosirakbiz.selectList());
		return "dosirak/dosirak_list";
	}
	
	@RequestMapping("/dosirak_listpagig.do")
	public String dosiraklistpaging(Model model, String txt_search, String page) {
		
		String txt_s = txt_search;
	      
	         // 페이징하기
	         int totalCount = dosirakbiz.totalcount(txt_s);
	         int pag = (page == null) ? 1 : Integer.parseInt(page);

	         Paging paging = new Paging();
	         
	         paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
	         paging.setPageSize(9); // 한페이지에 불러낼 게시물의 개수 지정
	         paging.setTotalCount(totalCount);
	         pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

	         List<DosirakDto> list = dosirakbiz.selectListPaging(pag, paging.getPageSize(), txt_s);
	         model.addAttribute("list", list);
	         model.addAttribute("paging", paging);
	         model.addAttribute("txt_search", txt_s);
	         
	         return "dosirak/dosirak_list";
	         
	}
	
	@RequestMapping("/dosirak_selectone.do")
	public String dosirakselectOne(Model model, @RequestParam int dosirak_postnum) {
		System.out.println(dosirak_postnum + "도시락번호12313123");
		
		DosirakDto dosirakdto = dosirakbiz.selectOne(dosirak_postnum);
		model.addAttribute("dosirakdto", dosirakdto);
		return "dosirak/dosirak_selectone";
	}
	
	@RequestMapping("/dosirak_insertform.do")
	public String dosirak_insertform() {
		return "dosirak/dosirak_insert";
	}
	
	@RequestMapping("/dosirak_insert.do")
	public String dosirak_insert(Model model, DosirakDto dto) {
		int res = dosirakbiz.insert(dto);
		
		if(res > 0) {
			return "redirect:dosirak_listpagig.do";
		} else {
			return "error/ErrorPage";
		}
	}
	
	@RequestMapping("/dosirak_cart")
	public String dosirakcart() {

		return null;
	}
}

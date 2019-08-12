package com.khfinal.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khfinal.mvc.notice.biz.NoticeBiz;
import com.khfinal.mvc.notice.dao.NoticeDao;
import com.khfinal.mvc.notice.dto.NoticeDto;

@Controller
public class NoticeController {

	/*
	 * @Autowired private MemberBiz memberbiz;
	 */
	@Autowired
	private NoticeBiz noticebiz;
	
	@Autowired
	private NoticeDao noticedao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*
	 * @RequestMapping("/mainpage.do") public String main() { return
	 * "redirect:mainpage.jsp"; }
	 */
	
	//게시판 목록
	@RequestMapping("/notice_list.do")
	public String noticeselectlist(Model model,HttpServletRequest request) {
		
		
		System.out.println("notice_list.do 들어옴");
		model.addAttribute("list", noticebiz.NoticeSelectlist());
		
		
		return "noticeboard/notice_selectlist";
	}
	
	
	//게시판 상세보기
	@RequestMapping("/notice_detail.do")
	public String noticeSelectone(Model model,  @RequestParam int notice_postnum) {
		int res;
		
		model.addAttribute("NoticeDto", noticebiz.NoticeSelectOne(notice_postnum));
		res = noticebiz.NoticeViews(notice_postnum);
		
		if(res>0) {
			return "noticeboard/notice_selectone";
		}
		return "noticeboard/notice_selectone";
	}
	
	//게시판 등록폼
	@RequestMapping("/notice_insertform.do")
	public String insertform() {
		logger.info("<<<noticeinsertform>>>");
		return "noticeboard/notice_insert";
	}
	
	//게시판 등록
	@RequestMapping("/notice_insert.do")
	public String notice_insert(Model model,NoticeDto dto) {
		logger.info("<<<noticeinsert>>>");
		System.out.println("notice_insert.do 들어옴");
		
		model.addAttribute("NoticeDto", noticebiz.NoticeInsert(dto));
		
		
		return "redirect:notice_list.do";
	}
	
	//게시판 수정폼
	@RequestMapping("/notice_updateform.do")
	public String updateform(Model model, @RequestParam int notice_postnum) {
		System.out.println("notice_updateform.do 들어옴");
		
		model.addAttribute("NoticeDto", noticebiz.NoticeSelectOne(notice_postnum));
		
		return "noticeboard/notice_update";
	}
	
	//게시판수정
	@RequestMapping("/notice_update.do")
	public String noticeupdate(NoticeDto dto) {
		System.out.println(dto.getNotice_postnum());

		dto.setNotice_title(dto.getNotice_title());
		dto.setNotice_content(dto.getNotice_content());
		dto.setNotice_postnum(dto.getNotice_postnum());
		
		int res = 0;
		res = noticebiz.NoticeUpdate(dto);
		System.out.println(res);
		if(res>0) {
			return "redirect:notice_detail.do?notice_postnum="+dto.getNotice_postnum();
		}else {
			return "redirect:notice_updateform.do?notice_postnum="+dto.getNotice_postnum();
		}
		
	}
	
	//게시판 삭제
	@RequestMapping("/notice_delete.do")
	public String noticedelete(@RequestParam int notice_postnum) {
		System.out.println("삭제 : "+notice_postnum);
		int res = 0;
		res = noticebiz.NoticeDelete(notice_postnum);
		
		if(res > 0) {
			return "redirect:notice_list.do";
		}else {
			return "redirect:notice_detail.do?notice_postnum="+notice_postnum;
		}
		
		
		
	}
	
	//카카오페이 테스트
	@RequestMapping("/testpay.do")
	public String testpay() {
		return "testpay";
	}
	
	//페이징
	
	
	
}

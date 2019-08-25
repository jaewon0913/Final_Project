package com.khfinal.mvc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.event.biz.EventboardBiz;
import com.khfinal.mvc.event.dto.EventboardDto;
import com.khfinal.mvc.member.dto.MemberDto;

public class EventController {

	@Controller
	public static class eventController {

		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

		@Autowired
		private EventboardBiz biz;

		@RequestMapping("/eventboard_list.do")
		public String selectList(@RequestParam Map<String, Object> paramMap, Model model) {

			// 1.게시판 리스트를 가져온다.
			// 2.게시판 리스트의 페이징을 가져온다.
			// 기존엔 리스트만 가져온후 바로 전달했지만 이번엔 리스트와 페이징을 둘다 전달 해야해요
			// 전달 하고자 하는건 모델이 담으면 되네요
			// 기존 소스가 너무 간단해서 이해를 못하고 있었나보네요
			// 보통 방식으로 합니다.
			logger.info("<<<eventBoard_list>>>");

			// String txt_search = request.getParameter("txt_search");
			String txt_search = (String) paramMap.get("txt_search");
			int page = (paramMap.get("page") != null ? Integer.parseInt(paramMap.get("page").toString()) : 1);

			Paging paging = biz.getTotalCount(txt_search, page); // 게시판 리스트의 갯수를 가져온다.
			paging.setPageSize(5); // 페이징 사이즈를 결정한다.
			model.addAttribute("eventboard_list", paging); // 게시판 리스트를 전달하기 위해 모델에 담는다.

			List<EventboardDto> list = biz.selectListPaging(paging, txt_search); // 게시판 리스트를 가져온다.
			model.addAttribute("eventboard_list", list); // 게시판 리스트를 전달하기 위해 모델에 담는다.

			model.addAttribute("paging", paging);
			model.addAttribute("txt_search", txt_search);

			// 모델은 컨트롤러가 자동으로 view (jsp)에 전다해준다. 이게 스프링이 하는 역할임

			// model.addAttribute("eventboard_list",biz.selectList());

			return "eventboard/EventboardList"; // 이동할 jsp 파일명
		}

		/* 이벤트 상세 */
		@RequestMapping("/eventboard_detail.do")
		public String detail(Model model, @RequestParam int event_postnum) {
			logger.info("<<<Detail>>>");
			int res = 0;
			System.out.println(event_postnum);
			model.addAttribute("dto", biz.event_selectOne(event_postnum));

			res = biz.evupdateViews(event_postnum);
			if (res > 0) {
				System.out.println("이베트 카운드 업데이트");
				return "eventboard/eventboard_detail";
			}
			return "eventboard/EventboardDetail";
		}

		@RequestMapping("/eventboard_insertform.do")
		public String insertform(Model model, HttpSession session) {
			MemberDto logindto = (MemberDto) session.getAttribute("logindto");
			model.addAttribute("logindto", logindto);

			return "eventboard/EventboardInsertForm";
		}

		@RequestMapping("/eventboard_insert.do")
		public String insert(@ModelAttribute EventboardDto dto) {
			System.out.println(dto.getevent_content());
			int res = biz.eventboard_insert(dto);

			if (res > 0) {
				return "redirect:eventboard_list.do";
			} else {
				return "redirect:eventboard_list.do";
			}
		}

		@RequestMapping("/event_selectOne.do")
		public String selectOne(@RequestParam int event_postnum, Model model) {
			EventboardDto dto = biz.event_selectOne(event_postnum);
			model.addAttribute("dto", dto);
			return "eventboard/EventboardDetail";

		}

		@RequestMapping("/eventboard_updateform.do")
		public String updateform(@RequestParam int event_postnum, Model model) {

			EventboardDto dto = biz.event_selectOne(event_postnum);
			model.addAttribute("dto", dto);
			// model.addAttribute("dto", biz.selectOne(event_postnum));

			return "eventboard/EventboardUpdateForm";
		}

		@RequestMapping("/eventboard_update.do")
		public String update(@ModelAttribute EventboardDto dto, Model model, HttpSession session) {
			int res = biz.eventboard_update(dto);
			System.out.println("res : " + res);

			return "redirect:eventboard_list.do";

			// if(res>0) {
			//// MemberDto memberdto = (MemberDto) session.getAttribute("login");
			//// MemberDto membetdto_res = memberbiz.login(memberdto.getMember_id(),
			// memberdto.getMember_pw());
			//// session.setAttribute("login", membetdto_res);
			// return "redirect:eventboard_list.do";
			// }else {
			// return "redirect:eventboard_list.do";
			// }

		}

		@RequestMapping("/eventboard_delete.do")
		public String delete(@RequestParam int event_postnum) {
			int res = biz.eventboard_delete(event_postnum);
			// biz.eventboard_delete(event_postnum);
			if (res > 0) {
				return "redirect:eventboard_list.do";
			} else {
				return "redirect:eventboard_list.do";
			}
			// return "redirect:eventboard_list.do";

		}

		// 체크삭제 없애기로함 0821
		/*
		 * @RequestMapping("/eventboard_muldel.do") //public String
		 * eventboard_muldel(String[] event_chk) { public String
		 * eventboard_muldel(Integer[] event_chk) { int res =
		 * biz.eventboard_muldel(event_chk); if(res>0) { return
		 * "redirect:eventboard_list.do"; }else { return "redirect:eventboard_list.do";
		 * } }
		 */
	}
}

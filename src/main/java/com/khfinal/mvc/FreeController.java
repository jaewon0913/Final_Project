package com.khfinal.mvc;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.free.biz.FreeboardBiz;
import com.khfinal.mvc.free.dto.CommentDto;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.member.dto.MemberDto;

@Controller
public class FreeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private FreeboardBiz biz;

	@RequestMapping("/freeboard_list.do")
	public String selectList(@RequestParam Map<String, Object> paramMap, Model model) {

		// 1.게시판 리스트를 가져온다.
		// 2.게시판 리스트의 페이징을 가져온다.
		// 기존엔 리스트만 가져온후 바로 전달했지만 이번엔 리스트와 페이징을 둘다 전달 해야해요
		// 전달 하고자 하는건 모델이 담으면 되네요
		// 기존 소스가 너무 간단해서 이해를 못하고 있었나보네요
		// 보통 방식으로 합니다.
		logger.info("<<<freeBoard_list>>>");

		// String txt_search = request.getParameter("txt_search");
		String txt_search = (String) paramMap.get("txt_search");
		int page = (paramMap.get("page") != null ? Integer.parseInt(paramMap.get("page").toString()) : 1);

		Paging paging = biz.getTotalCount(txt_search, page); // 게시판 리스트의 갯수를 가져온다.
	//	paging.setPageSize(10); // 페이징 사이즈를 결정한다.
		model.addAttribute("freeboard_list", paging); // 게시판 리스트를 전달하기 위해 모델에 담는다.

		List<FreeboardDto> list = biz.selectListPaging(paging, txt_search); // 게시판 리스트를 가져온다.
		model.addAttribute("freeboard_list", list); // 게시판 리스트를 전달하기 위해 모델에 담는다.

		model.addAttribute("paging", paging);
		model.addAttribute("txt_search", txt_search);

		// 모델은 컨트롤러가 자동으로 view (jsp)에 전다해준다. 이게 스프링이 하는 역할임

		// model.addAttribute("freeboard_list",biz.selectList());

		return "freeboard/FreeboardList"; // 이동할 jsp 파일명
	}

	// 게시판 상세  
	@RequestMapping("/freeboard_detail.do")
	public String detail(Model model, @RequestParam int free_postnum) {
		logger.info("<<<FreeController Detail>>>");
		int res = 0;
		System.out.println(free_postnum);
		
		model.addAttribute("dto", biz.selectOne(free_postnum)); // 게시글을 가지고 온다.
		res = biz.updateViews(free_postnum);
		if (res < 0) {
			// 게시글을 못찾을 경우를 처리
			System.out.println("게시글이 없음");
			return "redirect:freeboard_list.do";
		}
		
		// 댓글 리스트를 가지고 온다.
		List<CommentDto> commentList = biz.com_selectList(free_postnum); // 게시판 리스트를 가져온다.
		model.addAttribute("cmt", commentList); // 모델에 코멘트 리스트를 넣다.
		
		return "freeboard/FreeboardDetail";
	}

	@RequestMapping("/freeboard_insertform.do")
	public String insertform(Model model, HttpSession session) {
		MemberDto logindto = (MemberDto) session.getAttribute("logindto");
		model.addAttribute("logindto", logindto);

		return "freeboard/FreeboardInsertForm";
	}

	@RequestMapping("/freeboard_insert.do")
	public String insert(@ModelAttribute FreeboardDto dto) {
		int res = biz.freeboard_insert(dto);
		if (res > 0) {
			return "redirect:freeboard_list.do";
		} else {
			return "redirect:freeboard_list.do";
		}
	}

	@RequestMapping("/selectOne.do")
	public String selectOne(@RequestParam int free_postnum, Model model) {
		FreeboardDto dto = biz.selectOne(free_postnum);
		model.addAttribute("dto", dto);
		return "freeboard/FreeboardDetail";

	}

	@RequestMapping("/freeboard_updateform.do")
	public String updateform(@RequestParam int free_postnum, Model model) {

		FreeboardDto dto = biz.selectOne(free_postnum);
		model.addAttribute("dto", dto);
		// model.addAttribute("dto", biz.selectOne(free_postnum));

		return "freeboard/FreeboardUpdateForm";
	}

	@RequestMapping("/freeboard_update.do")
	public String update(@ModelAttribute FreeboardDto dto, Model model, HttpSession session) {
		int res = biz.freeboard_update(dto);
		System.out.println("res : " + res);

		return "redirect:freeboard_list.do";

//		if(res>0) {
////			MemberDto memberdto = (MemberDto) session.getAttribute("login");
////			MemberDto membetdto_res = memberbiz.login(memberdto.getMember_id(), memberdto.getMember_pw());
////			session.setAttribute("login", membetdto_res);
//			return "redirect:freeboard_list.do";
//		}else {
//			return "redirect:freeboard_list.do";
//		}

	}

	@RequestMapping("/freeboard_delete.do")
	public String delete(@RequestParam int free_postnum) {
		int res = biz.freeboard_delete(free_postnum);
		// biz.freeboard_delete(free_postnum);
		if (res > 0) {
			return "redirect:freeboard_list.do";
		} else {
			return "redirect:freeboard_list.do";
		}
		// return "redirect:freeboard_list.do";

	}

	@RequestMapping("/freeboard_muldel.do")
	// public String freeboard_muldel(String[] free_chk) {
	public String freeboard_muldel(Integer[] free_chk) {
		int res = biz.freeboard_muldel(free_chk);
		if (res > 0) {
			return "redirect:freeboard_list.do";
		} else {
			return "redirect:freeboard_list.do";
		}
	}

	
	
	
	  // 답   글

	@RequestMapping("/com__list.do")
	public String selectList(@RequestParam int free_postnum,Model model) {
		logger.info("<<<com__list>>>");
		model.addAttribute("com_list", biz.com_selectList(free_postnum));
		return "freeboard/ComList";
	}

	@RequestMapping("/com__selectOne.do")
	public String com__selectOne(@RequestParam int com_num, Model model) {
		CommentDto dto = biz.com_selectOne(com_num);
		model.addAttribute("dto", dto);
		return "freeboard/ComBoardDetail";

	}
	

	@RequestMapping("/com_board_insertform.do")
	public String com_board_insertform(Model model, HttpSession session) {
		MemberDto logindto = (MemberDto) session.getAttribute("logindto");
		model.addAttribute("logindto", logindto);

		return "freeboard/ComBoardInsertForm";
	}

	@RequestMapping("/com_board_insert.do")
	@ResponseBody
	public Map<String, List<CommentDto>> com_board_insert(String com_content,int free_postnum,HttpSession session) {
		Map<String, List<CommentDto>> map = new HashMap<String, List<CommentDto>>();
		MemberDto logindto = (MemberDto) session.getAttribute("logindto");
		
		CommentDto dto = new CommentDto(0,free_postnum,logindto.getMember_id(),logindto.getMember_name(),com_content
				,0,0,0,null);
		int res = biz.com_board_insert(dto);
		
		if (res > 0) {
			List<CommentDto> list = biz.com_selectList(free_postnum);
			map.put("list", list);
		} 
		
		return map;
	}

	

	@RequestMapping("/com_board_updateform.do")
	public String com_board_updateform(@RequestParam int com_num, Model model) {

		CommentDto cmt = biz.com_selectOne(com_num);
		model.addAttribute("cmt", cmt);
		// model.addAttribute("dto", biz.selectOne(free_postnum));

		return "freeboard/ComBoardUpdateForm";
	}

	@RequestMapping("/com_board_update.do")
	public String com_board_update(@ModelAttribute CommentDto cmt, Model model) {
		int res = biz.com_board_update(cmt);
		
		model.addAttribute("free_postnum", cmt.getFree_postnum());
		
		System.out.println("cmt : " + cmt);

		return "redirect:freeboard_detail.do";



	}

	@RequestMapping("/com_board_delete.do")
	@ResponseBody
	public Map<String, List<CommentDto>> com_board_delete(@RequestParam int com_num,int free_postnum) {
		Map<String, List<CommentDto>> map = new HashMap<String, List<CommentDto>>();
		
		int res = biz.com_board_delete(com_num);
		
		if (res > 0) {
			List<CommentDto> list = biz.com_selectList(free_postnum);
			map.put("list", list);
		} 
			
		return map;

	}

	  
	 
}

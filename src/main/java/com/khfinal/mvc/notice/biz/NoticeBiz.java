package com.khfinal.mvc.notice.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.notice.dto.NoticeDto;

public interface NoticeBiz {
	
	
	
	public List<NoticeDto> NoticeSelectlist(); // 전체보기

	public NoticeDto NoticeSelectOne(int notice_postnum); // 상세보기

	public int NoticeInsert(NoticeDto dto);// 글작성

	public int NoticeUpdate(NoticeDto dto); // 수정

	public int NoticeDelete(int notice_postnum);// 삭제

	public int NoticeViews(int notice_postnum);// 조회수
	
	public List<NoticeDto> NoticemainSelect();//메인에띄울쿼리
	
	//페이징
	public List<NoticeDto> NoticeSelectlist(int firstIndex, int recordCountPerPage, String txt_search);
	
	public int totalcount(String txt_search);

}

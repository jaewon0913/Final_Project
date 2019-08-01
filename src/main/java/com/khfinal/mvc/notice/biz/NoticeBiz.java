package com.khfinal.mvc.notice.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.notice.dto.NoticeDto;

public interface NoticeBiz {
	
	
	
	
	public List<NoticeDto> NoticeSelectlist(); // 전체보기

	public NoticeDto NoticeSelectOne(int notice_postnum); // 상세보기

	public void NoticeInsert(NoticeDto dto);// 글작성

	public void NoticeUpdate(int notice_postnum); // 수정

	public void NoticeDelete(int notice_postnum);// 삭제

	public void NoticeViews(int notice_postnum, HttpSession session);// 조회수

}

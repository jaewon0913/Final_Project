package com.khfinal.mvc.notice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.notice.dto.NoticeDto;

public class NoticeDaoImpl implements NoticeDao {
	
	//전체보기
	@Override
	public List<NoticeDto> NoticeSelectlist() {
		return null;
	}

	//상세보기
	@Override
	public NoticeDto NoticeSelectOne(int notice_postnum) {
		return null;
	}

	//글작성
	@Override
	public void NoticeInsert(NoticeDto dto) {
		
	}

	//글수정
	@Override
	public void NoticeUpdate(int notice_postnum) {
		
	}

	//글삭제
	@Override
	public void NoticeDelete(int notice_postnum) {
		
	}

	//조회수
	@Override
	public void NoticeViews(int notice_postnum, HttpSession session) {
		
	}

}

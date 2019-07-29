package com.khfinal.mvc.notice.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.notice.dto.NoticeDto;

public class NoticeBizImpl implements NoticeBiz {

	@Override
	public List<NoticeDto> NoticeSelectlist() {
		return null;
	}

	@Override
	public NoticeDto NoticeSelectOne(int notice_postnum) {
		return null;
	}

	@Override
	public void NoticeInsert(NoticeDto dto) {
		
	}

	@Override
	public void NoticeUpdate(int notice_postnum) {
		
	}

	@Override
	public void NoticeDelete(int notice_postnum) {
		
	}

	@Override
	public void NoticeViews(int notice_postnum, HttpSession session) {
		
	}
	
	

}

package com.khfinal.mvc.notice.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.notice.dto.NoticeDto;
import com.khfinal.mvc.notice.dao.NoticeDao;


@Service
public class NoticeBizImpl implements NoticeBiz {
	
	@Autowired
	private NoticeDao noticedao;

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

package com.khfinal.mvc.notice.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.notice.dao.NoticeDao;
import com.khfinal.mvc.notice.dto.NoticeDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao noticedao;

	@Override
	public List<NoticeDto> NoticeSelectlist() {
		return noticedao.NoticeSelectlist();
	}

	@Override
	public NoticeDto NoticeSelectOne(int notice_postnum) {
		return noticedao.NoticeSelectOne(notice_postnum);
	}

	@Override
	public int NoticeInsert(NoticeDto dto) {
		return noticedao.NoticeInsert(dto);

	}

	@Override
	public int NoticeUpdate(NoticeDto dto) {
		return noticedao.NoticeUpdate(dto);

	}

	@Override
	public int NoticeDelete(int notice_postnum) {
		return noticedao.NoticeDelete(notice_postnum);

	}

	@Override
	public int NoticeViews(int notice_postnum) {
		return noticedao.NoticeViews(notice_postnum);

	}


}

package com.khfinal.mvc.notice.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 전체보기
	@Override
	public List<NoticeDto> NoticeSelectlist() {
		List<NoticeDto> list = new ArrayList<NoticeDto>();

		try {
			list = sqlSession.selectList(namespace + "NoticeSelectlist");
		} catch (Exception e) {
			System.out.println("NoticeSelectList 에러났다아아앙");
			e.printStackTrace();
		}

		return list;
	}

	// 상세보기
	@Override
	public NoticeDto NoticeSelectOne(int notice_postnum) {
		
		NoticeDto noticedto = new NoticeDto();
		
		try {
			noticedto = sqlSession.selectOne(namespace+ "NoticeSelectOne",notice_postnum);
		} catch (Exception e) {
			System.out.println("NticeSelectOne 에러났다앙");
			e.printStackTrace();
		}
		
		return noticedto;
	}

	// 글작성
	@Override
	public void NoticeInsert(NoticeDto dto) {

	}

	// 글수정
	@Override
	public void NoticeUpdate(int notice_postnum) {

	}

	// 글삭제
	@Override
	public void NoticeDelete(int notice_postnum) {

	}

	// 조회수
	@Override
	public void NoticeViews(int notice_postnum, HttpSession session) {

	}

}

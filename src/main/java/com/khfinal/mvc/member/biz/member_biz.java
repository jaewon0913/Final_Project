package com.khfinal.mvc.member.biz;

import com.khfinal.mvc.member.dto.member_dto;

public interface member_biz {
	
	public member_dto login(String id, String pw);	//	로그인
	public int insert_member(member_dto dto);		//	회원가입
	public int update_member(member_dto dto);		//	회원수정
	public int detail_member(String id);				//	회원정보 읽어오기
	
}

package com.khfinal.mvc.member.dao;

import com.khfinal.mvc.member.dto.MemberDto;

public interface MemberDao {
	String namespace = "membermapper.";
	
	public MemberDto login(String id, String pw);	//	로그인
	public int insert_member(MemberDto dto);		//	회원가입
	public int update_member(MemberDto dto);		//	회원수정
	public MemberDto detail_member(String id);				//	회원정보 읽어오기
}

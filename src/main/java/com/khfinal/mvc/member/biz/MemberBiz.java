package com.khfinal.mvc.member.biz;

import com.khfinal.mvc.member.dto.MemberDto;

public interface MemberBiz {
	
	public MemberDto login(String id, String pw);	//	濡쒓렇�씤
	public int insert_member(MemberDto dto);		//	�쉶�썝媛��엯
	public int update_member(MemberDto dto);		//	�쉶�썝�닔�젙
	public MemberDto detail_member(String id);		//	�쉶�썝�젙蹂� �씫�뼱�삤湲�
	public MemberDto idfind(String member_name,String member_email); // id찾기
	public MemberDto pwfind(String member_id,String member_email); // pw찾기

	public boolean idChk(String member_id);
	public boolean emailChk(String member_email);
	public MemberDto loginsuccess(String id);
}

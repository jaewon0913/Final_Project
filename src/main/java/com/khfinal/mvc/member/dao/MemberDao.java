package com.khfinal.mvc.member.dao;

import com.khfinal.mvc.member.dto.MemberDto;

public interface MemberDao {
	String namespace = "membermapper.";
	
	public MemberDto login(String id, String pw);	//	濡쒓렇�씤
	public int insert_member(MemberDto dto);		//	�쉶�썝媛��엯
	public int update_member(MemberDto dto);		//	�쉶�썝�닔�젙
	public MemberDto detail_member(String id);				//	�쉶�썝�젙蹂� �씫�뼱�삤湲�
	
	public boolean idChk(String member_id);
}

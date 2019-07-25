package com.khfinal.mvc.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.member.dao.MemberDao;
import com.khfinal.mvc.member.dto.MemberDto;

@Service
public class MemberBIzImpl implements MemberBiz {
	
	@Autowired
	private MemberDao memberdao;

	@Override
	public MemberDto login(String id, String pw) {
		return memberdao.login(id,pw);
	}

	@Override
	public int insert_member(MemberDto dto) {
		return memberdao.insert_member(dto);
	}

	@Override
	public int update_member(MemberDto dto) {
		return memberdao.update_member(dto);
	}

	@Override
	public MemberDto detail_member(String id) {
		return memberdao.detail_member(id);
	}

	@Override
	public boolean idChk(String member_id) {
		return memberdao.idChk(member_id);
	}
}

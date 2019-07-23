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
		return 0;
	}

	@Override
	public int update_member(MemberDto dto) {
		return 0;
	}

	@Override
	public int detail_member(String id) {
		return 0;
	}

}

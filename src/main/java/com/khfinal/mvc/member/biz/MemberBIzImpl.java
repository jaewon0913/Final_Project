package com.khfinal.mvc.member.biz;

import java.util.List;

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
	public MemberDto loginpw(String id, String pw) {
		return memberdao.loginpw(id,pw);
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
	public int update_pw(MemberDto dto) {
		return memberdao.update_pw(dto);
	}

	@Override
	public MemberDto detail_member(String id) {
		return memberdao.detail_member(id);
	}

	@Override
	public boolean idChk(String member_id) {
		return memberdao.idChk(member_id);
	}

	@Override
	public boolean emailChk(String member_email) {
		return memberdao.emailChk(member_email);
	}

	@Override
	public MemberDto idfind(String member_name, String member_email) {
		return memberdao.idfind(member_name, member_email);
	}

	@Override
	public MemberDto pwfind(String member_id, String member_email) {
		return memberdao.pwfind(member_id, member_email);
	}

	@Override
	public MemberDto loginsuccess(String id) {
		return memberdao.loginsuccess(id);
	}

	@Override
	public List<MemberDto> pwChangedate() {
		return memberdao.pwChangedate();
	}

	@Override
	public int memberWithdrawal(String member_id) {
		return memberdao.memberWithdrawal(member_id);
	}

	@Override
	public MemberDto pwChk(String member_id) {
		return memberdao.pwChk(member_id);
	}

}

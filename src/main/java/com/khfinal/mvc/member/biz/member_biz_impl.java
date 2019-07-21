package com.khfinal.mvc.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.member.dao.member_dao;
import com.khfinal.mvc.member.dto.member_dto;

@Service
public class member_biz_impl implements member_biz {
	
	@Autowired
	private member_dao memberdao;

	@Override
	public member_dto login(String id, String pw) {
		return memberdao.login(id,pw);
	}

	@Override
	public int insert_member(member_dto dto) {
		return 0;
	}

	@Override
	public int update_member(member_dto dto) {
		return 0;
	}

	@Override
	public int detail_member(String id) {
		return 0;
	}

}

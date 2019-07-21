package com.khfinal.mvc.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.member.dto.member_dto;

@Repository
public class member_dao_impl implements member_dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public member_dto login(String id, String pw) {
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		member_dto memberdto = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		
		memberdto = sqlSession.selectOne(namespace + "login", map);
		
		return memberdto;
	}

	@Override
	public int insert_member(member_dto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_member(member_dto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int detail_member(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

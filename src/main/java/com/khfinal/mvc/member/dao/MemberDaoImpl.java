package com.khfinal.mvc.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDto login(String id, String pw) {
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);

		MemberDto memberdto = null;

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("pw", pw);

		memberdto = sqlSession.selectOne(namespace + "login", map);

		return memberdto;
	}

	@Override
	public int insert_member(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_member(MemberDto dto) {
		int res = 0;
		System.out.println("넘어왔니??");
		try {
			res = sqlSession.update(namespace+"update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("넘어와줘라 제발");
		System.out.println("아아아아아" + res);
		return res;
	}

	@Override
	public MemberDto detail_member(String id) {
		System.out.println("id : " + id);

		MemberDto memberdto = null;

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("id", id);

		memberdto = sqlSession.selectOne(namespace + "detail", map);

		return memberdto;
	}

}

package com.khfinal.mvc.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public MemberDto loginpw(String id, String pw) {
		MemberDto memberdto = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		memberdto = sqlSession.selectOne(namespace + "loginpw", map);
		
		return memberdto;
	}

	@Override
	public MemberDto loginsuccess(String id) {
		MemberDto memberdto = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		memberdto = sqlSession.selectOne(namespace + "loginsuccess", map);

		return memberdto;

	}

	@Override
	public int insert_member(MemberDto dto) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		int res = sqlSession.insert(namespace + "insert", dto);
		int res1 = sqlSession.insert(namespace + "insertAuthorities", map);

		return res + res1;
	}

	@Override
	public int update_member(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update_pw(MemberDto dto) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		map.put("member_pw", dto.getMember_pw());
		int res = 0;
		try {
			res = sqlSession.update(namespace + "pwupdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	@Override
	public MemberDto idfind(String member_name, String member_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", member_name);
		map.put("email", member_email);

		MemberDto memberdto = new MemberDto();

		memberdto = sqlSession.selectOne(namespace + "idfind", map);

		return memberdto;
	}

	@Override
	public MemberDto pwfind(String member_id, String member_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", member_id);
		map.put("email", member_email);

		MemberDto memberdto = new MemberDto();

		memberdto = sqlSession.selectOne(namespace + "pwfind", map);

		return memberdto;
	}

	@Override
	public boolean idChk(String member_id) {
		System.out.println("daoImpl : " + member_id);
		boolean idnotused = true;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);

		MemberDto memberdto = new MemberDto();
		memberdto = sqlSession.selectOne(namespace + "idChk", map);
		if (memberdto == null) {
			idnotused = true;
		} else {
			idnotused = false;
		}
		return idnotused;
	}

	@Override
	public boolean emailChk(String member_email) {
		boolean emailnotused = true;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email", member_email);
		MemberDto memberdto = new MemberDto();
		memberdto = sqlSession.selectOne(namespace + "emailChk", map);
		if (memberdto == null) {
			emailnotused = true;// 생성가능
		} else {
			emailnotused = false;
		}
		return emailnotused;
	}

	@Override
	public List<MemberDto> pwChangedate() {
		
		List<MemberDto> list = sqlSession.selectList(namespace+"pwChangedate");
		
		return list;
	}

	@Override
	public int memberWithdrawal(String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		
		int res = sqlSession.update(namespace+"memberWithdrawal",map);
		
		return res;
	}

	@Override
	public MemberDto pwChk(String member_id) {
		boolean pwchk = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		
		MemberDto memberdto = new MemberDto();
		memberdto = sqlSession.selectOne(namespace+"pwChk",map);
		
		return memberdto;
	}
}

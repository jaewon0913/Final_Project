package com.khfinal.mvc.boxorder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.boxorder.dto.BoxorderDto;

@Repository
public class BoxorderDaoImpl implements BoxorderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public BoxorderDto selectOne(String member_id,String ordernumber) {
		System.out.println("daoImpl: member_id "+member_id+" ordernumber: "+ordernumber);
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("ordernumber", ordernumber);
		
		BoxorderDto dto = sqlSession.selectOne(namespace+"selectOne",map);
		
		return dto;
	}

	@Override
	public int dosirakinsert(BoxorderDto dto) {
		
		int res = sqlSession.insert(namespace+"dosirakinsert",dto);
		
		return res;
	}

	@Override
	public int receiveUpdate(BoxorderDto dto) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		map.put("ordernumber", dto.getOrdernumber());
		
		int res = sqlSession.update(namespace+"receiveUpdate",map);
		
		return res;
	}

	@Override
	public List<BoxorderDto> qrcodeSelect(String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		
		List<BoxorderDto> list = sqlSession.selectList(namespace+"qrcodeSelect",map);
		
		return list;
	}

	@Override
	public List<BoxorderDto> graphSelectList(String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		
		List<BoxorderDto> list = sqlSession.selectList(namespace+"graphSelect",map);
		
		return list;
	}

}

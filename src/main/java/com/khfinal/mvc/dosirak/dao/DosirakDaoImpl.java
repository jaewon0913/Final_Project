package com.khfinal.mvc.dosirak.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.dosirak.dto.DosirakDto;

@Repository
public class DosirakDaoImpl implements DosirakDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public DosirakDto selectOne(int dosirak_postnum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("dosirak_postnum", dosirak_postnum);
		
		DosirakDto dosirakdto = sqlSession.selectOne(namespace+"selectOne",map);
		
		return dosirakdto;
	}
	
	
}

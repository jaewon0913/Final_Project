package com.khfinal.mvc.etc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.notice.dto.NoticeDto;

@Repository
public class EtcDaoImpl implements EtcDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDto> NoticeSelectList(String text) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("text", text);
			
			list = sqlSession.selectList(namespace + "noticeselectlist" , map);
			
		} catch (Exception e) {
			System.out.println("NoticeSelectList 에러났다아아앙");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<DosirakDto> DosirakSelectList(String text) {
		List<DosirakDto> list = new ArrayList<DosirakDto>();

		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("text", text);
			list = sqlSession.selectList(namespace + "dosirakselectlist" , map);
			
		} catch (Exception e) {
			System.out.println("select list error");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<FreeboardDto> FreeSelectList(String text) {
		List<FreeboardDto> list = new ArrayList<FreeboardDto>();

		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("text", text);
			list = sqlSession.selectList(namespace + "freeselectlist" , map);
			
		} catch (Exception e) {
			System.out.println("select list 실패.");
			e.printStackTrace();
		}

		return list;
	}

}

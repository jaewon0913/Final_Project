package com.khfinal.mvc.boxorder.dao;

import java.util.ArrayList;
import java.lang.reflect.Field;
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
		System.out.println("daoimpl 확인 : "+dto.getDosirak_title());
		return dto;
	}

	@Override
	public int dosirakinsert(BoxorderDto dto) {
		System.out.println("daoimpl dish!!!!!!!!!!  "+dto.getDish1());
		
		Object obj = dto;
		for(Field field : obj.getClass().getDeclaredFields()) {
			field.setAccessible(true);
			try {
				Object value = field.get(obj);
				System.out.println(field.getName()+ ": ," + value);
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
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
		
		List<BoxorderDto> list = new ArrayList<BoxorderDto>(); 
		list = sqlSession.selectList(namespace+"graphSelect",map);
		
//		BoxorderDto dto = new BoxorderDto();
//		dto.setTan(0);
//		dto.setDan(0);
//		dto.setGi(0);
//		dto.setKcal(0);
		
		if(list == null) {
			System.out.println("list가 null이다!!!!!");
//			List<BoxorderDto> list2 = new ArrayList<BoxorderDto>();
			
			for(int i=0; i<7; i++) {
				BoxorderDto dto = new BoxorderDto();
				dto.setTan(0);
				dto.setDan(0);
				dto.setGi(0);
				dto.setKcal(0);
				
				list.add(i,dto);
			}
//			return list;
		}else if(list.size() != 7) {
			
			System.out.println("리스트 사이즈 : "+list.size());
//			List<BoxorderDto> list2 = new ArrayList<BoxorderDto>();
			int size = 7-(list.size());//list.size()==2(0,1)  size=5
			System.out.println("그냥 사이즈 : "+size);
			for(int i= list.size(); i<7 ;i++) {
				BoxorderDto dto = new BoxorderDto();
				dto.setTan(0);
				dto.setDan(0);
				dto.setGi(0);
				dto.setKcal(0);
				list.add(dto);
			}
//			return list;
		}
		
		System.out.println("리스트 사이즈!!!!! : "+list.size());
		return list;
	}

	@Override
	public List<BoxorderDto> orderresult(String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		
		List<BoxorderDto> list = sqlSession.selectList(namespace+"orderresult",map);
		
		return list;
	}

}

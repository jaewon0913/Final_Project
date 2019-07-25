package com.khfinal.mvc.free.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.free.dto.FreeboardDto;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FreeboardDto> selectList(){
		
		List<FreeboardDto> list = new ArrayList<FreeboardDto>();
		
		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("select list 에러입니다.");
			e.printStackTrace();
		}
		
		return list;

	}

	@Override
	public FreeboardDto selectOne(String memeber_id) {
		
		FreeboardDto dto = new FreeboardDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "selectOne",memeber_id);			
		} catch (Exception e) {
			System.out.println("select one error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(FreeboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace+"insert",dto);
		} catch (Exception e) {
			System.out.println("insert 에러예요");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(FreeboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "update",dto);
		} catch (Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(String memeber_id) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "delete", memeber_id);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return res;
	}
	
}

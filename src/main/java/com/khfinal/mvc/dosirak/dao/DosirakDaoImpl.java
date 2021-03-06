package com.khfinal.mvc.dosirak.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	public DosirakDto selecttest(int dosirak_postnum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("dosirak_postnum", dosirak_postnum);
		
		DosirakDto dosirakdto = sqlSession.selectOne(namespace+"selecttest",map);
		
		return dosirakdto;
	}

	@Override
	public List<DosirakDto> selectList() {
		List<DosirakDto> list = new ArrayList<DosirakDto>();

		try {
			list = sqlSession.selectList(namespace + "selectlist");
		} catch (Exception e) {
			System.out.println("select list error");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<DosirakDto> viewslist() {
		List<DosirakDto> list = new ArrayList<DosirakDto>();
		
		try {
			list = sqlSession.selectList(namespace + "viewslist");
			System.out.println("asdsdsadsa"+list.get(0).getBestnum());
			System.out.println(list.get(0).getDosirak_postnum());
		} catch (Exception e) {
			System.out.println("select viewslist error");
			e.printStackTrace();
		}
		
		return list;
	}	

	@Override
	public List<DosirakDto> selectListPaging(int firstIndex, int recordCountPerPage, String txt_search) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search);
		
		List<DosirakDto> list = sqlSession.selectList(namespace + "selectlistpaging", map);
		
		return list;
	}

	@Override
	public int totalcount(String txt_search) {
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("txt_search", txt_search);
		
		res = sqlSession.selectOne(namespace + "totalcount", map);
		
		return res;
	}

	@Override
	public int insert(DosirakDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("insert 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(DosirakDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			System.out.println("update 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(String dosirak_name) {
		int res = 0;
		System.out.println("아예안오니");
		try {
			res = sqlSession.delete(namespace + "delete", dosirak_name);
		} catch (Exception e) {
			System.out.println("delete 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public DosirakDto selectOne(int dosirak_postnum) {
		DosirakDto dto = new DosirakDto();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("dosirak_postnum", dosirak_postnum);
		System.out.println(dosirak_postnum + "도시락번호");
		try {
			dto = sqlSession.selectOne(namespace + "selectone", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateviews(int dosirak_postnum) {
		int res = 0;
		try {
		res = sqlSession.update(namespace + "updateviews", dosirak_postnum);
		} catch (Exception e) {
			System.out.println("updateViews error");
			e.printStackTrace();
		}
		return res;
	}

}

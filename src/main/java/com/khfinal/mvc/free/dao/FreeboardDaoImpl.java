package com.khfinal.mvc.free.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

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
			System.out.println("select list 실패.");
			e.printStackTrace();
		}
		
		return list;

	}
	
	
	
	@Override
	public FreeboardDto selectOne(int free_postnum) {
		
		FreeboardDto dto = new FreeboardDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", free_postnum);			
		} catch (Exception e) {
			System.out.println("select one error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int freeboard_insert(FreeboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace+"freeboard_insert",dto);
		} catch (Exception e) {
			System.out.println("insert 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int freeboard_update(FreeboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "freeboard_update",dto);
			System.out.println("freeboard_update>>>" + dto.toString());
		} catch (Exception e) {
			System.out.println("freeboard_update error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int freeboard_delete(int free_postnum) {
		
		int res = 0;
		
		/*
		 * Map<String, Integer> map = new HashMap<String, Integer>();
		 * map.put("free_postnum", free_postnum); try { res= sqlSession.delete(namespace
		 * + "freeboard_delete", map); } catch (Exception e) {
		 * System.out.println("delete error"); e.printStackTrace(); } return res; }
		 */
		try {
			res = sqlSession.delete(namespace + "freeboard_delete",free_postnum);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	//public int freeboard_muldel(String[] free_chk) {
	public int freeboard_muldel(Integer[] free_chk) {
		
		int res = 0;
		
		List<String> freeboard_list = new ArrayList<String>();
		List<Integer> delList = new ArrayList<Integer>();
		//for(String str : free_chk) {
		for(Integer str : free_chk) {
			//freeboard_list.add(str);
			//delList.add( Integer.parseInt(str));
			delList.add( str);
			// 리스트에 담는게 아니고 리스트 개수 만큼 반복해서 지워야함
			//int res2 = sqlSession.delete(namespace + "freeboard_muldel",str);
			//res += res2;
		}
		//res = sqlSession.delete(namespace + "freeboard_muldel",freeboard_list);
		res = sqlSession.delete(namespace + "freeboard_muldel",delList);
		return res;
	}

	
	/* 조회수 */
	@Override
	public int updateViews(int free_postnum) {
	
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "updateViews",free_postnum);
			System.out.println("updateViews>>>" + free_postnum);
		} catch (Exception e) {
			System.out.println("updateViews error");
			e.printStackTrace();
		}
		return res;
	}
	

	
	}


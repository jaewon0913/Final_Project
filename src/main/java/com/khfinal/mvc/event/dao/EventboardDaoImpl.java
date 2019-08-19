package com.khfinal.mvc.event.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.event.dto.EventboardDto;

@Repository
public class EventboardDaoImpl implements EventboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EventboardDto> event_selectList(){
		
		List<EventboardDto> list = new ArrayList<EventboardDto>();
		
		try {
			list = sqlSession.selectList(namespace + "event_selectList");
		} catch (Exception e) {
			System.out.println("select list 실패.");
			e.printStackTrace();
		}
		
		return list;

	}
	
	
	
	@Override
	public EventboardDto event_selectOne(int event_postnum) {
		
		EventboardDto dto = new EventboardDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "event_selectOne", event_postnum);			
		} catch (Exception e) {
			System.out.println("selectOne error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int eventboard_insert(EventboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace+"eventboard_insert",dto);
		} catch (Exception e) {
			System.out.println("insert 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int eventboard_update(EventboardDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "eventboard_update",dto);
			System.out.println("eventboard_update>>>" + dto.toString());
		} catch (Exception e) {
			System.out.println("eventboard_update error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int eventboard_delete(int event_postnum) {
		
		int res = 0;
		
		/*
		 * Map<String, Integer> map = new HashMap<String, Integer>();
		 * map.put("event_postnum", event_postnum); try { res= sqlSession.delete(namespace
		 * + "eventboard_delete", map); } catch (Exception e) {
		 * System.out.println("delete error"); e.printStackTrace(); } return res; }
		 */
		try {
			res = sqlSession.delete(namespace + "eventboard_delete",event_postnum);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	//public int eventboard_muldel(String[] event_chk) {
	public int eventboard_muldel(Integer[] event_chk) {
		
		int res = 0;
		
		List<String> eventboard_list = new ArrayList<String>();
		List<Integer> delList = new ArrayList<Integer>();
		//for(String str : event_chk) {
		for(Integer str : event_chk) {
			//eventboard_list.add(str);
			//delList.add( Integer.parseInt(str));
			delList.add( str);
			// 리스트에 담는게 아니고 리스트 개수 만큼 반복해서 지워야함
			//int res2 = sqlSession.delete(namespace + "eventboard_muldel",str);
			//res += res2;
		}
		//res = sqlSession.delete(namespace + "eventboard_muldel",eventboard_list);
		res = sqlSession.delete(namespace + "eventboard_muldel",delList);
		return res;
	}

	
	/* 조회수 */
	@Override
	public int evupdateViews(int event_postnum) {
	
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "updateViews",event_postnum);
			System.out.println("updateViews>>>" + event_postnum);
		} catch (Exception e) {
			System.out.println("updateViews error");
			e.printStackTrace();
		}
		return res;
	}



	public int getTotalCount(String txt_search) {

		int ret = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("txt_search", txt_search );
		try {
			ret = sqlSession.selectOne(namespace + "getTotalCount", map);			
		} catch (Exception e) {
			System.out.println("getTotalCount error");
			e.printStackTrace();
		}
		
		return ret;
	}
	
	
	public List<EventboardDto> selectList(Paging paging,String txt_search){
		
		int firstIndex = (paging.getPageNo() - 1) * paging.getPageSize(); // select해오는 기준을 구한다.
		int recordCountPerPage = paging.getPageSize();
				
		List<EventboardDto> list = new ArrayList<EventboardDto>();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex",  String.valueOf(firstIndex) );
		map.put("recordCountPerPage",  String.valueOf(recordCountPerPage) );
		map.put("txt_search", txt_search );
		
		try {
			list = sqlSession.selectList(namespace + "selectListPaging",map);
		} catch (Exception e) {
			System.out.println("select list 실패.");
			e.printStackTrace();
		}
		
		return list;

	}
	

}

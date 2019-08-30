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

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.free.dto.CommentDto;
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
			System.out.println("selectOne error");
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
	

	/* 페이징 */
	public List<FreeboardDto> selectList(Paging paging,String txt_search){
		
		int firstIndex = (paging.getPageNo() - 1) * paging.getPageSize(); // select해오는 기준을 구한다.
		int recordCountPerPage = paging.getPageSize();
				
		List<FreeboardDto> list = new ArrayList<FreeboardDto>();
		
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
	

	
	/* 답글 */
	@Override
	public List<CommentDto> com_selectList(int free_postnum) {
	
		List<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			list = sqlSession.selectList(namespace + "com_selectList",free_postnum);
		} catch (Exception e) {
			System.out.println("com_select list 실패.");
			e.printStackTrace();
		}
		
		return list;

	}

	
	  @Override public CommentDto com_selectOne(int com_num) { 
		  CommentDto dto = new CommentDto();
	  
		  try {
			  dto = sqlSession.selectOne(namespace + "com_selectOne", com_num); }
		  catch(Exception e) { 
			  System.out.println("selectOne error"); 
			  e.printStackTrace(); }
	  
	  return dto; }
	 

	@Override
	public int com_board_insert(CommentDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace+"com_board_insert",dto);
		} catch (Exception e) {
			System.out.println("insert 실패");
			e.printStackTrace();
		}
		
		return res;
	}
	@Override
	public int com_board_update(CommentDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace + "com_board_update",dto);
			System.out.println("com_board_update>>>" + dto.toString());
		} catch (Exception e) {
			System.out.println("com_board_update error");
			e.printStackTrace();
		}
		return res;
	}
	
	
	@Override
	public int com_board_delete(int com_num) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(namespace + "com_board_delete",com_num);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return res;
	}



	@Override
	public List<FreeboardDto> freemainselect() {
		List<FreeboardDto> list = sqlSession.selectList(namespace+"freemainselect");
		
		return list;
	}

	
	
}
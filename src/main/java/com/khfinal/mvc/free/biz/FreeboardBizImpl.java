package com.khfinal.mvc.free.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.free.dao.FreeboardDao;
import com.khfinal.mvc.free.dto.CommentDto;
import com.khfinal.mvc.free.dto.FreeboardDto;



@Service
public class FreeboardBizImpl implements FreeboardBiz{

	@Autowired
	private FreeboardDao dao;
	
	@Override
	public List<FreeboardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public FreeboardDto selectOne(int free_postnum) {
		return dao.selectOne(free_postnum);
	}

	@Override
	public int freeboard_insert(FreeboardDto dto) {
		return dao.freeboard_insert(dto);
	}

	@Override
	public int freeboard_update(FreeboardDto dto) {
		return dao.freeboard_update(dto);
	}

	@Override
	public int freeboard_delete(int free_postnum) {
		return dao.freeboard_delete(free_postnum);
	

	}

	@Override
	//public int freeboard_muldel(String[] free_chk) {
	public int freeboard_muldel(Integer[] free_chk) {
		return dao.freeboard_muldel(free_chk);
	}

	

	@Override
	public int updateViews(int free_postnum) {

		return dao.updateViews(free_postnum);
	}


	//페이징
	@Override
	public Paging getTotalCount(String txt_search, int page) {
		Paging paging = new Paging();
		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
		
		int totalCount = dao.getTotalCount(txt_search);
		paging.setTotalCount(totalCount);
		//page = (page - 1) * paging.getPageSize(); // select해오는 기준을 구한다.
		return paging;
	}

	@Override
	public List<FreeboardDto> selectListPaging(Paging paging, String txt_search) {
		return dao.selectList(paging,txt_search);
	}



	//댓글
	@Override
	public List<CommentDto> com_selectList(int free_postnum) {
		return dao.com_selectList(free_postnum);
	}

	
	@Override public CommentDto com_selectOne(int com_num) { 
		return 	dao.com_selectOne(com_num); 
	}
	 
	@Override
	public int com_board_insert(CommentDto dto) {
		return dao.com_board_insert(dto);
	}

	@Override
	public int com_board_update(CommentDto dto) {
		return dao.com_board_update(dto);
	}

	@Override
	public int com_board_delete(int com_num) {
		return dao.com_board_delete(com_num);
	}
	

}





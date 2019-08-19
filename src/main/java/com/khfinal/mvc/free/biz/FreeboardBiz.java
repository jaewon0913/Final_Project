package com.khfinal.mvc.free.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.free.dto.CommentDto;
import com.khfinal.mvc.free.dto.FreeboardDto;

public interface FreeboardBiz {

	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_postnum);
	public int freeboard_insert(FreeboardDto dto);
	public int freeboard_update(FreeboardDto dto);
	public int freeboard_delete(int free_postnum);
	
	//조회수
	public int updateViews(int free_postnum);
	
	//public int freeboard_muldel(String[] free_chk);
	public int freeboard_muldel(Integer[] free_chk);
	
	
	//  댓  글
	public List<CommentDto> com_selectList(int free_postnum);
	public CommentDto com_selectOne(int com_num); 
	public int com_board_insert(CommentDto dto);
	public int com_board_update(CommentDto dto);
	public int com_board_delete(int com_num);
	
	
	// 페이징
	public Paging getTotalCount(String txt_search,int page);
	public List<FreeboardDto> selectListPaging(Paging paging,String txt_search);
}

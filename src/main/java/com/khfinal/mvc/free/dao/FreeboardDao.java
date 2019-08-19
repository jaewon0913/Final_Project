package com.khfinal.mvc.free.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.free.dto.CommentDto;
import com.khfinal.mvc.free.dto.FreeboardDto;

public interface FreeboardDao {

	String namespace = "freeboard.";
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_postnum);
	public int freeboard_insert(FreeboardDto dto);
	public int freeboard_update(FreeboardDto dto);
	public int freeboard_delete(int free_postnum);
	
	public int updateViews(int free_postnum);
	
	//public int freeboard_muldel(String[] free_chk);
	public int freeboard_muldel(Integer[] free_chk);
	
	
	/* 댓글 */
	public List<CommentDto> com_selectList(int free_postnum);
	public CommentDto com_selectOne(int com_num); 
	public int com_board_insert(CommentDto dto);
	public int com_board_update(CommentDto dto);
	public int com_board_delete(int com_num);
	
	
	

	
	public int getTotalCount(String txt_search);
	
	public List<FreeboardDto> selectList(Paging paging,String txt_search);
	
}

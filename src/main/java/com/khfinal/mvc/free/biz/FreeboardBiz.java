package com.khfinal.mvc.free.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.khfinal.mvc.free.dto.FreeboardDto;

public interface FreeboardBiz {

	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_postnum);
	public int freeboard_insert(FreeboardDto dto);
	public int freeboard_update(FreeboardDto dto);
	public int freeboard_delete(int free_postnum);
	
	//議고쉶�닔
	public int updateViews(int free_postnum);
	
	//public int freeboard_muldel(String[] free_chk);
	public int freeboard_muldel(Integer[] free_chk);
	
	
}

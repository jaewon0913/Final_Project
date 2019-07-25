package com.khfinal.mvc.free.biz;

import java.util.List;

import com.khfinal.mvc.free.dto.FreeboardDto;

public interface FreeboardBiz {

	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(String memeber_id);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(String memeber_id);
	
	
}

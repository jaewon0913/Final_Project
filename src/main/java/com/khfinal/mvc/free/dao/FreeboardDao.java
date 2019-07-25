package com.khfinal.mvc.free.dao;

import java.util.List;

import com.khfinal.mvc.free.dto.FreeboardDto;

public interface FreeboardDao {

	String namespace = "freeboard.";
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(String memeber_id);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(String memeber_id);
	
	
}

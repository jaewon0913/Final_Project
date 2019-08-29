package com.khfinal.mvc.boxorder.dao;

import java.util.List;

import com.khfinal.mvc.boxorder.dto.BoxorderDto;

public interface BoxorderDao {

	String namespace = "boxordermapper.";
	
	public BoxorderDto selectOne(String member_id,String ordernumber);
	public int dosirakinsert(BoxorderDto dto);
	public int receiveUpdate(BoxorderDto dto);
	public List<BoxorderDto> qrcodeSelect(String member_id);
	public List<BoxorderDto> graphSelectList(String member_id);
	
	public List<BoxorderDto> orderresult(String member_id);
}

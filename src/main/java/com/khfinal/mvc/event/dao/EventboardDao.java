package com.khfinal.mvc.event.dao;

import java.util.List;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.event.dto.EventboardDto;

public interface EventboardDao {

	String namespace = "eventboard.";
	
	public List<EventboardDto> event_selectList();
	public EventboardDto event_selectOne(int event_postnum);
	public int eventboard_insert(EventboardDto dto);
	public int eventboard_update(EventboardDto dto);
	public int eventboard_delete(int event_postnum);
	
	public int evupdateViews(int event_postnum);
	
	
	//public int eventboard_muldel(Integer[] event_chk);
	

	
	public int getTotalCount(String txt_search);
	
	public List<EventboardDto> selectList(Paging paging,String txt_search);
	
}


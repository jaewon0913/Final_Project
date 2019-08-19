package com.khfinal.mvc.event.biz;

import java.util.List;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.event.dto.EventboardDto;

public interface EventboardBiz {

	
	public List<EventboardDto> evnet_selectList();
	public EventboardDto event_selectOne(int event_postnum);
	public int eventboard_insert(EventboardDto dto);
	public int eventboard_update(EventboardDto dto);
	public int eventboard_delete(int event_postnum);
	
	//조회수
	public int evupdateViews(int event_postnum);
	
	//public int eventboard_muldel(String[] event_chk);
	public int eventboard_muldel(Integer[] event_chk);
	
	
	//  댓  글
	
	//insertComment와 updateComment의 합치는비즈니스로직
	/* public int CommentProc(CommentDto dto); */
	
	public Paging getTotalCount(String txt_search,int page);
	public List<EventboardDto> selectListPaging(Paging paging,String txt_search);
}


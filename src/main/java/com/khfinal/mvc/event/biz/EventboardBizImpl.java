package com.khfinal.mvc.event.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.common.util.Paging;
import com.khfinal.mvc.event.dao.EventboardDao;
import com.khfinal.mvc.event.dto.EventboardDto;
import com.khfinal.mvc.free.dto.FreeboardDto;

@Service
public class EventboardBizImpl implements EventboardBiz {

	@Autowired
	private EventboardDao dao;
	
	@Override
	public List<EventboardDto> evnet_selectList() {
		return dao.event_selectList();
	}

	@Override
	public EventboardDto event_selectOne(int event_postnum) {
		return dao.event_selectOne(event_postnum);
	}

	@Override
	public int eventboard_insert(EventboardDto dto) {
		return dao.eventboard_insert(dto);
	}

	@Override
	public int eventboard_update(EventboardDto dto) {
		return dao.eventboard_update(dto);
	}

	@Override
	public int eventboard_delete(int event_postnum) {
		return dao.eventboard_delete(event_postnum);
	

	}

	//체크삭제 없애기로 함 0821
	/*
	 * @Override //public int eventboard_muldel(String[] event_chk) { public int
	 * eventboard_muldel(Integer[] event_chk) { return
	 * dao.eventboard_muldel(event_chk); }
	 */
	

	@Override
	public int evupdateViews(int event_postnum) {

		return dao.evupdateViews(event_postnum);
	}

	/*
	 * @Override public int CommentProc(CommentDto dto) { //select(부모) int com_num =
	 * dto.getCom_num();
	 * 
	 * //update(부모의 다른 자식 = 형제) : 부모글 번호 필요 int resUpdate =
	 * dao.updateComment(com_num);
	 * 
	 * //insert(나) int resInsert = dao.insertComment(dto);
	 * 
	 * return (resUpdate + resInsert);
	 * 
	 * }
	 */
	
	

	@Override
	public Paging getTotalCount(String txt_search, int page) {
		Paging paging = new Paging();
		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		
		int totalCount = dao.getTotalCount(txt_search);
		paging.setTotalCount(totalCount);
		//page = (page - 1) * paging.getPageSize(); // select해오는 기준을 구한다.
		return paging;
	}

	
	@Override
	public List<EventboardDto> selectListPaging(Paging paging, String txt_search) {
		return dao.selectList(paging,txt_search);
	}


}


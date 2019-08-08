package com.khfinal.mvc.free.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.khfinal.mvc.free.dao.FreeboardDao;
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



}

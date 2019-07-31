package com.khfinal.mvc.free.biz;

import java.util.List;

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
	public FreeboardDto selectOne(String memeber_id) {
		return dao.selectOne(memeber_id);
	}

	@Override
	public int insert(FreeboardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(FreeboardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(String memeber_id) {
		return dao.delete(memeber_id);
	}

}

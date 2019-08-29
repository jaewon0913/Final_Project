package com.khfinal.mvc.boxorder.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.boxorder.dao.BoxorderDao;
import com.khfinal.mvc.boxorder.dto.BoxorderDto;

@Service
public class BoxorderBizImpl implements BoxorderBiz {

	@Autowired
	private BoxorderDao boxorderdao;
	
	@Override
	public BoxorderDto selectOne(String member_id,String ordernumber) {
		return boxorderdao.selectOne(member_id,ordernumber);
	}

	@Override
	public int dosirakinsert(BoxorderDto dto) {
		return boxorderdao.dosirakinsert(dto);
	}

	@Override
	public int receiveUpdate(BoxorderDto dto) {
		return boxorderdao.receiveUpdate(dto);
	}

	@Override
	public List<BoxorderDto> qrcodeSelect(String member_id) {
		return boxorderdao.qrcodeSelect(member_id);
	}

	@Override
	public List<BoxorderDto> graphSelectList(String member_id) {
		return boxorderdao.graphSelectList(member_id);
	}

	@Override
	public List<BoxorderDto> orderresult(String member_id) {
		return boxorderdao.orderresult(member_id);
	}

}

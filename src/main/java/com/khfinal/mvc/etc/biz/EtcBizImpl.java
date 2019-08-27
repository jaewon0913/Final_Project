package com.khfinal.mvc.etc.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.etc.dao.EtcDao;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.notice.dto.NoticeDto;

@Service
public class EtcBizImpl implements EtcBiz {
	
	@Autowired
	private EtcDao dao;

	@Override
	public List<NoticeDto> NoticeSelectList(String text) {
		
		return dao.NoticeSelectList(text);
	}

	@Override
	public List<DosirakDto> DosirakSelectList(String text) {
		
		return dao.DosirakSelectList(text);
	}

	@Override
	public List<FreeboardDto> FreeSelectList(String text) {
		
		return dao.FreeSelectList(text);
	}

}

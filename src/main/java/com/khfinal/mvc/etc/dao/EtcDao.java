package com.khfinal.mvc.etc.dao;

import java.util.List;

import com.khfinal.mvc.dosirak.dto.DosirakDto;
import com.khfinal.mvc.free.dto.FreeboardDto;
import com.khfinal.mvc.notice.dto.NoticeDto;

public interface EtcDao {
	String namespace = "etcmapper.";

	public List<NoticeDto> NoticeSelectList(String text); // 전체보기
	public List<DosirakDto> DosirakSelectList(String text);
	public List<FreeboardDto> FreeSelectList(String text);
}

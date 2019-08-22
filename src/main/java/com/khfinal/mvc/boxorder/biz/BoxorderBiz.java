package com.khfinal.mvc.boxorder.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.khfinal.mvc.boxorder.dto.BoxorderDto;
import com.khfinal.mvc.member.dao.MemberDao;

public interface BoxorderBiz {
	
	public BoxorderDto selectOne(String member_id,String ordernumber);
	public int dosirakinsert(BoxorderDto dto);
	public int receiveUpdate(BoxorderDto dto);
	public List<BoxorderDto> qrcodeSelect(String member_id);
	public List<BoxorderDto> graphSelectList(String member_id);
}

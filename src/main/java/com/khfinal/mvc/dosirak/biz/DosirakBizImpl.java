package com.khfinal.mvc.dosirak.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.dosirak.dao.DosirakDao;
import com.khfinal.mvc.dosirak.dto.DosirakDto;

@Service
public class DosirakBizImpl implements DosirakBiz {

	@Autowired
	private DosirakDao dosirakdao;
	
	@Override
	public DosirakDto selectOne(int dosirak_postnum) {
		return dosirakdao.selectOne(dosirak_postnum);
	}

}

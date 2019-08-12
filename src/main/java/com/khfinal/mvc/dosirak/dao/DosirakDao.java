package com.khfinal.mvc.dosirak.dao;

import com.khfinal.mvc.dosirak.dto.DosirakDto;

public interface DosirakDao {

	String namespace = "dosirakmapper.";
	
	public DosirakDto selectOne(int dosirak_postnum);
}

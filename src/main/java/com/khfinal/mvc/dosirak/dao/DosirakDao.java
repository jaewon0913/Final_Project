package com.khfinal.mvc.dosirak.dao;

import java.util.List;

import com.khfinal.mvc.dosirak.dto.DosirakDto;

public interface DosirakDao {

	String namespace = "dosirakmapper.";
	
	public List<DosirakDto> selectList();
	public DosirakDto selectOne(int dosirak_postnum);
	public DosirakDto selecttest(int dosirak_postnum);
	
	//페이징
	public List<DosirakDto> selectListPaging(int firstIndex, int recordCountPerPage, String txt_search);
	public int totalcount(String txt_search);
	
	public int insert(DosirakDto dto);
	public int update(DosirakDto dto);
	public int delete(String dosirak_name);
}

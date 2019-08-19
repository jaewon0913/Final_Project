package com.khfinal.mvc.dosirak.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.dosirak.dao.DosirakDao;
import com.khfinal.mvc.dosirak.dto.DosirakDto;

@Service
public class DosirakBizImpl implements DosirakBiz{

	@Autowired
	private DosirakDao dao;
	
	@Override
	public DosirakDto selecttest(int dosirak_postnum) {
		return dao.selecttest(dosirak_postnum);
	}
	
	@Override
	public List<DosirakDto> selectList() {
		return dao.selectList();
	}

	@Override
	public DosirakDto selectOne(int dosirak_postnum) {
		return dao.selectOne(dosirak_postnum);
	}

	@Override
	public int insert(DosirakDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(DosirakDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String dosirak_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DosirakDto> selectListPaging(int firstIndex, int recordCountPerPage, String txt_search) {
		return dao.selectListPaging(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public int totalcount(String txt_search) {
		return dao.totalcount(txt_search);
	}



}

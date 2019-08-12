package com.khfinal.mvc.etc.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.mvc.etc.util.UploadFile;

@Repository
public class UploadDaoImpl implements UploadDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(UploadFile dto) {
		int res = 0 ;
		try {
			res = sqlSession.insert(namespace + "insert" , dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<UploadFile> selectList(String dishname) {
		List<UploadFile> list = new ArrayList<UploadFile>();
		
		try {
			list = sqlSession.selectList(namespace + "selectlist", dishname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}

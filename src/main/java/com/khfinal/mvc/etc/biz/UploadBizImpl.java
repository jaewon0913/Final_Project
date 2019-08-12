package com.khfinal.mvc.etc.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.mvc.etc.dao.UploadDao;
import com.khfinal.mvc.etc.util.UploadFile;

@Service
public class UploadBizImpl implements UploadBiz {
	
	@Autowired
	private UploadDao dao;

	@Override
	public int insert(UploadFile dto) {
		return dao.insert(dto);
	}

	@Override
	public List<UploadFile> selectList(String dishname) {
		return dao.selectList(dishname);
	}

}

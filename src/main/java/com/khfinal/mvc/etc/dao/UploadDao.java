package com.khfinal.mvc.etc.dao;

import java.util.List;

import com.khfinal.mvc.etc.util.UploadFile;

public interface UploadDao {
	String namespace = "uploadmapper.";
	
	public int insert(UploadFile dto);
	public List<UploadFile> selectList(String dishname);
}

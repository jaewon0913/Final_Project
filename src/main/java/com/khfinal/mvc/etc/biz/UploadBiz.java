package com.khfinal.mvc.etc.biz;

import java.util.List;

import com.khfinal.mvc.etc.util.UploadFile;

public interface UploadBiz {
	public int insert(UploadFile dto);
	public List<UploadFile> selectList(String dishname);
}

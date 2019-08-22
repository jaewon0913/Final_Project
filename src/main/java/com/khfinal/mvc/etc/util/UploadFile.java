package com.khfinal.mvc.etc.util;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	private int upload_no;
	private String dish_name;
	private String dish_tan;
	private String dish_dan;
	private String dish_zi;
	private String dish_amount;
	private String dish_cal;
	private String dish_kind;
	private MultipartFile file;
	private String file_name;
	private String file_path;
		
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getDish_name() {
		return dish_name;
	}
	public void setDish_name(String dish_name) {
		this.dish_name = dish_name;
	}
	public String getDish_tan() {
		return dish_tan;
	}
	public void setDish_tan(String dish_tan) {
		this.dish_tan = dish_tan;
	}
	public String getDish_dan() {
		return dish_dan;
	}
	public void setDish_dan(String dish_dan) {
		this.dish_dan = dish_dan;
	}
	public String getDish_zi() {
		return dish_zi;
	}
	public void setDish_zi(String dish_zi) {
		this.dish_zi = dish_zi;
	}
	public String getDish_amount() {
		return dish_amount;
	}
	public void setDish_amount(String dish_amount) {
		this.dish_amount = dish_amount;
	}
	public String getDish_cal() {
		return dish_cal;
	}
	public void setDish_cal(String dish_cal) {
		this.dish_cal = dish_cal;
	}
	public String getDish_kind() {
		return dish_kind;
	}
	public void setDish_kind(String dish_kind) {
		this.dish_kind = dish_kind;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getUpload_no() {
		return upload_no;
	}
	public void setUpload_no(int upload_no) {
		this.upload_no = upload_no;
	}
}

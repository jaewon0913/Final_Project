package com.khfinal.mvc.free.dto;

import java.sql.Date;

public class CommentDto {

	private int com_num;
	private int free_postnum;
	private String member_id;
	private String member_name;
	private String com_content;
	private int contab;
	private int com_comno;
	private int com_comsq;
	private Date com_regdate;
	


public CommentDto() {
	
}



public CommentDto(int com_num, int free_postnum, String member_id, String member_name, String com_content, int contab,
		int com_comno, int com_comsq, Date com_regdate) {
	super();
	this.com_num = com_num;
	this.free_postnum = free_postnum;
	this.member_id = member_id;
	this.member_name = member_name;
	this.com_content = com_content;
	this.contab = contab;
	this.com_comno = com_comno;
	this.com_comsq = com_comsq;
	this.com_regdate = com_regdate;
}



public int getCom_num() {
	return com_num;
}



public void setCom_num(int com_num) {
	this.com_num = com_num;
}



public int getFree_postnum() {
	return free_postnum;
}



public void setFree_postnum(int free_postnum) {
	this.free_postnum = free_postnum;
}



public String getMember_id() {
	return member_id;
}



public void setMember_id(String member_id) {
	this.member_id = member_id;
}



public String getMember_name() {
	return member_name;
}



public void setMember_name(String member_name) {
	this.member_name = member_name;
}



public String getCom_content() {
	return com_content;
}



public void setCom_content(String com_content) {
	this.com_content = com_content;
}



public int getContab() {
	return contab;
}



public void setContab(int contab) {
	this.contab = contab;
}



public int getCom_comno() {
	return com_comno;
}



public void setCom_comno(int com_comno) {
	this.com_comno = com_comno;
}



public int getCom_comsq() {
	return com_comsq;
}



public void setCom_comsq(int com_comsq) {
	this.com_comsq = com_comsq;
}



public Date getCom_regdate() {
	return com_regdate;
}



public void setCom_regdate(Date com_regdate) {
	this.com_regdate = com_regdate;
}

}


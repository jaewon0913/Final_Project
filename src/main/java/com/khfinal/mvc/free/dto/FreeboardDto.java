package com.khfinal.mvc.free.dto;

import java.sql.Date;

public class FreeboardDto {

	private int free_postnum;
	private String member_id;
	private String member_name;
	private String free_title;
	private String free_content;
	private int free_views;
	private Date free_regdate;
	private String member_level;

	public FreeboardDto() {
	}

	public FreeboardDto(int free_postnum, String member_id, String member_name, String free_title, String free_content,
			int free_views, Date free_regdate, String member_level) {
		super();
		this.free_postnum = free_postnum;
		this.member_id = member_id;
		this.member_name = member_name;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_views = free_views;
		this.free_regdate = free_regdate;
		this.member_level = member_level;
	}
//	
//
//	public FreeboardDto(int free_postnum, String member_id, String member_name, String free_title, String free_content) {
//		super();
//		this.free_postnum = free_postnum;
//		this.member_id = member_id;
//		this.member_name = member_name;
//		this.free_title = free_title;
//		this.free_content = free_content;
//	}
//	
//	public FreeboardDto(String member_id, String member_name, String free_title, String free_content, int free_views,
//			Date free_regdate, String member_level) {
//		super();
//		this.member_id = member_id;
//		this.member_name = member_name;
//		this.free_title = free_title;
//		this.free_content = free_content;
//		this.free_views = free_views;
//		this.free_regdate = free_regdate;
//		this.member_level = member_level;
//	}	
//	
//
//	public FreeboardDto(String member_name, String free_title, int free_views, Date free_regdate) {
//		super();
//		this.member_name = member_name;
//		this.free_title = free_title;
//		this.free_views = free_views;
//		this.free_regdate = free_regdate;
//	}
//	
//	public FreeboardDto(String member_name, String free_title, String free_content, int free_views, Date free_regdate) {
//		super();
//		this.member_name = member_name;
//		this.free_title = free_title;
//		this.free_content = free_content;
//		this.free_views = free_views;
//		this.free_regdate = free_regdate;
//	}
//	
	
	public FreeboardDto(String free_title, String free_content, int free_views) {
		super();
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_views = free_views;
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

	public String getFree_title() {
		return free_title;
	}

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}

	public String getFree_content() {
		return free_content;
	}

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}

	public int getFree_views() {
		return free_views;
	}

	public void setFree_views(int free_views) {
		this.free_views = free_views;
	}

	public Date getFree_regdate() {
		return free_regdate;
	}

	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

}
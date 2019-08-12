package com.khfinal.mvc.notice.dto;

import java.sql.Date;

public class NoticeDto {

	private int notice_postnum;
	private String member_id;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	private int notice_views;

	public NoticeDto() {
		super();
	}
	
	
	
	public NoticeDto(String notice_title, String notice_content) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}



	public NoticeDto(int notice_postnum, String member_id, String notice_title, String notice_content,
			Date notice_regdate, int notice_views) {
		super();
		this.notice_postnum = notice_postnum;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.notice_views = notice_views;
	}

	public int getNotice_postnum() {
		return notice_postnum;
	}

	public void setNotice_postnum(int notice_postnum) {
		this.notice_postnum = notice_postnum;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getNotice_views() {
		return notice_views;
	}

	public void setNotice_views(int notice_views) {
		this.notice_views = notice_views;
	}

}

package com.khfinal.mvc.event.dto;

import java.sql.Date;

public class EventboardDto {


	private int event_postnum;
	private String member_id;
	private String member_name;
	private String event_title;
	private String event_content;
	private int event_views;
	private Date event_regdate;
	private String member_level;

	public EventboardDto() {
	}

	public EventboardDto(int event_postnum, String member_id, String member_name, String event_title, String event_content,
			int event_views, Date event_regdate, String member_level) {
		super();
		this.event_postnum = event_postnum;
		this.member_id = member_id;
		this.member_name = member_name;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_views = event_views;
		this.event_regdate = event_regdate;
		this.member_level = member_level;
	}

	
	public EventboardDto(String event_title, String event_content, int event_views) {
		super();
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_views = event_views;
	}

	 

	public int getevent_postnum() {
		return event_postnum;
	}


	public void setevent_postnum(int event_postnum) {
		this.event_postnum = event_postnum;
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

	public String getevent_title() {
		return event_title;
	}

	public void setevent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getevent_content() {
		return event_content;
	}

	public void setevent_content(String event_content) {
		this.event_content = event_content;
	}

	public int getevent_views() {
		return event_views;
	}

	public void setevent_views(int event_views) {
		this.event_views = event_views;
	}

	public Date getevent_regdate() {
		return event_regdate;
	}

	public void setevent_regdate(Date event_regdate) {
		this.event_regdate = event_regdate;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

}

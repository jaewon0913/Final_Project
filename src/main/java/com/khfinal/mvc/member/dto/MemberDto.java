package com.khfinal.mvc.member.dto;

import java.sql.Date;

public class MemberDto {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_address;
	private String member_subway;
	private String member_email;
	private String member_enabled;
	private String member_level;
	private Date member_regdate;
	private Date member_pw_change;
	
	public MemberDto() {}

	public MemberDto(String member_id, String member_pw, String member_name, String member_phone, String member_address,
			String member_subway, String member_email, String member_enabled, String member_level, Date member_regdate,
			Date member_pw_change) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_subway = member_subway;
		this.member_email = member_email;
		this.member_enabled = member_enabled;
		this.member_level = member_level;
		this.member_regdate = member_regdate;
		this.member_pw_change = member_pw_change;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_subway() {
		return member_subway;
	}

	public void setMember_subway(String member_subway) {
		this.member_subway = member_subway;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	public Date getMember_pw_change() {
		return member_pw_change;
	}

	public void setMember_pw_change(Date member_pw_change) {
		this.member_pw_change = member_pw_change;
	} 
	
	
	
	
	
}
package com.khfinal.mvc.dosirak.dto;

import java.util.Date;

public class DosirakDto {

	private int dosirak_postnum;
	private String dosirak_name;
	private String dosirak_title;
	private String dosirak_content;
	private String dosirak_delivery;
	private int dosirak_price;
	private int dosirak_num;
	private int dosirak_afternum;
	private int dosirak_views;
	private int tan;
	private int dan;
	private int gi;
	private int kcal;
	private String mainimage;
	private String thumbnail;
	private Date dosirak_regdate;

	public DosirakDto() {
	}

	public DosirakDto(int dosirak_postnum, String dosirak_name, String dosirak_title, String dosirak_content,
			String dosirak_delivery, int dosirak_price, int dosirak_num, int dosirak_afternum, int dosirak_views,
			int tan, int dan, int gi, int kcal, String mainimage, String thumbnail, Date dosirak_regdate) {
		super();
		this.dosirak_postnum = dosirak_postnum;
		this.dosirak_name = dosirak_name;
		this.dosirak_title = dosirak_title;
		this.dosirak_content = dosirak_content;
		this.dosirak_delivery = dosirak_delivery;
		this.dosirak_price = dosirak_price;
		this.dosirak_num = dosirak_num;
		this.dosirak_afternum = dosirak_afternum;
		this.dosirak_views = dosirak_views;
		this.tan = tan;
		this.dan = dan;
		this.gi = gi;
		this.kcal = kcal;
		this.mainimage = mainimage;
		this.thumbnail = thumbnail;
		this.dosirak_regdate = dosirak_regdate;
	}

	public int getDosirak_postnum() {
		return dosirak_postnum;
	}

	public void setDosirak_postnum(int dosirak_postnum) {
		this.dosirak_postnum = dosirak_postnum;
	}

	public String getDosirak_name() {
		return dosirak_name;
	}

	public void setDosirak_name(String dosirak_name) {
		this.dosirak_name = dosirak_name;
	}

	public String getDosirak_title() {
		return dosirak_title;
	}

	public void setDosirak_title(String dosirak_title) {
		this.dosirak_title = dosirak_title;
	}

	public String getDosirak_content() {
		return dosirak_content;
	}

	public void setDosirak_content(String dosirak_content) {
		this.dosirak_content = dosirak_content;
	}

	public String getDosirak_delivery() {
		return dosirak_delivery;
	}

	public void setDosirak_delivery(String dosirak_delivery) {
		this.dosirak_delivery = dosirak_delivery;
	}

	public int getDosirak_price() {
		return dosirak_price;
	}

	public void setDosirak_price(int dosirak_price) {
		this.dosirak_price = dosirak_price;
	}

	public int getDosirak_num() {
		return dosirak_num;
	}

	public void setDosirak_num(int dosirak_num) {
		this.dosirak_num = dosirak_num;
	}

	public int getDosirak_afternum() {
		return dosirak_afternum;
	}

	public void setDosirak_afternum(int dosirak_afternum) {
		this.dosirak_afternum = dosirak_afternum;
	}

	public int getDosirak_views() {
		return dosirak_views;
	}

	public void setDosirak_views(int dosirak_views) {
		this.dosirak_views = dosirak_views;
	}

	public int getTan() {
		return tan;
	}

	public void setTan(int tan) {
		this.tan = tan;
	}

	public int getDan() {
		return dan;
	}

	public void setDan(int dan) {
		this.dan = dan;
	}

	public int getGi() {
		return gi;
	}

	public void setGi(int gi) {
		this.gi = gi;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public String getmainimage() {
		return mainimage;
	}

	public void setmainimage(String mainimage) {
		this.mainimage = mainimage;
	}

	public String getthumbnail() {
		return thumbnail;
	}

	public void setthumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Date getDosirak_regdate() {
		return dosirak_regdate;
	}

	public void setDosirak_regdate(Date dosirak_regdate) {
		this.dosirak_regdate = dosirak_regdate;
	}

}

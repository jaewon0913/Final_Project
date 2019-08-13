package com.khfinal.mvc.boxorder.dto;

import java.util.Date;

public class BoxorderDto {

	private int orderseq;
	private String ordernumber;
	private String member_id;
	private String member_name;
	private String member_level;
	private String dosirak_title;
	private String dosirak_delivery;
	private String dish1;
	private String dish2;
	private String dish3;
	private String dish4;
	private String dish5;
	private String dish6;
	private String dish7;
	private int tan;
	private int dan;
	private int gi;
	private int kcal;
	private int price;
	private String order_regdate;
	private String qrcode;
	private String receivechk;
	private String custom_status;
	
	public BoxorderDto() {}

	public BoxorderDto(int orderseq, String ordernumber, String member_id, String member_name, String member_level,
			String dosirak_title, String dosirak_delivery, String dish1, String dish2, String dish3, String dish4,
			String dish5, String dish6, String dish7, int tan, int dan, int gi, int kcal, int price, String order_regdate,
			String qrcode, String receivechk, String custom_status) {
		super();
		this.orderseq = orderseq;
		this.ordernumber = ordernumber;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_level = member_level;
		this.dosirak_title = dosirak_title;
		this.dosirak_delivery = dosirak_delivery;
		this.dish1 = dish1;
		this.dish2 = dish2;
		this.dish3 = dish3;
		this.dish4 = dish4;
		this.dish5 = dish5;
		this.dish6 = dish6;
		this.dish7 = dish7;
		this.tan = tan;
		this.dan = dan;
		this.gi = gi;
		this.kcal = kcal;
		this.price = price;
		this.order_regdate = order_regdate;
		this.qrcode = qrcode;
		this.receivechk = receivechk;
		this.custom_status = custom_status;
	}

	public int getOrderseq() {
		return orderseq;
	}

	public void setOrderseq(int orderseq) {
		this.orderseq = orderseq;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
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

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public String getDosirak_title() {
		return dosirak_title;
	}

	public void setDosirak_title(String dosirak_title) {
		this.dosirak_title = dosirak_title;
	}

	public String getDosirak_delivery() {
		return dosirak_delivery;
	}

	public void setDosirak_delivery(String dosirak_delivery) {
		this.dosirak_delivery = dosirak_delivery;
	}

	public String getDish1() {
		return dish1;
	}

	public void setDish1(String dish1) {
		this.dish1 = dish1;
	}

	public String getDish2() {
		return dish2;
	}

	public void setDish2(String dish2) {
		this.dish2 = dish2;
	}

	public String getDish3() {
		return dish3;
	}

	public void setDish3(String dish3) {
		this.dish3 = dish3;
	}

	public String getDish4() {
		return dish4;
	}

	public void setDish4(String dish4) {
		this.dish4 = dish4;
	}

	public String getDish5() {
		return dish5;
	}

	public void setDish5(String dish5) {
		this.dish5 = dish5;
	}

	public String getDish6() {
		return dish6;
	}

	public void setDish6(String dish6) {
		this.dish6 = dish6;
	}

	public String getDish7() {
		return dish7;
	}

	public void setDish7(String dish7) {
		this.dish7 = dish7;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrder_regdate() {
		return order_regdate;
	}

	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getReceivechk() {
		return receivechk;
	}

	public void setReceivechk(String receivechk) {
		this.receivechk = receivechk;
	}

	public String getCustom_status() {
		return custom_status;
	}

	public void setCustom_status(String custom_status) {
		this.custom_status = custom_status;
	}

	

	
	
}

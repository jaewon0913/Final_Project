package com.khfinal.mvc.reservation.dto;

import java.util.Date;

public class ReservationDto {

	private int reservationseq;
	private String dayofweek;
	private Date res_regdate;
	private String order_status;
	private String member_email;
	private String member_id;
	private String member_name;
	private String member_level;
	private String dosirak_title;
	private String dosirak_delivery;
	private int dosirak_price;
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
	private String custom_status;
	
	public ReservationDto() {}

	public ReservationDto(int reservationseq, String dayofweek, Date res_regdate, String order_status,
			String member_email, String member_id, String member_name, String member_level, String dosirak_title,
			String dosirak_delivery, int dosirak_price, String dish1, String dish2, String dish3, String dish4,
			String dish5, String dish6, String dish7, int tan, int dan, int gi, int kcal, String custom_status) {
		super();
		this.reservationseq = reservationseq;
		this.dayofweek = dayofweek;
		this.res_regdate = res_regdate;
		this.order_status = order_status;
		this.member_email = member_email;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_level = member_level;
		this.dosirak_title = dosirak_title;
		this.dosirak_delivery = dosirak_delivery;
		this.dosirak_price = dosirak_price;
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
		this.custom_status = custom_status;
	}

	public int getReservationseq() {
		return reservationseq;
	}

	public void setReservationseq(int reservationseq) {
		this.reservationseq = reservationseq;
	}

	public String getDayofweek() {
		return dayofweek;
	}

	public void setDayofweek(String dayofweek) {
		this.dayofweek = dayofweek;
	}

	public Date getRes_regdate() {
		return res_regdate;
	}

	public void setRes_regdate(Date res_regdate) {
		this.res_regdate = res_regdate;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
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

	public int getDosirak_price() {
		return dosirak_price;
	}

	public void setDosirak_price(int dosirak_price) {
		this.dosirak_price = dosirak_price;
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

	public String getCustom_status() {
		return custom_status;
	}

	public void setCustom_status(String custom_status) {
		this.custom_status = custom_status;
	}

	
	
	
}

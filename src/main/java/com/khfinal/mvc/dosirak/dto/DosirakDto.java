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
   private int tan;
   private int dan;
   private int gi;
   private int kcal;
   private String image1;
   private String image2;
   private String image3;
   private Date dosirak_regdate;
   
   public DosirakDto() {}

   public DosirakDto(int dosirak_postnum, String dosirak_name, String dosirak_title, String dosirak_content,
         String dosirak_delivery, int dosirak_price, int dosirak_num, int dosirak_afternum, int tan, int dan, int gi,
         int kcal, String image1, String image2, String image3, Date dosirak_regdate) {
      super();
      this.dosirak_postnum = dosirak_postnum;
      this.dosirak_name = dosirak_name;
      this.dosirak_title = dosirak_title;
      this.dosirak_content = dosirak_content;
      this.dosirak_delivery = dosirak_delivery;
      this.dosirak_price = dosirak_price;
      this.dosirak_num = dosirak_num;
      this.dosirak_afternum = dosirak_afternum;
      this.tan = tan;
      this.dan = dan;
      this.gi = gi;
      this.kcal = kcal;
      this.image1 = image1;
      this.image2 = image2;
      this.image3 = image3;
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

   public String getImage1() {
      return image1;
   }

   public void setImage1(String image1) {
      this.image1 = image1;
   }

   public String getImage2() {
      return image2;
   }

   public void setImage2(String image2) {
      this.image2 = image2;
   }

   public String getImage3() {
      return image3;
   }

   public void setImage3(String image3) {
      this.image3 = image3;
   }

   public Date getDosirak_regdate() {
      return dosirak_regdate;
   }

   public void setDosirak_regdate(Date dosirak_regdate) {
      this.dosirak_regdate = dosirak_regdate;
   }
   
   
}
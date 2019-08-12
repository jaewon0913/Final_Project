DROP TABLE DOSIRAK;

CREATE SEQUENCE DOSIRAK_POSTNUM;

CREATE TABLE DOSIRAK(
	DOSIRAK_POSTNUM NUMBER PRIMARY KEY,
	DOSIRAK_NAME VARCHAR2(100) NOT NULL,
	DOSIRAK_TITLE VARCHAR2(2000) NOT NULL,
	DOSIRAK_CONTENT VARCHAR2(4000) NOT NULL,
	DOSIRAK_DELIVERY VARCHAR2(100) NOT NULL,
	DOSIRAK_PRICE NUMBER NOT NULL,
	DOSIRAK_NUM NUMBER NOT NULL,
	DOSIRAK_AFTERNUM NUMBER,
	TAN NUMBER NOT NULL,
	DAN NUMBER NOT NULL,
	GI NUMBER NOT NULL,
	KCAL NUMBER NOT NULL,
	IMAGE1 VARCHAR2(4000),
	IMAGE2 VARCHAR2(4000),
	IMAGE3  VARCHAR2(4000),
	DOSIRAK_REGDATE DATE NOT NULL
);

INSERT INTO DOSIRAK 
VALUES(DOSIRAK_POSTNUM.NEXTVAL,'건강도시락','건강도시락TITLE','CONTENT내용',
'AM',4500,1,0,200,300,400,555,'IMAGEURL1','IMAGEURL2','IMAGEURL3',SYSDATE);


DROP TABLE BOXORDER;
DROP SEQUENCE ORDERSEQ;

CREATE SEQUENCE ORDERSEQ;

SELECT * FROM BOXORDER;

CREATE TABLE BOXORDER(
	ORDERSEQ NUMBER NOT NULL,
	ORDERNUMBER VARCHAR2(1000) NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	MEMBER_NAME VARCHAR2(500) NOT NULL,
	MEMBER_LEVEL VARCHAR2(50) NOT NULL,
	DOSIRAK_TITLE VARCHAR2(2000),
	DOSIRAK_DELIVERY VARCHAR2(100) NOT NULL,
	DISH1 VARCHAR2(100),
	DISH2 VARCHAR2(100),
	DISH3 VARCHAR2(100),
	DISH4 VARCHAR2(100),
	DISH5 VARCHAR2(100),
	DISH6 VARCHAR2(100),
	DISH7 VARCHAR2(100),
	TAN NUMBER NOT NULL,
	DAN NUMBER NOT NULL,
	GI NUMBER NOT NULL,
	KCAL NUMBER NOT NULL,
	PRICE NUMBER NOT NULL,
	ORDER_REGDATE DATE NOT NULL,
	QRCODE VARCHAR2(4000),
	RECEIVECHK VARCHAR2(10) NOT NULL,
	CUSTOM_STATUS VARCHAR2(2) NOT NULL
);

INSERT INTO BOXORDER VALUES(ORDERSEQ.NEXTVAL,'aa','aa','USER','흰 쌀밥','단무지','김치','돼지갈비','장조림','새우튀김','된장국'
,300,400,500,5600,SYSDATE,'Y');

SELECT * FROM BOXORDER;

SELECT * FROM BOXORDER WHERE MEMBER_ID = 'aa';
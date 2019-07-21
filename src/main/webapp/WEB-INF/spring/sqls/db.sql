DROP TABLE MEMBER;
DROP SEQUENCE MEMBERSEQ;

CREATE SEQUENCE MEMBERSEQ;

CREATE TABLE MEMBER(
	MEMBER_SEQ NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	MEMBER_PW VARCHAR2(1000) NOT NULL,
	MEMBER_NAME VARCHAR2(500) NOT NULL,
	MEMBER_EMAIL VARCHAR2(1000) NOT NULL,
	MEMBER_PHONE VARCHAR2(500) NOT NULL,
	MEMBER_ADDRESS VARCHAR2(4000) NOT NULL,
	MEMBER_ENABLED VARCHAR2(2) NOT NULL,
	MEMBER_REGDATE DATE NOT NULL
);

SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES (MEMBERSEQ.NEXTVAL, 'admin', 'admin', '관리자' , 'admin@admin.com', '010-1111-1111', '서울 강남구', 'Y' , SYSDATE);
INSERT INTO MEMBER VALUES (MEMBERSEQ.NEXTVAL, 'jaewon', '1111', '황재원' , 'jaewon@jaewon.com', '010-2222-2222', '인천 계양구' , 'Y', SYSDATE);
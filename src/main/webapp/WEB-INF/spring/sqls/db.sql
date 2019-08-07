DROP TABLE MEMBER;
DROP TABLE authorities_member;

CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(500) PRIMARY KEY,
	MEMBER_PW VARCHAR2(1000) NOT NULL,
	MEMBER_NAME VARCHAR2(500) NOT NULL,
	MEMBER_PHONE VARCHAR2(500) NOT NULL,
	MEMBER_ADDRESS VARCHAR2(4000) NOT NULL,
	MEMBER_SUBWAY VARCHAR2(500) NOT NULL,
	MEMBER_EMAIL VARCHAR2(1000) NOT NULL,
	MEMBER_ENABLED INTEGER NOT NULL,
	MEMBER_LEVEL VARCHAR2(50) NOT NULL,
	MEMBER_REGDATE DATE NOT NULL
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBER_ID is '아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PW is '비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_ENABLED is '계정사용여부';

CREATE TABLE authorities_member(
		MEMBER_ID                      		VARCHAR2(500)		 NOT NULL,
		authority                     		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE authorities_member is '권한';
COMMENT ON COLUMN authorities_member.MEMBER_ID is '회원아이디';
COMMENT ON COLUMN authorities_member.authority is '권한';

ALTER TABLE authorities_member ADD CONSTRAINT IDX_authorities_member_PK PRIMARY KEY (MEMBER_ID, authority);
ALTER TABLE authorities_member ADD CONSTRAINT IDX_authorities_member_FK0 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID);


INSERT INTO MEMBER VALUES ('user', '1','신희수','010-1111-1111','인천','부평역','이메일',1,'user',sysdate);
INSERT INTO MEMBER VALUES ('admin', '1','관리자','010-2222-1111','서울','강남역','관리자이메일',1,'admin',sysdate);

-- 회원 권한 입력
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('user', 'ROLE_USER');
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('admin', 'ROLE_USER');





SELECT * FROM MEMBER;
SELECT * FROM authorities_member;

DELETE FROM MEMBER WHERE MEMBER_ID = '1090687081';
DELETE FROM authorities_member WHERE member_id='1090687081';
INSERT INTO MEMBER VALUES ('admin', 'admin', '관리자', '010-1111-1111', '서울 강남구', '강남구', '1212081@naver.com', 'Y', 'admin' ,SYSDATE);


UPDATE MEMBER SET MEMBER_PW = '2222', MEMBER_PHONE = '1111', MEMBER_EMAIL = '1111',
		MEMBER_ADDRESS = '1111', MEMBER_SUBWAY = '1111' 
		WHERE MEMBER_ID = 'admin'
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
	MEMBER_REGDATE DATE NOT NULL,
	MEMBER_PW_CHANGE DATE
);

--비밀번호 컬럼 추가구문(기존 DB있으면 추가하면됨)
ALTER TABLE MEMBER ADD MEMBER_PW_CHANGE DATE;

UPDATE MEMBER SET member_email = 'gmltn0911@gmail.com' WHERE MEMBER_ID='admin';
SELECT * FROM MEMBER;

SELECT sysdate - TO_CHAR(MEMBER_REGDATE, 'YYYYMMDD')
FROM MEMBER;

SELECT trunc(sysdate - member_regdate) FROM MEMBER;

SELECT * FROM MEMBER 
WHERE trunc(sysdate - member_pw_change) >=12;

SELECT * FROM MEMBER;

--비밀번호 UPDATE
UPDATE MEMBER SET MEMBER_PW_CHANGE=MEMBER_REGDATE WHERE MEMBER_ID='bb';
--회원탈퇴 UPDATE
UPDATE MEMBER SET MEMBER_ENABLED=1 WHERE MEMBER_ID='aa';

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
INSERT INTO MEMBER VALUES ('admin', '1','관리자','010-2222-1111','서울','강남역','jaewon9937@gmail.com',1,'admin',sysdate,sysdate);
INSERT INTO MEMBER VALUES ('yumi', 'aaaa','홍유미','010-2222-1111','서울','강남역','관리자이메일',1,'admin',sysdate);

-- 회원 권한 입력
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('user', 'ROLE_USER');
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authorities_member (MEMBER_ID, authority) VALUES ('admin', 'ROLE_USER');





SELECT * FROM MEMBER;
SELECT * FROM authorities_member;

DELETE FROM MEMBER WHERE MEMBER_ID = 'admin';
DELETE FROM authorities_member WHERE member_id='1090687081';
DELETE FROM MEMBER WHERE MEMBER_NAME = 'test';
DELETE FROM authorities_member WHERE member_id='bb';
DELETE FROM MEMBER WHERE member_id='bb';
INSERT INTO MEMBER VALUES ('admin', 'admin', '관리자', '010-1111-1111', '서울 강남구', '강남구', '1212081@naver.com', 'Y', 'admin' ,SYSDATE);


UPDATE MEMBER SET MEMBER_PW = '$2a$10$p3msK7EEMvyl.TrKWDZnO.8sEb3nvJk54o5nGmwl6PcXoKKVULQu6', MEMBER_PHONE = '1111', MEMBER_EMAIL = '123',
		MEMBER_ADDRESS = '1111', MEMBER_SUBWAY = '1111' 
		WHERE MEMBER_ID = 'qq';
		
		
		
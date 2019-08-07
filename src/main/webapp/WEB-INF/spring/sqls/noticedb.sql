DROP TABLE NOTICEBOARD;
DROP SEQUENCE NOTICESEQ;

CREATE SEQUENCE NOTICESEQ;

CREATE TABLE NOTICEBOARD(
NOTICE_POSTNUM NUMBER PRIMARY KEY,
MEMBER_ID VARCHAR2(500) NOT NULL,
NOTICE_TITLE VARCHAR2(500) NOT NULL,
NOTICE_CONTENT VARCHAR2(1000) NOT NULL,
NOTICE_REGDATE DATE NOT NULL,
NOTICE_VIEWS NUMBER
);

SELECT * FROM NOTICEBOARD;

INSERT INTO NOTICEBOARD VALUES (NOTICESEQ.NEXTVAL, '신은정','TEST', 'TEST1234',SYSDATE,0);
INSERT INTO NOTICEBOARD VALUES (NOTICESEQ.NEXTVAL, 'user','TEST', 'TEST1234',SYSDATE,0);

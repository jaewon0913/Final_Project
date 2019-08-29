DROP TABLE DOSIRAK;
DROP SEQUENCE DOSIRAK_POSTNUM;

CREATE SEQUENCE DOSIRAK_POSTNUM;
CREATE TABLE DOSIRAK(
   DOSIRAK_POSTNUM NUMBER PRIMARY KEY,		-- 도시락 번호
   DOSIRAK_NAME VARCHAR2(100) NOT NULL,		-- 도시락 이름
   DOSIRAK_TITLE VARCHAR2(2000) NOT NULL,	-- 제목
   DOSIRAK_CONTENT VARCHAR2(4000) NOT NULL,	-- 내용
   DOSIRAK_DELIVERY VARCHAR2(100) NOT NULL,	-- 주문시간
   DOSIRAK_PRICE NUMBER NOT NULL,			-- 가격
   DOSIRAK_NUM NUMBER NOT NULL,				-- 갯수
   DOSIRAK_AFTERNUM NUMBER,					-- 주문량
   DOSIRAK_VIEWS NUMBER,					-- 조회수
   TAN NUMBER NOT NULL,						-- 탄수화물
   DAN NUMBER NOT NULL,						-- 단백질
   GI NUMBER NOT NULL,						-- 지방
   KCAL NUMBER NOT NULL,					-- 칼로리
   MAINIMAGE CLOB,							-- 메인이미지
   THUMBNAIL CLOB,		
   -- 썸네일이미지
   DOSIRAK_REGDATE DATE NOT NULL			-- 날짜
);

SELECT * FROM DOSIRAK;

SELECT *
      FROM (SELECT ROWNUM AS RNUM, P.*
      FROM ( SELECT *
      FROM DOSIRAK
      ORDER BY DOSIRAK_POSTNUM
      ) P
      )
INSERT INTO DOSIRAK
VALUES(DOSIRAK_POSTNUM.NEXTVAL,'건강도시락1','건강도시락TITLE1','CONTENT내용1',
'PM',4500,1,0,0,200,300,400,555,'MAINIMAGE','THUMBNAIL',SYSDATE);

SELECT * FROM (SELECT * FROM DOSIRAK ORDER BY DOSIRAK_VIEWS DESC) WHERE ROWNUM<=3
	
SELECT ROW_NUMBER() OVER(ORDER BY DOSIRAK_VIEWS DESC) AS BESTNUM,DOSIRAK_TITLE,MAINIMAGE,DOSIRAK_CONTENT 
      FROM (SELECT * FROM DOSIRAK ORDER BY DOSIRAK_VIEWS DESC) 
      WHERE ROWNUM<=3

DELETE FROM DOSIRAK;
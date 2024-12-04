CREATE SEQUENCE visit_seq  -- 시퀀스이름
   START WITH 1             -- 시작을 1로 설정
   INCREMENT BY 1          -- 증가 값을 1씩 증가
   NOMAXVALUE             -- 최대 값이 무한대
   NOCACHE
   NOCYCLE;

CREATE table VISIT (
    NO       NUMBER(5,0) NOT NULL,
    WRITER   VARCHAR2(20) NOT NULL,
    MEMO     VARCHAR2(4000) NOT NULL,
    REGDATE  DATE NOT NULL
);
ALTER TABLE VISIT ADD CONSTRAINT VISIT_NO_PK PRIMARY KEY(NO); 
INSERT INTO VISIT VALUES(VISIT_seq.NEXTVAL, 'KDJ', '처음으로 메모장입력', SYSDATE);
SELECT * FROM VISIT;
select * from visit order by no desc;

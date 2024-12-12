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

-- 김민석 회원가입 테이블
create table ACCOUNT(
    NO      NUMBER(5,0) NOT NULL,
    NAME    VARCHAR2(20) NOT NULL,
    ID      VARCHAR2(4000) NOT NULL,
    PWD     VARCHAR2(4000) NOT NULL,
    REGDATE DATE NOT NULL
);
alter table ACCOUNT add constraint ACCOUNT_NO_PK primary key (NO);
alter table ACCOUNT add constraint ACCOUNT_ID_UQ UNIQUE(ID);

INSERT INTO ACCOUNT VALUES((select NVL(max(no),0)+1 from ACCOUNT),'AAA','AAA','AAA',SYSDATE);
SELECT PWD, NAME FROM ACCOUNT WHERE ID = 'kdj';
SELECT * FROM ACCOUNT;
commit;

-- 장표 회원가입 테이블
CREATE TABLE SIGNUP (
    ID VARCHAR2(12) ,                         -- 아이디 (4~12자의 영문 대소문자와 숫자)
    PWD VARCHAR2(12) NOT NULL,                -- 비밀번호 (4~12자의 영문 대소문자와 숫자)
    EMAIL VARCHAR2(100) NOT NULL,             -- 이메일 주소
    NAME VARCHAR2(50) NOT NULL,               -- 이름
    BIRTH NUMBER(10)                          -- 생년월일 (20001010)
);
ALTER TABLE SIGNUP ADD CONSTRAINT SIGNUP_ID_PK PRIMARY KEY(ID);
select * from signup; 

-- jsp로그인테이블
CREATE TABLE LOGIN2(
    ID VARCHAR2(12),
    PWD VARCHAR2(12) NOT NULL
);
ALTER TABLE LOGIN2 ADD CONSTRAINT LOGIN2_ID_PK PRIMARY KEY(ID);

-- 김동욱 login 테이블
drop table LOGIN;
CREATE table LOGIN (
    ID    VARCHAR2(30) not null,
    PASS  VARCHAR2(30) NOT NULL,
    name  varchar2(30) not null
);
alter table login add constraint login_id_pk primary key(id);
select * from login;

-- TEMP MEMBER
 CREATE TABLE  TEMPMEMBER (
	ID VARCHAR2(20) , 
	PASSWD VARCHAR2(20), 
	NAME VARCHAR2(20), 
	MEM_NUM1 VARCHAR2(6), 
	MEM_NUM2 VARCHAR2(7), 
	E_MAIL VARCHAR2(30), 
	PHONE VARCHAR2(30), 
	ZIPCODE VARCHAR2(7), 
	ADDRESS VARCHAR2(60), 
	JOB VARCHAR2(30)
   );
alter table TEMPMEMBER add constraint TEMPMEMBER_ID_PK primary key(ID);

insert into TEMPMEMBER 
values('aaaa', '1111', '홍길동', '123456', '7654321', 'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
insert into TEMPMEMBER 
values('bbbb', '1111', '홍길동', '123456', '7654321', 'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
insert into TEMPMEMBER 
values('cccc', '1111', '홍길동', '123456', '7654321', 'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
COMMIT;
SELECT * FROM TEMPMEMBER;

-- 학생관리 테이블
CREATE table STUDENT (
    ID         VARCHAR2(12)  NOT NULL,
    PASS       VARCHAR2(12)  NOT NULL,
    NAME       VARCHAR2(10)  NOT NULL,
    PHONE1     VARCHAR2(3)   NOT NULL,
    PHONE2     VARCHAR2(4)   NOT NULL,
    PHONE3     VARCHAR2(4)   NOT NULL,
    EMAIL      VARCHAR2(30)  NOT NULL,
    ZIPCODE    VARCHAR2(7)   NOT NULL,
    ADDRESS1   VARCHAR2(120) NOT NULL,
    ADDRESS2   VARCHAR2(50)  NOT NULL
);

alter table STUDENT add constraint STUDENT_ID_PK primary key(ID);

-- 우편번호 테이블
create table zipcode  (
   seq                  NUMBER(10)  not null,
   zipcode              VARCHAR2(50),
   sido                 VARCHAR2(50),
   gugun                VARCHAR2(50),
   dong                 VARCHAR2(50),
   bunji                VARCHAR2(50)
);
 
alter table zipcode add constraint zipcode_seq_PK primary key(seq);
alter table zipcode modify bunji varchar2(100); 
describe zipcode;

select * from zipcode; 
SELECT count(*) as count FROM STUDENT WHERE ID = ?;
SELECT count(*) as count FROM STUDENT WHERE ID = 'aaaa';
select * from student;




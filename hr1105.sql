-- 테이블설계하기(사원번호, 사원명, 급여) :DDL
-- class EMP01{
--    public int no; 
--    public String name; 
--    public double salary; 
-- }
create table EMP01(
    no  NUMBER(4),
    name VARCHAR2(20) not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    CONSTRAINT emp01_name_uk UNIQUE(name)
);
<<<<<<< HEAD
-- 테이블 정보구하기
select * from tab;
-- 테이블 삭제하기 ddl
drop table emp01;
-- 휴지통보기
select * from recyclebin;
purge recyclebin;
-- 휴지통 복원
flashback table emp01 to before drop;
-- 테이블 복사(제약조건복사안됨)
desc employees;
select count(*) from employees; 
create table emple02 as select * from employees;
desc emple02;
select count(*) from emple02;
-- 제약조건 걸기 primary key , unique
alter table emple02 add constraint emple02_id_pk primary key(employee_id); 
alter table emple02 add constraint emple02_email_uk UNIQUE(email); 
-- 제약조건 삭제하기 unique
alter table emple02 drop CONSTRAINT emple02_email_uk;
-- 제약조건 정보 검색
select * from user_constraints;
select table_name, constraint_name, constraint_type from user_constraints where table_name = upper('emple02');
-- 컬럼추가 emp01 
alter table emp01 add job varchar2(10) not null; 
desc emp01; 
-- 컬럼제거 emp01
alter table emp01 drop column job;
-- 컬럼변경(주의: 기존값이 존재할때 생각을 할것 -> 타입변경불가, 사이즈 큰것으로 변경가능)
alter table emp01 modify job number(10) default 0; 
-- 컴럼이름변경
alter table emp01 rename column job  to job2;
alter table emp01 rename column job2  to job;

-- 테이블명을 변경 emp01 ->emp02 ddl(create, alter, drop, rename, truncate)
rename emp01 to emp02;
select * from tab; 

-- 테이블설계
create table CUSTOMER(
    code char(7) NOT NULL,
    name VARCHAR2(10)NOT NULL,
    gender CHAR(1) NOT NULL,
    birth CHAR(8) NOT NULL,
    pone VARCHAR2(16),
    email VARCHAR2(30),
    point NUMBER(10) default 0
);

alter table CUSTOMER ADD CONSTRAINT CUSTOMER_code_pk PRIMARY KEY(code);
alter table CUSTOMER ADD CONSTRAINT CUSTOMER_email_uk UNIQUE(email);
alter table CUSTOMER ADD CONSTRAINT CUSTOMER_gender_ck check(gender in ('M','F'));

select * from user_constraints where table_name = 'CUSTOMER';




=======
>>>>>>> 65ef018985bea3c8b116e61e6ffe704d7050d9d1

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

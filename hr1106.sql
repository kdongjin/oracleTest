select employee_id, first_name, E.department_id, salary,
        decode(upper(D.department_name),upper('Marketing'), salary*1.05, upper('Purchasing'), salary*1.1, 
        upper('Human Resources'), salary*1.15, upper('IT'), salary*1.2) as salary2
from departments D inner join employees E on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'))
order by salary2 DESC;
-- employees 복사
create table emp03 
as
select * from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30; 
rollback;

-- 모든 사원의 급여를 10% 인상한다.
update emp03 set salary = salary * 1.1;  
ROLLBACK;

-- 입사일을 오늘로 수정한다
update emp03 set hire_date = sysdate; 
rollback;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET DEPARTMENT_ID =30 WHERE DEPARTMENT_ID =10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
UPDATE EMP03 SET SALARY = SALARY * 1.1 WHERE SALARY >= 3000;

select employee_id, first_name, E.department_id, salary,
        decode(upper(D.department_name),upper('Marketing'), salary*1.05, upper('Purchasing'), salary*1.1, 
        upper('Human Resources'), salary*1.15, upper('IT'), salary*1.2) as salary2
from departments D inner join employees E on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'))
order by salary2 DESC;
-- employees 복사
create table emp03 
as
select * from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30; 
rollback;

-- 모든 사원의 급여를 10% 인상한다.
update emp03 set salary = salary * 1.1;  
ROLLBACK;

-- 입사일을 오늘로 수정한다
update emp03 set hire_date = sysdate; 
rollback;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET DEPARTMENT_ID =30 WHERE DEPARTMENT_ID =10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
UPDATE EMP03 SET SALARY = SALARY * 1.1 WHERE SALARY >= 3000;



select * from emp03 where first_name = 'Susan';
select * from emp03 where department_id = 30;
select * from emp03 where department_id = 40;
select * from customer;
SELECT * FROM USER_CONSTRAINTS;
select * from customer;
select * from emp03 where department_id = 40;
select * from emp03 where department_id = 30;
select * from emp03 where first_name = 'Susan';
-- employees 복사
create table emp03 
as
select * from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30; 
rollback;

-- 모든 사원의 급여를 10% 인상한다.
update emp03 set salary = salary * 1.1;  
ROLLBACK;

-- 입사일을 오늘로 수정한다
update emp03 set hire_date = sysdate; 
rollback;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET DEPARTMENT_ID =30 WHERE DEPARTMENT_ID =10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
UPDATE EMP03 SET SALARY = SALARY * 1.1 WHERE SALARY >= 3000;

select employee_id, first_name, E.department_id, salary,
        decode(upper(D.department_name),upper('Marketing'), salary*1.05, upper('Purchasing'), salary*1.1, 
        upper('Human Resources'), salary*1.15, upper('IT'), salary*1.2) as salary2
from departments D inner join employees E on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'))
order by salary2 DESC;

select employee_id, first_name, job_id, salary, E.department_id, D.department_name,
        case
        when upper(D.department_name) = upper('Marketing') then salary*1.05
        when upper(D.department_name) = upper('Purchasing') then salary*1.10
        when upper(D.department_name) = upper('Human Resources') then salary*1.15
        when upper(D.department_name) = upper('IT') then salary*1.20
        end NEWSALARY
from employees E inner join departments D on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'))
order by NEWSALARY DESC;
UPDATE EMP03 SET SALARY = SALARY * 1.1 WHERE SALARY >= 3000;
select employee_id, first_name, salary, job_id, case
        when B.DEPARTMENT_name = 'Marketing' then salary*1.05
        when B.DEPARTMENT_name= 'Purchasing' then salary*1.10
        when B.DEPARTMENT_name= 'Human Resources' then salary*1.15
        when DEPARTMENT_name = 'IT' then salary*1.20
end NEWSALARY
from employees A inner join departments B on A.department_id = B.department_id 
WHERE A.DEPARTMENT_id IN(20,30,40,60);

-- 두 테이블을 관계설정하기
CREATE TABLE DEPT01(
    NO VARCHAR2(8),
    NAME VARCHAR2(10) NOT NULL,
    REGION VARCHAR2(10)
);
ALTER TABLE DEPT01 ADD CONSTRAINT DEPT01_NO_PK PRIMARY KEY(NO);

CREATE TABLE MEMBER(
    NO NUMBER(8),
    NAME VARCHAR2(10) NOT NULL,
    JOB_ID VARCHAR2(10),
    DEPT_NO VARCHAR2(8)
);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO);

-- 입력
INSERT INTO DEPT01 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT01 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT01 VALUES(40,'OPERATIONS','BOSTON');
SELECT * FROM DEPT01;

INSERT INTO MEMBER VALUES(7499,'ALLEN','SALESMAN',30);
INSERT INTO MEMBER VALUES(7566,'JONES','MANAGER',40);
SELECT * FROM MEMBER;

DELETE FROM MEMBER WHERE DEPT_NO = 40;
DELETE FROM DEPT01 WHERE NO = 40;

ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_DEPT_NO_FK;
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO)ON DELETE CASCADE;

--
select * from user_ind_columns where table_name = upper('member');

desc employees;
select * from user_constraints where table_name = upper('employees');
select  * from employees;
select * from employees where employee_id = 100;










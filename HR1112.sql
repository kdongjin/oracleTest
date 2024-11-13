-- susan 부서아이디 보기
select department_id from employees where first_name = 'Susan';

-- 부서테이블에서 40번 부서명을 조회
select department_name from departments where department_id = 40; 

-- susan 소속되어 있는 부서명을 검색하시오.
select * from employees where first_name = 'Susan';
select * from departments where department_id = 40;

select E.first_name, D.department_name from departments D inner join employees E on D.department_id = E.department_id 
where upper(first_name) = upper('Susan');
-- 단일행은 비교, 크기 , 연산이 가능하다.
-- 다중행은 비교, 크기, 연산 불가능하다. (IN=OR, ANY=1개이상, ALL=모두, EXISTS=존재하냐)
select department_id from employees where first_name = 'Susan';
select department_id, department_name from departments where department_id = 
(select department_id from employees where first_name = 'Susan');

-- EMPLOYEES 테이블에서 Lex와 같은 부서에(10번부서) 있는 모든 사원의 이름과 
-- 입사일자(형식: 1981-11-17)를 출 력하는 SELECT문을 작성하시오
select department_id from employees where first_name = 'Lex';
select department_id from employees where first_name = 'Lex';
select first_name, to_char(hire_date,'yyyy-mm-dd') from employees 
where department_id = (select department_id from employees where first_name = 'Lex'); 

-- EMPLOYEES 테이블에서 CEO에게 보고하는 직원의 모든 정보를 출력
select * from employees where manager_id = 100;
select * from employees where manager_id = (select employee_id from employees where manager_id is null);
-- 상사가 null 인 사람은 ceo 
select employee_id from employees where manager_id is null;

-- 고용테이블에서 전체 연봉평균
select round(avg(salary)) as salary from employees group by department_id; 
-- 전체 평균연봉보다 높은 직원 정보 출력
select * from employees where salary > (select round(avg(salary)) as salary from employees);
-- 다중행이면 비교 가능할까
select * from employees where  EXISTS (select round(avg(salary)) as salary from employees group by department_id);
select * from employees where 1 = 0;
-- 테이블 복사
drop table imsiTBL CASCADE;
create table imsiTBL
as 
select * from employees where 1 = 1;
select * from imsiTBL;
select * from user_constraints where table_name = upper('imsiTBL'); 

-- 월급 13000 이상인 사람의 부서를 보여주시오.
select distinct department_id from employees where salary >= 13000; 
select * from employees where department_id in (90, 80, 20); 
select * from employees where department_id in 
(select distinct department_id from employees where salary >= 13000); 

-- EMPLOYEES 테이블에서 Susan 또는 Lex 월급
select salary from employees where upper(first_name) = upper('Susan') or  upper(first_name) = upper('Lex');

-- EMPLOYEES 테이블에서 Susan 또는 Lex와 월급이 같은 직원의 이름, 업무, 급여를 출력(Susan, Lex는 제외)
select * from employees where salary in (17000, 6500) and  first_name <> 'Susan' and first_name <> 'Lex';
select * from employees where salary in (17000, 6500) and  first_name not in('Susan', 'Lex');  
select * from employees where salary in 
(select salary from employees where upper(first_name) = upper('Susan') or  upper(first_name) = upper('Lex')) 
and  first_name <> 'Susan' and first_name <> 'Lex';

-- 한명이상으로부터 보고를 받는다 = 나는 매니저로 등록되어있다.  null = ceo 
select distinct manager_id from employees where manager_id is not null or manager_id is null;    
select distinct manager_id as "상사"from employees;
-- 한 명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 이름, 업무, 부서번호를 출력
select employee_id, first_name, job_id, department_id from employees 
where manager_id in (select distinct manager_id from employees); 

-- EMPLOYEES 테이블에서 Accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름, 업무명
select first_name, job_id from employees where job_id like '%Account';
select first_name, job_id from employees where job_id like '%AC';
select first_name, job_id from employees where department_id = 110;
select department_id from departments where department_name = 'Accounting';
select distinct job_id from employees where department_id = 110; 

select first_name, job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in ('AC_MGR', 'AC_ACCOUNT');

select first_name, job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting') 
and job_id in (select distinct job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting'));

-- department_id = (select department_id from departments where department_name = 'Accounting') => A

select first_name, job_id from employees 
where job_id in (select distinct job_id from employees where department_id =  110);

select first_name, job_id from employees where job_id in (
(select distinct job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting'))); 
 
-- exists
select * from employees where department_id = 10; 

-- 테이블 복사  
drop table emp02; 
create table emp02
as 
select employee_id, first_name from employees;

select * from emp02;

-- 서브쿼리를 이용해서 데이터 복사
-- 구조만 복사 departments 테이블 생성 (DEP01)
DROP TABLE DEP01;
CREATE TABLE DEP01
AS
SELECT * FROM DEPARTMENTS WHERE 1 = 0; 

-- 내용을 서브쿼리를 이용해서 저장하시오.
-- INSERT INTO DEP01(컬럼명...) VALUES(컬럼값...)
INSERT INTO DEP01 (SELECT * FROM DEPARTMENTS); 
INSERT INTO DEP01 SELECT * FROM DEPARTMENTS; 

-- UPDATA 서브쿼리를 활용한다.
-- 부서 10번에 지역위치를 부서 40번 지역위치로 수정하시오. 
UPDATE DEP01 SET LOCATION_ID = (2400) WHERE DEPARTMENT_ID  = 10;  
UPDATE DEP01 SET LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40)
WHERE DEPARTMENT_ID  = 10;  
SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40; 
SELECT * FROM DEP01;

-- 직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를 출력하되 부서번호가 20번인 직원은 제외한다.
SELECT MIN(SALARY) FROM EMPLOYEES  WHERE JOB_ID = 'ST_MAN';
SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN';

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES 
WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYEES  WHERE JOB_ID = 'ST_MAN') AND DEPARTMENT_ID <> 20
ORDER BY employees.department_id ASC;

select first_name, salary from employees 
where salary > ANY (select salary from employees where job_id = 'ST_MAN') 
and department_id <> 20;

-- EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보 를 출력하는 SELECT문을 작성하시오.
-- 결과에서 Valli는 제외

SELECT job_id, salary FROM EMPLOYEES WHERE FIRST_NAME = 'Valli';
select * from employees where job_id = (SELECT job_id FROM EMPLOYEES WHERE FIRST_NAME = 'Valli')
and salary = (SELECT salary FROM EMPLOYEES WHERE FIRST_NAME = 'Valli')
and first_name  <> 'Valli'; 

select * from employees where job_id=(select job_id from employees where first_name='Valli') 
and salary=(select salary from employees where first_name='Valli') and  first_name <>'Valli';

-- EMPLOYEES 테이블에서 월급이 자신이(‘Valli’) 속한 부서의 평균 월급보다 높은 사원의 부서번호, 이름, 급여를 출력하라
select department_id from employees where first_name = 'Valli';
select  round(avg(salary)) from employees where department_id = 60; 
select * from employees where salary  > 'valli 속한 평균 월급';

select department_id, first_name, salary from employees 
where salary  > (select  round(avg(salary)) from employees where department_id = (
select department_id from employees where first_name = 'Valli'));

select department_id, first_name, salary from employees 
where salary > (select avg(salary) from employees where department_id =
(select department_id from employees where first_name='Valli'));

SELECT FIRST_NAME, JOB_ID, SALARY, HIRE_DATE
FROM EMPLOYEES e
WHERE (JOB_ID, SALARY) IN (
    SELECT JOB_ID, MIN(SALARY)
    FROM EMPLOYEES
    GROUP BY JOB_ID
);

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES e
WHERE e.SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = e.DEPARTMENT_ID
);
-- 업무별 최소급여
select job_id, min(salary) from employees group by job_id;

-- 사원의 이름과 업무, 급여
select first_name, job_id, salary from employees where job_id = 'job_id' and salary = ('job_id 최소급여');

select first_name, job_id, salary from employees 
where(job_id, salary) in (select job_id, min(salary) from employees group by job_id);

select first_name, department_id, salary from employees 
where(department_id, salary) in (select department_id, min(salary) from employees group by department_id);


select e.first_name, d.department_name, e.salary, e.hire_date, e.department_id
from employees e
inner join departments d
on e.department_id=d.department_id
where (e.salary, e.department_id) in (
select min(salary)
from employees 
group by department_id
);

select first_name, salary, hire_date, e.department_id , 
(select min(salary) from employees where department_id = e.department_id group by department_id) from employees e
order by e.department_id desc;
;


select min(salary) from employees where department_id = 10 group by department_id; 







-- 1사원 번호와 사원명(employee)과 부서명(Department)과 부서의 위치를 출력하는 뷰(VIEW_LOC)를 작성
CREATE VIEW VIEW_LOC
AS
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM DEPARTMENTS WHERE 1 = 1;

select employee_id, first_name, department_id  from employees;
select department_id, department_name, location_id from departments;

CREATE or replace VIEW VIEW_LOC
AS
select employee_id, first_name ||' '||last_name as name, E.department_id,department_name, location_id 
from employees E inner join departments D on E.department_id = D.department_id; 

select * from view_loc;

-- 2.	(30번 부서 소속 사원의 이름과 입사일과)(employee) 부서명(department)을 출력하는 뷰(VIEW_DEPT30)를 작성하라
create or replace view view_dept30
as 
select e.first_name, e.hire_date, d.department_name, e.department_id
from employees e inner join departments d on e.department_id = d.department_id
where e.department_id=30;

select * from view_dept30;

--	부서별 최대 급여 정보를 가지는 사원의 정보 뷰(VIEW_DEPT_MAXSAL)를 생성하라
--	부서별 최대 급여 정보를 가지는 뷰(VIEW_DEPT_MAXSAL)를 생성하라
create or replace view view_dept_maxsal
as
select * from employees 
where (department_id, salary) in (select department_id,  max(salary) from employees group by department_id);

select department_id, max(salary) from employees group by department_id;

select * from view_dept_maxsal order by department_id;

-- 급여를 많이 받는 순서대로 10명만 출력하는 뷰(VIEW_SAL_TOP3)와 인라인 뷰로 작성하라.
CREATE VIEW VIEW_SAL_TOP3
AS
SELECT SALARY, FIRST_NAME, employee_id FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT ROWNUM, SALARY, FIRST_NAME, employee_id FROM VIEW_SAL_TOP3 WHERE ROWNUM <= 3;

SELECT rownum, SALARY, FIRST_NAME, employee_id FROM 
(SELECT SALARY, FIRST_NAME, employee_id FROM EMPLOYEES ORDER BY SALARY DESC)  
where rownum <=10; 




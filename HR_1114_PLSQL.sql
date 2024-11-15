-- PL/SQL 
-- Clara 사원의 (직무, 급여, 입사일자, 커미션)(employees), 부서명(departments)을 변수에 대입하여 출력

select job_id, salary, hire_date, commission_pct, depratment_id from employees where first_name = 'Clara';
select department_name, department_id from departments; 

select job_id, salary, hire_date, commission_pct,department_name 
from employees E inner join departments D on E.department_id = D.department_id where first_name = 'Clara';

DECLARE
    VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    VJOB_ID EMPLOYEES.JOB_ID%TYPE;
    VSALARY EMPLOYEES.SALARY%TYPE;
    VHIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
    VCOMMISSION_PCT EMPLOYEES.COMMISSION_PCT%TYPE;
    VDEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, COMMISSION_PCT, DEPARTMENT_NAME
    INTO VFIRST_NAME, VJOB_ID, VSALARY, VHIRE_DATE, VCOMMISSION_PCT, VDEPARTMENT_NAME
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON e.department_id=d.department_id
    WHERE FIRST_NAME = 'Clara';

    DBMS_OUTPUT.PUT_LINE('이름 : '||VFIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('직무 : '||VJOB_ID);
    DBMS_OUTPUT.PUT_LINE('급여 : '||VSALARY);
    DBMS_OUTPUT.PUT_LINE('입사일자 : '||VHIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('커미션 : '||VCOMMISSION_PCT);
    DBMS_OUTPUT.PUT_LINE('부서명 : '||VDEPARTMENT_NAME);
END;
/



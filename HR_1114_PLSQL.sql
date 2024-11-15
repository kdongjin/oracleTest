-- PL/SQL 
-- EMPLOYEES 테이블에 등록된 총사원의 수와
-- 급여의 합, 급여의 평균을 변수에 대입하여 출력하 
DECLARE
    TOTAL_EMPLOYEE NUMBER(4);
    TOTAL_SALARY NUMBER(10);
    AVG_SALARY NUMBER(10);
BEGIN
   SELECT COUNT(EMPLOYEE_ID),SUM(SALARY),ROUND(AVG(SALARY))
   INTO TOTAL_EMPLOYEE,TOTAL_SALARY,AVG_SALARY
   FROM EMPLOYEES;

   DBMS_OUTPUT.PUT_LINE('총사원의 수: '||TOTAL_EMPLOYEE);
   DBMS_OUTPUT.PUT_LINE('급여의 합: '||TOTAL_SALARY);
   DBMS_OUTPUT.PUT_LINE('급여의 평균: '||AVG_SALARY);
END;
/

select count(*), sum(salary), round(avg(salary)) from employees; 



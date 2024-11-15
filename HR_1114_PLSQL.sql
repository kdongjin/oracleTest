-- PL/SQL 
-- departments 에서 반복문을 이용해서 부서 10, 20, 30, 40 정보를 출력하시오.
DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
BEGIN
    FOR I IN 1..9 LOOP
        select * INTO VDEPARTMENTS from departments where department_id = I*10;
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME); 
    END LOOP; 
END;
/

select * from departments where department_id = 10;
select * from departments where department_id = 20;
select * from departments where department_id = 30;
select * from departments where department_id = 40;

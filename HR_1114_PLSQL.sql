-- PL/SQL 
-- employee 테이블에서 임의의 부서번호를 랜덤으로 생성한뒤 , 해당된부서번호 최고연봉을 출력한뒤, 평가하여라(낮음,높음,중간,최고,없음) 
DECLARE
    -- 부서번호, 최고연봉선언
    VNO NUMBER(4);
    VTOP_SALARY NUMBER(12,2);
    VRESULT VARCHAR2(20); 
BEGIN
    --임의의 부서번호 생성하기 (RANDOM)
    VNO := ROUND(DBMS_RANDOM.VALUE(10,110),-1); 
    
    SELECT SALARY INTO VTOP_SALARY
    FROM (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = VNO ORDER BY SALARY DESC)
    WHERE ROWNUM = 1;
    
    -- 평가내리기 1~5000 낮음, 5000~10000 중간, 10000~20000 높음, 20000~ 최고, 없으면 예외처리
    IF(VTOP_SALARY BETWEEN 1  AND 5000 )THEN
       VRESULT := '낮음';
    ELSIF(VTOP_SALARY BETWEEN 5000  AND 10000 )THEN
       VRESULT := '중간';
    ELSIF(VTOP_SALARY BETWEEN 10000  AND 20000 )THEN
       VRESULT := '높음';
    ELSE
       VRESULT := '최고';
    END IF; 
    
    DBMS_OUTPUT.PUT_LINE('부서번호: '|| VNO);
    DBMS_OUTPUT.PUT_LINE('최고연봉 '|| VTOP_SALARY);
    DBMS_OUTPUT.PUT_LINE('최고연봉평가: '|| VRESULT);
 
 EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE( VNO ||' 해당부서에 해당되는 사원이 없습니다. ');
 END;
/






-- 순위함수 RANK(),  DENSE_RANK(), ROWNUM
-- ROWNUM 구하는 순위(공동순위는 없다)게시판, 공지사항, 자료실, 장바구니,...
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
SELECT * FROM EMPLOYEES WHERE 1=1;
SELECT * FROM EMP02;
SELECT ROWNUM, FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT ROWNUM, FIRST_NAME, SALARY FROM EMPLOYEES;
SELECT ROWNUM, FIRST_NAME, SALARY FROM(SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC);
-- 공동순위를 구하는방법 RANK(), DENSE_RANK()
SELECT ROWNUM, RANK() OVER(ORDER BY SALARY DESC) AS RANK , FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC; 
SELECT ROWNUM, RANK() OVER(ORDER BY SALARY DESC) AS RANK , FIRST_NAME, SALARY 
FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC) ORDER BY SALARY DESC;

SELECT ROWNUM, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK , FIRST_NAME, SALARY 
FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT ROWNUM, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK , FIRST_NAME, SALARY 
FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC) ORDER BY SALARY DESC;

SELECT ROWNUM, RANK() OVER(ORDER BY SALARY DESC) AS RANK , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK , FIRST_NAME, SALARY 
FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC) ORDER BY SALARY DESC;

-- 중복순위를 없애기
SELECT RANK() OVER(ORDER BY SALARY DESC, COMMISSION_PCT DESC, DEPARTMENT_ID DESC) AS RANK , 
FIRST_NAME, SALARY , COMMISSION_PCT, DEPARTMENT_ID 
FROM EMPLOYEES ORDER BY SALARY DESC;

-- 부서별 순위 구하기
SELECT DEPARTMENT_ID , RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC, COMMISSION_PCT DESC, DEPARTMENT_ID DESC) AS RANK , 
FIRST_NAME, SALARY , COMMISSION_PCT 
FROM EMPLOYEES ORDER BY DEPARTMENT_ID ASC, SALARY DESC, COMMISSION_PCT DESC; 

-- ROWNUM 규칙 중요(조심)
-- 2PAGE 
-- start := ((num_page_no-1) * num_page_size) + 1  # 출력 페이지 시작 행 (ex. 11)
-- end := (num_page_no * num_page_size)          # 출력 페이지 마지막 행 (ex. 20)

SELECT ROWNUM ,  E.* FROM EMPLOYEES E WHERE ROWNUM BETWEEN 11 AND 20; 
SELECT ROWNUM ,  E.* FROM EMPLOYEES E;
-- 순위구하는 방법 (비추)
SELECT RNUM, FIRST_NAME, SALARY, DEPARTMENT_ID FROM (SELECT ROWNUM AS RNUM, E.* FROM EMPLOYEES E) 
WHERE RNUM BETWEEN 100 AND 110;

-- 순위구하는 방법 (강추)
SELECT RNUM, FIRST_NAME, SALARY, DEPARTMENT_ID FROM (SELECT ROWNUM AS RNUM, E.* FROM EMPLOYEES E WHERE ROWNUM <= 110) 
WHERE RNUM >= 100;


-- 순위구하는 방법
SELECT * FROM EMP02;
UPDATE EMP02 SET RANK = 0 WHERE RANK IS NULL;
ALTER TABLE EMP02 ADD RANK NUMBER(3);

UPDATE EMP02
SET RANK = (
    SELECT RANK() OVER (ORDER BY SALARY DESC)
    FROM EMP02 E
    WHERE E.EMPLOYEE_ID = EMP02.EMPLOYEE_ID );
COMMIT;   

SELECT RANK() OVER (ORDER BY SALARY DESC) RANK, SALARY, FIRST_NAME, EMPLOYEE_ID  FROM EMP02 ORDER BY SALARY DESC;

CREATE OR REPLACE PROCEDURE EMP02_RANK
IS
    VEMP02_RT EMP02%ROWTYPE; 
    cursor c1 	is  
    SELECT RANK() OVER (ORDER BY SALARY DESC) RANK, SALARY, FIRST_NAME, EMPLOYEE_ID  
    FROM EMP02 ORDER BY SALARY DESC;
BEGIN
    FOR VEMP02_RT IN C1 LOOP
        UPDATE EMP02 SET RANK = VEMP02_RT.RANK WHERE EMPLOYEE_ID = VEMP02_RT.EMPLOYEE_ID; 
    END LOOP; 
    COMMIT;
END;
/

EXECUTE EMP02_RANK;
SELECT * FROM EMP02;

-- 전체 순위구하기
SELECT FIRST_NAME 
     , SALARY 
     ,commission_pct
     , RANK() OVER (ORDER BY SALARY DESC, COMMISSION_PCT DESC)  RANK 
     , DENSE_RANK() OVER (ORDER BY SALARY DESC, COMMISSION_PCT DESC) DENSE_RANK 
  FROM EMP01  ORDER BY SALARY DESC;

-- 그룹별 순위구하기  
  SELECT DEPARTMENT_ID 
     , FIRST_NAME 
     , SALARY 
     , COMMISSION_PCT 
     , RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC, COMMISSION_PCT DESC) RANK 
  FROM EMP01 
 ORDER BY DEPARTMENT_ID, SALARY DESC, COMMISSION_PCT DESC;

-- 그룹별 최소값, 최대값 구하기
SELECT DEPARTMENT_ID 
     , FIRST_NAME 
     , SALARY  
     , MIN(SALARY) KEEP(DENSE_RANK FIRST ORDER BY SALARY) OVER(PARTITION BY DEPARTMENT_ID) SAL_MIN 
     , MAX(SALARY) KEEP(DENSE_RANK LAST ORDER BY SALARY) OVER(PARTITION BY DEPARTMENT_ID)  SAL_MAX 
  FROM EMP01 
 ORDER BY DEPARTMENT_ID, SALARY DESC;

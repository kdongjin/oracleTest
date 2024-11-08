ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER model2 CASCADE; -- 기존 사용자 삭제
CREATE USER model2 IDENTIFIED BY 123456 -- 사용자 이름: Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
GRANT connect, resource, dba TO model2; -- 권한 부여

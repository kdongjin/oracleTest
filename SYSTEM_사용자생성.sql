-- 사용자 계정만들기 (시스템관리자모드에서 진행해야됨)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER STUDENTDB CASCADE; -- 기존 사용자 삭제
CREATE USER STUDENTDB IDENTIFIED BY 123456 -- 사용자 이름: Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS    -- 데이터 저장소
    TEMPORARY TABLESPACE TEMP;   -- 임시저장장소
GRANT connect, resource, dba TO STUDENTDB; -- 권한 부여

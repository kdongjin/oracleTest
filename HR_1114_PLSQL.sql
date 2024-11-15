-- PL/SQL 
-- FOR IN LOOP 구구단 작성하기 
DECLARE
    I NUMBER(2); 
BEGIN
    DBMS_OUTPUT.PUT_LINE('구구단');
    DBMS_OUTPUT.PUT_LINE('------------------');
    FOR I IN 1..9 LOOP
        FOR J IN 1..9 LOOP
            DBMS_OUTPUT.PUT_LINE( I || ' X ' || J || ' = '||  I*J);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('------------------');
    END LOOP;
END;
/
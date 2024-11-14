-- PL/SQL 
-- 구구단 작성하기 
DECLARE
    VNUM NUMBER :=3;
    VCOUNT NUMBER :=1;
    VDAN NUMBER :=0; 
BEGIN
    LOOP 
        VDAN := VDAN + 1;
        VCOUNT := 1; 
        DBMS_OUTPUT.PUT_LINE('=========='||VDAN ||'단==========');
        -- VDAN 단을 출력
        LOOP 
            DBMS_OUTPUT.PUT_LINE(VDAN ||' * ' || VCOUNT ||' = '||VDAN*VCOUNT);
            VCOUNT := VCOUNT+1;
            IF VCOUNT > 9  THEN 
                EXIT;
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        -- 단 출력
        IF VDAN > 9  THEN 
           EXIT;
        END IF;
    END LOOP;
END;
/






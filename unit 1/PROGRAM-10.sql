SET SERVEROUTPUT ON;

DECLARE
    v_eid NUMBER;
BEGIN
    v_eid := &eid;

    DELETE FROM emp
    WHERE eid = v_eid;

    DBMS_OUTPUT.PUT_LINE('Record deleted successfully');

    COMMIT;
END;
/
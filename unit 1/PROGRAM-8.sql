SET SERVEROUTPUT ON;

DECLARE
    v_eid NUMBER;
    basicsal NUMBER;
    hra NUMBER;
    da NUMBER;
    medical NUMBER;
    pf NUMBER;
    gross_salary NUMBER;
BEGIN
    v_eid := &eid;

    SELECT basicsal
    INTO basicsal
    FROM emp
    WHERE eid = v_eid;

    hra := basicsal * 15 / 100;
    da := basicsal * 50 / 100;
    medical := 500;
    pf := basicsal * 10 / 100;

    gross_salary := basicsal + hra + da + medical - pf;

    DBMS_OUTPUT.PUT_LINE('Gross Salary = ' || gross_salary);
END;
/
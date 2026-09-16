CREATE TABLE employee
(
    empno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2),
    comm NUMBER(8,2)
);

INSERT INTO employee VALUES (101, 'RAM', 20000, 2000);
INSERT INTO employee VALUES (102, 'SHYAM', 25000, NULL);
INSERT INTO employee VALUES (103, 'MOHAN', 30000, 3000);

COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_empno NUMBER := &empno;
    v_comm NUMBER;

    NULL_COMMISSION EXCEPTION;

BEGIN
    SELECT comm
    INTO v_comm
    FROM employee
    WHERE empno = v_empno;

    IF v_comm IS NULL THEN
        RAISE NULL_COMMISSION;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Commission = ' || v_comm);

EXCEPTION
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE('Commission is NULL');

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');

END;
/
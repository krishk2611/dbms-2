CREATE TABLE emp (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL NUMBER(8,2),
    DEPTNO NUMBER(2)
);

INSERT INTO emp VALUES (101, 'RAM', 20000, 10);
INSERT INTO emp VALUES (102, 'SHYAM', 25000, 20);
INSERT INTO emp VALUES (103, 'MOHAN', 30000, 10);
INSERT INTO emp VALUES (104, 'RAHUL', 18000, 30);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    total_rows NUMBER(2) := 0;
BEGIN
   
    UPDATE EMP
    SET SAL = SAL + (SAL * 0.10)
    WHERE DEPTNO = 10;

   
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 10');
    ELSIF SQL%FOUND THEN
        total_rows := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(total_rows || ' employee(s) salary updated');
    END IF;

    COMMIT;
END;
/
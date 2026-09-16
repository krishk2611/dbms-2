CREATE TABLE employee
(
    employeeno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2),
    deptno NUMBER(2)
);

CREATE TABLE emp_backup
(
    employeeno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2),
    deptno NUMBER(2)
);

INSERT INTO employee VALUES (101, 'RAM', 20000, 10);
INSERT INTO employee VALUES (102, 'SHYAM', 25000, 20);
INSERT INTO employee VALUES (103, 'MOHAN', 30000, 10);
INSERT INTO employee VALUES (104, 'RAHUL', 22000, 30);

COMMIT;

set serveroutput on;
SET VERIFY OFF;

DECLARE
    v_deptno NUMBER := &deptno;
    v_count NUMBER := 0;

    NO_DEPT_FOUND EXCEPTION;

    CURSOR c1 IS
        SELECT employeeno, ename, sal, deptno
        FROM employee
        WHERE deptno = v_deptno;

BEGIN

    FOR e IN c1
    LOOP
        INSERT INTO emp_backup
        VALUES (e.employeeno, e.ename, e.sal, e.deptno);

        v_count := v_count + 1;
    END LOOP;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Records inserted successfully');

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO_DEPT_FOUND: No records found');

END;
/
	
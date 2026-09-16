SET SERVEROUTPUT ON;

CREATE TABLE employee (
    employeeNO NUMBER(4),
    ENAME VARCHAR2(20),
    EAGE NUMBER(5),
    SAL NUMBER(8,2),
    DEPTNO NUMBER(2)
);

INSERT INTO employee VALUES (101, 'RAM',50, 20000, 10);
INSERT INTO employee VALUES (102, 'SHYAM',20, 25000, 20);
INSERT INTO employee VALUES (103, 'MOHAN',40, 30000, 10);
INSERT INTO employee VALUES (104, 'RAHUL',30, 18000, 30);

COMMIT;
set serveroutput on;
DECLARE
    v_SAL employee.ENAME%TYPE;

BEGIN
    SELECT SAL
    INTO v_SAL
    FROM employee
    WHERE ename ='&username';

       DBMS_OUTPUT.PUT_LINE('sal = ' || v_SAL);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee does not exist.');
END;
/
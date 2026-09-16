CREATE TABLE emp (
    empno NUMBER(4),
    ename VARCHAR2(20),
    deptno NUMBER(2),
    deptname VARCHAR(10),
    gender CHAR (5),
    age NUMBER(7),
    sal NUMBER(8,2),
   
);

INSERT INTO emp VALUES (101,'RAM',10,'SALES','M',23,25000);
INSERT INTO emp VALUES (102,'SHYAM',10,'HR','M',22,30000);
INSERT INTO emp VALUES (103,'MOHAN',20,'SALES','M',34,20000);
INSERT INTO emp VALUES (104,'ROSHNI',20,'HR','F',26,35000);
INSERT INTO emp VALUES (105,'AMIT',30,'ADMIN','M',21,40000);

COMMIT;


SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cur(dno NUMBER) IS
        SELECT ename, sal
        FROM emp
        WHERE deptno = dno;

    total NUMBER;

BEGIN
    FOR d IN (SELECT DISTINCT deptno FROM emp ORDER BY deptno) LOOP

        total := 0;

        DBMS_OUTPUT.PUT_LINE('Department : ' || d.deptno);

        FOR e IN emp_cur(d.deptno) LOOP
            DBMS_OUTPUT.PUT_LINE('Employee : ' || e.ename ||
                                 '  Salary : ' || e.sal);


            total := total + e.sal;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Total Gross Salary : ' || total);
        DBMS_OUTPUT.PUT_LINE('---------------------------');

    END LOOP;
END;
/
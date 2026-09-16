CREATE TABLE manager(
    empno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2),
    deptno NUMBER(2)
);

INSERT INTO manager VALUES(101,'ram',20000,10);
INSERT INTO manager VALUES(102,'shyam',25000,20);
INSERT INTO manager VALUES(103,'mohan',30000,10);
INSERT INTO manager VALUES(104,'rahul',18000,30);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    total_rows NUMBER(2):=0;

    CURSOR man1 IS
        SELECT sal FROM manager
        WHERE deptno=20
        FOR UPDATE OF sal;

    sal manager.sal%TYPE;

BEGIN
    OPEN man1;

    IF man1%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('cursor is open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('cursor is not open');
    END IF;

    LOOP
        FETCH man1 INTO sal;
        EXIT WHEN man1%NOTFOUND;

        UPDATE manager
        SET sal = sal + (sal*5/100)
        WHERE CURRENT OF man1;

        IF SQL%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('no manager selected');
        ELSIF SQL%FOUND THEN
            total_rows:=man1%ROWCOUNT;
            DBMS_OUTPUT.PUT_LINE(total_rows || ' manager salary updated');
        END IF;

    END LOOP;

    CLOSE man1;
    COMMIT;
END;
/

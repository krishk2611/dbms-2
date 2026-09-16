CREATE TABLE employee (
    emp_id NUMBER,
    emp_name VARCHAR2(30),
    salary NUMBER
);

INSERT INTO employee VALUES (101, 'Rahul', 25000);
INSERT INTO employee VALUES (102, 'Priya', 30000);
INSERT INTO employee VALUES (103, 'Amit', 28000);

COMMIT;

SET SERVEROUTPUT ON;

BEGIN
    UPDATE employee
    SET salary = salary + 5000
    WHERE emp_id = 101;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Record Updated Successfully');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Record Not Found');
    END IF;

    COMMIT;
END;
/
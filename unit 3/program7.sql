CREATE TABLE student
(
    rollno NUMBER(3),
    name VARCHAR2(20),
    marks VARCHAR2(10)
);

INSERT INTO student VALUES (1, 'RAM', '80');
INSERT INTO student VALUES (2, 'SHYAM', '90');
INSERT INTO student VALUES (3, 'MOHAN', '70');

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER;
BEGIN
	v_num :='abc';

    DBMS_OUTPUT.PUT_LINE('number = ' || v_num);

EXCEPTION
    WHEN Value_error THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Number');
END;
/
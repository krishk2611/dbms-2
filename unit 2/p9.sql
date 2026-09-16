CREATE TABLE customer (
    cust_id NUMBER,
    cust_name VARCHAR2(30),
    city VARCHAR2(20)
);

INSERT INTO customer VALUES (103, 'Amit', 'Pune');
INSERT INTO customer VALUES (101, 'Rahul', 'Delhi');
INSERT INTO customer VALUES (104, 'Ravi', 'Surat');
INSERT INTO customer VALUES (102, 'Priya', 'Mumbai');

COMMIT;


SET SERVEROUTPUT ON;

DECLARE
    CURSOR c1 IS
        SELECT * FROM customer
        ORDER BY cust_id;

    v_id   customer.cust_id%TYPE;
    v_name customer.cust_name%TYPE;
    v_city customer.city%TYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_id, v_name, v_city;
        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ' Name: ' || v_name ||
            ' City: ' || v_city
        );
    END LOOP;

    CLOSE c1;
END;
/
CREATE TABLE customer (
    cust_id NUMBER,
    cust_name VARCHAR2(30),
    city VARCHAR2(20)
);

INSERT INTO customer VALUES (101, 'Rahul', 'Delhi');
INSERT INTO customer VALUES (102, 'Priya', 'Mumbai');
INSERT INTO customer VALUES (103, 'Ramesh', 'Pune');
INSERT INTO customer VALUES (104, 'Ravi', 'Surat');

COMMIT;

SET SERVEROUTPUT ON;

BEGIN

	FOR rec IN (
		SELECT * FROM customer
		WHERE cust_name LIKE 'R%'
	)
	LOOP
		DBMS_OUTPUT.PUT_LINE(
			' ID: ' || rec.cust.id ||
			' Name: ' || rec.cust_name ||
			' City: ' || rec.city
		);
	END LOOP;
END;
/

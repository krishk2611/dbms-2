DECLARE
    no1 NUMBER := 10;
    no2 NUMBER := 0;
    result NUMBER;
BEGIN
    result := no1 / no2;

    DBMS_OUTPUT.PUT_LINE('Result = ' || result);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Cannot divide by zero.');

	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OYHER ERROR:'||SQLERRM);
END;
/
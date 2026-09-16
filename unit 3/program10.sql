SET SERVEROUTPUT ON;

DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    a := 10;
    b := 0;

    c := a / b;

    DBMS_OUTPUT.PUT_LINE('Answer = ' || c);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE = ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM  = ' || SQLERRM);
END;
/
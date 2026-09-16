DECLARE
    S_INPUT VARCHAR2(50);
    S_ROLLNO RESULT.ROLLNO%TYPE;
    S_NAME   RESULT.SNAME%TYPE;
    S_MARKS  RESULT.MARKS%TYPE;

  STUD_NOT_FOUND EXCEPTION;
    
BEGIN
    -- Accept student name from user
    v_name := '&student_name';

    -- Search for the student's result
    SELECT RESULT
    INTO v_result
    FROM RESULT
    WHERE UPPER(STUDENT_NAME) = UPPER(v_sname);

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_sname);
    DBMS_OUTPUT.PUT_LINE('Result       : ' || v_result);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student "' || v_sname ||
                             '" does not exist in the RESULT table.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple records found for this student.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
SET SERVEROUTPUT ON;

DECLARE
BEGIN
    FOR emp1 IN (
        SELECT *
        FROM emp
        WHERE gender = 'Male'
        AND deptname = 'HR'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp1.eid || ' ' ||
            emp1.ename || ' ' ||
            emp1.deptno || ' ' ||
            emp1.deptname || ' ' ||
            emp1.gender || ' ' ||
            emp1.age || ' ' ||
            emp1.basicsal
        );
    END LOOP;
END;
/
CREATE TABLE emp_backup AS SELECT * FROM emp WHERE 1=2;




DECLARE

	v_deptno EMP. DEPTNO % TYPE := &DEPTNO; 
	NO_DEPT_ FOUND EXCEPTION;
	 v_count NUMBER := 0; 

	CURSOR emp cur IS 
		SELECT * 
		FROM EMP 
		WHERE DEPTNO = v_deptno; 
	emp rec EMP%ROWTYPE ; 

BEGIN 
	SELECT COUNT (*) 
	INTO v_count 
	FROM EMP 
	WHERE DEPTNO = v_deptno; 
	
	IF v_count = 0 THEN
		 RAISE NO_DEPT_FOUND; 
	END IF; 

	OPEN emp_cur; 
	LOOP 
	FETCH emp_cur INTO emp_rec; 
	EXIT WHEN emp_cur&NOTFOUND; 
	INSERT INTO EMP_BACKUP 
	VALUES ( 
	emp_rec.EID, 
	emp_rec. ENAME,
	 emp_rec. DEPTNO, 
	emp_rec. DEPTNAME, 
	emp_re. GENDER, 
	emp rec.AGb, 
	emp_rec. BASICSAL 

	);
S
	END LOOP;
	CLOSE emp_cur;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Records copied suuccesfully');
EXCEPTION
	WHEN NO_DEPT_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('NO employee found for 
					department no: ' || v_deptno);
	
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

	



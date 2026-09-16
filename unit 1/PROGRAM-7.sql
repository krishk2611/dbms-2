CREATE TABLE RESULT(
rollno number primary key,
name VARCHAR2(50),
sub1 NUMBER(3),
sub2 NUMBER(3),
sub3 NUMBER(3),
sub4 NUMBER(3),
sub5 NUMBER(3),
total number(4),
per number(5,2),
grade char (1)
);

INSERT INTO RESULT(
(rollno,name,sub1,sub2,sub3,sub4,sub5)values
(101,'rahul',85,78,90,88,76);


INSERT INTO RESULT
(rollno,name,sub1,sub2,sub3,sub4,sub5)values
(102,'priya',95,92,89,88,90);

SET SERVEROUTPUT ON;

DECLAR
	rno RESULT.ROLLNO%type;
	sub1 RESULT.sub1%type;
	sub2 RESULT.sub2%type;
	sub3 RESULT.sub3%type;
	sub4 RESULT.sub4%type;
	sub5 RESULT.sub5%type;












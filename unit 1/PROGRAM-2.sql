DECLARE

no number(5):=5;
sq number(30);
cube number(30);

BEGIN

 sq:=no*no;
cube:=no*no*no;
dbms_output.put_line(sq);
dbms_output.put_line(cube);

end;
/
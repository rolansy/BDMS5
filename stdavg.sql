Create table STUDENTS
(
    SID VARCHAR2(5) primary key,
    NAME VARCHAR2(20),
    MARKS NUMBER
);

INSERT INTO STUDENTS VALUES('S001','Rahul',90);
INSERT INTO STUDENTS VALUES('S002','Tom',73);
INSERT INTO STUDENTS VALUES('S003','Anaya',35);
INSERT INTO STUDENTS VALUES('S004','Voldemort',42);
INSERT INTO STUDENTS VALUES('S005','Shaji',69);
INSERT INTO STUDENTS VALUES('S006','Tony',63);


set serveroutput on;

DECLARE
    avgmarks NUMBER(10);
    cdate DATE;
    cweek varchar(10);
BEGIN
    select avg(marks) into avgmarks from students;
    dbms_output.put_line('Average marks : '||avgmarks);
    if avgmarks>40 then
        dbms_output.put_line('Good avg marks');
    else
        dbms_output.put_line('Needs improvement');
    end if;
    cdate:=SYSDATE;
    cweek:=TO_CHAR(cdate,'DAY');
    dbms_output.put_line('Current date : '||cdate);
    dbms_output.put_line('Current weekday : '||cweek);
end;
/
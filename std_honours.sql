CREATE TABLE std_honors (
    rollno NUMBER PRIMARY KEY,
    name VARCHAR(30),
    s1 NUMBER,
    s2 NUMBER
);

INSERT INTO std_honors VALUES (52, 'Bob', 8,8);
INSERT INTO std_honors VALUES (53, 'Charlie', 9, 4);
INSERT INTO std_honors VALUES (51, 'Alice', 5, 2);
INSERT INTO std_honors VALUES (54, 'David', 65, 70);
INSERT INTO std_honors VALUES (55, 'Eve', 80, 85);
INSERT INTO std_honors VALUES (56, 'Frank', 55, 60);
INSERT INTO std_honors VALUES (57, 'Grace', 7, 8);
INSERT INTO std_honors VALUES (58, 'Hannah', 88, 90);
INSERT INTO std_honors VALUES (59, 'Ivy', 32, 94);
INSERT INTO std_honors VALUES (510, 'Jack', 70, 5);

set serveroutput on;

declare
    cursor honor_cursor IS
        select rollno,name,s1,s2 from std_honors where (s1+s2)>12 order by rollno;
    roll std_honors.rollno%TYPE;
    sname std_honors.name%TYPE;
    s1m std_honors.s1%type;
    s2m std_honors.s2%type;
    tot number;
    maxs number:=0;
begin
open honor_cursor;
    dbms_output.put_line('Students eligible for honours : ');
    loop
        fetch honor_cursor into roll,sname,s1m,s2m;
        EXIT WHEN honor_cursor%NOTFOUND; 
        
        dbms_output.put_line('Roll : '||roll||', name : '||sname||', s1 : '||s1m||', s2 : '||s2m);

        tot:=s1m+s2m;
        dbms_output.put_line('Total : '||tot);

        if s1m>maxs then
            maxs:=s1m;
        end if;
    end loop;
    close honor_cursor;
    DBMS_OUTPUT.PUT_LINE('.');
    DBMS_OUTPUT.PUT_LINE('Highest grade obtained in the previous semester for honor students: ' || maxs);
end;
/
    


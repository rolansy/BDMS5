CREATE TABLE student_avg (    std INTEGER,    name VARCHAR(10),    subj1 INTEGER,    subj2 INTEGER,    subj3 INTEGER,    Total INTEGER,    Avg FLOAT);


create or replace trigger std_honours_trigger
before insert on student_avg
for each ROW
begin
    :New.total:=:NEW.subj1 + :NEW.subj2 +:new.subj3;
    :new.avg:=:new.total/3;
    dbms_output.put_line('Tot : '||:new.total||', avg : '||:new.avg);
end;
/

INSERT INTO student_avg(std,name,subj1,subj2,subj3) VALUES (52, 'CHarlie', 6,7,8);
INSERT INTO student_avg(std,name,subj1,subj2,subj3) VALUES (53, 'David', 9, 4, 5);
INSERT INTO student_avg(std,name,subj1,subj2,subj3) VALUES (51, 'Alice', 5, 2, 3);
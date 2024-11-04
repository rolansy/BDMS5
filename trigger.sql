CREATE TABLE std_honors (
    rollno NUMBER PRIMARY KEY,
    name VARCHAR(30),
    s1 NUMBER,
    s2 NUMBER
);


CREATE OR REPLACE TRIGGER std_honours_trigger
BEFORE INSERT OR UPDATE OR DELETE ON std_honors
for each ROW
declare
    message varchar2(50);
begin
    if deleting then
        message:='Deleting '||:OLD.name;
    elsif inserting then
        message:='INsering '||:new.name;
    elsif updating then
        message:='Updateing '||:old.name;
    end if;
    dbms_output.put_line(message);
end;
/


INSERT INTO std_honors VALUES (52, 'Bob', 8,8);
INSERT INTO std_honors VALUES (53, 'Charlie', 9, 4);
INSERT INTO std_honors VALUES (51, 'Alice', 5, 2);
INSERT INTO std_honors VALUES (54, 'David', 65, 70);
INSERT INTO std_honors VALUES (55, 'Eve', 80, 85);

INSERT INTO std_honors VALUES (511, 'Katie', 75, 69);
UPDATE std_honors SET s1 = 80, s2 = 75 WHERE rollno = 511;
DELETE FROM std_honors WHERE rollno = 511;
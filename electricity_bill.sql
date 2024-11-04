CREATE TABLE electricity_charge (
    unit_consumed VARCHAR(10) NOT NULL PRIMARY KEY,
    charge NUMBER(10)
);

insert into electricity_charge values('1-100', 5);
insert into electricity_charge values('101-300', 7.5);
insert into electricity_charge values('301-500', 15);
insert into electricity_charge values('>501', 22.5);

create table electricity_user (
    user_id NUMBER(5) NOT NULL PRIMARY KEY,
    user_name VARCHAR(30),
    unit_consumed NUMBER(10)
);

insert into electricity_user values(1001, 'Alice',150);
insert into electricity_user values(1002, 'Bob', 550);
insert into electricity_user values(1003, 'Charlie', 75);
insert into electricity_user values(1004, 'David', 149);
insert into electricity_user values (1005, 'Eve', 342);
insert into electricity_user values (1006, 'Frank', 69);
insert into electricity_user values (1007, 'Grace', 769);
insert into electricity_user values (1008, 'Hannah', 88);
insert into electricity_user values (1009, 'Ivy', 232);
insert into electricity_user values (1010, 'Jack', 499); 

set serveroutput on;

declare
  cursor user_cursor is
      select user_id,user_name,unit_consumed from electricity_user;
  user_record user_cursor%ROWTYPE;
  charge_rate NUMBER(10,2);
  total_bill NUMBER(10,2);
begin
open user_cursor;
  loop
    fetch user_cursor into user_record;
    exit when user_cursor%NOTFOUND;

    select charge into charge_rate from electricity_charge
    where
        (user_record.unit_consumed BETWEEN 1 and 100 and unit_consumed='1-100') or
        (user_record.unit_consumed BETWEEN 101 and 300 and unit_consumed='101-300') or
        (user_record.unit_consumed BETWEEN 301 and 500 and unit_consumed='301-500') or
        (user_record.unit_consumed >500 and unit_consumed='>500');
    
    total_bill:=charge_rate*user_record.unit_consumed;
    dbms_output.put_line('User : '||user_record.user_id||', Bill : '||total_bill);
  end loop;
  close user_cursor;
end;
/
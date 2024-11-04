CREATE  TABLE Train (
    TrainNo NUMBER PRIMARY KEY,
    TName VARCHAR(15),
    TDate DATE,
    Destination VARCHAR(15),
    Seats NUMBER
);

create sequence train_seq
start with 1
increment by 1;

create or replace trigger train_trigger
before insert on train
for each ROW
begin
    select train_seq.NEXTVAL INTO :NEW.TrainNo from dual;
end;
/

INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Express', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Delhi', 100);

INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Nirvana', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Doha', 150);
commit;

INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Vazha', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Shimla', 150);
ROLLBACK;



select * from train;
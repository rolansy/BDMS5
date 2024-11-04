CREATE  TABLE Train (
    TrainNo NUMBER PRIMARY KEY,
    TName VARCHAR(15),
    TDate DATE,
    Destination VARCHAR(15),
    Seats NUMBER
);

CREATE TABLE Reservation (
    ResID NUMBER PRIMARY KEY,
    TrainNo NUMBER,
    PassengerName VARCHAR2(15),
    SeatNo NUMBER,
    FOREIGN KEY (TrainNo) REFERENCES Railway(TrainNo)
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

create sequence res_seq
start with 1
increment by 1;

create or replace trigger resid_trigger
before insert on reservation
for each ROW
begin
    select res_seq.NEXTVAL into :NEW.Resid from dual;
end;
/

create or replace procedure makeres(
    p_train in number,
    p_name in varchar(20),
    p_seat in number
) as
begin
    insert into reservation(TrainNo,PassengerName,SeatNo)
    values (p_train,p_name,p_seat);
    commit;
    DBMS_OUTPUT.PUT_LINE('Reservation made successfully for ' || p_PassengerName);
    exception
    when others then
        rollback;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end;

create or replace procedure cancelres(
    p_res in number
) as
begin
    delete from reservation where ResID=p_res;
    commit;
    DBMS_OUTPUT.PUT_LINE('Reservation cancelled successfully for ResID ' || p_ResID);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end;
/


INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Express', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Delhi', 100);

INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Nirvana', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Doha', 150);
COMMIT;

INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Vazha', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Shimla', 150);
ROLLBACK;


SELECT * FROM Train;


begin
    makeres(p_train=>1,p_name=>'John',p_seat=>2);
end;
CREATE TABLE accounts (
    acc_num NUMBER(5) NOT NULL PRIMARY KEY,
    bal NUMBER(10)
);

INSERT INTO accounts values(1245,10000);
INSERT INTO accounts values(6980,50000);
INSERT INTO accounts values(7245,2000);

select * from accounts;

SET SERVEROUTPUT ON
accept acc NUMBER PROMPT 'Enter acc number : ';

DECLARE
    balance NUMBER(10);
    min_bal NUMBER(10);
    debit NUMBER;
    credit NUMBER;
BEGIN
    debit:=&debit;
    UPDATE accounts set bal=bal-debit where acc_num=&acc;
    credit:=&credit;
    UPDATE accounts set bal=bal+credit where acc_num=&acc;
    SELECT bal into balance from accounts where acc_num=&acc;
    DBMS_OUTPUT.PUT_LINE('BALANCE : '||balance);
    if balance<1500 then
        dbms_output.put_line('warning maintain min balance!');
    end if;
end;
/
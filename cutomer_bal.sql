CREATE TABLE customer_balance (
    CID NUMBER(5) NOT NULL PRIMARY KEY,
    bal NUMBER(10)
);

INSERT INTO customer_balance (CID, bal) VALUES (6901, 10340);
INSERT INTO customer_balance (CID, bal) VALUES (6950, 7830);
INSERT INTO customer_balance (CID, bal) VALUES (7001, 45000);
INSERT INTO customer_balance (CID, bal) VALUES (8756, 69000);
INSERT INTO customer_balance (CID, bal) VALUES (4200, 500);
INSERT INTO customer_balance (CID, bal) VALUES (6902, 12003);
INSERT INTO customer_balance (CID, bal) VALUES (2030, 78030);


ALTER TABLE customer_balance ADD Category VARCHAR(20);

set serveroutput on;

declare
    balance NUMBER(10);

    PROCEDURE categorize(CID IN NUMBER,bal IN NUMBER) is
    begin
        if bal<=10000 then
            update customer_balance set category='silver' where CID=categorize.CID;
        elsif bal<=50000 then
            update customer_balance set category='gold' where cid=categorize.cid;
        else
            update customer_balance set category='platinum' where cid=categorize.cid;
        end if;
    end;
begin
    for customer_rec IN(select cid,bal from customer_balance) LOOP
        categorize(customer_rec.cid, customer_rec.bal);
    end loop;

    for custom_rec IN(select cid,bal,category from customer_balance) loop
        dbms_output.put_line('CID : '||custom_rec.cid||', bal : '||custom_rec.bal||', category : '||custom_rec.category);
    end loop;
end;
/
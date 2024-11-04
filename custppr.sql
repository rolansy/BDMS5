CREATE TABLE PRODUCT(product_no varchar(15) not null primary key, dexcription varchar(15) not null, company varchar(15) not null, price int not null);
CREATE TABLE CUSTOMER(cust_no varchar(15) not null primary key, name varchar(15) not null,age int not null, city varchar(15) not null,pincode int not null, state varchar(15) not null);
CREATE TABLE SUPPLIER(s_no varchar(15) not null primary key, sname varchar(15) not null,age int not null, city varchar(15) not null);
CREATE TABLE PURCHASE(order_no int not null primary key, cust_no varchar(15) not null, prod_no varchar(15) not null, order_date date not null,foreign key(cust_no) references CUSTOMER(cust_no),foreign key(prod_no) references PRODUCT(product_no));

INSERT INTO CUSTOMER VALUES('C0001','Rahul',25,'Delhi',110001,'Delhi');
INSERT INTO CUSTOMER VALUES('C0002','Rohit',30,'Mumbai',400001,'Maharashtra');

INSERT INTO PURCHASE VALUES('O0002','C0001','P0002','20-Jan-2019');

select name from customer where city='MADRAS';

select cust_no from PURCHASE where order_date like "___JAN___";

select company  from product where price>5000;

select name from customer where name not like "R%";

alter table customer add email varchar(15);

select name from customer where age>40 and state='MH';

select company,price from product order by price;

select avg(age) from customer;

select city,state from customer where state in ('Maharashtra','TN');

select cust_no,quantity from PURCHASE order by quantity;

update PURCHASE set prod_no='p008' where cust_no='c0003';

select count(*) from customer where city='Delhi';

alter table purchase MODIFY order_date varchar(15);

select min(price),max(price) from product;

select company,count(*) from product where company in ('WIPRO','HCL') group by company;

delete from product where product_no='23';

create table purchase_sum as select order_no,order_date from purchase;

drop table purchase_sum;

create view cust_view as select * from customer;

select P.cust_no,count(P.cust_no),C.Name from purchase P, customer C where P.cust_no=C.cust_no group by p.cust_no,C.name having count(p.cust_no)>1;

select c.city,p.order_no,p.cust_no purchase p join CUSTOMER c on p.cust_no=c.cust_no order by city;

select name from customer union select sname from SUPPLIER;

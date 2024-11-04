create table department(dep_no number(38) not null primary key, dep_name varchar(15) not null, LOC VARCHAR2(15) NOT NULL, MGR NUMBER(38) NOT NULL, EXP_BDG NUMBER(38) NOT NULL, REV_BDG NUMBER (38) NOT NULL); 

CREATE TABLE EMPLOYEE( EMPNO NUMBER(38) NOT NULL PRIMARY KEY, NAME VARCHAR2(15) NOT NULL, JOB VARCHAR2(15) NOT NULL, SALARY NUMBER(38) NOT NULL, COMM VARCHAR2(15),DEP_NO NUMBER(38), SEX VARCHAR2(6), FOREIGN KEY(DEP_NO) REFERENCES DEPARTMENT(DEP_NO) ); 

CREATE TABLE DEPENDANT( PID NUMBER(38) NOT NULL PRIMARY KEY, FNAME VARCHAR2(15) NOT NULL, LNAME VARCHAR2(15) NOT NULL, PLACE VARCHAR2(15),EMPNO NUMBER(38) NOT NULL);


select name from EMPLOYEE where job='MNGR' order by name;

select name from employee where name like "%u%" and name like "%e%";

select name from employee where COMM is not null and comm>0;

select name,salary from employee where salary>(select avg(salary) from employee);

create index indxdep_dname on department(FNAME,LNAME);


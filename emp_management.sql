CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    name VARCHAR2(20),
    position VARCHAR2(20),
    salary NUMBER
);

create or replace package employee_pkg is
    function getsalary(emp_id number ) return number;
    procedure add_employee(empid number, emp_name varchar, emp_position varchar, emp_salary number);
    procedure delete_employee(empid number);
    procedure list_employees;

end employee_pkg;

/

set serveroutput on;

create or replace package body employee_pkg is 
    function getsalary(emp_id number ) return number is
        emp_salary number;
        begin
            select salary into emp_salary from employees where employee_id=emp_id;
            return emp_salary;
        exception
            when no_data_found then
                return null;

    end getsalary;

    PROCEDURE add_employee(emp_id NUMBER, emp_name VARCHAR2, emp_position VARCHAR2, emp_salary NUMBER) IS
    BEGIN
        INSERT INTO employees (employee_id, name, position, salary)
        VALUES (emp_id, emp_name, emp_position, emp_salary);
    END add_employee;

    PROCEDURE delete_employee(emp_id NUMBER) IS
    BEGIN
        DELETE FROM employees WHERE employee_id = emp_id;
    END delete_employee;

    procedure list_employees is
    begin
        for emp in (select * from employees) loop
            DBMS_OUTPUT.PUT_LINE('ID: ' || emp.employee_id || ', Name: ' || emp.name || ', Position: ' || emp.position || ', Salary: ' || emp.salary);
        end loop;
    end list_employees;
end employee_pkg;
/

SET SERVEROUTPUT ON;

BEGIN
    employee_pkg.add_employee(1, 'Paulu', 'Manager', 50000);
END;
/

BEGIN
    employee_pkg.add_employee(2, 'Sreeku', 'Developer', 40000);
END;
/
BEGIN
    employee_pkg.add_employee(3, 'Malavika', 'Tester', 30000);
END;
/

BEGIN
    employee_pkg.list_employees;
END;
/
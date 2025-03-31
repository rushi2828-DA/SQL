-- create database employees
create database employees;
use employees;

-- create table employees_info
create table employees_info(
emp_id int,
first_name varchar(255),
last_name varchar(255),
department varchar(255),
salary varchar(255),
hire_date varchar(255)
);

select * from employees_info;

insert into employees_info values(1,'John', 'Doe','HR', '50000', '2018-01-15');
insert into employees_info values(2,'Jane', 'Smith','IT', '60000', '2019-03-22');
insert into employees_info values(3,'Alice', 'Brown','IT', '55000', '2020-11-02');

-- shoe only first and last name of employees
select first_name ,last_name from employees_info;

-- get all employees who work in "IT" department
select * from employees_info where department='IT';

-- find employees with a salary greater than 55000
select * from employees_info where salary>55000;

drop table employees_info;

-- list employees hired after january 1,2019
select * from employees_info where hire_date >'2019-01-01';

-- list all employees ordereed by their salary in descending order
select * from employees_info order by salary desc;

-- show all employees sorted by hire_date , oldest first 
select * from employees_info order by hire_date asc;

-- find the total salary paid to all employess
select sum('salary') as salary from employees_info;

-- calculate the average salary of employees
select avg('salary') as average_salary from employees_info;

-- count the number of employees in each department
select department, count(*) as employee_count from employees_info group by department;

-- show the average salary for each department
select department , avg('salary') as salary from employees_info group by department;

-- find department with an average salary greater than 55000
select department, avg('salary') as salary from employees_info group by department having avg('salary') > 55000;

-- show the top 2 highest-paid employees 
select * from employees_info order by salary desc limit 2;

-- find employees whose department is either 'HR' and 'IT'
select * from employees_info where department in ('HR' , 'IT');

-- find employees whose firstb name starts with 'J'
select * from employees_info
where first_name like 'J%';

-- get employees with salary between 50000 and 60000
select * from employees_info where salary between 55000 and 60000;



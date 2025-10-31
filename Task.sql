create database dept;
use dept;

create table departments(
dept_id int primary key,
dept_name varchar(50) not null
);

create table employee(
emp_id int primary key,
emp_name varchar(50) not null,
gender char(1) check (gender in ('M','F')),
dept_id int,
salary decimal(10,2),
hire_date date,
foreign key (dept_id) references departments(dept_id)
);

insert into employee values(101,'Rahul','M',10,55000,'2019-03-15'),
							(102,'Priya','F',20,65000,'2020-07-10'),
                            (103,'Suresh','M',10,48000,'2021-02-12'),
                            (104,'Ananya','F',30,72000,'2018-11-01'),
                            (105,'Kiran','M',20,51000,'2022-06-20');
                            
insert into departments values(10,'IT');
insert into departments values(20,'HR');
insert into departments values(30,'SALES');

select * from departments;
select * from employee;

-- 1.show details of employee hired after 2020-01-01
select * from employee where hire_date >'2020-01-01';

-- 2.find total number of employee in each departments
select dept_id ,count(emp_id) from employee group by dept_id ;

-- 3.list names and salary of employees earning more than 50000
select emp_name,salary from employee where salary > 50000;

-- 4.retrieve names of all female employees
select emp_name from employee where gender='F';

-- 5.show details of employee hired after 2020-01-01
select * from employee where hire_date >'2020-01-01';

-- 6.diaplay all departments in alphabetical order
select * from departments order by dept_name asc;

-- 7.calculate average salary of employee in it department
select avg(salary)
 from employee 
 where dept_id=(select dept_idfrom departments where dept_name='IT');

-- 8.display deptment name and total salary paid per department
select d.dept_name,sum(e.salary) 
from employee e 
inner join departments d 
on d.dept_id=e.dept_id
group by dept_name;

-- 9.count number of maes and female employee
select gender ,count(*) from employee group by gender;

-- 10.find highest and lowest salary in each department
select dept_id,max(salary) as max_salary,min(salary) as min_salary from employee group by dept_id;

-- 11.find employees whose name start with letter A
select * from employee where emp_name like'A%';

-- 12.retrieve details of employees whose salary between 50000 to 70000
select * from employee where salary between 50000 and 70000;

-- 13.show all employee not in HR department
select * from employee 
where dept_id not in
(select dept_id 
from departments
where dept_name='HR');

-- 14.show department names  with more than 1 employee
select dept_id ,count(*) 
from employee 
group by dept_id 
having count(*) > 1;

-- 15.write query to print department name and total number of employees ,sorted by highest count first
select d.dept_name ,count(e.emp_id) as total_employee
from employee e 
left join departments d 
on e.dept_id=d.dept_id 
group by dept_name 
order by total_employee desc;

-- 16.list the employee who earn more than average salary of all employee 
select * from employee where salary > (select avg(salary) from employee);

-- 17.display all employee name along with their department names
select e.emp_name,d.dept_name from employee e inner join departments d on d.dept_id=e.dept_id;

-- 18.display employees hired in last 2 years
select * from employee where hire_date >= date_sub(curdate(),interval 2 year);

update employee set hire_date = '2023-11-15' where emp_id=105;

-- 20.employees hired in same year as 'Rahul'
select emp_name from employee where year(hire_date)=(select year(hire_date) from employee where emp_name='Rahul');

-- 21.top 3 highest paid employee
select * from employee order by salary desc limit 3;

-- 22.most recent hire 
select * from employee order by  hire_date desc limit 1;

-- 23.total payrol
select sum(salary) as total_pay from employee;

-- 24.employee whose names contain 'r'
select * from employee where emp_name like '%r%';

-- 25.departments with avg salary > 60000
select e.emp_name ,avg(e.salary) from employee e 
inner join departments d 
on d.dept_id=e.dept_id 
group by emp_name 
having avg(e.salary) > 60000;

-- 26.write query to display first three characters of each employess name 
select emp_name ,substring(emp_name,1,3) as short_name from employee;

-- 27.show employee name,salary and salary grade based on:
-- salary < 50000 - grade C
-- 50000 - 70000 - grade B
-- 70000 - grade A
select emp_name,salary,
case 
when salary < 50000 then 'C'
when salary between 50000 and 70000 then 'B'
else 'A'
end as grade
from employee;

-- 28.retrieve employees whose department name ends with 'S'
select e.emp_name ,d.dept_name 
from employee e 
inner join departments d
on d.dept_id=e.dept_id 
where dept_name 
like '%S';

-- 30.find total number of employee join each year
select count(*),year(hire_date) as year_joined from employee group by year(hire_date);

-- 31.departments with male employee 
select distinct d.dept_name 
from employee e 
join departments d 
on e.dept_id=d.dept_id 
where e.gender='M';

-- 32.find Nth highest salary(use subquery or window function)
select distinct salary from employee e1 where 3=(select count(distinct e2.salary) from employee e2 where e2.salary >=e1.salary);

-- 33.display departments name having the maximum total salary payout
select d.dept_name,sum(e.salary) as total_salary 
from employee e 
join departments d 
on d.dept_id=e.dept_id 
group by d.dept_name 
order by total_salary desc 
limit 1;

-- 34.show employee hired before their departments oldest employee(tricky join)
select e.emp_name,e.dept_id,e.hire_date 
from employee e 
where e.hire_date < (
select min(e2.hire_date) 
from employee e2 
where e2.dept_id=e.dept_id);

-- 35.find employee whose salary is within 10% of max salary
select emp_name ,salary from employee where salary >=0.9* (select max(salary) from employee);

-- 36.create a query to find duplicate salaries in the company
select salary,count(*) as count_same from employee group by salary having count(*) > 1;

-- 37.display department name,number of employee and difference between max and min salary
select d.dept_name ,count(e.emp_id) as total_employee,(max(e.salary) - min(e.salary)) as salary_difference 
from employee e 
join departments d 
on e.dept_id=d.dept_id 
group by d.dept_name;

-- 38.find employee with same salary as another employee
select e1.emp_name,e1.salary 
from employee e1 
join employee e2 
on e1.salary=e2.salary 
and e1.emp_id<>e2.emp_id 
order by e1.salary;

-- 39.update salary of all HR employee by 10%
update employee set salary=salary * 1.10 where dept_id = (select dept_id from departments where dept_name ='HR');
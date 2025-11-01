create database departments;
use departments;

create table department(
DeptID int primary key,
Deptname varchar(50),
Location varchar(50)
);

create table employee(
EmpID int primary key,
Empname varchar(50),
Gender char(1),
Salary decimal(10,2),
Joindate date,
DeptID int,
ManagerID int,
foreign key (DeptID) references department(DeptID)
);


create table projects(
ProjectID int primary key,
Projectname varchar(50),
Startdate date,
Enddate date,
DeptID int,
foreign key (DeptID) references department(DeptID)
);

insert into department values(1,'IT','Bangalore'),
								(2,'HR','Pune'),
                                (3,'Finance','Mumbai'),
                                (4,'Marketing','Delhi');
                                
insert into employee values(101,'Amit','M',55000,'2021-01-10',1,null),
							(102,'Priya','F',60000,'2020-03-15',1,101),
                            (103,'Ravi','M',45000,'2022-07-12',2,102),
                            (104,'Sneha','F',70000,'2019-10-01',3,101),
                            (105,'Arjun','M',50000,'2021-08-23',4,102),
                            (106,'Meena','F',80000,'2018-05-11',1,101),
                            (107,'Vijay','M',47000,'2023-04-19',2,103);
                            
                            
insert into projects values(201,'Watson AI','2021-06-01','2022-12-31',1),
							(202,'BlueMix Cloud','2022-09-15','2023-06-30',1),
                            (203,'HR Portal','2020-09-01','2021-04-10',2),
                            (204,'Finance Tracker','2021-03-10','2022-09-10',3),
                            (205,'Brand Campaign','2023-01-01',null,4);
                            
select * from department;
select * from employee;
select * from projects;

-- 1 display all employee name and their department name 
select e.Empname ,d.Deptname 
from employee e 
join department d 
on e.DeptID=d.DeptID;

-- 2 list employee who joined after 1st jan 2021
select Empname,Joindate from employee where Joindate > '2021-01-01';

-- 3 find total number of employees in each department
select e.Empname ,sum(d.DeptID) as total_employee 
from employee e 
join department d on e.DeptId=d.DeptID 
group by e.Empname;

-- 4 show all projects halndled by "IT" department
select d.Deptname ,p.Projectname 
from department d 
join projects p on d.DeptID=p.DeptId 
where d.Deptname='IT'; 

-- 5 display names of all female employees
select Empname, Gender from employee where Gender='F';

-- 6 find highest salary in each department

SELECT d.Deptname,e.Empname,e.Salary
FROM employee e
JOIN department d
ON e.DeptID = d.DeptID
WHERE 
e.Salary = (
SELECT MAX(Salary)
FROM employee
WHERE d.DeptID = e.DeptID
);

-- 7 list employees whose salary is above average salary
select e.Empname,d.Deptname,e.Salary 
from employee e 
join department d on d.DeptID=e.DeptID 
where 
e.Salary > 
(select avg(salary) 
from employee 
where e.DeptID=d.DeptID);

-- 8 display department that have more than one project
select d.Deptname ,count(p.ProjectID) as projects 
from department d 
join projects p on d.DeptID=p.DeptID 
group by d.Deptname 
having count(p.projectID) > 1;

-- 9 show employee name along with their manager names
select Empname ,ManagerID from employee;

-- 10 find department where project duration (end date-start date) is longest
select Projectname,Startdate,Enddate,
datediff(Enddate , Startdate) as duration
from projects 
order by duration desc 
limit 1 ;
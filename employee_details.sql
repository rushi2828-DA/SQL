-- create database employee_details
create database employee_details;
use employee_details;

create table employee_info(
id int,
employee_name varchar(255),
gender varchar(255),
department varchar(255),
salary varchar(255)
);

select * from employee_info;

insert into employee_info values(1, 'rushikesh patil','M', 'software engineer', '40000');
insert into employee_info values(2, 'rahul patil','M', 'software engineer', '35000');
insert into employee_info values(3, 'josh jagtap','M', 'security analyst', '30000');
insert into employee_info values(4, 'rohini gupta','f', 'administrator', '30000');
insert into employee_info values(5, 'rohit patil','M', 'QA & testing', '25000');
insert into employee_info values(6, 'rushikesh mohite','M', 'r&d', '30000');
insert into employee_info values(7, 'snehal khot','F', 'cyber security', '40000');
insert into employee_info values(8, 'omkar salokhe','M', 'software engineer', '30000');
insert into employee_info values(9, 'ankita mandal','F', 'IT management', '40000');
insert into employee_info values(10, 'nazim maner','M', 'technical support', '30000');

-- retrive price greater than 30000
select * from employee_info where salary >30000;

-- retrive price less than 35000
select * from  employee_info where salary< 35000;

-- price between 25000 to 35000
select * from employee_info where salary between 25000 and 35000;

-- arrange data by descending order
select * from employee_info order by department desc;

-- arrange data by ascending order 
select * from employee_info order by department asc;

-- mysql min() and max() function
select min(salary) as smallestsalary from employee_info;
select max(salary) as largestsalary from employee_info;

-- mysql COUNT() , AVG() and SUM() functions
select count(gender) from employee_info;
select avg(salary) from employee_info;
select sum(salary) from employee_info;

-- AND ,OR and NOT OPERATOR
select * from employee_info where department ='software engineer' and salary= '30000';
select * from employee_info where not department ='software engineer';
select * from employee_info where employee_name='rushikesh patil' or salary='30000';

-- mysql LIMIT clause 
select * from employee_info limit 35000;

-- mysql LIKE operator
select * from employee_info where employee_name like 'r%';
select * from employee_info where department like '%t';

select * from employee_info where employee_name like 'r%l';
select * from employee_info where employee_name like '_n%';
select * from employee_info where employee_name like '__s%';
select * from employee_info where department like '%r%';

select * from employee_info where employee_name not like '%l';

-- mysql IN operator
select * from employee_info where department in ('administrator', 'r&d');
select * from employee_info where salary not in ('25000', '40000');
 
 -- mysql GROUP BY
 select count(id), salary
 from employee_info group by salary;
 
 select count(id) , employee_name 
 from employee_info group by employee_name order by count(id) desc;
 
 -- mysql HAVING clause 
 select count(id) salary from employee_info group by salary having count(id> 30000);
 
 -- mysql EXISTS operator
 
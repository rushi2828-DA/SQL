-- create database petrop_pump
CREATE DATABASE petrol_pump;
use petrol_pump;

-- create table petrol_pump
create table petrol_pump(
id int,
fuel_name varchar (255),
vehicle varchar(255),
price varchar (255),
stock varchar (255)
);

select * from petrol_pump;

insert into petrol_pump values (1, 'Petrol', '2Wheeler','100','5000');
insert into petrol_pump values (2, 'Disel', '4Wheeler','500','8000');
insert into petrol_pump values (3, 'Petrol', '4Wheeler','200','4000');
insert into petrol_pump values (4, 'CNG', '4Wheeler','800','6000');
insert into petrol_pump values (5, 'Petrol', '2Wheeler','300','6000');
insert into petrol_pump values (6, 'Disel', '4Wheeler','800','9000');
insert into petrol_pump values (7, 'CNG', '4Wheeler','600','8000');
insert into petrol_pump values (8, 'Petrol', '2Wheeler','200','4000');
insert into petrol_pump values (9, 'Petrol', '4Wheeler','700','9000');
insert into petrol_pump values (10, 'Disel', '4Wheeler','800','8000');

-- retrive price greater than 500
select * from petrol_pump where price >500;

-- retrive price less than 400
select * from petrol_pump where price < 400;

-- price between 400 to 800
select * from petrol_pump where price between 400 and 800;

-- arrange data by descending order
select * from petrol_pump order by fuel_name desc;

-- arrange data by ascending order
select * from petrol_pump order by fuel_name asc;

-- AND , OR and NOT operator
select * from petrol_pump where fuel_name= 'disel' and price='800'; 
select * from petrol_pump where not stock='8000';
select * from petrol_pump where price = '500' or stock='8000';

-- mysql count(),avg() and sum() functions
select count(vehicle) from petrol_pump;
select avg(price) from petrol_pump;
select sum(price) from petrol_pump;

-- mysql min() and M=max() functions
select min(price) as smallestprice from petrol_pump;
select max(stock) as largestprice from petrol_pump;

-- mysql like operator
select * from petrol_pump where fuel_name like'p%';
select * from petrol_pump where fuel_name like '%g';

select * from petrol_pump where fuel_name like '%e%';
select * from petrol_pump where fuel_name like '_i%';
select * from petrol_pump where fuel_name like '___r%';

select * from petrol_pump where fuel_name like 'p%l';

select * from petrol_pump where fuel_name not like '%l';

-- mysql IN operator
select * from petrol_pump where price in ('400','700');
select * from petrol_pump where stock not in ('4000', '8000');

-- mysql GROUP BY 
select count(id), fuel_name 
from petrol_pump group by fuel_name;

select count(id) , price 
from petrol_pump group by price order by count(id) desc;

-- mysql HAVING clause
select count(id) fuel_name from petrol_pump group by fuel_name having count(id >2);

-- mysql LIMIT clause
select * from petrol_pump limit 3;

-- mysql EXISTS operator


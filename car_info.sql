-- create database cars

create database cars;
use cars;

create table car_info(
car_name varchar(250),
color varchar(250),
age int,
speed int,
autopass varchar(250)
);



insert into car_info values('BMW','Red','5','99','Y');
insert into car_info values('Volvo','Black','7','86','Y');
insert into car_info values('VW','Gray','8','87','N');
insert into car_info values('VW','White','7','88','Y');
insert into car_info values('Ford','White','2','111','Y');
insert into car_info values('VW','White','17','86','Y');
insert into car_info values('Tesla','Red','2','103','Y');
insert into car_info values('BMW','Black','9','87','Y');
insert into car_info values('Volvo','Gray','4','94','N');
insert into car_info values('Ford','White','11','78','N');
insert into car_info values('Toyota','Gray','12','77','N');
insert into car_info values('VW','White','9','85','N');
insert into car_info values('Toyota','Blue','6','86','Y');

select * from cars_info;

 
select * from car_info where speed > 90;
select * from car_info where age < 5;
select * from car_info where age between 5 and 10;

select min(speed) as smallestspeed from car_info;
select max(age) as largestage from car_info;

select count(speed) from car_info;
select sum(speed) from car_info;
select avg(speed) from car_info;

select * from car_info where car_name='vw' and color='white';
select * from car_info where car_name ='toyota';
select * from car_info where not color='white' or age ='9';

select * from car_info where car_name like '%o';
select * from car_info where color like 'b%';
select * from car_info where car_name like '_O%';
select * from car_info where car_name like '__l%';
select * from car_info where car_name like 't%a';
select * from car_info where color like '%r%';

select * from car_info where color not like 'b%';

select * from car_info where car_name in ('toyota','tesla');
select * from car_info where car_name not in ('vw','bmw');

-- create database school
create database school;
use school;

-- create table school_info
create table school_info(
id int,
name varchar(255),
university varchar(20),
code varchar(50),
phone_number varchar(255),
fee varchar(50)
);

select * from school_info;

insert into school_info values(1,'vpip','shivaji','069','02428224793','5000');
insert into school_info values(2,'warna school','maharastra','2233','9585474552','2000');
insert into school_info values(3,'kodoli school','maharastra','5500','9853214565','10000');
insert into school_info values(4,'shahu school','mumbai','2020','0235695478','3000');


drop table school_info;

-- retrive fee greater than 3000
select * from school_info where fee>3000;

-- retrive fee less than 5000
select * from school_info where fee<5000;

-- fee between 2000 to 50000
select * from school_info where fee between 2000 and 5000;

-- arrange data by ascending order
select * from school_info order by name asc;

-- arrange data by descending order
select * from school_info order by name desc;

-- mysql min() max() function
select min(fee) as smallest_fee from school_info;

select max(fee) as largest_fee from school_info;

-- mysql count() , avg() and sum() function
select count(name) from school_info;
select avg(fee) from school_info;
select sum(fee) from school_info;

-- mysql and ,or and not operators
select * from school_info where university='shivaji' and fee='5000';
select * from school_info where university ='maharastra' or fee='5000';
select * from school_info where not name ='vpip';

-- mysql limit clause 
select * from school_info limit 5000;

-- mysql like operator
select * from school_info where university like '%a';
select * from school_info where university like 'm%';

select * from school_info where name like '__i%';
select * from school_info where name like '%a%';
select * from school_info where name like 'w%l';
select * from school_info where name like '_h%';

 select * from school_info where name not like '%l';
 
 -- mysql in operator
 select * from school_info where university in ('shivaji','mumbai');
 select * from school_info where university not in ('shivaji','mumbai');
 
 -- group by
 select count(id),fee from school_info group by fee;
 
 select count(name) ,university from school_info group by university order by count(name) desc;
 
 -- having operator
 select count(id) fee from school_info group by fee having count(id>'5000');
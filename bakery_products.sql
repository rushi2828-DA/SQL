-- create database Bakery
create database Bakery;
use bakery;

-- create table bakery_products
create table bakery_products(
product_id int,
product_name varchar(255),
category_name varchar(255),
price varchar(255),
stock varchar(255)
);

select * from bakery_products;

insert into bakery_products values (1, 'parle-G', 'cookie','20','300');
insert into bakery_products values (2, 'Butter', 'dairy','50','200');
insert into bakery_products values (3, 'oreo', 'cookie','30','100');
insert into bakery_products values (4, 'pastry', 'cake','70','100');
insert into bakery_products values (5, 'milkbread', 'bread','30','200');
insert into bakery_products values (6, 'marrie', 'cookie','20','200');
insert into bakery_products values (7, 'chocolate donut', 'donut','80','500');
insert into bakery_products values (8, 'potato chips', 'snacks','10','200');
insert into bakery_products values (9, 'maggie', 'noodles','20','500');
insert into bakery_products values (10, 'pasta', 'pasta','40','400');


-- reterive price greater than 50
select * from bakery_products where price >50;

-- retrive price less than 400
select * from bakery_products where stock <400;

-- price between 30 to 50
select * from bakery_products where price between '30' and '50';

-- arrange data by descending order 
select * from bakery_products order by product_name ;

-- arrange data by ascending order 
select * from bakery_products order by price ;

-- AND,OR and NOT operators
select * from bakery_products where category_name='cookie' and price='20';
select * from bakery_products where not price ='30';
select * from bakery_products where category_name='cookie' or price ='20';

-- mysql LIMIT clause 
select * from bakery_products limit 20;

-- mysql LIKE operator
select * from bakery_products where price like '20%';
select * from bakery_products where product_name like '%Parle-G';

select * from bakery_products where product_name like '%a%';
select * from bakery_products where category_name like '_a%';
select * from bakery_products where product_name like '__t%';

select * from bakery_products where product_name like 'P%G';
select * from bakery_products where product_name not like '%e';

-- mysql IN operator
select * from bakery_products where category_name in ('cookie', 'cake');
select * from bakery_products where category_name not in ('cookie','bread');

-- mysql MIN() and max() functions
select min(price) as smallestprice from bakery_products;
select max(price) as largestprice from bakery_products;

-- mysql COUNT(), AVG() and SUM() function
select count(product_name) from bakery_products;
select avg(price) from bakery_products;
select sum(price) from bakery_products;

-- mysql GROUP BY
select count(product_id), product_name
from bakery_products group by product_name ;

select count(product_id) , category_name
from bakery_products group by category_name order by count(product_id) desc;

-- mysql HAVING clause
select count(product_id) price from bakery_products group by price having count(product_id >2 );



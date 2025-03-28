-- create database game_store
create database game_store;
use game_store;

create table user(
user_id int,
user_name varchar(30),
email varchar(255),
phone varchar(255)
); 

create table games(
game_id int,
title varchar(100),
genre varchar(50),
price varchar(50),
stock varchar(50)
);

create table orders(
order_id int auto_increment primary key,
customer_id int,
orderdate datetime default current_timestamp,
total_amount decimal(10,2)
foreign key (customer_id) references customers(customer_id)
);
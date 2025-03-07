-- create database customer info
CREATE DATABASE customer_info;
use customer_info;
-- create table customer_details
create table customer_details(  
id int,
name varchar (255),
contact varchar(255),
address varchar(255),
city varchar(255),
postal_code varchar(255),
country varchar(255)
);
  
 select * from  customer_details;
  insert into customer_details values (1,'rushikesh','7589663399','r k nagar','kolhapur','416003','india');
  insert into customer_details values (2, 'rahul' , '9875462156', 'rajaramouri','kolhapur','419822', 'india');
  insert into customer_details values (3, 'abhay','8975462130','mohare','kolhapur','416114' , 'india');
  insert into customer_details values (4,'revan' ,'9511778904','lahor','istambul','58771','pakistan');
  insert into customer_details values (5,'gaurav','8744556620','turkey','canada','85441','USA');
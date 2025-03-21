-- create database simcard_details
create database simcard_details;
use simcard_details;
-- create table simcard_info
create table simcard_info(
id int,
provider varchar(255),
number varchar(255),
recharge_amount varchar(255),
connectivity varchar(255)
);
-- read all the data 

select * from simcard_info;

-- insert some data 
insert into simcard_info values (1,'JIO','9577441420','1000','5G');
insert into simcard_info values (2,'JIO','8042514561','800','5G');
insert into simcard_info values (3,'Airtel','7854963210','500','4G');
insert into simcard_info values (4,'Vi','9014521066','800','5G');
insert into simcard_info values (5,'JIO','9012015879','600','5G');
insert into simcard_info values (6,'Idea','7015458565','850','3G');
insert into simcard_info values (7,'Airtel','9050152314','900','5G');
insert into simcard_info values (8,'JIO','8545722013','1000','5G');
insert into simcard_info values (9,'Airtel','9015456201','500','5G');
insert into simcard_info values (10,'JIo','9096599023','800','4G');

-- retrive the price greater than 800
select * from simcard_info where recharge_amount>800;
-- retrive the price less than 700
select * from simcard_info where recharge_amount<700;
-- price between 700 to 1000
select * from simcard_info where recharge_amount between 700 and 1000;
-- arrange data by descending order 
select * from simcard_info order by provider desc ;
-- arrange data by ascending order
select * from simcard_info order by provider asc ;


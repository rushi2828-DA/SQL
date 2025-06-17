create database lung_cancer;
use lung_cancer;

select * from lung_cancer_dataset;

-- specified by gender
select * from lung_cancer_dataset where gender='m';
select count(gender) from lung_cancer_dataset where gender='m';

select * from lung_cancer_dataset where gender='f';
select count(gender) from lung_cancer_dataset where gender='f';

-- gender is male and have lung cancer 
select *  from lung_cancer_dataset where gender='m' and lung_cancer='yes';
select count(*) gender, lung_cancer from lung_cancer_dataset where gender='m' and lung_cancer='yes'; 

select * from lung_cancer_dataset where gender='f' and lung_cancer='yes';
select count(*) gender ,lung_cancer from lung_cancer_dataset where gender='f' and lung_cancer='yes';

select count(gender) , lung_cancer from lung_cancer_dataset group by lung_cancer ;

-- age greater than 60
select count(age) from lung_cancer_dataset where age > 60;
select * from lung_cancer_dataset where age > 60;

select * from lung_cancer_dataset where age > 60 and gender='m';
select count(age) from lung_cancer_dataset where age > 60 and gender='m';

-- average
select sum(smoking) from lung_cancer_dataset;
select avg(age) from lung_cancer_dataset;

-- minimum and maximum age 
select min(age) from lung_cancer_dataset ;
select max(age) from lung_cancer_dataset;

-- between 30-60
select * from lung_cancer_dataset where age between 30 and 60;
select count(age) from lung_cancer_dataset where age between 30 and 60;

-- having clause
select avg(chest_pain),lung_cancer from lung_cancer_dataset group by lung_cancer having avg(chest_pain)> 1;


-- limit clause
select * from lung_cancer_dataset limit 5;

-- all the gender 
select distinct gender,chest_pain from lung_cancer_dataset;

-- in clause
select * from lung_cancer_dataset where age in (30,35);
select count(age) from lung_cancer_dataset where age in (30,35);

-- ascending and descending order
select * from lung_cancer_dataset order by age asc;
select * from lung_cancer_dataset order by chest_pain desc;

-- and ,or and not 
select * from lung_cancer_dataset where age=30 and lung_cancer='yes';
select * from lung_cancer_dataset where chest_pain=2 or gender='m';

select * from lung_cancer_dataset where not gender='m' and chest_pain=2;
create database loan;
use loan;

select * from loan_data;

-- gender 
select * from loan_data where gender='male';
select * from loan_data where gender='female';

-- age
select * from loan_data where age >50;
select * from loan_data where age <20;

-- education level
select * from loan_data where educationlevel='bachelor';
select * from loan_data where educationlevel='phd';

-- between
select * from loan_data where creditscore between 200 and 300;
select * from loan_data where age between 40 and 50;

-- count
select count(maritalstatus) from loan_data where maritalstatus='married';
select count(gender) from loan_data where gender='male';

-- min and max
select min(age) as age from loan_data;
select max(age) as age from loan_data;

-- sum , count and avg
select sum(annualincome) as income from loan_data;
select avg(annualincome) as oncome from loan_data;
select count(annualincome) as income from loan_data;

-- subquery
select count(gender),maritalstatus 
from loan_data 
where maritalstatus=(
select maritalstatus 
from loan_data 
where maritalstatus='married'
group by maritalstatus
limit 1)
 group by maritalstatus;


select count(gender) 
from loan_data 
where gender=
(select gender 
from loan_data 
where gender='male'
limit 1);

select count(loanamountrequested)
from loan_data 
where loanapproved=(
select loanapproved 
from loan_data 
where loanapproved='yes'  
limit 1) 
group by loanapproved;

-- having
select count(age), gender from loan_data group by gender having count(age);

-- like
select * from loan_data where name like 'j%';
select * from loan_data where name like'%n';
select * from loan_data where name like '%r%';
select * from loan_data where maritalstatus like 'single';

select * from loan_data where purposeofloan not like 'c%';

-- in 
select * from loan_data where maritalstatus in ('single','married');
select * from loan_data where employmentstatus not in ('student','retired');






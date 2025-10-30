create database category;
use category;

create table categories(
categoryID int primary key,
categoryName varchar(50)
);

create table products(
productID int primary key,
productname varchar(100),
categoryID int,
unitprice decimal(10,2),
foreign key (categoryID) references categories(categoryID)
);

create table customers(
customerID int primary key,
customername varchar(100),
city varchar(100),
region varchar(100)
);

create table orders(
orderID int primary key,
customerId int,
orderdate date,
region varchar(50),
foreign key (customerID) references customers(customerID)
 );
 
 create table orderdetails(
 orderdetailID int primary key,
 orderID int,
 productID int,
 quantity int,
 discount decimal(5,2),
 foreign key (orderID) references orders(orderID),
 foreign key (productID) references products(productID)
 );
 
 insert into categories values(1,'Furniture'),
								(2,'Office Supplies'),
                                (3,'Technology');
                                
insert into products values(101,'Office Cahir',1,2500),
							(102,'Desk',1,5000),
                            (103,'Pen',2,20),
                            (104,'Notebook',3,50),
                            (105,'Laptop',3,60000),
                            (106,'Headphone',3,3000);
                            
insert into customers values(1,'Ravi Sharma','Delhi','North'),
							(2,'Sneha Patil','Mumbai','West'),
                            (3,'Amit Verma','Kolkata','East'),
                            (4,'Priya Rao','Bangalore','South');
                            
insert into orders values(1001,1,'2024-04-10','North'),
						(1002,2,'2024-04-11','West'),
                        (1003,3,'2024-04-12','West'),
                        (1004,4,'2024-04-13','South'),
                        (1005,1,'2024-04-14','North');
                        
insert into orderdetails values(1,1001,101,2,0.05),
								(2,1001,103,10,0),
                                (3,1002,105,1,0.1),
                                (4,1003,104,5,0),
                                (5,1004,106,2,0.2),
                                (6,1005,102,1,0);

select * from categories;
select * from products;
select * from customers;
select * from orders;
select * from orderdetails;

-- show all customer and their cities
select customerName,city from customers;

-- list all product names and their prices
select productname, unitprice from products;

-- display all orders placed in april2024
select * from orders where  month(orderdate)=4 and year(orderdate)=2024;

-- count total order placed in april 2024
select count(*) as totalcustomers from customers;

-- find all unique regions in customer table
select distinct region from customers;

-- show product priced above 1000
select * from products where unitprice > 1000;

-- display all products with their categoryname
select p.productname,c.categoryname from products p join categories c on p.categoryID=c.categoryID;

-- show customer name, orderID, and orderdate
select c.customername,o.orderID,o.orderdate from customers c join orders o on c.customerID=o.customerID;

-- display all product purchased by ravi sharma
select p.productname from customers c 
join orders o on c.customerID=o.customerID 
join orderdetails od on o.orderID=od.orderID 
join products p on od.productID=p.productID 
where c.customername ='Ravi Sharma'; 

-- find total quantity of products sold in each other
select o.orderID,sum(od.quantity) as totalquantity 
from orders o 
join orderdetails od on o.orderID=od.orderID group by o.orderID;

-- calculate revenue for each order (quantity * unitprice * (1-discount))
select o.orderID,round(sum(od.quantity * p.unitprice * (1-od.discount)),2) as revenue 
from orders o 
join orderdetails od on o.orderID=od.orderID
join products p on od.productID=p.productID
group by o.orderID; 

-- list categories and count of product in each
select c.categoryname ,count(p.productID) as productcount from categories c 
join products p on c.categoryID=p.categoryID 
group by c.categoryname;

-- find customerwho placed more than one order
select c.customername ,count(o.orderID) as ordercount from customers c 
join orders o on c.customerID=o.customerID 
group by c.customername 
having count(o.orderID) > 1;

-- show total sales amount for each region
select o.region,round(sum(od.quantity * p.unitprice * (1-od.discount)), 2 ) as totalsales
from orders o
join orderdetails od on o.orderID=od.orderID 
join products p on od.productID=p.productID
group by o.region;

-- find most expensive product in each category
select c.categoryname,p.productname,p.unitprice 
from products p
join categories c on p.categoryID=c.categoryID
where p.unitprice= (
select max(p2.unitprice)
from products p2
where p2.categoryID=p.categoryID
);

-- display top 3 product by total revenue 
select p.productname,round(sum(od.quantity * p.unitprice *(1 - od.discount)), 2) as revenue 
from orderdetails od 
join products p on od.productID=p.productID 
group by p.productname 
order by revenue desc 
limit 3;
-- find all orders containing products from more than one category
select o.orderID from orders o 
join orderdetails od on o.orderID=od.orderID 
join products p on od.productID=p.productID 
group by o.orderID having count(distinct p.categoryID) > 1;


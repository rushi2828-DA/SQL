-- Step 1: Create a Database
CREATE DATABASE ShopDB;
USE ShopDB;

-- Step 2: Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- Step 3: Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 4: Insert Sample Data into Customers Table
INSERT INTO Customers (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com');

-- Step 5: Insert Sample Data into Orders Table
INSERT INTO Orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 800.00),
(102, 1, 'Mouse', 20.00),
(103, 2, 'Keyboard', 50.00);

SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name, Customers.email, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name, Customers.email, Orders.product, Orders.amount
FROM Customers
CROSS JOIN Orders;

SELECT * FROM customers;
SELECT * FROM orders;






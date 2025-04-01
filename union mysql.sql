-- Step 1: Create a new database
CREATE DATABASE example_db;

-- Step 2: Use the newly created database
USE example_db;

-- Step 3: Create first table (employees)
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    position VARCHAR(50)
);

-- Step 4: Create second table (contractors)
CREATE TABLE contractors (
    id INT,
    name VARCHAR(50),
    position VARCHAR(50)
);

-- Step 5: Insert data into the employees table
INSERT INTO employees (id, name, position) VALUES
(1, 'Alice', 'Manager'),
(2, 'Bob', 'Developer'),
(3, 'Charlie', 'Designer');

-- Step 6: Insert data into the contractors table
INSERT INTO contractors (id, name, position) VALUES
(1, 'David', 'Consultant'),
(2, 'Eva', 'Developer'),
(3, 'Frank', 'Architect');

-- Step 7: Use UNION operator to combine data from both tables
SELECT id, name, position FROM employees
UNION
SELECT id, name, position FROM contractors;

-- The UNION operator removes duplicates by default.
-- If you want to include duplicates, you can use UNION ALL.


select * from employees ;

select * from contractors;

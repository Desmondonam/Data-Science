-- create the customers table
USE my_database;
CREATE TABLE Customers (
	customers_id INT PRIMARY KEY,
    customers_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- insert data into the customers table
INSERT INTO Customers ( customers_id, customers_name, city, country) 
VALUES
	(1, 'Alice', 'New York', 'USA'),
    (2, 'Bob', 'London', 'UK'), 
    (3, 'Chalie', 'Paris', 'France'),
    (4, 'David', 'Tokyo', 'Japan'),
    (5, 'Emily', 'Sydney', 'Australia');
    
-- create orders table
CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	order_date DATE,
    customers_id INT,
    amount INT,
    FOREIGN KEY (customers_id) REFERENCES Customers(customers_id)
);

-- Insert data into the orders table
INSERT INTO Orders (order_id, order_date, customers_id, amount)
VALUES
	(101, '2023-01-01', 1, 100),
    (102, '2023-01-02', 2, 200),
    (103, '2023-01-03', 3, 150),
    (104, '2023-01-04', 4, 300),
    (105, '2023-01-05', 5, 250);
    
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Inner join
SELECT orders.order_id, customers.customers_name FROM orders
INNER JOIN customers ON orders.customers_id = customers.customers_id;

-- left join
SELECT customers.customers_name, orders.order_id FROM customers
LEFT JOIN orders ON customers.customers_id = orders.customers_id;

-- Right join
SELECT orders.order_id, customers.customers_name FROM orders
RIGHT JOIN customers ON orders.customers_id = customers.customers_id;

-- full join
-- SELECT Customers.customers_name, orders.order_id FROM Customers
-- FULL JOIN orders ON orders.customers_id = customers.customers_id;

-- create employees table
CREATE TABLE employee_table (
	first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Insert data
INSERT INTO employee_table (first_name, last_name)
VALUES
('John', 'Kennedy'),
('Chris', 'Brown');

SELECT * FROM employee_table;
-- Use of string functions
SELECT CONCAT(first_name, " ", last_name) as full_name FROM employee_table;

-- extracting domain from emails
CREATE TABLE employee_table2 (
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

-- Insert data
INSERT INTO employee_table (first_name, last_name, email)
VALUES
('John', 'Kennedy', 'kenjhn@gmail.com'),
('Chris', 'Brown', 'bchris@h);
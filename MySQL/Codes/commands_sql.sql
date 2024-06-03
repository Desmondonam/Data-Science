-- Data Definition Language
-- Define , modify and to delete
SHOW DATABASES;
USE car_prices;
CREATE TABLE examtab (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
SELECT * FROM examtab;

-- Alter
ALTER TABLE examtab	ADD email VARCHAR(50);

-- drop a table
DROP TABLE examtab;

-- Data manipulation language
-- create an example tables
CREATE TABLE employee (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- nsert data into the table
INSERT INTO employee (name, department, salary) VALUES 
	('John Kiche', 'Engineering', 50000.00),
    ('Jane Smith', 'Sales', 60000.00),
    ('Michael Darko', 'Marketing', 55000.00);
    
    
SELECT * FROM employee;

-- updating the data in a table
UPDATE employee SET salary = 52000.00 WHERE NAME = 'John Kiche';

-- Deleting data from the table
DELETE FROM employee WHERE name = 'Michael Darko';

-- Data Control Language
-- Grant permission 
GRANT SELECT ON employee TO 'root'@'localhost';

-- transaction control
-- create table for the accounts
CREATE TABLE accounts (
	account_number INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

-- insert data
INSERT INTO accounts (account_number, account_holder, balance) VALUES
	(1001, 'John', 1000.00),
    (1002, 'Jael', 500.00);

START TRANSACTION;

-- DEBIT
UPDATE accounts SET balance = balance -100 WHERE account_number = 1001;

-- credit 
UPDATE accounts SET balance = balance + 100 WHERE account_number = 1002;

-- check if the transaction was successful
SELECT * FROM accounts WHERE account_number IN (1001, 1002);

COMMIT;


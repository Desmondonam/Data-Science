-- Creating and managing databases
CREATE DATABASE bank;

-- show databases
SHOW DATABASES;



-- Drop a databse
DROP DATABASE bank;

-- if exist 
DROP DATABASE IF EXISTs bank;
CREATE DATABASE IF NOT EXISTS bank;

-- Creating tables and schemas
USE bank;
CREATE TABLE users (
	id INT PRIMARY KEY,
    city VARCHAR(50),
    name_ varchar(255),
    address VARCHAR(255),
    credit_card VARCHAR(20)
);

-- PRIMARY KEY (city, id)
-- city VARCHAR(255) REFERENCES locations(city)


-- Managing tables
-- ALTER
ALTER TABLE users ADD COLUMN active BOOL;

-- Drop a column
ALTER TABLE users DROP city;

-- Renaming a column
ALTER TABLE users RENAME COLUMN credit_card TO credit_card_number;

-- Drop a table 
DROP TABLE users;
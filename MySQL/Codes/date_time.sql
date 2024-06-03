-- Get the current date and time
SELECT NOW();

-- current date
SELECT CURDATE();

-- current time
SELECT CURTIME();

-- extract the date part from date time expression
SELECT DATE(NOW());

-- extract the current time
SELECT TIME(NOW());

-- extract the current day
SELECT DAY(NOW());

-- extract the month
SELECT MONTH(NOW());

-- extract the year
SELECT YEAR(NOW());

-- AGE 
-- CREATE A TABLE
USE my_database;
CREATE TABLE persons (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE
);

-- insert data
insert into persons (name, birthdate) VALUES
	('John', '1990-05-15'),
    ('Jane', '1985-10-25'),
    ('Michael', '1978-03-12');
    
-- query to calculate the age
SELECT 
	name,
    TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM 
	persons;
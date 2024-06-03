SELECT LENGTH('Desmond');
SELECT UPPER('Hello World');
SELECT LOWER('Hello WORLD');
SELECT REPLACE('Hello world', 'world', 'Desmond');
SELECT TRIM('   Hello     ');
SELECT CONCAT('Hello', ' ', 'Desmond');
SELECT SUBSTRING('MySQL', 3, 3);

USE my_database;
show tables;
-- count
SELECT COUNT(*) FROM students;
-- sum of ages
SELECT SUM(age) FROM students;
-- Average
SELECT AVG(age) FROM students;
-- min age
SELECT MIN(age) FROM students;
-- Max age
SELECT MAX(age) FROM students;
-- group_concat
SELECT GROUP_CONCAT(age SEPARATOR ',') FROM students;
-- group by
SELECT gender, COUNT(*) FROM students GROUP BY gender;
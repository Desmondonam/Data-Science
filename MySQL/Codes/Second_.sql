-- Data Manipulation Language
-- - INSERT - add
-- - UPDATE - modify
-- - DELETE - remove
-- - SELECT - retrieve

-- INSERT
USE database_name;
-- Create a table of students
CREATE TABLE students (
	id INT AUTO_INCREMENT,
    name VARCHAR(255),
    age INT,
    PRIMARY KEY (id)
);


-- Insert
INSERT INTO students(id, name, age)
VALUES (1, 'Alice', 21);

-- Inserting multiple values
INSERT INTO students (name, age) VALUES
('Debrah', 20),
('Bob', 23),
('Brown', 24);
SELECT * FROM students;



INSERT INTO students(id, name, age)
VALUES (2, 'Edwin', 22);

-- UPDATE
UPDATE students
SET age = 25
WHERE name = 'Alice';

UPDATE students 
SET age = 24
where age < 23;

-- DELETE 

-- syntax
-- DELETE FROM Table_name
-- WHERE Condition;

DELETE FROM students
WHERE name = 'Alice';

SELECT * FROM students;

DELETE FROM students
WHERE id = 2;

-- SELECT - Used to retrieve data from one or more tables

-- Syntax:
-- SELECT Column1, Column2 ....
-- FROM Table_name
-- WHERE condition;

-- Example retriece id and age
SELECT id, age
FROM students;

-- retrieve data of students of age 24
SELECT * 
FROM students
WHERE age = 24;

-- Create a small database application in MySQL. Test on Skills of DML - Insert, Update, Delete, 
-- Select
-- Task: TO design a scenarion where you manage a simple BookStore Database

-- Task 1: Create a database named Bookstore
CREATE DATABASE Bookstore;
USE Bookstore;

-- Create a table named 'Books' - Atrributes: Books_id(Primary Key), author, Title, genre, price
CREATE TABLE Books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(50),
    price DECIMAL(10, 2)
);
    
-- Task 2: Insert data into the table called books, Title, Genre, Author, Price
INSERT INTO books (title, author, genre, price) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 19.99),
('1984', 'George Orwell', 'Dystopian', 15.99),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Novel', 14.99),
('Moby Dick', 'Herman Melville', 'Adventure', 17.50);


-- Task 3: Update the data , choose one book, update the price, 
UPDATE books 
SET price = 20.99
WHERE book_id = 1;
-- Task 4: Delete the data, delete a book from the table
DELETE FROM books
WHERE book_id = 4;
-- Task 5: Query the data: Query all books that cost less than a given amount, say $15
-- How many books do you have in each Genre;

SELECT * FROM books
WHERE price < 15
ORDER BY price DESC;

SELECT genre, COUNT(*) AS number_of_books
FROM books
GROUP BY genre;


-- Joins in MySQL
-- 1. Inner
-- 2. Left Join
-- 3. Right Join
-- 4. Full Outer Join
-- 5. Cross Join
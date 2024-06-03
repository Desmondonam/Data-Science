USE my_database;
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- create table for employees
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- insert data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Marketing');

-- Insert employees data
INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(101, 'Mary Otieno', 1),
(102, 'Steve Achila', 1),
(103, 'Betha Sala', 2),
(104, 'Zoe Aditi', 3);

-- SHOW THE TABLES
SELECT * FROM departments;
SELECT * FROM employees;

-- Perform joins
-- Inner Joins
SELECT employees.employee_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- left join
SELECT employees.employee_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- right join
SELECT employees.employee_name, departments.department_name
FROM employees 
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- full join
-- SELECT employees.employee_name, departments.department_name
-- FROM employees
-- FULL OUTER JOIN departments ON employees.department_id = departments.department_id;

-- cross joins
SELECT employees.employee_name, departments.department_name
FROM employees
CROSS JOIN departments;

-- self join
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT 
);

-- Insert
INSERT INTO employee (employee_id, employee_name, manager_id) VALUES
(1, 'John', NULL),
(2, 'Jane', 1),
(3, 'Bob', 1), 
(4, 'Alice', 2),
(5, 'Eva', 2);

SELECT e.employee_name AS employee_name, m.employee_name AS manager_name
FROM employee e
LEFT JOIN employee m ON e.manager_id = m.employee_id;
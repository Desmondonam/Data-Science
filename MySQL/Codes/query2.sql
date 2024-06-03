SHOW TABLES;
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO users (name, email) VALUES
("Marther Zoe", "marther@gmail.com"),
('Ogweno Brian', 'ogbrian@example.com');

SELECT * FROM users;
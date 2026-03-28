-- 1️⃣ Create Database
CREATE DATABASE library_db;
USE library_db;

-- 2️⃣ Create Tables

-- Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    available INT
);

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- Issued books table
CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    issue_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- 3️⃣ Insert Sample Data

-- Books
INSERT INTO books (title, author, available)
VALUES 
('Python Basics', 'ABC', 5),
('DBMS Guide', 'XYZ', 3),
('JavaScript Essentials', 'DEF', 4);

-- Users
INSERT INTO users (name)
VALUES ('Rahul'), ('Simran'), ('Aman');

-- 4️⃣ Queries to Manage Library

-- Issue a book
INSERT INTO issued_books (user_id, book_id, issue_date)
VALUES (1, 1, CURDATE());

UPDATE books
SET available = available - 1
WHERE book_id = 1;

-- Return a book
DELETE FROM issued_books
WHERE user_id = 1 AND book_id = 1;

UPDATE books
SET available = available + 1
WHERE book_id = 1;

-- Show all issued books
SELECT users.name AS User_Name, books.title AS Book_Title, issue_date
FROM issued_books
JOIN users ON issued_books.user_id = users.user_id
JOIN books ON issued_books.book_id = books.book_id;

-- Show available books
SELECT * FROM books
WHERE available > 0;

-- Add new book
INSERT INTO books (title, author, available)
VALUES ('C Programming', 'GHI', 6);

-- Add new user
INSERT INTO users (name)
VALUES ('Karan');

-- Update book availability manually
UPDATE books
SET available = 10
WHERE book_id = 2;

-- Search for a book by title
SELECT * FROM books
WHERE title = 'Python Basics';

-- Search for a user by name
SELECT * FROM users
WHERE name = 'Simran';
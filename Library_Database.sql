-- ==========================================
-- Library Management Database
-- Created By: Muhammad Hassnain Raza
-- Project: SQL QA Portfolio Project
-- ==========================================

-- Create Database
CREATE DATABASE Library_DB;

-- Use Database
USE Library_DB;

-- ==========================================
-- Create Authors Table
-- ==========================================

CREATE TABLE Authors (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Author_Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100),
    Birth_Year INT
);

-- ==========================================
-- Create Books Table
-- ==========================================

CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Genre VARCHAR(100),
    Price DECIMAL(10,2),
    Author_ID INT,
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

-- ==========================================
-- Create Members Table
-- ==========================================

CREATE TABLE Members (
    Member_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Join_Date DATE
);

-- ==========================================
-- Create Staff Table
-- ==========================================

CREATE TABLE Staff (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Hire_Date DATE
);

-- ==========================================
-- Create Borrow Records Table
-- ==========================================

CREATE TABLE Borrow_Records (
    Borrow_ID INT AUTO_INCREMENT PRIMARY KEY,
    Member_ID INT,
    Book_ID INT,
    Staff_ID INT,
    Borrow_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- ==========================================
-- Insert Authors
-- ==========================================

INSERT INTO Authors (Author_Name, Country, Birth_Year)
VALUES
('J.K. Rowling','United Kingdom',1965),
('Dan Brown','United States',1964),
('George Orwell','United Kingdom',1903),
('Paulo Coelho','Brazil',1947),
('Robert C. Martin','United States',1952),
('Yuval Noah Harari','Israel',1976),
('Jane Austen','United Kingdom',1775),
('Mark Twain','United States',1835),
('Leo Tolstoy','Russia',1828),
('Stephen King','United States',1947);

-- ==========================================
-- Insert Books
-- ==========================================

INSERT INTO Books (Title,Genre,Price,Author_ID)
VALUES
('Harry Potter and the Philosopher''s Stone','Fantasy',25.99,1),
('The Da Vinci Code','Thriller',19.99,2),
('1984','Dystopian',15.50,3),
('Animal Farm','Political Satire',12.00,3),
('The Alchemist','Fiction',18.75,4),
('Clean Code','Programming',45.00,5),
('Clean Architecture','Programming',49.99,5),
('Sapiens','History',30.00,6),
('Pride and Prejudice','Romance',17.50,7),
('Adventures of Huckleberry Finn','Adventure',16.00,8),
('War and Peace','Historical Fiction',40.00,9),
('The Shining','Horror',22.50,10);

-- ==========================================
-- Insert Members
-- ==========================================

INSERT INTO Members (Full_Name,Email,Phone,Join_Date)
VALUES
('Ali Khan','ali.khan@email.com','03001234567','2024-01-15'),
('Ahmed Raza','ahmed.raza@email.com','03011234567','2024-02-10'),
('Sara Ahmed','sara.ahmed@email.com','03021234567','2024-03-05'),
('Fatima Noor','fatima.noor@email.com','03031234567','2024-03-20'),
('Usman Tariq','usman.tariq@email.com','03041234567','2024-04-01'),
('Ayesha Malik','ayesha.malik@email.com','03051234567','2024-04-18'),
('Hassan Ali','hassan.ali@email.com','03061234567','2024-05-02'),
('Zain Ahmed','zain.ahmed@email.com','03071234567','2024-05-15'),
('Noor Fatima','noor.fatima@email.com','03081234567','2024-06-01'),
('Bilal Khan','bilal.khan@email.com','03091234567','2024-06-20');

-- ==========================================
-- Insert Staff
-- ==========================================

INSERT INTO Staff (Full_Name,Position,Email,Hire_Date)
VALUES
('Imran Sheikh','Librarian','imran@library.com','2023-01-15'),
('Amina Saleem','Assistant Librarian','amina@library.com','2023-03-10'),
('Kashif Malik','Library Manager','kashif@library.com','2022-11-05'),
('Hira Khan','Receptionist','hira@library.com','2024-01-12'),
('Omar Farooq','Assistant','omar@library.com','2024-02-20');

-- ==========================================
-- Insert Borrow Records
-- ==========================================

INSERT INTO Borrow_Records (Member_ID,Book_ID,Staff_ID,Borrow_Date,Return_Date)
VALUES
(1,1,1,'2024-06-01','2024-06-15'),
(2,3,2,'2024-06-02','2024-06-16'),
(3,5,1,'2024-06-03','2024-06-17'),
(4,6,3,'2024-06-04','2024-06-18'),
(5,8,2,'2024-06-05','2024-06-19'),
(6,2,4,'2024-06-06','2024-06-20'),
(7,10,5,'2024-06-07','2024-06-21'),
(8,7,1,'2024-06-08','2024-06-22'),
(9,9,3,'2024-06-09','2024-06-23'),
(10,11,2,'2024-06-10','2024-06-24');
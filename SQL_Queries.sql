-- ==========================================
-- SQL QUERIES FOR QA TESTING
-- ==========================================

-- ==========================================
-- SELECT
-- ==========================================

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Staff;
SELECT * FROM Borrow_Records;

SELECT Title, Price FROM Books;
SELECT Full_Name, Email FROM Members;
SELECT Full_Name, Position FROM Staff;

-- ==========================================
-- WHERE
-- ==========================================

SELECT * FROM Books WHERE Genre='Programming';
SELECT * FROM Books WHERE Price>30;
SELECT * FROM Authors WHERE Country='United Kingdom';
SELECT * FROM Members WHERE Join_Date>'2024-04-01';

-- ==========================================
-- ORDER BY
-- ==========================================

SELECT * FROM Books ORDER BY Price ASC;
SELECT * FROM Books ORDER BY Price DESC;
SELECT * FROM Members ORDER BY Full_Name ASC;
SELECT * FROM Authors ORDER BY Birth_Year DESC;

-- ==========================================
-- LIMIT
-- ==========================================

SELECT * FROM Books LIMIT 5;
SELECT * FROM Members LIMIT 3;

-- ==========================================
-- DISTINCT
-- ==========================================

SELECT DISTINCT Genre FROM Books;

-- ==========================================
-- AGGREGATE FUNCTIONS
-- ==========================================

SELECT COUNT(*) AS Total_Authors FROM Authors;
SELECT COUNT(*) AS Total_Books FROM Books;
SELECT COUNT(*) AS Total_Members FROM Members;

SELECT SUM(Price) AS Total_Book_Value
FROM Books;

SELECT AVG(Price) AS Average_Price
FROM Books;

SELECT MAX(Price) AS Most_Expensive_Book
FROM Books;

SELECT MIN(Price) AS Cheapest_Book
FROM Books;

-- ==========================================
-- GROUP BY
-- ==========================================

SELECT Genre,
COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre;

SELECT Author_ID,
COUNT(*) AS Total_Books
FROM Books
GROUP BY Author_ID;

-- ==========================================
-- HAVING
-- ==========================================

SELECT Author_ID,
COUNT(*) AS Total_Books
FROM Books
GROUP BY Author_ID
HAVING COUNT(*) > 1;

SELECT Genre,
COUNT(*) AS Total
FROM Books
GROUP BY Genre
HAVING COUNT(*) > 1;

-- ==========================================
-- INNER JOIN
-- ==========================================

SELECT
Books.Title,
Authors.Author_Name
FROM Books
INNER JOIN Authors
ON Books.Author_ID = Authors.Author_ID;

-- ==========================================
-- LEFT JOIN
-- ==========================================

SELECT
Authors.Author_Name,
Books.Title
FROM Authors
LEFT JOIN Books
ON Authors.Author_ID = Books.Author_ID;

-- ==========================================
-- MULTIPLE INNER JOIN
-- ==========================================

SELECT
Members.Full_Name,
Books.Title,
Staff.Full_Name AS Staff_Name,
Borrow_Records.Borrow_Date,
Borrow_Records.Return_Date
FROM Borrow_Records
INNER JOIN Members
ON Borrow_Records.Member_ID = Members.Member_ID
INNER JOIN Books
ON Borrow_Records.Book_ID = Books.Book_ID
INNER JOIN Staff
ON Borrow_Records.Staff_ID = Staff.Staff_ID;

-- ==========================================
-- QA DATABASE VALIDATION SCENARIOS
-- ==========================================

-- Verify member exists
SELECT *
FROM Members
WHERE Email='ali.khan@email.com';

-- Check duplicate emails
SELECT Email,
COUNT(*) AS Duplicate_Count
FROM Members
GROUP BY Email
HAVING COUNT(*)>1;

-- Verify books without authors
SELECT *
FROM Books
WHERE Author_ID IS NULL;

-- Members who never borrowed a book
SELECT Members.Full_Name
FROM Members
LEFT JOIN Borrow_Records
ON Members.Member_ID = Borrow_Records.Member_ID
WHERE Borrow_Records.Member_ID IS NULL;

-- Borrow history
SELECT
Members.Full_Name,
Books.Title,
Staff.Full_Name AS Staff_Name,
Borrow_Records.Borrow_Date,
Borrow_Records.Return_Date
FROM Borrow_Records
INNER JOIN Members
ON Borrow_Records.Member_ID = Members.Member_ID
INNER JOIN Books
ON Borrow_Records.Book_ID = Books.Book_ID
INNER JOIN Staff
ON Borrow_Records.Staff_ID = Staff.Staff_ID;

-- Books with price greater than 30
SELECT *
FROM Books
WHERE Price > 30;

-- Count borrowed books
SELECT COUNT(*) AS Total_Borrowed
FROM Borrow_Records;

-- Members who borrowed more than one book
SELECT Member_ID,
COUNT(*) AS Total_Borrowed
FROM Borrow_Records
GROUP BY Member_ID
HAVING COUNT(*) > 1;

-- Books by genre
SELECT Genre,
COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre;

-- Books with their authors
SELECT Books.Title,
Authors.Author_Name
FROM Books
INNER JOIN Authors
ON Books.Author_ID = Authors.Author_ID;
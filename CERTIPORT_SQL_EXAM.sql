-- ============================================================================
-- CERTIPORT SQL DATABASE EXAM - COMPREHENSIVE STUDY GUIDE
-- Total Questions: 38 (Intermediate Level)
-- Format: Mix of Multiple Choice, True/False, and Practical SQL
-- ============================================================================

-- ============================================================================
-- SECTION 1: DATA DEFINITION LANGUAGE (DDL) - CREATE, ALTER, DROP
-- Questions: 1-5
-- ============================================================================

/*
QUESTION 1: Multiple Choice
Which SQL statement is used to create a new table?
A) CREATE TABLE tablename (column1 datatype, column2 datatype);
B) NEW TABLE tablename (column1 datatype, column2 datatype);
C) MAKE TABLE tablename (column1 datatype, column2 datatype);
D) BUILD TABLE tablename (column1 datatype, column2 datatype);

CORRECT ANSWER: A
*/

-- Example DDL Statement:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    HireDate DATE DEFAULT GETDATE(),
    Salary DECIMAL(10,2),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

/*
QUESTION 2: Multiple Choice
What is the purpose of the PRIMARY KEY constraint?
A) To ensure that each row is uniquely identified
B) To ensure values are not NULL
C) To automatically increment values
D) Both A and B are correct

CORRECT ANSWER: D
*/

/*
QUESTION 3: True/False
You can use ALTER TABLE to modify an existing column's data type.
TRUE or FALSE?

CORRECT ANSWER: TRUE
Explanation: ALTER TABLE tablename ALTER COLUMN columnname datatype;
*/

-- Example ALTER TABLE statement:
ALTER TABLE Employees
ALTER COLUMN Salary DECIMAL(12,2);

ALTER TABLE Employees
ADD PhoneNumber VARCHAR(15);

ALTER TABLE Employees
DROP COLUMN PhoneNumber;

/*
QUESTION 4: Practical SQL
Write a SQL statement to create a table called "Projects" with the following:
- ProjectID (Primary Key, Auto-increment)
- ProjectName (50 character string, not null, unique)
- StartDate (Date type)
- Budget (Decimal with 2 decimal places)
- ProjectManagerID (Foreign Key referencing Employees table)

CORRECT ANSWER:
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY IDENTITY(1,1),
    ProjectName VARCHAR(50) NOT NULL UNIQUE,
    StartDate DATE,
    Budget DECIMAL(10,2),
    ProjectManagerID INT FOREIGN KEY REFERENCES Employees(EmployeeID)
);
*/

/*
QUESTION 5: Multiple Choice
What happens when you execute a DROP TABLE statement?
A) The table structure is removed, but data remains
B) The table structure and all data are removed
C) Only the data is removed
D) The table is hidden but not deleted

CORRECT ANSWER: B
*/

-- ============================================================================
-- SECTION 2: DATA MANIPULATION LANGUAGE (DML) - INSERT, UPDATE, DELETE
-- Questions: 6-11
-- ============================================================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    HireDate DATE,
    Salary DECIMAL(10,2),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

/*
QUESTION 6: Practical SQL
Write an INSERT statement to add a new employee with the following details:
- FirstName: 'John'
- LastName: 'Smith'
- Email: 'john.smith@company.com'
- HireDate: '2024-01-15'
- Salary: 65000
- DepartmentID: 3

CORRECT ANSWER:
INSERT INTO Employees (FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES ('John', 'Smith', 'john.smith@company.com', '2024-01-15', 65000, 3);
*/

/*
QUESTION 7: Multiple Choice
Which statement correctly inserts multiple rows in one command?
A) INSERT INTO table VALUES (row1), (row2), (row3);
B) INSERT INTO table (row1), (row2), (row3);
C) INSERT INTO table VALUES row1, row2, row3;
D) INSERT INTO table ROWS (row1, row2, row3);

CORRECT ANSWER: A
*/

/*
QUESTION 8: Practical SQL
Write an UPDATE statement to increase the salary of the employee with EmployeeID 5 by 10%.

CORRECT ANSWER:
UPDATE Employees
SET Salary = Salary * 1.10
WHERE EmployeeID = 5;
*/

/*
QUESTION 9: True/False
If you execute DELETE FROM Employees; without a WHERE clause, 
all employees will be deleted from the table.

TRUE or FALSE?

CORRECT ANSWER: TRUE
Explanation: Without a WHERE clause, DELETE removes all records from the table.
*/

/*
QUESTION 10: Multiple Choice
What is the safest way to delete data from a table?
A) DELETE FROM table;
B) DELETE FROM table WHERE condition;
C) DROP TABLE table;
D) TRUNCATE TABLE table;

CORRECT ANSWER: B
Explanation: Using a WHERE clause ensures you only delete intended records.
*/

/*
QUESTION 11: Practical SQL
Write a DELETE statement to remove all employees from DepartmentID 2 
whose salary is less than 50000.

CORRECT ANSWER:
DELETE FROM Employees
WHERE DepartmentID = 2 AND Salary < 50000;
*/

-- ============================================================================
-- SECTION 3: DATA QUERY LANGUAGE (DQL) - SELECT STATEMENTS
-- Questions: 12-16
-- ============================================================================

/*
QUESTION 12: Practical SQL
Write a SELECT statement to retrieve the first name and last name of all employees 
ordered by last name in ascending order.

CORRECT ANSWER:
SELECT FirstName, LastName
FROM Employees
ORDER BY LastName ASC;
*/

/*
QUESTION 13: Multiple Choice
Which SQL keyword is used to remove duplicate rows from the result set?
A) REMOVE DUPLICATES
B) DISTINCT
C) UNIQUE
D) NO DUPLICATES

CORRECT ANSWER: B
*/

/*
QUESTION 14: Practical SQL
Write a SELECT statement to find all employees whose last name starts with 'S' 
and salary is greater than 60000.

CORRECT ANSWER:
SELECT *
FROM Employees
WHERE LastName LIKE 'S%' AND Salary > 60000;
*/

/*
QUESTION 15: Multiple Choice
What is the result of the following query?
SELECT * FROM Employees WHERE Salary BETWEEN 50000 AND 100000;

A) Retrieves employees with salary exactly 50000 or 100000
B) Retrieves employees with salary from 50000 to 100000 (inclusive)
C) Retrieves employees with salary less than 100000
D) Retrieves employees with salary greater than 50000

CORRECT ANSWER: B
*/

/*
QUESTION 16: Practical SQL
Write a SELECT statement to retrieve employee ID, first name, and last name 
for employees in departments 1, 3, or 5.

CORRECT ANSWER:
SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE DepartmentID IN (1, 3, 5);
*/

-- ============================================================================
-- SECTION 4: AGGREGATE FUNCTIONS AND GROUPING
-- Questions: 17-21
-- ============================================================================

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    SalesAmount DECIMAL(10,2),
    SalesDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

/*
QUESTION 17: Multiple Choice
Which aggregate function returns the total sum of values in a column?
A) TOTAL()
B) SUM()
C) ADD()
D) COUNT_ALL()

CORRECT ANSWER: B
*/

/*
QUESTION 18: Practical SQL
Write a query to find the average salary of all employees.

CORRECT ANSWER:
SELECT AVG(Salary) AS AverageSalary
FROM Employees;
*/

/*
QUESTION 19: Practical SQL
Write a query to find the total sales amount for each employee, 
showing EmployeeID and total sales, ordered by total sales descending.

CORRECT ANSWER:
SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY EmployeeID
ORDER BY TotalSales DESC;
*/

/*
QUESTION 20: Multiple Choice
What does the HAVING clause do?
A) Filters rows before grouping
B) Filters groups after aggregation
C) Sorts the results
D) Limits the number of results

CORRECT ANSWER: B
*/

/*
QUESTION 21: Practical SQL
Write a query to find departments where the average employee salary is greater than 70000.

CORRECT ANSWER:
SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 70000;
*/

-- ============================================================================
-- SECTION 5: JOINS AND RELATIONSHIPS
-- Questions: 22-26
-- ============================================================================

/*
QUESTION 22: Multiple Choice
What does an INNER JOIN return?
A) All rows from both tables
B) Only rows that match in both tables
C) All rows from the left table plus matching rows from the right table
D) All rows from the right table plus matching rows from the left table

CORRECT ANSWER: B
*/

/*
QUESTION 23: Practical SQL
Write a query to display employee first name, last name, and department name 
using INNER JOIN.

CORRECT ANSWER:
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
*/

/*
QUESTION 24: True/False
A LEFT JOIN returns all rows from the left table and matching rows from the right table.

TRUE or FALSE?

CORRECT ANSWER: TRUE
*/

/*
QUESTION 25: Multiple Choice
What is a CROSS JOIN?
A) A join that combines each row from the first table with each row from the second table
B) A join that requires matching conditions
C) A join that removes duplicates
D) A join that only works with two columns

CORRECT ANSWER: A
*/

/*
QUESTION 26: Practical SQL
Write a query to show employee name, department name, and sales amount, 
including employees with no sales records.

CORRECT ANSWER:
SELECT e.FirstName, e.LastName, d.DepartmentName, s.SalesAmount
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Sales s ON e.EmployeeID = s.EmployeeID;
*/

-- ============================================================================
-- SECTION 6: SUBQUERIES AND COMPLEX QUERIES
-- Questions: 27-30
-- ============================================================================

/*
QUESTION 27: Practical SQL
Write a query to find employees whose salary is greater than the average salary.

CORRECT ANSWER:
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
*/

/*
QUESTION 28: Multiple Choice
What is a subquery (inner query)?
A) A query nested inside another query
B) A query that uses GROUP BY
C) A query that uses ORDER BY
D) A query that uses JOIN

CORRECT ANSWER: A
*/

/*
QUESTION 29: Practical SQL
Write a query to find the employee with the highest salary using a subquery.

CORRECT ANSWER:
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
*/

/*
QUESTION 30: Multiple Choice
Which subquery type returns a single value?
A) Scalar subquery
B) Row subquery
C) Table subquery
D) List subquery

CORRECT ANSWER: A
*/

-- ============================================================================
-- SECTION 7: INDEXES AND PERFORMANCE
-- Questions: 31-33
-- ============================================================================

/*
QUESTION 31: Multiple Choice
What is the primary purpose of creating an index?
A) To increase storage space
B) To improve query performance
C) To enforce constraints
D) To create relationships

CORRECT ANSWER: B
*/

/*
QUESTION 32: Practical SQL
Write a statement to create a unique index on the Email column of the Employees table.

CORRECT ANSWER:
CREATE UNIQUE INDEX IX_Employees_Email
ON Employees(Email);
*/

/*
QUESTION 33: True/False
Indexes improve query performance but can slow down INSERT and UPDATE operations 
because the index must also be updated.

TRUE or FALSE?

CORRECT ANSWER: TRUE
*/

-- ============================================================================
-- SECTION 8: STORED PROCEDURES AND FUNCTIONS
-- Questions: 34-36
-- ============================================================================

/*
QUESTION 34: Multiple Choice
What is a stored procedure?
A) A precompiled SQL statement stored in the database
B) A temporary table
C) A backup of the database
D) A type of index

CORRECT ANSWER: A
*/

/*
QUESTION 35: Practical SQL
Write a simple stored procedure to retrieve all employees from a specific department.

CORRECT ANSWER:
CREATE PROCEDURE spGetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT FirstName, LastName, Email, Salary
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

-- To execute:
-- EXEC spGetEmployeesByDepartment 3;
*/

/*
QUESTION 36: Multiple Choice
What is the difference between a stored procedure and a function?
A) Functions can return only scalar values; procedures can return multiple results
B) Procedures can return only scalar values; functions can return multiple results
C) There is no difference
D) Functions are faster than procedures

CORRECT ANSWER: A
*/

-- ============================================================================
-- SECTION 9: DATABASE SECURITY AND PERMISSIONS
-- Questions: 37-38
-- ============================================================================

/*
QUESTION 37: Multiple Choice
Which SQL statement is used to grant permissions to a user?
A) PERMIT
B) ALLOW
C) GRANT
D) AUTHORIZE

CORRECT ANSWER: C
*/

/*
QUESTION 38: Practical SQL
Write a statement to grant SELECT and INSERT permissions on the Employees table 
to a user named 'UserName'.

CORRECT ANSWER:
GRANT SELECT, INSERT ON Employees TO UserName;

-- To revoke permissions:
-- REVOKE SELECT, INSERT ON Employees FROM UserName;
*/

-- ============================================================================
-- ANSWER KEY SUMMARY
-- ============================================================================
/*
QUESTION 1: A
QUESTION 2: D
QUESTION 3: TRUE
QUESTION 4: See practical answer above
QUESTION 5: B
QUESTION 6: See practical answer above
QUESTION 7: A
QUESTION 8: See practical answer above
QUESTION 9: TRUE
QUESTION 10: B
QUESTION 11: See practical answer above
QUESTION 12: See practical answer above
QUESTION 13: B
QUESTION 14: See practical answer above
QUESTION 15: B
QUESTION 16: See practical answer above
QUESTION 17: B
QUESTION 18: See practical answer above
QUESTION 19: See practical answer above
QUESTION 20: B
QUESTION 21: See practical answer above
QUESTION 22: B
QUESTION 23: See practical answer above
QUESTION 24: TRUE
QUESTION 25: A
QUESTION 26: See practical answer above
QUESTION 27: See practical answer above
QUESTION 28: A
QUESTION 29: See practical answer above
QUESTION 30: A
QUESTION 31: B
QUESTION 32: See practical answer above
QUESTION 33: TRUE
QUESTION 34: A
QUESTION 35: See practical answer above
QUESTION 36: A
QUESTION 37: C
QUESTION 38: See practical answer above
*/

-- ============================================================================
-- STUDY TIPS FOR CERTIPORT SQL EXAM
-- ============================================================================
/*
1. DDL (Data Definition Language):
   - Focus on CREATE TABLE with constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE)
   - Understand ALTER TABLE for modifying structure
   - Know what DROP TABLE does (removes structure and data)

2. DML (Data Manipulation Language):
   - Master INSERT for adding data
   - Practice UPDATE with WHERE clauses to modify specific records
   - Understand DELETE behavior with and without WHERE clauses

3. DQL (Data Query Language):
   - SELECT is fundamental - practice filtering with WHERE
   - Use ORDER BY for sorting (ASC/DESC)
   - Use DISTINCT to remove duplicates
   - Master wildcards (% and _) with LIKE operator

4. Aggregate Functions:
   - COUNT, SUM, AVG, MIN, MAX are essential
   - Always use GROUP BY when using aggregates on subsets
   - Use HAVING to filter grouped results

5. Joins:
   - INNER JOIN: matching records only
   - LEFT JOIN: all from left table + matches from right
   - RIGHT JOIN: all from right table + matches from left
   - FULL OUTER JOIN: all records from both tables

6. Subqueries:
   - Scalar subqueries return one value
   - Can use in WHERE, SELECT, FROM clauses
   - Common with IN, EXISTS, =, <, >, etc.

7. Indexes:
   - Improve SELECT performance
   - Slow down INSERT/UPDATE/DELETE
   - Use UNIQUE indexes for columns that should have unique values

8. Stored Procedures:
   - Reusable SQL code blocks
   - Can have parameters (@parameterName)
   - Execute with EXEC or EXECUTE

9. Security:
   - GRANT gives permissions
   - REVOKE removes permissions
   - Specific permissions: SELECT, INSERT, UPDATE, DELETE, EXECUTE
   - Can be applied to tables or stored procedures
*/

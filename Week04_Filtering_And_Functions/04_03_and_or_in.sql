/* Week 4 - AND, OR, IN, BETWEEN */

USE UniversityDB;
GO

SELECT FirstName, LastName, State
FROM Students
WHERE State IN ('TX', 'CA', 'NY');
GO

SELECT FirstName, LastName, Salary
FROM Instructors
WHERE Salary BETWEEN 75000 AND 90000;
GO

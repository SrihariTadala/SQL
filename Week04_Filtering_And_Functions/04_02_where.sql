/* Week 4 - WHERE clause */

USE UniversityDB;
GO

SELECT StudentID, FirstName, LastName, City
FROM Students
WHERE State = 'TX';
GO

SELECT FirstName, LastName, Salary
FROM Instructors
WHERE Salary > 85000;
GO

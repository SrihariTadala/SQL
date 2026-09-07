/* Week 1 - Using TOP to see a few rows */

USE UniversityDB;
GO

SELECT TOP 5 FirstName, LastName, Salary
FROM Instructors
ORDER BY Salary DESC;
GO

SELECT TOP 10 StudentID, FirstName, LastName, City
FROM Students
ORDER BY StudentID;
GO

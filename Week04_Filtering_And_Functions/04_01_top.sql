/* Week 4 - Using TOP with ORDER BY */

USE UniversityDB;
GO

SELECT TOP 5 StudentID, FirstName, LastName, City
FROM Students
ORDER BY StudentID;
GO

SELECT TOP 3 FirstName, LastName, Salary
FROM Instructors
ORDER BY Salary DESC;
GO

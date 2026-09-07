/* Week 1 - Exploring the tables in UniversityDB */

USE UniversityDB;
GO

SELECT * FROM Departments;
GO

SELECT TOP 5 StudentID, FirstName, LastName, City, State
FROM Students
ORDER BY StudentID;
GO

SELECT * FROM Courses;
GO

/* Week 2 - Our real tables are properly normalized */

USE UniversityDB;
GO

SELECT DepartmentID, DepartmentName, Building
FROM Departments;
GO

SELECT StudentID, FirstName, LastName, DepartmentID
FROM Students
WHERE StudentID <= 5;
GO

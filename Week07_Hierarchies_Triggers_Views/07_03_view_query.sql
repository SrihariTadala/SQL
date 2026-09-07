/* Week 7 - Querying the view with a filter */

USE UniversityDB;
GO

SELECT StudentID, FirstName, LastName, DepartmentName
FROM dbo.vw_StudentBasic
WHERE DepartmentName = 'Computer Science'
ORDER BY LastName;
GO

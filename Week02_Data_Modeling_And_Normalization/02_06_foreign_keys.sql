/* Week 2 - Showing how foreign keys connect tables */

USE UniversityDB;
GO

SELECT i.FirstName, i.LastName, d.DepartmentName
FROM Instructors i
INNER JOIN Departments d ON i.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName;
GO

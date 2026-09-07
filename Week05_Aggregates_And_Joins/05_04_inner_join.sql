/* Week 5 - INNER JOIN */

USE UniversityDB;
GO

SELECT s.FirstName, s.LastName, d.DepartmentName
FROM Students s
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID
WHERE s.StudentID <= 10
ORDER BY s.StudentID;
GO

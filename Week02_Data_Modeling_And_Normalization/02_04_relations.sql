/* Week 2 - One to many relationship */

USE UniversityDB;
GO

SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName
ORDER BY d.DepartmentName;
GO

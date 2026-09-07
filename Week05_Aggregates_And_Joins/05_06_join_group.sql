/* Week 5 - JOIN with GROUP BY */

USE UniversityDB;
GO

SELECT d.DepartmentName, COUNT(s.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalStudents DESC;
GO

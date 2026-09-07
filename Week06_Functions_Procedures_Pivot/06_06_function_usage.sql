/* Week 6 - Using the function inside a query */

USE UniversityDB;
GO

SELECT dbo.fn_FullName(i.FirstName, i.LastName) AS InstructorName, d.DepartmentName
FROM Instructors i
INNER JOIN Departments d ON i.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName;
GO

/* Week 1 - Checking primary keys and foreign keys */

USE UniversityDB;
GO

SELECT DepartmentID, DepartmentName, Building
FROM Departments
ORDER BY DepartmentID;
GO

SELECT CourseID, CourseCode, CourseName, DepartmentID
FROM Courses
ORDER BY CourseID;
GO

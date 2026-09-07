/* Week 4 - LIKE for pattern matching */

USE UniversityDB;
GO

SELECT FirstName, LastName
FROM Students
WHERE LastName LIKE 'M%';
GO

SELECT CourseCode, CourseName
FROM Courses
WHERE CourseCode LIKE 'CS%';
GO

/* Week 5 - LEFT JOIN to find unmatched rows */

USE UniversityDB;
GO

SELECT c.CourseCode, c.CourseName, i.FirstName, i.LastName
FROM Courses c
LEFT JOIN Instructors i ON c.InstructorID = i.InstructorID
ORDER BY c.CourseID;
GO

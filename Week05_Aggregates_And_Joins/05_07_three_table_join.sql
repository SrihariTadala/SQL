/* Week 5 - Joining three tables */

USE UniversityDB;
GO

SELECT s.FirstName, s.LastName, c.CourseCode, c.CourseName, e.Grade
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentID = 1
ORDER BY c.CourseCode;
GO

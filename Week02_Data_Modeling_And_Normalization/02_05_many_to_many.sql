/* Week 2 - Many to many: Students to Courses via Enrollments */

USE UniversityDB;
GO

SELECT s.FirstName, s.LastName, c.CourseCode, e.Semester, e.AcademicYear
FROM Enrollments e
INNER JOIN Students s ON e.StudentID = s.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentID = 1
ORDER BY e.AcademicYear, e.Semester;
GO

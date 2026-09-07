/* Week 3 - Looking at the Enrollments table */

USE UniversityDB;
GO

SELECT TOP 10 EnrollmentID, StudentID, CourseID, Semester, AcademicYear, Grade
FROM Enrollments
ORDER BY EnrollmentID;
GO

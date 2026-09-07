/* Week 1 - Counting rows in each table */

USE UniversityDB;
GO

SELECT COUNT(*) AS TotalStudents FROM Students;
GO

SELECT COUNT(*) AS TotalCourses FROM Courses;
GO

SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;
GO

SELECT COUNT(*) AS TotalInstructors FROM Instructors;
GO

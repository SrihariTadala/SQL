/* Week 1 - COUNT vs COUNT DISTINCT */

USE UniversityDB;
GO

SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT DepartmentID) AS DifferentDepartments
FROM Students;
GO

SELECT
    COUNT(*) AS TotalEnrollments,
    COUNT(DISTINCT StudentID) AS DifferentStudents,
    COUNT(DISTINCT CourseID) AS DifferentCourses
FROM Enrollments;
GO

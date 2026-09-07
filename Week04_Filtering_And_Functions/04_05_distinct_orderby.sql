/* Week 4 - DISTINCT and ORDER BY */

USE UniversityDB;
GO

SELECT DISTINCT State
FROM Students
WHERE State IS NOT NULL
ORDER BY State;
GO

SELECT DISTINCT Semester, AcademicYear
FROM Enrollments
ORDER BY AcademicYear, Semester;
GO
